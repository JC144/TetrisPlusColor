"""CHR (tile graphics) codec for Tetris Plus.

Pure-Python port of the ROM's graphics decompressor (ROM0 $1d14, reached from
DispatchBankRoutine $1c56 -- see src/core/bank00/05_dispatch.asm) plus the
2bpp tile <-> gray-level helpers shared by the toolchain.

Compressed stream format (LZSS, as decoded by $1d14):
  byte 0        method marker ($01 on every entry; ignored by the decoder)
  bytes 1-2     decompressed length, little-endian
  then repeated: a 16-bit little-endian control word, consumed LSB first
                 (16 flags per word), each flag followed by its item:
    flag 0  ->  1 literal byte, copied to VRAM
    flag 1  ->  2-byte back-reference token  b0, b1:
                  offset = b0 | (b1 & $07) << 8          (0..2047)
                  length = ((b1 >> 3) & $1F) + 3         (3..34)
                  source = dest - offset - 1  (may overlap the destination)
  Decoding stops as soon as `length` bytes were produced (the check happens
  before every item, and the copy loop does not check mid-token, so a token
  must never run past the end).

The dispatch table (ROM0 $1c73) maps entry id -> (bank, src, vram_dest);
CHR_TABLE below is that table (verified against the ROM by `--selftest`).

Usage:
  python tools/chr_codec.py --selftest      decode every entry, cross-check the
                                            dispatch table + tools/kit/data.json
"""

import base64
import json
import os
import sys

TOOLS = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(TOOLS)
DEFAULT_ROM = os.path.join(ROOT, "bin", "game.gb")
DATA_PATH = os.path.join(TOOLS, "kit", "data.json")

BANK_SIZE = 0x4000
DISPATCH_TABLE = 0x1C73     # ROM0: 23 pointers to 5-byte structs
NUM_ENTRIES = 23

# Dispatch table at ROM0 $1c73: entry id -> (bank, src, vram_dest).
CHR_TABLE = {
    0:  (0x0D, 0x4000, 0x8800),
    1:  (0x0D, 0x489D, 0x8800),
    2:  (0x0E, 0x5A40, 0x8800),
    3:  (0x0E, 0x6202, 0x8800),
    4:  (0x0E, 0x6AAC, 0x8000),
    5:  (0x0D, 0x4E78, 0x8800),
    6:  (0x0E, 0x5A40, 0x8000),
    7:  (0x0E, 0x5F9F, 0x8800),
    8:  (0x0E, 0x7595, 0x8800),
    9:  (0x0E, 0x74A4, 0x86C0),
    10: (0x0D, 0x6848, 0x8800),
    11: (0x0D, 0x5575, 0x9000),
    12: (0x0D, 0x59A0, 0x9000),
    13: (0x0D, 0x5E6C, 0x9000),
    14: (0x0D, 0x636B, 0x9000),
    15: (0x0D, 0x6BCD, 0x8800),
    16: (0x0D, 0x74B4, 0x8800),
    17: (0x0C, 0x4000, 0x9000),
    18: (0x0F, 0x57E0, 0x9000),
    19: (0x0C, 0x49B6, 0x9000),
    20: (0x0C, 0x44FB, 0x9000),
    21: (0x0E, 0x6C5F, 0x8800),
    22: (0x0E, 0x7093, 0x9000),
}


# ---------------------------------------------------------------------------
# ROM access
# ---------------------------------------------------------------------------

def load_rom(path=DEFAULT_ROM):
    with open(path, "rb") as f:
        return f.read()


def rom_offset(bank, addr):
    """(bank, $4000-$7fff address) -> linear ROM offset. Bank 0 uses $0000+."""
    if bank == 0:
        assert 0 <= addr < BANK_SIZE, f"bad ROM0 address {addr:#06x}"
        return addr
    assert BANK_SIZE <= addr < 2 * BANK_SIZE, f"bad ROMX address {addr:#06x}"
    return bank * BANK_SIZE + (addr - BANK_SIZE)


def read_dispatch_table(rom):
    """Read the live dispatch table from ROM0: id -> (bank, src, dest)."""
    table = {}
    for i in range(NUM_ENTRIES):
        p = DISPATCH_TABLE + i * 2
        struct = rom[p] | (rom[p + 1] << 8)
        bank = rom[struct]
        src = rom[struct + 1] | (rom[struct + 2] << 8)
        dest = rom[struct + 3] | (rom[struct + 4] << 8)
        table[i] = (bank, src, dest)
    return table


# ---------------------------------------------------------------------------
# LZSS
# ---------------------------------------------------------------------------

def lz_decode(rom, bank, src):
    """Decode the compressed CHR stream at (bank, src). Returns bytes."""
    p = rom_offset(bank, src)
    method = rom[p]
    assert method == 0x01, f"unexpected method byte {method:#04x} at {bank:02x}:{src:04x}"
    length = rom[p + 1] | (rom[p + 2] << 8)
    p += 3
    out = bytearray()
    while len(out) < length:
        ctrl = rom[p] | (rom[p + 1] << 8)
        p += 2
        for _ in range(16):
            if len(out) >= length:
                break
            flag = ctrl & 1
            ctrl >>= 1
            if flag == 0:
                out.append(rom[p])
                p += 1
            else:
                b0, b1 = rom[p], rom[p + 1]
                p += 2
                offset = b0 | ((b1 & 0x07) << 8)
                run = ((b1 >> 3) & 0x1F) + 3
                start = len(out) - offset - 1
                assert start >= 0, "back-reference before start of output"
                for k in range(run):       # byte-wise: overlap allowed
                    out.append(out[start + k])
    assert len(out) == length, "token ran past the declared length"
    return bytes(out)


