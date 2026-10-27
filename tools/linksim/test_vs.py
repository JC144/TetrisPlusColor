"""VS mode scenarios on two linked emulated units (see linksim.py).

  python -u tools/linksim/test_vs.py [scenario ...]      (default: all)
  LINKSIM_ROM=bin/other.gb python -u tools/linksim/test_vs.py cwl   (another ROM)

Scenarios (A picks VS, B sits on SELECT MODE and is pulled in as slave):
  cable      a real link cable
  cwl        Shiny Relay's LINK CABLE mode, two Chromatics nearby
             (10 ms each way, +-3 ms jitter)
  cwl_bad    the same over a poor network (25 ms, +-10 ms, 5% packets lost)

Each prints PASS/FAIL lines; screenshots go to tools/out/linksim/.
Pure-Python PyBoy: about 19 emulated frames per second for the pair, a
scenario takes 3-4 minutes; run several in parallel.
"""

import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import linksim  # noqa: E402

OUT = os.path.join(os.path.dirname(HERE), "out", "linksim")
ST_TITLE, ST_MODE, ST_VS = 0x01, 0x02, 0x07
results = []


def check(name, cond, detail=""):
    results.append((name, bool(cond)))
    print(f"{'PASS' if cond else 'FAIL'}  {name}  {detail}")


