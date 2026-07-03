; ============================================================================
; BANK $0B - Level Data
; ============================================================================
; Address: $4000-$7FFF (switchable)
;
; Level layout data and graphics assets.
;
; ============================================================================
; Originally disassembled with mgbdis v3.0 by Matt Currie

SECTION "ROM Bank $00b", ROMX[$4000], BANK[$b]

    and b
    ld b, c
    or l
    ld b, c
    jp z, $e941

    ld b, c
    ld [$1d42], sp
    ld b, d
    ld [hl-], a
    ld b, d
    ld e, e
    ld b, d
    add h
    ld b, d
    xor l
    ld b, d
    sub $42
    push af
    ld b, d
    inc d
    ld b, e
    inc sp
    ld b, e
    ld d, d
    ld b, e
    ld [hl], c
    ld b, e
    sub b
    ld b, e
    xor a
    ld b, e
    adc $43
    db $ed
    ld b, e
    inc c
    ld b, h
    ld c, c
    ld b, h
    add [hl]
    ld b, h
    jp Jump_000_0044


    ld b, l
    dec d
    ld b, l
    ld a, [hl+]
    ld b, l
    ld h, a
    ld b, l
    and h
    ld b, l
    jp $e245


    ld b, l
    ld bc, $2046
    ld b, [hl]
    ld [hl], c
    ld b, [hl]
    jp nz, Jump_000_1346

    ld b, a
    ld h, h
    ld b, a
    sub d
    ld b, a
    ret nz

    ld b, a
    xor $47
    inc e
    ld c, b
    ld [hl], a
    ld c, b
    jp nc, $f148

    ld c, b
    rra
    ld c, c
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    ld a, $49
    xor l
    ld c, c
    cp b
    ld c, c
    call $ec49
    ld c, c
    dec d
    ld c, d
    ld c, b
    ld c, d
    ld [hl], c
    ld c, d
    sub b
    ld c, d
    and l
    ld c, d
    or b
    ld c, d
    ret nz

    ld c, d
    ret nc

    ld c, d
    sub $4a
    sub $4a
    sub $4a
    db $eb
    ld c, d
    nop
    ld c, e
    dec d
    ld c, e
    ld a, [hl+]
    ld c, e
    ccf
    ld c, e
    ld d, h
    ld c, e
    ld l, c
    ld c, e
    ld a, [hl]
    ld c, e
    push bc
    ld c, e
    xor $4b
    db $f4
    ld c, e
    ld a, [$004b]
    ld c, h
    ld b, $4c
    inc c
    ld c, h
    ld [de], a
    ld c, h
    jr jr_00b_414e

    scf
    ld c, h
    ld d, [hl]
    ld c, h
    adc c
    ld c, h
    cp h
    ld c, h
    pop de
    ld c, h
    and $4c
    ei
    ld c, h
    db $10
    ld c, l
    dec h
    ld c, l
    ld a, [hl-]
    ld c, l
    ld c, a
    ld c, l
    ld h, h
    ld c, l
    ld a, c
    ld c, l
    sub e
    ld c, l
    xor l
    ld c, l
    rst $00
    ld c, l
    pop hl
    ld c, l
    ei
    ld c, l
    dec d
    ld c, [hl]
    cpl
    ld c, [hl]
    ld c, c
    ld c, [hl]
    ld h, e
    ld c, [hl]
    ld a, l
    ld c, [hl]
    sub a
    ld c, [hl]
    or c
    ld c, [hl]
    bit 1, [hl]
    push hl
    ld c, [hl]
    rst $38
    ld c, [hl]
    ld e, $4f
    dec a
    ld c, a
    ld e, h
    ld c, a
    ld a, e
    ld c, a
    inc e
    ld d, b
    daa
    ld d, b
    ld [hl-], a
    ld d, b
    jr c, jr_00b_419a

    add h
    ld d, b
    adc a
    ld d, b

jr_00b_414e:
    sub l
    ld d, b
    sbc e
    ld d, b
    and c
    ld d, b
    and a
    ld d, b
    xor l
    ld d, b
    or e
    ld d, b
    cp c
    ld d, b
    cp c
    ld d, b
    cp c
    ld d, b
    cp c
    ld d, b
    db $ec
    ld d, b
    rst $30
    ld d, b
    ld [bc], a
    ld d, c
    dec c
    ld d, c
    jr @+$53

    inc hl
    ld d, c
    ld l, $51
    add hl, sp
    ld d, c
    ld b, h
    ld d, c
    ld c, a
    ld d, c
    ld e, d
    ld d, c
    ld h, b
    ld d, c
    ld h, [hl]
    ld d, c
    ld l, h
    ld d, c
    ld [hl], a
    ld d, c
    ld [hl], a
    ld d, c
    or h
    ld d, c
    ret


    ld d, c
    sbc $51
    di
    ld d, c
    dec c
    ld d, d
    ld c, d
    ld d, d
    ld a, l
    ld d, d
    or b
    ld d, d
    or b
    ld d, d
    or b
    ld d, d
    or b
    ld d, d
    or b
    ld d, d

jr_00b_419a:
    or b
    ld d, d
    or b
    ld d, d
    or b
    ld d, d
    inc b
    ldh a, [rP1]
    ld bc, $9001
    ldh a, [$ff08]
    ld [bc], a
    ld bc, $f890
    nop
    inc bc
    ld bc, $f890
    ld [HeaderLogo], sp
    sub b
    inc b
    ldh a, [rP1]
    dec d
    ld bc, $f090
    ld [$0116], sp
    sub b
    ld hl, sp+$00
    rla
    ld bc, $f890
    ld [$0118], sp
    sub b
    ld b, $f0
    nop
    ld bc, $9001
    ldh a, [$ff08]
    ld [bc], a
    ld bc, $f090
    db $10
    inc bc
    ld bc, $f890
    nop
    inc b
    ld bc, $f890
    ld [$0105], sp
    sub b
    ld hl, sp+$10
    ld b, $01
    sub b
    ld b, $f0
    nop
    dec d
    ld bc, $f090
    ld [$0116], sp
    sub b
    ldh a, [rNR10]
    rla
    ld bc, $f890
    nop
    jr jr_00b_41fe

    sub b

jr_00b_41fe:
    ld hl, sp+$08
    add hl, de
    ld bc, $f890
    db $10
    ld a, [de]
    ld bc, $0490
    ldh a, [rP1]
    ld [bc], a
    ld bc, $f0b0
    ld [$0101], sp
    or b
    ld hl, sp+$00
    inc b
    ld bc, $f8b0
    ld [$0103], sp
    or b
    inc b
    ldh a, [rP1]
    ld d, $01
    or b
    ldh a, [$ff08]
    dec d
    ld bc, $f8b0
    nop
    jr jr_00b_422d

    or b

jr_00b_422d:
    ld hl, sp+$08
    rla
    ld bc, $08b0
    ldh [rP1], a
    ld bc, $9001
    ldh [$ff08], a
    ld [bc], a
    ld bc, $e890
    nop
    inc bc
    ld bc, $e890
    ld [HeaderLogo], sp
    sub b
    ldh a, [rP1]
    dec b
    ld bc, $f090
    ld [$0106], sp
    sub b
    ld hl, sp+$00
    rlca
    ld bc, $f890
    ld [$0108], sp
    sub b
    ld [$00e0], sp
    dec d
    ld bc, $e090
    ld [$0116], sp
    sub b
    add sp, $00
    rla
    ld bc, $e890
    ld [$0118], sp
    sub b
    ldh a, [rP1]
    add hl, de
    ld bc, $f090
    ld [$011a], sp
    sub b
    ld hl, sp+$00
    dec de
    ld bc, $f890
    ld [$011c], sp
    sub b
    ld [$00e0], sp
    ld [bc], a
    ld bc, $e0b0
    ld [$0101], sp
    or b
    add sp, $00
    inc b
    ld bc, $e8b0
    ld [$0103], sp
    or b
    ldh a, [rP1]
    ld b, $01
    or b
    ldh a, [$ff08]
    dec b
    ld bc, $f8b0
    nop
    ld [$b001], sp
    ld hl, sp+$08
    rlca
    ld bc, $08b0
    ldh [rP1], a
    ld d, $01
    or b
    ldh [$ff08], a
    dec d
    ld bc, $e8b0
    nop
    jr jr_00b_42bd

    or b

jr_00b_42bd:
    add sp, $08
    rla
    ld bc, $f0b0
    nop
    ld a, [de]
    ld bc, $f0b0
    ld [$0119], sp
    or b
    ld hl, sp+$00
    inc e
    ld bc, $f8b0
    ld [$011b], sp
    or b
    ld b, $e8
    nop
    ld bc, $9001
    add sp, $08
    ld [bc], a
    ld bc, $f090
    nop
    inc bc
    ld bc, $f090
    ld [HeaderLogo], sp
    sub b
    ld hl, sp+$00
    dec b
    ld bc, $f890
    ld [$0106], sp
    sub b
    ld b, $e8
    nop
    dec d
    ld bc, $e890
    ld [$0116], sp
    sub b
    ldh a, [rP1]
    rla
    ld bc, $f090
    ld [$0118], sp
    sub b
    ld hl, sp+$00
    add hl, de
    ld bc, $f890
    ld [$011a], sp
    sub b
    ld b, $e8
    nop
    ld [bc], a
    ld bc, $e8b0
    ld [$0101], sp
    or b
    ldh a, [rP1]
    inc b
    ld bc, $f0b0
    ld [$0103], sp
    or b
    ld hl, sp+$00
    ld b, $01
    or b
    ld hl, sp+$08
    dec b
    ld bc, $06b0
    add sp, $00
    ld d, $01
    or b
    add sp, $08
    dec d
    ld bc, $f0b0
    nop
    jr jr_00b_4343

    or b

jr_00b_4343:
    ldh a, [$ff08]
    rla
    ld bc, $f8b0
    nop
    ld a, [de]
    ld bc, $f8b0
    ld [$0119], sp
    or b
    ld b, $f0
    nop
    ld bc, $9001
    ldh a, [$ff08]
    ld [bc], a
    ld bc, $f890
    nop
    inc bc
    ld bc, $f890
    ld [HeaderLogo], sp
    sub b
    nop
    nop
    dec b
    ld bc, $0090
    ld [$0106], sp
    sub b
    ld b, $f0
    nop
    dec d
    ld bc, $f090
    ld [$0116], sp
    sub b
    ld hl, sp+$00
    rla
    ld bc, $f890
    ld [$0118], sp
    sub b
    nop
    nop
    add hl, de
    ld bc, $0090
    ld [$011a], sp
    sub b
    ld b, $f0
    nop
    ld [bc], a
    ld bc, $f0b0
    ld [$0101], sp
    or b
    ld hl, sp+$00
    inc b
    ld bc, $f8b0
    ld [$0103], sp
    or b
    nop
    nop
    ld b, $01
    or b
    nop
    ld [$0105], sp
    or b
    ld b, $f0
    nop
    ld d, $01
    or b
    ldh a, [$ff08]
    dec d
    ld bc, $f8b0
    nop
    jr jr_00b_43bf

    or b

jr_00b_43bf:
    ld hl, sp+$08
    rla
    ld bc, $00b0
    nop
    ld a, [de]
    ld bc, $00b0
    ld [$0119], sp
    or b
    ld b, $f0
    ld hl, sp+$15
    ld bc, $f090
    nop
    ld d, $01
    sub b
    ldh a, [$ff08]
    rla
    ld bc, $f890
    ld hl, sp+$18
    ld bc, $f890
    nop
    add hl, de
    ld bc, $f890
    ld [$011a], sp
    sub b
    ld b, $f0
    nop
    rla
    ld bc, $f0b0
    ld [$0116], sp
    or b
    ldh a, [rNR10]
    dec d
    ld bc, $f8b0
    nop
    ld a, [de]
    ld bc, $f8b0
    ld [$0119], sp
    or b
    ld hl, sp+$10
    jr jr_00b_440c

    or b

jr_00b_440c:
    inc c
    add sp, -$08
    ld bc, $9001
    add sp, $00
    ld [bc], a
    ld bc, $e890
    ld [$0103], sp
    sub b
    add sp, $10
    inc b
    ld bc, $f090
    ld hl, sp+$05
    ld bc, $f090
    nop
    ld b, $01
    sub b
    ldh a, [$ff08]
    rlca
    ld bc, $f090
    db $10
    ld [$9001], sp
    ld hl, sp-$08
    add hl, bc
    ld bc, $f890
    nop
    ld a, [bc]
    ld bc, $f890
    ld [$010b], sp
    sub b
    ld hl, sp+$10
    inc c
    ld bc, $0c90
    add sp, -$08
    inc b
    ld bc, $e8b0
    nop
    inc bc
    ld bc, $e8b0
    ld [$0102], sp
    or b
    add sp, $10
    ld bc, $b001
    ldh a, [$fff8]
    ld [$b001], sp
    ldh a, [rP1]
    rlca
    ld bc, $f0b0
    ld [$0106], sp
    or b
    ldh a, [rNR10]
    dec b
    ld bc, $f8b0
    ld hl, sp+$0c
    ld bc, $f8b0
    nop
    dec bc
    ld bc, $f8b0
    ld [$010a], sp
    or b
    ld hl, sp+$10
    add hl, bc
    ld bc, $0cb0
    add sp, -$08
    dec d
    ld bc, $e890
    nop
    ld d, $01
    sub b
    add sp, $08
    rla
    ld bc, $e890
    db $10
    jr jr_00b_449b

    sub b

jr_00b_449b:
    ldh a, [$fff8]
    add hl, de
    ld bc, $f090
    nop
    ld a, [de]
    ld bc, $f090
    ld [$011b], sp
    sub b
    ldh a, [rNR10]
    inc e
    ld bc, $f890
    ld hl, sp+$1d
    ld bc, $f890
    nop
    ld e, $01
    sub b
    ld hl, sp+$08
    rra
    ld bc, $f890
    db $10
    jr nz, jr_00b_44c3

    sub b

jr_00b_44c3:
    inc c
    add sp, -$08
    jr jr_00b_44c9

    or b

jr_00b_44c9:
    add sp, $00
    rla
    ld bc, $e8b0
    ld [$0116], sp
    or b
    add sp, $10
    dec d
    ld bc, $f0b0
    ld hl, sp+$1c
    ld bc, $f0b0
    nop
    dec de
    ld bc, $f0b0
    ld [$011a], sp
    or b
    ldh a, [rNR10]
    add hl, de
    ld bc, $f8b0
    ld hl, sp+$20
    ld bc, $f8b0
    nop
    rra
    ld bc, $f8b0
    ld [$011e], sp
    or b
    ld hl, sp+$10
    dec e
    ld bc, $04b0
    ldh a, [rP1]
    ld bc, $1001
    ldh a, [$ff08]
    ld [bc], a
    ld bc, $f810
    nop
    inc bc
    ld bc, $f810
    ld [HeaderLogo], sp
    db $10
    inc b
    ldh a, [rP1]
    ld [bc], a

jr_00b_4519:
    ld bc, $f030
    ld [$0101], sp
    jr nc, jr_00b_4519

    nop
    inc b
    ld bc, $f830
    ld [$0103], sp
    jr nc, jr_00b_4537

    add sp, -$08
    dec d
    ld bc, $e810
    nop
    ld d, $01
    db $10
    add sp, $08

jr_00b_4537:
    rla
    ld bc, $e810
    db $10
    jr jr_00b_453f

    db $10

jr_00b_453f:
    ldh a, [$fff8]
    add hl, de
    ld bc, $f010
    nop
    ld a, [de]
    ld bc, $f010
    ld [$011b], sp
    db $10
    ldh a, [rNR10]
    inc e
    ld bc, $f810
    ld hl, sp+$1d

jr_00b_4556:
    ld bc, $f810
    nop
    ld e, $01
    db $10
    ld hl, sp+$08
    rra

jr_00b_4560:
    ld bc, $f810
    db $10
    jr nz, jr_00b_4567

    db $10

jr_00b_4567:
    inc c
    add sp, -$08
    jr @+$03

    jr nc, jr_00b_4556

    nop
    rla
    ld bc, $e830
    ld [$0116], sp
    jr nc, jr_00b_4560

    db $10
    dec d
    ld bc, $f030
    ld hl, sp+$1c
    ld bc, $f030
    nop
    dec de
    ld bc, $f030
    ld [$011a], sp
    jr nc, @-$0e

    db $10
    add hl, de
    ld bc, $f830
    ld hl, sp+$20
    ld bc, $f830
    nop
    rra

jr_00b_4598:
    ld bc, $f830
    ld [$011e], sp
    jr nc, jr_00b_4598

    db $10
    dec e
    ld bc, $0630
    ldh a, [$fff8]
    ld bc, $1001
    ldh a, [rP1]
    ld [bc], a
    ld bc, $f010
    ld [$0103], sp
    db $10
    ld hl, sp-$08
    inc b
    ld bc, $f810
    nop
    dec b
    ld bc, $f810
    ld [$0106], sp
    db $10
    ld b, $f0
    ld hl, sp+$15
    ld bc, $f010
    nop
    ld d, $01
    db $10
    ldh a, [$ff08]
    rla
    ld bc, $f810
    ld hl, sp+$18
    ld bc, $f810
    nop
    add hl, de
    ld bc, $f810

jr_00b_45de:
    ld [$011a], sp
    db $10
    ld b, $f0
    nop
    inc bc
    ld bc, $f030
    ld [$0102], sp
    jr nc, jr_00b_45de

    db $10
    ld bc, $3001
    ld hl, sp+$00
    ld b, $01
    jr nc, @-$06

    ld [$0105], sp
    jr nc, @-$06

jr_00b_45fd:
    db $10
    inc b
    ld bc, $0630
    ldh a, [rP1]
    rla
    ld bc, $f030
    ld [$0116], sp
    jr nc, jr_00b_45fd

    db $10
    dec d
    ld bc, $f830
    nop
    ld a, [de]

jr_00b_4614:
    ld bc, $f830
    ld [$0119], sp
    jr nc, jr_00b_4614

    db $10
    jr @+$03

    jr nc, jr_00b_4631

    ldh [$fff0], a
    ld bc, $1001
    ldh [$fff8], a
    ld [bc], a
    ld bc, $e010
    nop
    inc bc
    ld bc, $e010

jr_00b_4631:
    ld [HeaderLogo], sp
    db $10
    add sp, -$10
    dec b
    ld bc, $e810
    ld hl, sp+$06
    ld bc, $e810
    nop
    rlca
    ld bc, $e810
    ld [$0108], sp
    db $10
    ldh a, [$fff0]
    add hl, bc
    ld bc, $f010
    ld hl, sp+$0a
    ld bc, $f010
    nop
    dec bc
    ld bc, $f010
    ld [$010c], sp
    db $10
    ld hl, sp-$10
    dec c
    ld bc, $f810
    ld hl, sp+$0e
    ld bc, $f810
    nop
    rrca
    ld bc, $f810
    ld [$0110], sp
    db $10
    db $10
    ldh [$fff0], a
    dec d
    ld bc, $e010
    ld hl, sp+$16
    ld bc, $e010
    nop
    rla
    ld bc, $e010
    ld [$0118], sp
    db $10
    add sp, -$10
    add hl, de
    ld bc, $e810
    ld hl, sp+$1a
    ld bc, $e810
    nop
    dec de
    ld bc, $e810
    ld [$011c], sp
    db $10
    ldh a, [$fff0]
    dec e
    ld bc, $f010
    ld hl, sp+$1e
    ld bc, $f010
    nop
    rra
    ld bc, $f010
    ld [$0120], sp
    db $10

jr_00b_46ae:
    ld hl, sp-$10
    ld hl, $1001
    ld hl, sp-$08
    ld [hl+], a
    ld bc, $f810
    nop
    inc hl
    ld bc, $f810
    ld [$0124], sp
    db $10
    db $10
    ldh [rP1], a
    inc b
    ld bc, $e030
    ld [$0103], sp
    jr nc, jr_00b_46ae

    db $10

jr_00b_46cf:
    ld [bc], a
    ld bc, $e030
    jr @+$03

    ld bc, $e830
    nop
    ld [$3001], sp
    add sp, $08
    rlca
    ld bc, $e830
    db $10
    ld b, $01
    jr nc, jr_00b_46cf

    jr jr_00b_46ee

    ld bc, $f030
    nop
    inc c

