; ============================================================================
; BANK $0A - Level Data
; ============================================================================
; Address: $4000-$7FFF (switchable)
;
; Level layout data and graphics assets.
;
; ============================================================================
; Originally disassembled with mgbdis v3.0 by Matt Currie

SECTION "ROM Bank $00a", ROMX[$4000], BANK[$a]

    db $10
    ld b, c
    ld d, c
    ld b, c
    or d
    ld b, c
    inc de
    ld b, d
    ld d, h
    ld b, d
    sub l
    ld b, d
    sub $42
    rla
    ld b, e
    ld e, b
    ld b, e
    sbc c
    ld b, e
    jp c, $1b43

    ld b, h
    ld e, h
    ld b, h
    sbc l
    ld b, h
    sbc $44
    rra
    ld b, l
    ld h, b
    ld b, l
    ld hl, $6246
    ld b, [hl]
    and e
    ld b, [hl]
    db $e4
    ld b, [hl]
    dec h
    ld b, a
    ld h, [hl]
    ld b, a
    rst $00
    ld b, a
    ld [$4948], sp
    ld c, b
    xor d
    ld c, b
    dec bc
    ld c, c
    ld c, h
    ld c, c
    call $0e49
    ld c, d
    ld c, a
    ld c, d
    sub b
    ld c, d
    pop de
    ld c, d
    ld [de], a
    ld c, e
    ld [hl], e
    ld c, e
    ld [hl], h
    ld c, h
    or l
    ld c, h
    halt
    ld c, l
    or a
    ld c, l
    ld hl, sp+$4d
    add hl, sp
    ld c, [hl]
    ld a, d
    ld c, [hl]
    cp e
    ld c, [hl]
    db $fc
    ld c, [hl]
    dec a
    ld c, a
    ld a, [hl]
    ld c, a
    rst $18
    ld c, a
    jr nz, jr_00a_40b2

    or c
    ld d, b
    ld b, d
    ld d, c
    add e
    ld d, c
    ld b, h
    ld d, d
    ld h, l
    ld d, e
    add $53
    ld d, a
    ld d, h
    add sp, $54
    jp hl


    ld d, h
    ld [$eb54], a
    ld d, h
    db $ec
    ld d, h
    db $ed
    ld d, h
    xor $54
    rst $28
    ld d, h
    ldh a, [rHDMA4]
    ldh a, [rHDMA4]
    ldh a, [rHDMA4]
    ldh a, [rHDMA4]
    ldh a, [rHDMA4]
    ldh a, [rHDMA4]
    ldh a, [rHDMA4]
    ldh a, [rHDMA4]
    ldh a, [rHDMA4]
    ldh a, [rHDMA4]
    ldh a, [rHDMA4]
    ldh a, [rHDMA4]
    ldh a, [rHDMA4]
    ldh a, [rHDMA4]
    ldh a, [rHDMA4]
    ldh a, [rHDMA4]
    ldh a, [rHDMA4]
    ld [hl], c
    ld d, l
    ld [hl], c
    ld d, l
    ld [hl], c
    ld d, l
    ld [hl], c
    ld d, l
    ld [hl], c
    ld d, l
    ld [hl], c
    ld d, l
    ld [hl], c
    ld d, l
    ld [hl], c
    ld d, l

jr_00a_40b2:
    ld [hl], c
    ld d, l
    ld [hl], c
    ld d, l
    ld [hl], c
    ld d, l
    ld [hl], c
    ld d, l
    ld [hl], c
    ld d, l
    ld [hl], c
    ld d, l
    ld [hl], c
    ld d, l
    ld [hl], c
    ld d, l
    or d
    ld d, l
    di
    ld d, l
    inc [hl]
    ld d, [hl]
    ld [hl], l
    ld d, [hl]
    or [hl]
    ld d, [hl]
    rst $30
    ld d, [hl]
    jr c, jr_00a_4127

    ld a, c
    ld d, a
    cp d
    ld d, a
    ei
    ld d, a
    inc a
    ld e, b
    ld a, l
    ld e, b
    cp [hl]
    ld e, b
    rst $38
    ld e, b
    ld b, b
    ld e, c
    add c
    ld e, c
    jp nz, Jump_000_0359

    ld e, d
    ld b, h
    ld e, d
    add l
    ld e, d
    add $5a
    rlca
    ld e, e
    ld c, b
    ld e, e
    adc c
    ld e, e
    jp z, $0b5b

    ld e, h
    ld c, h
    ld e, h
    adc l
    ld e, h
    adc $5c
    rrca
    ld e, l
    ld d, b
    ld e, l
    sub c
    ld e, l
    jp nc, Jump_000_135d

    ld e, [hl]
    sub h
    ld e, [hl]
    sub h
    ld e, [hl]
    sub h
    ld e, [hl]
    sub h
    ld e, [hl]
    sub h
    ld e, [hl]
    inc b
    rrca
    rrca
    ccf
    ccf
    ld a, a
    ld a, a
    rst $08
    rst $38
    rst $20
    sbc a
    rst $20
    sbc a
    rst $20
    sbc a
    rst $28
    sbc [hl]
    ldh a, [$fff0]
    db $fc
    db $ec
    cp $e2

jr_00a_4127:
    rst $38
    rst $38
    rst $38
    add c
    rst $38
    add c
    rst $38
    rst $38
    rst $38
    ld bc, $9eef
    rst $28
    sbc a
    rst $38
    sbc b
    rst $38
    sbc b
    rst $38
    cp a
    rst $38
    and b
    rst $38
    and b
    rst $38
    rst $38
    rst $38
    ld bc, $ffff
    rst $38
    ld bc, $01ff
    rst $38
    rst $38
    rst $38
    ld bc, $01ff
    rst $38
    rst $38
    ld b, $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc bc
    inc bc
    rrca
    inc c
    ccf
    inc sp
    rst $38
    db $f4
    nop
    nop
    nop
    nop
    nop
    nop
    cp $fe
    db $fc
    ld c, h
    ldh a, [$ff90]
    ldh [rNR41], a
    ret nz

    ret nz

    inc bc
    inc bc
    rrca
    inc c
    ccf
    jr nc, jr_00a_4198

    inc c
    inc bc
    ld [bc], a
    ld bc, $0001
    nop
    nop
    nop
    ld a, a
    ld sp, hl
    ld a, [hl]
    ldh a, [c]
    inc a
    db $ec

jr_00a_4198:
    or b
    ld [hl], b
    ldh [$ff60], a
    add b
    add b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld b, $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $0300
    nop
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    ld [$0000], sp
    nop
    inc hl
    nop
    add [hl]
    nop
    inc e
    nop
    ld bc, $0600
    nop
    jr jr_00a_41da

jr_00a_41da:
    jr nc, jr_00a_41dc

jr_00a_41dc:
    ret nz

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc bc
    nop
    ld b, $00
    jr jr_00a_41ee

jr_00a_41ee:
    ld h, b
    nop
    add b
    nop
    nop
    nop
    ld [hl], b
    nop
    jp nz, $8800

    nop
    nop
    nop
    sub b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc b
    nop
    nop
    jr nc, jr_00a_4248

    ld a, h
    ld e, h
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_00a_4248:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc b
    nop
    nop
    db $10
    db $10
    inc a
    inc l
    ld e, [hl]
    halt
    ld e, [hl]
    ld a, [hl]
    cp $e0
    cp $de
    ld hl, sp-$08
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc b
    inc bc
    inc bc
    rrca
    dec c
    rra
    ld [de], a
    ccf
    inc h
    ccf
    cpl
    db $fc
    ei
    jr c, jr_00a_42e3

    ccf
    ccf
    ret nz

    ret nz

    ldh a, [$ffb0]
    ld hl, sp+$48
    db $fc
    inc h
    db $fc
    db $e4
    ld a, a
    rst $38
    ld [hl], h
    db $fc
    db $fc
    db $fc
    jr jr_00a_42d7

    ld [$1f0f], sp
    rra
    daa
    ccf
    daa
    ccf
    rra
    inc e
    rra
    rra
    ld bc, $7801
    ld hl, sp+$10
    ldh a, [$fff8]
    add sp, -$04
    inc e
    db $f4
    db $fc
    ld hl, sp+$38
    ld hl, sp-$28
    ldh a, [$fff0]
    inc b

jr_00a_42d7:
    nop
    nop
    inc bc
    inc bc
    rrca
    dec c
    rra
    ld [de], a
    ccf
    inc h
    ccf
    cpl

jr_00a_42e3:
    db $fc
    ei
    jr c, jr_00a_4326

    nop
    nop
    ret nz

    ret nz

    ldh a, [$ffb0]
    ld hl, sp+$48
    db $fc
    inc h
    db $fc
    db $e4
    ld a, a
    rst $38
    ld [hl], h
    db $fc
    ccf
    ccf
    jr jr_00a_431a

    ld [$1f0f], sp
    rla
    cpl
    dec sp
    cpl
    ccf
    ccf
    jr nc, jr_00a_4385

    ld e, a
    db $fc
    db $fc
    ld a, b
    ld hl, sp+$10
    ldh a, [$fff8]
    add sp, -$0c
    inc a
    db $e4
    db $fc
    ld hl, sp+$38
    db $fc
    db $f4
    inc b
    nop
    nop

jr_00a_431a:
    inc bc
    inc bc
    rrca
    inc c
    rra
    ld de, $223f
    rst $38
    cp $e7
    rst $18

jr_00a_4326:
    rst $08
    rst $38
    nop
    nop
    ret nz

    ret nz

    ldh a, [$fff0]
    ld hl, sp+$18
    db $fc
    inc d
    db $fc
    inc d
    db $fc
    call nc, $ff3f
    cp a
    rst $38
    ld d, a
    ld a, a
    ld a, b
    ld l, a
    ccf
    daa
    rra
    dec de
    rra
    rra
    ccf
    jr nc, jr_00a_43c6

    ld e, a
    inc c
    db $fc
    adc b
    ld hl, sp+$10
    ldh a, [$fff8]
    add sp, -$0c
    inc a
    db $e4
    db $fc
    ld hl, sp+$38
    db $fc
    db $f4
    inc b
    nop
    nop
    rlca
    rlca
    rra
    ld e, $3f
    add hl, hl
    ld a, a
    ld d, b
    ld a, a
    ld d, b
    ld a, a
    ld d, a
    ld sp, hl
    rst $38
    nop
    nop
    add b
    add b
    ldh [$ff60], a
    ldh a, [rNR10]
    ld hl, sp-$78
    cp $fe
    adc $f6
    and $fe
    ld h, c
    ld a, a
    inc hl
    ccf
    db $10
    rra
    ccf
    cpl
    ld e, a
    ld a, c
    ld c, a
    ld a, a

jr_00a_4385:
    ccf
    jr c, jr_00a_4407

    ld e, a
    ld a, [$d4fe]
    db $fc
    inc a
    db $ec
    ld hl, sp-$38
    ldh a, [$ffb0]
    ldh a, [$fff0]
    ld hl, sp+$18
    db $fc
    db $f4
    inc b
    nop
    nop
    inc bc
    inc bc
    rrca
    inc c
    rra
    ld de, $223f
    rst $38
    cp $67
    ld e, a
    ld c, a
    ld a, a
    nop
    nop
    ret nz

    ret nz

    ldh a, [$fff0]
    ld hl, sp+$18
    db $fc
    inc d
    db $fc
    inc d
    db $fc
    call nc, $ff3f
    ccf
    ccf
    rla
    rra
    jr c, @+$41

    ld c, a
    ld a, a
    ld l, a
    ld a, h
    ld a, a
    ld e, a