def link_vars(u):
    m = u.mem
    return {"state": u.state, "master": m(0xD601), "up": m(0xD605), "silent": m(0xD607),
            "outq": ((m(0xD633) - m(0xD635)) & 0xFF) // 4,
            "inq": ((m(0xD638) - m(0xD63A)) & 0xFF) // 4}


def until(d, cond, limit):
    for _ in range(limit // 5):
        if cond():
            return True
        d.run(5)
    return cond()


def shot(d, name):
    os.makedirs(OUT, exist_ok=True)
    d.screenshot(os.path.join(OUT, name + ".png"))


def boot_to_mode_select(d):
    until(d, lambda: d.a.state[0] == ST_TITLE and d.b.state[0] == ST_TITLE, 3000)
    d.run(120)
    d.press(d.a, "start", wait=60)
    d.press(d.b, "start", wait=60)
    until(d, lambda: d.a.state[0] == ST_MODE and d.b.state[0] == ST_MODE, 600)
    d.run(40)


def pick_vs(d, u):
    d.press(u, "right", wait=30)
    d.press(u, "right", wait=30)
    d.press(u, "start", wait=4)


def scenario(tag, model, **link):
    d = linksim.Duo(model, **link)
    worst = {"outq": 0, "inq": 0}

    def watch(dd):
        for u in (dd.a, dd.b):
            v = link_vars(u)
            worst["outq"] = max(worst["outq"], v["outq"])
            worst["inq"] = max(worst["inq"], v["inq"])
    boot_to_mode_select(d)
    d.watchers.append(watch)
    pick_vs(d, d.a)
    ok = until(d, lambda: d.a.mem(0xD605) and d.b.mem(0xD605), 300)
    check(f"{tag}: handshake", ok and d.a.mem(0xD601) == 1 and d.b.mem(0xD601) == 0,
          f"{link_vars(d.a)} {link_vars(d.b)}")
    ok = until(d, lambda: d.a.state == (ST_VS, 6) and d.b.state == (ST_VS, 6), 900)
    check(f"{tag}: both on the VS menu", ok, f"{d.a.state} {d.b.state}")
    shot(d, f"{tag}_menu")

    # the menus: the master moves the match-count cursor ($c7d3: 1 3 5 7)
    for b in ("right", "right", "left"):
        d.press(d.a, b, wait=40)
    d.run(60)

    # a match: confirm on the master, both pick a level, then mash
    stayed = True
    for _ in range(8):
        d.press(d.a, "a", wait=30)
        d.press(d.b, "a", wait=2)
    check(f"{tag}: slave plays the master's match count",
          d.a.mem(0xC7D2) == d.b.mem(0xC7D2) == 3,
          f"A {d.a.mem(0xC7D2)} B {d.b.mem(0xC7D2)}")
    seq_a = ["left", "a", "right", "down", "b", "up"]
    seq_b = ["right", "b", "left", "down", "a", "left"]
    for i in range(60):
        d.press(d.a, seq_a[i % 6], wait=2)
        d.press(d.b, seq_b[i % 6], wait=2)
        d.run(16)
        if d.a.state[0] != ST_VS or d.b.state[0] != ST_VS:
            stayed = False
            break
    shot(d, f"{tag}_match")
    check(f"{tag}: match runs on both, nobody dropped to the title", stayed,
          f"{link_vars(d.a)} {link_vars(d.b)}")
    pa, pb = d.a.port, d.b.port
    check(f"{tag}: queues keep up", worst["outq"] <= 8,
          f"worst out-queue {worst['outq']} messages, in-queue {worst['inq']}")
    check(f"{tag}: no byte lost ($FF reads)", pa.ff_reads + pb.ff_reads == 0,
          f"A {pa.ff_reads} B {pb.ff_reads}, unarmed partner {pa.unarmed}/{pb.unarmed}")
    if model == "cwl":
        stall = (pa.park_cycles + pb.park_cycles) / linksim.MS
        check(f"{tag}: write barriers stay rare", pa.barriers + pb.barriers <= 4,
              f"A {pa.barriers} B {pb.barriers}, CPU parked {stall:.0f} ms in all")
    print(f"      exchanges A {pa.exchanges} B {pb.exchanges}, masters A {pa.masters} B {pb.masters}")
    d.stop()


def top_out(d, u, limit=4000):
    """u hard-drops (UP) until the round ends on both (substate 28, "press A")."""
    for _ in range(limit // 8):
        if d.a.state == (ST_VS, 28) and d.b.state == (ST_VS, 28):
            return True
        if d.a.state[0] != ST_VS or d.b.state[0] != ST_VS:
            return False
        d.press(u, "up", wait=8)
    return False


def set_scenario(tag, model, matches, **link):
    """A full set: the match count reaches the slave, the set ends after the
    right number of wins, and B quits VS on both consoles. With 1 match B quits
    on the winner screen (slave presses it), with 3 on the round result screen
    of the second round (master presses it)."""
    d = linksim.Duo(model, **link)
    boot_to_mode_select(d)
    pick_vs(d, d.a)
    ok = until(d, lambda: d.a.state == (ST_VS, 6) and d.b.state == (ST_VS, 6), 900)
    check(f"{tag}: both on the VS menu", ok, f"{d.a.state} {d.b.state}")
    for _ in range((matches - 1) // 2):
        d.press(d.a, "right", wait=20)
    for _ in range(12):                           # menus up to the first round
        if d.a.state[1] >= 22 and d.b.state[1] >= 22:
            break
        d.press(d.a, "a", wait=30)
        d.press(d.b, "a", wait=30)
    check(f"{tag}: both play a {matches}-match set",
          d.a.mem(0xC7D2) == matches and d.b.mem(0xC7D2) == matches,
          f"A {d.a.state} {d.a.mem(0xC7D2)} B {d.b.state} {d.b.mem(0xC7D2)}")

    for rnd in range(1, (matches + 1) // 2 + 1):
        ok = top_out(d, d.a)
        shot(d, f"{tag}_round{rnd}")
        check(f"{tag}: round {rnd} ends on both", ok, f"{d.a.state} {d.b.state}")
        if not ok:
            break
        if matches > 1 and rnd == 2:
            d.press(d.a, "b", wait=2)             # quit from the round result
            break
        d.press(d.a, "a", wait=2)
        last = rnd == (matches + 1) // 2
        want = 30 if last else 22
        ok = until(d, lambda: d.a.state[1] >= want and d.b.state[1] >= want
                   and d.a.state[1] <= 30, 600)
        check(f"{tag}: after round {rnd}: " + ("set winner" if last else "next round"),
              ok and (d.a.state[1] == 30) == last,
              f"{d.a.state} {d.b.state} wins A {d.a.mem(0xC7A9)}/{d.a.mem(0xC7AA)}")
        if last:
            shot(d, f"{tag}_winner")
            d.press(d.b, "b", wait=2)             # quit from the winner screen
            break
        until(d, lambda: d.a.state[1] == 23 and d.b.state[1] == 23, 600)

    ok = until(d, lambda: d.a.state[0] == ST_TITLE and d.b.state[0] == ST_TITLE, 600)
    shot(d, f"{tag}_quit")
    check(f"{tag}: B quits VS on both, link reset", ok and not d.a.mem(0xD605)
          and not d.b.mem(0xD605), f"{link_vars(d.a)} {link_vars(d.b)}")
    if ok:                                        # and VS can start again
        d.run(120)
        d.press(d.a, "start", wait=60)
        d.press(d.b, "start", wait=60)
        until(d, lambda: d.a.state[0] == ST_MODE and d.b.state[0] == ST_MODE, 600)
        d.run(40)
        pick_vs(d, d.b)
        ok = until(d, lambda: d.a.state == (ST_VS, 6) and d.b.state == (ST_VS, 6), 900)
        check(f"{tag}: a new VS starts afterwards", ok and d.b.mem(0xD601) == 1,
              f"{link_vars(d.a)} {link_vars(d.b)}")
    d.stop()


SCENARIOS = {
    "cable": lambda: scenario("cable", "cable"),
    "cwl": lambda: scenario("cwl", "cwl", one_way_ms=10, jitter_ms=3),
    "cwl_bad": lambda: scenario("cwl_bad", "cwl", one_way_ms=25, jitter_ms=10, loss=0.05),
    "set1": lambda: set_scenario("set1", "cwl", 1, one_way_ms=10, jitter_ms=3),
    "set3": lambda: set_scenario("set3", "cwl", 3, one_way_ms=25, jitter_ms=10, loss=0.05),
    "set1_cable": lambda: set_scenario("set1_cable", "cable", 1),
}

if __name__ == "__main__":
    names = sys.argv[1:] or list(SCENARIOS)
    for n in names:
        print(f"== {n}  (ROM {os.path.basename(linksim.ROM)})")
        SCENARIOS[n]()
    bad = [n for n, ok in results if not ok]
    print(f"\n{len(results) - len(bad)}/{len(results)} checks passed")
    sys.exit(1 if bad else 0)
