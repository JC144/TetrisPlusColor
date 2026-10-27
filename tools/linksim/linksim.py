"""Two linked Game Boys in PyBoy, for testing Tetris Plus VS mode.

Runs two pure-Python PyBoy instances (tools/PyBoy-2.7.0: the pip wheel is
compiled and cannot be patched) side by side in slices of 1/32 frame, on one
clock counted in CPU cycles, and connects their serial ports through:

  cable  a real link cable: the master's transfer takes 8 bits at 8192 Hz;
         the partner's SB is swapped in if its port is armed (SC = $80) when
         the transfer starts, else the master reads $FF; both get the IRQ
  cwl    Shiny Relay's LINK CABLE mode (shiny-relay docs/PROTOCOL.md, CWL2):
         the master's transfer is held while the request crosses the network;
         the partner's port decides (exchanged at once if armed, else the offer
         stands until it arms); the answer comes back and completes the master.
         Writes to SB/SC under a held master park the CPU for a round trip
         (the write barrier); rewriting SC = $81 continues the held transfer.
         The master gives up after 1.5 s ($FF).
  none   no partner: every master transfer reads $FF

Latency is in milliseconds, with optional jitter and packet loss (a lost
packet is resent 20 ms later). Everything is deterministic for a seed.
"""

import heapq
import os
import random
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(os.path.dirname(HERE))
PYBOY_SRC = os.path.join(ROOT, "tools", "PyBoy-2.7.0")
sys.path.insert(0, PYBOY_SRC)

import pyboy.core.cpu as _pcpu  # noqa: E402
import pyboy.core.mb as _pmb  # noqa: E402
import pyboy.core.serial as _pserial  # noqa: E402
from pyboy.utils import FRAME_CYCLES, INTR_SERIAL, INTR_TIMER, MAX_CYCLES  # noqa: E402

ROM = os.environ.get("LINKSIM_ROM") or os.path.join(ROOT, "bin", "game.gb")
SYM = os.path.join(ROOT, "bin", "game.sym")

CPU_HZ = 4194304
BYTE_CYCLES = 8 * 512                 # 8 bits at 8192 Hz
SLICE = FRAME_CYCLES // 32            # ~0.52 ms
MS = CPU_HZ // 1000


def ms(t):
    return int(t * MS)


# ---------------------------------------------------------------- PyBoy patches

def _mb_tick(self):
    """Motherboard.tick that also stops at self._slice_end (same body as
    PyBoy 2.7.0's otherwise)."""
    end = getattr(self, "_slice_end", MAX_CYCLES)
    while not self.lcd.frame_done and self.cpu.cycles < end:
        if self.cgb and self.hdma.transfer_active and self.lcd._STAT._mode & 0b11 == 0:
            self.cpu.cycles = self.cpu.cycles + self.hdma.tick(self)
        else:
            mode0_cycles = MAX_CYCLES
            if self.cgb and self.hdma.transfer_active:
                mode0_cycles = self.lcd.cycles_to_mode0()
            cycles_target = max(4, min(
                self.timer._cycles_to_interrupt,
                self.lcd._cycles_to_interrupt,
                self.lcd._cycles_to_frame,
                self.sound._cycles_to_interrupt,
                self.serial._cycles_to_interrupt,
                mode0_cycles,
                end - self.cpu.cycles,
            ))
            if self.breakpoint_singlestep:
                cycles_target = 4
            self.cpu.tick(cycles_target)
        self.sound.tick(self.cpu.cycles)
        if self.serial.tick(self.cpu.cycles):
            self.cpu.set_interruptflag(INTR_SERIAL)
        if self.timer.tick(self.cpu.cycles):
            self.cpu.set_interruptflag(INTR_TIMER)
        if lcd_interrupt := self.lcd.tick(self.cpu.cycles):
            self.cpu.set_interruptflag(lcd_interrupt)
        if self.breakpoint_singlestep:
            break
    return self.breakpoint_singlestep


_cpu_tick0 = _pcpu.CPU.tick


def _cpu_tick(self, cycles_target):
    if getattr(self, "parked", False):    # write barrier: the CPU is stopped,
        self.cycles += cycles_target       # time (LCD, timer) goes on
        return
    _cpu_tick0(self, cycles_target)


_pmb.Motherboard.tick = _mb_tick
_pcpu.CPU.tick = _cpu_tick


class LinkSerial:
    """Drop-in for pyboy.core.serial.Serial; transfers go through a Port."""

    def __init__(self):
        self.SB = 0xFF
        self.SC = 0
        self.last_cycles = 0
        self._cycles_to_interrupt = MAX_CYCLES
        self.irq = False
        self.port = None

    def set_SB(self, value):
        if self.port:
            self.port.on_write(0, value)
        else:
            self.SB = value

    def set_SC(self, value):
        if self.port:
            self.port.on_write(1, value)
        else:
            self.SC = value

    def raise_irq(self):
        self.irq = True
        self._cycles_to_interrupt = 4

    def tick(self, cycles):
        self.last_cycles = cycles
        irq, self.irq = self.irq, False
        self._cycles_to_interrupt = MAX_CYCLES
        return irq

    def save_state(self, f):
        raise NotImplementedError

    def load_state(self, f, state_version):
        raise NotImplementedError