jr_00a_43c6:
    ld a, a
    ld a, b
    ccf
    ccf
    inc c
    db $fc
    sbc b
    ld hl, sp+$10
    ldh a, [$fff8]
    add sp, -$0c
    ld e, h
    db $e4
    db $fc
    ld hl, sp+$38
    ld hl, sp-$28
    inc b
    inc bc
    inc bc
    rrca
    inc c
    rra
    ld de, $223f
    rst $38
    cp $67
    ld e, a
    ld c, a
    ld a, a
    ccf
    ccf
    ret nz

    ret nz

    ldh a, [$fff0]
    ld hl, sp+$18
    db $fc
    inc d
    db $fc
    inc d
    db $fc
    call nc, $ff3f
    inc c
    db $fc
    rla
    rra
    ld [$070f], sp
    rlca
    rrca
    inc c
    rrca
    rrca
    ld e, $13

jr_00a_4407:
    rrca
    rrca
    rrca
    dec bc
    sbc b
    ld hl, sp+$10
    ldh a, [$ffe0]
    ldh [$fff0], a
    ld d, b
    ldh a, [$fff0]
    ld a, b
    ret z

    ldh a, [$fff0]
    ldh [$ffa0], a
    inc b
    nop
    nop
    inc bc
    inc bc
    rrca
    inc c
    rra
    ld de, $223f
    rst $38
    cp $67
    ld e, a
    ld c, a
    ld a, a
    nop
    nop
    ret nz

    ret nz

    ldh a, [$fff0]
    ld hl, sp+$18
    db $fc
    inc d
    db $fc
    inc d
    db $fc
    call nc, $ff3f
    ccf
    ccf
    rla
    rra
    jr c, jr_00a_4481

    ld l, a
    ld a, a
    ld c, a
    ld a, b
    ld a, a
    ld a, a
    ld a, a
    ld e, b
    ccf
    ccf
    inc c
    db $fc
    sbc b
    ld hl, sp+$30
    ldh a, [$ffe8]
    ld hl, sp-$0c
    inc e
    db $fc
    db $fc
    ld hl, sp+$58
    cp b
    cp b
    inc b
    nop
    nop
    rlca
    rlca
    ld e, a
    ld e, c
    ccf
    ld [hl+], a
    ld a, a
    ld [hl], h
    rst $18
    cp [hl]
    adc a
    rst $38
    ld e, [hl]
    ld a, a
    nop
    nop
    add b
    add b
    ldh [$ffe0], a
    ldh a, [$ff30]
    ld hl, sp+$28
    ld hl, sp+$28
    ld hl, sp-$58
    ld hl, sp-$08
    ld a, $3f
    ld h, a
    ld a, a

jr_00a_4481:
    or b
    rst $38
    sbc a
    rst $38
    ld e, a
    ld [hl], c
    ccf
    ccf
    ccf
    jr c, @+$81

    ld e, a
    ld e, $fe
    jr nc, jr_00a_4481

    ld h, b
    ldh [$fff0], a
    ldh a, [$fff8]
    jr @-$06

    ld hl, sp-$08
    ld a, b
    ldh a, [$ffb0]
    inc b
    nop
    nop
    inc bc
    inc bc
    rrca
    dec c
    rra
    ld [de], a
    ccf
    inc h
    ccf
    dec h
    ld a, $27
    cp $ff
    nop
    nop
    ret nz

    ret nz

    ldh a, [$ffb0]
    ld hl, sp+$48
    db $fc
    inc h
    db $fc
    db $e4
    ccf
    rst $18
    inc e
    db $fc
    ccf
    ccf
    inc e
    rra
    ld [$1f0f], sp
    rla
    rra
    ld a, [de]
    rla
    rra
    inc sp
    ld a, $7f
    ld e, a
    ld hl, sp-$08
    inc e
    db $fc
    db $10
    ldh a, [$fff8]
    add sp, -$04
    call c, $fcf4
    ld hl, sp+$18
    db $fc
    db $f4
    inc b
    inc bc
    inc bc
    rrca
    inc c
    rra
    ld de, $223f
    rst $38
    cp $67
    ld e, a
    ld c, a
    ld a, a
    ccf
    ccf
    ret nz

    ret nz

    ldh a, [$fff0]
    ld hl, sp+$18
    db $fc
    inc d
    db $fc
    inc d
    db $fc
    call nc, $ff3f
    inc c
    db $fc
    rla
    rra
    ld [$070f], sp
    rlca
    rrca
    inc c
    cpl
    cpl
    ccf
    jr c, jr_00a_4523

    rla
    rlca
    rlca
    sbc b
    ld hl, sp+$10
    ldh a, [$ffe0]
    ldh [$fff7], a
    sub a
    rst $30
    rst $30
    rst $08
    ld a, e
    cp $fe
    ld [hl], b
    ld [hl], b
    inc b
    inc bc
    inc bc
    rrca

jr_00a_4523:
    inc c
    rst $18
    pop de
    ld a, a
    ld [hl], d
    ccf
    ld a, $67
    ld e, a
    ld c, a
    ld a, a
    ccf
    ccf
    ret nz

    ret nz

    ldh a, [$fff0]
    ld hl, sp+$18
    db $fc
    inc d
    db $fc
    inc d
    db $fc
    call nc, $fc7c
    ccf
    rst $38
    rla
    rra
    ld [$070f], sp
    rlca
    ld l, a
    ld l, h
    ld a, a
    ld e, e
    ld a, a
    ld a, h
    dec sp
    dec sp
    rlca
    rlca
    db $e4
    db $fc
    db $e4
    cp h
    ld hl, sp-$68
    ldh a, [$ff50]
    ldh a, [$fff0]
    ld a, [$f04a]
    ldh a, [$ff98]
    sbc b
    inc c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    stop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_00a_457a

jr_00a_457a:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    stop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [bc], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    stop
    nop
    nop
    nop
    inc bc
    inc bc
    rrca
    dec c
    rra
    ld [de], a
    ccf
    inc h
    ccf
    inc h
    rst $38
    rst $38
    ld l, $3d
    nop
    nop
    ret nz

    ret nz

    ldh a, [$ffb0]
    ld hl, sp+$48
    db $fc
    inc h
    db $fc
    inc h
    rst $38
    rst $38
    inc [hl]
    db $fc
    nop
    nop
    nop
    nop
    nop
    ld b, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [$0000], sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc a
    ccf
    ld a, a
    ld a, a
    sbc c
    rst $38
    sbc l
    rst $30
    ld a, [hl]
    ld a, e
    ld a, a
    ld l, a
    ccf
    inc a
    rra
    rra
    inc a
    db $fc
    cp $fe
    sbc c
    rst $38
    cp c
    rst $28
    ld a, [hl]
    sbc $fe
    or $fc
    inc a
    ld hl, sp-$08
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc b
    nop
    nop
    inc bc
    inc bc
    rrca
    dec c
    rra
    ld [de], a
    ccf
    inc h
    ccf
    inc h
    rst $38
    rst $38
    sbc [hl]
    db $fd
    nop
    nop
    ret nz

    ret nz

    ldh a, [$ffb0]
    ld hl, sp+$48
    db $fc
    inc h
    db $fc
    inc h
    rst $38
    rst $38
    add hl, sp
    rst $38
    sbc h
    rst $38
    ld a, a
    ld a, a
    ld a, c
    ld e, a
    ld a, l
    ld [hl], a
    ld a, [hl]
    ld a, e
    ld a, a
    ld a, a
    dec sp
    dec sp
    nop
    nop
    add hl, sp
    rst $38
    cp $fe
    sbc [hl]
    ld a, [$eebe]
    ld a, [hl]
    sbc $fe
    cp $dc
    call c, RST_00
    inc b
    nop
    nop
    inc bc
    inc bc
    rrca
    dec c
    rra
    ld [de], a
    ccf
    inc h
    ccf
    inc h
    rst $38
    rst $38
    ld l, $3d
    nop
    nop
    ret nz

    ret nz

    ldh a, [$ffb0]
    ld hl, sp+$48
    db $fc
    inc h
    db $fc
    inc h
    rst $38
    rst $38
    inc [hl]
    db $fc
    inc a
    ccf
    ccf
    ccf
    ld a, c
    ld a, a
    sbc l
    rst $30
    sbc [hl]
    ei
    ld a, a
    ld a, a
    ccf
    inc l
    ccf
    ccf
    inc a
    db $fc
    db $fc
    db $fc
    sbc [hl]
    cp $b9
    rst $28
    ld a, c
    rst $18
    cp $fe
    db $fc
    inc [hl]
    db $fc
    db $fc
    inc b
    nop
    nop
    inc bc
    inc bc
    rrca
    dec c
    rra
    ld [de], a
    ccf
    inc h
    ccf
    inc h
    rst $38
    rst $38
    jr c, jr_00a_46f3

    nop
    nop
    ret nz

    ret nz

    ldh a, [$ffb0]
    ld hl, sp+$48
    db $fc
    inc h
    db $fc
    inc h
    db $fc
    db $e4
    ld a, a
    rst $38
    inc e
    dec de
    rra
    rra
    jr c, jr_00a_4709

    rra
    rla
    cpl
    dec sp
    cpl
    ccf
    ccf
    inc a

jr_00a_46d2:
    ld a, a
    ld e, a
    ld [hl], h
    db $fc
    ld hl, sp-$08
    jr c, jr_00a_46d2

    ld hl, sp-$18
    db $f4
    inc a
    db $e4
    db $fc
    ld hl, sp-$08
    db $fc
    or h
    inc b
    nop
    nop
    nop
    nop
    inc bc
    inc bc
    rrca
    dec c
    rra
    ld [de], a
    ccf
    inc h
    ccf
    inc h

jr_00a_46f3:
    ccf
    inc h
    nop
    nop
    nop
    nop
    ret nz

    ret nz

    ldh a, [$ffb0]
    ld hl, sp+$48
    db $fc
    inc h
    db $fc
    inc h
    db $fc
    inc h
    rst $38
    rst $38
    inc e
    dec de

jr_00a_4709:
    ccf
    ccf
    ld [$1f0f], sp
    rra
    rra
    inc d
    ccf
    ccf
    ccf
    inc a

jr_00a_4715:
    rst $38
    rst $38
    ld [hl], h
    db $fc
    ld hl, sp-$08
    jr c, jr_00a_4715

    db $fc
    db $ec
    db $f4
    cp h
    db $e4
    db $fc
    db $fc
    db $fc
    inc b
    nop
    nop
    nop
    nop
    inc bc
    inc bc
    rrca
    dec c
    rra
    ld [de], a
    ccf
    dec h
    ld a, a
    ld h, h
    rst $38
    cp h
    nop
    nop
    nop
    nop
    ret nz

    ret nz

    ldh a, [$ffb0]
    ld hl, sp+$48
    db $fc
    and h
    cp $26
    rst $38
    dec h
    rst $38
    ld b, h
    rst $18
    and d
    rst $38
    add e
    cp $83
    ld a, a
    ld b, a
    ccf
    inc a
    ccf
    ccf
    ccf
    inc a
    rst $38
    dec h
    cp $2a
    db $fc
    db $fc
    ld a, b
    ld hl, sp-$04
    db $ec
    db $f4
    cp h
    db $e4
    db $fc
    db $fc
    db $fc
    ld b, $00
    nop
    nop
    nop
    nop
    nop
    nop
    add b
    nop
    ld b, b
    nop
    ld hl, $1100
    nop
    nop
    nop
    nop
    nop
    ld b, b
    inc bc
    inc bc
    rrca
    adc l
    rra
    sub d
    ccf
    inc h
    ccf
    inc l
    ccf
    inc [hl]

