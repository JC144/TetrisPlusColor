"""Push edited CHR sheets (tools/gfx/chr/chr_NN.png) into tools/tile_edits.json.

For every sheet, each 8x8 tile is compared with the ROM's original tile
(chr_codec decode). Tiles that differ become entries of
tile_edits.json["patches"][entry][tile_index] (the same data the studio's
pixel editor writes); tiles equal to the ROM lose any previous patch. The
build then applies them through ChrPatchTable (gen_tile_patches.py), so this
needs no recompression.

Sprite graphics (tools/gfx/sprites/*.png) need no import step: the build's
gen_sprite_gfx.py reads them directly.

Usage:  python tools/import_gfx.py [--dry-run]
        then: python tools/build.py
Note: tools/gfx/chr sheets are a *view* of ROM + tile_edits.json — after
editing in the studio, re-run `export_gfx.py --force` before editing PNGs,
or the import will revert the studio's changes on those sheets.
"""

import json
import os
import sys

from PIL import Image

from chr_codec import CHR_TABLE, load_rom, lz_decode, split_tiles, decode_2bpp
from export_gfx import GFX, image_levels, levels_tile

TOOLS = os.path.dirname(os.path.abspath(__file__))
EDITS_PATH = os.path.join(TOOLS, "tile_edits.json")
SHEET_WIDTH = 16


def main():
    dry = "--dry-run" in sys.argv
    rom = load_rom()
    edits = {"patches": {}, "remaps": {}}
    if os.path.isfile(EDITS_PATH):
        with open(EDITS_PATH) as f:
            edits = json.load(f)
    edits.setdefault("patches", {})

    total_changed = 0
    for e, (bank, src, dest) in CHR_TABLE.items():
        path = os.path.join(GFX, "chr", f"chr_{e:02d}.png")
        if not os.path.isfile(path):
            continue
        tiles = split_tiles(lz_decode(rom, bank, src))
        levels = image_levels(Image.open(path))
        rows = (len(tiles) + SHEET_WIDTH - 1) // SHEET_WIDTH
        assert len(levels) >= rows * 8 and len(levels[0]) >= SHEET_WIDTH * 8, \
            f"{path}: sheet too small (expected {SHEET_WIDTH * 8}x{rows * 8})"
        before = edits["patches"].get(str(e), {})
        after = {}
        for i, t in enumerate(tiles):
            lv = levels_tile(levels, (i % SHEET_WIDTH) * 8, (i // SHEET_WIDTH) * 8)
            if lv != decode_2bpp(t):
                after[str(i)] = lv
        if after != before:
            added = sorted(set(after) - set(before), key=int)
            removed = sorted(set(before) - set(after), key=int)
            changed = sorted(k for k in set(after) & set(before)
                             if after[k] != before[k])
            print(f"chr {e:2d}: {len(after)} patched tiles "
                  f"(+{len(added)} -{len(removed)} ~{len(changed)})")
            total_changed += 1
        if after:
            edits["patches"][str(e)] = after
        else:
            edits["patches"].pop(str(e), None)

    if not total_changed:
        print("no change")
        return
    if dry:
        print("dry run: tile_edits.json not written")
        return
    with open(EDITS_PATH, "w") as f:
        json.dump(edits, f, indent=2)
    print(f"wrote {EDITS_PATH} ({total_changed} sheet(s) changed); "
          f"now run: python tools/build.py")


if __name__ == "__main__":
    main()