jr_00b_46ee:
    ld bc, $f030
    ld [$010b], sp
    jr nc, @-$0e

    db $10
    ld a, [bc]
    ld bc, $f030
    jr @+$0b

    ld bc, $f830
    nop
    db $10

jr_00b_4702:
    ld bc, $f830
    ld [$010f], sp
    jr nc, jr_00b_4702

    db $10
    ld c, $01
    jr nc, @-$06

    jr @+$0f

    ld bc, $1030
    ldh [rP1], a
    jr @+$03

    jr nc, @-$1e

    ld [$0117], sp
    jr nc, @-$1e

    db $10
    ld d, $01
    jr nc, @-$1e

    jr @+$17

    ld bc, $e830
    nop
    inc e
    ld bc, $e830
    ld [$011b], sp
    jr nc, @-$16

    db $10
    ld a, [de]
    ld bc, $e830
    jr jr_00b_4753

    ld bc, $f030
    nop
    jr nz, @+$03

    jr nc, @-$0e

    ld [$011f], sp
    jr nc, @-$0e

    db $10
    ld e, $01
    jr nc, @-$0e

    jr @+$1f

    ld bc, $f830
    nop
    inc h

jr_00b_4753:
    ld bc, $f830
    ld [$0123], sp
    jr nc, jr_00b_4753

    db $10
    ld [hl+], a
    ld bc, $f830
    jr jr_00b_4783

    ld bc, $0930
    add sp, -$08
    ld bc, $9001
    add sp, $00
    ld [bc], a
    ld bc, $e890
    ld [$0103], sp
    sub b
    ldh a, [$fff8]
    inc b
    ld bc, $f090
    nop
    dec b
    ld bc, $f090
    ld [$0106], sp
    sub b

jr_00b_4783:
    ld hl, sp-$08
    rlca
    ld bc, $f890
    nop
    ld [$9001], sp
    ld hl, sp+$08
    add hl, bc
    ld bc, $0990
    add sp, -$08
    dec d
    ld bc, $e890
    nop
    ld d, $01
    sub b
    add sp, $08
    rla
    ld bc, $f090
    ld hl, sp+$18
    ld bc, $f090
    nop
    add hl, de
    ld bc, $f090
    ld [$011a], sp
    sub b
    ld hl, sp-$08
    dec de
    ld bc, $f890
    nop
    inc e
    ld bc, $f890
    ld [$011d], sp
    sub b
    add hl, bc
    add sp, -$08
    inc bc
    ld bc, $e8b0
    nop
    ld [bc], a
    ld bc, $e8b0
    ld [$0101], sp
    or b
    ldh a, [$fff8]
    ld b, $01
    or b
    ldh a, [rP1]
    dec b
    ld bc, $f0b0
    ld [HeaderLogo], sp
    or b
    ld hl, sp-$08
    add hl, bc
    ld bc, $f8b0
    nop
    ld [$b001], sp
    ld hl, sp+$08
    rlca
    ld bc, $09b0
    add sp, -$08
    rla
    ld bc, $e8b0
    nop
    ld d, $01
    or b
    add sp, $08
    dec d
    ld bc, $f0b0
    ld hl, sp+$1a
    ld bc, $f0b0
    nop
    add hl, de
    ld bc, $f0b0
    ld [$0118], sp
    or b
    ld hl, sp-$08
    dec e
    ld bc, $f8b0
    nop
    inc e
    ld bc, $f8b0
    ld [$011b], sp
    or b
    ld [de], a
    add sp, -$10
    ld bc, $9001
    add sp, -$08
    ld [bc], a
    ld bc, $e890
    nop
    inc bc
    ld bc, $e890
    ld [HeaderLogo], sp
    sub b
    add sp, $10
    dec b
    ld bc, $e890
    jr @+$08

    ld bc, $f090
    ldh a, [rTAC]
    ld bc, $f090
    ld hl, sp+$08
    ld bc, $f090
    nop
    add hl, bc
    ld bc, $f090
    ld [$010a], sp
    sub b
    ldh a, [rNR10]
    dec bc
    ld bc, $f090
    jr @+$0e

    ld bc, $f890
    ldh a, [$ff0d]
    ld bc, $f890
    ld hl, sp+$0e
    ld bc, $f890
    nop
    rrca
    ld bc, $f890
    ld [$0110], sp
    sub b
    ld hl, sp+$10
    ld de, $9001
    ld hl, sp+$18
    ld [de], a
    ld bc, $1290
    add sp, -$10
    dec d
    ld bc, $e890
    ld hl, sp+$16
    ld bc, $e890
    nop
    rla
    ld bc, $e890
    ld [$0118], sp
    sub b
    add sp, $10
    add hl, de
    ld bc, $e890
    jr @+$1c

    ld bc, $f090
    ldh a, [rNR31]
    ld bc, $f090
    ld hl, sp+$1c
    ld bc, $f090
    nop
    dec e
    ld bc, $f090
    ld [$011e], sp
    sub b
    ldh a, [rNR10]
    rra
    ld bc, $f090
    jr @+$22

    ld bc, $f890
    ldh a, [rNR42]
    ld bc, $f890
    ld hl, sp+$22
    ld bc, $f890
    nop
    inc hl
    ld bc, $f890
    ld [$0124], sp
    sub b
    ld hl, sp+$10
    dec h
    ld bc, $f890
    jr @+$28

    ld bc, $0690
    ldh a, [$fff8]
    ld bc, $9001
    ldh a, [rP1]
    ld [bc], a
    ld bc, $f090
    ld [$0103], sp
    sub b
    ld hl, sp-$08
    inc b
    ld bc, $f890
    nop
    dec b
    ld bc, $f890
    ld [$0106], sp
    sub b
    add hl, bc
    add sp, -$08
    dec d
    ld bc, $e810
    nop
    ld d, $01
    db $10
    add sp, $08
    rla
    ld bc, $f010
    ld hl, sp+$18
    ld bc, $f010
    nop
    add hl, de
    ld bc, $f010
    ld [$011a], sp
    db $10
    ld hl, sp-$08
    dec de
    ld bc, $f810
    nop
    inc e
    ld bc, $f810
    ld [$011d], sp
    db $10
    ld b, $e8
    nop
    dec d
    ld bc, $e810
    ld [$0116], sp
    db $10
    ldh a, [rP1]
    rla
    ld bc, $f010
    ld [$0118], sp
    db $10
    ld hl, sp+$00
    add hl, de
    ld bc, $f810
    ld [$011a], sp
    db $10
    ld d, $00
    nop
    jr z, @+$03

    stop
    ld [$0129], sp
    stop
    db $10
    add hl, hl
    ld bc, $0010
    jr @+$2b

    ld bc, $0010
    jr nz, @+$2b

    ld bc, $0010
    jr z, jr_00b_4984

    ld bc, $0010
    jr nc, jr_00b_4989

    ld bc, $0010
    jr c, @+$2b

    ld bc, $0010
    ld b, b
    add hl, hl
    ld bc, $0010
    ld c, b
    ld a, [hl+]
    ld bc, $0810
    nop
    dec hl
    ld bc, $0810
    ld c, b
    inc l
    ld bc, $1010
    nop
    dec l
    ld bc, $1010
    ld [$012e], sp

jr_00b_4984:
    db $10
    db $10
    db $10
    ld l, $01

jr_00b_4989:
    db $10
    db $10
    jr jr_00b_49bb

    ld bc, $1010
    jr nz, @+$30

    ld bc, $1010
    jr z, @+$30

    ld bc, $1010
    jr nc, @+$30

    ld bc, $1010
    jr c, jr_00b_49cf

    ld bc, $1010
    ld b, b
    ld l, $01
    db $10
    db $10
    ld c, b
    cpl
    ld bc, $0210
    nop
    nop
    ld bc, $0001
    ld [$0200], sp
    ld bc, $0400
    nop
    nop

jr_00b_49bb:
    ld bc, $0001
    ld [$0200], sp
    ld bc, $0000
    ld [$0103], sp
    nop
    ld [$0408], sp
    ld bc, $0600
    nop

jr_00b_49cf:
    nop
    ld bc, $0001
    ld [$0200], sp
    ld bc, $0000
    ld [$0103], sp
    nop
    ld [$0408], sp
    ld bc, $0000
    db $10
    dec b
    ld bc, $0800
    db $10
    ld b, $01
    nop
    ld [$0000], sp
    ld bc, $0001
    ld [$0200], sp
    ld bc, $0000
    ld [$0103], sp
    nop
    ld [$0408], sp
    ld bc, $0000
    db $10
    dec b
    ld bc, $0800
    db $10
    ld b, $01
    nop
    nop
    jr @+$09

    ld bc, $0800
    jr jr_00b_4a1b

    ld bc, $0a00
    nop
    nop
    ld bc, $0001

jr_00b_4a1b:
    ld [$0200], sp
    ld bc, $0000
    ld [$0103], sp
    nop
    ld [$0408], sp
    ld bc, $0000
    db $10
    dec b
    ld bc, $0800
    db $10
    ld b, $01
    nop
    nop
    jr @+$09

    ld bc, $0800
    jr jr_00b_4a44

    ld bc, $0000
    jr nz, jr_00b_4a44

    ld bc, $0800

jr_00b_4a44:
    jr nz, jr_00b_4a4a

    ld bc, $0800
    nop

jr_00b_4a4a:
    ld [$0103], sp
    nop
    ld [$0408], sp
    ld bc, $0000
    db $10
    dec b
    ld bc, $0800
    db $10
    ld b, $01
    nop
    nop
    jr @+$09

    ld bc, $0800
    jr jr_00b_4a6d

    ld bc, $0000
    jr nz, jr_00b_4a6d

    ld bc, $0800

jr_00b_4a6d:
    jr nz, jr_00b_4a73

    ld bc, $0600
    nop

jr_00b_4a73:
    db $10
    dec b
    ld bc, $0800
    db $10
    ld b, $01
    nop
    nop
    jr @+$09

    ld bc, $0800
    jr jr_00b_4a8c

    ld bc, $0000
    jr nz, jr_00b_4a8c

    ld bc, $0800

jr_00b_4a8c:
    jr nz, jr_00b_4a92

    ld bc, $0400
    nop

jr_00b_4a92:
    jr @+$09

    ld bc, $0800
    jr jr_00b_4aa1

    ld bc, $0000
    jr nz, jr_00b_4aa1

    ld bc, $0800

jr_00b_4aa1:
    jr nz, jr_00b_4aa7

    ld bc, $0200
    nop

jr_00b_4aa7:
    jr nz, jr_00b_4aac

    ld bc, $0800

jr_00b_4aac:
    jr nz, jr_00b_4ab2

    ld bc, $0300
    nop

jr_00b_4ab2:
    nop
    cp c
    ld bc, $0800
    nop
    cp d
    ld bc, $1000
    nop
    cp e
    ld bc, $0300
    nop
    nop
    cp c
    ld bc, $0820
    nop
    cp d
    ld bc, $1020
    nop
    cp e
    ld bc, $0120
    nop
    nop
    nop
    ld bc, $0400
    ldh a, [rP1]
    ld b, h
    ld bc, $f010
    ld [$0145], sp
    db $10
    ld hl, sp+$00
    ld b, [hl]
    ld bc, $f810
    ld [HeaderCartridgeType], sp
    db $10
    inc b
    ldh a, [rP1]
    jr z, jr_00b_4af1

    db $10

jr_00b_4af1:
    ldh a, [$ff08]
    add hl, hl
    ld bc, $f810
    nop
    ld a, [hl+]
    ld bc, $f810
    ld [$012b], sp
    db $10
    inc b
    ldh a, [rP1]
    inc l
    ld bc, $f010
    ld [$012d], sp
    db $10
    ld hl, sp+$00
    ld l, $01
    db $10
    ld hl, sp+$08
    cpl
    ld bc, $0410
    ldh a, [rP1]
    jr nc, jr_00b_4b1b

    db $10

jr_00b_4b1b:
    ldh a, [$ff08]
    ld sp, $1001
    ld hl, sp+$00
    ld [hl-], a
    ld bc, $f810
    ld [$0133], sp
    db $10
    inc b
    ldh a, [rP1]
    inc [hl]
    ld bc, $f010
    ld [$0135], sp
    db $10
    ld hl, sp+$00
    ld [hl], $01
    db $10
    ld hl, sp+$08
    scf
    ld bc, $0410
    ldh a, [rP1]
    jr c, jr_00b_4b45

    db $10

jr_00b_4b45:
    ldh a, [$ff08]
    add hl, sp
    ld bc, $f810
    nop
    ld a, [hl-]
    ld bc, $f810
    ld [$013b], sp
    db $10

jr_00b_4b54:
    inc b
    ldh a, [rP1]
    inc a
    ld bc, $f010
    ld [$013d], sp
    db $10
    ld hl, sp+$00
    ld a, $01
    db $10
    ld hl, sp+$08
    ccf
    ld bc, $0410

jr_00b_4b6a:
    ldh a, [rP1]
    ld b, b
    ld bc, $f010
    ld [$0141], sp
    db $10
    ld hl, sp+$00
    ld b, d
    ld bc, $f810
    ld [$0143], sp
    db $10
    ld c, $00
    nop
    cp h
    ld bc, $0010
    ld [$01bd], sp
    stop
    db $10
    cp l
    ld bc, $0010
    jr @-$41

    ld bc, $0010
    jr nz, jr_00b_4b54

    ld bc, $0810
    nop
    cp a
    ld bc, $1010
    nop
    cp a
    ld bc, $0810
    jr nz, @-$3e

    ld bc, $1010
    jr nz, jr_00b_4b6a

    ld bc, $1810
    nop
    pop bc
    ld bc, $1810
    ld [$01c2], sp
    db $10
    jr jr_00b_4bc8

    jp nz, Jump_000_1001

    jr @+$1a

    jp nz, Jump_000_1001

    jr jr_00b_4be2

    jp Jump_000_1001


    ld [$0000], sp

jr_00b_4bc8:
    cp h
    ld bc, $0010
    ld [$01bd], sp
    stop
    db $10
    cp [hl]
    ld bc, $0810

jr_00b_4bd6:
    nop
    cp a
    ld bc, $0810
    db $10
    ret nz

    ld bc, $1010
    nop
    pop bc

jr_00b_4be2:
    ld bc, $1010

jr_00b_4be5:
    ld [$01c2], sp
    db $10
    db $10
    db $10
    jp Jump_000_1001


    ld bc, $0000
    ldh [rSB], a
    nop
    ld bc, $0000
    pop hl
    ld bc, $0100
    nop
    nop
    ldh [c], a
    ld bc, $0100
    nop
    nop
    db $e3
    ld bc, $0100
    nop
    nop
    db $e4
    ld bc, $0100
    nop
    nop
    push hl
    ld bc, $0100
    nop
    nop
    and $01
    nop
    ld b, $f8
    db $10
    sbc l
    ld bc, $f800
    jr @-$6b

    ld bc, $f800
    jr nz, @-$66

    ld bc, $f800
    jr z, @-$6d

    ld bc, $f800
    jr nc, @-$68

    ld bc, $f800
    jr c, @-$6f

    ld bc, $0600
    ld hl, sp+$10
    adc [hl]
    ld bc, $f800
    jr @-$65

    ld bc, $f800
    jr nz, @-$5f

    ld bc, $f800
    jr z, jr_00b_4bd6

    ld bc, $f800
    jr nc, jr_00b_4be5

    ld bc, $f800
    jr c, @-$6f

    ld bc, $0a00
    ldh a, [rNR14]
    halt
    ld bc, $f000

jr_00b_4c5d:
    inc e
    ld [hl], a
    ld bc, $f000
    inc h
    ld a, b
    ld bc, $f000
    inc l

jr_00b_4c68:
    ld a, c
    ld bc, $f000
    inc [hl]
    ld a, d
    ld bc, $f800
    inc d
    ld a, e

jr_00b_4c73:
    ld bc, $f800
    inc e
    ld a, h
    ld bc, $f800
    inc h
    ld a, l

jr_00b_4c7d:
    ld bc, $f800
    inc l
    ld a, [hl]
    ld bc, $f800
    inc [hl]
    ld a, a
    ld bc, $0a00

jr_00b_4c8a:
    ldh a, [rNR14]
    ld l, h
    ld bc, $f000
    inc e
    ld l, l

jr_00b_4c92:
    ld bc, $f000
    inc h
    ld l, [hl]
    ld bc, $f000
    inc l
    ld l, a
    ld bc, $f000

jr_00b_4c9f:
    inc [hl]
    ld [hl], b
    ld bc, $f800
    inc d
    ld [hl], c
    ld bc, $f800
    inc e
    ld [hl], d
    ld bc, $f800
    inc h
    ld [hl], e
    ld bc, $f800
    inc l

jr_00b_4cb4:
    ld [hl], h

jr_00b_4cb5:
    ld bc, $f800
    inc [hl]
    ld [hl], l
    ld bc, $0400
    nop
    jr z, jr_00b_4c68

    ld bc, $0000
    jr nc, @-$7c

    ld bc, $0000
    jr c, @-$7d

    ld bc, $0000
    ld b, b
    add c
    ld bc, $0400
    nop
    jr z, jr_00b_4c7d

    ld bc, $0000
    jr nc, jr_00b_4c5d

    ld bc, $0000
    jr c, @-$7d

    ld bc, $0000
    ld b, b
    add c
    ld bc, $0400
    nop
    jr z, jr_00b_4c92

    ld bc, $0000
    jr nc, jr_00b_4c73

    ld bc, $0000
    jr c, @-$7d

    ld bc, $0000

jr_00b_4cf7:
    ld b, b
    add c
    ld bc, $0400
    nop
    jr z, @-$56

    ld bc, $0000
    jr nc, @-$79

jr_00b_4d04:
    ld bc, $0000
    jr c, jr_00b_4c8a

    ld bc, $0000
    ld b, b

jr_00b_4d0d:
    add c
    ld bc, $0400
    nop
    jr z, @-$56

    ld bc, $0000
    jr nc, jr_00b_4c9f

    ld bc, $0000
    jr c, jr_00b_4c9f

jr_00b_4d1e:
    ld bc, $0000
    ld b, b
    add c
    ld bc, $0400
    nop

jr_00b_4d27:
    jr z, @-$56

    ld bc, $0000
    jr nc, jr_00b_4cb5

    ld bc, $0000
    jr c, jr_00b_4cb4

    ld bc, $0000
    ld b, b
    add c

jr_00b_4d38:
    ld bc, $0400
    nop
    jr z, @-$56

    ld bc, $0000

jr_00b_4d41:
    jr nc, @-$76

    ld bc, $0000
    jr c, @-$7d

    ld bc, $0000
    ld b, b
    add c
    ld bc, $0400
    nop
    jr z, @-$56

jr_00b_4d53:
    ld bc, $0000

jr_00b_4d56:
    jr nc, @-$75

    ld bc, $0000

jr_00b_4d5b:
    jr c, @-$7d

    ld bc, $0000
    ld b, b
    add c
    ld bc, $0400
    nop
    jr z, @-$56

    ld bc, $0000
    jr nc, jr_00b_4cf7

jr_00b_4d6d:
    ld bc, $0000
    jr c, @-$7d

    ld bc, $0000

jr_00b_4d75:
    ld b, b
    add c
    ld bc, $0500
    nop
    jr nz, @-$56

    ld bc, $0000
    jr z, jr_00b_4d04

    ld bc, $0000
    jr nc, @-$7d

jr_00b_4d87:
    ld bc, $0000
    jr c, jr_00b_4d0d

    ld bc, $0000

jr_00b_4d8f:
    ld b, b
    add c
    ld bc, $0500
    nop
    jr nz, @-$56

    ld bc, $0000
    jr z, jr_00b_4d1e

    ld bc, $0000
    jr nc, @-$7b

    ld bc, $0000
    jr c, jr_00b_4d27

jr_00b_4da6:
    ld bc, $0000

jr_00b_4da9:
    ld b, b
    add c
    ld bc, $0500
    nop
    jr nz, @-$56

    ld bc, $0000
    jr z, jr_00b_4d38

    ld bc, $0000
    jr nc, @-$77

    ld bc, $0000
    jr c, jr_00b_4d41

    ld bc, $0000

