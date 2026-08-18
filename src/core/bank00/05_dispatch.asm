; ============================================================================
; bank00/05_dispatch.asm — $1c56-$2041: DispatchBankRoutine + object/utility helpers
; Part of SECTION "ROM Bank $000"; included in order by bank00_core_engine.asm.
; ============================================================================
ASSERT @ == $1c56 ; DispatchBankRoutine, cross-bank dispatcher
DispatchBankRoutine:
    call GBC_ChrHook            ; was: ld hl,$1c73 (3 bytes; hook redoes it and
                                ; reroutes the final ret through GBC_ChrPatchRet)
    ld d, $00
    ld e, a
    sla e
    rl d
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [hl+]
    rst $10
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [de]
    inc de
    jp Jump_000_1d14


    ret


    and c
    inc e
    and [hl]
    inc e
    xor e
    inc e
    or b
    inc e
    or l
    inc e
    cp d
    inc e
    cp a
    inc e
    call nz, $c91c
    inc e
    adc $1c
    db $d3
    inc e
    ret c

    inc e
    db $dd
    inc e
    ldh [c], a
    inc e
    rst $20
    inc e
    db $ec
    inc e
    pop af
    inc e
    or $1c
    ei
    inc e
    nop
    dec e
    dec b
    dec e
    ld a, [bc]
    dec e
    rrca
    dec e
    dec c
    nop
    ld b, b
    nop
    adc b
    dec c
    sbc l
    ld c, b
    nop
    adc b
    ld c, $40
    ld e, d
    nop
    adc b
    ld c, $02
    ld h, d
    nop
    adc b
    ld c, $ac
    ld l, d
    nop
    add b
    dec c
    ld a, b
    ld c, [hl]
    nop
    adc b
    ld c, $40
    ld e, d
    nop
    add b
    ld c, $9f
    ld e, a
    nop
    adc b
    ld c, $95
    ld [hl], l
    nop
    adc b
    ld c, $a4
    ld [hl], h
    ret nz

    add [hl]
    dec c
    ld c, b
    ld l, b
    nop
    adc b
    dec c
    ld [hl], l
    ld d, l
    nop
    sub b
    dec c
    and b
    ld e, c
    nop
    sub b
    dec c
    ld l, h
    ld e, [hl]
    nop
    sub b
    dec c
    ld l, e
    ld h, e
    nop
    sub b
    dec c
    call Call_000_006b
    adc b
    dec c
    or h
    ld [hl], h
    nop
    adc b
    inc c
    nop
    ld b, b
    nop
    sub b
    rrca
    ldh [$ff57], a
    nop
    sub b
    inc c
    or [hl]
    ld c, c
    nop
    sub b
    inc c
    ei
    ld b, h
    nop
    sub b
    ld c, $5f
    ld l, h
    nop
    adc b
    ld c, $93
    ld [hl], b
    nop
    sub b

Jump_000_1d14:
    ld a, h
    ld [$c67a], a
    ld a, l
    ld [$c67b], a
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    inc de

Jump_000_1d22:
    ld a, b
    or c
    jp z, Jump_000_1dc7

    ld a, [de]
    ld [$c679], a
    inc de
    ld a, [de]
    ld [$c678], a
    inc de
    ld a, $11
    ld [$c677], a

Jump_000_1d36:
    ld a, b
    or c
    jp z, Jump_000_1dc7

    ld a, [$c677]
    dec a
    jp z, Jump_000_1d22

    ld [$c677], a
    push de
    ld a, [$c678]
    ld d, a
    ld a, [$c679]
    ld e, a
    srl d
    ld a, d
    ld [$c678], a
    rr e
    ld a, e
    ld [$c679], a
    jp c, Jump_000_1d78

    pop de
    ld a, [$c67a]
    ld h, a
    ld a, [$c67b]
    ld l, a
    ld a, [de]
    call Call_000_20da
    ld [hl+], a
    ld a, h
    ld [$c67a], a
    ld a, l
    ld [$c67b], a
    dec bc
    inc de
    jp Jump_000_1d36


Jump_000_1d78:
    pop de
    push de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    and $07
    ld h, a
    ld a, [de]
    srl a
    srl a
    srl a
    and $1f
    add $03
    ld [$c676], a
    ld a, h
    cpl
    ld d, a
    ld a, l
    cpl
    ld e, a
    ld a, [$c67a]
    ld h, a
    ld a, [$c67b]
    ld l, a
    add hl, de
    push hl
    pop de
    ld a, [$c67a]
    ld h, a
    ld a, [$c67b]
    ld l, a

