"""Extract every graphic asset of Tetris Plus into editable PNGs (tools/gfx/).

Reads bin/game.gb (frozen graphics banks are byte-identical to the original)
and writes:

  tools/gfx/chr/chr_NN.png        the 23 LZSS CHR entries (BG + sprite tile
                                  sheets loaded by DispatchBankRoutine),
                                  16 tiles wide, 4-gray palette, with the
                                  current tile_edits.json patches applied
  tools/gfx/chr/index.json        per entry: bank/src/vram dest/length/tiles
                                  and the screens using it (from kit/data.json)
  tools/gfx/sprites/spr_NNN.png   the 136 raw sprite graphics of bank $0A
                                  (animation frames streamed into VRAM by the
                                  animation interpreter, ROM0 $1e44/$1f2a),
                                  assembled with the metasprite layout the
                                  game uses for them (or a linear strip)
  tools/gfx/sprites/index.json    per sprite: tile count + layout (tile k ->
                                  pixel x,y in the PNG); import_gfx.py needs it
  tools/gfx/metasprites.json      bank $0B $4000: 208 metasprite definitions
                                  ([dy, dx, tile, attr|null] per hardware sprite)
  tools/gfx/anims.json            bank $0B $52b0: 93 animation scripts
                                  (frame = delay, sprite gfx, VRAM slot,
                                  metasprite id; jump/end)
  tools/gfx/anims/anim_NN.png     each script rendered as a film strip (view
                                  only, regenerated every run)

Editing workflow: edit the PNGs (keep the 4 gray levels: white=0 ... black=3;
transparent = 0), then `python tools/import_gfx.py` and rebuild.

Usage:  python tools/export_gfx.py [--force]   (--force overwrites edited PNGs)
"""

import json
import os
import sys

from PIL import Image

from chr_codec import (CHR_TABLE, load_rom, lz_decode, decode_2bpp, encode_2bpp,
                       split_tiles, rom_offset)

TOOLS = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(TOOLS)
GFX = os.path.join(TOOLS, "gfx")
DATA_PATH = os.path.join(TOOLS, "kit", "data.json")
EDITS_PATH = os.path.join(TOOLS, "tile_edits.json")

# 4-gray palette, index == gray level (0 lightest .. 3 darkest)
PALETTE = [(255, 255, 255), (170, 170, 170), (85, 85, 85), (0, 0, 0)]

SPRITE_BANK = 0x0A          # raw sprite gfx: table at $4000, `db count, count*16`
META_BANK = 0x0B
META_TABLE = 0x4000         # 208 pointers -> `db n, n*[dy, dx, tile, sel, attr]`
META_COUNT = 208
ANIM_TABLE = 0x52B0         # 93 pointers -> animation scripts
ANIM_COUNT = 93


# ---------------------------------------------------------------------------
# helpers
# ---------------------------------------------------------------------------

def read_word(rom, bank, addr):
    o = rom_offset(bank, addr)
    return rom[o] | (rom[o + 1] << 8)


def new_image(w, h):
    img = Image.new("P", (w, h), 0)
    pal = []
    for c in PALETTE:
        pal += c
    img.putpalette(pal + [0] * (768 - len(pal)))
    return img


def blit_tile(img, tile, x, y, xflip=False, yflip=False, transparent=False):
    levels = decode_2bpp(tile)
    px = img.load()
    for yy in range(8):
        for xx in range(8):
            v = levels[yy * 8 + xx]
            if transparent and v == 0:
                continue
            tx = x + (7 - xx if xflip else xx)
            ty = y + (7 - yy if yflip else yy)
            if 0 <= tx < img.width and 0 <= ty < img.height:
                px[tx, ty] = v