jr_00b_4dc3:
    ld b, b

jr_00b_4dc4:
    add c
    ld bc, $0500
    nop
    jr nz, @-$56

    ld bc, $0000
    jr z, jr_00b_4d53

    ld bc, $0000
    jr nc, jr_00b_4d56

    ld bc, $0000

jr_00b_4dd8:
    jr c, jr_00b_4d5b

    ld bc, $0000

jr_00b_4ddd:
    ld b, b
    add c
    ld bc, $0500
    nop
    jr nz, @-$56

    ld bc, $0000
    jr z, jr_00b_4d6d

    ld bc, $0000
    jr nc, @-$79

    ld bc, $0000
    jr c, jr_00b_4d75

    ld bc, $0000

jr_00b_4df7:
    ld b, b
    add c
    ld bc, $0500
    nop
    jr nz, @-$56

    ld bc, $0000
    jr z, jr_00b_4d87

    ld bc, $0000
    jr nc, @-$75

    ld bc, $0000

jr_00b_4e0c:
    jr c, jr_00b_4d8f

    ld bc, $0000

jr_00b_4e11:
    ld b, b

jr_00b_4e12:
    add c
    ld bc, $0500
    nop
    jr nz, @-$56

    ld bc, $0000
    jr z, @-$7a

    ld bc, $0000
    jr nc, jr_00b_4da6

    ld bc, $0000
    jr c, jr_00b_4da9

    ld bc, $0000

jr_00b_4e2b:
    ld b, b
    add c
    ld bc, $0500
    nop
    jr nz, @-$56

    ld bc, $0000
    jr z, @-$7a

    ld bc, $0000
    jr nc, jr_00b_4dc4

    ld bc, $0000
    jr c, jr_00b_4dc3

jr_00b_4e42:
    ld bc, $0000

jr_00b_4e45:
    ld b, b
    add c
    ld bc, $0500
    nop
    jr nz, @-$56

    ld bc, $0000
    jr z, @-$79

    ld bc, $0000
    jr nc, jr_00b_4dd8

    ld bc, $0000

jr_00b_4e5a:
    jr c, jr_00b_4ddd

    ld bc, $0000

jr_00b_4e5f:
    ld b, b
    add c
    ld bc, $0500
    nop
    jr nz, @-$56

    ld bc, $0000
    jr z, @-$79

    ld bc, $0000
    jr nc, @-$75

    ld bc, $0000
    jr c, jr_00b_4df7

    ld bc, $0000

jr_00b_4e79:
    ld b, b

jr_00b_4e7a:
    add c
    ld bc, $0500
    nop
    jr nz, @-$56

    ld bc, $0000
    jr z, jr_00b_4e0c

    ld bc, $0000
    jr nc, jr_00b_4e12

    ld bc, $0000
    jr c, jr_00b_4e11

    ld bc, $0000
    ld b, b
    add c

jr_00b_4e95:
    ld bc, $0500

jr_00b_4e98:
    nop
    jr nz, @-$56

    ld bc, $0000
    jr z, @-$77

    ld bc, $0000
    jr nc, @-$79

    ld bc, $0000
    jr c, jr_00b_4e2b

    ld bc, $0000
    ld b, b
    add c

jr_00b_4eaf:
    ld bc, $0500
    nop
    jr nz, @-$56

    ld bc, $0000
    jr z, jr_00b_4e42

jr_00b_4eba:
    ld bc, $0000
    jr nc, jr_00b_4e42

    ld bc, $0000
    jr c, jr_00b_4e45

    ld bc, $0000
    ld b, b

jr_00b_4ec8:
    add c
    ld bc, $0500
    nop
    jr nz, @-$56

    ld bc, $0000
    jr z, @-$75

    ld bc, $0000
    jr nc, jr_00b_4e5a

    ld bc, $0000
    jr c, jr_00b_4e5f

    ld bc, $0000
    ld b, b
    add c
    ld bc, $0500
    nop

jr_00b_4ee7:
    jr nz, @-$56

jr_00b_4ee9:
    ld bc, $0000
    jr z, @-$74

    ld bc, $0000

jr_00b_4ef1:
    jr nc, jr_00b_4e7a

    ld bc, $0000
    jr c, jr_00b_4e79

    ld bc, $0000
    ld b, b
    add c
    ld bc, $0600
    nop
    jr @-$56

    ld bc, $0000
    jr nz, @-$7c

jr_00b_4f08:
    ld bc, $0000
    jr z, @-$7c

    ld bc, $0000
    jr nc, jr_00b_4e95

    ld bc, $0000
    jr c, jr_00b_4e98

    ld bc, $0000
    ld b, b
    add c
    ld bc, $0600
    nop
    jr @-$56

    ld bc, $0000
    jr nz, @-$7c

    ld bc, $0000
    jr z, jr_00b_4eaf

    ld bc, $0000
    jr nc, jr_00b_4eba

    ld bc, $0000
    jr c, @-$7d

    ld bc, $0000
    ld b, b
    add c
    ld bc, $0600
    nop
    jr jr_00b_4ee9

    ld bc, $0000
    jr nz, jr_00b_4ec8

    ld bc, $0000
    jr z, @-$79

    ld bc, $0000
    jr nc, @-$79

    ld bc, $0000
    jr c, @-$7d

    ld bc, $0000
    ld b, b

jr_00b_4f59:
    add c
    ld bc, $0600
    nop
    jr jr_00b_4f08

    ld bc, $0000
    jr nz, jr_00b_4ee7

    ld bc, $0000
    jr z, jr_00b_4ef1

jr_00b_4f6a:
    ld bc, $0000
    jr nc, @-$7d

    ld bc, $0000
    jr c, @-$7d

    ld bc, $0000
    ld b, b
    add c
    ld bc, $2000

jr_00b_4f7c:
    nop
    nop
    cp e
    ld bc, $0010
    ld [$01bc], sp
    stop
    db $10
    cp h
    ld bc, $0010
    jr @-$42

    ld bc, $0010
    jr nz, @-$42

    ld bc, $0010
    jr z, @-$42

    ld bc, $0010
    jr nc, jr_00b_4f59

    ld bc, $0010

jr_00b_4fa0:
    jr c, @-$41

    ld bc, $0810
    nop

jr_00b_4fa6:
    xor e
    ld bc, $0810
    ld [$01ac], sp
    db $10
    ld [$ad10], sp
    ld bc, $0810
    jr @-$50

    ld bc, $0810
    jr nz, jr_00b_4f6a

    ld bc, $0810
    jr z, @-$4e

    ld bc, $0810
    jr nc, @-$4d

jr_00b_4fc5:
    ld bc, $0810
    jr c, jr_00b_4f7c

jr_00b_4fca:
    ld bc, $1010
    nop
    or e

jr_00b_4fcf:
    ld bc, $1010
    ld [$01b4], sp
    db $10
    db $10
    db $10

jr_00b_4fd8:
    or l
    ld bc, $1010
    jr @-$48

    ld bc, $1010
    jr nz, @-$47

jr_00b_4fe3:
    ld bc, $1010
    jr z, jr_00b_4fa0

    ld bc, $1010
    jr nc, jr_00b_4fa6

    ld bc, $1010

jr_00b_4ff0:
    jr c, @-$44

    ld bc, $1810
    nop
    cp [hl]
    ld bc, $1810
    ld [$01bf], sp

jr_00b_4ffd:
    db $10
    jr jr_00b_5010

    cp a

jr_00b_5001:
    ld bc, $1810
    jr jr_00b_4fc5

    ld bc, $1810
    jr nz, jr_00b_4fca

    ld bc, $1810
    jr z, jr_00b_4fcf

jr_00b_5010:
    ld bc, $1810
    jr nc, @-$3f

    ld bc, $1810
    jr c, @-$3e

    ld bc, $0210
    nop
    nop
    xor c

jr_00b_5020:
    ld bc, $0000
    ld [$01a9], sp
    jr nz, jr_00b_502a

    nop
    nop

jr_00b_502a:
    xor d
    ld bc, $0000
    ld [$01aa], sp
    jr nz, jr_00b_5034

    nop

jr_00b_5034:
    nop
    call nc, Call_000_0001
    rrca
    nop
    nop
    sbc l
    ld bc, $0080
    ld [$019a], sp
    add b
    nop
    db $10
    adc a
    ld bc, $0080
    jr jr_00b_4fd8

    ld bc, $0080
    jr nz, jr_00b_4fe3

    ld bc, $0080
    jr z, @-$73

    ld bc, $0080
    jr nc, jr_00b_4ff0

    ld bc, $0880
    db $10
    adc h
    ld bc, $0880
    jr jr_00b_4ffd

    ld bc, $0880
    jr nz, jr_00b_5001

    ld bc, $0880
    jr z, @-$5f

    ld bc, $0880
    jr nc, jr_00b_5010

    ld bc, $1080
    jr z, jr_00b_5020

    ld bc, $1080
    jr nc, @-$7c

    ld bc, $1080
    jr c, @-$7d

    ld bc, $0280
    nop
    nop
    push de
    nop
    nop
    nop
    ld e, b
    push de
    nop
    nop
    ld bc, $0000
    ldh [rSB], a
    nop
    ld bc, $0000
    pop hl
    ld bc, $0100

jr_00b_509c:
    nop
    nop
    ldh [c], a
    ld bc, $0100
    nop
    nop
    db $e3
    ld bc, $0100
    nop
    nop
    db $e4
    ld bc, $0100
    nop
    nop
    push hl
    ld bc, $0100
    nop
    nop
    and $01
    nop
    ld a, [bc]
    nop
    nop
    cp c
    ld bc, $0800
    nop
    cp d
    ld bc, $0000
    ld [$01b3], sp
    nop
    ld [$b408], sp
    ld bc, $0000
    db $10
    or a
    ld bc, $0800
    db $10
    cp b
    ld bc, $0000
    jr @-$43

    ld bc, $0800
    jr jr_00b_509c

    ld bc, $0000
    jr nz, @-$4d

    ld bc, $0800
    jr nz, jr_00b_509c

    ld bc, $0200
    nop
    nop
    ld d, $01
    nop
    ld [$1700], sp
    ld bc, $0200
    nop
    nop
    jr jr_00b_50fd

    nop

jr_00b_50fd:
    ld [$1900], sp
    ld bc, $0200
    nop
    nop
    ld a, [de]
    ld bc, $0800
    nop
    dec de
    ld bc, $0200
    nop
    nop
    inc e
    ld bc, $0800
    nop
    dec e
    ld bc, $0200
    nop
    nop
    ld e, $01
    nop
    ld [$1f00], sp
    ld bc, $0200
    nop
    nop
    jr nz, jr_00b_5129

    nop

jr_00b_5129:
    ld [$2100], sp
    ld bc, $0200
    nop
    nop
    ld [hl+], a
    ld bc, $0800
    nop
    inc hl
    ld bc, $0200
    nop
    nop
    inc h
    ld bc, $0800
    nop
    dec h
    ld bc, $0200
    nop
    nop
    ld h, $01
    nop
    ld [$2700], sp
    ld bc, $0200
    nop
    nop
    jr z, jr_00b_5155

    nop

jr_00b_5155:
    ld [$2900], sp
    ld bc, $0100
    nop
    nop
    xor c
    ld bc, $0100
    nop
    nop
    xor b
    ld bc, $0100
    nop
    nop

jr_00b_5169:
    xor d
    ld bc, $0200
    nop
    nop
    db $f4
    ld bc, $0020
    jr nz, jr_00b_5169

    ld bc, $0c00
    nop
    nop
    jr z, @+$03

    stop
    ld [$0129], sp
    stop
    db $10
    add hl, hl
    ld bc, $0010
    jr @+$2c

    ld bc, $0810
    nop
    dec hl
    ld bc, $1010
    nop
    dec hl
    ld bc, $0810
    jr jr_00b_51c5

    ld bc, $1010
    jr jr_00b_51ca

    ld bc, $1810
    nop

jr_00b_51a2:
    dec l
    ld bc, $1810
    ld [$012e], sp

jr_00b_51a9:
    db $10
    jr @+$12

    ld l, $01
    db $10
    jr jr_00b_51c9

    cpl
    ld bc, $0410
    nop
    nop
    rst $00
    ld bc, $0010
    ld [$01c8], sp
    db $10
    ld [$c900], sp
    ld bc, $0810

jr_00b_51c5:
    ld [$01ca], sp
    db $10

jr_00b_51c9:
    inc b

jr_00b_51ca:
    nop
    nop
    rlc c
    stop
    ld [$01cc], sp
    db $10
    ld [$cd00], sp
    ld bc, $0810
    ld [$01ce], sp
    db $10
    inc b
    nop
    nop
    rst $08
    ld bc, $0010
    ld [$01d0], sp
    db $10
    ld [$d100], sp
    ld bc, $0810
    ld [$01d2], sp
    db $10
    dec b
    nop
    nop
    sbc l
    ld bc, $0000
    ld [$019e], sp
    nop
    nop
    db $10
    adc e
    ld bc, $0000
    jr jr_00b_51a2

    ld bc, $0000
    jr nz, jr_00b_51a9

    ld bc, $0c00
    nop
    nop
    ld [hl], h
    ld bc, $0000
    ld [$0175], sp
    nop
    nop
    db $10
    halt
    ld bc, $0000
    jr @+$79

    ld bc, $0000
    jr nz, jr_00b_529d

    ld bc, $0000
    jr z, @+$7b

    ld bc, $0800
    nop
    ld a, d
    ld bc, $0800
    ld [$017b], sp
    nop
    ld [$7c10], sp
    ld bc, $0800
    jr @+$7f

    ld bc, $0800
    jr nz, jr_00b_52c1

    ld bc, $0800
    jr z, jr_00b_52c7

    ld bc, $0a00
    nop
    nop
    ld l, d
    ld bc, $0000
    ld [$016b], sp
    nop
    nop
    db $10
    ld l, h
    ld bc, $0000
    jr jr_00b_52ca

    ld bc, $0000
    jr nz, jr_00b_52d0

    ld bc, $0800
    nop
    ld l, a
    ld bc, $0800
    ld [$0170], sp
    nop
    ld [$7110], sp
    ld bc, $0800
    jr jr_00b_52e8

    ld bc, $0800
    jr nz, @+$75

    ld bc, $0a00
    nop
    nop
    ld h, b
    ld bc, $0000
    ld [$0161], sp
    nop
    nop
    db $10
    ld h, d
    ld bc, $0000
    jr jr_00b_52f3

    ld bc, $0000
    jr nz, jr_00b_52f9

    ld bc, $0800
    nop
    ld h, l
    ld bc, $0800

jr_00b_529d:
    ld [$0166], sp
    nop
    ld [$6710], sp
    ld bc, $0800
    jr @+$6a

    ld bc, $0800
    jr nz, jr_00b_5317

    ld bc, $6a00
    ld d, e
    halt
    ld d, e
    ld a, l
    ld d, e
    xor h
    ld d, e
    cp b
    ld d, e
    call nz, $d053
    ld d, e
    call c, $e853

jr_00b_52c1:
    ld d, e
    rst $28
    ld d, e
    or $53
    db $fd

jr_00b_52c7:
    ld d, e
    inc b
    ld d, h

jr_00b_52ca:
    db $10
    ld d, h
    inc e
    ld d, h
    jr z, jr_00b_5324

jr_00b_52d0:
    inc [hl]
    ld d, h
    ld b, b
    ld d, h
    ld c, h
    ld d, h
    ld e, b
    ld d, h
    ld h, h
    ld d, h
    ld [hl], b
    ld d, h
    ld a, h
    ld d, h
    adc b
    ld d, h
    sub h
    ld d, h
    and b
    ld d, h
    xor h
    ld d, h
    cp b
    ld d, h

jr_00b_52e8:
    call nz, $d054
    ld d, h
    call c, $e854
    ld d, h
    db $f4
    ld d, h
    ei

jr_00b_52f3:
    ld d, h
    inc c
    ld d, l
    dec e
    ld d, l
    inc sp

jr_00b_52f9:
    ld d, l
    ld c, c
    ld d, l
    ld e, a
    ld d, l
    ld l, e
    ld d, l
    ld [hl], a
    ld d, l
    add e
    ld d, l
    adc a
    ld d, l
    sub [hl]
    ld d, l
    sbc l
    ld d, l
    xor c
    ld d, l
    or l
    ld d, l
    pop bc
    ld d, l
    call $d455
    ld d, l
    db $db
    ld d, l
    db $ec

jr_00b_5317:
    ld d, l
    db $fd
    ld d, l
    inc b
    ld d, [hl]
    dec bc
    ld d, [hl]
    rla
    ld d, [hl]
    inc hl
    ld d, [hl]
    inc [hl]
    ld d, [hl]

jr_00b_5324:
    ld b, l
    ld d, [hl]
    ld d, c
    ld d, [hl]
    ld e, l
    ld d, [hl]
    ld l, [hl]
    ld d, [hl]
    ld a, a
    ld d, [hl]
    adc e
    ld d, [hl]
    sub a
    ld d, [hl]
    xor l
    ld d, [hl]
    jp $d456


    ld d, [hl]
    push hl
    ld d, [hl]
    or $56
    rlca
    ld d, a
    ld c, $57
    dec d
    ld d, a
    inc e
    ld d, a
    inc hl
    ld d, a
    ld a, [hl+]
    ld d, a
    ld sp, $3857
    ld d, a
    ccf
    ld d, a
    ld d, l
    ld d, a
    ld l, e
    ld d, a
    ld a, h
    ld d, a
    sub d
    ld d, a
    xor b
    ld d, a
    cp c
    ld d, a
    rst $30
    ld d, a
    cp $57
    dec b
    ld e, b
    inc c
    ld e, b
    inc de
    ld e, b
    add hl, hl
    ld e, b
    ccf
    ld e, b
    ld l, c
    ld e, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $1114
    cp $00
    nop
    ld bc, $2850
    ret nz

    rst $38
    nop
    nop
    inc b
    add d
    ld bc, $0061
    inc b
    add d
    ld bc, $0062
    inc b
    add d
    ld bc, $0063
    inc b
    add d
    ld bc, $0064
    inc a
    add d
    ld bc, $0065
    inc b
    add d
    ld bc, $0066
    inc b
    add d
    ld bc, $0067
    inc b
    add d
    ld bc, $0068
    inc b
    add d
    ld bc, $ff69
    nop
    nop
    db $10
    ld h, b
    inc a
    ld [hl], l
    nop
    db $10
    ld h, c
    inc a
    ld [hl], l
    cp $00
    nop
    db $10
    ld h, h
    inc a
    ld [hl], l
    nop
    db $10
    ld h, l
    inc a
    ld [hl], l
    cp $00
    nop
    db $10
    ld h, d
    inc a
    ld [hl], l
    nop
    db $10
    ld h, e
    inc a
    ld [hl], l
    cp $00
    nop
    db $10
    ld [hl], d
    inc a
    ld [hl], l
    nop
    db $10
    ld [hl], e
    inc a
    ld [hl], l
    cp $00
    nop
    db $10
    ld l, d
    ld b, b
    halt
    nop
    db $10
    ld l, e
    ld b, b
    halt
    cp $00
    nop
    ld [bc], a
    ld a, [bc]
    ld bc, $ff18
    nop
    nop
    ld [bc], a
    ld a, [bc]
    ld bc, $ff19
    nop
    nop
    ld bc, $4480
    ld l, a
    rst $38
    nop
    nop
    ld bc, $4481
    ld l, a
    rst $38
    nop
    nop
    db $10
    ld l, h
    jr z, @+$72

    nop
    db $10
    ld l, l
    jr z, jr_00b_547e

    cp $00
    nop
    db $10
    ld h, [hl]
    jr z, @+$72

    nop
    db $10
    ld h, a
    jr z, jr_00b_548a

    cp $00
    nop
    db $10
    ld a, d
    jr z, @+$72

    nop
    db $10
    ld a, e
    jr z, jr_00b_5496

    cp $00
    nop
    db $10
    ld a, h
    jr z, jr_00b_549d

    nop
    db $10
    ld a, l
    jr z, jr_00b_54a2

    cp $00
    nop
    db $10
    ld [hl], h
    inc l
    ld [hl], c
    nop
    db $10
    ld [hl], l
    inc l
    ld [hl], c
    cp $00
    nop
    db $10
    ld l, [hl]
    inc l
    ld [hl], c
    nop
    db $10
    ld l, a
    inc l
    ld [hl], c
    cp $00
    nop
    db $10
    halt
    inc l
    ld [hl], c
    nop
    db $10
    ld [hl], a
    inc l
    ld [hl], c
    cp $00
    nop
    db $10
    ld a, [hl]
    inc l
    ld [hl], c
    nop
    db $10
    ld a, a
    inc l
    ld [hl], c
    cp $00
    nop
    db $10
    ld [hl], h
    jr nc, @+$74

    nop
    db $10
    ld [hl], l
    jr nc, @+$74

    cp $00
    nop
    db $10
    ld l, [hl]
    jr nc, @+$74

    nop
    db $10
    ld l, a
    jr nc, @+$74

    cp $00
    nop
    db $10