jr_00a_4787:
    nop
    nop
    nop
    nop
    ret nz

    ret nz

    ldh a, [$ffb0]
    ld hl, sp+$48
    db $fc
    inc h
    db $fc
    inc h
    db $fc
    inc h
    nop
    rlca
    nop
    rrca
    nop
    or a
    nop
    inc bc
    nop
    inc b
    nop
    ld [$1000], sp
    nop
    jr nz, jr_00a_4787

    rst $38
    inc a
    ei
    ccf
    cp a
    jr jr_00a_482e

    cpl
    cp a
    ccf
    ld a, l
    rra
    ccf
    jr c, jr_00a_47ef

    rst $38
    rst $38
    ld [hl], h
    db $fc
    ld hl, sp-$08
    db $fc
    db $fc
    ld a, [$faae]
    xor $fc
    db $fc
    ld hl, sp-$18
    inc b
    nop
    nop
    inc bc
    inc bc
    rrca
    dec c
    rra
    ld [de], a
    ccf
    daa
    inc a
    dec sp
    ld hl, sp-$21
    ccf
    ccf
    nop
    nop
    ret nz

    ret nz

    ldh a, [$ffb0]
    ld hl, sp+$48
    db $fc
    and h
    ld a, h
    db $e4
    ld a, h
    db $fc
    rst $38
    ei
    jr jr_00a_4809

    jr c, jr_00a_482b

    ld [$1f0f], sp

jr_00a_47ef:
    rla
    cpl
    dec sp
    cpl
    ccf

jr_00a_47f4:
    ccf
    jr nc, jr_00a_4876

    ld e, a
    inc a
    db $fc
    jr c, jr_00a_47f4

    db $10
    ldh a, [$fff8]
    add sp, -$0c
    inc a
    db $e4
    db $fc
    ld hl, sp+$38
    db $fc
    db $f4
    inc b

jr_00a_4809:
    nop
    nop
    rlca
    rlca
    rra
    rra
    inc a
    dec hl
    ld a, b
    ld e, a
    ld a, a
    ld a, a
    ld a, b
    ld a, a
    jr c, jr_00a_4858

    nop
    nop
    ldh [$ffe0], a
    ld hl, sp-$28
    ld a, h
    db $e4
    ld a, h
    db $fc
    cp $fa
    ld a, $fa
    ld a, $fe
    inc h
    ccf

jr_00a_482b:
    dec h
    ccf
    rra

jr_00a_482e:
    rra
    rrca
    dec bc
    rrca
    rrca
    rra
    db $10
    ccf
    cpl
    ld a, $3e
    ret c

    ld hl, sp+$30
    ldh a, [$ff38]
    add sp, -$08
    ret z

    ld hl, sp-$08
    ld hl, sp+$38
    db $fc
    db $ec
    db $fc
    db $fc
    ld b, $00
    nop
    inc bc
    inc bc
    rrca
    dec c
    rra
    ld [de], a
    ccf
    dec h
    ld a, a
    ld h, h
    rst $38
    and h

jr_00a_4858:
    ld a, a
    ld e, h
    nop
    nop
    ret nz

    ret nz

    ldh a, [$ffb0]
    ld hl, sp+$48
    db $fc
    and h
    cp $26
    rst $38
    dec h
    cp $3a
    ccf
    ccf
    inc e
    rra

jr_00a_486e:
    dec de
    rra

jr_00a_4870:
    inc e
    rla
    ccf
    dec sp
    ld c, a
    ld a, a

jr_00a_4876:
    ld c, a
    ld a, l

Call_00a_4878:
    ccf
    dec sp
    db $fc
    db $fc
    jr c, jr_00a_4876

    ret c

    ld hl, sp+$38
    add sp, -$10
    ret nc

    jr c, jr_00a_486e

    jr c, jr_00a_4870

    db $fc
    call c, Call_000_0f0f
    ld c, $0e
    ld c, $0a
    inc c
    inc c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db $fc
    db $fc
    inc a
    inc a
    inc a
    inc l
    jr jr_00a_48ba

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld b, $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc bc
    inc bc
    rrca

jr_00a_48ba:
    dec c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ret nz

    ret nz

    ldh a, [$ffb0]
    rra
    ld [de], a
    ccf
    inc h
    ccf
    inc h
    rst $38
    rst $38
    jr c, jr_00a_4914

    inc e
    dec de
    rra
    rra
    jr c, jr_00a_491a

    ld hl, sp+$48
    db $fc
    inc h
    db $fc
    inc h
    db $fc
    db $e4

jr_00a_48e3:
    ld a, a
    rst $38
    ld [hl], h
    db $fc
    ld hl, sp-$08
    jr c, jr_00a_48e3

    rra
    rla
    cpl
    dec sp
    ccf
    ccf
    ld a, a
    ld a, h
    ld a, a
    ld e, a
    ld a, $3e
    nop
    nop
    nop
    nop
    ld hl, sp-$18
    db $f4
    inc a
    db $e4
    db $fc
    ld hl, sp-$08
    ld hl, sp-$48
    ld hl, sp-$08
    ld [hl], b
    ld [hl], b
    nop
    nop
    inc b
    nop
    nop
    inc bc
    inc bc
    rrca
    dec c
    rra
    ld [de], a

jr_00a_4914:
    ccf
    inc h
    ccf
    inc h
    rst $38
    rst $38

jr_00a_491a:
    ld l, $3d
    nop
    nop
    ret nz

    ret nz

    ldh a, [$ffb0]
    ld hl, sp+$48
    db $fc
    inc h
    db $fc
    inc h
    rst $38
    rst $38
    inc [hl]
    db $fc
    inc a
    ccf
    ld a, a
    ld a, a
    sbc c
    rst $38
    sbc l
    rst $30
    ld a, [hl]
    ld a, e
    ld a, a
    ld l, a
    ccf
    inc a
    rra
    rra
    inc a
    db $fc
    cp $fe
    sbc c
    rst $38
    cp c
    rst $28
    ld a, [hl]
    sbc $fe
    or $fc
    inc a
    ld hl, sp-$08
    ld [$0000], sp
    rlca
    rlca
    rra
    jr jr_00a_4993

    inc hl
    ld a, a
    ld b, e
    ld a, a
    ld b, e
    ld a, a
    ld b, b
    ld a, a
    ld b, e
    nop
    nop
    ret nz

    ret nz

    ldh a, [$ff30]
    ld hl, sp-$78
    db $fc
    inc b
    db $fc
    inc b
    db $fc
    inc b
    db $fc
    inc b
    ccf
    jr nz, jr_00a_498f

    inc e
    inc bc
    ld [bc], a
    inc bc
    ld [bc], a
    ld bc, $0101
    ld bc, $0000
    inc bc
    inc bc
    ld hl, sp+$08
    ldh a, [rSVBK]
    ret nz

    ld b, b
    add b
    add b
    nop
    nop
    nop
    nop
    nop
    nop
    ret nz

    ret nz

    rrca
    dec c

jr_00a_498f:
    rra
    ld [de], a
    ccf
    dec h

jr_00a_4993:
    ld a, a
    ld h, h
    rst $38
    and h
    ld a, a
    ld e, h
    ccf
    ccf
    ld a, $3d
    ldh a, [$ffb0]
    ld hl, sp+$48
    db $fc
    and h
    cp $26
    rst $38
    dec h
    cp $3a
    db $fc
    db $fc
    inc a
    db $fc
    ld c, e
    ld a, a
    ld c, l
    ld a, a
    ld a, $3b
    ccf
    cpl
    ccf
    inc a
    ccf
    ccf
    inc e
    inc e
    nop
    nop
    jp nc, $b2fe

    cp $7c
    call c, $f4fc
    db $fc
    inc a
    db $fc
    db $fc
    jr c, @+$3a

    nop
    nop
    inc b
    nop
    nop
    inc bc
    inc bc
    rrca
    dec c
    rra
    ld [de], a
    ccf
    dec h
    ld a, a
    ld h, h
    rst $38
    and h
    ld a, a
    ld e, h
    nop
    nop
    ret nz

    ret nz

    ldh a, [$ffb0]
    ld hl, sp+$48
    db $fc
    and h
    cp $26
    rst $38
    dec h
    cp $3a
    ld a, a
    ld a, a
    ld e, h
    ld a, a
    ld a, e
    ld l, a
    inc a
    ccf
    ccf
    cpl
    ccf
    ccf

jr_00a_49fa:
    ccf
    inc a
    ccf
    ccf
    db $fc
    db $fc
    jr c, jr_00a_49fa

    call c, $3efc               ; data bytes (was Call_000_3efc; ROM0 island reused)
    cp $fe
    or $fd
    rst $38
    rst $38
    ccf
    db $fc
    db $fc
    inc b
    inc bc
    inc bc
    rrca
    inc c
    rst $18
    pop de
    ld a, a
    ld [hl], d
    ccf
    ld a, $67
    ld e, a
    ld c, a
    ld a, a
    ccf
    ccf
    ret nz

    ret nz

    ldh a, [$fff0]
    ld hl, sp+$18
    db $fc
    inc d
    db $fc
    inc d
    db $fc
    call nc, $fc7c
    ccf
    rst $38
    rla
    rra
    ld [$070f], sp
    rlca
    scf
    inc [hl]
    ccf
    cpl
    ccf
    ld a, $1f
    rra
    ld c, $0e
    db $e4
    db $fc
    db $e4
    cp h
    ld hl, sp-$68
    ldh a, [$ff50]
    ldh a, [$fff0]
    ld hl, sp+$48
    ldh a, [$fff0]
    nop
    nop
    inc b
    inc bc
    inc bc
    rrca
    inc c
    rra
    ld de, $223f
    ccf
    ld [hl+], a
    rst $38
    rst $38
    ld h, a
    ld e, a
    ld c, a
    ld a, a
    ret nz

    ret nz

    ldh a, [$fff0]
    ld hl, sp+$18
    db $fc
    inc d
    db $fc
    inc d
    db $fc
    db $fc
    ccf
    rst $38
    inc c
    db $fc
    ccf
    ccf
    ld [$070f], sp
    rlca
    rrca
    inc c
    rrca
    rrca
    rra
    db $10
    rrca
    rrca
    rrca
    dec bc
    sbc b
    ld hl, sp+$10
    ldh a, [$ffe0]
    ldh [$fff0], a
    sub b
    ldh a, [$fff0]
    ret z

    ld a, b
    ldh a, [$fff0]
    ldh [$ffa0], a
    inc b
    nop
    nop
    inc bc
    inc bc
    rrca
    inc c
    rra
    ld de, $223f
    rst $38
    cp $67
    ld e, a
    ld c, a
    ld a, a
    nop
    nop
    ret nz

    ret nz

    ldh a, [$fff0]
    ld hl, sp+$18
    db $fc
    inc d
    db $fc
    inc d
    db $fc
    call nc, $ff3f
    ccf
    ccf
    rla
    rra
    ld [$1f0f], sp
    rra
    cpl
    inc a
    ld a, a
    ld a, a
    ld a, a
    ld e, b
    ccf
    ccf
    inc c
    db $fc
    sbc b
    ld hl, sp+$10
    ldh a, [$ffe0]
    ldh [$fff0], a
    or b
    ret nc

    ldh a, [$ffb0]
    ldh a, [$fff8]
    ret c

    inc b
    inc bc
    inc bc
    rrca
    dec c
    rra
    ld [de], a
    ccf
    inc h
    ccf
    daa
    db $fc
    ei
    jr c, jr_00a_4b1f

    rra
    rra
    ret nz

    ret nz

    ldh a, [$ffb0]
    ld hl, sp+$48
    db $fc
    inc h
    db $fc
    and h
    ld a, h
    db $e4
    ld a, a
    rst $38
    db $fc
    db $fc
    jr c, jr_00a_4b33

    ld [$1f0f], sp
    rla
    ccf
    dec sp
    cpl
    ccf

