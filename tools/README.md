# Tetris Plus GBC — Colorization Toolchain

This directory contains the toolchain used to colorize *Tetris Plus* (Game Boy) into a
Game Boy Color game: a browser-based **colorization studio**, JSON data files that are
the source of truth for colors and tile fixes, code generators that turn them into
assembly includes, and PyBoy-scripted emulation to capture and verify every screen.

## Prerequisites

- **Python 3** with `pyboy` and `pillow` (`pip install pyboy pillow`)
- **RGBDS** — not in git: download the win64 release from
  https://github.com/gbdev/rgbds/releases and unpack it into `tools/rgbds-win64/`
  (`build.py` expects `rgbasm.exe`, `rgblink.exe`, `rgbfix.exe` there)
- **Windows** — the build script calls the win64 RGBDS binaries (everything else is portable Python)
- **Original ROM** (optional) — `bin/Tetris Plus (USA, Europe) (SGB Enhanced).gb`, never
  committed. When present, `build.py` also runs `list_patches.py --check` against it.

All commands below are run from the **repository root**.

## Quick start: the colorization studio

```
python tools/kit_server.py
```

Then open **http://localhost:8765**. The studio has three tabs:

- **Screens** — gallery of every captured screen; hover a cell to see its tile ID and
  palette; click a screen to open it in the pixel editor.
- **Palettes** — per-screen descriptor editor: up to 8 BG + 8 OBJ palettes
  (RGB888 hex, converted to RGB555 at generation time) and attribute LUTs
  (default attribute + `[first, last, attr]` tile-ID ranges, last range wins).
  Writes `tools/screen_colors.json`.
- **Pixels** — tile pixel editor with two views: **Screen view** (the reconstructed
  20×18 screen with real palettes and OAM sprites; click a cell to open its tile)
  and **Sheet view** (the linear tile sheet of a CHR entry). Writes
  `tools/tile_edits.json`. **Replace with…** depends on the view: in sheet view
  it overwrites the tile's pixels (every use of that tile changes); in screen
  view it remaps **only the selected cell** to another tile already loaded in
  that screen's VRAM (orange outline = remapped cell, **Reset tile** removes the remap).

Buttons:

- **💾 Save** — saves the edited JSON back to disk (`POST /save-colors`,
  `POST /save-tiles`).
- **🔨 Rebuild + captures** — runs the full pipeline (`POST /rebuild`):
  `build.py` (generators + RGBDS + checks) → `export_kit_data.py`,
  then reloads the fresh captures in the UI.

## Data flow

```
tools/screen_colors.json ──gen_color_data.py──▶ src/extensions/screen_colors_data.inc ─┐
tools/tile_edits.json ────gen_tile_patches.py─▶ src/extensions/tile_patches.inc ────────┤
                                                                                        ▼
                                              build.py (rgbasm → rgblink → rgbfix
                                               → check_rom.py → list_patches.py --check)
                                                                                        ▼
                                                            bin/game.gb + bin/game.sym ─┐
                                                                                        ▼
                                     export_kit_data.py (PyBoy walk of every screen) ───┤
                                                                                        ▼
                                          tools/kit/data.json + tools/kit/screens/*.png
```

`python tools/build.py` runs the whole left column in one go (generators, RGBDS,
then the safety checks below). `--skip-gen` skips the generators.

A third generator, `gen_sprite_gfx.py`, turns `tools/gfx/sprites/*.png` into
`src/graphics/bank11_sprite_gfx.asm` (see **Sprites & animations** below).

**The two JSON files are the source of truth.** The `.inc` files are generated —
never edit them by hand, or the next studio rebuild will silently overwrite your
change. Always go through the studio (or edit the JSON and re-run the generators).

## Script reference