jr_00b_547e:
    halt
    jr nc, @+$74

    nop
    db $10
    ld [hl], a
    jr nc, jr_00b_54f8

    cp $00
    nop
    db $10

jr_00b_548a:
    ld a, [hl]
    jr nc, jr_00b_54ff

    nop
    db $10
    ld a, a
    jr nc, @+$74

    cp $00
    nop
    db $10

jr_00b_5496:
    ld l, b
    inc [hl]
    ld [hl], e
    nop
    db $10
    ld l, c
    inc [hl]

jr_00b_549d:
    ld [hl], e
    cp $00
    nop
    db $10

jr_00b_54a2:
    ld l, d
    inc [hl]
    ld [hl], e
    nop
    db $10
    ld l, e
    inc [hl]
    ld [hl], e
    cp $00
    nop
    db $10
    ld [hl], b
    inc [hl]
    ld [hl], e
    nop
    db $10
    ld [hl], c
    inc [hl]
    ld [hl], e
    cp $00
    nop
    db $10
    ld a, b
    inc [hl]
    ld [hl], e
    nop
    db $10
    ld a, c
    inc [hl]
    ld [hl], e
    cp $00
    nop
    db $10
    ld h, b
    jr c, @+$76

    nop
    db $10
    ld h, c
    jr c, @+$76

    cp $00
    nop
    db $10
    ld h, h
    jr c, jr_00b_5549

    nop
    db $10
    ld h, l
    jr c, @+$76

    cp $00
    nop
    db $10
    ld h, d
    jr c, jr_00b_5555

    nop
    db $10
    ld h, e
    jr c, jr_00b_555a

    cp $00
    nop
    db $10
    ld [hl], d
    jr c, @+$76

    nop
    db $10
    ld [hl], e
    jr c, @+$76

    cp $00
    nop
    inc b
    nop
    dec d

jr_00b_54f8:
    ld bc, $00ff
    nop
    stop
    dec d

jr_00b_54ff:
    ld bc, $1000
    ld bc, $0315
    nop
    db $10
    ld [bc], a
    dec d
    inc bc
    rst $38
    nop
    nop
    db $10
    inc bc
    ld bc, $0000
    db $10
    inc b
    ld bc, $0000
    db $10
    dec b
    ld bc, $ff00
    nop
    nop
    ld e, $06
    ld bc, $0000
    ld e, $07
    ld bc, $0000
    ld e, $06
    ld bc, $0000
    ld e, $08
    ld bc, $ff00
    nop
    nop
    db $10
    add hl, bc
    ld bc, $0000
    db $10
    ld a, [bc]
    ld bc, $0000
    db $10
    dec bc
    ld bc, $0000
    db $10
    ld a, [bc]
    ld bc, $fe00
    nop

jr_00b_5549:
    nop
    db $10
    add hl, bc
    ld bc, $0004
    db $10
    ld a, [bc]
    ld bc, $0004
    db $10

jr_00b_5555:
    dec bc
    ld bc, $0004
    db $10

jr_00b_555a:
    ld a, [bc]
    ld bc, $fe04
    nop
    nop
    jr z, jr_00b_556e

    ld bc, $0004
    jr z, @+$0f

    ld bc, $ff04
    nop
    nop
    jr z, @+$0e

jr_00b_556e:
    ld bc, $0000
    jr z, @+$0f

    ld bc, $ff00
    nop
    nop
    inc b
    ld c, $01
    nop
    nop
    inc b
    rrca
    ld bc, $fe00
    nop
    nop
    inc b
    ld c, $01
    inc b
    nop
    inc b
    rrca
    ld bc, $fe04
    nop
    nop
    db $10
    ld e, $01
    nop
    rst $38
    nop
    nop
    db $10
    ld e, $01
    inc b
    rst $38
    nop
    nop
    db $10
    inc e
    ld bc, $0006
    ld [$151b], sp
    ld bc, $00ff
    nop
    db $10
    inc e
    ld bc, $0008
    ld [$151b], sp
    dec b
    rst $38
    nop
    nop
    ld [$011f], sp
    nop
    nop
    ld [$0120], sp
    nop
    rst $38
    nop
    nop
    ld [$011f], sp
    inc b
    nop
    ld [$0120], sp
    inc b
    rst $38
    nop
    nop
    ld [$151d], sp
    ld bc, $00ff
    nop
    ld [$151d], sp
    dec b
    rst $38
    nop
    nop
    db $10
    rla
    ld bc, $0000
    db $10
    jr jr_00b_55e5

    nop

jr_00b_55e5:
    nop
    db $10
    add hl, de
    dec d
    dec bc
    rst $38
    nop
    nop
    db $10
    rla
    ld bc, $0004
    db $10
    jr jr_00b_55f6

    inc b

jr_00b_55f6:
    nop
    db $10
    add hl, de
    dec d
    dec c
    rst $38
    nop
    nop
    db $10
    ld a, [de]
    dec d
    dec bc
    rst $38
    nop
    nop
    db $10
    ld a, [de]
    dec d
    dec c
    rst $38
    nop
    nop
    inc b
    ld c, $01
    nop
    nop
    inc b
    rrca
    ld bc, $ff00
    nop
    nop
    inc b
    ld c, $01
    inc b
    nop
    inc b
    rrca
    ld bc, $ff04
    nop
    nop
    inc a
    inc de
    ld bc, $0000
    jr nz, jr_00b_563f

    ld bc, $0000
    jr nz, @+$17

    ld bc, $fe00
    ld bc, $3c00
    inc de
    ld bc, $0004
    jr nz, jr_00b_5650

    ld bc, $0004

jr_00b_563f:
    jr nz, @+$17

    ld bc, $fe04
    ld bc, $1000
    dec d
    ld bc, $0000
    db $10
    ld d, $15
    ld [de], a
    rst $38

jr_00b_5650:
    nop
    nop
    db $10
    dec d
    ld bc, $0004
    db $10
    ld d, $15
    inc de
    rst $38
    nop
    nop
    jr nz, @+$12

    dec d
    ld d, $00
    ld [$0111], sp
    nop
    nop
    ld [$0112], sp
    nop
    cp $01
    nop
    jr nz, jr_00b_5681

    dec d
    rla
    nop
    ld [$0111], sp
    inc b
    nop
    ld [$0112], sp
    inc b
    cp $01
    nop
    inc c

jr_00b_5681:
    inc h
    ld bc, $0018
    jr nz, jr_00b_56ac

    dec d
    ld a, [de]
    rst $38
    nop
    nop
    inc c
    inc h
    ld bc, $0019
    jr nz, jr_00b_56b8

    dec d
    dec de
    rst $38
    nop
    nop
    jr @+$28

    ld bc, $0018
    jr @+$29

    ld bc, $0018
    jr jr_00b_56cc

    ld bc, $0018
    inc a
    add hl, hl
    ld bc, $ff18

jr_00b_56ac:
    nop
    nop
    jr jr_00b_56d6

    ld bc, $0019
    jr jr_00b_56dc

    ld bc, $0019

jr_00b_56b8:
    jr jr_00b_56e2

    ld bc, $0019
    inc a
    add hl, hl
    ld bc, $ff19
    nop
    nop
    db $10
    ld hl, $0001
    nop
    jr nz, @+$24

    dec d

jr_00b_56cc:
    dec e
    nop
    ld a, b
    inc hl
    dec d
    ld hl, $00ff
    nop
    db $10

jr_00b_56d6:
    ld hl, $0401
    nop
    jr nz, @+$24

jr_00b_56dc:
    dec d
    rra
    nop
    ld a, b
    inc hl
    dec d

jr_00b_56e2:
    inc hl
    rst $38
    nop
    nop
    jr nz, jr_00b_5701

    dec d
    dec bc
    nop
    db $10
    jr jr_00b_56ef

    nop

jr_00b_56ef:
    nop
    db $10
    rla
    ld bc, $ff00
    nop
    nop
    jr nz, jr_00b_5712

    dec d
    dec c
    nop
    db $10
    jr jr_00b_5700

    inc b

jr_00b_5700:
    nop

jr_00b_5701:
    db $10
    rla
    ld bc, $ff04
    nop
    nop
    ld [$011b], sp
    nop
    rst $38
    nop
    nop
    ld [$011b], sp

jr_00b_5712:
    inc b
    rst $38
    nop
    nop
    db $10
    ld a, [de]
    ld bc, $ff0a
    nop
    nop
    db $10
    ld a, [de]
    ld bc, $ff0c
    nop
    nop
    ld [$011d], sp
    jr @+$01

    nop
    nop
    ld [$011d], sp
    add hl, de
    rst $38
    nop
    nop
    ld [$011b], sp
    jr @+$01

    nop
    nop
    ld [$011b], sp
    add hl, de
    rst $38
    nop
    nop
    db $10
    add hl, bc
    ld bc, $0018
    db $10
    ld a, [bc]
    ld bc, $0018
    db $10
    dec bc
    ld bc, $0018
    db $10
    ld a, [bc]
    ld bc, $fe18
    nop
    nop
    db $10
    add hl, bc
    ld bc, $0019
    db $10
    ld a, [bc]
    ld bc, $0019
    db $10
    dec bc
    ld bc, $0019
    db $10
    ld a, [bc]
    ld bc, $fe19
    nop
    nop
    db $10
    ld a, [hl+]
    ld bc, $0018
    db $10
    dec hl
    ld bc, $0018
    db $10
    inc l
    ld bc, $ff18
    nop
    nop
    inc b
    add hl, bc
    ld bc, $0018
    inc b
    ld a, [bc]
    ld bc, $0018
    inc b
    dec bc
    ld bc, $0018
    inc b
    ld a, [bc]
    ld bc, $fe18
    nop
    nop
    inc b
    add hl, bc
    ld bc, $0019
    inc b
    ld a, [bc]
    ld bc, $0019
    inc b
    dec bc
    ld bc, $0019
    inc b
    ld a, [bc]
    ld bc, $fe19
    nop
    nop
    db $10
    cpl
    ld bc, $0018
    db $10
    jr nc, jr_00b_57c6

    dec hl
    nop
    db $10
    ld sp, $2b15
    cp $01
    nop
    db $10
    ld [hl-], a
    ld bc, $0001
    db $10
    inc sp
    ld bc, $0014
    db $10
    inc [hl]

jr_00b_57c6:
    dec d
    add hl, hl
    nop
    db $10
    inc sp
    ld bc, $0014
    db $10
    inc [hl]
    dec d
    add hl, hl
    nop
    db $10
    dec [hl]
    ld bc, $002a
    db $10
    ld [hl], $15
    dec h
    nop
    db $10
    scf
    dec d
    dec h
    nop
    db $10
    ld [hl], $15
    dec h
    nop
    db $10
    scf
    dec d
    dec h
    nop
    db $10
    ld [hl], $15
    dec h
    nop
    db $10
    scf
    dec d
    dec h
    rst $38
    ld bc, $0800
    dec de
    ld bc, $ff00
    nop
    nop
    ld [$011b], sp
    inc b
    rst $38
    nop
    nop
    ld [$011d], sp
    nop
    rst $38
    nop
    nop
    ld [$011d], sp
    inc b
    rst $38
    nop
    nop
    inc b
    add hl, bc
    ld bc, $0000
    inc b
    ld a, [bc]
    ld bc, $0000
    inc b
    dec bc
    ld bc, $0000
    inc b
    ld a, [bc]
    ld bc, $fe00
    nop
    nop
    inc b
    add hl, bc
    ld bc, $0004
    inc b
    ld a, [bc]
    ld bc, $0004
    inc b
    dec bc
    ld bc, $0004
    inc b
    ld a, [bc]
    ld bc, $fe04
    nop
    nop
    jr nz, jr_00b_586f

    ld bc, $0018
    jr nz, @+$30

    dec d
    inc l
    nop
    jr nz, jr_00b_5879

    ld bc, $0018
    jr nz, @+$30

    dec d
    inc l
    nop
    jr nz, jr_00b_5883

    ld bc, $0018
    jr nz, @+$30

    dec d
    inc l
    nop
    jr nz, jr_00b_588d

    ld bc, $0018
    jr nz, jr_00b_5893

    dec d
    inc l
    rst $38
    nop
    nop
    ld [$012d], sp
    jr jr_00b_586f

jr_00b_586f:
    ld [$152e], sp
    inc l
    nop
    ld [$012d], sp
    jr jr_00b_5879

jr_00b_5879:
    ld [$152e], sp
    inc l
    nop
    ld [$012d], sp
    jr jr_00b_5883

jr_00b_5883:
    ld [$152e], sp
    inc l
    nop
    ld [$012d], sp
    jr jr_00b_588d

jr_00b_588d:
    ld [$152e], sp
    inc l
    rst $38
    nop