jr_00a_4afc:
    rra
    jr @+$41

    cpl
    ld a, $3e
    jr c, jr_00a_4afc

    db $10
    ldh a, [$fff8]
    add sp, -$28
    ld a, b
    adc b
    ld hl, sp-$24
    ld a, h
    cp [hl]
    cp d
    ld e, $1e
    ld b, $00
    nop
    nop
    nop
    add hl, bc
    add hl, bc
    dec d
    dec e
    ld [de], a
    rra
    add hl, bc
    rrca

jr_00a_4b1f:
    dec b
    rlca
    dec b
    rlca
    inc bc
    inc bc
    adc a
    adc l
    ld e, a
    jp nc, $e47f

    ld a, a
    rst $30
    cp $fd
    inc l
    rst $38
    cp a
    rst $38

jr_00a_4b33:
    ret nz

    ret nz

    ldh a, [$ffb0]
    ld hl, sp+$48
    db $fc
    inc h
    db $fc
    db $e4
    ld a, $fe
    scf
    db $fd
    cp $fe
    inc b
    rlca
    inc bc
    inc bc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, l
    rst $38
    ld hl, sp-$31
    ccf
    daa
    rra
    add hl, de
    rra
    rla
    ccf
    jr c, @+$41

    cpl
    inc a
    inc a
    cp b
    ld hl, sp+$1c
    db $fc
    ldh a, [c]
    cp $f2
    sbc [hl]
    db $fc
    db $fc
    db $fc
    inc e
    db $fc
    db $f4
    jr c, jr_00a_4bab

    stop
    nop
    nop
    nop
    nop
    nop

jr_00a_4b7a:
    nop
    nop

jr_00a_4b7c:
    jr jr_00a_4b96

jr_00a_4b7e:
    inc h
    inc a

jr_00a_4b80:
    ld b, d
    ld a, [hl]

jr_00a_4b82:
    ld e, c
    ld h, a
    ld bc, $0201
    inc bc
    dec b
    ld b, $04
    rlca
    inc b
    rlca
    inc b
    rlca
    ld [$080f], sp
    rrca
    add b
    add b

jr_00a_4b96:
    ld b, b
    ret nz

    jr nz, jr_00a_4b7a

    jr nz, jr_00a_4b7c

    jr nz, jr_00a_4b7e

    jr nz, jr_00a_4b80

    jr nz, jr_00a_4b82

    ld b, b
    ret nz

    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_00a_4bab:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld d, b
    ld l, a
    jr nz, jr_00a_4bf7

    jr nz, jr_00a_4bf9

    db $10

jr_00a_4bbb:
    rra
    ld [$040f], sp
    rlca
    ld [bc], a
    inc bc
    ld bc, $8801
    adc a
    adc b
    adc a
    ld c, b
    rst $08
    jr z, jr_00a_4bbb

    jr z, @-$0f

    jr @+$01

    add hl, de
    rst $38
    ld [bc], a
    rst $38
    ld b, b
    ret nz

    ld b, b
    ret nz

    ld b, b
    ret nz

    ld b, b
    ret nz

    add b
    add b
    add b
    add b
    jp Jump_000_2fc3


    db $ed
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ret nz

    ret nz

    ldh a, [$ffb0]
    nop
    nop
    nop

jr_00a_4bf7:
    nop
    nop

jr_00a_4bf9:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add l
    cp $44
    ld a, a
    ld b, h
    ld a, a
    ld b, d
    ld a, a
    ld hl, $283f
    scf
    db $10
    rra
    rrca
    rrca
    rra
    ldh a, [c]
    rra
    db $f4
    rra
    rst $38
    ld [hl], $fd
    db $ec
    rst $38
    ld a, a
    rst $38
    rst $38
    rst $18
    ld a, e
    ld c, a
    ld hl, sp+$48
    db $fc
    inc h
    db $fc
    db $e4
    inc a
    db $fc
    ld [hl], $fe
    db $fd
    db $fd
    ld hl, sp-$08
    sbc $fe
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec a
    daa
    ld e, $1b
    ccf
    ld sp, $3f3f
    ld a, $2e
    inc e
    inc e
    nop
    nop
    nop
    nop
    cp l
    rst $20
    ld a, c
    rst $08
    cp $9e
    ld hl, sp-$08
    ld a, b
    ld a, b
    ld a, b
    ld l, b
    jr nc, jr_00a_4ca2

    nop
    nop
    inc b
    nop
    nop
    nop
    nop
    nop
    nop
    inc bc
    inc bc
    rrca
    dec c
    rra
    ld [de], a
    ccf
    inc h
    ld a, a
    ld a, a
    nop
    nop
    nop
    nop
    nop
    nop
    ret nz

    ret nz

    ldh a, [$ffb0]
    ld hl, sp+$48
    db $fc
    inc h
    cp $fe
    xor $fd
    inc a
    ccf
    ld a, a
    ld a, a
    sbc c
    rst $38
    sbc h
    rst $30
    ld a, a
    ld a, e
    ld a, a

jr_00a_4ca2:
    ld a, a
    ld a, a
    ld l, h
    scf
    rst $38
    inc a
    db $fc
    cp $fe
    sbc c
    rst $38
    add hl, sp
    rst $28
    cp $de
    cp $fe
    cp $36
    inc c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [bc], a
    nop
    ld bc, $0100
    nop
    nop
    nop
    stop
    nop
    nop
    jr nz, jr_00a_4ccb

jr_00a_4ccb:
    jr nc, jr_00a_4ccd

jr_00a_4ccd:
    jr jr_00a_4ccf

jr_00a_4ccf:
    jr jr_00a_4cd1

jr_00a_4cd1:
    sbc h
    nop
    adc $00
    rst $28
    nop
    nop
    nop
    inc b
    nop
    inc c
    nop
    jr jr_00a_4cdf

jr_00a_4cdf:
    jr jr_00a_4ce1

jr_00a_4ce1:
    add hl, sp
    nop
    ld [hl], e
    nop
    rst $30
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld b, b
    nop
    add b
    nop
    add b
    nop
    nop
    nop
    ld [$0c00], sp
    nop
    rlca
    nop
    rlca
    nop
    inc bc
    nop
    ld bc, $0700
    nop
    ccf
    nop
    rlca
    nop
    ld a, a
    inc bc
    ld a, a
    rrca
    db $fd
    rra
    ldh a, [c]
    cp a
    db $e4
    ld a, a
    db $f4
    ld a, a
    rst $38
    sub [hl]
    db $fd
    nop
    cp $c0
    cp $f0
    cp a
    ld hl, sp+$4f
    db $fd
    daa
    cp $2f
    cp $ff
    add hl, hl
    rst $38
    nop
    jr nc, jr_00a_4d29

jr_00a_4d29:
    ldh [rP1], a
    ldh [rP1], a
    ret nz

    nop
    add b
    nop
    ldh [rP1], a
    db $fc
    nop
    ldh [rP1], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sbc h
    rst $38
    ld a, a
    ld a, a
    add hl, sp
    cpl
    db $fd
    rst $30
    db $fd
    or a
    cp $ff
    ld a, a
    ld a, c
    scf
    scf
    add hl, sp
    rst $38
    cp $fe
    sbc h
    db $f4
    cp a
    rst $28
    cp a
    db $ed
    ld a, a
    rst $38
    cp $9e
    db $ec
    db $ec
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc b
    rlca
    rlca
    rra
    jr jr_00a_4dbb

    daa
    ld a, h
    ld c, e
    ld [hl], b
    ld e, a
    ldh a, [$ff9f]
    ld hl, sp-$01
    ldh a, [rIE]
    add b
    add b
    ldh [$ff60], a
    ldh a, [$fff0]
    ldh a, [$fff0]
    add sp, -$08
    ld a, b
    ld hl, sp+$0c
    db $fc
    xor $fe
    pop hl
    rst $38
    ei
    cp a
    ld a, a
    ld c, [hl]
    ccf
    inc a
    rrca
    dec bc
    rlca
    inc b
    rlca
    rlca
    inc bc
    ld [bc], a
    ld a, $f6
    ld a, $fe
    cp $de
    cp $fe
    cp $1e
    cp $ee
    db $fc
    db $fc
    ldh [$ffe0], a
    inc b
    nop
    nop
    inc bc

jr_00a_4dbb:
    inc bc
    rrca
    ld c, $1f
    inc d
    ccf
    add hl, hl
    rst $38
    ld [$acff], a
    rst $38
    db $f4
    nop
    nop
    ldh [$ffe0], a
    ld hl, sp-$28
    db $fc
    ld h, h
    cp $d2
    rst $38
    dec hl
    rst $38
    daa
    rst $38
    dec h
    rst $38
    ldh a, [c]
    ld c, a
    ld a, c
    ld c, a
    ld a, [hl]
    ccf
    add hl, sp
    rra
    rla
    rrca
    inc c
    rlca
    rlca
    rlca
    rlca
    rst $38
    ld e, c
    cp $e2
    cp $0e
    ldh a, [c]
    cp $ec
    inc l
    ret nz

    ret nz

    ldh [$ffe0], a
    ldh [$ffa0], a
    inc b
    inc bc
    inc bc
    rrca
    inc c
    rra
    rra
    ld e, $1f
    ld l, $3f
    inc a
    ccf
    ld h, b
    ld a, a
    dec sp
    ccf
    ret nz

    ret nz

    ldh a, [$ff30]
    ld hl, sp-$38
    ld a, h
    and h
    inc e
    db $f4
    ld e, $f2
    ld a, $fa
    sbc [hl]
    ld a, [$7d4f]
    ld c, a
    ld a, a
    rst $38
    or a
    rst $38
    add a
    ld a, a
    ld h, a
    ld a, a
    ld a, e
    rst $38
    cp a
    ld hl, sp-$08
    adc $fa
    cp [hl]
    ld a, [$e4bc]
    ld hl, sp-$08
    ldh [$ffa0], a
    ret nz

    ret nz

    nop
    nop
    nop
    nop
    inc b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc e
    inc e
    ld a, $3a
    ld a, a
    ld a, a
    ld a, a
    ld a, d
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr jr_00a_4e6c

    inc a
    inc [hl]
    db $fc
    db $fc
    db $fc
    ld e, h
    ld a, a
    ld [hl], h
    ld a, a
    ld l, c
    ccf
    ld [hl+], a
    ccf
    inc l
    ld a, a
    ld d, h
    ld a, a
    ld [hl], e
    ld c, a
    ld a, b
    ld c, a
    ld a, a
    db $fc
    inc h

jr_00a_4e6c:
    cp $d2
    rst $38
    dec hl
    rst $38
    daa
    rst $38
    dec h
    rst $38
    ld sp, hl
    rst $38
    inc bc
    db $fd
    rst $38
    inc b
    nop
    nop
    inc bc
    inc bc
    rrca
    dec c
    rra
    ld [de], a
    ccf
    inc h
    ccf
    daa
    db $fc
    ei
    jr c, jr_00a_4eca

    nop
    nop
    ret nz

    ret nz

    ldh a, [$ffb0]
    ld hl, sp+$48
    db $fc
    inc h
    db $fc
    and h
    ld a, h
    db $e4
    ld a, a
    rst $38
    rra
    rra
    jr c, jr_00a_4ede

    ld [$1f0f], sp
    rla
    rra
    dec d
    rrca
    rrca

jr_00a_4ea7:
    rra
    jr jr_00a_4ee9

    cpl
    db $fc
    db $fc
    jr c, jr_00a_4ea7

    db $10
    ldh a, [$fff8]
    add sp, $38
    add sp, $38
    ld hl, sp-$04
    db $fc
    cp [hl]
    xor [hl]
    inc b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_00a_4eca:
    ld e, $1e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, a
    ld l, l

