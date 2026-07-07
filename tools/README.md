# Tetris Plus GBC — Colorization Toolchain

This directory contains the toolchain used to colorize *Tetris Plus* (Game Boy) into a
Game Boy Color game: a browser-based **colorization studio**, JSON data files that are
the source of truth for colors and tile fixes, code generators that turn them into
assembly includes, and PyBoy-scripted emulation to capture and verify every screen.

## Prerequisites

- **Python 3** with `pyboy` and `pillow` (`pip install pyboy pillow`)
- **RGBDS** — bundled in [`rgbds-win64/`](rgbds-win64/)
- **Windows** — the build script is a `.bat` (everything else is portable Python)

All commands below are run from the **repository root**.

## Quick start: the colorization studio

```
python tools/kit_server.py
```

Then open **http://localhost:8765**. The studio has three tabs:

- **Écrans** — gallery of every captured screen; hover a cell to see its tile ID and
  palette; click a screen to open it in the pixel editor.
- **Palettes** — per-screen descriptor editor: up to 8 BG + 8 OBJ palettes
  (RGB888 hex, converted to RGB555 at generation time) and attribute LUTs
  (default attribute + `[first, last, attr]` tile-ID ranges, last range wins).
  Writes `tools/screen_colors.json`.
- **Pixels** — tile pixel editor with two views: **Vue écran** (the reconstructed
  20×18 screen with real palettes and OAM sprites; click a cell to open its tile)
  and **Vue planche** (the linear tile sheet of a CHR entry). Writes
  `tools/tile_edits.json`. **Replace with…** depends on the view: in sheet view
  it overwrites the tile's pixels (every use of that tile changes); in screen
  view it remaps **only the selected cell** to another tile already loaded in
  that screen's VRAM (orange outline = remapped cell, Reset removes the remap).

Buttons:

- **💾 Enregistrer** — saves the edited JSON back to disk (`POST /save-colors`,
  `POST /save-tiles`).
- **🔨 Rebuild + captures** — runs the full pipeline (`POST /rebuild`):
  `gen_color_data.py` → `gen_tile_patches.py` → `build.bat` → `export_kit_data.py`,
  then reloads the fresh captures in the UI.

## Data flow

```
tools/screen_colors.json ──gen_color_data.py──▶ src/extensions/screen_colors_data.inc ─┐
tools/tile_edits.json ────gen_tile_patches.py─▶ src/extensions/tile_patches.inc ────────┤
                                                                                        ▼
                                                    build.bat (rgbasm → rgblink → rgbfix)
                                                                                        ▼
                                                            bin/game.gb + bin/game.sym ─┐
                                                                                        ▼
                                     export_kit_data.py (PyBoy walk of every screen) ───┤
                                                                                        ▼
                                          tools/kit/data.json + tools/kit/screens/*.png
```

**The two JSON files are the source of truth.** The `.inc` files are generated —
never edit them by hand, or the next studio rebuild will silently overwrite your
change. Always go through the studio (or edit the JSON and re-run the generators).

## Script reference

| Script | Purpose |
|---|---|
| [`kit_server.py`](kit_server.py) | Stdlib-only HTTP server for the studio (port 8765). Serves `tools/kit/`, exposes the editable JSONs, handles save/rebuild. |
| [`navigate.py`](navigate.py) | Shared PyBoy harness. `Session` boots `bin/game.gb` in CGB mode with symbols, logs every map load (hook on `RenderTilemapCell`), asserts SGB dead code never runs, and provides screenshot / BG-tile-grid / shadow-map / OAM dumps plus named navigation recipes (`title`, `mode_select`, `gameplay`, `demo`). |
| [`verify_screens.py`](verify_screens.py) | Builds the ROM (skip with `--no-build`) and walks every screen — intro, title, mode select, classic gameplay, and the whole puzzle branch — dumping PNG + JSON per checkpoint into `tools/out/screens/`. Prints a summary (game state per screen, SGB hit count). |
| [`export_kit_data.py`](export_kit_data.py) | Same walk, but also hooks the CHR dispatch (`DispatchBankRoutine` entry + `GBC_ChrPatchRet`) to diff VRAM around each graphics load. Produces the studio database `tools/kit/data.json` (CHR entries with empirical dest/length/2bpp data, per-screen tile grids and OAM) and `tools/kit/screens/*.png`. Run after every build that changes graphics. |
| [`gen_color_data.py`](gen_color_data.py) | `screen_colors.json` → `src/extensions/screen_colors_data.inc` (palette words + attribute LUT specs + map→descriptor assignments). |
| [`gen_tile_patches.py`](gen_tile_patches.py) | `tile_edits.json` → `src/extensions/tile_patches.inc` (`ChrPatchTable`: per-CHR-entry lists of `[VRAM dest, 16 bytes 2bpp]`, plus `MapRemapTable`: per-map lists of `[row, col, tile id]` cell remaps applied to the $d000 tilemap shadow right after a map decompresses). Validates destinations against the geometry in `kit/data.json`. |
| [`explore_flow.py`](explore_flow.py) | One-off discovery tool: idles then drives menus, capturing on every game-state change into `tools/out/explore/` with a flow log. Used to discover the screen flow the other scripts rely on. |
| [`dump_screen.py`](dump_screen.py) | One-off discovery tool: catalogs every full-screen map load with a screenshot into `tools/out/catalog/` (`map_<id>_<n>.png` + `catalog.txt`). |
| [`build.bat`](build.bat) | Assembles `src/game.asm` and links/fixes it into `bin/game.gb` + `bin/game.sym` using the bundled RGBDS. |

`tools/out/` and `tools/kit/data.json` + `tools/kit/screens/` are **generated output**,
not sources — safe to delete, regenerated by the scripts above.

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
- **Gotcha:** tile indices in `tile_edits.json` are relative to each CHR entry's
  *empirical* VRAM destination recorded in `tools/kit/data.json` (measured by VRAM
  diffing), which can differ from the dispatch table's nominal destination when the
  first bytes of a load matched what was already in VRAM.

## Bundled third-party

- [`rgbds-win64/`](rgbds-win64/) — RGBDS assembler/linker/fixer binaries used by `build.bat`.
- [`PyBoy-2.7.0/`](PyBoy-2.7.0/) — PyBoy source tree, kept as an API reference for the
  scripted-emulation scripts (the scripts use the pip-installed `pyboy` package).

## Gotchas

- **Never run two PyBoy instances in parallel on the same ROM** — it deadlocks
  silently. Run the capture scripts one at a time.
- The `.inc` files under `src/extensions/` are generated; edit the JSONs (ideally via
  the studio) and regenerate instead.
- `verify_screens.py` and `export_kit_data.py` rely on fixed frame timings for the two
  intro captures and on default menu cursor positions; if you change boot flow or menu
  order, re-check the captured PNGs.