Jump_000_1da8:
    call Call_000_20da
    ld a, [de]
    ld [hl+], a
    dec bc
    inc de
    ld a, [$c676]
    dec a
    ld [$c676], a
    jp nz, Jump_000_1da8

    ld a, h
    ld [$c67a], a
    ld a, l
    ld [$c67b], a
    pop de
    inc de

Jump_000_1dc3:
    inc de
    jp Jump_000_1d36


Jump_000_1dc7:
    ret


    ld a, [$c5c5]
    ld b, a
    ld c, $06

jr_000_1dce:
    add b
    dec c
    jr nz, jr_000_1dce

    ld c, a
    ld a, [$c5db]
    add c
    ld [$c5c5], a
    ret


ClearObjectFields:
    ld hl, $0008
    add hl, de
    ld [hl], $00
    ld hl, $0009
    add hl, de
    ld [hl], $00
    ld hl, $000a
    add hl, de
    ld [hl], $00
    ld hl, $000b
    add hl, de
    ld [hl], $00
    ld hl, $000c
    add hl, de
    ld [hl], $00
    inc hl
    ld [hl], $00
    ld hl, $000e
    add hl, de
    ld [hl], $00
    inc hl
    ld [hl], $00
    ld hl, $0010
    add hl, de
    ld [hl], $00
    ld hl, $0007
    add hl, de
    ld [hl], a
    ld hl, $0006
    add hl, de
    ld [hl], $01
    ret


Call_000_1e17:
    ld a, $0b
    rst $10
    ld a, $19
    ld [$c5a0], a
    ld de, $c0a0

jr_000_1e22:
    ld hl, $0006
    add hl, de
    ld a, [hl]
    or a
    call nz, Call_000_1e44
    ld h, $00
    ld l, $20
    add hl, de
    ld d, h
    ld e, l
    ld a, [$c5a0]
    dec a
    ld [$c5a0], a
    jr nz, jr_000_1e22

    ld a, $00
    ld [$c63f], a
    ld a, $01
    rst $18
    ret


Call_000_1e44:
    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    ret z

    ld hl, $000b
    add hl, de
    ld a, [hl]
    or a
    jr z, jr_000_1e64

    ld a, [$c63f]
    or a
    ret nz

    ld a, $01
    ld [$c63f], a
    push de
    call Call_000_1fa0
    pop de
    ret


jr_000_1e64:
    ld hl, $0008
    add hl, de
    ld a, [hl]
    or a
    jr z, jr_000_1e6f

    dec a
    ld [hl], a
    ret


jr_000_1e6f:
    ld hl, $0006
    add hl, de
    ld a, [hl]
    cp $01
    jr z, jr_000_1e7d

    ld a, [$c63f]
    or a
    ret nz

jr_000_1e7d:
    ld [hl], $02
    ld a, $01
    ld [$c63f], a
    ld hl, $0007
    add hl, de
    ld a, [hl]
    ld hl, $52b0
    ld c, a
    ld b, $00
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld b, [hl]
    ld c, a

Jump_000_1e97:
    ld hl, $0009
    add hl, de
    ld a, [hl]
    ld h, $00
    ld l, a
    add hl, bc
    ld a, [hl]
    cp $00
    jp z, Jump_000_1eb8

    cp $fe
    jp z, Jump_000_1f18

    ld hl, $000a
    add hl, de
    ld [hl], $ff
    ld hl, $0006
    add hl, de
    ld [hl], $00
    ret


Jump_000_1eb8:
    inc hl
    push hl
    ld a, [hl]
    ld hl, $0008
    add hl, de
    ld [hl], a
    pop hl
    push de
    inc hl
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld e, a
    push hl
    push bc
    call Call_000_1f2a
    pop bc
    pop hl
    pop de
    ld a, [$c659]
    or a
    jr nz, jr_000_1ee9

    ld a, [hl]
    ld hl, $0004
    add hl, de
    ld [hl], a
    ld hl, $0009
    add hl, de
    ld a, [hl]
    add $05
    ld [hl], a
    ld a, $01
    ld [RENDER_REQUEST], a
    ret


jr_000_1ee9:
    ld a, [hl]
    ld hl, $0010
    add hl, de
    ld [hl], a
    ld hl, $0009
    add hl, de
    ld a, [hl]
    add $05
    ld [hl], a
    ld a, [$c659]
    ld hl, $000b
    add hl, de
    ld [hl], a
    ld bc, $c64b
    ld a, [bc]
    ld hl, $000c
    add hl, de
    ld [hl+], a
    inc bc
    ld a, [bc]
    ld [hl], a
    ld bc, $c64d
    ld a, [bc]
    ld hl, $000e
    add hl, de
    ld [hl+], a
    inc bc
    ld a, [bc]
    ld [hl], a
    ret