jr_00a_4ede:
    ld a, a
    ld [de], a
    ld a, a
    ld hl, $217f
    ld a, a
    ld [hl], c
    rra
    ld a, a
    ccf

jr_00a_4ee9:
    ld a, a
    rra
    ld a, a
    add b
    add b
    ret nz

    ld b, b
    ldh [rNR41], a
    ldh [rNR41], a
    ldh [rNR41], a
    ld hl, sp-$08
    ldh [$ffe0], a
    ret nz

    ret nz

    inc b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld h, b
    ld h, b
    ld a, b
    ld e, b
    ld a, h
    inc h
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc b
    nop
    nop
    inc bc
    inc bc
    rrca
    dec c
    rra
    ld [de], a
    ccf
    inc h
    ccf
    inc h
    rst $38
    rst $38
    ld l, $3d
    nop
    nop
    ret nz

    ret nz

    ldh a, [$ffb0]
    ld hl, sp+$48
    db $fc
    inc h
    db $fc
    inc h
    rst $38
    rst $38
    inc [hl]
    db $fc
    inc a
    ccf
    rra
    rra
    dec bc
    rrca
    dec e
    rla
    ld e, $1b
    cpl
    ccf
    rra
    inc e
    rra
    rla
    inc a
    db $fc
    ld hl, sp-$08
    ret nc

    ldh a, [$ffb8]
    add sp, $78
    ret c

    db $f4
    db $fc
    ld hl, sp+$38
    ld hl, sp-$18
    ld b, $00
    nop
    inc bc
    inc bc
    rrca
    dec c
    rra
    ld [de], a
    ccf
    inc h
    ccf
    daa
    cp $fd
    ld l, h
    ld a, a
    nop
    nop
    ret nz

    ret nz

    ldh a, [$ffb0]
    ld hl, sp+$48
    db $fc
    inc h
    db $fc
    db $e4
    ccf
    rst $38
    ld [hl], $fe
    sbc a
    rst $38
    sbc a
    rst $38
    ld a, e
    ld l, a
    dec a
    daa
    ld e, $1b
    rra
    rra
    rra
    db $10
    rra
    rra
    ld sp, hl
    rst $38
    ld sp, hl
    rst $38
    sbc $f6
    cp h
    db $e4
    ld a, b
    ret c

    ld hl, sp-$08
    ld hl, sp+$08
    ld hl, sp-$08
    ld e, $1e
    ld e, $16
    inc c
    inc c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, b
    ld a, b
    ld a, b
    ld l, b
    jr nc, @+$32

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc b
    nop
    nop
    inc bc
    inc bc
    rrca
    dec c
    rra
    ld [de], a
    ccf
    inc h
    ccf
    daa
    ld a, [hl]
    ld a, l
    db $ec
    cp a
    nop
    nop
    ret nz

    ret nz

    ldh a, [$ffb0]
    ld hl, sp+$48
    db $fc
    inc h
    db $fc
    db $e4
    ld a, $fe
    scf
    db $fd
    ld a, a
    ld a, a
    dec e
    rra
    jr c, jr_00a_5045

    ld c, [hl]
    ld a, a
    ld c, a
    ld a, c
    ccf
    ccf
    ccf
    inc a
    ccf
    cpl
    cp $fe
    cp b
    ld hl, sp+$1c
    db $fc
    ld [hl], d
    cp $f2
    sbc [hl]
    db $fc
    db $fc
    db $fc
    inc a
    db $fc
    db $f4
    add hl, bc
    nop
    nop
    inc bc
    inc bc
    rlca
    inc b
    rrca
    ld [$090f], sp
    rra
    rla
    ccf
    jr c, jr_00a_50af

    ld b, e
    rst $38
    rst $38
    rst $38
    jr @+$01

    ld h, [hl]
    rst $38
    add c
    rst $38
    ld a, [hl]
    rst $38
    add c
    rst $38
    inc a
    jp Jump_000_00ff


    nop
    ret nz

    ret nz

jr_00a_5045:
    ldh [rNR41], a
    ldh a, [rNR10]
    ldh a, [$ff90]
    ld hl, sp-$18
    db $fc
    inc e
    cp $c2
    rst $38
    adc [hl]
    di
    sbc [hl]
    ld [hl], e
    ld e, [hl]
    scf
    inc a
    dec c
    ld a, [bc]
    rrca
    ld [$0407], sp
    rlca
    rlca
    and c
    rst $18
    add c
    rst $38
    add c
    rst $38
    jp $ff7e


    inc a
    rst $38
    inc a
    rst $38
    ld a, [hl]
    cp l
    rst $38
    rst $38
    ld [hl], c
    rst $08
    ld a, c
    adc $7a
    db $ec
    inc a
    cp b
    ld e, b
    ldh a, [rNR10]
    ldh [rNR41], a
    ldh [$ffe0], a
    inc bc
    inc bc
    inc bc
    inc bc
    inc b
    rlca

jr_00a_5087:
    inc b
    rlca

jr_00a_5089:
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    ld [bc], a
    inc bc
    inc bc
    inc a
    rst $38
    sbc c
    rst $38
    rst $20
    rst $38
    rst $38
    sbc c
    rst $38
    rst $38
    rst $38
    jp $ffff


    rst $20
    rst $20
    ret nz

    ret nz

    ret nz

    ret nz

    jr nz, jr_00a_5087

    jr nz, jr_00a_5089

    ret nz

    ret nz

    ret nz

    ret nz

    ret nz

    ld b, b

jr_00a_50af:
    ret nz

    ret nz

    add hl, bc
    nop
    nop
    inc bc
    inc bc
    rlca
    inc b
    rrca
    ld [$090f], sp
    rra
    rla
    ccf
    jr c, jr_00a_5140

    ld b, e
    rst $38
    rst $38
    rst $38
    jr @+$01

    ld h, [hl]
    rst $38
    add c
    rst $38
    ld a, [hl]
    rst $38
    add c
    rst $38
    inc a
    jp Jump_000_00ff


    nop
    ret nz

    ret nz

    ldh [rNR41], a
    ldh a, [rNR10]
    ldh a, [$ff90]
    ld hl, sp-$18
    db $fc
    inc e
    cp $c2
    rst $38
    adc [hl]
    di
    sbc [hl]
    ld [hl], e
    ld e, [hl]
    inc sp
    ld a, $13
    ld e, $0b
    ld c, $0b
    ld c, $07
    ld b, $a1
    rst $18
    add c
    rst $38
    add c
    rst $38
    jp $bdff


    rst $38
    cp l
    rst $38
    cp l
    rst $38
    cp l
    rst $38
    rst $38
    ld [hl], c
    rst $08
    ld a, c
    adc $7a
    call z, $c87c
    ld a, b
    ret nc

    ld [hl], b
    ret nc

    ld [hl], b
    ldh [$ff60], a
    rlca
    inc b
    dec c
    ld a, [bc]
    rrca
    ld [$0407], sp
    rlca
    rlca
    inc bc
    inc bc
    inc bc
    ld [bc], a
    inc bc
    inc bc
    rst $38
    ld a, [hl]
    rst $38
    inc a
    rst $20
    inc a
    jp $ff7e


    cp l
    rst $38
    jp $ffff


    rst $20
    rst $20
    ldh [rNR41], a
    or b
    ld d, b
    ldh a, [rNR10]
    ldh [rNR41], a
    ldh [$ffe0], a
    ret nz

    ret nz

    ret nz

    ld b, b

jr_00a_5140:
    ret nz

    ret nz

    inc b
    nop
    nop
    inc bc
    inc bc
    rrca
    dec c
    rra
    ld [de], a
    ccf
    inc h
    ccf
    daa
    cp $fd
    inc l
    ccf
    nop
    nop
    ret nz

    ret nz

    ldh a, [$ffb0]
    ld hl, sp+$48
    db $fc
    inc h
    db $fc
    db $e4
    ccf
    rst $38
    inc [hl]
    db $fc
    ccf
    ccf
    inc e
    rra
    ld [$1f0f], sp
    rla
    rra
    add hl, de
    cpl
    ccf

jr_00a_516f:
    rra
    inc e
    rra
    rla
    db $fc
    db $fc
    jr c, jr_00a_516f

    db $10
    ldh a, [$fff8]
    add sp, -$08
    sbc b
    db $f4
    db $fc
    ld hl, sp+$38
    ld hl, sp-$18
    inc c
    nop
    nop
    nop
    nop
    nop
    ld bc, $0000
    nop
    nop
    nop
    stop
    ld [bc], a
    nop
    ld bc, $0000
    nop
    nop
    nop
    stop
    ld [$0000], sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    stop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_00a_51bf

jr_00a_51bf:
    ld b, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nc, jr_00a_51cb

jr_00a_51cb:
    nop
    nop
    nop
    nop
    nop
    nop
    inc b
    nop
    jr jr_00a_51d8

    inc bc
    rrca
    dec c

jr_00a_51d8:
    rra
    ld [de], a
    ccf
    inc h
    ccf
    daa
    cp $fd
    ld l, h
    ld a, a
    sbc a
    rst $38
    ret nz

    ret nz

    ldh a, [$ffb0]
    ld hl, sp+$48
    db $fc
    inc h
    db $fc
    db $e4
    ccf
    rst $38
    ld [hl], $fe
    ld sp, hl
    rst $38
    nop
    nop
    nop
    stop
    jr nc, jr_00a_51fb

jr_00a_51fb:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sbc a
    rst $38
    ld a, e
    ld l, a
    dec a
    daa
    ld e, $1b
    rrca
    rrca
    rra
    inc e
    rra
    rla
    rrca
    ld c, $f9
    rst $38
    sbc $f6
    cp h
    db $e4
    ld a, b
    ret c

    ldh a, [$fff0]
    ld hl, sp+$38
    ld hl, sp-$18
    ldh a, [rSVBK]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [de], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld b, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_00a_525a

jr_00a_525a:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    stop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    stop
    nop
    nop
    ld [bc], a
    nop
    nop
    nop
    ld h, b
    nop
    inc c
    nop
    ld [$0000], sp
    nop
    nop
    nop
    nop
    nop
    ld b, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add b
    nop
    nop
    inc bc
    inc bc
    rrca
    dec c
    rra
    ld [de], a
    ccf
    inc h
    ccf
    daa
    cp $fd
    ld l, h
    ld a, a
    sbc a
    rst $38
    ret nz

    ret nz

    ldh a, [$ffb0]
    ld hl, sp+$48
    db $fc
    inc h
    db $fc
    db $e4
    ccf
    rst $38
    ld [hl], $fe
    ld sp, hl
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_00a_52f8

jr_00a_52f8:
    ld [bc], a
    nop
    inc b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_00a_5306

