"""Catalog every full-screen map load with a screenshot.

Runs several scripted sessions (title idle/demo, classic game to game over,
puzzle mode deep, mode-select variants) and saves a screenshot ~1s after each
full-screen RenderTilemapCell(0,0,E) load, named map_<id>_<n>.png, plus
catalog.txt summarizing map id -> (game_state, substate) occurrences.

Output: tools/out/catalog/
"""

import os
import random

from navigate import Session, OUT

CAT = os.path.join(OUT, "catalog")


class Catalog:
    def __init__(self):
        os.makedirs(CAT, exist_ok=True)
        self.entries = []   # (map_id, gs, ss, png)
        self.counts = {}

    def watch(self, s, frames, tag, step=8, on_step=None):
        seen = len(s.map_loads)
        for i in range(0, frames, step):
            s.run(step, render_last=False)
            if on_step:
                on_step(i)
            new = s.map_loads[seen:]
            seen = len(s.map_loads)
            for (f, e, b, c, gs, ss) in new:
                if b == 0 and c == 0:
                    s.run(50, render_last=False)  # let the screen draw/fade in
                    n = self.counts.get(e, 0)
                    self.counts[e] = n + 1
                    png = f"map_{e:02x}_{tag}_{n}.png"
                    s.screenshot(os.path.join(CAT, png))
                    gs2, ss2 = s.state
                    self.entries.append((e, gs2, ss2, png))
                    seen = len(s.map_loads)

    def save(self):
        with open(os.path.join(CAT, "catalog.txt"), "w") as f:
            for (e, gs, ss, png) in self.entries:
                f.write(f"map ${e:02x}  gs=${gs:02x} ss=${ss:02x}  {png}\n")
        print(f"{len(self.entries)} full-screen loads cataloged -> {CAT}")


def to_title(s):
    while s.state[0] != 1:
        s.run(10, render_last=False)
    s.run(120)


def main():
    cat = Catalog()

    # --- session 1: boot, title, idle 6 min for demo/attract ---
    s = Session()
    cat.watch(s, 600, "boot")
    cat.watch(s, 21600, "idle")
    s.stop()

    # --- session 2: classic game until game over, then linger ---
    s = Session()
    to_title(s)
    cat.watch(s, 1, "t2")
    s.press("start", wait=60)
    while s.state[0] != 2:
        s.run(10, render_last=False)
    s.run(60)
    s.press("start", wait=60)
    while s.state[0] != 3:
        s.run(10, render_last=False)
    s.run(90)
    s.press("a", wait=90)
    s.run(120)
    random.seed(11)

    def play(_):
        s.pyboy.button(random.choice(["left", "right", "down", "a"]), delay=2)
    cat.watch(s, 14400, "classic", on_step=play)
    cat.watch(s, 1800, "postgame")
    s.stop()

    # --- session 3: puzzle mode, play into a stage ---
    s = Session()
    to_title(s)
    s.press("start", wait=60)
    while s.state[0] != 2:
        s.run(10, render_last=False)
    s.run(60)
    s.press("right", wait=40)
    s.press("start", wait=90)
    cat.watch(s, 300, "pz_menu")
    s.press("a", wait=90)       # NEW GAME
    cat.watch(s, 300, "pz_diff")
    s.press("a", wait=90)       # NORMAL
    cat.watch(s, 600, "pz_map")
    s.press("a", wait=90)       # EGYPT
    cat.watch(s, 1200, "pz_intro")
    s.press("a", wait=90)
    cat.watch(s, 600, "pz_st")
    random.seed(12)

    def play2(_):
        s.pyboy.button(random.choice(["left", "right", "down", "a"]), delay=2)
    cat.watch(s, 7200, "pz_play", on_step=play2)
    s.stop()

    # --- session 4: mode select left (other modes: VS etc.) ---
    s = Session()
    to_title(s)
    s.press("start", wait=60)
    while s.state[0] != 2:
        s.run(10, render_last=False)
    s.run(60)
    s.press("left", wait=40)
    cat.watch(s, 120, "ms_left")
    s.press("start", wait=90)
    cat.watch(s, 900, "mode_left")
    s.press("a", wait=90)
    cat.watch(s, 900, "mode_left2")
    s.stop()

    cat.save()


if __name__ == "____main__" or __name__ == "__main__":
    main()
