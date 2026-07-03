"""Build the ROM and capture every screen for visual inspection.

Usage:
    python verify_screens.py [--no-build] [--out DIR]

Walks one emulation session through the discovered screen flow
(intro texts -> title -> mode select -> classic gameplay -> stacked
gameplay; plus a second session for the puzzle mode branch), dumping
PNG + JSON at each checkpoint into tools/out/screens (default).

Checkpoint flow discovered by explore_flow.py:
  gs$00 ss$00-$09  intro/copyright text screens (map $3e)
  gs$01            title (map $20)
  gs$02            mode select (map $21)
  gs$03            classic gameplay (map $22)   [state $03, not $04]
"""

import argparse
import os
import subprocess
import sys

from navigate import Session, OUT

TOOLS = os.path.dirname(os.path.abspath(__file__))


def build():
    r = subprocess.run(os.path.join(TOOLS, "build.bat"), cwd=TOOLS,
                       capture_output=True, text=True, shell=True)
    sys.stdout.write(r.stdout)
    if r.returncode != 0:
        sys.stderr.write(r.stderr)
        raise SystemExit("build failed")


def wait_state(s, gs, timeout=3600, step=10):
    """Run until GAME_STATE == gs; returns False on timeout."""
    for _ in range(0, timeout, step):
        if s.state[0] == gs:
            return True
        s.run(step, render_last=False)
    return False


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--no-build", action="store_true")
    ap.add_argument("--out", default=os.path.join(OUT, "screens"))
    args = ap.parse_args()

    if not args.no_build:
        build()

    outdir = args.out
    os.makedirs(outdir, exist_ok=True)
    report = []

    # ---- session 1: intro -> title -> mode select -> classic gameplay ----
    s = Session()
    s.run(160);  report.append(("intro_text1", s.dump("intro_text1", outdir)))
    s.run(560);  report.append(("intro_text2", s.dump("intro_text2", outdir)))
    wait_state(s, 0x01)
    s.run(150);  report.append(("title", s.dump("title", outdir)))
    s.press("start", wait=60)
    wait_state(s, 0x02)
    s.run(60);   report.append(("mode_select", s.dump("mode_select", outdir)))
    s.press("start", wait=60)
    wait_state(s, 0x03)
    s.run(90);   report.append(("level_select", s.dump("level_select", outdir)))
    s.press("a", wait=90)                  # confirm level 0 -> gameplay
    s.run(240);  report.append(("gameplay", s.dump("gameplay", outdir)))
    # stack a few pieces: hold soft-drop in bursts
    for _ in range(14):
        s.press("down", hold=40, wait=46)
    report.append(("gameplay_stack", s.dump("gameplay_stack", outdir)))
    sgb1, loads1 = s.sgb_hits, list(s.map_loads)
    s.stop()

    # ---- session 2: puzzle-mode branch from mode select ----
    s = Session()
    wait_state(s, 0x01)
    s.run(120)
    s.press("start", wait=60)
    wait_state(s, 0x02)
    s.run(60)
    s.press("right", wait=40)
    report.append(("mode_select_alt", s.dump("mode_select_alt", outdir)))
    s.press("start", wait=90)
    s.run(120)
    report.append(("puzzle_menu", s.dump("puzzle_menu", outdir)))
    s.press("a", wait=90)                  # NEW GAME
    s.run(120)
    report.append(("puzzle_difficulty", s.dump("puzzle_difficulty", outdir)))
    s.press("a", wait=90)
    s.run(240)
    report.append(("puzzle_worldmap", s.dump("puzzle_worldmap", outdir)))
    s.press("a", wait=90)
    s.run(300)
    report.append(("puzzle_game", s.dump("puzzle_game", outdir)))
    sgb2, loads2 = s.sgb_hits, list(s.map_loads)
    s.stop()

    # ---- summary ----
    full = [(f, e, gs) for (f, e, b, c, gs, ss) in loads1 + loads2
            if b == 0 and c == 0]
    print("\n=== verify_screens summary ===")
    for name, d in report:
        print(f"  {name:18s} gs=${d['game_state']:02x} ss=${d['substate']:02x}")
    print("  full-screen maps:", " ".join(f"${e:02x}" for _, e, _ in full))
    sgb = sgb1 + sgb2
    print(f"  SGB hits: {len(sgb)}" + (f"  !! {sgb[:5]}" if sgb else " (ok)"))
    print(f"  output: {outdir}")


if __name__ == "__main__":
    main()