jr_00a_5306:
    nop
    nop
    stop
    nop
    nop
    nop
    nop
    ld [bc], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sbc a
    rst $38
    ld a, e
    ld l, a
    dec a
    daa
    ld e, $1b
    rrca
    rrca
    rra
    inc e
    rra
    rla
    rrca
    ld c, $f9
    rst $38
    sbc $f6
    cp h
    db $e4
    ld a, b
    ret c

    ldh a, [$fff0]
    ld hl, sp+$38
    ld hl, sp-$18
    ldh a, [rSVBK]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc b
    nop
    nop
    nop
    add b
    nop
    nop
    nop
    nop
    ld b, $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc bc
    inc bc
    rrca
    dec c
    rra
    ld [de], a
    ccf
    inc h
    ccf
    ccf
    ld hl, sp-$09
    jr nc, @+$41

    ld a, a
    ld a, a
    ret nz

    ret nz

    ldh a, [$ffb0]
    ld hl, sp+$48
    db $fc
    inc h
    db $fc
    db $e4
    rst $38
    rst $38
    db $f4
    db $fc
    db $fc
    db $fc
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    rra
    db $10
    rra
    db $10
    rrca
    rrca
    nop
    nop
    rla
    rra
    ld [$1f0f], sp
    rla
    rst $28
    ei
    rst $28
    ccf
    rst $38
    ldh a, [$ff7f]
    ld e, a
    inc a
    inc a
    ld a, b
    ld hl, sp+$10
    ldh a, [$fffc]
    db $ec
    ld a, [$f24e]
    cp $fc
    inc a
    ld hl, sp-$28
    ldh a, [$fff0]
    add hl, bc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ret nz

    ret nz

    nop
    nop
    nop
    nop
    inc c
    inc c
    ld e, $12
    ld a, $32
    ccf
    dec hl
    ld a, a
    ld c, a
    ld a, a
    ld h, e
    jr nc, @+$41

    ld l, b
    ld [hl], a
    ldh [rIE], a
    ldh a, [rIE]
    rst $38
    rst $38
    rst $18
    rst $38
    rst $18
    rst $38
    sbc $7f
    ldh a, [$ffb0]
    ld a, b
    ld hl, sp+$7c
    db $fc
    cp $fa
    cp $fa
    cp a
    db $fd
    ccf
    db $fd
    rla
    db $fd
    rst $38
    sbc l
    rst $38
    add e
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $de01
    rst $38
    ld e, h
    rst $38
    ld sp, hl
    rst $38
    db $e3
    cp a
    ld a, a
    ld a, l
    ccf
    ccf
    rst $38
    ret nz

    rst $38
    ld a, a
    ld e, $fa
    ld e, $f2
    ld a, h
    db $f4
    ld hl, sp-$48
    ret nc

    ld [hl], b
    sub b
    ldh a, [$ffe0]
    ldh [$ffe0], a
    ld h, b
    add hl, bc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld e, $1e
    ld hl, $003f
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $0101
    ld bc, $0101
    inc bc
    inc bc
    ld bc, $0101
    ld bc, $0101
    inc bc
    ld [bc], a
    ret nc

    rst $28
    ret nz

    rst $38
    and c
    rst $38
    cp a
    rst $38
    rst $38
    rst $38
    cp a
    rst $38
    cp [hl]
    rst $38
    cp [hl]
    rst $38
    ldh a, [$fff0]
    ld hl, sp-$08
    ld a, b
    ld hl, sp+$7c
    db $fc
    ld a, h
    db $fc
    inc a
    db $fc
    ld l, $fa
    ld e, $fa
    inc bc
    ld [bc], a
    rlca
    dec b
    rlca
    dec b
    rlca
    dec b
    ld b, $06
    ld [bc], a
    ld [bc], a
    nop
    nop
    ld bc, $bc01
    rst $38
    cp h
    rst $38
    ld [hl], c
    rst $38
    db $e3
    cp a
    ld a, a
    ld a, l
    ccf
    ccf
    rst $38
    ret nz

    rst $38
    ld a, a
    ld c, $fa
    inc e
    db $f4
    ld a, b
    ld hl, sp-$10
    or b
    ret nc

    ld [hl], b
    sub b
    ldh a, [$ffe0]
    ldh [$ffe0], a
    ld h, b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    ld [$0000], sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc bc
    inc bc
    inc b
    rlca
    dec b
    ld b, $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    nop
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ret nz

    ret nz

    ld h, b
    and b
    ld h, b
    and b
    dec b
    ld b, $05
    ld b, $05
    ld b, $05
    ld b, $05
    ld b, $05
    ld b, $05
    ld b, $05
    ld b, $60
    and b
    ld h, b
    and b
    ld h, b
    and b
    ld h, b
    and b
    ld h, b
    and b
    ld h, b
    and b
    ld h, b
    and b
    ld h, b
    and b
    inc b
    rlca
    rlca
    inc b
    inc bc
    inc bc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    nop
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld h, b
    and b
    ldh [rNR41], a
    ret nz

    ret nz

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc b
    nop
    nop
    nop
    nop
    ld bc, $0201
    inc bc
    dec c
    rrca
    db $10
    rra
    ld h, $39
    ld l, $35
    ld b, $06
    rrca
    dec c
    rst $18
    rst $18
    halt
    or $98
    ld hl, sp+$08
    ld hl, sp-$1c
    inc e
    ldh a, [c]
    ld l, $6f
    ld [hl], c
    ld b, a
    ld a, e
    ld hl, $403f
    ld a, a
    jr z, jr_00a_55db

    ld a, b
    ld a, a
    rst $38
    rst $18
    cp $fe
    or $8e
    db $e4
    ld e, h
    add d
    cp $14
    db $fc
    ld [$9cf8], sp
    db $fc
    cp $f6
    cp $fe
    inc b
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $0b01
    dec bc
    ld d, $1f
    jr nz, jr_00a_5600

    ld c, [hl]
    ld [hl], c
    nop
    nop
    ld b, $06
    rrca
    dec c
    rst $18
    rst $18
    halt
    or $98
    ld hl, sp+$04
    db $fc
    ld [hl-], a
    adc $5f
    ld h, h
    rst $18
    pop hl
    adc a
    di
    ld b, c
    ld a, a

jr_00a_55db:
    add b
    rst $38
    ld [hl], b
    ld a, a
    db $fd
    rst $18
    rst $38
    rst $38
    ld a, c
    and a
    ei
    add a
    ldh a, [c]
    ld c, [hl]
    add c
    rst $38
    ld e, $fe
    adc h
    db $fc
    cp [hl]
    or $7e
    ld a, [hl]
    inc b
    inc bc
    inc bc
    ld c, $0f
    dec e
    ld e, $3d
    daa
    jr c, @+$41

    ld a, e
    ld a, a

jr_00a_5600:
    ld a, a
    ld e, a
    ld a, a
    ld [hl], e
    ret nz

    ret nz

    ld [hl], b
    ldh a, [$ffb8]
    ld hl, sp-$44
    db $e4
    inc e
    db $fc
    sbc $fe
    cp $7a
    cp $4e
    ld a, a
    ld [hl], c
    ld a, a
    ld d, c
    ld a, a
    ld [hl], b
    ld a, a
    ld a, c
    ld a, a
    ld c, h
    ld a, a
    ld a, a
    dec sp
    ld a, [hl-]
    dec de
    dec de
    cp $0e
    cp $8a
    cp $0e
    cp $9e
    cp $32
    cp $fe
    call c, $d85c
    ret c

    inc b
    nop
    nop
    inc bc
    inc bc
    ld c, $0f
    dec e
    ld e, $3d
    daa
    jr c, jr_00a_5680

    ld a, e
    ld a, a
    ld a, a
    ld e, a
    nop
    nop
    ret nz

    ret nz

    ld [hl], b
    ldh a, [$ffb8]
    ld hl, sp-$44
    db $e4
    inc e
    db $fc
    sbc $fe
    cp $7a
    rst $38
    push af
    rst $38
    push af
    rst $38
    sub c
    rst $38
    ldh a, [rIE]
    ei
    rst $38
    adc e
    ld a, a
    ld a, l
    dec de
    dec de
    rst $38
    cpl
    rst $38
    cpl
    rst $38
    adc c
    rst $38
    rrca
    rst $38
    rst $18
    rst $38
    pop de
    cp $be
    ret c

    ret c

    inc b
    nop
    nop
    ld bc, $0301

jr_00a_567b:
    ld [bc], a
    rlca

jr_00a_567d:
    inc b
    rrca

jr_00a_567f:
    rrca

jr_00a_5680:
    rrca
    dec c
    rra

jr_00a_5683:
    inc de
    rra
    ld d, $f0
    ldh a, [$ffe8]
    jr jr_00a_567f

    inc c
    ld a, [$fa06]
    add $f2
    adc $fc
    inc d
    db $fc
    inc d
    ccf
    inc l
    ccf
    jr nz, jr_00a_571a

    ld b, b
    ld a, a
    ld b, b
    ld a, a
    ld b, b
    ld a, $3f
    rrca
    ld [$0f0f], sp
    add sp, $18
    ret z

    jr c, jr_00a_567b

    jr nc, jr_00a_567d

    jr nc, jr_00a_56bf

    ldh a, [$ffd0]
    jr nc, jr_00a_5683

    jr nc, @-$0e

    ldh a, [rDIV]
    nop
    nop
    ld bc, $0301
    ld [bc], a
    rlca
    inc b

jr_00a_56bf:
    rrca
    ld [$1f1f], sp
    rra
    dec e
    ccf
    inc hl
    nop
    nop
    ld hl, sp-$08
    db $f4
    inc c
    ld a, [$fd06]
    inc bc
    db $fd
    db $e3
    ld sp, hl
    rst $20
    cp $0a
    ccf
    ld h, $7f
    ld e, h
    ld a, a
    ld b, b
    rst $38
    rst $38
    rst $38
    add b
    db $fc
    add e
    ld a, a
    ld a, h
    rra
    rra
    cp $0a
    db $f4
    inc c
    db $e4
    sbc h
    add sp, $18
    adc b
    ld a, b
    ld l, b
    sbc b
    add sp, $18
    ld hl, sp-$08
    inc b
    nop
    nop
    ld bc, $1e01
    rra
    add hl, hl
    scf
    ld [hl], a
    ld a, a
    add hl, hl
    scf
    rra
    ld e, $6e
    ld a, e
    nop
    nop
    add b
    add b
    ld a, b
    ld hl, sp-$6c
    db $ec
    xor $fe
    sub h
    db $ec
    cp b
    ld a, b
    halt
    sbc $bb
    push de

jr_00a_571a:
    or l
    sbc $5b
    ld [hl], l
    ld e, [hl]
    ld a, a
    inc [hl]
    dec sp
    dec d
    dec de
    ld a, [bc]
    ld c, $04
    inc b
    db $dd
    xor e
    xor l
    ld a, e
    jp c, Jump_00a_7aae

    cp $2c
    call c, $d8a8
    ld d, b
    ld [hl], b
    jr nz, jr_00a_5758

    inc b
    ld bc, $1e01
    rra
    add hl, hl
    scf
    ld [hl], a
    ld a, a
    xor c
    or a
    rst $18
    sbc $ae
    ei
    cp e
    push de
    add b
    add b
    ld a, b
    ld hl, sp-$6c
    db $ec
    xor $fe
    sub l
    db $ed
    cp e
    ld a, e
    ld [hl], l
    rst $18
    db $dd