_pserial.Serial = LinkSerial

from pyboy import PyBoy  # noqa: E402  (after the patches)


# ---------------------------------------------------------------- the link

class Port:
    def __init__(self, link, unit):
        self.link, self.unit = link, unit
        self.serial = unit.mb.serial
        self.serial.port = self
        self.peer = None
        self.busy = False         # cable: a transfer under way
        self.req = None           # cwl: our held master request
        self.offer = None         # cwl: the partner's request standing at our port
        self.parked = None        # cwl: (reg, value, since) waiting for a verdict
        # stats
        self.masters = self.exchanges = self.unarmed = self.barriers = 0
        self.ff_reads = 0
        self.park_cycles = 0

    @property
    def now(self):
        return self.unit.mb.cpu.cycles

    @property
    def armed(self):
        return (self.serial.SC & 0x81) == 0x80 and self.req is None and self.parked is None

    def on_write(self, reg, v):
        s = self.serial
        if self.req is not None:                     # cwl: a held master
            if reg == 1 and v & 0x81 == 0x81:
                s.SC = v                             # restart: continues the hold
                return
            if reg == 1 and v & 0x81 == 0x01:
                s.SC = v | 0x80                      # stop then restart: absorbed
                return
            self.link.barrier(self, reg, v)
            return
        if reg == 0:
            s.SB = v
            return
        s.SC = v
        if v & 0x81 == 0x81:
            self.masters += 1
            self.link.master(self)
        elif v & 0x81 == 0x80 and self.offer is not None:
            self.link.take_offer(self)

    def complete(self, byte):
        """Transfer done: SB = byte, SC bit 7 off, IRQ."""
        self.serial.SB = byte
        self.serial.SC &= 0x7F
        self.serial.raise_irq()
        if byte == 0xFF:
            self.ff_reads += 1


