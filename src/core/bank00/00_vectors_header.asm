; ============================================================================
; bank00/00_vectors_header.asm — $0000-$0150: RST/interrupt vectors, GBC_BootHardwareCheck island ($006d), cartridge header
; Part of SECTION "ROM Bank $000"; included in order by bank00_core_engine.asm.
; ============================================================================
RST_00::
    pop hl

Call_000_0001:
Jump_000_0001:
    add a

Jump_000_0002:
    rst $28
    ld a, [hl+]
    ld h, [hl]
    ld l, a

Call_000_0006:
    jp hl


    nop

RST_08::
    reti


Jump_000_0009:
    nop
    nop
    nop
    nop
    nop
    nop
    nop

RST_10::
    ld [$2000], a
    ret


    nop
    nop
    nop
    nop

RST_18::
    ld [$2000], a
    ret


    nop
    nop
    nop
    nop

RST_20::
    add l
    ld l, a
    ret c

    dec h
    ret


    nop
    nop
    nop

RST_28::
    add l
    ld l, a
    ret nc

    inc h
    ret


    nop
    nop
    nop

RST_30::
    add a

Jump_000_0031:
    rst $28
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ret


    nop
    nop

RST_38::
    ld a, [hl+]
    ld l, [hl]
    ld h, a
    ret


Jump_000_003c:
    nop
    nop
    nop

Jump_000_003f:
    nop

VBlankInterrupt::
    jp VBlankTrampoline_Bank0  ; GBC initialization trampoline


    nop

Jump_000_0044:
    nop
    nop
    nop
    nop

LCDCInterrupt::
    reti


Call_000_0049:
    nop
    nop
    nop
    nop
    nop
    nop
    nop

TimerOverflowInterrupt::
    jp Jump_000_21c1


    nop
    nop
    nop
    nop
    nop

SerialTransferCompleteInterrupt::
    jp Jump_000_211e


    nop
    nop
    nop
    nop
    nop

JoypadTransitionInterrupt::
    reti


    nop
    nop
    nop

Call_000_0064:
    nop
    nop
    nop
    nop

    nop
    nop
    nop

Call_000_006b:
    nop
    nop

Jump_000_006d:
; ----------------------------------------------------------------------------
; GBC_BootHardwareCheck: DMG lockout guard, jumped to from the entry point
; ($0101) before A is clobbered. The CGB boot ROM leaves A=$11 (DMG=$01,
; MGB/SGB2=$FF, SGB=$01): anything but $11 cannot run this CGB-only build,
; so map bank $10 and show the lockout screen instead of booting broken.
; Lives in the unused interrupt-vector padding; the surrounding labels are
; only referenced by data artifacts in the tile banks and must stay pinned,
; hence the nop padding below (13 bytes of code, $006d-$0079).
; ----------------------------------------------------------------------------
ASSERT @ == $006d ; island lives in the interrupt-vector padding, must not move
GBC_BootHardwareCheck::
    cp $11
    jp z, Jump_000_0150         ; CGB/GBA: continue the original boot path
    ld a, $10
    ld [$2000], a               ; MBC1: map ROM bank $10
    jp Bank10_DMGLockout        ; never returns
    nop                         ; pad so Call_000_0081 stays at $0081
    nop
    nop
    nop
    nop
    nop
    nop

ASSERT @ == $0081 ; Call_000_0081 is referenced by pinned code, must not move
Call_000_0081:
Jump_000_0081:
    nop

Jump_000_0082:
    nop
    nop

Call_000_0084:
    ds 9, 0 ; 9 x nop ($00)

Call_000_008d:
    nop
    nop
    nop
    nop
    nop
    nop

Call_000_0093:
    ds 23, 0 ; 23 x nop ($00)

Jump_000_00aa:
    ds 18, 0 ; 18 x nop ($00)

Jump_000_00bc:
    nop
    nop
    nop
    nop

Jump_000_00c0:
    nop
    nop
    nop

Jump_000_00c3:
    nop
    nop
    nop
    nop
    nop

Call_000_00c8:
    nop
    nop
    nop
    nop

Call_000_00cc:
    ds 20, 0 ; 20 x nop ($00)

Jump_000_00e0:
    ds 23, 0 ; 23 x nop ($00)

Call_000_00f7:
    nop
    nop
    nop
    nop
    nop

Jump_000_00fc:
    nop
    nop
    nop

Call_000_00ff:
Jump_000_00ff:
    nop

ASSERT @ == $0100 ; cartridge entry point
Boot::
    nop

Jump_000_0101:
    jp GBC_BootHardwareCheck    ; DMG lockout: checks boot A, resumes at $0150 on CGB


HeaderLogo::
    db $ce, $ed, $66, $66, $cc, $0d, $00, $0b, $03, $73, $00, $83, $00, $0c, $00, $0d
    db $00, $08, $11, $1f, $88, $89, $00, $0e, $dc, $cc, $6e, $e6, $dd, $dd, $d9, $99
    db $bb, $bb, $67, $63, $6e, $0e, $ec, $cc, $dd, $dc, $99, $9f, $bb, $b9, $33, $3e

HeaderTitle::
    db "TETRIS PLUS", $00, $00, $00, $00
    ; CGB flag is the last byte of the 16-byte title field
HeaderCGBFlag::
    db $C0  ; $C0 = GBC only

HeaderNewLicenseeCode::
    db $30, $31

HeaderSGBFlag::
    db $00  ; SGB support disabled (GBC-only build; SGB code path is unreachable)

HeaderCartridgeType::
    db $03

HeaderROMSize::
    db $04  ; $04 = 512KB (32 banks)

HeaderRAMSize::
    db $02

HeaderDestinationCode::
    db $01

HeaderOldLicenseeCode::
    db $33

HeaderMaskROMVersion::
    db $00

HeaderComplementCheck::
    db $08

HeaderGlobalChecksum::
    db $5c, $63