| Script | Purpose |
|---|---|
| [`kit_server.py`](kit_server.py) | Stdlib-only HTTP server for the studio (port 8765). Serves `tools/kit/`, exposes the editable JSONs, handles save/rebuild. |
| [`navigate.py`](navigate.py) | Shared PyBoy harness (library, not a CLI). `Session` boots `bin/game.gb` in CGB mode with symbols, logs every map load (hook on `RenderTilemapCell`), asserts SGB dead code never runs, and provides screenshot / BG-tile-grid / shadow-map / OAM dumps. |
| [`export_kit_data.py`](export_kit_data.py) | Walks every screen — intro, title, options, mode select, classic gameplay and the whole puzzle branch — and hooks the CHR dispatch (`DispatchBankRoutine` entry + `GBC_ChrPatchRet`) to record which CHR entries each screen loads and to assert the emulated VRAM equals `chr_codec.py`'s offline decode. Produces the studio database `tools/kit/data.json` (all 23 CHR entries with dispatch dest/decoded length/2bpp data, per-screen tile grids and OAM) and `tools/kit/screens/*.png`. Run after every build that changes graphics. |
| [`chr_codec.py`](chr_codec.py) | Pure-Python port of the ROM's CHR decompressor (LZSS, ROM0 `$1d14`) + a compatible encoder, the dispatch table (`CHR_TABLE`) and the 2bpp helpers. `--selftest` decodes all 23 entries and cross-checks the ROM table and `kit/data.json`. |
| [`export_gfx.py`](export_gfx.py) | Extracts every graphic asset to editable PNGs in `tools/gfx/`: CHR tile sheets (`chr/`), raw sprite graphics of bank `$0A` assembled with their in-game layout (`sprites/`), plus `metasprites.json`, `anims.json` and rendered animation strips (`anims/`). Never overwrites an existing PNG unless `--force`. |
| [`import_gfx.py`](import_gfx.py) | Diffs the edited `gfx/chr/chr_NN.png` sheets against the ROM tiles and writes the differing tiles into `tile_edits.json` (same data as the studio's pixel editor). Sprites need no import step. |
| [`gen_sprite_gfx.py`](gen_sprite_gfx.py) | `gfx/sprites/*.png` (+ `index.json` layouts) → `src/graphics/bank11_sprite_gfx.asm`, a relocated copy of the bank `$0A` sprite table that the animation interpreter now reads (`BANK_SPRITE_GFX`). Byte-identical to bank `$0A` while the PNGs are untouched. Run by `build.py`. |
| [`gen_color_data.py`](gen_color_data.py) | `screen_colors.json` → `src/extensions/screen_colors_data.inc` (palette words + attribute LUT specs + map→descriptor assignments). |
| [`gen_tile_patches.py`](gen_tile_patches.py) | `tile_edits.json` → `src/extensions/tile_patches.inc` (`ChrPatchTable`: per-CHR-entry lists of `[VRAM dest, 16 bytes 2bpp]`, plus `MapRemapTable`: per-map lists of `[row, col, tile id]` cell remaps applied to the $d000 tilemap shadow right after a map decompresses). Validates destinations against the geometry in `kit/data.json`. |
| [`build.py`](build.py) | The unified build: generators → rgbasm/rgblink/rgbfix → `check_rom.py` → `list_patches.py --check` (when the original dump is in `bin/`). |
| [`check_rom.py`](check_rom.py) | Per-bank SHA-1 verification of `bin/game.gb` against the committed [`rom_hashes.json`](rom_hashes.json). Frozen banks (everything except 00, 01, 05, 10) must stay byte-identical or the build fails; `--update` re-pins after an intentional change. |
| [`diff_rom.py`](diff_rom.py) | Byte-level diff of `bin/game.gb` against the original ROM dump (kept out of git in `bin/`, SHA-1 pinned in the script). Lists every divergent range per bank — the ground truth for "what did we change". |
| [`list_patches.py`](list_patches.py) | Generates [`PATCHES.md`](../PATCHES.md) from the ROM diff + `game.sym` + `; was:` comments + curated [`patch_notes.json`](patch_notes.json). `--check` (run by `build.py` when the original dump is present) fails if any divergent byte is unclassified/undocumented. |

`tools/out/`, `tools/kit/data.json` + `tools/kit/screens/` and `tools/gfx/anims/` are
**generated output**, not sources — safe to delete, regenerated by the scripts above.
`tools/gfx/chr`, `tools/gfx/sprites` and the two JSON dumps are sources (edit the PNGs).

## How the runtime side works (short version)

The engine lives in [`src/extensions/bank10_gbc_colorization.asm`](../src/extensions/bank10_gbc_colorization.asm),
wired into the original code through small ROM0 hooks in bank00:

- Each screen (RLE map ID) is assigned a **descriptor**: 8 BG + 8 OBJ CGB palettes and
  tile-ID→attribute LUTs. A hook on `RenderTilemapCell` detects full-screen map loads
  and installs the matching descriptor; DMG-era fades keep working because the engine
  tracks the BGP/OBP shadow registers.
- **Tile pixel patches** are applied by `Bank10_ApplyChrPatches`, spliced into the
  return path of `DispatchBankRoutine` (`GBC_ChrPatchRet`): right after the game
  decompresses a CHR entry into VRAM, the edited tiles from `ChrPatchTable` are
  written over it. This covers both BG and sprite tiles.
- **Per-cell tile remaps** are applied by `Bank10_ApplyMapRemaps`, spliced into
  the single exit of `RenderTilemapCell` (`GBC_MapRemapRet`): right after a map
  is decompressed into the `$d000` shadow, remapped cells from `MapRemapTable`
  get their tile id rewritten in the shadow, so both VRAM copy paths (per-tile
  and GDMA flip) and the attribute LUT pick up the new tile automatically.
- Tile indices in `tile_edits.json` are relative to each CHR entry's dispatch-table
  VRAM destination (`CHR_TABLE` in `chr_codec.py`), i.e. index 0 is the first tile
  of the decompressed blob — the same numbering as the `tools/gfx/chr` sheets.

## Sprites & animations

```
python tools/export_gfx.py          # once: fills tools/gfx/ (won't overwrite your edits)
... edit tools/gfx/sprites/spr_NNN.png / tools/gfx/chr/chr_NN.png ...
python tools/import_gfx.py          # only for chr sheets -> tile_edits.json
python tools/build.py               # gen_sprite_gfx.py picks the sprite PNGs up itself
```

How the original game animates sprites (all data-driven, now exported as JSON):

- **`tools/gfx/sprites/`** — bank `$0A` holds 136 raw (uncompressed) sprite graphics,
  `db tile_count` + tiles. The animation interpreter (ROM0 `Call_000_1e44` →
  `Call_000_1f2a`) streams one of them into VRAM at `$8000 + slot*16` when a frame
  starts. Each PNG is the graphic assembled with the metasprite layout the game uses
  for it (`index.json` → `layout`, tile k → pixel x,y); graphics no script uses are
  exported as a linear strip. Keep the size and the 4 gray levels
  (white = 0 … black = 3, transparent = 0). To use them the build points the
  interpreter at bank `$11` (`BANK_SPRITE_GFX`, generated from these PNGs), bank
  `$0A` stays frozen.
- **`tools/gfx/metasprites.json`** — bank `$0B` `$4000`, 208 metasprites: list of
  hardware sprites `{dy, dx, tile, attr}` (`attr: null` = flags taken from the object).
  An object's field +4 selects one; piece rotations are 4 consecutive ids.
- **`tools/gfx/anims.json`** — bank `$0B` `$52b0`, 93 animation scripts run by the
  interpreter: `frame {delay, gfx, slot, meta}` = wait `delay` frames, stream sprite
  graphic `gfx` into VRAM slot `slot`, show metasprite `meta`; `jump {to}` loops to
  instruction `to`; `end`. `tools/gfx/anims/anim_NN.png` renders each script as a film
  strip (view only). Metasprites and scripts are exported read-only for now — editing
  them means regenerating bank `$0B` data (not wired yet).
- **`tools/gfx/chr/`** — the 23 LZSS CHR entries as 16-tile-wide sheets, with the
  current `tile_edits.json` patches applied. Edited tiles go through the existing
  `ChrPatchTable` mechanism (no recompression; ~10 KB free in bank `$10`, max 255
  patched tiles per entry). The sheets are a *view* of ROM + `tile_edits.json`: after
  editing tiles in the studio, run `export_gfx.py --force` before touching the PNGs,
  otherwise `import_gfx.py` reverts the studio's edits on that sheet.

## Third-party (not in git)

- `tools/rgbds-win64/` — RGBDS assembler/linker/fixer binaries used by `build.py`
  (see Prerequisites; the folder is gitignored).
- PyBoy — installed with pip; the capture scripts import the `pyboy` package.

## Gotchas

- **Never run two PyBoy instances in parallel on the same ROM** — it deadlocks
  silently. Run the capture scripts one at a time.
- The `.inc` files under `src/extensions/` are generated; edit the JSONs (ideally via
  the studio) and regenerate instead.
- `export_kit_data.py` relies on fixed frame timings for the two intro captures and on
  default menu cursor positions; if you change boot flow or menu order, re-check the
  captured PNGs.