def image_levels(img):
    """PIL image (P/L/RGB/RGBA/...) -> 2-D list of gray levels 0..3.
    Palette images with our 4-entry palette map by index; anything else maps
    luminance to the nearest level (white=0 ... black=3); alpha < 128 = 0."""
    w, h = img.size
    flat_pal = [c for rgb in PALETTE for c in rgb]
    if (img.mode == "P" and list((img.getpalette() or [])[:12]) == flat_pal
            and max(img.getdata()) <= 3):
        px = img.load()
        return [[px[x, y] for x in range(w)] for y in range(h)]
    rgba = img.convert("RGBA")
    px = rgba.load()
    out = []
    for y in range(h):
        row = []
        for x in range(w):
            r, g, b, a = px[x, y]
            if a < 128:
                row.append(0)
            else:
                lum = (r * 299 + g * 587 + b * 114) // 1000
                row.append(3 - min(3, (lum + 42) // 85))
        out.append(row)
    return out


def levels_tile(levels, x, y):
    """Extract the 64 levels of the 8x8 tile at pixel (x, y) (0 outside)."""
    out = []
    for yy in range(8):
        for xx in range(8):
            px, py = x + xx, y + yy
            out.append(levels[py][px] if 0 <= py < len(levels) and
                       0 <= px < len(levels[py]) else 0)
    return out


def sheet(tiles, width=16):
    rows = (len(tiles) + width - 1) // width
    img = new_image(width * 8, max(rows, 1) * 8)
    for i, t in enumerate(tiles):
        blit_tile(img, t, (i % width) * 8, (i // width) * 8)
    return img


def save(img, path, force):
    if os.path.exists(path) and not force:
        return False
    img.save(path)
    return True


# ---------------------------------------------------------------------------
# readers
# ---------------------------------------------------------------------------

def read_sprites(rom):
    """bank $0A: id -> list of 16-byte tiles (may be empty)."""
    first = read_word(rom, SPRITE_BANK, 0x4000)
    count = (first - 0x4000) // 2
    out = []
    for i in range(count):
        p = read_word(rom, SPRITE_BANK, 0x4000 + 2 * i)
        o = rom_offset(SPRITE_BANK, p)
        n = rom[o]
        out.append([rom[o + 1 + 16 * k:o + 17 + 16 * k] for k in range(n)])
    return out


def read_metasprites(rom):
    """bank $0B $4000: id -> list of dict(dy, dx, tile, attr) (attr None =
    taken from the object's flags at runtime)."""
    out = []
    for i in range(META_COUNT):
        p = read_word(rom, META_BANK, META_TABLE + 2 * i)
        o = rom_offset(META_BANK, p)
        n = rom[o]
        sprites = []
        for k in range(n):
            dy, dx, tile, sel, attr = rom[o + 1 + 5 * k:o + 6 + 5 * k]
            sprites.append({
                "dy": dy - 256 if dy >= 128 else dy,
                "dx": dx - 256 if dx >= 128 else dx,
                "tile": tile,
                "attr": (attr & 0xF0) if sel else None,
            })
        out.append({"id": i, "addr": p, "sprites": sprites})
    return out


def read_anims(rom):
    """bank $0B $52b0: animation scripts.
    opcode $00: frame  [delay, sprite gfx id, vram tile slot, metasprite id]
    opcode $fe: jump   [instruction index]
    anything else: end"""
    out = []
    for i in range(ANIM_COUNT):
        p = read_word(rom, META_BANK, ANIM_TABLE + 2 * i)
        pc = p
        ops = []
        while True:
            o = rom_offset(META_BANK, pc)
            op = rom[o]
            if op == 0x00:
                ops.append({"op": "frame", "delay": rom[o + 1], "gfx": rom[o + 2],
                            "slot": rom[o + 3], "meta": rom[o + 4]})
                pc += 5
            elif op == 0xFE:
                ops.append({"op": "jump", "to": rom[o + 1]})
                break
            else:
                ops.append({"op": "end"})
                break
        out.append({"id": i, "addr": p, "ops": ops})
    return out


# ---------------------------------------------------------------------------
# sprite layouts
# ---------------------------------------------------------------------------

def sprite_layout(gfx_id, ntiles, anims, metas):
    """Pixel placement of each tile of a sprite gfx, taken from the first
    animation frame that shows it through a flip-free metasprite whose tiles
    cover exactly slot..slot+n-1. Falls back to a linear strip.
    Returns (layout, source): layout = [(x, y)] per tile, top-left origin."""
    for a in anims:
        for f in a["ops"]:
            if f["op"] != "frame" or f["gfx"] != gfx_id:
                continue
            m = metas[f["meta"]]["sprites"]
            if len(m) != ntiles:
                continue
            if any(s["attr"] is not None and s["attr"] & 0x60 for s in m):
                continue        # flipped: not a plain layout
            slot_pos = {}
            for s in m:
                k = s["tile"] - f["slot"]
                if not (0 <= k < ntiles) or k in slot_pos:
                    break
                slot_pos[k] = (s["dx"], s["dy"])
            else:
                if len(slot_pos) == ntiles:
                    minx = min(x for x, _ in slot_pos.values())
                    miny = min(y for _, y in slot_pos.values())
                    layout = [(slot_pos[k][0] - minx, slot_pos[k][1] - miny)
                              for k in range(ntiles)]
                    return layout, f"anim {a['id']} meta {f['meta']}"
    return [(8 * k, 0) for k in range(ntiles)], "linear"


def render_sprite(tiles, layout):
    w = max(x for x, _ in layout) + 8 if layout else 8
    h = max(y for _, y in layout) + 8 if layout else 8
    img = new_image(w, h)
    for t, (x, y) in zip(tiles, layout):
        blit_tile(img, t, x, y)
    return img


# ---------------------------------------------------------------------------
# animation strips
# ---------------------------------------------------------------------------

def render_anim(anim, sprites, metas):
    frames = [f for f in anim["ops"] if f["op"] == "frame"]
    if not frames:
        return None
    # bounding box over all frames (metasprite coords are relative to the
    # object's position, which is the bottom-left-ish anchor)
    xs, ys = [], []
    for f in frames:
        for s in metas[f["meta"]]["sprites"]:
            xs += [s["dx"], s["dx"] + 8]
            ys += [s["dy"], s["dy"] + 8]
    if not xs:
        return None
    minx, maxx, miny, maxy = min(xs), max(xs), min(ys), max(ys)
    fw, fh = maxx - minx, maxy - miny
    gap = 2
    img = new_image(len(frames) * (fw + gap), fh)
    vram = {}   # tile slot -> tile, accumulated like the game's VRAM $8000+
    for i, f in enumerate(frames):
        # each frame streams its gfx into slots slot..slot+n-1
        for k, t in enumerate(sprites[f["gfx"]]):
            vram[f["slot"] + k] = t
        ox = i * (fw + gap) - minx
        for s in metas[f["meta"]]["sprites"]:
            t = vram.get(s["tile"])
            if t is None:
                continue        # tile loaded outside this script
            attr = s["attr"] or 0
            blit_tile(img, t, ox + s["dx"], s["dy"] - miny,
                      xflip=bool(attr & 0x20), yflip=bool(attr & 0x40),
                      transparent=True)
    return img


# ---------------------------------------------------------------------------
# main
# ---------------------------------------------------------------------------

def main():
    force = "--force" in sys.argv
    rom = load_rom()
    for sub in ("chr", "sprites", "anims"):
        os.makedirs(os.path.join(GFX, sub), exist_ok=True)

    kit = {}
    if os.path.isfile(DATA_PATH):
        with open(DATA_PATH) as f:
            kit = json.load(f).get("chr_entries", {})

    # -- CHR sheets (ROM tiles + current tile_edits.json patches) ---------
    edits = {}
    if os.path.isfile(EDITS_PATH):
        with open(EDITS_PATH) as f:
            edits = json.load(f).get("patches", {})
    index = {}
    written = 0
    for e, (bank, src, dest) in CHR_TABLE.items():
        data = lz_decode(rom, bank, src)
        tiles = split_tiles(data)
        for idx_s, levels in edits.get(str(e), {}).items():
            tiles[int(idx_s)] = bytes(encode_2bpp(levels))
        path = os.path.join(GFX, "chr", f"chr_{e:02d}.png")
        written += save(sheet(tiles), path, force)
        index[e] = {"bank": bank, "src": src, "dest": dest, "length": len(data),
                    "tiles": len(tiles),
                    "screens": kit.get(str(e), {}).get("screens", [])}
    with open(os.path.join(GFX, "chr", "index.json"), "w") as f:
        json.dump(index, f, indent=1)
    print(f"chr: {len(index)} sheets ({written} written)")

    # -- metasprites + anims (json) ---------------------------------------
    metas = read_metasprites(rom)
    anims = read_anims(rom)
    with open(os.path.join(GFX, "metasprites.json"), "w") as f:
        json.dump(metas, f, indent=1)
    with open(os.path.join(GFX, "anims.json"), "w") as f:
        json.dump(anims, f, indent=1)
    print(f"metasprites: {len(metas)}, anims: {len(anims)}")

    # -- sprites (bank $0A) ----------------------------------------------
    sprites = read_sprites(rom)
    sindex = {}
    written = 0
    for i, tiles in enumerate(sprites):
        layout, source = sprite_layout(i, len(tiles), anims, metas)
        used_by = sorted({a["id"] for a in anims
                          for f in a["ops"] if f.get("gfx") == i})
        sindex[i] = {"tiles": len(tiles), "layout": layout,
                     "layout_source": source, "anims": used_by}
        if not tiles:
            continue
        path = os.path.join(GFX, "sprites", f"spr_{i:03d}.png")
        written += save(render_sprite(tiles, layout), path, force)
    with open(os.path.join(GFX, "sprites", "index.json"), "w") as f:
        json.dump(sindex, f, indent=1)
    print(f"sprites: {len(sprites)} entries ({written} written)")

    # -- anim strips (always regenerated) ---------------------------------
    n = 0
    for a in anims:
        img = render_anim(a, sprites, metas)
        if img is None:
            continue
        img.save(os.path.join(GFX, "anims", f"anim_{a['id']:02d}.png"))
        n += 1
    print(f"anims: {n} strips -> {os.path.join(GFX, 'anims')}")


if __name__ == "__main__":
    main()