jr_00a_5758:
    xor e
    or l
    sbc $7b
    ld [hl], l
    ld e, $1f
    add hl, hl
    ld [hl], $34
    dec sp
    dec d
    dec de
    ld a, [bc]
    ld c, $04
    inc b
    xor l
    ld a, e
    sbc $ae
    ld a, b
    ld hl, sp-$6c
    ld l, h
    inc l
    call c, $d8a8
    ld d, b
    ld [hl], b
    jr nz, @+$22

    inc b
    nop
    nop
    rlca
    rlca
    rrca
    ld [$101f], sp
    ld e, a
    ld d, [hl]
    rst $38
    or [hl]
    rst $38
    or b
    rst $38
    or c
    nop
    nop
    ldh [$ffe0], a
    ldh a, [rNR10]
    ld hl, sp+$08
    ld hl, sp+$68
    ld hl, sp+$68
    ld hl, sp+$08
    cp $8e
    rst $38
    add c
    ld a, a
    ld [hl], b
    rra
    db $10
    rra
    rra
    ld de, $111e
    ld e, $11
    ld e, $0f
    rrca
    rst $38
    add c
    rst $38
    dec c
    rst $38
    dec c
    rst $38
    rst $38
    adc d
    ld a, d
    adc b
    ld a, b
    adc b
    ld a, b
    ldh a, [$fff0]
    inc b
    rlca
    rlca
    rrca
    ld [$101f], sp
    rra
    ld d, $1f
    ld d, $1f
    db $10
    ld a, a
    ld [hl], c
    rst $38
    add c
    ldh [$ffe0], a
    ldh a, [rNR10]
    ld hl, sp+$08
    ld a, [$ff6a]
    ld l, l
    rst $38
    dec c
    rst $38
    adc l
    rst $38
    add c
    rst $38
    or b
    rst $38
    or b
    rst $38
    cp a
    ld d, c
    ld e, [hl]
    ld de, $111e
    ld e, $08
    rrca
    rlca
    rlca
    cp $0e
    ld hl, sp+$08
    ld hl, sp-$08
    adc b
    ld a, b
    adc b
    ld a, b
    adc b
    ld a, b
    db $10
    ldh a, [$ffe0]
    ldh [rDIV], a
    ld b, $06
    rrca
    add hl, bc
    inc c
    dec bc
    inc c
    dec bc
    ld a, [de]
    rla
    dec e
    rla
    jr nc, jr_00a_5839

    inc sp
    cpl
    nop
    nop
    add b
    add b
    ld [hl], b
    ldh a, [$ff0e]
    cp $03
    rst $38
    inc hl
    rst $38
    ld d, d
    cp $96
    cp $64
    ld e, a
    ld h, [hl]
    ld e, a
    res 7, a
    jp c, $e0bf

    rst $38
    jr nc, jr_00a_5867

    rrca
    rrca
    ld bc, $0601
    cp $c4
    db $fc
    and h
    db $fc
    xor h
    db $fc
    xor b
    ld hl, sp+$08
    ld hl, sp+$18

jr_00a_5839:
    ld hl, sp-$10
    ldh a, [rDIV]
    nop
    nop
    nop
    nop
    rlca
    rlca
    ld c, $09
    rrca
    ld [$101f], sp
    ccf
    jr nz, jr_00a_588b

    jr nz, jr_00a_584e

jr_00a_584e:
    nop
    nop
    nop
    add b
    add b
    ld [hl], b
    ldh a, [$ffcc]
    inc a
    ei
    rlca
    di
    ccf
    or $ce
    ld a, a
    ld b, d
    ld a, a
    ld b, h
    rst $38
    add b
    db $fc
    db $e3
    ccf
    ccf

jr_00a_5867:
    ld bc, $0001
    nop
    nop
    nop
    or $0e
    db $f4
    adc h
    db $ec
    inc e
    ld [$18f8], sp
    ld hl, sp-$10
    ldh a, [rP1]
    nop
    nop
    nop
    inc b
    nop
    nop
    rrca
    rrca
    rra
    db $10
    scf
    cpl

jr_00a_5886:
    ld l, a
    ld e, a
    rst $18
    cp a
    rst $38

jr_00a_588b:
    add b
    rst $18
    cp a
    nop
    nop
    ldh a, [$fff0]
    ld [$f4f8], sp
    db $fc
    ld a, [$fdfe]
    rst $38
    ld bc, $fdff
    rst $38
    ld l, a
    ld e, a
    scf
    cpl
    dec de
    rla
    dec c
    dec bc
    ld b, $05
    inc bc
    ld [bc], a
    ld bc, $0001
    nop
    ld a, [$f4fe]
    db $fc
    add sp, -$08
    ret nc

    ldh a, [$ffa0]
    ldh [rLCDC], a
    ret nz

    add b
    add b
    nop
    nop
    inc b
    nop
    nop
    rrca

jr_00a_58c2:
    rrca
    db $10
    rra
    dec l
    ld a, $5b
    ld a, h
    or e
    db $fc
    add b
    rst $38
    or e
    db $fc
    nop
    nop
    ldh a, [$fff0]
    ret c

    jr c, jr_00a_58c2

    inc e
    or $0e

jr_00a_58d9:
    ei
    rlca
    rst $38
    inc bc
    ld sp, hl
    rlca
    ld e, e
    ld a, h
    add hl, hl
    ld a, $15
    ld e, $0a
    rrca
    inc b
    rlca
    ld [bc], a
    inc bc
    ld bc, $0001
    nop
    ldh a, [c]
    ld c, $e4
    inc e
    ret z

    jr c, jr_00a_5886

    ld [hl], b
    jr nz, jr_00a_58d9

    ld b, b
    ret nz

    add b
    add b
    nop
    nop
    inc b
    nop
    nop
    rrca
    rrca
    rra
    dec d
    ld a, $2b
    ld a, a
    ld d, l
    db $fc
    add e
    rst $38
    rst $38
    db $fc
    add e
    nop
    nop
    ldh a, [$fff0]
    ld a, b
    ld hl, sp-$44
    db $fc
    cp $7e
    rrca
    rst $38
    rst $38
    rst $38
    rrca
    rst $38
    ld a, a
    ld a, a
    ld a, $2b
    rra
    dec d
    ld c, $0b
    rlca
    dec b
    inc bc
    inc bc
    ld bc, $0001
    nop
    cp $fe
    cp h
    db $fc
    ld a, b
    ld hl, sp-$10
    ldh a, [$ffe0]
    ldh [$ffc0], a
    ret nz

    add b
    add b
    nop
    nop
    inc b
    nop
    nop
    rrca
    rrca
    ld e, $1f
    dec a
    ccf
    ld a, a
    ld a, [hl]
    ldh a, [rIE]
    rst $38
    rst $38
    ldh a, [rIE]
    nop
    nop
    ldh a, [$fff0]
    ld hl, sp-$58
    ld a, h
    call nc, $aafe

jr_00a_595b:
    ccf
    pop bc
    rst $38
    rst $38
    ccf
    pop bc
    ld a, a
    ld a, a
    dec a
    ccf
    ld e, $1f
    rrca
    rrca
    rlca
    rlca
    inc bc
    inc bc
    ld bc, $0001
    nop
    cp $fe
    ld a, h
    call nc, $a8f8
    ld [hl], b
    ret nc

    ldh [$ffa0], a
    ret nz

    ret nz

    add b
    add b
    nop
    nop
    inc b
    nop
    nop
    rrca
    rrca
    rra
    db $10
    scf

jr_00a_5989:
    jr z, @+$71

    ld d, b
    rst $38
    add b
    rst $38
    rst $38
    rst $38
    add b
    nop
    nop
    ldh a, [$fff0]
    adc b
    ld a, b
    call nz, $e23c
    ld e, $f1
    rrca
    rst $38
    rst $38
    pop af
    rrca
    ld l, a
    ld d, b
    scf
    jr z, jr_00a_59c6

    db $10
    rrca
    ld [$0407], sp
    inc bc
    ld [bc], a
    ld bc, $0001
    nop
    ldh [c], a
    ld e, $e4
    inc e
    ret z

    jr c, jr_00a_5989

    jr nc, jr_00a_595b

    ld h, b
    ld b, b
    ret nz

    add b
    add b
    nop

jr_00a_59c1:
    nop
    inc b
    nop
    nop
    rrca

jr_00a_59c6:
    rrca
    inc d
    dec de
    jr z, jr_00a_5a02

jr_00a_59cb:
    ld e, b
    ld h, a
    or b
    rst $08
    rst $38
    rst $38
    or b
    rst $08
    nop
    nop
    ldh a, [$fff0]
    ld a, b
    adc b
    inc a
    call nz, $e21e
    rrca
    pop af
    rst $38
    rst $38
    rrca
    pop af
    ld e, b
    ld h, a
    jr z, jr_00a_5a1e

    inc d
    dec de
    ld [$040f], sp
    rlca
    ld [bc], a
    inc bc
    ld bc, $0001
    nop
    ld e, $e2
    inc e
    db $e4
    jr c, jr_00a_59c1

    jr nc, jr_00a_59cb

    ld h, b
    and b
    ret nz

    ld b, b
    add b
    add b
    nop

jr_00a_5a02:
    nop
    inc b
    nop
    nop
    rrca
    rrca
    jr jr_00a_5a21

    jr nc, @+$31

    ld h, b
    ld e, a
    cp $81
    rst $38
    rst $38
    ldh a, [$ff8f]
    nop
    nop
    ldh a, [$fff0]
    ld a, b
    ld hl, sp+$3c
    db $fc
    ld e, $fe

jr_00a_5a1e:
    rrca
    rst $38
    rst $38

jr_00a_5a21:
    rst $38
    rrca
    rst $38
    ld h, b
    ld e, a
    jr nc, jr_00a_5a57

    db $10
    rra
    ld [$040f], sp
    rlca
    ld [bc], a
    inc bc
    ld bc, $0001

jr_00a_5a33:
    nop
    ld e, $fe
    inc e
    db $fc
    jr c, @-$06

    jr nc, @-$0e

    ld h, b
    ldh [$ffc0], a
    ret nz

    add b
    add b
    nop
    nop
    inc b
    nop
    nop
    rrca
    rrca
    inc de
    rra
    ld h, $3f

jr_00a_5a4d:
    ld c, h
    ld a, a
    sbc c
    cp $ff
    rst $38
    sbc c
    cp $00
    nop

jr_00a_5a57:
    ldh a, [$fff0]
    jr z, jr_00a_5a33

    ld d, h
    xor h
    ld a, [$fd06]
    inc bc
    rst $38
    rst $38
    db $fd
    inc bc
    ld c, h
    ld a, a
    inc h
    ccf
    ld d, $1f
    ld a, [bc]
    rrca
    dec b
    rlca
    ld [bc], a
    inc bc
    ld bc, $0001
    nop
    ld a, [$7406]
    adc h
    ld e, b
    xor b
    jr nc, jr_00a_5a4d

    jr nz, @-$1e

    ld b, b
    ret nz

    add b
    add b
    nop
    nop
    inc b
    nop
    nop
    inc bc
    inc bc
    inc c
    rrca

jr_00a_5a8c:
    rla
    jr jr_00a_5abe

    jr nc, jr_00a_5ac0

    jr nc, jr_00a_5ac2

    jr nc, @+$29

    add hl, sp
    nop
    nop
    ret nz

    ret nz

    jr nc, jr_00a_5a8c

    ld [$84f8], sp
    ld a, h
    call nz, $c47c
    db $fc
    call nz, Call_000_20fc
    ccf
    db $10
    rra
    inc e
    rra
    ccf
    ccf
    ccf
    ld h, $7f
    ld e, a
    ld a, l
    ld a, l
    nop
    nop
    inc b
    db $fc
    ld [$38f8], sp
    ld hl, sp-$04
    db $fc

jr_00a_5abe:
    db $fc
    db $e4

jr_00a_5ac0:
    cp $7a

jr_00a_5ac2:
    sbc $de
    nop
    nop
    inc b
    nop
    nop
    inc bc
    inc bc
    rrca
    inc c
    inc e
    inc de
    dec sp
    inc h
    scf
    jr z, jr_00a_5b0b

    jr z, jr_00a_5b0c

    add hl, hl
    nop
    nop
    ret nz

    ret nz

    ldh a, [$ff30]
    ld hl, sp+$08
    db $fc
    inc b
    cp h
    ld b, h
    inc a
    call nz, $c43c
    dec sp
    inc h
    rra
    db $10
    rra
    inc e
    ccf
    ccf
    ccf
    ld h, $7f
    ld e, a
    ld a, l
    ld a, l
    nop
    nop
    db $fc
    inc b
    ld hl, sp+$08
    ld hl, sp+$38
    db $fc
    db $fc
    db $fc
    db $e4
    cp $7a
    sbc $de
    nop
    nop
    inc b
    nop
    nop
    nop