class Link:
    def __init__(self, model="cable", one_way_ms=10.0, jitter_ms=0.0, loss=0.0, seed=1):
        self.model = model
        self.one_way, self.jitter, self.loss = ms(one_way_ms), ms(jitter_ms), loss
        self.rng = random.Random(seed)
        self.ports = []
        self.q = []
        self._n = 0
        self.logs = []

    def attach(self, unit):
        p = Port(self, unit)
        self.ports.append(p)
        if len(self.ports) == 2:
            a, b = self.ports
            a.peer, b.peer = b, a
        return p

    def log(self, p, s):
        self.logs.append((p.now // FRAME_CYCLES, p.unit.name, s))

    def at(self, when, fn):
        self._n += 1
        heapq.heappush(self.q, (when, self._n, fn))

    def run_until(self, t):
        while self.q and self.q[0][0] <= t:
            _, _, fn = heapq.heappop(self.q)
            fn()

    def hop(self):
        """One network leg: one-way latency (+ jitter), resends while lost."""
        d = self.one_way + (self.rng.randint(-self.jitter, self.jitter) if self.jitter else 0)
        while self.loss and self.rng.random() < self.loss:
            d += ms(20)
        return max(0, d)

    # -- a master starts --------------------------------------------------------
    def master(self, p):
        q = p.peer
        if self.model == "none" or q is None:
            self.at(p.now + BYTE_CYCLES, lambda: p.complete(0xFF))
            return
        if self.model == "cable":
            if p.busy:
                return
            p.busy = True
            if q.armed and not q.busy:
                mine, theirs = p.serial.SB, q.serial.SB
                q.exchanges += 1
                q.busy = True                 # its port is shifting

                def done():
                    p.busy = q.busy = False
                    p.complete(theirs)
                    q.complete(mine)
            else:
                p.unarmed += 1
                self.log(p, f"clocked an unarmed partner (SC={q.serial.SC:02x})")

                def done():
                    p.busy = False
                    p.complete(0xFF)
            self.at(p.now + BYTE_CYCLES, done)
            return
        # cwl: hold; REQ crosses the network
        req = {"byte": p.serial.SB, "master": p, "state": "flying", "ack": None}
        p.req = req
        self.at(p.now + self.hop(), lambda: self._req_arrives(q, req))
        self.at(p.now + ms(1500), lambda: self._master_timeout(req))

    # -- cwl -----------------------------------------------------------------------
    def _req_arrives(self, q, req):
        if req["state"] != "flying":          # its CANCEL overtook it
            return
        req["state"] = "offered"
        q.offer = req
        if q.armed:
            self.take_offer(q)

    def take_offer(self, q):
        req = q.offer
        q.offer = None
        theirs = q.serial.SB
        q.exchanges += 1
        q.complete(req["byte"])
        req["state"], req["ack"] = "acked", theirs
        self.at(q.now + self.hop(), lambda: self._ack_arrives(req))

    def _ack_arrives(self, req):
        p = req["master"]
        if p.req is not req:
            return
        p.req = None
        p.complete(req["ack"])
        self._unpark(p)

    def _cancelled_arrives(self, req, ff):
        p = req["master"]
        if p.req is not req:
            return
        p.req = None
        if ff:
            p.complete(0xFF)                  # master timeout: reads $FF
        self._unpark(p)

    def _cancel(self, req, ff):
        """The master asks the partner to give up on req."""
        p = req["master"]
        q = p.peer

        def arrives():
            if req["state"] == "acked":
                return                        # its ACK is on the way: that settles it
            if q.offer is req:
                q.offer = None
            req["state"] = "cancelled"
            self.at(q.now + self.hop(), lambda: self._cancelled_arrives(req, ff))
        self.at(p.now + self.hop(), arrives)

    def _master_timeout(self, req):
        p = req["master"]
        if p.req is req and req["state"] != "acked" and not req.get("cancelling"):
            req["cancelling"] = True
            self.log(p, "master timeout")
            self._cancel(req, ff=True)

    def barrier(self, p, reg, v):
        p.barriers += 1
        p.parked = (reg, v, p.now)
        p.unit.mb.cpu.parked = True
        self.log(p, f"barrier {'SB' if reg == 0 else 'SC'}={v:02x}")
        req = p.req
        if not req.get("cancelling"):
            req["cancelling"] = True
            self._cancel(req, ff=False)

    def _unpark(self, p):
        if p.parked is None:
            return
        reg, v, t0 = p.parked
        p.parked = None
        p.unit.mb.cpu.parked = False
        p.park_cycles += p.now - t0
        p.on_write(reg, v)                    # the parked write lands


# ---------------------------------------------------------------- units

class Unit:
    def __init__(self, link, name, rom=ROM):
        self.name = name
        self.pyboy = PyBoy(rom, window="null", cgb=True, sound_emulated=False,
                           symbols=SYM if rom == ROM else None)
        self.pyboy.set_emulation_speed(0)     # no real-time limiter
        self.mb = self.pyboy.mb
        self.port = link.attach(self)
        self.held = {}            # button -> frames left

    def mem(self, a, n=None):
        m = self.pyboy.memory
        return m[a] if n is None else list(m[a:a + n])

    @property
    def state(self):
        return self.mem(0xC5A1), self.mem(0xC5A2)

    def run_to(self, t, render=False):
        self.mb._slice_end = t
        while self.mb.cpu.cycles < t:
            self.pyboy.tick(1, render=render)


class Duo:
    def __init__(self, model="cable", rom=ROM, **link_kw):
        self.link = Link(model, **link_kw)
        self.a = Unit(self.link, "A", rom)
        self.b = Unit(self.link, "B", rom)
        self.t = 0
        self.frame = 0
        self.watchers = []

    def run(self, frames=1):
        for _ in range(frames):
            for u in (self.a, self.b):            # buttons are held per frame
                for btn in list(u.held):
                    u.held[btn] -= 1
                    if u.held[btn] < 0:
                        u.pyboy.button_release(btn)
                        del u.held[btn]
            for _ in range(FRAME_CYCLES // SLICE):
                self.t += SLICE
                for u in (self.a, self.b):
                    self.link.run_until(u.mb.cpu.cycles)
                    u.run_to(self.t)
                self.link.run_until(self.t)
            self.frame += 1
            for w in self.watchers:
                w(self)

    def hold(self, unit, button, frames=2):
        unit.pyboy.button_press(button)
        unit.held[button] = frames

    def press(self, unit, button, hold=2, wait=8):
        self.hold(unit, button, hold)
        self.run(max(wait, hold + 1))

    def screenshot(self, path):
        from PIL import Image
        imgs = []
        for u in (self.a, self.b):
            u.mb._slice_end = MAX_CYCLES
            u.pyboy.tick(1, render=True)          # one extra frame, rendered
            imgs.append(u.pyboy.screen.image.convert("RGB"))
        self.t = max(self.a.mb.cpu.cycles, self.b.mb.cpu.cycles)
        self.a.run_to(self.t)
        self.b.run_to(self.t)
        ia, ib = imgs
        out = Image.new("RGB", (ia.width * 2 + 8, ia.height), (40, 40, 40))
        out.paste(ia, (0, 0))
        out.paste(ib, (ia.width + 8, 0))
        out.resize((out.width * 2, out.height * 2), Image.NEAREST).save(path)

    def stop(self):
        self.a.pyboy.stop(save=False)
        self.b.pyboy.stop(save=False)