jr_00b_5893:
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    nop
    nop
    rst $38
    ld bc, $0000
    rst $38
    nop
    nop
    nop
    rst $38
    ld bc, $0000
    rst $38
    nop
    nop
    nop
    rst $38
    ld bc, $0000
    nop
    nop
    nop
    nop
    rst $38
    ld bc, $0000
    nop
    ld bc, $0000
    rst $38
    ld bc, $0000
    nop
    ld bc, $0000
    nop
    ld bc, $0000
    nop
    ld bc, $0000
    nop
    ld bc, $0000
    nop
    ld bc, $0000
    nop
    ld bc, $0000
    nop
    ld bc, $0000
    ld bc, $0001
    nop
    nop
    ld bc, $0000
    ld bc, $0001
    nop
    nop
    ld bc, $0000
    ld bc, $0001
    nop
    nop
    nop
    nop
    nop
    ld bc, $0001
    nop
    ld bc, $0000
    nop
    ld bc, $0001
    nop
    ld bc, $0000
    nop
    ld bc, $0000
    nop
    ld bc, $0000
    nop
    ld bc, $0000
    nop
    ld bc, $0000
    nop
    ld bc, $0000
    nop
    ld bc, $0000
    nop
    ld bc, $00ff
    nop
    ld bc, $0000
    nop
    ld bc, $00ff
    nop
    ld bc, $0000
    nop
    ld bc, $00ff
    nop
    nop
    nop
    nop
    nop
    ld bc, $00ff
    nop
    nop
    rst $38
    nop
    nop
    ld bc, $00ff
    nop
    nop
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    nop
    nop
    rst $38
    nop
    nop
    nop
    rst $38
    rst $38
    nop
    nop
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    nop
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld bc, $00ff
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld bc, $00ff
    rst $38
    ld bc, $00ff
    rst $38
    ld bc, $00ff
    rst $38
    ld bc, $0000
    rst $38
    ld bc, $01ff
    rst $38
    ld bc, $0000
    rst $38
    ld bc, $0100
    rst $38
    ld bc, $0000
    rst $38
    ld bc, $0100
    rst $38
    ld bc, $0100
    rst $38
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    ld bc, $0001
    ld bc, $0100
    nop
    ld bc, $0101
    nop
    ld bc, $0101
    nop
    ld bc, $0101
    nop
    ld bc, $0101
    nop
    nop
    ld bc, $0101
    ld bc, $0101
    nop
    nop
    ld bc, $0101
    nop
    ld bc, $0001
    nop
    ld bc, $0101
    nop
    ld bc, $0101
    nop
    ld bc, $0101
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $0100
    nop
    ld bc, $01ff
    nop
    ld bc, $0100
    nop
    ld bc, $01ff
    nop
    ld bc, $01ff
    nop
    ld bc, $01ff
    nop
    ld bc, $00ff
    nop
    ld bc, $01ff
    rst $38
    ld bc, $00ff
    nop
    ld bc, $00ff
    rst $38
    ld bc, $00ff
    nop
    ld bc, $00ff
    rst $38
    ld bc, $00ff
    rst $38
    ld bc, $00ff
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    cp $00
    rst $38
    nop
    cp $00
    rst $38
    nop
    cp $01
    rst $38
    nop
    cp $00
    rst $38
    nop
    cp $01
    rst $38
    nop
    cp $01
    rst $38
    nop
    cp $01
    rst $38
    ld bc, $01ff
    rst $38
    nop
    rst $38
    ld bc, $01ff
    rst $38
    ld bc, $01ff
    rst $38
    ld [bc], a
    rst $38
    ld bc, $01ff
    nop
    ld bc, $02ff
    nop
    ld bc, $02ff
    nop
    ld bc, $02ff
    nop
    ld bc, $0200
    nop
    ld bc, $0200
    nop
    ld bc, $0200
    nop
    ld bc, $0201
    nop
    ld bc, $0200
    nop
    ld bc, $0201
    nop
    ld bc, $0201
    nop
    ld bc, $0201
    ld bc, $0101
    ld bc, $0100
    ld bc, $0101
    ld bc, $0101
    ld bc, $0201
    ld bc, $0101
    ld bc, $0101
    nop
    ld [bc], a
    ld bc, $0001
    ld [bc], a
    ld bc, $0001
    ld [bc], a
    ld bc, $0001
    ld [bc], a
    nop
    ld bc, $0200
    nop
    ld bc, $0200
    nop
    ld bc, $0200
    rst $38
    ld bc, $0200
    nop
    ld bc, $0200
    rst $38
    ld bc, $0200
    rst $38
    ld bc, $0200
    rst $38
    ld bc, $01ff
    rst $38
    ld bc, $0100
    rst $38
    ld bc, $01ff
    rst $38
    ld bc, $01ff
    cp $01
    rst $38
    ld bc, $00ff
    rst $38
    ld bc, $00fe
    rst $38
    ld bc, $00fe
    rst $38
    ld bc, $00fe
    rst $38
    nop
    cp $00
    rst $38
    nop
    cp $00
    rst $38
    nop
    cp $00
    rst $38
    rst $38
    cp $00
    rst $38
    nop
    cp $00
    rst $38
    rst $38
    cp $00
    rst $38
    rst $38
    cp $00
    rst $38
    rst $38
    cp $ff
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    cp $ff
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    cp $ff
    rst $38
    nop
    cp $ff
    rst $38
    nop
    cp $ff
    rst $38
    nop
    cp $00
    rst $38
    nop
    cp $00
    cp $00
    cp $00
    cp $00
    cp $01
    cp $00
    cp $01
    cp $00
    cp $01
    cp $01
    cp $01
    rst $38
    nop
    cp $01
    cp $01
    cp $01
    rst $38
    ld bc, $02fe
    rst $38
    ld bc, $02fe
    rst $38
    ld bc, $02ff
    rst $38
    ld [bc], a
    rst $38
    ld [bc], a
    rst $38
    ld bc, $02ff
    rst $38
    ld [bc], a
    rst $38
    ld [bc], a
    nop
    ld bc, $02ff
    nop
    ld [bc], a
    rst $38
    ld [bc], a
    nop
    ld [bc], a
    nop
    ld [bc], a
    nop
    ld [bc], a
    nop
    ld [bc], a
    nop
    ld [bc], a
    ld bc, $0002
    ld [bc], a
    ld bc, $0002
    ld [bc], a
    ld bc, $0102
    ld [bc], a
    ld bc, $0002
    ld bc, $0201
    ld bc, $0102
    ld [bc], a
    ld bc, $0201
    ld [bc], a
    ld bc, $0201
    ld [bc], a
    ld bc, $0201
    ld bc, $0102
    ld [bc], a
    ld bc, $0101
    ld [bc], a
    ld bc, $0102
    ld [bc], a
    ld bc, $0001
    ld [bc], a
    ld bc, $0002
    ld [bc], a
    ld bc, $0002
    ld [bc], a
    nop
    ld [bc], a
    nop
    ld [bc], a
    nop
    ld [bc], a
    nop
    ld [bc], a
    rst $38
    ld [bc], a
    nop
    ld [bc], a
    rst $38
    ld [bc], a
    nop
    ld [bc], a
    rst $38
    ld [bc], a
    rst $38
    ld [bc], a
    rst $38
    ld bc, $0200
    rst $38
    ld [bc], a
    rst $38
    ld [bc], a
    rst $38
    ld bc, $02ff
    cp $01
    rst $38
    ld [bc], a
    cp $01
    rst $38
    ld bc, $01fe
    cp $01
    cp $01
    rst $38
    ld bc, $01fe
    cp $01
    cp $00
    rst $38
    ld bc, $00fe
    cp $01
    cp $00
    cp $00
    cp $00
    cp $00
    cp $00
    cp $ff
    cp $00
    cp $ff
    cp $00
    cp $ff
    cp $ff
    cp $ff
    cp $00
    rst $38
    rst $38
    cp $ff
    cp $ff
    cp $ff
    rst $38
    cp $fe
    rst $38
    rst $38
    cp $fe
    rst $38
    rst $38
    cp $ff
    cp $ff
    cp $ff
    rst $38
    rst $38
    cp $ff
    cp $ff
    cp $ff
    rst $38
    nop
    cp $ff
    cp $00
    cp $ff
    cp $00
    db $fd
    nop
    cp $00
    db $fd
    nop
    cp $00
    db $fd
    ld bc, $00fe
    db $fd
    ld bc, $00fe
    db $fd
    ld bc, $01fe
    cp $01
    cp $01
    cp $02
    cp $01
    cp $02
    cp $01
    cp $02
    cp $02
    cp $02
    rst $38
    ld bc, $02fe
    rst $38
    ld [bc], a
    cp $02
    rst $38
    ld [bc], a
    rst $38
    inc bc
    rst $38
    ld [bc], a
    rst $38
    ld [bc], a
    rst $38
    ld [bc], a
    rst $38
    inc bc
    nop
    ld [bc], a
    rst $38
    inc bc
    nop
    ld [bc], a
    nop
    inc bc
    nop
    ld [bc], a
    nop
    inc bc
    nop
    ld [bc], a
    ld bc, $0003
    ld [bc], a
    ld bc, $0003
    ld [bc], a
    ld bc, $0103
    ld [bc], a
    ld bc, $0102
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld bc, $0202
    ld [bc], a
    ld bc, $0202
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld bc, $0201
    ld [bc], a
    ld [bc], a
    ld bc, $0202
    ld [bc], a
    ld bc, $0103
    ld [bc], a
    ld bc, $0102
    ld [bc], a
    ld bc, $0103
    ld [bc], a
    nop
    inc bc
    ld bc, $0002
    inc bc
    nop
    ld [bc], a
    nop
    inc bc
    nop
    ld [bc], a
    nop
    inc bc
    rst $38
    ld [bc], a
    nop
    inc bc
    rst $38
    ld [bc], a
    nop
    inc bc
    rst $38
    ld [bc], a
    rst $38
    ld [bc], a
    rst $38
    ld [bc], a
    rst $38
    ld [bc], a
    cp $02
    rst $38
    ld [bc], a
    cp $02
    rst $38
    ld [bc], a
    cp $02
    cp $02
    cp $01
    rst $38
    ld [bc], a
    cp $01
    cp $02
    cp $01
    cp $01
    db $fd
    ld bc, $01fe
    cp $01
    cp $01
    db $fd
    nop
    cp $01
    db $fd
    nop
    cp $00
    db $fd
    nop
    cp $00
    db $fd
    nop
    cp $ff
    db $fd
    nop
    cp $ff
    db $fd
    nop
    cp $ff
    db $fd
    rst $38
    cp $ff
    cp $ff
    cp $fe
    cp $ff
    cp $fe
    cp $ff
    cp $fe
    cp $fe
    cp $fe
    cp $ff
    rst $38
    cp $fe
    cp $ff
    cp $fe
    cp $ff
    db $fd
    rst $38
    cp $ff
    cp $ff
    cp $ff
    db $fd
    rst $38
    cp $00
    db $fd
    rst $38
    cp $00
    db $fd
    nop
    db $fd
    nop
    db $fd
    nop
    db $fd
    nop
    db $fd
    ld bc, $00fd
    db $fd
    ld bc, $00fd
    db $fd
    ld [bc], a
    db $fd
    ld bc, $01fd
    cp $01
    db $fd
    ld [bc], a
    cp $02
    db $fd
    ld [bc], a
    cp $01
    cp $02
    cp $02
    cp $02
    cp $02
    cp $03
    cp $02
    cp $03
    rst $38
    ld [bc], a
    cp $03
    rst $38
    inc bc
    rst $38
    inc bc
    rst $38
    ld [bc], a
    rst $38
    inc bc
    nop
    inc bc
    rst $38
    inc bc
    nop
    inc bc
    nop
    inc bc
    nop
    inc bc
    nop
    inc bc
    nop
    inc bc
    ld bc, $0003
    inc bc
    ld bc, $0003
    inc bc
    ld [bc], a
    inc bc
    ld bc, $0103
    inc bc
    ld bc, $0202
    inc bc
    ld [bc], a
    ld [bc], a
    ld [bc], a
    inc bc
    ld bc, $0202
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    inc bc
    ld [bc], a
    ld [bc], a
    ld [bc], a
    inc bc
    ld [bc], a
    ld [bc], a
    ld bc, $0203
    inc bc
    ld bc, $0103
    ld [bc], a
    ld bc, $0103
    inc bc
    nop
    inc bc
    ld bc, $0003
    inc bc
    nop
    inc bc
    nop
    inc bc
    nop
    inc bc
    nop
    inc bc
    rst $38
    inc bc
    nop
    inc bc
    rst $38
    inc bc
    nop
    inc bc
    cp $03
    rst $38
    inc bc
    rst $38
    ld [bc], a
    rst $38
    inc bc
    cp $02
    cp $03
    cp $02
    rst $38
    ld [bc], a
    cp $02
    cp $02
    cp $02
    cp $02
    db $fd
    ld [bc], a
    cp $02
    db $fd
    ld bc, $02fe
    db $fd
    ld bc, $01fd
    db $fd
    ld bc, $01fe
    db $fd
    nop
    db $fd
    ld bc, $00fd
    db $fd
    nop
    db $fd
    nop
    db $fd
    nop
    db $fd
    nop
    db $fd
    rst $38
    db $fd
    nop
    db $fd
    rst $38
    db $fd
    nop
    db $fd
    cp $fd
    rst $38
    db $fd
    rst $38
    db $fd
    rst $38
    cp $fe
    db $fd
    cp $fe
    cp $fd
    rst $38
    cp $fe
    cp $fe
    cp $fe
    cp $fe
    cp $fd
    cp $fe
    cp $fd
    cp $fe
    rst $38
    db $fd
    cp $fd
    rst $38
    db $fd
    rst $38
    cp $ff
    db $fd
    rst $38
    db $fd
    nop
    db $fd
    rst $38
    db $fd
    nop
    db $fc
    nop
    db $fd
    nop
    db $fc
    nop
    db $fd
    nop
    db $fc
    ld bc, $01fd
    db $fc
    ld bc, $00fd
    db $fc
    ld [bc], a
    db $fd
    ld bc, $01fd
    db $fd
    ld bc, $02fd
    db $fd
    ld [bc], a
    db $fd
    ld [bc], a
    db $fd
    ld [bc], a
    db $fd
    inc bc
    cp $02
    db $fd
    inc bc
    cp $02
    cp $03
    cp $03
    cp $03
    cp $03
    cp $04
    rst $38
    inc bc
    rst $38
    inc bc
    rst $38
    inc bc
    rst $38
    inc b
    rst $38
    inc bc
    rst $38
    inc b
    nop
    inc bc
    nop
    inc b
    nop
    inc bc
    nop
    inc b
    nop
    inc bc
    ld bc, HeaderLogo
    inc bc
    ld bc, $0004
    inc bc
    ld [bc], a
    inc b
    ld bc, $0103
    inc bc
    ld bc, $0203
    inc bc
    ld [bc], a
    inc bc
    ld [bc], a
    inc bc
    ld [bc], a
    inc bc
    inc bc
    inc bc
    ld [bc], a
    ld [bc], a
    inc bc
    inc bc
    ld [bc], a
    ld [bc], a
    inc bc
    ld [bc], a
    inc bc
    ld [bc], a
    inc bc
    ld [bc], a
    inc bc
    ld [bc], a
    inc b
    ld [bc], a
    inc bc
    ld bc, $0103
    inc bc
    ld bc, HeaderLogo
    inc bc
    ld bc, HeaderLogo
    inc bc
    nop
    inc b
    nop
    inc bc
    nop
    inc b
    nop
    inc bc
    nop
    inc b
    rst $38
    inc bc
    rst $38
    inc b
    rst $38
    inc bc
    nop
    inc b
    cp $03
    rst $38
    inc bc
    rst $38
    inc bc
    rst $38
    inc bc
    cp $03
    cp $03
    cp $03
    cp $03
    db $fd
    ld [bc], a
    cp $03
    db $fd
    ld [bc], a
    cp $02
    db $fd
    ld [bc], a
    db $fd
    ld [bc], a
    db $fd
    ld [bc], a
    db $fd
    ld [bc], a
    db $fc
    ld bc, $01fd
    db $fd
    ld bc, $01fd
    db $fc
    ld bc, $01fd
    db $fc
    nop
    db $fd
    nop
    db $fc
    nop
    db $fd
    nop
    db $fc
    nop
    db $fd
    rst $38
    db $fc
    rst $38
    db $fd
    rst $38
    db $fc
    nop
    db $fd
    cp $fc
    rst $38
    db $fd
    rst $38
    db $fd
    rst $38
    db $fd
    cp $fd
    cp $fd
    cp $fd
    cp $fd
    db $fd
    db $fd
    cp $fe
    db $fd
    db $fd
    cp $fe
    db $fd
    cp $fd
    cp $fd
    cp $fd
    cp $fc
    cp $fd
    rst $38
    db $fd
    rst $38
    db $fd
    rst $38
    db $fc
    rst $38
    db $fd
    rst $38
    db $fc
    rst $38
    db $fd
    nop
    db $fc
    nop
    db $fc
    nop
    db $fc
    nop
    db $fc
    nop
    db $fc
    ld bc, $01fc
    db $fc
    ld bc, $00fc
    db $fc
    ld [bc], a
    db $fc
    ld bc, $02fc
    db $fd
    ld bc, $03fc
    db $fd
    ld [bc], a
    db $fd
    ld [bc], a
    db $fd
    ld [bc], a
    db $fd
    inc bc
    db $fd
    inc bc
    db $fd
    inc bc
    cp $02
    db $fd
    inc b
    cp $03
    cp $03
    cp $03
    cp $04
    rst $38
    inc b
    cp $04
    rst $38
    inc bc
    rst $38
    inc b
    rst $38
    inc b
    rst $38
    inc b
    nop
    inc b
    nop
    inc b
    nop
    inc b
    nop
    inc b
    nop
    inc b
    ld bc, HeaderLogo
    inc b
    ld bc, $0004
    inc b
    ld [bc], a
    inc b
    ld bc, $0204
    inc b
    ld bc, $0303
    inc b
    ld [bc], a
    inc bc
    ld [bc], a
    inc bc
    ld [bc], a
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    ld [bc], a
    ld [bc], a
    inc b
    inc bc
    inc bc
    ld [bc], a
    inc bc
    ld [bc], a
    inc bc
    ld [bc], a
    inc b
    ld [bc], a
    inc b
    ld bc, $0204
    inc bc
    ld bc, HeaderLogo
    inc b
    ld bc, HeaderLogo
    inc b
    nop
    inc b
    nop
    inc b
    nop
    inc b
    nop
    inc b
    nop
    inc b
    rst $38
    inc b
    rst $38
    inc b
    rst $38
    inc b
    nop
    inc b
    cp $04
    rst $38
    inc b
    cp $03
    rst $38
    inc b
    db $fd
    inc bc
    cp $03
    cp $03
    cp $03
    db $fd
    inc bc
    db $fd
    inc bc
    db $fd
    ld [bc], a
    cp $03
    db $fc
    ld [bc], a
    db $fd
    ld [bc], a
    db $fd
    ld [bc], a
    db $fd
    ld [bc], a
    db $fc
    ld bc, $02fc
    db $fc
    ld bc, $01fd
    db $fc
    ld bc, $01fc
    db $fc
    nop
    db $fc
    nop
    db $fc
    nop
    db $fc
    nop
    db $fc
    nop
    db $fc
    rst $38
    db $fc
    rst $38
    db $fc
    rst $38
    db $fc
    nop
    db $fc
    cp $fc
    rst $38
    db $fc
    cp $fc
    rst $38
    db $fd
    db $fd
    db $fc
    cp $fd
    cp $fd
    cp $fd
    db $fd
    db $fd
    db $fd
    db $fd
    db $fd
    db $fd
    cp $fe
    db $fc
    db $fd
    db $fd
    cp $fd
    cp $fd
    cp $fc
    cp $fc
    rst $38
    db $fc
    cp $fd
    rst $38
    db $fc
    rst $38
    db $fc
    rst $38
    db $fc
    rst $38
    db $fc
    nop
    ei
    nop
    db $fc
    nop
    ei
    nop
    db $fc
    nop
    ei
    ld bc, $01fc
    ei
    ld bc, $01fc
    ei
    ld [bc], a
    db $fc
    ld [bc], a
    db $fc
    ld [bc], a
    db $fc
    ld bc, $03fc
    db $fc
    ld [bc], a
    db $fc
    inc bc
    db $fd
    ld [bc], a
    db $fc
    inc b
    db $fd
    inc bc
    db $fd
    inc bc
    db $fd
    inc bc
    db $fd
    inc b
    cp $04
    db $fd
    inc b
    cp $03
    cp $05
    cp $04
    cp $04
    rst $38
    inc b
    rst $38
    dec b
    rst $38
    inc b
    rst $38
    dec b
    rst $38
    inc b
    nop
    dec b
    nop
    inc b
    nop
    dec b
    nop
    inc b
    ld bc, $0105
    inc b
    ld bc, $0105
    inc b
    ld [bc], a
    dec b
    ld [bc], a
    inc b
    ld [bc], a
    inc b
    ld bc, $0304
    inc b
    ld [bc], a
    inc b
    inc bc
    inc b
    ld [bc], a
    inc bc
    inc b
    inc b
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    inc b
    inc bc
    inc b
    ld [bc], a
    inc b
    inc bc
    inc bc
    ld [bc], a
    dec b
    ld [bc], a
    inc b
    ld [bc], a
    inc b
    ld [bc], a
    inc b
    ld bc, $0105
    inc b
    ld bc, $0105
    inc b
    ld bc, $0005
    inc b
    nop
    dec b
    nop
    inc b
    nop
    dec b
    rst $38
    inc b
    rst $38
    dec b
    rst $38
    inc b
    rst $38
    dec b
    cp $04
    cp $04
    cp $04
    rst $38
    inc b
    db $fd
    inc b
    cp $04
    db $fd
    inc bc
    cp $04
    db $fc
    inc bc
    db $fd
    inc bc
    db $fd
    inc bc
    db $fd
    inc bc
    db $fc
    ld [bc], a
    db $fc
    inc bc
    db $fc
    ld [bc], a
    db $fd
    ld [bc], a
    ei
    ld [bc], a
    db $fc
    ld [bc], a
    db $fc
    ld bc, $01fc
    ei
    ld bc, $01fc
    ei
    ld bc, $00fc
    ei
    nop
    db $fc
    nop
    ei
    nop
    db $fc
    rst $38
    ei
    rst $38
    db $fc
    rst $38
    ei
    rst $38
    db $fc
    cp $fb
    cp $fc
    cp $fc
    rst $38
    db $fc
    db $fd
    db $fc
    cp $fc
    db $fd
    db $fc
    cp $fd
    db $fc
    db $fc
    db $fd
    db $fd
    db $fd
    db $fd
    db $fd
    db $fd
    db $fc
    db $fd
    db $fc
    cp $fc
    db $fd
    db $fd
    cp $fb
    cp $fc
    cp $fc
    cp $fc
    rst $38
    ei
    rst $38
    db $fc
    rst $38
    ei
    rst $38
    db $fc
    rst $38
    ei
    nop
    ei
    nop
    ei
    nop
    ei
    nop
    ei
    ld bc, $01fb
    ei
    ld bc, $01fb
    ei
    ld [bc], a
    db $fc
    ld [bc], a
    ei
    ld [bc], a
    db $fc
    ld [bc], a
    ei
    inc bc
    db $fc
    inc bc
    db $fc
    inc bc
    db $fc
    ld [bc], a
    db $fc
    inc b
    db $fd
    inc bc
    db $fc
    inc b
    db $fd
    inc bc
    db $fd
    dec b
    db $fd
    inc b
    db $fd
    inc b
    cp $04
    cp $05
    cp $04
    cp $05
    cp $04
    rst $38
    dec b
    rst $38
    dec b
    rst $38
    dec b
    rst $38
    dec b
    nop
    dec b
    nop
    dec b
    nop
    dec b
    nop
    dec b
    ld bc, $0105
    dec b
    ld bc, $0105
    dec b
    ld [bc], a
    dec b
    ld [bc], a
    inc b
    ld [bc], a
    dec b
    ld [bc], a
    inc b
    inc bc
    dec b
    inc bc
    inc b
    inc bc
    inc b
    ld [bc], a
    inc b
    inc b
    inc b
    inc bc
    inc bc
    inc b
    inc b
    inc bc
    inc bc
    dec b
    inc bc
    inc b
    inc bc
    inc b
    inc bc
    inc b
    ld [bc], a
    dec b
    ld [bc], a
    inc b
    ld [bc], a
    dec b
    ld [bc], a
    inc b
    ld [bc], a
    dec b
    ld bc, $0105
    dec b
    ld bc, $0105
    dec b
    nop
    dec b
    nop
    dec b
    nop
    dec b
    nop
    dec b
    rst $38
    dec b
    rst $38
    dec b
    rst $38
    dec b
    rst $38
    dec b
    cp $04
    cp $05
    cp $04
    cp $05
    db $fd
    inc b
    db $fd
    inc b
    db $fd
    inc b
    cp $04
    db $fc
    inc bc
    db $fd
    inc b
    db $fc
    inc bc
    db $fd
    inc bc
    ei
    inc bc
    db $fc
    inc bc
    db $fc
    ld [bc], a
    db $fc
    ld [bc], a
    ei
    ld [bc], a
    db $fc
    ld [bc], a
    ei
    ld [bc], a
    db $fc
    ld bc, $01fb
    ei
    ld bc, $01fb
    ei
    nop
    ei
    nop
    ei
    nop
    ei
    nop
    ei
    rst $38
    ei
    rst $38
    ei
    rst $38
    ei
    rst $38
    ei
    cp $fb
    cp $fc
    cp $fb
    cp $fc
    db $fd
    ei
    db $fd
    db $fc
    db $fd
    db $fc
    cp $fc
    db $fc
    db $fc
    db $fd
    db $fd
    db $fc
    db $fc
    db $fd
    db $fd
    ei
    db $fd
    db $fc
    db $fd
    db $fc
    db $fd
    db $fc
    cp $fb
    cp $fc
    cp $fb
    cp $fc
    cp $fb
    rst $38
    ei
    rst $38
    ei
    rst $38
    ei
    rst $38
    ld a, [$fb00]
    nop
    ld a, [$fb00]
    nop
    ld a, [$fb01]
    ld bc, $01fa
    ei
    ld bc, $02fb
    ei
    ld [bc], a
    ei
    ld [bc], a
    ei
    ld [bc], a
    ei
    inc bc
    db $fc
    inc bc
    ei
    inc bc
    db $fc
    inc bc
    db $fc
    inc b
    db $fc
    inc b
    db $fc
    inc b
    db $fc
    inc b
    db $fd
    dec b
    db $fd
    inc b
    db $fd
    dec b
    db $fd
    inc b
    cp $05
    cp $05
    cp $05
    cp $05
    rst $38
    ld b, $ff
    dec b
    rst $38
    ld b, $ff
    dec b
    nop
    ld b, $00
    dec b
    nop
    ld b, $00
    dec b
    ld bc, $0106
    dec b
    ld bc, $0106
    dec b
    ld [bc], a
    dec b
    ld [bc], a
    dec b
    ld [bc], a
    dec b
    ld [bc], a
    dec b
    inc bc
    dec b
    inc bc
    inc b
    inc bc
    dec b
    inc bc
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    dec b
    inc bc
    inc b
    inc bc
    dec b
    inc bc
    inc b
    inc bc
    dec b
    ld [bc], a
    dec b
    ld [bc], a
    dec b
    ld [bc], a
    dec b
    ld [bc], a
    ld b, $01
    dec b
    ld bc, $0106
    dec b
    ld bc, $0006
    dec b
    nop
    ld b, $00
    dec b
    nop
    ld b, $ff
    dec b
    rst $38
    ld b, $ff
    dec b
    rst $38
    dec b
    cp $05
    cp $05
    cp $05
    cp $05
    db $fd
    inc b
    db $fd
    dec b
    db $fd
    inc b
    db $fd
    inc b
    db $fc
    inc b
    db $fc
    inc b
    db $fc
    inc b
    db $fc
    inc bc
    ei
    inc bc
    db $fc
    inc bc
    ei
    inc bc
    db $fc
    ld [bc], a
    ei
    ld [bc], a
    ei
    ld [bc], a
    ei
    ld [bc], a
    ei
    ld bc, $01fa
    ei
    ld bc, $01fa
    ei
    nop
    ld a, [$fb00]
    nop
    ld a, [$fb00]
    rst $38
    ld a, [$fbff]
    rst $38
    ld a, [$fbff]
    cp $fb
    cp $fb
    cp $fb
    cp $fb
    db $fd
    ei
    db $fd
    db $fc
    db $fd
    ei
    db $fd
    db $fc
    db $fc
    db $fc
    db $fc
    db $fc
    db $fc
    db $fc
    db $fc
    db $fc
    ei
    db $fd
    db $fc
    db $fd
    ei
    db $fd
    db $fc
    db $fd
    ei
    cp $fb
    cp $fb
    cp $fb
    cp $fa
    rst $38
    ei
    rst $38
    ld a, [$fbff]
    rst $38
    ld a, [$fa00]
    nop
    ld a, [$fa00]
    nop
    ld a, [$fa02]
    ld bc, $01fa
    ld a, [$fa01]
    inc bc
    ei
    ld [bc], a
    ld a, [$fb02]
    ld [bc], a
    ei
    inc b
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    dec b
    db $fc
    inc b
    db $fc
    inc b
    db $fc
    inc b
    db $fc
    dec b
    db $fd
    dec b
    db $fd
    dec b
    db $fd
    dec b
    db $fd
    ld b, $fe
    dec b
    cp $06
    cp $05
    cp $06
    rst $38
    ld b, $ff
    ld b, $ff
    ld b, $00
    ld b, $00
    ld b, $00
    ld b, $00
    ld b, $02
    ld b, $01
    ld b, $01
    ld b, $01
    ld b, $03
    ld b, $02
    dec b
    ld [bc], a
    ld b, $02
    dec b
    inc b
    dec b
    inc bc
    dec b
    inc bc
    dec b
    inc bc
    dec b
    dec b
    dec b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    dec b
    inc b
    dec b
    inc bc
    dec b
    inc bc
    dec b
    inc bc
    ld b, $03
    dec b
    ld [bc], a
    ld b, $02
    dec b
    ld [bc], a
    ld b, $02
    ld b, $01
    ld b, $01
    ld b, $01
    ld b, $00
    ld b, $00
    ld b, $00
    ld b, $00
    ld b, $fe
    ld b, $ff
    ld b, $ff
    ld b, $ff
    ld b, $fd
    dec b
    cp $06
    cp $05
    cp $05
    db $fc
    dec b
    db $fd
    dec b
    db $fd
    dec b
    db $fd
    dec b
    ei
    inc b
    db $fc
    inc b
    db $fc
    inc b
    db $fc
    inc b
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ei
    inc bc
    ld a, [$fb02]
    ld [bc], a
    ld a, [$fb02]
    ld [bc], a
    ld a, [$fa01]
    ld bc, $01fa
    ld a, [$fa00]
    nop
    ld a, [$fa00]
    nop
    ld a, [$fafe]
    rst $38
    ld a, [$faff]
    rst $38
    ld a, [$fafd]
    cp $fb
    cp $fa
    cp $fb
    db $fc
    ei
    db $fd
    ei
    db $fd
    ei
    db $fd
    ei
    ei
    ei
    db $fc
    db $fc
    db $fc
    db $fc
    db $fc
    db $fc
    ei
    db $fc
    ei
    db $fd
    ei
    db $fd
    ei
    db $fd
    ld a, [$fbfd]
    cp $fa
    cp $fb
    cp $fa
    cp $fa
    rst $38
    ld a, [$faff]
    rst $38
    ld sp, hl
    nop
    ld a, [$f900]
    nop
    ld a, [$f900]
    ld [bc], a
    ld a, [$f901]
    ld bc, $01fa
    ld a, [$fa03]
    ld [bc], a
    ld a, [$fa03]
    ld [bc], a
    ld a, [$fb04]
    inc bc
    ld a, [$fb04]
    inc bc
    ei
    dec b
    db $fc
    inc b
    ei
    dec b
    db $fc
    inc b
    db $fc
    ld b, $fd
    dec b
    db $fc
    ld b, $fd
    dec b
    db $fd
    ld b, $fe
    ld b, $fd
    ld b, $fe
    ld b, $fe
    rlca
    rst $38
    ld b, $ff
    rlca
    rst $38
    ld b, $00
    rlca
    nop
    ld b, $00
    rlca
    nop
    ld b, $02
    rlca
    ld bc, $0106
    rlca
    ld bc, $0306
    ld b, $02
    ld b, $03
    ld b, $02
    ld b, $04
    ld b, $03
    dec b
    inc b
    ld b, $03
    dec b
    dec b
    dec b
    inc b
    inc b
    dec b
    dec b
    inc b
    inc b
    ld b, $04
    dec b
    inc bc
    ld b, $04
    dec b
    inc bc
    ld b, $03
    ld b, $02
    ld b, $03
    ld b, $02
    rlca
    ld [bc], a
    ld b, $01
    rlca
    ld bc, $0106
    rlca
    nop
    ld b, $00
    rlca
    nop
    ld b, $00
    rlca
    cp $06
    rst $38
    rlca
    rst $38
    ld b, $ff
    ld b, $fd
    ld b, $fe
    ld b, $fd
    ld b, $fe
    ld b, $fc
    dec b
    db $fd
    ld b, $fc
    dec b
    db $fd
    dec b
    ei
    inc b
    db $fc
    dec b
    ei
    inc b
    db $fc
    inc b
    ld a, [$fb03]
    inc b
    ld a, [$fb03]
    inc bc
    ld a, [$fa02]
    inc bc
    ld a, [$fa02]
    ld [bc], a
    ld sp, hl
    ld bc, $01fa
    ld sp, hl
    ld bc, $00fa
    ld sp, hl
    nop
    ld a, [$f900]
    nop
    ld a, [$f9fe]
    rst $38
    ld a, [$f9ff]
    rst $38
    ld a, [$fafd]
    cp $fa
    db $fd
    ld a, [$fafe]
    db $fc
    ld a, [$fbfd]
    db $fc
    ld a, [$fbfd]
    ei
    ei
    db $fc
    db $fc
    ei
    ei
    db $fc
    db $fc
    ld a, [$fbfc]
    db $fd
    ld a, [$fbfc]
    db $fd
    ld a, [$fafd]
    cp $fa
    db $fd
    ld a, [$f9fe]
    cp $fa
    rst $38
    ld sp, hl
    rst $38
    ld a, [$f9ff]
    nop
    ld sp, hl
    nop
    ld sp, hl
    nop
    ld sp, hl
    nop
    ld sp, hl
    ld [bc], a
    ld sp, hl
    ld bc, $01f9
    ld a, [$f901]
    inc bc
    ld a, [$f903]
    inc bc
    ld a, [$fa02]
    inc b
    ld a, [$fa04]
    inc b
    ei
    inc b
    ei
    dec b
    ei
    dec b
    ei
    dec b
    ei
    dec b
    db $fc
    ld b, $fc
    ld b, $fc
    ld b, $fc
    dec b
    db $fd
    rlca
    db $fd
    ld b, $fd
    rlca
    cp $06
    cp $07
    rst $38
    rlca
    rst $38
    rlca
    rst $38
    ld b, $00
    rlca
    nop
    rlca
    nop
    rlca
    nop
    rlca
    ld [bc], a
    rlca
    ld bc, $0107
    rlca
    ld bc, $0306
    rlca
    inc bc
    ld b, $03
    rlca
    ld [bc], a
    ld b, $04
    ld b, $04
    ld b, $04
    ld b, $04
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    ld b, $04
    ld b, $04
    ld b, $04
    dec b
    inc b
    rlca
    inc bc
    ld b, $03
    rlca
    inc bc
    ld b, $02
    rlca
    ld [bc], a
    rlca
    ld bc, $0107
    ld b, $01
    rlca
    nop
    rlca
    nop
    rlca
    nop
    rlca
    nop
    rlca
    cp $07
    rst $38
    rlca
    rst $38
    ld b, $ff
    rlca
    db $fd
    ld b, $fd
    rlca
    db $fd
    ld b, $fe
    ld b, $fc
    ld b, $fc
    ld b, $fc
    dec b
    db $fc
    dec b
    ei
    dec b
    ei
    dec b
    ei
    dec b
    ei
    inc b
    ld a, [$fa04]
    inc b
    ld a, [$fb04]
    inc bc
    ld sp, hl
    inc bc
    ld a, [$f903]
    ld [bc], a
    ld a, [$f902]
    ld bc, $01f9
    ld sp, hl
    ld bc, $00fa
    ld sp, hl
    nop
    ld sp, hl
    nop
    ld sp, hl
    nop
    ld sp, hl
    cp $f9
    rst $38
    ld sp, hl
    rst $38
    ld sp, hl
    rst $38
    ld a, [$f9fd]
    db $fd
    ld a, [$f9fd]
    cp $fa
    db $fc
    ld a, [$fafc]
    db $fc
    ld a, [$fbfc]
    ei
    ei
    ei
    ei
    ei
    ei
    ei
    ei
    ld a, [$fafc]
    db $fc
    ld a, [$fbfc]
    db $fc
    ld sp, hl
    db $fd
    ld a, [$f9fd]
    db $fd
    ld a, [$f9fe]
    cp $f9
    rst $38
    ld sp, hl
    rst $38
    ld a, [$f8ff]
    nop
    ld sp, hl
    nop
    ld hl, sp+$00
    ld sp, hl
    nop
    ld hl, sp+$02
    ld sp, hl
    ld bc, $02f9
    ld sp, hl
    ld bc, $03f9
    ld sp, hl
    inc bc
    ld sp, hl
    inc bc
    ld sp, hl
    ld [bc], a
    ld sp, hl
    dec b
    ld a, [$fa04]
    inc b
    ld a, [$fa04]
    ld b, $fb
    dec b
    ei
    dec b
    ei
    dec b
    ei
    rlca
    db $fc
    ld b, $fc
    ld b, $fc
    ld b, $fd
    rlca
    db $fd
    rlca
    db $fd
    rlca
    cp $07
    cp $08
    rst $38
    rlca
    cp $07
    rst $38
    rlca
    nop
    ld [$0700], sp
    nop
    ld [$0700], sp
    ld [bc], a
    ld [$0701], sp
    ld [bc], a
    rlca
    ld bc, $0307
    rlca
    inc bc
    rlca
    inc bc
    rlca
    ld [bc], a
    rlca
    dec b
    rlca
    inc b
    ld b, $04
    ld b, $04
    ld b, $06
    ld b, $05
    dec b
    dec b
    dec b
    dec b
    dec b
    rlca
    dec b
    ld b, $04
    ld b, $04
    ld b, $04
    rlca
    inc bc
    rlca
    inc bc
    rlca
    inc bc
    rlca
    ld [bc], a
    ld [$0702], sp
    ld bc, $0207
    rlca
    ld bc, $0008
    rlca
    nop
    ld [$0700], sp
    nop
    ld [$07fe], sp
    rst $38
    rlca
    cp $07
    rst $38
    rlca
    db $fd
    rlca
    db $fd
    rlca
    db $fd
    rlca
    cp $07
    ei
    ld b, $fc
    ld b, $fc
    ld b, $fc
    ld b, $fa
    dec b
    ei
    dec b
    ei
    dec b
    ei
    dec b
    ld sp, hl
    inc b
    ld a, [$fa04]
    inc b
    ld a, [$f903]
    inc bc
    ld sp, hl
    inc bc
    ld sp, hl
    ld [bc], a
    ld sp, hl
    ld [bc], a
    ld hl, sp+$01
    ld sp, hl
    ld [bc], a
    ld sp, hl
    ld bc, $00f9
    ld hl, sp+$00
    ld sp, hl
    nop
    ld hl, sp+$00
    ld sp, hl
    cp $f8
    rst $38
    ld sp, hl
    cp $f9
    rst $38
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    cp $f9
    ei
    ld sp, hl
    db $fc
    ld a, [$fafc]
    db $fc
    ld a, [$fafa]
    ei
    ei
    ei
    ei
    ei
    ei
    ld sp, hl
    ei
    ld a, [$fafc]
    db $fc
    ld a, [$f9fc]
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    cp $f8
    cp $f9
    rst $38
    ld sp, hl
    cp $f9
    rst $38
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$02
    ld sp, hl
    ld bc, $02f9
    ld sp, hl
    ld bc, $03f9
    ld sp, hl
    inc bc
    ld sp, hl
    inc bc
    ld sp, hl
    ld [bc], a
    ld sp, hl
    dec b
    ld a, [$fa04]
    inc b
    ld a, [$fa04]
    ld b, $fb
    dec b
    ei
    dec b
    ei
    dec b
    ei
    rlca
    db $fc
    ld b, $fc
    ld b, $fc
    ld b, $fd
    rlca
    db $fd
    rlca
    db $fd
    rlca
    cp $07
    cp $08
    rst $38
    rlca
    cp $07
    rst $38
    rlca
    nop
    ld [$0800], sp
    nop
    ld [$0800], sp
    ld [bc], a
    ld [$0701], sp
    ld [bc], a
    rlca
    ld bc, $0307
    rlca
    inc bc
    rlca
    inc bc
    rlca
    ld [bc], a
    rlca
    dec b
    rlca
    inc b
    ld b, $04
    ld b, $04
    ld b, $06
    ld b, $05
    dec b
    dec b
    dec b
    dec b
    dec b
    rlca
    dec b
    ld b, $04
    ld b, $04
    ld b, $04
    rlca
    inc bc
    rlca
    inc bc
    rlca
    inc bc
    rlca
    ld [bc], a
    ld [$0702], sp
    ld bc, $0207
    rlca
    ld bc, $0008
    ld [$0800], sp
    nop
    ld [$0800], sp
    cp $07
    rst $38
    rlca
    cp $07
    rst $38
    rlca
    db $fd
    rlca
    db $fd
    rlca
    db $fd
    rlca
    cp $07
    ei
    ld b, $fc
    ld b, $fc
    ld b, $fc
    ld b, $fa
    dec b
    ei
    dec b
    ei
    dec b
    ei
    dec b
    ld sp, hl
    inc b
    ld a, [$fa04]
    inc b
    ld a, [$f903]
    inc bc
    ld sp, hl
    inc bc
    ld sp, hl
    ld [bc], a
    ld sp, hl
    ld [bc], a
    ld hl, sp+$01
    ld sp, hl
    ld [bc], a
    ld sp, hl
    ld bc, $00f9
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp-$02
    ld hl, sp-$01
    ld sp, hl
    cp $f9
    rst $38
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    cp $f9
    ei
    ld sp, hl
    db $fc
    ld a, [$fafc]
    db $fc
    ld a, [$fafa]
    ei
    ei
    ei
    ei
    ei
    ei
    ld sp, hl
    ei
    ld a, [$fafc]
    db $fc
    ld a, [$f9fc]
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    cp $f8
    cp $f9
    rst $38
    ld sp, hl
    cp $f9
    rst $38
    rst $30
    nop
    ld hl, sp+$00
    rst $30
    nop
    ld hl, sp+$00
    ld hl, sp+$02
    ld sp, hl
    ld bc, $02f9
    ld sp, hl
    ld bc, $03f9
    ld sp, hl
    inc bc
    ld sp, hl
    inc bc
    ld sp, hl
    ld [bc], a
    ld sp, hl
    dec b
    ld a, [$fa04]
    inc b
    ld a, [$fa04]
    ld b, $fb
    dec b
    ei
    dec b
    ei
    dec b
    ei
    rlca
    db $fc
    ld b, $fc
    ld b, $fc
    ld b, $fd
    rlca
    db $fd
    rlca
    db $fd
    rlca
    cp $07
    cp $08
    rst $38
    rlca
    cp $07
    rst $38
    rlca
    nop
    add hl, bc
    nop
    ld [$0900], sp
    nop
    ld [$0802], sp
    ld bc, $0207
    rlca
    ld bc, $0307
    rlca
    inc bc
    rlca
    inc bc
    rlca
    ld [bc], a
    rlca
    dec b
    rlca
    inc b
    ld b, $04
    ld b, $04
    ld b, $06
    ld b, $05
    dec b
    dec b
    dec b
    dec b
    dec b
    rlca
    dec b
    ld b, $04
    ld b, $04
    ld b, $04
    rlca
    inc bc
    rlca
    inc bc
    rlca
    inc bc
    rlca
    ld [bc], a
    ld [$0702], sp
    ld bc, $0207
    rlca
    ld bc, $0009
    ld [$0900], sp
    nop
    ld [$0800], sp
    cp $07
    rst $38
    rlca
    cp $07
    rst $38
    rlca
    db $fd
    rlca
    db $fd
    rlca
    db $fd
    rlca
    cp $07
    ei
    ld b, $fc
    ld b, $fc
    ld b, $fc
    ld b, $fa
    dec b
    ei
    dec b
    ei
    dec b
    ei
    dec b
    ld sp, hl
    inc b
    ld a, [$fa04]
    inc b
    ld a, [$f903]
    inc bc
    ld sp, hl
    inc bc
    ld sp, hl
    ld [bc], a
    ld sp, hl
    ld [bc], a
    ld hl, sp+$01
    ld sp, hl
    ld [bc], a
    ld sp, hl
    ld bc, $00f9
    rst $30
    nop
    ld hl, sp+$00
    rst $30
    nop
    ld hl, sp-$02
    ld hl, sp-$01
    ld sp, hl
    cp $f9
    rst $38
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    cp $f9
    ei
    ld sp, hl
    db $fc
    ld a, [$fafc]
    db $fc
    ld a, [$fafa]
    ei
    ei
    ei
    ei
    ei
    ei
    ld sp, hl
    ei
    ld a, [$fafc]
    db $fc
    ld a, [$f9fc]
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    cp $f8
    cp $f9
    rst $38
    ld sp, hl
    cp $f9
    rst $38
    rst $30
    nop
    rst $30
    nop
    rst $30
    nop
    rst $30
    nop
    ld hl, sp+$02
    ld sp, hl
    ld bc, $02f9
    ld sp, hl
    ld bc, $03f9
    ld sp, hl
    inc bc
    ld sp, hl
    inc bc
    ld sp, hl
    ld [bc], a
    ld sp, hl
    dec b
    ld a, [$fa04]
    inc b
    ld a, [$fa04]
    ld b, $fb
    dec b
    ei
    dec b
    ei
    dec b
    ei
    rlca
    db $fc
    ld b, $fc
    ld b, $fc
    ld b, $fd
    rlca
    db $fd
    rlca
    db $fd
    rlca
    cp $07
    cp $08
    rst $38
    rlca
    cp $07
    rst $38
    rlca
    nop
    add hl, bc
    nop
    add hl, bc
    nop
    add hl, bc
    nop
    add hl, bc
    ld [bc], a
    ld [$0701], sp
    ld [bc], a
    rlca
    ld bc, $0307
    rlca
    inc bc
    rlca
    inc bc
    rlca
    ld [bc], a
    rlca
    dec b
    rlca
    inc b
    ld b, $04
    ld b, $04
    ld b, $06
    ld b, $05
    dec b
    dec b
    dec b
    dec b
    dec b
    rlca
    dec b
    ld b, $04
    ld b, $04
    ld b, $04
    rlca
    inc bc
    rlca
    inc bc
    rlca
    inc bc
    rlca
    ld [bc], a
    ld [$0702], sp
    ld bc, $0207
    rlca
    ld bc, $0009
    add hl, bc
    nop
    add hl, bc
    nop
    add hl, bc
    nop
    ld [$07fe], sp
    rst $38
    rlca
    cp $07
    rst $38
    rlca
    db $fd
    rlca
    db $fd
    rlca
    db $fd
    rlca
    cp $07
    ei
    ld b, $fc
    ld b, $fc
    ld b, $fc
    ld b, $fa
    dec b
    ei
    dec b
    ei
    dec b
    ei
    dec b
    ld sp, hl
    inc b
    ld a, [$fa04]
    inc b
    ld a, [$f903]
    inc bc
    ld sp, hl
    inc bc
    ld sp, hl
    ld [bc], a
    ld sp, hl
    ld [bc], a
    ld hl, sp+$01
    ld sp, hl
    ld [bc], a
    ld sp, hl
    ld bc, $00f9
    rst $30
    nop
    rst $30
    nop
    rst $30
    nop
    rst $30
    cp $f8
    rst $38
    ld sp, hl
    cp $f9
    rst $38
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    cp $f9
    ei
    ld sp, hl
    db $fc
    ld a, [$fafc]
    db $fc
    ld a, [$fafa]
    ei
    ei
    ei
    ei
    ei
    ei
    ld sp, hl
    ei
    ld a, [$fafc]
    db $fc
    ld a, [$f9fc]
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    cp $f8
    cp $f9
    rst $38
    ld sp, hl
    cp $f9
    rst $38
    or $00
    rst $30
    nop
    or $00
    rst $30
    nop
    ld hl, sp+$02
    ld sp, hl
    ld bc, $02f9
    ld sp, hl
    ld bc, $03f9
    ld sp, hl
    inc bc
    ld sp, hl
    inc bc
    ld sp, hl
    ld [bc], a
    ld sp, hl
    dec b
    ld a, [$fa04]
    inc b
    ld a, [$fa04]
    ld b, $fb
    dec b
    ei
    dec b
    ei
    dec b
    ei
    rlca
    db $fc
    ld b, $fc
    ld b, $fc
    ld b, $fd
    rlca
    db $fd
    rlca
    db $fd
    rlca
    cp $07
    cp $08
    rst $38
    rlca
    cp $07
    rst $38
    rlca
    nop
    ld a, [bc]
    nop
    add hl, bc
    nop
    ld a, [bc]
    nop
    add hl, bc
    ld [bc], a
    ld [$0701], sp
    ld [bc], a
    rlca
    ld bc, $0307
    rlca
    inc bc
    rlca
    inc bc
    rlca
    ld [bc], a
    rlca
    dec b
    rlca
    inc b
    ld b, $04
    ld b, $04
    ld b, $06
    ld b, $05
    dec b
    dec b
    dec b
    dec b
    dec b
    rlca
    dec b
    ld b, $04
    ld b, $04
    ld b, $04
    rlca
    inc bc
    rlca
    inc bc
    rlca
    inc bc
    rlca
    ld [bc], a
    ld [$0702], sp
    ld bc, $0207
    rlca
    ld bc, $000a
    add hl, bc
    nop
    ld a, [bc]
    nop
    add hl, bc
    nop
    ld [$07fe], sp
    rst $38
    rlca
    cp $07
    rst $38
    rlca
    db $fd
    rlca
    db $fd
    rlca
    db $fd
    rlca
    cp $07
    ei
    ld b, $fc
    ld b, $fc
    ld b, $fc
    ld b, $fa
    dec b
    ei
    dec b
    ei
    dec b
    ei
    dec b
    ld sp, hl
    inc b
    ld a, [$fa04]
    inc b
    ld a, [$f903]
    inc bc
    ld sp, hl
    inc bc
    ld sp, hl
    ld [bc], a
    ld sp, hl
    ld [bc], a
    ld hl, sp+$01
    ld sp, hl
    ld [bc], a
    ld sp, hl
    ld bc, $00f9
    or $00
    rst $30
    nop
    or $00
    rst $30
    cp $f8
    rst $38
    ld sp, hl
    cp $f9
    rst $38
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    cp $f9
    ei
    ld sp, hl
    db $fc
    ld a, [$fafc]
    db $fc
    ld a, [$fafa]
    ei
    ei
    ei
    ei
    ei
    ei
    ld sp, hl
    ei
    ld a, [$fafc]
    db $fc
    ld a, [$f9fc]
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    cp $f8
    cp $f9
    rst $38
    ld sp, hl
    cp $f9
    rst $38
    or $00
    or $00
    or $00
    or $00
    ld hl, sp+$02
    ld sp, hl
    ld bc, $02f9
    ld sp, hl
    ld bc, $03f9
    ld sp, hl
    inc bc
    ld sp, hl
    inc bc
    ld sp, hl
    ld [bc], a
    ld sp, hl
    dec b
    ld a, [$fa04]
    inc b
    ld a, [$fa04]
    ld b, $fb
    dec b
    ei
    dec b
    ei
    dec b
    ei
    rlca
    db $fc
    ld b, $fc
    ld b, $fc
    ld b, $fd
    rlca
    db $fd
    rlca
    db $fd
    rlca
    cp $07
    cp $08
    rst $38
    rlca
    cp $07
    rst $38
    rlca
    nop
    ld a, [bc]
    nop
    ld a, [bc]
    nop
    ld a, [bc]
    nop
    ld a, [bc]
    ld [bc], a
    ld [$0701], sp
    ld [bc], a
    rlca
    ld bc, $0307
    rlca
    inc bc
    rlca
    inc bc
    rlca
    ld [bc], a
    rlca
    dec b
    rlca
    inc b
    ld b, $04
    ld b, $04
    ld b, $06
    ld b, $05
    dec b
    dec b
    dec b
    dec b
    dec b
    rlca
    dec b
    ld b, $04
    ld b, $04
    ld b, $04
    rlca
    inc bc
    rlca
    inc bc
    rlca
    inc bc
    rlca
    ld [bc], a
    ld [$0702], sp
    ld bc, $0207
    rlca
    ld bc, $000a
    ld a, [bc]
    nop
    ld a, [bc]
    nop
    ld a, [bc]
    nop
    ld [$07fe], sp
    rst $38
    rlca
    cp $07
    rst $38
    rlca
    db $fd
    rlca
    db $fd
    rlca
    db $fd
    rlca
    cp $07
    ei
    ld b, $fc
    ld b, $fc
    ld b, $fc
    ld b, $fa
    dec b
    ei
    dec b
    ei
    dec b
    ei
    dec b
    ld sp, hl
    inc b
    ld a, [$fa04]
    inc b
    ld a, [$f903]
    inc bc
    ld sp, hl
    inc bc
    ld sp, hl
    ld [bc], a
    ld sp, hl
    ld [bc], a
    ld hl, sp+$01
    ld sp, hl
    ld [bc], a
    ld sp, hl
    ld bc, $00f9
    or $00
    or $00
    or $00
    or $fe
    ld hl, sp-$01
    ld sp, hl
    cp $f9
    rst $38
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    cp $f9
    ei
    ld sp, hl
    db $fc
    ld a, [$fafc]
    db $fc
    ld a, [$fafa]
    ei
    ei
    ei
    ei
    ei
    ei
    ld sp, hl
    ei
    ld a, [$fafc]
    db $fc
    ld a, [$f9fc]
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    cp $f8
    cp $f9
    rst $38
    ld sp, hl
    cp $f9
    rst $38
    push af
    nop
    or $00
    push af
    nop
    or $00
    ld hl, sp+$02
    ld sp, hl
    ld bc, $02f9
    ld sp, hl
    ld bc, $03f9
    ld sp, hl
    inc bc
    ld sp, hl
    inc bc
    ld sp, hl
    ld [bc], a
    ld sp, hl
    dec b
    ld a, [$fa04]
    inc b
    ld a, [$fa04]
    ld b, $fb
    dec b
    ei
    dec b
    ei
    dec b
    ei
    rlca
    db $fc
    ld b, $fc
    ld b, $fc
    ld b, $fd
    rlca
    db $fd
    rlca
    db $fd
    rlca
    cp $07
    cp $08
    rst $38
    rlca
    cp $07
    rst $38
    rlca
    nop
    dec bc
    nop
    ld a, [bc]
    nop
    dec bc
    nop
    ld a, [bc]
    ld [bc], a
    ld [$0701], sp
    ld [bc], a
    rlca
    ld bc, $0307
    rlca
    inc bc
    rlca
    inc bc
    rlca
    ld [bc], a
    rlca
    dec b
    rlca
    inc b
    ld b, $04
    ld b, $04
    ld b, $06
    ld b, $05
    dec b
    dec b
    dec b
    dec b
    dec b
    rlca
    dec b
    ld b, $04
    ld b, $04
    ld b, $04
    rlca
    inc bc
    rlca
    inc bc
    rlca
    inc bc
    rlca
    ld [bc], a
    ld [$0702], sp
    ld bc, $0207
    rlca
    ld bc, $000b
    ld a, [bc]
    nop
    dec bc
    nop
    ld a, [bc]
    nop
    ld [$07fe], sp
    rst $38
    rlca
    cp $07
    rst $38
    rlca
    db $fd
    rlca
    db $fd
    rlca
    db $fd
    rlca
    cp $07
    ei
    ld b, $fc
    ld b, $fc
    ld b, $fc
    ld b, $fa
    dec b
    ei
    dec b
    ei
    dec b
    ei
    dec b
    ld sp, hl
    inc b
    ld a, [$fa04]
    inc b
    ld a, [$f903]
    inc bc
    ld sp, hl
    inc bc
    ld sp, hl
    ld [bc], a
    ld sp, hl
    ld [bc], a
    ld hl, sp+$01
    ld sp, hl
    ld [bc], a
    ld sp, hl
    ld bc, $00f9
    push af
    nop
    or $00
    push af
    nop
    or $fe
    ld hl, sp-$01
    ld sp, hl
    cp $f9
    rst $38
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    cp $f9
    ei
    ld sp, hl
    db $fc
    ld a, [$fafc]
    db $fc
    ld a, [$fafa]
    ei
    ei
    ei
    ei
    ei
    ei
    ld sp, hl
    ei
    ld a, [$fafc]
    db $fc
    ld a, [$f9fc]
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    cp $f8
    cp $f9
    rst $38
    ld sp, hl
    cp $f9
    rst $38
    push af
    nop
    push af
    nop
    push af
    nop
    push af
    nop
    ld hl, sp+$02
    ld sp, hl
    ld bc, $02f9
    ld sp, hl
    ld bc, $03f9
    ld sp, hl
    inc bc
    ld sp, hl
    inc bc
    ld sp, hl
    ld [bc], a
    ld sp, hl
    dec b
    ld a, [$fa04]
    inc b
    ld a, [$fa04]
    ld b, $fb
    dec b
    ei
    dec b
    ei
    dec b
    ei
    rlca
    db $fc
    ld b, $fc
    ld b, $fc
    ld b, $fd
    rlca
    db $fd
    rlca
    db $fd
    rlca
    cp $07
    cp $08
    rst $38
    rlca
    cp $07
    rst $38
    rlca
    nop
    dec bc
    nop
    dec bc
    nop
    dec bc
    nop
    dec bc
    ld [bc], a
    ld [$0701], sp
    ld [bc], a
    rlca
    ld bc, $0307
    rlca
    inc bc
    rlca
    inc bc
    rlca
    ld [bc], a
    rlca
    dec b
    rlca
    inc b
    ld b, $04
    ld b, $04
    ld b, $06
    ld b, $05
    dec b
    dec b
    dec b
    dec b
    dec b
    rlca
    dec b
    ld b, $04
    ld b, $04
    ld b, $04
    rlca
    inc bc
    rlca
    inc bc
    rlca
    inc bc
    rlca
    ld [bc], a
    ld [$0702], sp
    ld bc, $0207
    rlca
    ld bc, $000b
    dec bc
    nop
    dec bc
    nop
    dec bc
    nop
    ld [$07fe], sp
    rst $38
    rlca
    cp $07
    rst $38
    rlca
    db $fd
    rlca
    db $fd
    rlca
    db $fd
    rlca
    cp $07
    ei
    ld b, $fc
    ld b, $fc
    ld b, $fc
    ld b, $fa
    dec b
    ei
    dec b
    ei
    dec b
    ei
    dec b
    ld sp, hl
    inc b
    ld a, [$fa04]
    inc b
    ld a, [$f903]
    inc bc
    ld sp, hl
    inc bc
    ld sp, hl
    ld [bc], a
    ld sp, hl
    ld [bc], a
    ld hl, sp+$01
    ld sp, hl
    ld [bc], a
    ld sp, hl
    ld bc, $00f9
    push af
    nop
    push af
    nop
    push af
    nop
    push af
    cp $f8
    rst $38
    ld sp, hl
    cp $f9
    rst $38
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    cp $f9
    ei
    ld sp, hl
    db $fc
    ld a, [$fafc]
    db $fc
    ld a, [$fafa]
    ei
    ei
    ei
    ei
    ei
    ei
    ld sp, hl
    ei
    ld a, [$fafc]
    db $fc
    ld a, [$f9fc]
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    cp $f8
    cp $f9
    rst $38
    ld sp, hl
    cp $f9
    rst $38
    db $f4
    nop
    push af
    nop
    db $f4
    nop
    push af
    nop
    ld hl, sp+$02
    ld sp, hl
    ld bc, $02f9
    ld sp, hl
    ld bc, $03f9
    ld sp, hl
    inc bc
    ld sp, hl
    inc bc
    ld sp, hl
    ld [bc], a
    ld sp, hl
    dec b
    ld a, [$fa04]
    inc b
    ld a, [$fa04]
    ld b, $fb
    dec b
    ei
    dec b
    ei
    dec b
    ei
    rlca
    db $fc
    ld b, $fc
    ld b, $fc
    ld b, $fd
    rlca
    db $fd
    rlca
    db $fd
    rlca
    cp $07
    cp $08
    rst $38
    rlca
    cp $07
    rst $38
    rlca
    nop
    inc c
    nop
    dec bc
    nop
    inc c
    nop
    dec bc
    ld [bc], a
    ld [$0701], sp
    ld [bc], a
    rlca
    ld bc, $0307
    rlca
    inc bc
    rlca
    inc bc
    rlca
    ld [bc], a
    rlca
    dec b
    rlca
    inc b
    ld b, $04
    ld b, $04
    ld b, $06
    ld b, $05
    dec b
    dec b
    dec b
    dec b
    dec b
    rlca
    dec b
    ld b, $04
    ld b, $04
    ld b, $04
    rlca
    inc bc
    rlca
    inc bc
    rlca
    inc bc
    rlca
    ld [bc], a
    ld [$0702], sp
    ld bc, $0207
    rlca
    ld bc, $000c
    dec bc
    nop
    inc c
    nop
    dec bc
    nop
    ld [$07fe], sp
    rst $38
    rlca
    cp $07
    rst $38
    rlca
    db $fd
    rlca
    db $fd
    rlca
    db $fd
    rlca
    cp $07
    ei
    ld b, $fc
    ld b, $fc
    ld b, $fc
    ld b, $fa
    dec b
    ei
    dec b
    ei
    dec b
    ei
    dec b
    ld sp, hl
    inc b
    ld a, [$fa04]
    inc b
    ld a, [$f903]
    inc bc
    ld sp, hl
    inc bc
    ld sp, hl
    ld [bc], a
    ld sp, hl
    ld [bc], a
    ld hl, sp+$01
    ld sp, hl
    ld [bc], a
    ld sp, hl
    ld bc, $00f9
    db $f4
    nop
    push af
    nop
    db $f4
    nop
    push af
    cp $f8
    rst $38
    ld sp, hl
    cp $f9
    rst $38
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    cp $f9
    ei
    ld sp, hl
    db $fc
    ld a, [$fafc]
    db $fc
    ld a, [$fafa]
    ei
    ei
    ei
    ei
    ei
    ei
    ld sp, hl
    ei
    ld a, [$fafc]
    db $fc
    ld a, [$f9fc]
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    cp $f8
    cp $f9
    rst $38
    ld sp, hl
    cp $f9
    rst $38
    db $f4
    nop
    db $f4
    nop
    db $f4
    nop
    db $f4
    nop
    ld hl, sp+$02
    ld sp, hl
    ld bc, $02f9
    ld sp, hl
    ld bc, $03f9
    ld sp, hl
    inc bc
    ld sp, hl
    inc bc
    ld sp, hl
    ld [bc], a
    ld sp, hl
    dec b
    ld a, [$fa04]
    inc b
    ld a, [$fa04]
    ld b, $fb
    dec b
    ei
    dec b
    ei
    dec b
    ei
    rlca
    db $fc
    ld b, $fc
    ld b, $fc
    ld b, $fd
    rlca
    db $fd
    rlca
    db $fd
    rlca
    cp $07
    cp $08
    rst $38
    rlca
    cp $07
    rst $38
    rlca
    nop
    inc c
    nop
    inc c
    nop
    inc c
    nop
    inc c
    ld [bc], a
    ld [$0701], sp
    ld [bc], a
    rlca
    ld bc, $0307
    rlca
    inc bc
    rlca
    inc bc
    rlca
    ld [bc], a
    rlca
    dec b
    rlca
    inc b
    ld b, $04
    ld b, $04
    ld b, $06
    ld b, $05
    dec b
    dec b
    dec b
    dec b
    dec b
    rlca
    dec b
    ld b, $04
    ld b, $04
    ld b, $04
    rlca
    inc bc
    rlca
    inc bc
    rlca
    inc bc
    rlca
    ld [bc], a
    ld [$0702], sp
    ld bc, $0207
    rlca
    ld bc, $000c
    inc c
    nop
    inc c
    nop
    inc c
    nop
    ld [$07fe], sp
    rst $38
    rlca
    cp $07
    rst $38
    rlca
    db $fd
    rlca
    db $fd
    rlca
    db $fd
    rlca
    cp $07
    ei
    ld b, $fc
    ld b, $fc
    ld b, $fc
    ld b, $fa
    dec b
    ei
    dec b
    ei
    dec b
    ei
    dec b
    ld sp, hl
    inc b
    ld a, [$fa04]
    inc b
    ld a, [$f903]
    inc bc
    ld sp, hl
    inc bc
    ld sp, hl
    ld [bc], a
    ld sp, hl
    ld [bc], a
    ld hl, sp+$01
    ld sp, hl
    ld [bc], a
    ld sp, hl
    ld bc, $00f9
    db $f4
    nop
    db $f4
    nop
    db $f4
    nop
    db $f4
    cp $f8
    rst $38
    ld sp, hl
    cp $f9
    rst $38
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    cp $f9
    ei
    ld sp, hl
    db $fc
    ld a, [$fafc]
    db $fc
    ld a, [$fafa]
    ei
    ei
    ei
    ei
    ei
    ei
    ld sp, hl
    ei
    ld a, [$fafc]
    db $fc
    ld a, [$f9fc]
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    cp $f8
    cp $f9
    rst $38
    ld sp, hl
    cp $f9
    rst $38
    di
    nop
    db $f4
    nop
    di
    nop
    db $f4
    nop
    ld hl, sp+$02
    ld sp, hl
    ld bc, $02f9
    ld sp, hl
    ld bc, $03f9
    ld sp, hl
    inc bc
    ld sp, hl
    inc bc
    ld sp, hl
    ld [bc], a
    ld sp, hl
    dec b
    ld a, [$fa04]
    inc b
    ld a, [$fa04]
    ld b, $fb
    dec b
    ei
    dec b
    ei
    dec b
    ei
    rlca
    db $fc
    ld b, $fc
    ld b, $fc
    ld b, $fd
    rlca
    db $fd
    rlca
    db $fd
    rlca
    cp $07
    cp $08
    rst $38
    rlca
    cp $07
    rst $38
    rlca
    nop
    dec c
    nop
    inc c
    nop
    dec c
    nop
    inc c
    ld [bc], a
    ld [$0701], sp
    ld [bc], a
    rlca
    ld bc, $0307
    rlca
    inc bc
    rlca
    inc bc
    rlca
    ld [bc], a
    rlca
    dec b
    rlca
    inc b
    ld b, $04
    ld b, $04
    ld b, $06
    ld b, $05
    dec b
    dec b
    dec b
    dec b
    dec b
    rlca
    dec b
    ld b, $04
    ld b, $04
    ld b, $04
    rlca
    inc bc
    rlca
    inc bc
    rlca
    inc bc
    rlca
    ld [bc], a
    ld [$0702], sp
    ld bc, $0207
    rlca
    ld bc, $000d
    inc c
    nop
    dec c
    nop
    inc c
    nop
    ld [$07fe], sp
    rst $38
    rlca
    cp $07
    rst $38
    rlca
    db $fd
    rlca
    db $fd
    rlca
    db $fd
    rlca
    cp $07
    ei
    ld b, $fc
    ld b, $fc
    ld b, $fc
    ld b, $fa
    dec b
    ei
    dec b
    ei
    dec b
    ei
    dec b
    ld sp, hl
    inc b
    ld a, [$fa04]
    inc b
    ld a, [$f903]
    inc bc
    ld sp, hl
    inc bc
    ld sp, hl
    ld [bc], a
    ld sp, hl
    ld [bc], a
    ld hl, sp+$01
    ld sp, hl
    ld [bc], a
    ld sp, hl
    ld bc, $00f9
    di
    nop
    db $f4
    nop
    di
    nop
    db $f4
    cp $f8
    rst $38
    ld sp, hl
    cp $f9
    rst $38
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    cp $f9
    ei
    ld sp, hl
    db $fc
    ld a, [$fafc]
    db $fc
    ld a, [$fafa]
    ei
    ei
    ei
    ei
    ei
    ei
    ld sp, hl
    ei
    ld a, [$fafc]
    db $fc
    ld a, [$f9fc]
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    cp $f8
    cp $f9
    rst $38
    ld sp, hl
    cp $f9
    rst $38
    di
    nop
    di
    nop
    di
    nop
    di
    nop
    ld hl, sp+$02
    ld sp, hl
    ld bc, $02f9
    ld sp, hl
    ld bc, $03f9
    ld sp, hl
    inc bc
    ld sp, hl
    inc bc
    ld sp, hl
    ld [bc], a
    ld sp, hl
    dec b
    ld a, [$fa04]
    inc b
    ld a, [$fa04]
    ld b, $fb
    dec b
    ei
    dec b
    ei
    dec b
    ei
    rlca
    db $fc
    ld b, $fc
    ld b, $fc
    ld b, $fd
    rlca
    db $fd
    rlca
    db $fd
    rlca
    cp $07
    cp $08
    rst $38
    rlca
    cp $07
    rst $38
    rlca
    nop
    dec c
    nop
    dec c
    nop
    dec c
    nop
    dec c
    ld [bc], a
    ld [$0701], sp
    ld [bc], a
    rlca
    ld bc, $0307
    rlca
    inc bc
    rlca
    inc bc
    rlca
    ld [bc], a
    rlca
    dec b
    rlca
    inc b
    ld b, $04
    ld b, $04
    ld b, $06
    ld b, $05
    dec b
    dec b
    dec b
    dec b
    dec b
    rlca
    dec b
    ld b, $04
    ld b, $04
    ld b, $04
    rlca
    inc bc
    rlca
    inc bc
    rlca
    inc bc
    rlca
    ld [bc], a
    ld [$0702], sp
    ld bc, $0207
    rlca
    ld bc, $000d
    dec c
    nop
    dec c
    nop
    dec c
    nop
    ld [$07fe], sp
    rst $38
    rlca
    cp $07
    rst $38
    rlca
    db $fd
    rlca
    db $fd
    rlca
    db $fd
    rlca
    cp $07
    ei
    ld b, $fc
    ld b, $fc
    ld b, $fc
    ld b, $fa
    dec b
    ei
    dec b
    ei
    dec b
    ei
    dec b
    ld sp, hl
    inc b
    ld a, [$fa04]
    inc b
    ld a, [$f903]
    inc bc
    ld sp, hl
    inc bc
    ld sp, hl
    ld [bc], a
    ld sp, hl
    ld [bc], a
    ld hl, sp+$01
    ld sp, hl
    ld [bc], a
    ld sp, hl
    ld bc, $00f9
    di
    nop
    di
    nop
    di
    nop
    di
    cp $f8
    rst $38
    ld sp, hl
    cp $f9
    rst $38
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    cp $f9
    ei
    ld sp, hl
    db $fc
    ld a, [$fafc]
    db $fc
    ld a, [$fafa]
    ei
    ei
    ei
    ei
    ei
    ei
    ld sp, hl
    ei
    ld a, [$fafc]
    db $fc
    ld a, [$f9fc]
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    cp $f8
    cp $f9
    rst $38
    ld sp, hl
    cp $f9
    rst $38
    ldh a, [c]
    nop
    di
    nop
    ldh a, [c]
    nop
    di
    nop
    ld hl, sp+$02
    ld sp, hl
    ld bc, $02f9
    ld sp, hl
    ld bc, $03f9
    ld sp, hl
    inc bc
    ld sp, hl
    inc bc
    ld sp, hl
    ld [bc], a
    ld sp, hl
    dec b
    ld a, [$fa04]
    inc b
    ld a, [$fa04]
    ld b, $fb
    dec b
    ei
    dec b
    ei
    dec b
    ei
    rlca
    db $fc
    ld b, $fc
    ld b, $fc
    ld b, $fd
    rlca
    db $fd
    rlca
    db $fd
    rlca
    cp $07
    cp $08
    rst $38
    rlca
    cp $07
    rst $38
    rlca
    nop
    ld c, $00
    dec c
    nop
    ld c, $00
    dec c
    ld [bc], a
    ld [$0701], sp
    ld [bc], a
    rlca
    ld bc, $0307
    rlca
    inc bc
    rlca
    inc bc
    rlca
    ld [bc], a
    rlca
    dec b
    rlca
    inc b
    ld b, $04
    ld b, $04
    ld b, $06
    ld b, $05
    dec b
    dec b
    dec b
    dec b
    dec b
    rlca
    dec b
    ld b, $04
    ld b, $04
    ld b, $04
    rlca
    inc bc
    rlca
    inc bc
    rlca
    inc bc
    rlca
    ld [bc], a
    ld [$0702], sp
    ld bc, $0207
    rlca
    ld bc, $000e
    dec c
    nop
    ld c, $00
    dec c
    nop
    ld [$07fe], sp
    rst $38
    rlca
    cp $07
    rst $38
    rlca
    db $fd
    rlca
    db $fd
    rlca
    db $fd
    rlca
    cp $07
    ei
    ld b, $fc
    ld b, $fc
    ld b, $fc
    ld b, $fa
    dec b
    ei
    dec b
    ei
    dec b
    ei
    dec b
    ld sp, hl
    inc b
    ld a, [$fa04]
    inc b
    ld a, [$f903]
    inc bc
    ld sp, hl
    inc bc
    ld sp, hl
    ld [bc], a
    ld sp, hl
    ld [bc], a
    ld hl, sp+$01
    ld sp, hl
    ld [bc], a
    ld sp, hl
    ld bc, $00f9
    ldh a, [c]
    nop
    di
    nop
    ldh a, [c]
    nop
    di
    cp $f8
    rst $38
    ld sp, hl
    cp $f9
    rst $38
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    cp $f9
    ei
    ld sp, hl
    db $fc
    ld a, [$fafc]
    db $fc
    ld a, [$fafa]
    ei
    ei
    ei
    ei
    ei
    ei
    ld sp, hl
    ei
    ld a, [$fafc]
    db $fc
    ld a, [$f9fc]
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    cp $f8
    cp $f9
    rst $38
    ld sp, hl
    cp $f9
    rst $38
    ldh a, [c]
    nop
    ldh a, [c]
    nop
    ldh a, [c]
    nop
    ldh a, [c]
    nop
    ld hl, sp+$02
    ld sp, hl
    ld bc, $02f9
    ld sp, hl
    ld bc, $03f9
    ld sp, hl
    inc bc
    ld sp, hl
    inc bc
    ld sp, hl
    ld [bc], a
    ld sp, hl
    dec b
    ld a, [$fa04]
    inc b
    ld a, [$fa04]
    ld b, $fb
    dec b
    ei
    dec b
    ei
    dec b
    ei
    rlca
    db $fc
    ld b, $fc
    ld b, $fc
    ld b, $fd
    rlca
    db $fd
    rlca
    db $fd
    rlca
    cp $07
    cp $08
    rst $38
    rlca
    cp $07
    rst $38
    rlca
    nop
    ld c, $00
    ld c, $00
    ld c, $00
    ld c, $02
    ld [$0701], sp
    ld [bc], a
    rlca
    ld bc, $0307
    rlca
    inc bc
    rlca
    inc bc
    rlca
    ld [bc], a
    rlca
    dec b
    rlca
    inc b
    ld b, $04
    ld b, $04
    ld b, $06
    ld b, $05
    dec b
    dec b
    dec b
    dec b
    dec b
    rlca
    dec b
    ld b, $04
    ld b, $04
    ld b, $04
    rlca
    inc bc
    rlca
    inc bc
    rlca
    inc bc
    rlca
    ld [bc], a
    ld [$0702], sp
    ld bc, $0207
    rlca
    ld bc, $000e
    ld c, $00
    ld c, $00
    ld c, $00
    ld [$07fe], sp
    rst $38
    rlca
    cp $07
    rst $38
    rlca
    db $fd
    rlca
    db $fd
    rlca
    db $fd
    rlca
    cp $07
    ei
    ld b, $fc
    ld b, $fc
    ld b, $fc
    ld b, $fa
    dec b
    ei
    dec b
    ei
    dec b
    ei
    dec b
    ld sp, hl
    inc b
    ld a, [$fa04]
    inc b
    ld a, [$f903]
    inc bc
    ld sp, hl
    inc bc
    ld sp, hl
    ld [bc], a
    ld sp, hl
    ld [bc], a
    ld hl, sp+$01
    ld sp, hl
    ld [bc], a
    ld sp, hl
    ld bc, $00f9
    ldh a, [c]
    nop
    ldh a, [c]
    nop
    ldh a, [c]
    nop
    ldh a, [c]
    cp $f8
    rst $38
    ld sp, hl
    cp $f9
    rst $38
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    cp $f9
    ei
    ld sp, hl
    db $fc
    ld a, [$fafc]
    db $fc
    ld a, [$fafa]
    ei
    ei
    ei
    ei
    ei
    ei
    ld sp, hl
    ei
    ld a, [$fafc]
    db $fc
    ld a, [$f9fc]
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    cp $f8
    cp $f9
    rst $38
    ld sp, hl
    cp $f9
    rst $38
    pop af
    nop
    ldh a, [c]
    nop
    pop af
    nop
    ldh a, [c]
    nop
    ld hl, sp+$02
    ld sp, hl
    ld bc, $02f9
    ld sp, hl
    ld bc, $03f9
    ld sp, hl
    inc bc
    ld sp, hl
    inc bc
    ld sp, hl
    ld [bc], a
    ld sp, hl
    dec b
    ld a, [$fa04]
    inc b
    ld a, [$fa04]
    ld b, $fb
    dec b
    ei
    dec b
    ei
    dec b
    ei
    rlca
    db $fc
    ld b, $fc
    ld b, $fc
    ld b, $fd
    rlca
    db $fd
    rlca
    db $fd
    rlca
    cp $07
    cp $08
    rst $38
    rlca
    cp $07
    rst $38
    rlca
    nop
    rrca
    nop
    ld c, $00
    rrca
    nop
    ld c, $02
    ld [$0701], sp
    ld [bc], a
    rlca
    ld bc, $0307
    rlca
    inc bc
    rlca
    inc bc
    rlca
    ld [bc], a
    rlca
    dec b
    rlca
    inc b
    ld b, $04
    ld b, $04
    ld b, $06
    ld b, $05
    dec b
    dec b
    dec b
    dec b
    dec b
    rlca
    dec b
    ld b, $04
    ld b, $04
    ld b, $04
    rlca
    inc bc
    rlca
    inc bc
    rlca
    inc bc
    rlca
    ld [bc], a
    ld [$0702], sp
    ld bc, $0207
    rlca
    ld bc, $000f
    ld c, $00
    rrca
    nop
    ld c, $00
    ld [$07fe], sp
    rst $38
    rlca
    cp $07
    rst $38
    rlca
    db $fd
    rlca
    db $fd
    rlca
    db $fd
    rlca
    cp $07
    ei
    ld b, $fc
    ld b, $fc
    ld b, $fc
    ld b, $fa
    dec b
    ei
    dec b
    ei
    dec b
    ei
    dec b
    ld sp, hl
    inc b
    ld a, [$fa04]
    inc b
    ld a, [$f903]
    inc bc
    ld sp, hl
    inc bc
    ld sp, hl
    ld [bc], a
    ld sp, hl
    ld [bc], a
    ld hl, sp+$01
    ld sp, hl
    ld [bc], a
    ld sp, hl
    ld bc, $00f9
    pop af
    nop
    ldh a, [c]
    nop
    pop af
    nop
    ldh a, [c]
    cp $f8
    rst $38
    ld sp, hl
    cp $f9
    rst $38
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    cp $f9
    ei
    ld sp, hl
    db $fc
    ld a, [$fafc]
    db $fc
    ld a, [$fafa]
    ei
    ei
    ei
    ei
    ei
    ei
    ld sp, hl
    ei
    ld a, [$fafc]
    db $fc
    ld a, [$f9fc]
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    cp $f8
    cp $f9
    rst $38
    ld sp, hl
    cp $f9
    rst $38
    pop af
    nop
    pop af
    nop
    pop af
    nop
    pop af
    nop
    ld hl, sp+$02
    ld sp, hl
    ld bc, $02f9
    ld sp, hl
    ld bc, $03f9
    ld sp, hl
    inc bc
    ld sp, hl
    inc bc
    ld sp, hl
    ld [bc], a
    ld sp, hl
    dec b
    ld a, [$fa04]
    inc b
    ld a, [$fa04]
    ld b, $fb
    dec b
    ei
    dec b
    ei
    dec b
    ei
    rlca
    db $fc
    ld b, $fc
    ld b, $fc
    ld b, $fd
    rlca
    db $fd
    rlca
    db $fd
    rlca
    cp $07
    cp $08
    rst $38
    rlca
    cp $07
    rst $38
    rlca
    nop
    rrca
    nop
    rrca
    nop
    rrca
    nop
    rrca
    ld [bc], a
    ld [$0701], sp
    ld [bc], a
    rlca
    ld bc, $0307
    rlca
    inc bc
    rlca
    inc bc
    rlca
    ld [bc], a
    rlca
    dec b
    rlca
    inc b
    ld b, $04
    ld b, $04
    ld b, $06
    ld b, $05
    dec b
    dec b
    dec b
    dec b
    dec b
    rlca
    dec b
    ld b, $04
    ld b, $04
    ld b, $04
    rlca
    inc bc
    rlca
    inc bc
    rlca
    inc bc
    rlca
    ld [bc], a
    ld [$0702], sp
    ld bc, $0207
    rlca
    ld bc, $000f
    rrca
    nop
    rrca
    nop
    rrca
    nop
    ld [$07fe], sp
    rst $38
    rlca
    cp $07
    rst $38
    rlca
    db $fd
    rlca
    db $fd
    rlca
    db $fd
    rlca
    cp $07
    ei
    ld b, $fc
    ld b, $fc
    ld b, $fc
    ld b, $fa
    dec b
    ei
    dec b
    ei
    dec b
    ei
    dec b
    ld sp, hl
    inc b
    ld a, [$fa04]
    inc b
    ld a, [$f903]
    inc bc
    ld sp, hl
    inc bc
    ld sp, hl
    ld [bc], a
    ld sp, hl
    ld [bc], a
    ld hl, sp+$01
    ld sp, hl
    ld [bc], a
    ld sp, hl
    ld bc, $00f9
    pop af
    nop
    pop af
    nop
    pop af
    nop
    pop af
    cp $f8
    rst $38
    ld sp, hl
    cp $f9
    rst $38
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    cp $f9
    ei
    ld sp, hl
    db $fc
    ld a, [$fafc]
    db $fc
    ld a, [$fafa]
    ei
    ei
    ei
    ei
    ei
    ei
    ld sp, hl
    ei
    ld a, [$fafc]
    db $fc
    ld a, [$f9fc]
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    cp $f8
    cp $f9
    rst $38
    ld sp, hl
    cp $f9
    rst $38
    ldh a, [rP1]
    pop af
    nop
    ldh a, [rP1]
    pop af
    nop
    ld hl, sp+$02
    ld sp, hl
    ld bc, $02f9
    ld sp, hl
    ld bc, $03f9
    ld sp, hl
    inc bc
    ld sp, hl
    inc bc
    ld sp, hl
    ld [bc], a
    ld sp, hl
    dec b
    ld a, [$fa04]
    inc b
    ld a, [$fa04]
    ld b, $fb
    dec b
    ei
    dec b
    ei
    dec b
    ei
    rlca
    db $fc
    ld b, $fc
    ld b, $fc
    ld b, $fd
    rlca
    db $fd
    rlca
    db $fd
    rlca
    cp $07
    cp $08
    rst $38
    rlca
    cp $07
    rst $38
    rlca
    nop
    stop
    rrca
    nop
    stop
    rrca
    ld [bc], a
    ld [$0701], sp
    ld [bc], a
    rlca
    ld bc, $0307
    rlca
    inc bc
    rlca
    inc bc
    rlca
    ld [bc], a
    rlca
    dec b
    rlca
    inc b
    ld b, $04
    ld b, $04
    ld b, $06
    ld b, $05
    dec b
    dec b
    dec b
    dec b
    dec b
    rlca
    dec b
    ld b, $04
    ld b, $04
    ld b, $04
    rlca
    inc bc
    rlca
    inc bc
    rlca
    inc bc
    rlca
    ld [bc], a
    ld [$0702], sp
    ld bc, $0207
    rlca
    ld bc, $0010
    rrca
    nop
    stop
    rrca
    nop
    ld [$07fe], sp
    rst $38
    rlca
    cp $07
    rst $38
    rlca
    db $fd
    rlca
    db $fd
    rlca
    db $fd
    rlca
    cp $07
    ei
    ld b, $fc
    ld b, $fc
    ld b, $fc
    ld b, $fa
    dec b
    ei
    dec b
    ei
    dec b
    ei
    dec b
    ld sp, hl
    inc b
    ld a, [$fa04]
    inc b
    ld a, [$f903]
    inc bc
    ld sp, hl
    inc bc
    ld sp, hl
    ld [bc], a
    ld sp, hl
    ld [bc], a
    ld hl, sp+$01
    ld sp, hl
    ld [bc], a
    ld sp, hl
    ld bc, $00f9
    ldh a, [rP1]
    pop af
    nop
    ldh a, [rP1]
    pop af
    cp $f8
    rst $38
    ld sp, hl
    cp $f9
    rst $38
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    cp $f9
    ei
    ld sp, hl
    db $fc
    ld a, [$fafc]
    db $fc
    ld a, [$fafa]
    ei
    ei
    ei
    ei
    ei
    ei
    ld sp, hl
    ei
    ld a, [$fafc]
    db $fc
    ld a, [$f9fc]
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    db $fd
    ld sp, hl
    cp $f8
    cp $f9
    rst $38
    ld sp, hl
    cp $f9
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
