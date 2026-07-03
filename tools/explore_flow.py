"""Discovery runner: boots the ROM and logs the screen flow.

Phase A: idle for ~60s emulated, capturing on every GAME_STATE/substate change
         and logging every full-screen map load (RenderTilemapCell at row0/col0).
Phase B: drive menus with START/A presses, same logging.

Produces tools/out/explore/ with numbered screenshots + flow.log.
"""

import os

from navigate import Session, OUT, GAME_STATE, SCREEN_SUBSTATE

EXPLORE_OUT = os.path.join(OUT, "explore")


def watch(s, frames, log, tag, presses=None, press_every=None):
    """Run `frames` frames; capture on state change; optionally press buttons."""
    last = (None, None)
    step = 10
    presses = list(presses or [])
    next_press = press_every
    for elapsed in range(0, frames, step):
        s.run(step, render_last=False)
        if press_every and elapsed >= (next_press or 0):
            btn = presses.pop(0) if presses else "start"
            s.pyboy.button(btn, delay=2)
            log.write(f"[{tag}] f={s.pyboy.frame_count} press {btn}\n")
            next_press = elapsed + press_every
        cur = s.state
        if cur != last:
            name = f"{tag}_f{s.pyboy.frame_count:06d}_gs{cur[0]:02x}_ss{cur[1]:02x}"
            s.dump(name, EXPLORE_OUT)
            log.write(f"[{tag}] f={s.pyboy.frame_count} state {last} -> {cur}\n")
            log.flush()
            last = cur


def fullscreen_loads(s):
    return [(f, e, gs, ss) for (f, e, b, c, gs, ss) in s.map_loads
            if b == 0 and c == 0]


def main():
    os.makedirs(EXPLORE_OUT, exist_ok=True)
    with open(os.path.join(EXPLORE_OUT, "flow.log"), "w") as log:
        # Phase A: pure idle (intro / title / demo attract cycle)
        s = Session()
        watch(s, 5400, log, "idle")
        log.write("\n[idle] full-screen map loads:\n")
        for f, e, gs, ss in fullscreen_loads(s):
            log.write(f"  f={f:6d} map=${e:02x} gs=${gs:02x} ss=${ss:02x}\n")
        log.write(f"[idle] all cell loads: {len(s.map_loads)}, "
                  f"sgb_hits={len(s.sgb_hits)}\n\n")
        s.stop()

        # Phase B: press through menus
        s = Session()
        watch(s, 1200, log, "nav0")          # reach title
        watch(s, 4800, log, "nav", press_every=240,
              presses=["start", "start", "a", "start", "a", "a", "start",
                       "a", "a", "a", "start", "a"])
        log.write("\n[nav] full-screen map loads:\n")
        for f, e, gs, ss in fullscreen_loads(s):
            log.write(f"  f={f:6d} map=${e:02x} gs=${gs:02x} ss=${ss:02x}\n")
        log.write(f"[nav] all cell loads: {len(s.map_loads)}, "
                  f"sgb_hits={len(s.sgb_hits)}\n")
        if s.sgb_hits:
            log.write(f"!! SGB HITS: {s.sgb_hits[:10]}\n")
        s.stop()
    print("done -> tools/out/explore/flow.log")


if __name__ == "__main__":
    main()
