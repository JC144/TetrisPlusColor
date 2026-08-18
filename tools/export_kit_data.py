"""Export everything the colorization studio needs into tools/kit/.

Walks every known screen (intro, title, options, classic and puzzle) while hooking the
CHR dispatch (DispatchBankRoutine entry $1c56 -> GBC_ChrPatchRet) to record
which CHR entries each screen loads, and to assert that what the game
decompressed into VRAM equals tools/chr_codec.py's offline decode. Produces:
  tools/kit/data.json    chr_entries (all 23: dispatch dest / decoded length /
                         2bpp data b64 / screens using it),
                         screens (state, map, descriptor, tile grid, OAM)
  tools/kit/screens/*.png

Run after a build: python tools/export_kit_data.py
"""

import base64
import json
import os

from navigate import Session, OUT, GAME_STATE, SCREEN_SUBSTATE
from chr_codec import CHR_TABLE, load_rom, lz_decode

KIT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "kit")
VRAM0, VRAM1 = 0x8000, 0x9800

# Every CHR entry decoded offline from the ROM: dest = dispatch-table VRAM
# destination, data = full decompressed blob (tools/chr_codec.py). The studio's
# tile indices are relative to this dest.
_ROM = load_rom()
CHR_ENTRIES = {}
for _e, (_bank, _src, _dest) in CHR_TABLE.items():
    _data = lz_decode(_ROM, _bank, _src)
    CHR_ENTRIES[_e] = {"dest": _dest, "length": len(_data), "data": _data}


class KitExporter:
    def __init__(self):
        self.session = s = Session()
        self.chr_entries = CHR_ENTRIES   # id -> {dest, length, data(bytes)}
        self.loads_since = []     # CHR entry ids since last checkpoint
        self.history = []         # cumulative ordered loads this session
                                  # (VRAM state = layered in this order)
        self.last_map = None
        self._before = None
        s.pyboy.hook_register(0, 0x1C56, self._chr_begin, None)
        s.pyboy.hook_register(None, "GBC_ChrPatchRet", self._chr_end, None)

    def _chr_begin(self, _):
        self._before = self.session.pyboy.register_file.A   # entry id

    def _chr_end(self, _):
        if self._before is None:
            return
        entry = self._before
        self._before = None
        m = self.session.pyboy.memory
        after = bytes(m[VRAM0:VRAM1])
        # Cross-check the emulator against the offline codec: the bytes the
        # game just decompressed must equal chr_codec's decode of the same
        # entry (the hook runs before Bank10_ApplyChrPatches, so VRAM still
        # holds the pristine original tiles here).
        info = CHR_ENTRIES[entry]
        start = info["dest"] - VRAM0
        got = after[start:start + info["length"]]
        assert got == info["data"], \
            f"CHR entry {entry}: VRAM after load differs from chr_codec decode"
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
