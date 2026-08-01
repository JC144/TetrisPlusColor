#!/usr/bin/env python3
"""Collapse runs of bare `nop` lines into `ds N, 0` directives.

`ds N, 0` emits exactly N zero bytes, i.e. N nop opcodes, so the ROM is
byte-identical by construction (verify by hashing bin/game.gb before/after).

Rules:
- Only lines matching exactly `    nop` (optional trailing whitespace, NO
  comment) are eligible. A `nop` with a comment is load-bearing and kept.
- A run is broken by any other line (label, comment, blank, directive).
- Runs shorter than MIN_RUN stay as-is (deliberate iso-size padding in code).
"""

import re
import sys
from pathlib import Path

MIN_RUN = 8
NOP_RE = re.compile(r"^(\s*)nop\s*$")

SRC = Path(__file__).resolve().parent.parent / "src"


def collapse_file(path: Path) -> tuple[int, int]:
    """Returns (runs_collapsed, lines_saved)."""
    with open(path, "r", encoding="utf-8", newline="") as f:
        lines = f.readlines()

    out = []
    runs = 0
    saved = 0
    i = 0
    n = len(lines)
    while i < n:
        m = NOP_RE.match(lines[i].rstrip("\r\n"))
        if not m:
            out.append(lines[i])
            i += 1
            continue
        # count the run of bare nop lines
        j = i
        while j < n and NOP_RE.match(lines[j].rstrip("\r\n")):
            j += 1
        count = j - i
        if count >= MIN_RUN:
            indent = m.group(1)
            eol = "\r\n" if lines[i].endswith("\r\n") else "\n"
            out.append(f"{indent}ds {count}, 0 ; {count} x nop ($00){eol}")
            runs += 1
            saved += count - 1
        else:
            out.extend(lines[i:j])
        i = j

    if runs:
        with open(path, "w", encoding="utf-8", newline="") as f:
            f.writelines(out)
    return runs, saved


def main() -> None:
    total_runs = 0
    total_saved = 0
    for path in sorted(SRC.rglob("*.asm")):
        if path.parent.name == "include":
            continue
        runs, saved = collapse_file(path)
        if runs:
            print(f"{path.relative_to(SRC.parent.parent)}: "
                  f"{runs} run(s) collapsed, {saved} lines saved")
        total_runs += runs
        total_saved += saved
    print(f"TOTAL: {total_runs} runs, {total_saved} lines saved")


if __name__ == "__main__":
    sys.exit(main())
