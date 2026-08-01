#!/usr/bin/env python3
"""Generate PATCHES.md — the mechanical registry of everything that differs
from the original Tetris Plus ROM — and optionally verify coverage.

Sources of truth, merged:
  - byte diff vs the original dump (diff_rom.py logic),
  - bin/game.sym (GBC_*/Bank10_* symbol placement),
  - `; was:` comments in src/**/*.asm (hook call sites),
  - tools/patch_notes.json (curated notes for byte tweaks that are not
    call sites or new-code islands).

Each divergent range is classified as one of:
  header      cartridge header bytes ($0100-$014f: CGB flag, checksums, ...)
  island      new code placed in former $00 padding
  call-site   an instruction retargeted into new code (call/jp operand)
  nop-fill    $00 padding of an iso-size patch
  noted       byte tweak explained in patch_notes.json
  UNKNOWN     none of the above -> --check fails (undocumented change)

Usage:
  python list_patches.py [path-to-original-rom]           write PATCHES.md
  python list_patches.py [path-to-original-rom] --check   verify, exit 1 on UNKNOWN
"""

import json
import re
import sys
from pathlib import Path

TOOLS = Path(__file__).resolve().parent
ROOT = TOOLS.parent
sys.path.insert(0, str(TOOLS))
from diff_rom import (BANK_SIZE, BUILT_PATH, DEFAULT_ORIG, ORIG_SHA1,
                      diff_ranges, rom_addr, hexs)
import hashlib

SYM_PATH = ROOT / "bin" / "game.sym"
NOTES_PATH = TOOLS / "patch_notes.json"
OUT_PATH = ROOT / "PATCHES.md"

JP_CALL_OPCODES = {0xC3, 0xCD, 0xC2, 0xCA, 0xD2, 0xDA}  # jp/call, incl. cond.


def load_symbols():
    """[(bank, addr, name)] from bin/game.sym, sorted."""
    syms = []
    for line in SYM_PATH.read_text(encoding="utf-8", errors="replace").splitlines():
        m = re.match(r"([0-9a-fA-F]{2}):([0-9a-fA-F]{4}) (\S+)", line.strip())
        if m:
            syms.append((int(m.group(1), 16), int(m.group(2), 16), m.group(3)))
    syms.sort()
    return syms


def nearest_symbol(syms, bank, addr):
    best = None
    for b, a, name in syms:
        if b == bank and a <= addr and not name.startswith("_"):
            if best is None or a > best[0]:
                best = (a, name)
    return f"{best[1]}+{addr - best[0]:#x}" if best else "?"


def collect_was_sites():
    """(file, line-number, code, was-comment) for every `; was:` in src/."""
    sites = []
    for path in sorted(ROOT.joinpath("src").rglob("*.asm")):
        for i, line in enumerate(path.read_text(encoding="utf-8",
                                                errors="replace").splitlines(), 1):
            if "; was:" in line:
                code, was = line.split("; was:", 1)
                sites.append((path.relative_to(ROOT).as_posix(), i,
                              code.strip(), was.strip()))
    return sites


