#!/usr/bin/env python3
"""Byte-level diff between the original Tetris Plus ROM and bin/game.gb.

The mechanically complete answer to "what differs from the original ROM":
lists every contiguous divergent byte range, per bank, with original and new
bytes. Banks past the original's size (bank $10 colorization engine + pad)
are summarized separately.

Usage:
  python diff_rom.py [path-to-original-rom] [--json]

Default original path: bin/Tetris Plus (USA, Europe) (SGB Enhanced).gb
(kept out of git). Its SHA-1 is pinned below so a wrong file is rejected.
"""

import hashlib
import json
import sys
from pathlib import Path

TOOLS = Path(__file__).resolve().parent
ROOT = TOOLS.parent
BUILT_PATH = ROOT / "bin" / "game.gb"
DEFAULT_ORIG = ROOT / "bin" / "Tetris Plus (USA, Europe) (SGB Enhanced).gb"

# SHA-1 of the user's reference dump (256 KiB, 16 banks).
ORIG_SHA1 = "dfab75ab6bdc0765ba9a5d33a93ffdb114a49cbf"

BANK_SIZE = 0x4000
MAX_SHOWN = 16  # bytes of each side shown per range in text mode


def diff_ranges(orig, new):
    """Yield (start, end_exclusive) offsets where orig != new (same length)."""
    start = None
    for i, (a, b) in enumerate(zip(orig, new)):
        if a != b:
            if start is None:
                start = i
        elif start is not None:
            yield start, i
            start = None
    if start is not None:
        yield start, len(orig)


def rom_addr(offset):
    """(bank, in-bank address) for a ROM file offset."""
    bank = offset // BANK_SIZE
    addr = offset % BANK_SIZE + (0x4000 if bank else 0)
    return bank, addr


def hexs(data):
    return " ".join(f"{b:02x}" for b in data)


def main():
    args = [a for a in sys.argv[1:] if not a.startswith("--")]
    as_json = "--json" in sys.argv[1:]
    orig_path = Path(args[0]) if args else DEFAULT_ORIG

    if not orig_path.is_file():
        sys.exit(f"error: original ROM not found: {orig_path}")
    orig = orig_path.read_bytes()
    if hashlib.sha1(orig).hexdigest() != ORIG_SHA1:
        sys.exit(f"error: {orig_path} does not match the pinned original "
                 f"(SHA-1 {ORIG_SHA1}) — refusing to diff against a wrong dump")
    new = BUILT_PATH.read_bytes()

    ranges = []
    for start, end in diff_ranges(orig, new[:len(orig)]):
        bank, addr = rom_addr(start)
        ranges.append({
            "bank": f"{bank:02x}",
            "addr": f"{addr:04x}",
            "size": end - start,
            "orig": hexs(orig[start:end]),
            "new": hexs(new[start:end]),
        })

    extra_banks = []
    for bank in range(len(orig) // BANK_SIZE, len(new) // BANK_SIZE):
        chunk = new[bank * BANK_SIZE:(bank + 1) * BANK_SIZE]
        used = len(chunk) - (len(chunk) - len(chunk.rstrip(b"\x00")))
        extra_banks.append({"bank": f"{bank:02x}", "used_bytes": used})

    if as_json:
        print(json.dumps({"ranges": ranges, "extra_banks": extra_banks}, indent=2))
        return

    print(f"original: {orig_path.name} ({len(orig) // BANK_SIZE} banks)")
    print(f"built:    {BUILT_PATH.name} ({len(new) // BANK_SIZE} banks)")
    print(f"\n{len(ranges)} divergent range(s) in the original's address space:\n")
    for r in ranges:
        shown_o = r["orig"].split()[:MAX_SHOWN]
        shown_n = r["new"].split()[:MAX_SHOWN]
        ell = " ..." if r["size"] > MAX_SHOWN else ""
        print(f"bank {r['bank']} @ ${r['addr']} ({r['size']} byte(s))")
        print(f"  orig: {' '.join(shown_o)}{ell}")
        print(f"  new:  {' '.join(shown_n)}{ell}")
    print("\nbanks beyond the original ROM:")
    for b in extra_banks:
        state = f"{b['used_bytes']} non-pad byte(s)" if b["used_bytes"] else "padding only"
        print(f"  bank {b['bank']}: {state}")


if __name__ == "__main__":
    main()
