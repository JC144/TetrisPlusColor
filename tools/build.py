#!/usr/bin/env python3
"""Unified build for Tetris Plus GBC.

Pipeline:
  1. gen_color_data.py    screen_colors.json -> src/extensions/screen_colors_data.inc
  2. gen_tile_patches.py  tile_edits.json    -> src/extensions/tile_patches.inc
     gen_sprite_gfx.py    tools/gfx/sprites  -> src/graphics/bank11_sprite_gfx.asm
  3. rgbasm -> rgblink -> rgbfix
  4. check_rom.py         per-bank hash verification (frozen banks must not drift)
  5. list_patches.py --check   (only if the original ROM dump is present in bin/)

RGBDS is not part of the repository: unpack the win64 release (rgbasm.exe,
rgblink.exe, rgbfix.exe) into tools/rgbds-win64/ first.

Options:
  --skip-gen   skip step 1-2 (use the committed .inc files as-is)
"""

import subprocess
import sys
from pathlib import Path

TOOLS = Path(__file__).resolve().parent
ROOT = TOOLS.parent
RGBDS = TOOLS / "rgbds-win64"
BIN = ROOT / "bin"
SRC = ROOT / "src"


def run(argv, step):
    print(f"[{step}] {' '.join(str(a) for a in argv)}")
    result = subprocess.run([str(a) for a in argv])
    if result.returncode != 0:
        sys.exit(f"build failed at step: {step}")


def main():
    args = sys.argv[1:]
    BIN.mkdir(exist_ok=True)

    if not (RGBDS / "rgbasm.exe").is_file():
        sys.exit(f"RGBDS not found: unpack rgbasm/rgblink/rgbfix.exe into {RGBDS}")

    if "--skip-gen" not in args:
        run([sys.executable, TOOLS / "gen_color_data.py"], "gen-colors")
        run([sys.executable, TOOLS / "gen_tile_patches.py"], "gen-tiles")
        run([sys.executable, TOOLS / "gen_sprite_gfx.py"], "gen-sprites")

    for stale in ("game.o", "game.gb", "game.sym", "game.map"):
        (BIN / stale).unlink(missing_ok=True)

    run([RGBDS / "rgbasm.exe", "-I", f"{SRC}/", "-o", BIN / "game.o",
         SRC / "game.asm"], "assemble")
    run([RGBDS / "rgblink.exe", "-n", BIN / "game.sym", "-m", BIN / "game.map",
         "-o", BIN / "game.gb", BIN / "game.o"], "link")
    run([RGBDS / "rgbfix.exe", "-v", "-p", "0", BIN / "game.gb"], "fix")
    run([sys.executable, TOOLS / "check_rom.py"], "check-rom")

    orig = BIN / "Tetris Plus (USA, Europe) (SGB Enhanced).gb"
    if orig.is_file():
        run([sys.executable, TOOLS / "list_patches.py", orig, "--check"],
            "check-patches")

    print(f"Build successful! ROM: {BIN / 'game.gb'}")


if __name__ == "__main__":
    main()