def main():
    args = [a for a in sys.argv[1:] if not a.startswith("--")]
    check_only = "--check" in sys.argv[1:]
    orig_path = Path(args[0]) if args else DEFAULT_ORIG
    if not orig_path.is_file():
        sys.exit(f"error: original ROM not found: {orig_path}")
    orig = orig_path.read_bytes()
    if hashlib.sha1(orig).hexdigest() != ORIG_SHA1:
        sys.exit("error: original ROM does not match the pinned SHA-1")
    new = BUILT_PATH.read_bytes()
    syms = load_symbols()
    notes = json.loads(NOTES_PATH.read_text(encoding="utf-8"))

    ranges = []  # (bank, addr, size, orig_bytes, new_bytes)
    for start, end in diff_ranges(orig, new[:len(orig)]):
        bank, addr = rom_addr(start)
        ranges.append((bank, addr, end - start, orig[start:end], new[start:end],
                       start))

    # in-bank address intervals of every changed region + all of bank $10:
    # a call/jp operand landing in one of these targets new code.
    new_code = [(a, a + s) for _, a, s, _, _, _ in ranges]
    new_code.append((0x4000, 0x8000))  # bank $10 engine (banked targets)

    def targets_new_code(target):
        return any(lo <= target < hi for lo, hi in new_code)

    def classify(bank, addr, size, ob, nb, off):
        if bank == 0 and 0x0100 <= addr <= 0x014F:
            return "header"
        if all(b == 0 for b in ob):
            return "island"
        if all(b == 0 for b in nb):
            return "nop-fill"
        # look for a jp/call whose operand includes at least one changed byte
        for p in range(max(0, off - 2), off + size):
            if p + 2 < len(new) and new[p] in JP_CALL_OPCODES:
                if p + 1 >= off or p + 2 >= off:  # operand overlaps the range
                    if targets_new_code(new[p + 1] | (new[p + 2] << 8)):
                        return "call-site"
        if f"{bank:02x}:{addr:04x}" in notes:
            return "noted"
        return "UNKNOWN"

    classified = [(r, classify(*r)) for r in ranges]
    unknown = [r for r, c in classified if c == "UNKNOWN"]

    if check_only:
        for bank, addr, size, ob, nb, _ in unknown:
            print(f"UNDOCUMENTED: bank {bank:02x} @ ${addr:04x} ({size} bytes) "
                  f"orig={hexs(ob[:8])} new={hexs(nb[:8])}", file=sys.stderr)
        if unknown:
            sys.exit(1)
        print(f"list_patches --check: OK ({len(classified)} ranges, all classified)")
        return

    was_sites = collect_was_sites()
    lines = [
        "# PATCHES — registry of every difference vs the original ROM",
        "",
        "Auto-generated by `python tools/list_patches.py` — do not edit.",
        f"Original: `{orig_path.name}` (SHA-1 `{ORIG_SHA1}`).",
        "",
        f"{len(classified)} divergent byte range(s) in the original's 16 banks, "
        f"plus the bank $10 colorization engine.",
        "",
        "## Hook call sites (`; was:` comments in source)",
        "",
        "| File | Line | Patched code | Original |",
        "|---|---|---|---|",
    ]
    for f, ln, code, was in was_sites:
        lines.append(f"| {f} | {ln} | `{code}` | `{was}` |")

    section_titles = [
        ("header", "## Cartridge header changes"),
        ("island", "## New code in former padding (islands)"),
        ("call-site", "## Retargeted instructions (diff view of the hook sites)"),
        ("noted", "## Byte tweaks (behavior changes)"),
        ("nop-fill", "## Nop fill (iso-size patch padding)"),
        ("UNKNOWN", "## UNDOCUMENTED (fix or annotate in tools/patch_notes.json!)"),
    ]
    for cls, title in section_titles:
        rows = [r for r, c in classified if c == cls]
        if not rows:
            continue
        lines += ["", title, "",
                  "| Bank | Addr | Size | Original | New | Context |", "|---|---|---|---|---|---|"]
        for bank, addr, size, ob, nb, _ in rows:
            note = notes.get(f"{bank:02x}:{addr:04x}", "")
            ctx = note or nearest_symbol(syms, bank, addr)
            o = hexs(ob[:8]) + (" ..." if size > 8 else "")
            n = hexs(nb[:8]) + (" ..." if size > 8 else "")
            lines.append(f"| {bank:02x} | ${addr:04x} | {size} | `{o}` | `{n}` | {ctx} |")

    lines += ["", "## Bank $10 — colorization engine (entirely new)", ""]
    b10 = [(a, name) for b, a, name in syms if b == 0x10 and "." not in name]
    for a, name in b10:
        lines.append(f"- `${a:04x}` {name}")
    lines.append("")

    OUT_PATH.write_text("\n".join(lines), encoding="utf-8", newline="\n")
    n_unknown = len(unknown)
    print(f"wrote {OUT_PATH.name}: {len(classified)} ranges, {len(was_sites)} "
          f"`; was:` sites, {n_unknown} undocumented")
    if n_unknown:
        sys.exit(1)


if __name__ == "__main__":
    main()
