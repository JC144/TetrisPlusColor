#!/usr/bin/env python3
"""Per-bank hash verification for bin/game.gb.

Splits the built ROM into 16 KiB banks, hashes each with SHA-1 and compares
against the committed reference (tools/rom_hashes.json).

Banks fall into two classes:
  - FROZEN: never touched by the colorization work. Any drift is a build
    error (something shifted or was edited by accident).
  - ACTIVE (00, 01, 05, 10, 11): legitimately modified banks. Drift is reported
    as info only; run with --update after an intentional change to re-pin.

Usage:
  python check_rom.py            verify against rom_hashes.json
  python check_rom.py --update   regenerate rom_hashes.json from current build
"""

import hashlib
import json
import sys
from pathlib import Path

TOOLS_DIR = Path(__file__).resolve().parent
ROM_PATH = TOOLS_DIR.parent / "bin" / "game.gb"
HASHES_PATH = TOOLS_DIR / "rom_hashes.json"

BANK_SIZE = 0x4000
ACTIVE_BANKS = {0x00, 0x01, 0x05, 0x10, 0x11}  # banks the GBC work is allowed to change


def bank_hashes(rom_path):
    data = rom_path.read_bytes()
    if len(data) % BANK_SIZE != 0:
        sys.exit(f"error: {rom_path} size {len(data)} is not a multiple of 16 KiB")
    return {
        f"{i:02x}": hashlib.sha1(data[i * BANK_SIZE:(i + 1) * BANK_SIZE]).hexdigest()
        for i in range(len(data) // BANK_SIZE)
    }


def main():
    if not ROM_PATH.is_file():
        sys.exit(f"error: {ROM_PATH} not found (build first)")

    current = bank_hashes(ROM_PATH)

    if "--update" in sys.argv[1:]:
        HASHES_PATH.write_text(json.dumps(current, indent=2) + "\n")
        print(f"rom_hashes.json updated ({len(current)} banks)")
        return

    if not HASHES_PATH.is_file():
        sys.exit("error: tools/rom_hashes.json missing; run check_rom.py --update once")

    reference = json.loads(HASHES_PATH.read_text())
    frozen_bad, active_changed = [], []
    for bank, ref_hash in sorted(reference.items()):
        cur_hash = current.get(bank)
        if cur_hash == ref_hash:
            continue
        if int(bank, 16) in ACTIVE_BANKS:
            active_changed.append(bank)
        else:
            frozen_bad.append(bank)

    for bank in active_changed:
        print(f"info: active bank {bank} changed (expected if you edited it; "
              f"--update to re-pin)")
    if frozen_bad:
        for bank in frozen_bad:
            print(f"ERROR: frozen bank {bank} changed — this bank must stay "
                  f"byte-identical", file=sys.stderr)
        sys.exit(1)

    print(f"check_rom: OK ({len(reference)} banks, "
          f"{len(active_changed)} active bank(s) drifted)")


if __name__ == "__main__":
    main()
