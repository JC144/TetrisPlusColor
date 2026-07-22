"""Export everything the colorization studio needs into tools/kit/.

Walks the known screens (same flow as verify_screens.py) while hooking the
CHR dispatch: a VRAM snapshot at DispatchBankRoutine entry ($1c56) and another
at GBC_ChrPatchRet (post-decompression) yield the exact bytes each CHR entry
writes. Produces:
  tools/kit/data.json    chr_entries (dest/length/2bpp data b64, screens),
                         screens (state, map, descriptor, tile grid, OAM)
  tools/kit/screens/*.png

Run after a build: python tools/export_kit_data.py
"""

import base64
import json
import os

from navigate import Session, OUT, GAME_STATE, SCREEN_SUBSTATE

KIT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "kit")
VRAM0, VRAM1 = 0x8000, 0x9800


class KitExporter:
    def __init__(self):
        self.session = s = Session()
        self.chr_entries = {}     # id -> {dest, length, data(bytes)}
        self.loads_since = []     # CHR entry ids since last checkpoint
        self.history = []         # cumulative ordered loads this session
                                  # (VRAM state = layered in this order)
        self.last_map = None
        self._before = None
        s.pyboy.hook_register(0, 0x1C56, self._chr_begin, None)
        s.pyboy.hook_register(None, "GBC_ChrPatchRet", self._chr_end, None)

    def _chr_begin(self, _):
        m = self.session.pyboy.memory
        self._before = (self.session.pyboy.register_file.A,
                        bytes(m[VRAM0:VRAM1]))

    def _chr_end(self, _):
        if self._before is None:
            return
        entry, before = self._before
        self._before = None
        m = self.session.pyboy.memory
        after = bytes(m[VRAM0:VRAM1])
        diff = [i for i in range(len(before)) if before[i] != after[i]]
        if not diff:
            # data identical to what was already in VRAM; use known prior info
            if entry in self.chr_entries:
                self.loads_since.append(entry)
                self.history.append(entry)
            return
        # align to the 16-byte tile grid: the studio decodes tiles from dest,
        # so a diff starting mid-tile would shift every tile's bytes
        start, end = diff[0] & ~0xF, (diff[-1] + 16) & ~0xF
        info = self.chr_entries.get(entry)
        if info:  # extend the known range (idempotent reloads may differ less)
            start = min(start, info["dest"] - VRAM0)
            end = max(end, info["dest"] - VRAM0 + info["length"])
        self.chr_entries[entry] = {
            "dest": VRAM0 + start,
            "length": end - start,
            "data": after[start:end],
        }
        self.loads_since.append(entry)
        self.history.append(entry)

    def checkpoint(self, name, screens):
        s = self.session
        s.screenshot(os.path.join(KIT, "screens", name + ".png"))
        m = s.pyboy.memory
        gs, ss = s.state
        # last full-screen map load
        full = [e for (f, e, b, c, _, _) in s.map_loads if b == 0 and c == 0]
        entries = sorted(set(self.loads_since))
        if not entries and screens:
            entries = screens[-1][1]["chr_entries"]   # inherit previous
        self.loads_since = []
        # dedup history keeping only the LAST occurrence of each entry
        hist = []
        for e in self.history:
            if e in hist:
                hist.remove(e)
            hist.append(e)
        screens.append((name, {
            "game_state": gs, "substate": ss,
            "map_id": full[-1] if full else None,
            "chr_entries": entries,
            "chr_history": hist,
            "bg_tiles": [list(m[0xD000 + 32 * r:0xD000 + 32 * r + 20])
                         for r in range(18)],
            "oam": s.oam(),
        }))


def wait_state(s, gs, timeout=3600):
    for _ in range(0, timeout, 10):
        if s.state[0] == gs:
            return True
        s.run(10, render_last=False)
    raise RuntimeError(f"timeout waiting for GAME_STATE {gs:#x} "
                       f"(currently {s.state[0]:#x})")


def to_mode_select(s):
    wait_state(s, 1)
    s.run(120)
    s.press("start", wait=60)
    wait_state(s, 2)
    s.run(60)


def main():
    os.makedirs(os.path.join(KIT, "screens"), exist_ok=True)
    kx = KitExporter()
    s = kx.session
    screens = []

    s.run(160);  kx.checkpoint("intro_text1", screens)
    s.run(560);  kx.checkpoint("intro_text2", screens)
    wait_state(s, 1)
    s.run(150);  kx.checkpoint("title", screens)
    s.press("start", wait=60)
    wait_state(s, 2)
    s.run(60);   kx.checkpoint("mode_select", screens)
    # classic
    s.press("start", wait=60)
    wait_state(s, 3)
    s.run(90);   kx.checkpoint("level_select", screens)
    s.press("a", wait=90)
    s.run(240);  kx.checkpoint("gameplay", screens)
    s.stop()

    # session 1b: options (own session, no reliable way back out)
    kxo = KitExporter()
    kxo.chr_entries = kx.chr_entries
    s = kxo.session
    to_mode_select(s)
    s.press("left", wait=40)
    s.press("start", wait=90)
    s.run(60)
    kxo.loads_since = [e for e in kxo.loads_since]   # keep options loads
    kxo.checkpoint("options", screens)
    s.stop()

    # second session: puzzle branch
    kx2 = KitExporter()
    s = kx2.session
    kx2.chr_entries = kx.chr_entries   # accumulate into same dict
    to_mode_select(s)
    s.press("right", wait=40)
    s.press("start", wait=90)
    s.run(120)
    kx2.loads_since = []   # ignore pre-menu loads already attributed
    kx2.checkpoint("puzzle_menu", screens)
    s.press("a", wait=90)
    s.run(120); kx2.checkpoint("puzzle_difficulty", screens)
    s.press("a", wait=90)
    s.run(240); kx2.checkpoint("puzzle_worldmap", screens)
    s.press("a", wait=90)
    s.run(300); kx2.checkpoint("puzzle_cutscene", screens)
    s.press("a", wait=90)
    s.run(300); kx2.checkpoint("puzzle_game", screens)
    s.stop()

    # descriptor names from screen_colors.json
    with open(os.path.join(os.path.dirname(KIT), "screen_colors.json")) as f:
        colors = json.load(f)
    map_desc = {int(k, 0): v for k, v in colors["map_assignments"].items()}

    data = {
        "chr_entries": {
            str(e): {
                "dest": info["dest"],
                "length": info["length"],
                "data_b64": base64.b64encode(info["data"]).decode(),
                "screens": [n for n, sc in screens if e in sc["chr_entries"]],
            } for e, info in sorted(kx.chr_entries.items())
        },
        "screens": {
            n: dict(sc, descriptor=map_desc.get(sc["map_id"], "(aucun)"))
            for n, sc in screens
        },
    }
    with open(os.path.join(KIT, "data.json"), "w") as f:
        json.dump(data, f)
    print(f"kit: {len(data['screens'])} screens, "
          f"{len(data['chr_entries'])} CHR entries -> {KIT}")
    for e, info in sorted(kx.chr_entries.items()):
        print(f"  chr {e:2d}: dest ${info['dest']:04X} len {info['length']:5d}"
              f"  ({info['length'] // 16} tiles)")


if __name__ == "__main__":
    main()
