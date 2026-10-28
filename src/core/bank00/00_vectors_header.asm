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
    jp LinkTimerStart           ; was: jp Jump_000_21c1 (same one-shot, guarded)


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

ASSERT @ == $0081 ; start of the former nop padding $0081-$00ff
; ----------------------------------------------------------------------------
; The old labels in this padding are only referenced as data bytes from the
; tile / level banks ("jp $00ff" etc. are graphics). They stay as address
; constants so those bytes do not move; the space holds the link routines.
; ----------------------------------------------------------------------------
DEF Call_000_0081 EQU $0081
DEF Jump_000_0081 EQU $0081
DEF Jump_000_0082 EQU $0082
DEF Call_000_0084 EQU $0084
DEF Call_000_008d EQU $008d
DEF Call_000_0093 EQU $0093
DEF Jump_000_00aa EQU $00aa
DEF Jump_000_00bc EQU $00bc
DEF Jump_000_00c0 EQU $00c0
DEF Jump_000_00c3 EQU $00c3
DEF Call_000_00c8 EQU $00c8
DEF Call_000_00cc EQU $00cc
DEF Jump_000_00e0 EQU $00e0
DEF Call_000_00f7 EQU $00f7
DEF Jump_000_00fc EQU $00fc
DEF Call_000_00ff EQU $00ff
DEF Jump_000_00ff EQU $00ff

; ----------------------------------------------------------------------------
; Non-blocking link. The original VS code expects every link byte to arrive
; within the frame it was sent, as on a cable (~1 ms). Over a wireless link
; (Shiny Relay's LINK CABLE mode: the Chromatic holds a byte until the
; partner's console answered, one network round trip) that is not true, so
; each place that assumed it now looks again on the next frame instead:
;   - VS substate 1 waits while our handshake byte is still out
;     (LinkHandshakeWait) instead of giving up after one frame;
;   - the per-frame slave re-arm leaves the port alone while our own byte is
;     out (LinkArmGate): a write there would stall the CPU for a round trip;
;   - when messages wait, the next byte goes out ~3 ms after an exchange
;     (LinkPacketEnd + LinkTimerStart) instead of at the next VBlank, so a
;     round trip per byte no longer leaves the message rings behind;
;   - VS drops to the title after LINK_TIMEOUT silent frames, not 15.
; ----------------------------------------------------------------------------

; Is our master byte still out? (SC = $81 until it completes; a Wi-Fi link
; keeps it so for a whole round trip.) Z set = yes.
LinkMasterOut:
    ldh a, [rSC]
    and $81
    cp $81
    ret

; VS substate 1 (was: ld a,[$d605], "did the partner answer?"). A = LINK_UP
; as before once the handshake byte is back; while it is still out, return
; straight from the substate handler and look again next frame.
LinkHandshakeWait:
    ld a, [LINK_UP]
    and a
    ret nz                      ; linked
    call LinkMasterOut
    ld a, $00
    ret nz                      ; answered without a partner: as before
    pop af                      ; drop the return into the handler: stay
    ret

; Call_000_221f, once per frame while unlinked (was: ld a,[$d605]): non-zero
; skips its re-arm (SB = $DD, SC = $80).
LinkArmGate:
    call LinkMasterOut
    ld a, $01
    ret z                       ; our handshake byte is out: leave the port
    ld a, [LINK_UP]
    ret

; Serial IRQ, end of a packet (was: call Call_000_2271, the next message).
; When this side clocks next and a message is waiting on either side, clock
; it LINK_RESTART_TIMA ticks from now (timer one-shot) instead of at the next
; VBlank. Idle links keep the original one byte per VBlank.
LinkPacketEnd:
    call Call_000_2271
    ld a, [LINK_CLOCKS]
    and a
    ret z                       ; the partner clocks the next byte
    ldh a, [rSB]                ; our byte for it (a message?)
    ld hl, LINK_RX_PACKET       ; the partner's byte we just got
    or [hl]
    ld hl, LINK_TX_PACKET       ; our message after that
    or [hl]
    ret z
    ld a, $01
    ld [LINK_BUSY], a           ; Call_000_2105 must not start it meanwhile
    ld a, LINK_RESTART_TIMA
    ldh [rTIMA], a
    ld a, $06                   ; timer on, 65536 Hz
    ldh [rTAC], a
    ret

; Timer IRQ (was: jp Jump_000_21c1, the same one-shot "SC = $81"): stops the
; timer, then clocks the byte LinkPacketEnd scheduled, if the link is still
; up and still ours to clock.
LinkTimerStart:
    push af
    xor a
    ldh [rTAC], a
    ld a, [LINK_UP]
    and a
    jr z, .drop
    ld a, [LINK_CLOCKS]
    and a
    jr z, .drop
    ld a, $81
    ldh [rSC], a
    pop af
    reti
.drop:
    xor a
    ld [LINK_BUSY], a
    pop af
    reti

; VS round result and set winner screens (was: ldh a,[$ff8d] / and $01, "A
; pressed?"). A continues as before. B quits VS: it sends $FF, which the
; partner's IncrementAttractCounter already reads as "link gone", and takes the
; same exit here (fade, link reset, title). The original loops set after set,
; so a pulled cable was the only way out. Z set = stay on the screen.
LinkAOrQuit:
    ldh a, [$ff8d]
    bit 1, a
    jr nz, .quit
    and $01
    ret
.quit:
    ld a, $ff
    ld [$d62d], a
    call Jump_000_187e
    xor a
    ret

; VBlank, Call_000_2105 after its checks (was: ld a,[$d604] / and a / ret nz /
; ld a,$81 / ldh [rSC],a). The VBlank handler runs it with interrupts on, so
; the serial IRQ of a byte that just came back could hand the turn to the
; partner between the checks and the start: both consoles then clocked, none
; listened, and VS dropped to the title 1.5 s later. A Wi-Fi byte comes back
; at any point of the frame, so this happened within minutes. Now: interrupts
; off, look again, and leave a finished byte (SC bit 7 off) to its IRQ.
LinkVBlankStart:
    di
    ld a, [LINK_CLOCKS]
    and a
    jr z, .done
    ldh a, [rSC]
    add a                       ; carry = SC bit 7
    jr nc, .done
    ld a, $81
    ldh [rSC], a
.done:
    reti                        ; ei + ret

    ASSERT @ <= $0100, "link routines overflowed the vector padding"
    ds $0100 - @, 0

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