def lz_encoded_size(rom, bank, src):
    """Size in bytes of the compressed stream at (bank, src)."""
    p0 = p = rom_offset(bank, src)
    length = rom[p + 1] | (rom[p + 2] << 8)
    p += 3
    produced = 0
    while produced < length:
        ctrl = rom[p] | (rom[p + 1] << 8)
        p += 2
        for _ in range(16):
            if produced >= length:
                break
            flag = ctrl & 1
            ctrl >>= 1
            if flag == 0:
                produced += 1
                p += 1
            else:
                produced += ((rom[p + 1] >> 3) & 0x1F) + 3
                p += 2
    return p - p0


def lz_encode(data):
    """Greedy LZSS encoder producing a stream the ROM decoder ($1d14) accepts.
    Round-trip is guaranteed: lz_decode(lz_encode(x)) == x."""
    n = len(data)
    assert n <= 0xFFFF
    body = bytearray()
    flags = []
    items = []      # bytes per flag

    def flush():
        nonlocal flags, items
        if not flags:
            return
        word = 0
        for i, f in enumerate(flags):
            word |= f << i
        body.append(word & 0xFF)
        body.append(word >> 8)
        for it in items:
            body.extend(it)
        flags, items = [], []

    pos = 0
    while pos < n:
        best_len, best_off = 0, 0
        max_run = min(34, n - pos)
        if max_run >= 3:
            lo = max(0, pos - 2048)
            for start in range(pos - 1, lo - 1, -1):
                k = 0
                while k < max_run and data[start + k] == data[pos + k]:
                    k += 1
                if k > best_len:
                    best_len, best_off = k, pos - start - 1
                    if k == max_run:
                        break
        if best_len >= 3:
            b0 = best_off & 0xFF
            b1 = ((best_off >> 8) & 0x07) | ((best_len - 3) << 3)
            flags.append(1)
            items.append(bytes((b0, b1)))
            pos += best_len
        else:
            flags.append(0)
            items.append(bytes((data[pos],)))
            pos += 1
        if len(flags) == 16:
            flush()
    flush()
    return bytes((0x01, n & 0xFF, n >> 8)) + bytes(body)


def lz_decode_bytes(stream):
    """Decode a standalone stream (as produced by lz_encode)."""
    return lz_decode(bytes(0x8000) + stream, 2, 0x4000)


# ---------------------------------------------------------------------------
# 2bpp tiles
# ---------------------------------------------------------------------------

def encode_2bpp(levels):
    """64 gray levels (0=lightest..3=darkest) -> 16 bytes GB 2bpp."""
    assert len(levels) == 64 and all(0 <= v <= 3 for v in levels), "bad tile data"
    out = []
    for y in range(8):
        lo = hi = 0
        for x in range(8):
            v = levels[y * 8 + x]
            lo |= (v & 1) << (7 - x)
            hi |= ((v >> 1) & 1) << (7 - x)
        out += [lo, hi]
    return out


def decode_2bpp(tile):
    """16 bytes GB 2bpp -> 64 gray levels (row-major 8x8, 0..3)."""
    assert len(tile) == 16
    levels = []
    for y in range(8):
        lo, hi = tile[2 * y], tile[2 * y + 1]
        for x in range(8):
            bit = 7 - x
            levels.append(((lo >> bit) & 1) | (((hi >> bit) & 1) << 1))
    return levels


def split_tiles(data):
    """bytes -> list of 16-byte tiles (data padded with zeros to a multiple of 16)."""
    if len(data) % 16:
        data = bytes(data) + bytes(16 - len(data) % 16)
    return [data[i:i + 16] for i in range(0, len(data), 16)]


# ---------------------------------------------------------------------------
# Self-test
# ---------------------------------------------------------------------------

def selftest(rom_path=DEFAULT_ROM):
    rom = load_rom(rom_path)
    live = read_dispatch_table(rom)
    ok = True
    for i in range(NUM_ENTRIES):
        if live[i] != CHR_TABLE[i]:
            print(f"entry {i}: dispatch table mismatch ROM {live[i]} vs CHR_TABLE {CHR_TABLE[i]}")
            ok = False
    decoded = {}
    for i, (bank, src, dest) in CHR_TABLE.items():
        data = lz_decode(rom, bank, src)
        size = lz_encoded_size(rom, bank, src)
        decoded[i] = data
        # round trip through our encoder
        re = lz_encode(data)
        assert lz_decode_bytes(re) == data, f"entry {i}: encoder round-trip failed"
        print(f"entry {i:2d}: bank {bank:02X} src ${src:04X} -> ${dest:04X} "
              f"{len(data):5d} bytes ({len(data) // 16:3d} tiles), "
              f"compressed {size:5d}, re-encoded {len(re):5d}")
    if os.path.isfile(DATA_PATH):
        with open(DATA_PATH) as f:
            kit = json.load(f)
        for k, e in kit.get("chr_entries", {}).items():
            i = int(k)
            observed = base64.b64decode(e["data_b64"])
            dest_nom = CHR_TABLE[i][2]
            off = e["dest"] - dest_nom
            expected = decoded[i][off:off + len(observed)]
            if off < 0 or expected != observed:
                print(f"entry {i}: decoded data does NOT match kit/data.json VRAM capture "
                      f"(dest ${e['dest']:04X}, {len(observed)} bytes)")
                ok = False
            else:
                print(f"entry {i:2d}: matches kit/data.json capture "
                      f"(${e['dest']:04X}, {len(observed)} bytes, offset {off})")
    print("selftest", "OK" if ok else "FAILED")
    return ok


if __name__ == "__main__":
    if "--selftest" in sys.argv:
        sys.exit(0 if selftest() else 1)
    print(__doc__)