Jump_000_1f18:
    inc hl
    ld a, [hl]
    push bc
    ld b, a
    add b
    add b
    add b
    add b
    pop bc
    ld hl, $0009
    add hl, de
    ld [hl], a
    jp Jump_000_1e97


    ret


Call_000_1f2a:
    ld a, BANK_SPRITE_GFX       ; was: ld a,$0a (sprite gfx table relocated to
                                ; bank $11, generated from tools/gfx/sprites)
    rst $10
    ld hl, $4000
    ld c, d
    ld b, $00
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld b, [hl]
    ld c, a
    ld hl, $8000
    ld d, $00
    sla e
    rl d
    sla e
    rl d
    sla e
    rl d
    sla e
    rl d
    add hl, de
    ld a, [bc]
    push bc
    ld c, a
    ld b, $0a
    sub b
    jr c, jr_000_1f60

    ld [$c659], a
    ld a, $0a
    jr jr_000_1f66

jr_000_1f60:
    ld a, $00
    ld [$c659], a
    ld a, c

jr_000_1f66:
    pop bc
    ld e, a
    ld d, $00
    sla e
    rl d
    sla e
    rl d
    sla e
    rl d
    sla e
    rl d
    inc bc

jr_000_1f7b:
    ld a, [bc]
    call Call_000_20da
    ld [hl+], a
    inc bc
    dec de
    ld a, d
    or e
    jr nz, jr_000_1f7b

    ld a, [$c659]
    or a
    jr z, jr_000_1f9c

    ld de, $c64b
    ld a, b
    ld [de], a
    inc de
    ld a, c
    ld [de], a
    ld de, $c64d
    ld a, h
    ld [de], a
    inc de
    ld a, l
    ld [de], a

jr_000_1f9c:
    ld a, $0b
    rst $18
    ret


Call_000_1fa0:
    ld a, BANK_SPRITE_GFX       ; was: ld a,$0a (see Call_000_1f2a)
    rst $10
    push de
    ld hl, $000c
    add hl, de
    ld a, [hl+]
    ld b, a
    ld a, [hl]
    ld c, a
    ld hl, $000e
    add hl, de
    ld a, [hl+]
    ld l, [hl]
    ld h, a
    push hl
    ld hl, $000b
    add hl, de
    ld a, [hl]
    pop hl
    push bc
    ld c, a
    ld b, $0a
    sub b
    jr c, jr_000_1fc8

    ld [$c659], a
    ld a, $0a
    jr jr_000_1fce

jr_000_1fc8:
    ld a, $00
    ld [$c659], a
    ld a, c

jr_000_1fce:
    pop bc
    ld e, a
    ld d, $00
    sla e
    rl d
    sla e
    rl d
    sla e
    rl d
    sla e
    rl d

jr_000_1fe2:
    ld a, [bc]
    call Call_000_20da
    ld [hl+], a
    inc bc
    dec de
    ld a, d
    or e
    jr nz, jr_000_1fe2

    ld a, [$c659]
    or a
    jr nz, jr_000_200c

    pop de
    ld hl, $0010
    add hl, de
    ld a, [hl]
    ld hl, $0004

Jump_000_1ffc:
    add hl, de
    ld [hl], a
    ld hl, $000b
    add hl, de
    ld [hl], $00
    ld a, $01
    ld [RENDER_REQUEST], a
    jp Jump_000_203d


jr_000_200c:
    ld de, $c64b
    ld a, h
    ld [de], a
    inc de
    ld a, l
    ld [de], a
    ld de, $c64d
    ld a, b
    ld [de], a
    inc de
    ld a, c
    ld [de], a
    pop de
    ld a, [$c659]

Jump_000_2020:
    ld hl, $000b
    add hl, de
    ld [hl], a
    ld bc, $c64b
    ld a, [bc]
    ld hl, $000c
    add hl, de
    ld [hl+], a
    inc bc
    ld a, [bc]
    ld [hl], a
    ld bc, $c64d
    ld a, [bc]
    ld hl, $000e
    add hl, de
    ld [hl+], a
    inc bc
    ld a, [bc]
    ld [hl], a

Jump_000_203d:
    ld a, $0b
    rst $18
    ret