jr_00a_5b0b:
    nop

jr_00a_5b0c:
    inc bc
    inc bc
    rrca
    ld c, $1f
    rla
    rra
    rra
    ccf
    ld l, $3f
    jr nz, jr_00a_5b19

jr_00a_5b19:
    nop
    ldh a, [$fff0]
    ld hl, sp-$78
    db $fc
    ld a, h
    and $7e
    jp nc, $ca5e

    ld c, [hl]
    adc d
    adc [hl]
    rra
    rra
    ld e, $1a
    ld e, $12
    ld e, $12
    rrca
    add hl, bc
    rrca
    ld [$0607], sp
    ld bc, $0a01
    ld c, $0a
    ld c, $0a
    ld c, $12
    ld e, $24
    inc a
    call z, $f8fc
    ld a, b
    ldh [$ffe0], a
    inc b
    nop
    nop
    nop
    nop
    ld bc, $0701
    rlca
    rra
    inc e
    ccf
    ld l, $3f
    ld a, $7f
    ld e, h
    nop
    nop
    nop
    nop
    ld hl, sp-$08
    db $fc
    inc b
    cp $fe
    sub e
    sbc a
    adc c
    adc a
    add l
    add a
    ld a, a
    ld b, c
    ld a, $3e
    inc a
    inc [hl]
    inc a
    inc h
    ld e, $12
    rra
    ld de, $0c0f
    inc bc
    inc bc
    dec b
    rlca
    dec b
    rlca
    dec b
    rlca
    add hl, bc
    rrca
    ld [de], a
    ld e, $e6
    cp $8c
    db $fc
    ldh a, [$fff0]
    inc b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add hl, sp
    add hl, sp
    ccf
    ld l, $00
    nop
    nop
    nop
    nop
    nop
    rlca
    rlca
    rra
    add hl, de
    ld a, a
    ld h, c
    cp $86
    ld hl, sp+$18
    rra
    inc d
    rra
    dec d
    ld l, a
    ld a, e
    xor a
    db $fd
    or a
    push af
    jp Jump_000_00c3


    nop
    nop
    nop
    ldh [$ff60], a
    add b
    add b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [$1d08], sp
    dec d
    rra
    ld d, $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rra
    rra
    rst $38
    pop hl
    rst $38
    ld bc, $141f
    ld l, a
    ld a, d
    xor a
    ei
    cp [hl]
    ld a, [$cace]
    ld b, $06
    nop
    nop
    nop
    nop
    cp $1e
    ldh [$ffe0], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc b
    inc bc
    inc bc
    rrca
    inc c
    rra
    ld de, $223f
    ld a, a
    ld b, b
    ld a, a
    ld e, c
    rst $38
    cp e
    rst $38
    cp e
    ldh [$ffe0], a
    sbc b
    ld hl, sp-$3c
    ld a, h
    ldh [c], a
    ld a, $f2
    ld c, $f1
    rst $08
    ld sp, hl
    rst $20
    ld sp, hl

jr_00a_5c2b:
    rst $20
    rst $38
    sub c
    rst $38
    add h
    ld a, a
    ld c, h
    ld a, a
    ld b, b
    ccf
    ld a, [hl+]
    rst $38
    sub l
    ld a, a
    ld b, b
    ccf
    ccf
    ld sp, hl
    rst $20
    ld sp, hl
    rst $00
    ldh a, [c]
    ld c, $f2
    ld e, $e4
    cp h
    ret z

    ld a, b
    ret nc

    jr nc, jr_00a_5c2b

    ldh [rDIV], a
    rlca
    rlca
    rra
    jr jr_00a_5c91

    jr nz, jr_00a_5cd3

    ld c, b
    ld a, a
    ld e, l
    ld a, a
    ld e, l
    rst $38
    sbc b
    rst $38
    add d
    ldh [$ffe0], a
    sbc b
    ld a, b
    call nz, $e23c
    cp $f2
    cp $f9
    rst $38
    ld sp, hl
    rst $30
    ld sp, hl

jr_00a_5c6c:
    daa
    rst $38
    add a
    rst $38
    jp nc, Jump_000_2f2d

    inc b
    rlca
    ld a, [hl+]
    cpl
    ld a, a
    ld d, l
    ld a, a
    ld b, b
    ccf
    ccf
    ld sp, hl
    rlca
    ld sp, hl
    ld e, a
    xor [hl]
    cp $12
    cp $a4
    db $fc
    ret z

    ld a, b
    ret nc

    jr nc, jr_00a_5c6c

    ldh [rDIV], a
    nop
    nop
    inc bc

jr_00a_5c91:
    inc bc
    rlca
    inc b
    rrca
    ld [$000f], sp
    rra
    ld [de], a
    rra
    ld de, $101f
    ldh a, [$fff0]
    db $fc
    inc c
    cp $62
    cp $92
    rst $38
    add hl, bc
    db $fd
    ld c, e
    db $fd
    inc de
    ld sp, hl
    rst $20
    rrca
    ld [$0407], sp
    rrca
    dec bc
    inc e
    inc d
    jr c, @+$2a

    ld [hl], b
    ld d, b
    ldh [$ffa0], a

jr_00a_5cbc:
    ret nz

    ret nz

    ldh a, [c]
    ld c, $c4
    inc a
    jr jr_00a_5cbc

    ldh [$ffe0], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc b
    nop
    nop
    nop
    nop

jr_00a_5cd3:
    nop
    nop
    ld bc, $0301
    ld [bc], a
    rlca
    inc b
    rlca
    inc b
    rrca
    add hl, bc
    jr jr_00a_5cf9

    ld a, h
    ld h, h
    cp $82
    cp $12
    ld a, [$f216]
    ld l, $e4
    ld e, h
    ret z

    cp b
    rrca
    ld [$0704], sp
    dec bc
    rrca
    inc d
    inc e
    jr z, jr_00a_5d31

jr_00a_5cf9:
    ld d, b
    ld [hl], b
    and b
    ldh [$ffc0], a
    ret nz

    db $10
    ldh a, [$ff60]
    ldh [$ff80], a
    add b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc b
    rlca
    rlca
    ld a, a
    ld a, b
    ld a, a
    ld b, b
    ld a, a
    ld b, d
    ccf
    ld [hl+], a
    ld a, a
    ld b, a
    ld a, d
    ld c, a
    ld a, d
    ld c, a
    ldh [$ffe0], a
    cp $1e
    cp $02
    cp $42
    db $fc
    ld b, h
    cp $e2
    ld e, [hl]
    ldh a, [c]
    ld e, [hl]
    ldh a, [c]
    ld a, a

jr_00a_5d31:
    ld b, a
    cpl
    jr nc, jr_00a_5db4

    ld b, b
    ld a, a
    ld b, b
    ccf
    jr nz, jr_00a_5d78

    ld [hl+], a
    rra
    inc de
    inc c
    inc c
    cp $e2
    db $f4
    inc c
    cp $02
    cp $02
    db $fc
    inc b
    cp h
    ld b, h
    ld hl, sp-$38
    jr nc, jr_00a_5d80

    inc b
    ld [hl], a
    ld [hl], a
    ld a, a
    ld c, b
    ld a, a
    ld b, d
    ccf
    ld [hl+], a
    ld a, a
    ld b, a
    ld a, d
    ld c, a
    ld a, d
    ld c, a
    rst $38
    and a
    xor $ee
    cp $12
    cp $42
    db $fc
    ld b, h
    cp $e2
    ld e, [hl]
    ldh a, [c]
    ld e, [hl]
    ldh a, [c]
    rst $38
    push hl
    rst $28
    sub b
    ld a, a
    ld b, b
    ccf
    jr nz, jr_00a_5db7

jr_00a_5d78:
    jr nz, jr_00a_5db7

    ld [hl+], a
    dec a
    inc hl
    ld e, $12
    inc c

jr_00a_5d80:
    inc c
    rst $30
    add hl, bc
    cp $02
    db $fc
    inc b
    db $fc
    inc b
    cp h
    ld b, h
    cp h
    call nz, Call_00a_4878
    jr nc, jr_00a_5dc1

    inc b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ccf
    ccf
    ld a, a
    ld b, d
    pop bc
    cp a
    pop bc
    cp a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ldh a, [$fff0]
    ld hl, sp-$58
    ld e, h
    db $fc
    ld d, h
    db $fc
    pop bc
    cp a

jr_00a_5db4:
    rst $38
    rst $38
    rst $38

jr_00a_5db7:
    add c
    pop bc
    cp a
    pop bc
    cp a
    pop bc
    cp a
    pop bc
    cp a
    rst $38

jr_00a_5dc1:
    rst $38
    ld d, h
    db $fc
    db $fc
    db $fc
    db $fc
    ld d, h
    ld d, h
    db $fc
    ld d, h
    db $fc
    ld d, h
    db $fc
    ld d, h
    db $fc
    db $fc
    db $fc
    inc b
    nop
    nop
    nop
    nop
    rlca
    rlca
    rlca
    inc b
    ld b, $05
    ld b, $05
    ld b, $05
    ld b, $05
    nop
    nop
    nop
    nop
    db $fc
    db $fc
    cp $aa
    ld d, l
    rst $38
    ld d, l
    rst $38
    ld d, l
    rst $38
    ld d, l
    rst $38
    rlca
    inc b
    ld a, a
    ld a, a
    rst $38
    add c
    pop bc
    cp a
    pop bc
    cp a
    pop bc
    cp a
    pop bc
    cp a
    rst $38
    rst $38
    xor d
    cp $fc
    db $fc
    db $fc
    ld d, h
    ld d, h
    db $fc
    ld d, h
    db $fc
    ld d, h
    db $fc
    ld d, h
    db $fc
    db $fc
    db $fc
    ld [$0000], sp
    inc a
    inc a
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld [hl], b
    ld h, b
    ld [hl], b
    ld [hl], b
    jr c, jr_00a_5e5c

    inc e
    inc e
    ld c, $0e
    ld c, $06
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    inc a
    inc a
    nop
    nop
    nop
    nop
    ld a, [hl]
    ld a, [hl]
    jr jr_00a_5e52

    jr jr_00a_5e54

    jr jr_00a_5e56

    jr jr_00a_5e58

    jr jr_00a_5e5a

    jr jr_00a_5e5c

    jr jr_00a_5e5e

    jr jr_00a_5e60

    jr jr_00a_5e62

    jr jr_00a_5e64

    jr jr_00a_5e66

    jr jr_00a_5e68

    jr jr_00a_5e6a

jr_00a_5e52:
    nop
    nop

jr_00a_5e54:
    nop
    nop

jr_00a_5e56:
    jr jr_00a_5e70

jr_00a_5e58:
    inc a
    inc a

jr_00a_5e5a:
    ld h, [hl]
    inc h

jr_00a_5e5c:
    ld h, [hl]
    ld h, [hl]

jr_00a_5e5e:
    ld h, [hl]
    ld h, [hl]

jr_00a_5e60:
    ld h, [hl]
    ld h, [hl]

jr_00a_5e62:
    ld h, [hl]
    ld h, [hl]

jr_00a_5e64:
    ld h, [hl]
    ld h, [hl]

jr_00a_5e66:
    ld a, [hl]
    ld a, [hl]

jr_00a_5e68:
    ld h, [hl]
    ld h, [hl]

jr_00a_5e6a:
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]

jr_00a_5e70:
    ld h, [hl]
    ld h, [hl]
    nop
    nop
    nop
    nop
    ld a, h
    ld a, h
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld a, h
    ld a, h
    ld l, h
    ld l, h
    ld l, [hl]
    ld l, h
    ld l, [hl]
    ld l, [hl]
    ld l, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Jump_00a_7aae:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
