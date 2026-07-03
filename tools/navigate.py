"""Shared PyBoy harness for Tetris Plus GBC colorization work.

Boots bin/game.gb in CGB mode with symbols, provides:
  - map-load logging (hook on RenderTilemapCell: E=map id, B=row, C=col)
  - SGB dead-code asserts (bank07 $4308 / $7ec9 must never execute on CGB)
  - per-screen dump helpers (screenshot, BG tile-ID grid, shadow map, OAM)
  - named navigation recipes to reach each screen
"""

import json
import os
import sys

from pyboy import PyBoy

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
ROM = os.path.join(ROOT, "bin", "game.gb")
SYM = os.path.join(ROOT, "bin", "game.sym")
OUT = os.path.join(ROOT, "tools", "out")

GAME_STATE = 0xC5A1
SCREEN_SUBSTATE = 0xC5A2
SGB_FLAG = 0xC67F
SHADOW_MAP = 0xD000  # 32x18 rows used (stride 32)
SHADOW_OAM = 0xC000  # 40 entries x 4 bytes


class Session:
    def __init__(self, rom=ROM, log_maps=True):
        self.pyboy = PyBoy(rom, window="null", cgb=True, symbols=SYM,
                           sound_emulated=False)
        self.map_loads = []   # (frame, map_id, row, col, game_state, substate)
        self.sgb_hits = []    # (frame, which)
        if log_maps:
            self.pyboy.hook_register(0, 0x1B27, self._on_map_load, None)
        self.pyboy.hook_register(7, 0x4308, self._on_sgb, "Call_007_4308")
        self.pyboy.hook_register(7, 0x7EC9, self._on_sgb, "Jump_007_7ec9")

    # -- hooks ---------------------------------------------------------------
    def _on_map_load(self, _):
        r = self.pyboy.register_file
        m = self.pyboy.memory
        self.map_loads.append((self.pyboy.frame_count, r.E, r.B, r.C,
                               m[GAME_STATE], m[SCREEN_SUBSTATE]))

    def _on_sgb(self, which):
        self.sgb_hits.append((self.pyboy.frame_count, which))

    # -- basics ----------------------------------------------------------------
    @property
    def state(self):
        m = self.pyboy.memory
        return m[GAME_STATE], m[SCREEN_SUBSTATE]

    def run(self, frames, render_last=True):
        if frames > 1:
            self.pyboy.tick(frames - 1, render=False)
        self.pyboy.tick(1, render=render_last)

    def press(self, button, hold=2, wait=8):
        self.pyboy.button(button, delay=hold)
        self.run(max(wait, hold + 1))

    # -- dumps -----------------------------------------------------------------
    def screenshot(self, path):
        os.makedirs(os.path.dirname(path), exist_ok=True)
        self.pyboy.tick(1, render=True)
        self.pyboy.screen.image.convert("RGB").save(path)

    def bg_tile_grid(self):
        tm = self.pyboy.tilemap_background
        return [[tm.tile_identifier(x, y) for x in range(32)] for y in range(32)]

    def shadow_map(self):
        m = self.pyboy.memory
        return [list(m[SHADOW_MAP + 32 * row:SHADOW_MAP + 32 * row + 32])
                for row in range(18)]

    def oam(self):
        m = self.pyboy.memory
        ent = []
        for i in range(40):
            y, x, tile, flags = m[SHADOW_OAM + 4 * i:SHADOW_OAM + 4 * i + 4]
            if 0 < y < 160:
                ent.append({"i": i, "y": y, "x": x, "tile": tile,
                            "flags": flags})
        return ent

    def dump(self, name, outdir=OUT):
        """Full dump of the current screen under outdir/name.*"""
        os.makedirs(outdir, exist_ok=True)
        self.screenshot(os.path.join(outdir, name + ".png"))
        gs, ss = self.state
        data = {
            "game_state": gs,
            "substate": ss,
            "sgb_flag": self.pyboy.memory[SGB_FLAG],
            "bg_tiles": self.bg_tile_grid(),
            "shadow_map": self.shadow_map(),
            "oam": self.oam(),
        }
        with open(os.path.join(outdir, name + ".json"), "w") as f:
            json.dump(data, f)
        return data

    def stop(self):
        self.pyboy.stop(save=False)


# ---------------------------------------------------------------------------
# Navigation recipes. Each recipe drives a fresh Session from boot to the
# named screen. Frame counts/button sequences discovered by explore_flow.py.
# ---------------------------------------------------------------------------

def goto_title(s):
    # Boot -> (intro) -> title. Wait for GAME_STATE $01 with generous timeout.
    for _ in range(40):
        if s.state[0] == 0x01:
            break
        s.run(30)
    s.run(120)  # let title settle / fade in


def goto_mode_select(s):
    goto_title(s)
    s.press("start", wait=90)


def goto_gameplay(s):
    goto_mode_select(s)
    # default selection -> start a 1P game; refined after discovery
    s.press("start", wait=90)
    for _ in range(40):
        if s.state[0] == 0x04:
            break
        s.press("start", wait=60)
    s.run(180)


def goto_demo(s):
    goto_title(s)
    # idle on title until demo/attract kicks in (GAME_STATE $0a)
    for _ in range(120):
        if s.state[0] == 0x0A:
            break
        s.run(60)
    s.run(300)


RECIPES = {
    "title": goto_title,
    "mode_select": goto_mode_select,
    "gameplay": goto_gameplay,
    "demo": goto_demo,
}


def capture(name, outdir=OUT, rom=ROM):
    s = Session(rom)
    try:
        RECIPES[name](s)
        data = s.dump(name, outdir)
        return s.map_loads, s.sgb_hits, data
    finally:
        s.stop()


if __name__ == "__main__":
    names = sys.argv[1:] or list(RECIPES)
    for n in names:
        loads, sgb, data = capture(n)
        print(f"{n}: state={data['game_state']:#04x}/{data['substate']:#04x} "
              f"map_loads={len(loads)} sgb_hits={len(sgb)}")
        if sgb:
            print("  !! SGB code executed:", sgb[:5])
