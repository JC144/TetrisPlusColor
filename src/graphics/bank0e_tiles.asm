; ============================================================================
; BANK $0E - Tile & Sprite Data
; ============================================================================
; Address: $4000-$7FFF (switchable)
;
; Graphics tile and sprite definitions. Binary tile pattern data.
;
; ============================================================================
; Originally disassembled with mgbdis v3.0 by Matt Currie

SECTION "ROM Bank $00e", ROMX[$4000], BANK[$e]

    rst $38
    rst $38

Jump_00e_4002:
    adc l
    adc c
    adc l
    adc c
    adc l
    adc c
    adc l
    adc c
    adc l
    adc c
    adc l
    adc c
    adc l
    adc c
    rst $38
    rst $38
    ei
    rst $10
    ei
    rst $10
    ei
    rst $10
    ei
    rst $10
    ei
    rst $10
    ei
    rst $10
    ei
    rst $10
    rst $38
    rst $38
    rst $38
    db $dd
    rst $38
    db $dd
    rst $38
    db $dd
    rst $38
    db $dd
    rst $38
    db $dd
    rst $38
    db $dd
    rst $38
    db $dd
    rst $38
    rst $38
    rst $38
    rst $28
    rst $38
    rst $28
    rst $38
    rst $28
    rst $38
    rst $28
    rst $38
    rst $28
    rst $38
    rst $28
    rst $38
    rst $28
    rst $38
    rst $38
    rst $30
    ei
    rst $30
    ei
    rst $30
    ei
    rst $30
    ei
    rst $30
    ei
    rst $30
    ei
    rst $30
    ei
    rst $38
    rst $38
    db $f4
    ld a, e
    db $f4
    ld a, e
    db $f4
    ld a, e
    db $f4
    ld a, e
    db $f4
    ld a, e
    db $f4
    ld a, e
    db $f4
    ld a, e
    rst $38
    rst $38
    ccf
    call nz, $c43f
    ccf
    call nz, $c43f
    ccf
    call nz, $c43f
    ld a, $c4
    rst $38
    rst $38
    ei
    inc d
    ei
    inc d
    ei
    inc d
    ei
    inc d
    ei
    inc d
    ei
    inc d
    ei
    inc d
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld bc, $0301
    ld a, l
    dec sp
    ld a, l
    dec sp
    ld a, l
    rst $38
    rst $38
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
    nop
    rst $38
    rst $38
    ld a, h
    and e
    ld a, h
    and e
    ld a, h
    and e
    ld a, h
    and e
    ld a, h
    and e
    ld a, h
    and e
    ld a, h
    and e
    rst $38
    rst $38
    pop de
    sub c
    pop de
    sub c
    pop de
    sub c
    pop de
    sub c
    pop de
    sub c
    pop de
    sub c
    pop de
    sub c
    adc l
    adc c
    adc l
    adc c
    adc l
    adc c
    adc l
    adc c
    adc l
    adc c
    adc l
    adc c
    adc l
    adc c
    adc l
    adc c
    ei
    rst $10
    ei
    rst $10
    ei
    rst $10
    ei
    rst $10
    ei
    rst $10
    ei
    rst $10
    ei
    rst $10
    ei
    rst $10
    rst $38
    db $dd
    rst $38
    db $dd
    rst $38
    db $dd
    rst $38
    db $dd
    ld bc, $0301
    ld a, l
    dec sp
    ld a, l
    dec sp
    ld a, l
    rst $38
    rst $28
    rst $38
    rst $28
    rst $38
    rst $28
    rst $38
    rst $28
    rst $38
    rst $28
    rst $38
    rst $28
    rst $38
    rst $28

Jump_00e_40fe:
    db $fd
    db $ed
    rst $30
    ei
    rst $30
    ei
    rst $30
    ei
    di
    ei
    di
    ei
    pop af
    ld sp, hl
    ldh a, [$fff8]
    ldh a, [$fff8]
    call nc, $d45b
    ld e, e
    call c, $cc5b
    ld c, d
    call nz, $c446
    ld b, [hl]
    ret nz

    ret nz

    ret nz

    ret nz

    inc a
    ld b, h
    add hl, sp
    ld h, b
    ld sp, $2360
    ld hl, $2123
    inc bc
    inc bc
    inc sp
    inc sp
    di
    ldh a, [c]
    ei
    inc d
    ei
    ld d, h
    ei
    call nc, $94fb
    ei
    sub h
    ei
    sub h
    res 0, h
    adc e
    inc b
    dec sp
    ld a, l
    inc bc
    ld a, l
    ld a, a
    ld bc, $ffff
    ld bc, $0301
    ld a, l
    dec sp
    ld a, l
    dec sp
    ld a, l
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
    nop
    rst $38
    nop
    ld a, h
    and e
    ld a, h
    and e
    ld a, h
    and e
    ld a, h
    and e
    ld a, h
    and e
    ld a, h
    and e
    ld a, h
    and e
    ld a, h
    and e
    pop de
    sub c
    pop de
    sub c
    pop de
    sub c
    pop de
    sub c
    pop de
    sub c
    pop de
    sub c
    pop de
    sub c
    pop de
    sub c
    adc l
    adc c
    adc l
    adc c
    adc l
    adc c
    adc l
    adc c
    adc l
    adc c
    adc l
    adc c
    adc l
    adc c
    adc l
    adc c
    ei
    rst $10
    ei
    rst $10
    ei
    rst $10
    ei
    rst $10
    ld bc, $0301
    ld a, l
    dec sp
    ld a, l
    dec sp
    ld a, l
    dec sp
    ld a, l
    inc bc
    ld a, l
    ld a, a
    ld bc, $ffff
    ld bc, $0201
    ld a, h
    ld a, [hl-]
    ld a, h
    dec sp
    ld a, l
    db $fc
    db $ec
    db $fc
    db $ec
    db $fc
    db $ec
    db $fc
    db $ec
    nop
    nop
    nop
    ld a, h
    jr jr_00e_41da

    nop
    nop
    ldh a, [$fff8]
    ld [hl], b
    ld a, b
    db $10
    jr jr_00e_41c7

jr_00e_41c7:
    ld [$0000], sp
    ld bc, $0601
    ld b, $08
    ld [$4141], sp
    ld b, $06
    ld [$3908], sp
    add hl, sp
    pop af
    pop af

jr_00e_41da:
    adc c
    adc b
    ld c, a
    ld c, b
    ccf
    daa
    adc b
    adc b
    ld c, h
    ld b, h
    db $fc
    call nz, $a6ba
    ldh [c], a
    cp $f3
    rra
    adc h
    ld a, a
    add sp, -$01
    rra
    inc e
    ccf
    inc a
    ld a, e
    ld a, h
    ld a, e
    inc [hl]
    nop
    nop
    ld bc, $9f01
    adc a
    sbc a
    sbc a
    dec sp
    ld a, l
    inc bc
    ld a, l
    ld a, a
    ld bc, $ffff
    ld bc, $0301
    ld a, l
    ei
    db $fd
    cp e
    db $fd
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld bc, $0301
    ld a, l
    dec sp
    ld a, l
    dec sp
    ld a, l
    ld a, h
    and e
    ld a, h
    and e
    ld a, h
    and e
    ld a, h
    and e
    ld bc, $0301
    ld a, l
    dec sp
    ld a, l
    dec sp
    ld a, l
    pop de
    sub c
    pop de
    sub c
    pop de
    sub c
    pop de
    sub c
    pop de
    sub c
    pop de
    sub c
    pop de
    sub c
    pop de
    sub c
    adc l
    adc c
    adc l
    adc c
    adc l
    adc c
    adc l
    adc c
    adc l
    adc c
    adc l
    adc c
    adc l
    adc c
    adc l
    adc c
    dec sp
    ld a, l
    inc bc
    ld a, l
    ld a, a
    ld bc, $ffff
    ld bc, $0301
    ld a, l
    dec sp
    ld a, l
    dec sp
    ld a, l
    dec sp
    ld a, l
    inc bc
    ld a, l
    ld a, a
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    ld b, b
    inc bc
    inc bc
    nop
    nop
    nop
    nop
    inc bc
    inc bc
    inc c
    inc c
    ccf
    ccf
    ld h, l
    ld h, l
    adc b
    adc b
    ld d, $16

jr_00e_4280:
    inc sp
    inc sp
    db $d3
    db $d3
    jr nc, jr_00e_42b6

    dec hl
    jr z, jr_00e_42a0

    inc d
    rla
    inc d
    cp d
    adc e
    ld a, d
    ld c, e
    cp [hl]
    and d
    ei
    and a
    pop af
    rra
    ret


    rst $38
    push hl
    cp a
    ld h, a
    rst $38
    inc a
    db $fc
    jr nz, jr_00e_4280

jr_00e_42a0:
    ld h, a
    ld a, a
    call nz, Call_000_18fc
    ld hl, sp+$60
    ldh [$ff80], a
    add b
    nop
    nop
    rra
    rra
    rrca
    rrca
    rlca
    dec b
    ld bc, $0f01
    rlca

jr_00e_42b6:
    ld a, a
    ld a, a
    ccf
    ccf
    inc bc
    dec e
    ei
    db $fd
    ei
    db $fd
    dec sp
    ld a, l
    inc bc
    ld a, l
    ld a, a
    ld bc, $ffff
    ld bc, $0301
    ld a, l
    dec sp
    ld a, l
    dec sp
    ld a, l
    dec sp
    ld a, l
    inc bc
    ld a, l
    ld a, a
    ld bc, $ffff
    ld bc, $0301
    ld a, l
    dec sp
    ld a, l
    dec sp
    ld a, l
    dec sp
    ld a, l
    inc bc
    ld a, l
    ld a, a
    ld bc, $ffff
    ld bc, $0301
    ld a, l
    dec sp
    ld a, l
    dec sp
    ld a, l
    pop de
    sub c
    pop de
    sub c
    pop de
    sub c
    pop de
    sub c
    pop de
    sub c
    pop de
    sub c
    pop de
    sub c
    pop de
    sub c
    adc l
    adc c
    adc l
    adc c
    adc l
    adc c
    adc l
    adc c
    adc l
    adc c
    adc l
    adc c
    adc l
    adc c
    adc l
    adc c
    jr nc, jr_00e_4382

    nop
    ld h, b
    ld a, h
    nop
    rst $38
    rst $38
    nop
    nop
    nop
    ld a, b
    jr nc, @+$72

    dec sp
    ld a, l
    inc c
    inc c
    inc sp
    inc sp
    ld b, c
    ld b, c
    ld d, c
    ld d, c
    jr z, @+$2a

jr_00e_432a:
    ld [$0508], sp
    inc b
    add e
    add d
    add hl, de
    add hl, de
    add d
    add d
    call z, Call_00e_5dcc
    ld b, l
    cp [hl]
    and e
    cp b
    and a
    db $d3
    ld e, a
    xor h
    ld l, h
    ld [hl], l
    ld c, l

Jump_00e_4342:
    ld [hl+], a
    ld a, $26
    ld a, $d8
    ret c

    jr nz, jr_00e_432a

    ret nz

    ret nz

    nop
    nop
    ld [$6008], sp
    ldh [$ffc0], a
    ret nz

    nop
    nop
    nop
    nop
    nop
    nop
    ld h, b
    ld h, b
    ld a, h
    ld a, h
    ld a, a
    ld a, a
    inc bc
    dec b
    rst $38
    db $fd
    ccf
    ccf
    rra
    rra
    ld bc, $0301
    ld bc, $0101
    nop
    nop
    dec sp
    ld a, l
    inc bc
    ld a, l
    ld a, a
    ld bc, $ffff
    ld bc, $0301
    ld a, l
    dec sp
    ld a, l
    dec sp
    ld a, l
    dec sp
    ld a, l

jr_00e_4382:
    inc bc

Jump_00e_4383:
    ld a, l
    ld a, a
    ld bc, $ffff
    jp $c300


    nop
    jp $c300


    nop
    dec sp
    ld a, l
    inc bc
    ld a, l
    ld a, a
    ld bc, $ffff
    ld bc, $0301
    ld a, l
    dec sp
    ld a, l
    dec sp
    ld a, l
    dec sp
    ld a, l
    inc bc
    ld a, l
    ld a, a
    ld bc, $ffff
    ld bc, $0301
    ld a, l
    dec sp
    ld a, l
    dec sp
    ld a, l
    pop de
    sub c
    pop de
    sub c
    pop de
    sub c
    pop de
    sub c
    pop de
    sub c
    pop de
    sub c
    pop de
    sub c
    pop de
    sub c
    adc l
    adc c
    adc l
    adc c
    adc l
    adc c
    adc l
    adc c
    adc l
    adc c
    adc l
    adc c
    adc l
    adc c
    adc l
    adc c
    ccf
    ld a, a

jr_00e_43d2:
    inc bc
    ld a, l
    ld a, [hl]
    nop
    db $fd

jr_00e_43d7:
    db $fd
    ld bc, $0301
    ld a, l
    dec sp
    ld a, l
    dec sp
    ld a, l
    inc bc
    ld [bc], a
    ld de, $7011
    jr nc, jr_00e_43d7

    ldh a, [$fff0]
    ldh a, [$ff83]
    ldh a, [c]
    inc sp
    ld [hl], a
    dec hl
    ld l, a
    jr nz, jr_00e_43d2

    ld h, b
    ldh [$ffc1], a
    pop bc
    ld bc, $3101
    ld sp, $3c3c
    ccf
    ld a, $3b
    dec a
    rrca
    rrca
    rrca
    rrca
    adc a
    add l
    rst $28
    rst $20
    sbc l
    sbc l
    add a
    rst $38
    ei
    db $fd
    ei
    db $fd
    ei
    db $fd
    db $e3
    db $fd
    ld a, a
    ld hl, $ffff
    ld bc, $0301
    ld a, l
    dec sp
    ld a, l
    dec sp
    ld a, l
    ldh [$ffe0], a
    inc a
    ld a, h
    ld a, a
    rlca
    rst $38
    rst $38
    ld bc, $0301
    ld a, l
    dec sp
    ld a, l
    dec sp
    ld a, l
    dec sp
    dec a
    inc bc
    dec e
    rlca
    ld bc, $e3e3
    add hl, sp
    add hl, sp
    rrca
    ld a, [hl]
    dec sp
    ld a, l
    dec sp
    ld a, l
    jp $c300


    nop
    jp $c300


    nop
    jp $c300


    nop
    jp $c380


    ld b, b
    dec sp
    ld a, l
    inc bc
    ld a, l
    ld a, a
    ld bc, $ffff
    ld bc, $0301
    ld a, l
    dec sp
    ld a, l
    dec sp
    ld a, l
    dec sp
    ld a, l
    inc bc
    ld a, l
    ld a, a
    ld bc, $ffff
    ld bc, $0301
    ld a, l
    dec sp
    ld a, l
    dec sp
    ld a, l
    pop de
    sub c
    pop de
    sub c
    pop de
    sub c
    pop de
    sub c
    pop de
    sub c
    pop de
    sub c
    pop de
    sub c
    pop de
    sub c
    adc l
    adc c
    adc l
    adc c
    adc l
    adc c
    adc l
    adc c
    adc l
    adc b
    adc l
    adc b
    adc a
    adc b
    rst $38
    rst $38
    dec sp
    ld a, l
    inc bc
    ld a, l
    ld a, a
    ld bc, $ffff
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    rst $38
    dec hl
    ld l, a
    rlca
    ld a, a
    ld a, a
    dec b
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    rst $38
    dec sp
    dec a
    inc de
    dec a
    ld a, a
    ld de, $ffff
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    rst $38
    dec sp
    ld a, l
    inc bc
    ld a, l
    ld a, a
    ld bc, $ffff
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    rst $38
    dec sp
    ld a, l
    inc bc
    ld a, l
    ld a, a
    ld bc, $ffff
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    rst $38
    dec sp
    ld a, l
    inc bc
    ld a, l
    ld a, a
    ld bc, $ffff
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    rst $38
    dec sp
    ld a, l
    inc bc
    ld a, l
    ld a, a
    ld bc, $ffff
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    rst $38
    jp $c300


    nop
    jp $c300


    nop
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    rst $38
    dec sp
    ld a, l
    inc bc
    ld a, l
    ld a, a
    ld bc, $ffff
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    rst $38
    dec sp
    ld a, l
    inc bc
    ld a, l
    ld a, a
    ld bc, $ffff
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    rst $38
    pop de
    sub c
    pop de
    sub c
    pop de
    sub c
    pop de
    sub c
    pop de
    sub c
    pop de
    ld de, $11f1
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    add b
    rst $38
    add b
    db $fc
    add e
    ld hl, sp-$79
    ldh a, [$ff8f]
    ldh [$ff9f], a
    ret nz

    cp a
    rst $38
    rst $38
    add c
    ld a, [hl]
    inc bc
    db $fc
    rlca
    ld hl, sp+$0e
    pop af
    inc a
    jp $8778


    ldh a, [rIF]
    rst $38
    rst $38
    ldh [$ff1f], a
    pop bc
    ld a, $83
    ld a, h
    rlca
    ld hl, sp+$0e
    pop af
    dec e
    db $e3
    ld a, [hl-]
    add $ff
    rst $38
    ldh [$ff1f], a
    pop bc
    ccf
    adc a
    ld a, a
    jr nc, @-$0e

    jp $04c3


    inc b
    ld [$ff08], sp
    rst $38
    ldh a, [rIE]
    ccf
    rrca
    ccf
    inc c
    rst $38
    di
    ccf
    nop
    rrca
    nop
    rlca
    nop
    rst $38
    rst $38
    cp $00
    db $fc
    ldh [rIE], a
    ld e, $ff
    ld bc, $80ff
    rst $38
    ld b, b
    rst $38
    jr nz, @+$01

    rst $38
    ld a, h
    nop
    ld sp, hl
    nop
    di
    nop
    di
    add b
    rst $20
    ld b, b
    rst $28
    jr nz, @+$01

jr_00e_45af:
    db $10
    rst $38
    rst $38
    ldh a, [$ff03]
    push hl
    inc bc
    pop hl
    rlca
    ret


    rlca
    ret nz

    rrca
    sub b
    rrca
    nop
    ld e, $ff
    rst $38
    cp a
    add b
    ld a, a
    nop
    rst $38
    rst $38
    ld a, a
    nop
    cp a
    add b
    cp a
    add b
    ld e, a
    ld b, b
    rst $38
    rst $38
    pop bc
    ld a, a
    add b
    rst $38
    ret nz

jr_00e_45d7:
    rst $38
    pop bc
    ld a, a
    jp nz, $e47f

    ccf
    db $f4
    rra
    rst $38
    rst $38
    ld a, a
    ret nz

    rst $38
    add b
    rst $38
    rst $38
    ld c, $f1
    inc c
    di
    inc e
    db $e3
    jr jr_00e_45d7

    rst $38
    rst $38
    cp a
    add c
    rst $18
    ld b, c
    rst $38
    rst $38
    inc bc
    db $fd
    inc bc
    db $fd
    rlca
    ld sp, hl
    rlca
    ld sp, hl
    add e
    db $fc
    add a
    ld hl, sp-$71
    ldh a, [$ff9e]
    pop hl
    cp h
    jp $87f8


    ldh a, [$ff8f]
    ldh [$ff9f], a
    ldh [$ff1f], a
    ret nz

    ccf
    add c
    ld a, [hl]
    inc bc
    db $fc
    rrca
    ldh a, [rNR34]
    pop hl
    inc a
    jp $8778


    ld [hl], h
    adc h
    db $e4
    inc e
    ret z

    jr c, jr_00e_45af

    ld a, b
    db $10
    ldh a, [rNR10]
    ldh a, [rNR10]
    ldh a, [rNR41]
    ldh [$ff08], a
    ld [$1010], sp
    db $10
    db $10
    jr nz, jr_00e_4658

    jr nz, jr_00e_465a

    jr nz, jr_00e_465c

    ld b, b
    ld b, b
    ld b, b
    ld b, b
    inc bc
    nop
    ld bc, $0100
    nop
    nop
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
    db $10
    rst $38
    ld [$08ff], sp
    rst $38
    inc b

jr_00e_4658:
    rst $38
    inc b

jr_00e_465a:
    rst $38
    ld [bc], a

jr_00e_465c:
    ld a, a
    ld [bc], a
    ld a, a
    ld bc, $08ff
    cp $0c
    rst $38
    rlca
    rst $38
    inc b
    rst $38

jr_00e_4669:
    inc b
    rst $38
    ld [$10ff], sp
    rst $38
    ld h, b
    jr nz, jr_00e_4690

    nop
    inc a
    ld hl, sp-$08
    db $fc
    inc b
    cp $03
    db $fc
    dec b
    ld hl, sp+$0b
    ldh a, [$ff33]
    ld e, a
    ld b, b
    ccf
    ccf
    ld bc, $017e
    cp $03
    db $fc
    inc bc
    db $fc
    rlca
    ld hl, sp+$7f
    rst $38

jr_00e_4690:
    ld hl, sp+$1f
    ldh a, [rIE]
    ret nz

    ccf
    ret nz

    ccf
    add b
    ld a, a
    add c
    ld a, [hl]
    ld bc, $fffe
    db $fc
    jr c, jr_00e_4669

    ld [hl], b
    adc a
    ld [hl], b
    adc a
    ldh a, [rIF]
    ldh [$ff1f], a
    ldh [$ff1f], a
    ret nz

    ccf
    pop bc
    ccf
    rlca
    ld sp, hl
    rrca
    pop af
    rrca
    pop af
    rra
    pop hl
    rra
    pop hl
    ccf
    pop bc
    ccf
    pop bc
    rst $38
    rst $38
    pop bc
    cp [hl]

jr_00e_46c2:
    add e
    db $fc
    add a
    ld hl, sp-$71
    ldh a, [$ff9f]
    ldh [$ffbe], a
    pop bc
    db $fc
    add e
    ld hl, sp-$79
    ldh a, [rIF]
    ldh [$ff1f], a
    ret nz

    ccf
    add c
    ld a, a
    ld b, $fe
    ld [$70f8], sp
    ldh a, [$ff9c]
    sbc h
    jr nz, jr_00e_46c2

    ld h, b
    and b
    ld [hl], b
    ldh a, [$ff8e]
    adc [hl]
    ld bc, $0001
    nop
    nop
    nop
    nop
    nop
    ld b, b
    ld b, b
    add b
    add b
    add b
    add b
    add b
    add b
    rst $38
    rst $38
    nop
    nop
    rlca
    rlca
    rra

Call_00e_46ff:
    jr jr_00e_4701

jr_00e_4701:
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    ldh a, [$fff0]
    nop
    nop
    ret nz

    ret nz

    rst $38
    ccf
    ld a, a
    ld bc, $0e3f
    ld a, a
    ld [hl], b
    rst $38
    add b
    ccf
    nop
    ccf
    rlca
    ld a, a
    ld a, b
    rst $38
    add b
    rst $38
    add b
    rst $38
    rrca
    rst $38
    inc de
    rst $38
    ld hl, $c0ff
    di
    inc c
    ei
    inc b
    ei
    inc b
    ret nz

    rst $00
    nop
    adc a
    nop
    adc a
    ld bc, $821f
    sbc [hl]
    add d
    cp [hl]
    add l
    db $fc
    rst $38
    rst $38
    ld b, b
    ret nz

    cp a
    add b
    cp a
    add b
    ld a, a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    rst $38
    rlca
    inc b
    rst $38
    ld b, $fb
    ld c, $f9
    rrca
    pop af
    rra
    ldh a, [$ff1f]
    ldh [$ff3f], a
    ret nz

    rst $38
    add d
    ld a, [hl]
    add d
    ld a, [hl]
    ld [bc], a
    cp $05
    db $fc
    dec b
    db $fc
    add l
    db $fc
    adc a
    ei
    ld a, [hl]
    cp $01
    ld bc, $01ff
    rst $38
    ld bc, $01ff
    rst $38
    ld bc, $01ff
    rst $38
    pop bc
    ld a, a
    ld b, c
    pop af
    adc a
    ldh [c], a
    sbc [hl]
    call nz, $8fbc
    ei
    sub c
    pop af
    or e
    ldh a, [c]
    set 1, d
    adc a
    adc l
    inc hl
    inc hl
    db $eb
    ld l, e
    db $f4
    or h
    ld [hl+], a
    ld [bc], a
    dec c
    dec c
    ld e, a
    ld d, e

jr_00e_479c:
    ld [hl], e
    ld h, c
    or c
    or b
    ldh a, [$fff0]
    rst $38
    rst $38
    add sp, -$08
    ld l, b
    ld a, b
    dec h
    dec a
    daa
    ccf
    daa
    ccf
    rst $00
    rst $38
    jr nc, jr_00e_47d2

    ret nz

    ret nz

    ret nz

    add b
    add b
    add b
    add b
    add b
    add b
    add b
    ret nz

    add b
    ret nz

    ret nz

    ld a, a
    inc c
    ccf
    ld [bc], a
    rra
    inc bc
    rra
    rlca
    rra
    rlca
    ccf
    rlca
    ccf
    rlca
    ld a, a
    rlca
    rst $38
    nop

jr_00e_47d2:
    rst $38
    nop
    rst $38
    ldh [rIE], a
    ldh a, [rIE]
    ld hl, sp-$01
    ld hl, sp-$01
    ld hl, sp-$01
    ld hl, sp-$09
    add hl, bc
    rst $38
    ld c, $ff
    inc b
    rst $38
    inc b
    rst $38
    rlca
    ld sp, hl
    add hl, bc
    ldh a, [rNR10]
    ldh a, [rNR10]
    db $10
    db $10
    rst $30
    db $10
    rst $28
    jr nz, @-$1f

    ld b, b
    rst $18
    ret nz

    ccf
    jr nz, jr_00e_479c

    sub b
    sbc a
    stop
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld bc, $01ff
    cp $03
    rst $38
    inc bc
    db $fd
    rlca
    ld b, e
    ld a, a
    call z, $b77c
    rst $30
    ld c, b
    ret z

    sub b
    sub b
    sub e
    sub e
    inc a
    inc a
    pop bc
    pop bc
    ld e, e
    ei
    db $db
    ld a, [$a7bf]
    ld c, a
    ld c, l
    ld c, a
    ld c, c
    rst $38
    rst $38
    ld bc, $fc01
    db $fc
    cp a
    and c
    cp a
    and c
    ld a, a
    ld b, c
    rst $38
    rst $38
    ld bc, $ff01
    ld bc, $c1ff
    ccf
    ld hl, $8082
    add d
    add d
    adc a
    adc a
    adc h
    adc b
    adc c
    adc c
    sub d
    sub d
    sbc h
    sbc h
    add b
    cp h
    ld b, d
    ld b, d
    ld l, $2e
    ld sp, hl
    reti


    sbc e
    add d
    inc de
    inc de
    ld a, $27
    ld a, h
    ld b, a
    db $fc
    rst $20
    rst $08
    ld a, a
    rst $38
    rst $38
    rst $38
    ld bc, $00ff
    rst $38
    ldh [$ff1f], a
    ldh a, [rIF]
    ld hl, sp+$07
    db $fc
    pop hl
    ret nz

    rst $38
    ldh a, [rIE]
    rst $28
    ret c

    ret nc

    db $ec
    ld l, h
    db $e3
    inc hl
    ldh [c], a
    ld [hl+], a
    pop af
    ld de, $0cff
    ld hl, sp+$00
    nop
    add b
    nop
    nop
    nop
    nop
    add c
    add c
    ld a, a
    ld a, a
    ld b, h
    ld b, h
    rst $38
    ld hl, sp+$1f
    ld [$000f], sp
    rrca
    inc bc
    dec a
    dec c
    or $f7
    inc h
    daa
    adc b
    adc a
    ldh [rNR41], a
    pop hl
    ld h, c
    ld sp, hl
    ld hl, sp-$39
    cp $01
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    adc a
    rrca
    adc b
    adc b
    adc a
    ld [$088f], sp
    rra
    db $10
    cp a
    and b
    rst $38
    ret nz

    ld a, a
    jp $ffff


    ld c, $0e
    ld sp, hl
    add hl, bc
    ei
    ld a, [de]
    rst $38
    inc e
    rst $38
    ld [hl+], a
    rst $38
    ld h, c
    rst $38
    ret nz

    rra
    inc e
    ld a, a
    ld b, b
    rst $38
    add $f6
    ld d, b
    sub $54
    jp $e343


    inc hl
    pop af
    pop af
    rst $38
    inc bc
    rst $38
    db $fc
    rst $38
    jp nz, $829f

    rra
    inc b
    sbc a
    adc b
    cp a
    sub e
    ccf
    inc l
    rst $38
    pop hl
    rst $38
    add c
    rst $38
    ld b, c
    rst $38
    ld b, c
    rst $38
    add c
    rst $38
    rst $38
    add c
    add c
    add c
    add c
    add b
    cp $81
    rst $38
    pop bc
    rst $38
    pop hl
    cp [hl]
    di
    sbc h
    rst $38
    adc c
    cp $8f
    ldh a, [$ff9f]
    db $fc
    sub a
    db $fc
    rlca
    db $fc
    rlca
    cp $87
    cp $7b
    rst $38
    pop af
    dec a
    db $e3
    ld a, b
    rst $00
    inc bc
    cp $01
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld bc, $06ff
    rst $38
    ld [$90ff], sp
    rst $38
    ld a, [$fa1a]
    ld a, [bc]
    rst $38
    adc a
    db $fc
    adc h
    db $fc
    call nz, $c57d
    ld a, $e6
    inc a
    db $e4
    ld a, b
    ld a, b
    ld c, b
    ld c, b
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    db $fc
    db $fc
    inc bc
    inc bc
    nop
    nop
    ld c, b
    ld c, a
    sub b
    sbc a
    ret nc

    rst $18
    ldh a, [rIE]
    nop
    ccf
    ld h, $3f
    pop bc
    rst $38
    ld b, b
    ld a, a
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
    nop
    rst $38
    pop bc
    rst $38
    ld a, h
    call nz, $c878
    ld a, b
    ret z

    ld a, b
    ld hl, sp+$44
    call nz, $83ff
    rst $38
    add [hl]
    rst $38
    inc b
    ld a, a
    ld a, a
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, a
    ld a, a
    rst $38
    add b
    rst $38
    nop
    rst $38
    nop
    db $fc
    call z, $83ff
    db $fd
    add l
    db $fd
    add l
    ld a, [$f9ca]
    add hl, sp
    ld hl, sp+$08
    db $fc
    inc a
    rst $10
    call nc, $fcff
    ld b, e
    ld b, d
    or e
    or e
    push bc
    push bc
    add c
    add c
    ld bc, $c301
    jp $8181


    rst $18
    ld e, a
    rst $38
    ld h, c
    rst $38
    rst $38
    pop af
    ld de, $21ef
    rst $28
    ld hl, $c1df
    db $fc
    inc bc
    rst $38
    ret nz

    rst $38
    add c
    rst $38
    add d
    rst $38
    add d
    rst $38
    add h
    cp $89
    rst $38
    rst $38
    ld [hl], c
    rst $08
    ldh [c], a
    sbc [hl]
    push bc
    inc a
    srl b
    adc e
    ld a, b
    rla
    ldh a, [$ff2f]
    ldh [rIE], a
    rst $38
    ldh [rIE], a
    ld b, b
    ld a, a
    ldh [$ff3f], a
    ldh a, [$ff1f]
    db $fc
    rrca
    rst $38
    inc bc
    rst $38
    nop
    rst $38
    rst $38
    inc a
    db $e4
    inc e
    db $f4
    inc e
    db $f4
    rra
    rst $38
    dec sp
    add sp, -$09
    ldh a, [$ffef]
    jr nz, @+$01

    rst $38
    nop
    nop
    nop
    nop
    inc bc
    inc bc
    inc bc
    inc bc
    rst $38
    db $fc
    rst $38

jr_00e_4a0b:
    nop
    rst $38
    nop
    rst $38
    rst $38
    ld b, b
    ld a, a
    ld b, b
    ld a, a
    ret nz

    rst $38
    ldh [rIE], a
    ldh [$ff3f], a
    ld hl, sp+$3f
    rst $38
    ld b, a
    rst $38
    rst $38
    ld sp, $0bff
    cp $07
    cp $07
    rst $38
    ld [$3ff8], sp
    ldh a, [rIE]
    ret nz

    rst $38
    rst $38
    rst $38
    ld [$08ff], sp
    rst $38
    db $10
    rst $38
    ldh a, [$ff3f]
    jr nc, @+$01

    jr nz, @+$01

    ld b, b
    rst $38
    rst $38
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
    nop
    rst $38
    rst $38
    cp $12
    rst $38
    ld hl, $20ff
    rst $38
    ld b, e
    cp $46
    rst $38
    adc c
    rst $38
    adc b
    rst $38
    rst $38
    inc c
    inc c
    ldh a, [$fff0]
    adc a
    adc a
    ld de, $2011
    jr nz, jr_00e_4a0b

    and b
    ldh [$ff60], a
    rst $38
    rst $38
    ld e, a
    ld b, c
    ccf
    ld hl, $d1df
    rst $38
    or c
    rst $38
    pop de
    ld a, a
    ld d, c
    ld a, a
    ld [hl], c
    rst $38
    rst $38
    adc a
    adc a
    add e
    add e
    add b
    add b
    ret nz

    ret nz

    cp $be
    rst $38
    add c
    rst $38
    add b
    rst $38
    add b
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    ret nz

    ccf
    jr nc, jr_00e_4aa8

    ld c, $c1
    pop bc
    ld sp, hl
    jr c, @+$01

    ld b, $ff
    rst $38
    ldh [rP1], a
    db $fc
    nop
    rst $38

jr_00e_4aa7:
    nop

jr_00e_4aa8:
    rst $38
    nop
    rst $38
    add b
    rst $38
    ld h, b
    rst $38
    jr @+$01

    rst $38
    db $10
    db $10
    db $10
    db $10
    db $10
    db $10
    ret z

    ld [$08e8], sp
    ld hl, sp+$08
    cp $04
    rst $38
    rst $38
    ret z

    or a
    ld l, b
    ld d, a
    ld e, b
    ld h, a
    jr z, jr_00e_4b01

    inc h
    dec sp
    inc d
    dec de
    inc de
    inc e
    rst $38
    rst $38
    and l
    ld e, d
    adc c
    halt
    ld b, h
    cp e
    ld h, d
    sbc l
    ld hl, $20de
    rst $18
    jr nz, @-$1f

    rst $38
    rst $38
    ret nz

    nop
    ld b, l
    add b
    ld a, a
    add b
    rst $18
    jr nz, jr_00e_4aa7

    ld b, e
    ld a, $c1
    ld b, b
    cp a
    rst $38
    rst $38
    ld [hl], b
    rrca
    db $ed
    inc bc
    db $d3
    dec l
    xor [hl]
    ld d, d
    ld [bc], a
    cp $24
    call c, $dc24
    rst $38

jr_00e_4b01:
    rst $38
    add h
    add h
    inc b
    inc b
    inc b
    inc b
    add hl, bc
    ld [$080b], sp
    rrca
    ld [$103f], sp
    rst $38
    rst $38
    inc bc
    nop
    rra
    nop
    ld a, a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    inc bc
    rst $38
    inc c
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    ld bc, $06fe
    ld hl, sp+$38

jr_00e_4b2a:
    pop bc
    pop bc
    rst $00
    ld b, $ff
    jr c, jr_00e_4b2a

    ld sp, hl
    pop hl
    ld h, c
    add c
    add c
    inc bc
    inc bc
    ccf
    dec a
    rst $38
    pop bc
    rst $38
    ld bc, $01ff
    rst $38
    add b
    rst $38
    add b
    rst $38
    add b
    rst $38
    add b
    rst $38
    add b
    rst $38
    add b
    rst $38
    add c
    rst $38
    add e
    rst $38
    ld bc, $00ff
    rst $38
    nop
    rst $38
    inc bc
    rst $38
    ld b, $ff
    ld a, h
    rst $38
    cp $ff
    cp $ff
    add a
    rst $38
    ld a, a
    rst $38
    ret nz

    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ldh [rP1], a
    rst $38
    inc b
    rst $38
    call nz, $74ff
    rst $38
    inc c
    rst $38
    inc bc
    rst $38
    ld bc, $00ff
    ld a, a
    nop
    jr jr_00e_4b99

    call z, $ea0b
    dec c
    ld a, [$f60d]
    dec b
    push af
    add [hl]
    db $fd
    and $dc
    ld e, a
    rst $28
    db $10
    ld l, l
    sub d
    ld [hl], $c9
    ld b, $e9
    ld c, a

jr_00e_4b99:
    or b
    ld l, l
    sub b
    inc sp
    ret z

    sbc [hl]
    ld h, b
    ret


    ld [hl], $00
    rst $38
    adc h
    ld [hl], e
    sbc b
    ld h, a
    sbc c
    ld h, [hl]
    or a
    ld c, b
    ld a, [hl]
    ld bc, $01fe
    inc l
    call nc, $9869
    ld c, e
    cp b
    sbc a
    ld l, b
    rst $30
    db $10
    rla
    ldh a, [$ff1f]
    di
    db $dd
    dec a
    ld a, a
    db $10
    rst $38
    ld de, $17ff
    rst $38
    jr @+$01

    ld h, b
    rst $38
    ret nz

    rst $38
    add b
    rst $38
    nop
    rst $38
    ld [hl], b
    rst $38
    rst $38
    rst $38
    ld bc, $00ff
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    inc bc
    nop
    rst $38
    ret nz

    rst $38
    nop
    rst $38
    add b
    rst $38
    ld h, b
    rst $38
    jr nc, @+$01

    rra
    rst $38
    ccf
    rst $38
    ccf
    rst $38
    ld bc, $01ff
    rst $38
    ld bc, $01ff
    rst $38
    ld bc, $01ff
    rst $38
    pop bc
    rst $38
    pop hl
    rst $38
    add a
    rst $38
    add a
    rst $38
    add a
    rst $38
    adc a
    cp a
    cp a
    sbc a
    sbc a
    add a
    add a
    add c
    add c
    rst $38
    rst $38
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
    db $fd
    ld hl, sp-$10
    add b
    nop
    nop
    nop

jr_00e_4c24:
    nop
    nop
    nop
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
    nop
    rlca
    nop
    inc bc
    nop
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    and $27
    pop hl
    ld hl, $10f0
    ldh a, [rNR10]
    ldh a, [rNR10]
    ldh a, [rNR10]
    ldh [rNR41], a
    ldh [rNR41], a
    db $f4
    nop
    ld e, b
    add b
    or h
    ret nz

    ld a, b
    ld b, b
    jr c, jr_00e_4c7a

    jr @+$12

    inc c
    ld [$0405], sp
    dec c
    nop
    ld [bc], a
    ld bc, $000f
    inc bc
    inc bc
    inc c
    inc b
    ld [$1008], sp
    db $10
    ld h, b
    jr nz, jr_00e_4c24

    ld [hl], d
    ld b, e
    jp nz, $8487

    rlca
    inc b
    rlca
    inc b

jr_00e_4c7a:
    rlca
    inc b
    inc bc
    ld [bc], a
    inc bc
    ld [bc], a
    ld hl, sp+$00
    ldh a, [rP1]
    ldh [rP1], a
    ret nz

    nop
    add b
    nop
    add b
    nop
    add b
    nop
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
    rst $38
    ld a, a
    ld a, a
    ld a, a
    ld a, a
    ld a, a
    ld a, a
    ld a, a
    ld a, a
    ld a, a
    ld a, a
    ccf
    ld a, a
    ld e, a
    rrca
    rlca
    rst $38
    pop af
    rst $38
    pop af
    rst $38
    ld sp, hl
    rst $38
    ld sp, hl
    rst $38
    rst $38
    db $fd
    db $fd
    pop af
    pop af
    pop bc
    pop bc
    add b

jr_00e_4cc1:
    add b
    add b
    add b
    add b
    add b
    add b
    add b
    add b
    add b
    add b
    add b
    add b
    add b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $e700
    add e
    ld a, a
    ld a, a
    rra
    rra
    rra
    rra
    rrca
    rrca
    rrca
    rrca
    ldh [$ff60], a
    ldh a, [$fff0]
    rst $38
    rst $38
    ld hl, sp-$01
    ld hl, sp-$01
    ld sp, hl
    cp $fe
    pop af
    ld sp, hl
    or $07
    inc b
    inc bc
    ld [bc], a
    inc bc
    ld [bc], a
    rst $38
    cp $41
    cp [hl]
    jp nz, $063d

    ld sp, hl
    inc l
    db $d3
    ld h, b
    jr nz, jr_00e_4d63

    ld b, b
    ld b, b
    ld b, b
    cp a
    ccf
    jr z, jr_00e_4cc1

    ld b, h
    cp e
    ld d, b
    xor a
    ld c, b
    or a
    inc bc
    inc bc
    rlca
    rlca
    ld a, a
    ld a, a
    adc a
    rst $38
    adc a
    ld a, a
    ld c, a
    cp a
    cpl
    rst $18
    or a
    ld c, a
    add b
    nop
    ret nz

    add b
    di
    ldh [rIE], a
    rst $38
    db $fc
    db $fc
    db $fc
    db $fc
    ld hl, sp-$08
    ld hl, sp-$08
    nop
    nop
    nop
    nop
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

jr_00e_4d63:
    nop
    nop
    nop
    nop
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
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $8080
    add b
    add b
    ret nz

    ret nz

    cp h
    or b
    adc a
    adc h
    jp $f0c3


    or b
    ld hl, sp-$78
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ldh [$ff80], a
    rst $38
    db $fc
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
    inc bc
    nop
    rra
    inc bc
    ld hl, sp+$3f
    rst $00
    call nz, Call_000_0f0f
    rra
    rrca
    ccf
    rra
    ldh [$ff3f], a
    rst $00
    ld hl, sp+$00
    rst $38
    add hl, sp
    add $ce
    ld sp, $fff0
    db $e4
    db $d3
    rst $30
    nop
    ld [hl], l
    add b

jr_00e_4dc8:
    ret nz

    nop
    ld b, l
    add b
    and c
    ld b, e
    ld e, [hl]
    and [hl]
    inc sp
    call Call_000_0ef2
    ld l, a
    sbc a
    ret nc

    jr nc, jr_00e_4dc8

    cpl
    ld [hl], b
    ldh a, [$ff87]
    add a
    dec sp
    ld a, [hl-]
    jp z, $24f5

    dec sp
    ld a, a
    ld a, b
    inc c
    rrca
    db $f4
    rst $30
    ld c, $0f
    db $e3
    db $e3
    ret c

    ld e, b
    rra
    rst $20
    ld bc, $b0ff
    ld a, a
    ret c

    rst $18
    adc b
    xor a
    ret c

    ld e, a
    ldh a, [$ffbf]
    ld h, c
    ld a, [hl]
    ld hl, sp-$08
    db $fc
    ld hl, sp-$02
    ld a, h
    sub e
    ld l, [hl]
    add hl, de
    rst $20
    call nz, $2032
    ret nc

    adc a
    ld [hl], b
    nop
    nop
    nop
    nop
    nop
    nop
    add b
    nop
    ldh [$ff80], a
    ld a, h
    ldh [$ff3f], a
    ld e, $71
    ld de, $0000
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
    rst $38
    rra
    rst $38
    rst $38
    ld bc, $0101
    ld bc, $0303
    dec e
    dec c
    ld [hl], c
    ld sp, $c1c1
    add e
    add e
    adc a
    adc l
    rst $38
    add a
    rst $38
    add e
    rst $38
    add c
    rst $38
    add b
    rst $38
    add b
    adc a
    add b
    add c
    add b
    add b
    add b
    rst $38
    rlca
    rst $38
    nop
    rst $38
    nop
    ld hl, sp-$80
    ldh a, [$ff80]
    ldh a, [rLCDC]
    ldh a, [rLCDC]
    ldh a, [rNR41]
    add d
    add e
    pop hl
    ld h, c
    ldh a, [rNR10]
    db $fc
    inc c
    ld e, $02
    rrca
    ld bc, $0003
    ld bc, $7b00
    add a
    dec bc
    or $83
    cp $92
    rst $28
    ld b, d
    ld a, a
    ld [hl+], a
    ccf
    and e
    cp l
    add sp, $77
    ld hl, sp-$08
    sbc h
    ld [hl], h
    sbc a
    ld [hl], a
    dec e
    rst $30
    rrca
    ei
    rrca
    ei
    rst $08
    db $fd
    ld a, a
    cp a
    ld a, l
    ld c, l
    db $fc
    cp h
    db $ec
    inc l

jr_00e_4e96:
    push bc
    push bc
    ldh [rNR41], a
    ldh [$ffa0], a
    pop af
    sub c
    db $fc
    db $ec
    db $fc
    ld [hl], h
    cp [hl]
    cp d
    scf
    dec [hl]
    inc hl
    inc hl
    rlca
    dec b
    rrca
    ld [$909f], sp
    ccf
    inc hl
    cpl
    ccf
    dec e
    dec d
    inc a
    inc [hl]
    ld hl, sp-$18
    ld hl, sp-$58
    ldh a, [$ffd0]
    db $fc
    call c, Call_00e_7fe3
    cp h
    nop
    ldh [$ffe0], a
    jr nz, jr_00e_4ee6

    ld h, b
    ld h, b
    db $db
    pop bc
    ld l, d
    ld b, d
    ld d, d
    ld b, d
    di
    add e
    ld h, b
    jr nz, jr_00e_4e96

    ld b, e
    add a
    add h
    sbc a
    sbc b
    inc a
    jr nz, jr_00e_4f53

    ld b, b
    ldh [$ff80], a
    ret nz

    nop
    rst $38
    ldh a, [rIE]
    nop
    rst $38
    nop

jr_00e_4ee6:
    adc a
    nop
    rlca
    nop
    rlca
    ld bc, $0107
    rlca
    ld [bc], a
    rst $38
    ld [hl], c
    rst $38
    ld h, c
    rst $38
    ld b, c
    rst $38
    add c
    rst $38
    add c
    pop af
    ld bc, $01c1
    add c
    ld bc, $8080
    add b
    add b
    add b
    add b
    add b
    add b
    add b
    add b
    add c
    add b
    adc a
    adc a
    rst $38
    rst $38
    ld [hl], b
    jr nz, @+$3a

    db $10
    jr jr_00e_4f26

    inc e
    jr jr_00e_4f7f

    inc h
    jp $ffc2


    rst $38
    rst $38
    rst $38
    nop
    nop
    nop

jr_00e_4f23:
    nop
    nop
    nop

jr_00e_4f26:
    nop
    nop
    nop
    nop
    nop
    nop
    ret nz

    add b
    rst $38
    rst $38
    rst $38
    ld h, b
    ld h, b
    ccf
    ld h, c
    ld a, $21
    ld a, $67
    jr c, jr_00e_4f23

    scf
    pop de
    ld l, [hl]
    rst $38
    rst $38
    db $e4
    inc e
    ld hl, sp+$08
    cp b
    ld [$0e36], sp
    or e
    rrca
    ldh [$ff1f], a
    add hl, de
    and $ff
    rst $38
    cp [hl]
    cp $ab

jr_00e_4f53:
    db $eb
    ld [hl], l
    ld d, l
    ld [hl+], a
    ld [hl+], a
    db $10
    db $10
    sbc c
    sub c
    ld l, a
    ld hl, sp-$01
    rst $38
    ld a, h
    ld a, a
    push de
    rst $10
    inc bc
    inc bc
    ld b, [hl]
    ld b, [hl]
    ld [$9808], sp
    adc b
    rst $38
    rra
    rst $38
    rst $38
    or c
    cp [hl]
    ld e, [hl]
    ld d, c
    ld [hl+], a
    dec a
    ld h, e
    ld a, h
    adc [hl]
    pop af
    or c
    adc $e8
    rla
    rst $38

jr_00e_4f7f:
    rst $38
    adc e
    ld h, e
    scf
    jp z, $9a67

    and $1a
    daa
    jp c, $da07

    ld sp, $ffcf
    rst $38
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
    add b
    nop
    add c
    nop
    rst $38
    rst $38
    rlca
    ld [bc], a
    ld c, $04
    inc c
    inc b
    inc e
    inc c
    inc sp
    ld [de], a
    ld h, c
    ld hl, $ffff
    rst $38
    rst $38
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $81c1
    pop af
    pop af
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    add b
    rst $38
    add b
    rst $38
    add b
    rst $38
    add b
    rst $38
    add b
    rst $38
    add b
    rst $38
    add b
    rst $38
    rst $38
    db $fd
    ld bc, $01fd
    db $fd
    ld bc, $01fd
    db $fd
    ld bc, $01fd
    db $fd
    ld bc, $ffff
    ld a, a
    add b
    ld a, a
    add b
    ld a, a
    add b
    ld a, a
    add b
    ld a, a
    add b
    ld a, a
    add b
    ld a, a
    add b
    rst $38
    rst $38
    cp $00
    cp $00
    cp $00
    cp $00
    cp $00
    cp $00
    cp $00
    rst $38
    rst $38
    cp a
    ret nz

    cp a
    ret nz

    cp a
    ret nz

    cp a
    ret nz

    cp a
    ret nz

    cp a
    ret nz

    cp a
    ret nz

    rst $38
    rst $38
    db $f4
    inc b
    db $f4
    inc b
    db $f4
    inc b
    db $f4
    inc b
    db $f4
    inc b
    or $06
    push af
    rlca
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
    nop
    add e
    add b
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
    rlca
    nop
    inc bc
    nop
    rst $38
    nop
    rst $38
    rst $38
    cp $00
    rst $38
    nop
    rrca
    nop
    inc bc
    ld bc, $02fe
    rst $38
    rlca
    rst $38
    dec de
    rst $38
    rst $38
    rra
    rra
    and $66
    adc b
    adc b
    db $10
    db $10
    db $10
    db $10
    rst $38
    rst $38
    db $fc
    rst $38
    rst $38
    rst $38
    ldh a, [$fff0]
    add hl, de
    add hl, de
    dec c
    dec c
    nop
    nop
    rrca
    rrca
    add l
    add l
    ld [hl], a
    rst $30
    rst $38
    rst $38
    push hl
    push hl
    dec [hl]
    dec [hl]
    add hl, sp
    add hl, hl
    rst $38
    rst $38
    push bc
    push bc
    cp c
    cp c
    pop bc
    ld b, c
    rst $38
    add b
    rst $38
    add b
    rst $38
    add b
    rst $38
    add b
    add b
    rst $38
    rst $38
    rst $38
    add b
    rst $38
    add b
    rst $38
    db $fd
    ld bc, $01fd
    db $fd
    ld bc, $01fd
    ld bc, $ffff
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld a, a
    add b
    ld a, a
    add b
    ld a, a
    add b
    ld a, a
    add c
    rlca
    rst $38
    rst $38
    ldh a, [$ff1f]
    or $3f
    db $e4
    cp $70
    cp a
    rst $18
    pop hl
    pop hl
    ret nz

    add b
    ret nz

    nop
    ldh [rP1], a
    ldh [rP1], a
    ldh a, [rP1]
    cp a
    ret nz

    rst $38
    ld hl, sp-$39
    add a
    ld h, b
    ld h, b
    jr jr_00e_50e2

    inc b
    inc b
    ld [bc], a
    ld [bc], a
    ld bc, $f401
    rlca
    db $f4
    rlca
    db $f4
    add a
    ld h, h
    ld a, a
    inc e
    rra
    rlca
    rlca
    ld [bc], a
    ld [bc], a
    ld bc, $7f01
    ret nz

jr_00e_50e2:
    ccf
    ldh [$ff1f], a
    ld hl, sp+$04
    db $fc
    inc bc
    cp $ff
    rst $38
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
    inc bc
    nop
    rrca
    nop
    rst $38
    ret nz

    ld a, a
    ld b, b
    ld a, a
    ld h, b
    rst $38
    ld h, b
    cp [hl]
    and c
    sbc l
    sub e
    ei
    ld h, a
    rst $30
    dec l
    or $2d
    sbc [hl]
    dec e
    rlca
    dec b
    add e
    add e
    ld a, [hl]
    cp $bf
    and e
    rra
    ld de, $3b3f
    or l
    or l
    add b
    add b
    ld c, $0e
    adc a
    cp $77
    ld a, h
    adc a
    adc a
    ld [hl], c
    ld [hl], c
    cp h
    xor h
    rst $18
    rst $18
    inc bc
    ld a, [bc]
    inc bc
    ld [bc], a
    rst $38
    ld hl, $21ff
    rst $38
    pop bc
    add c
    add c
    pop bc
    pop bc
    ld hl, $9121
    sub c
    pop af
    pop af
    add b
    rst $38
    add b
    rst $38
    add b
    rst $38
    add b
    rst $38
    add b
    rst $38
    add b
    rst $38
    add b
    rst $38
    add b
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld bc, $01ff
    rst $38
    inc bc
    cp $03
    cp $07
    db $fc
    ccf
    db $fd
    ld a, a
    call nz, $84ff
    rst $38
    ld [$09ff], sp
    rst $38
    rrca
    rst $38
    jr @+$01

    ld h, b
    rst $38
    add b
    ld hl, sp+$00
    rst $38
    ld bc, $3eff
    rst $38
    ldh [rIE], a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld bc, $ff01
    rst $38
    ldh [rP1], a
    ldh a, [rP1]
    db $fc
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    rra
    add b
    add b
    ldh a, [$fff0]
    rrca
    rrca
    nop

jr_00e_5197:
    nop
    nop
    nop
    adc a
    rrca
    db $fc
    jr nc, jr_00e_5197

    ldh [rIE], a
    add b
    ld a, a
    ld b, b
    rst $38
    ldh [$ff3f], a
    inc a
    rlca
    rlca
    ldh a, [$fff0]
    jr jr_00e_51c6

    inc b
    inc b
    ld e, a
    ld [hl], b
    ld c, a
    ld a, b
    ld b, a
    ld a, [hl]
    ld b, c
    ld a, a
    ld b, b
    ld a, a
    ret nz

    rst $38
    ld hl, $133f
    ld e, $8f
    add hl, bc
    db $ec
    dec bc
    db $fd
    dec bc

jr_00e_51c6:
    rst $38
    rlca
    sbc a
    add b
    ld b, a
    ret nz

    rst $38
    rst $38
    rst $00
    ld b, a
    ld [bc], a
    ld c, $82
    adc [hl]
    ld b, b
    call nz, $e020
    rst $38
    rst $38
    and b
    and b
    db $10
    db $10
    db $10
    db $10
    rrca
    inc c
    rra
    jr jr_00e_5204

    ld de, $716f
    rst $20
    ld sp, hl
    rst $18
    dec e
    ld b, a
    ld b, $03
    ld [bc], a
    pop bc
    ld b, c
    pop bc
    ld b, c
    add c
    add c
    ld bc, $0101
    ld bc, $0101
    pop af
    ld bc, $01c1
    add b
    rst $38
    add e
    rst $38

jr_00e_5204:
    add h
    db $fc
    adc b
    ld hl, sp-$70
    ldh a, [$ffa0]
    ldh [$ffc1], a
    pop bc
    pop bc
    pop bc
    rst $00
    add $0f
    ld [$101f], sp
    ccf
    jr nz, @+$81

    ld b, b
    rst $38
    add b
    rst $38
    nop
    rst $38
    ld bc, $00ff
    rst $38
    nop
    rst $38
    nop
    rst $38
    inc bc
    rst $38
    ld c, $ff
    ld a, h
    adc [hl]
    adc h
    inc c
    inc b
    rst $38
    inc bc
    rst $38
    inc e
    rst $38
    ldh [$fffe], a
    nop
    ldh [rP1], a
    nop
    nop
    ld [$0808], sp
    ld [$e0ff], sp
    rst $38
    nop
    rst $38
    nop
    ld bc, $0700
    rlca
    rrca
    rrca
    rra
    rra
    rra
    rra
    ld hl, sp+$40
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    db $fc
    ret nz

    cp $e0
    rst $38
    ldh [rIE], a
    ldh a, [rSC]
    ld [bc], a
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $0181
    rst $38
    inc bc
    dec bc
    ld c, $07
    rlca
    ld b, $06
    ld b, $06
    ld c, $8e
    ld sp, hl
    ld sp, hl
    pop af
    ld sp, $23e3
    ld sp, hl
    ld sp, hl
    ld hl, $0021
    nop
    nop
    nop
    rrca
    rrca
    rra
    ld d, $3f
    inc h
    rst $38
    ld hl, sp+$10
    db $10
    inc de
    db $10
    rst $38
    adc c
    rst $38
    ld b, $ff
    db $fc
    rst $38
    ld c, $f9
    add hl, bc
    rst $38
    ld de, $02c2
    rst $00
    rlca
    ld hl, sp+$18
    ldh [rNR41], a
    ret nz

    ld b, b
    ret nz

    add b
    ret nz

    add b
    ldh [$ffc0], a
    ld bc, $0f01
    rrca
    pop af
    pop af
    ld c, a
    ld b, c
    ccf
    ld hl, $213f
    ccf
    ld hl, $a1bf
    add e
    add d
    add e
    add d
    add e
    add d
    add e
    add d
    add c
    add c
    add c
    add b
    add c
    add b
    add c
    add c
    rst $38
    inc bc
    rst $38
    rlca
    rst $38
    rrca
    rst $38
    rrca
    rst $38
    sbc a
    rst $38
    rst $38
    add a
    add a
    add e
    add e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add b
    add b
    call nz, $eec4
    adc [hl]
    ld a, [$040a]
    inc b
    inc h
    inc h
    inc h
    inc h
    jr jr_00e_5310

    nop
    nop
    nop
    nop
    jr nc, @+$32

    ld c, b
    ld c, b
    ccf
    ccf
    ccf
    ccf
    ccf
    ccf
    ccf
    ccf
    ld a, a
    inc e
    ld a, a
    db $10
    ccf
    nop
    jr c, jr_00e_5310

jr_00e_5310:
    rst $38
    ldh a, [rIE]
    ldh a, [rIE]
    ret nz

    rst $38
    add a
    rst $38
    nop
    rst $38
    nop
    nop
    nop
    nop
    nop
    rst $38
    inc bc
    rst $38
    rlca
    rst $38
    rra
    rst $38
    rst $20
    rst $38
    rlca
    cp $0a
    inc e
    ld [$081e], sp
    db $e3
    db $e3
    rst $00
    rst $00
    add [hl]
    add [hl]
    adc b
    adc b
    ret nz

    ret nz

    ldh [rNR41], a
    db $10
    stop
    nop
    sbc a
    sbc b
    rra
    db $10
    rra
    db $10
    ccf
    jr nz, jr_00e_53c8

    ld a, h
    rst $00
    rst $00
    dec b
    ld b, $0d
    ld c, $ff
    ld de, $21ff
    rst $38
    ld hl, $41ff
    rst $38
    add c
    rst $38
    ld bc, $01ff
    rst $38
    ld bc, $ffff
    ret nz

    add b
    ret nz

    nop
    ldh [$ff80], a
    rst $38
    ld a, a
    jp $82c3


    add d
    add h
    add h
    rst $38
    pop af
    rst $38
    pop af
    cp a
    and c
    cp a
    and c
    rst $38
    pop bc
    ld a, a
    ld b, c
    ld sp, hl
    add a
    rst $00
    cp a
    adc e
    add c
    adc e
    add c
    adc e
    add c
    adc a
    add c
    rst $38
    ei
    rst $38
    add a
    rst $38
    add c
    rst $38
    add b
    ld [bc], a
    inc bc
    inc bc
    inc bc
    ld c, h
    ld c, h
    call c, $f454
    db $f4
    db $f4
    ld h, h
    or $e6
    cp $22
    ldh a, [c]
    ld [de], a
    ldh a, [c]
    ld [de], a
    di
    sub e
    di
    sub e
    ld h, d
    ld h, d
    jr nz, jr_00e_53cc

    nop
    nop
    inc bc
    inc bc
    adc b
    adc b
    adc b
    adc b
    ld [$1008], sp
    db $10
    db $10
    db $10
    rra
    rla
    ld hl, sp-$08
    db $10
    db $10
    stop
    nop
    nop
    nop
    nop
    nop
    nop

jr_00e_53c8:
    nop
    nop
    nop
    nop

jr_00e_53cc:
    add b
    add b
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
    ld bc, $0601
    rlca
    ld a, [bc]
    dec bc
    ld e, $10
    ccf
    jr nc, jr_00e_5414

    jr c, jr_00e_5466

    ld c, [hl]
    jp $d7c7


    xor $ff
    jr c, @+$01

    nop
    nop
    nop
    nop
    nop
    add b
    nop
    ldh [rP1], a
    ld hl, sp-$40
    cp a
    ld sp, $3eaf
    xor a
    jr nc, jr_00e_5436

    ld [hl], $f5
    or $1d
    ld c, $1d
    ld e, $75
    halt
    push af
    add $f4
    rlca
    rst $20
    rra
    cp $03
    cp $03

jr_00e_5414:
    cp $03
    cp $03
    rst $38
    inc bc
    cp $0f
    jr nc, @+$01

    ldh [rIE], a
    add l
    add l
    rst $38
    ld a, d
    ld b, a
    add d
    rst $30
    rlca
    ld sp, hl
    rst $38
    dec bc
    db $fc
    ld a, $c8
    ld l, a
    adc a
    cp c
    ld sp, hl
    pop bc
    pop bc
    add c
    add c

jr_00e_5436:
    add c
    add c
    ld bc, $8101
    add c
    pop bc
    add c
    pop af
    ld bc, $80ff
    rst $38
    add b
    rst $38
    add b
    rst $38
    add e
    rst $38
    sbc h
    rst $38
    ldh [rIE], a
    add b
    rst $38
    rst $38
    cp $3e
    db $e3
    ld h, e
    ret nz

    ld b, b
    ldh [$ffe0], a
    ldh a, [rNR10]
    db $fc

jr_00e_545b:
    inc c
    rst $38
    inc bc
    rst $38
    rst $38
    inc b
    inc b
    inc b
    inc b
    nop
    nop

jr_00e_5466:
    nop
    nop
    nop
    nop
    rlca
    rlca
    dec bc
    inc c
    rst $38
    rst $38
    ld bc, $0301
    inc bc
    rlca
    inc b
    rrca
    ld [$303f], sp
    rst $38
    ret nz

    rst $38
    nop
    rst $38
    rst $38
    ldh a, [rP1]
    rst $38
    rst $38
    ld e, a
    ld h, b
    ld e, a
    ld h, b
    ld e, a
    ld h, b
    ld e, a
    ld h, b
    ld e, a
    ld h, b
    rst $38
    rst $38
    ld a, d
    dec sp
    ld a, [$fac3]
    inc bc
    ld a, [$fa03]
    inc bc
    ld a, [$fa03]
    inc bc
    rst $38
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    cp $01
    pop af
    rrca
    adc [hl]
    ld a, [hl]
    ld [hl], b
    ldh a, [rIE]
    rst $38

jr_00e_54b0:
    xor a
    jr nc, jr_00e_545b

    scf
    and a
    ccf
    jr c, jr_00e_54b0

    ret nz

    ret nz

    nop
    nop
    nop
    nop
    rst $38
    rst $38
    inc e
    db $fc
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
    rst $38
    rst $38
    jr nz, jr_00e_5511

    ld a, a
    rra
    rra
    nop
    inc bc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    ld l, a
    adc h
    rst $38
    ldh a, [rIE]
    nop
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    pop hl
    ld bc, $01c1
    pop bc
    ld bc, $01e1
    ld bc, $0101
    ld bc, $0101
    rst $38
    rst $38
    rst $38
    rst $38
    add b
    add b
    add b
    add b
    add c
    add b
    add c
    add b
    add l
    add b
    adc l
    add d
    sbc h
    add d
    rst $38

jr_00e_5511:
    rst $38
    nop
    nop
    add b
    nop
    add b
    ld b, b
    add b
    ld b, b
    add b
    ld b, b
    nop
    add b
    nop
    nop
    rst $38
    rst $38
    nop
    nop
    inc bc
    nop
    inc bc
    nop
    rlca
    nop
    rrca
    nop
    ld e, $01
    inc a
    ld [bc], a
    rst $38
    rst $38
    ld h, b
    db $10
    ldh [rNR10], a
    ld b, b
    and b
    nop
    add b
    rrca
    adc a
    rra
    db $10
    ccf
    jr nz, @+$01

    rst $38
    nop
    nop
    inc e
    inc e
    ld [hl+], a
    ld a, $42
    ld a, [hl]
    ld b, c
    ld a, a
    ret nz

    rst $38
    ret nz

    ld a, a
    rst $38
    rst $38
    nop
    nop
    jr jr_00e_556e

    inc h
    inc a
    ld [hl+], a
    ld a, $3f
    ccf
    or b
    and b
    ld d, b
    ret nc

    rst $38
    rst $38
    inc bc
    inc bc
    rrca
    inc c
    rra
    db $10
    ccf
    jr nc, @+$01

    ldh a, [$ffdf]
    ld l, a

jr_00e_556e:
    ld a, [hl]
    ld [hl+], a
    rst $38
    rst $38
    ret nz

    ret nz

    ldh [rNR41], a
    db $e3
    inc hl
    xor $2c
    call c, $ff5c
    rst $38
    jr c, jr_00e_55bf

    rst $38
    rst $38
    nop
    nop
    ld a, a
    ld a, a
    ret nz

    add b
    nop
    nop
    ld bc, $8301
    add d
    ld a, h
    db $fc
    rst $38
    rst $38
    ld e, $01
    cp h
    add d
    ld a, b
    ld [hl], h
    cp $7e
    jp Jump_000_0081


    nop
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
    nop
    nop
    ret nz

    ret nz

    nop
    nop
    ldh a, [$fff0]
    rst $38
    rst $38
    ld bc, $0101
    ld bc, $0101
    ld bc, $1d01
    dec e
    inc hl
    inc hl
    inc hl

jr_00e_55bf:
    inc hl
    cp h
    add d
    ld hl, sp-$7c
    ldh a, [$ff88]
    ldh [$ff90], a
    ret nz

    and b
    add b
    ret nz

    add b
    add b
    add b
    add b
    nop
    nop
    nop
    nop
    nop
    nop
    ld [bc], a
    nop
    ld b, $01
    rlca
    ld bc, $0306
    inc b
    rlca
    ld a, e
    rlca

jr_00e_55e2:
    db $f4
    rrca

jr_00e_55e4:
    db $e4
    rla

jr_00e_55e6:
    db $fc
    ccf
    jp nz, $02ff

    rst $38
    ld b, $ff
    ld a, [bc]
    ei
    ld a, a
    ld b, b
    rst $38
    ret nz

    ld a, a
    rst $00
    ld a, b
    ret z

    jr c, jr_00e_55e2

    jr c, jr_00e_55e4

    jr c, jr_00e_55e6

    inc e
    db $f4
    ldh [$ff3f], a
    ldh a, [$ff1f]
    ldh a, [$ff1f]
    ld hl, sp-$71
    ld a, b
    ld c, a
    ld a, h
    ld b, a
    inc a
    daa
    ld a, h
    daa
    inc a
    ld hl, sp+$1e
    cp $0f
    rst $38
    ld [bc], a
    rst $38
    nop
    rst $38
    ld b, b
    rst $38
    ld h, [hl]
    rst $38
    scf
    db $fd
    cpl
    ld sp, $1837
    rst $38
    inc e
    rst $38
    ret c

    ld a, $e1
    inc a
    db $e3
    ld a, c
    rst $00
    ld [hl], d
    adc $87
    add a
    ret nz

    ld b, b
    ldh a, [$ff30]
    adc h
    ld a, h
    ccf
    rst $38
    ld a, a
    add $ff
    add c
    rst $18
    adc [hl]
    ld b, $fe
    pop bc
    rst $38
    jr nc, jr_00e_5685

    inc c
    rrca
    add e
    add e
    ldh a, [$fff0]
    db $fc
    adc h
    rst $38
    add e
    nop
    nop
    add b
    add b
    ld h, b
    ldh [rNR24], a
    ldh a, [rIF]
    db $fc
    jp $33ff


    ccf
    rra
    rrca
    pop af
    ld sp, $1afa
    ld a, [$fa1a]
    ld a, [bc]
    db $fd
    dec c
    db $fc
    inc d
    rst $38
    sub a
    cp $fe
    db $e3
    db $e3
    ccf
    scf
    add hl, sp
    add hl, hl
    ld a, c
    add hl, hl
    ld sp, hl
    pop af
    ret


    adc c
    adc a
    adc a
    ld [hl], e
    ld [hl], c
    add b
    add b
    add b
    add b
    add b

jr_00e_5685:
    add b
    add b
    add b
    add b
    add b
    add c
    add c
    add d
    add e
    add h
    add a
    ld [$100f], sp
    rra
    jr nz, jr_00e_56d5

    ld hl, $fb3f
    cp $07
    db $fc
    inc bc
    cp $71
    rst $38
    ld [de], a
    di
    ld [hl-], a
    di
    ld [de], a
    di
    ld [de], a
    di
    adc d
    ei
    adc c
    ld sp, hl
    adc c
    ld sp, hl
    push bc
    db $fd
    inc e
    db $f4
    rra
    ldh a, [c]
    rra
    ldh a, [c]
    rrca
    ld sp, hl
    rrca
    ld hl, sp+$0f
    ld hl, sp+$0f
    ld hl, sp+$07
    db $fc
    cp $23
    cp $23
    cp $23
    cp $c3
    cp $03
    cp $03
    cp $03
    cp $07
    dec l
    db $ed
    dec h
    push hl
    dec d

jr_00e_56d5:
    push af
    dec d
    push af

jr_00e_56d8:
    dec d
    push af
    dec d
    push af
    dec [hl]
    push af
    ld b, l
    push bc
    ld [hl], h
    call z, $d868
    ld [hl], b
    ret nc

    ld hl, $e3e1
    db $e3
    ld [bc], a
    ld [bc], a
    ld b, $06
    adc $ca
    ld c, [hl]
    ld d, a
    ld b, d
    ld c, e
    ld b, a
    ld c, [hl]
    rst $08
    add $0b
    ld a, [bc]
    ld h, [hl]
    ld b, $34
    inc b
    nop
    nop
    ld hl, sp-$79
    ldh a, [$ff8f]
    di
    adc a
    rst $20
    sbc h
    db $ec
    ld e, b
    ld l, b
    ld e, b
    ld l, b
    jr c, jr_00e_573f

    jr nc, jr_00e_56d8

    rst $00
    di
    pop hl
    ld hl, sp+$18
    db $fc
    call z, $267e
    dec a
    rla
    inc e
    rla
    inc e
    rlca
    cp $f6
    rst $38
    rst $38
    db $fd
    cp $7f
    ld a, a
    jr c, jr_00e_5769

    dec de
    inc e
    adc h
    adc a
    ld b, a
    rst $00
    rlca
    ld bc, $818f
    ld a, a
    pop hl
    db $dd
    inc sp
    ld sp, hl
    sub l
    pop de
    add hl, sp
    ld h, c
    pop af
    pop bc

jr_00e_573f:
    and c
    adc b
    adc a
    adc b
    adc a
    add h
    add a
    add d
    add e
    add e
    add c
    add a
    add b
    sbc a
    sbc a
    cp a
    and b
    cp b
    adc a
    ld a, h
    rst $00
    inc [hl]
    rst $28
    jr @+$01

    nop
    rst $38
    add c
    rst $38
    pop bc
    rst $38
    ldh [c], a
    ld a, [hl]
    push bc
    db $fd
    jp nz, $c2fe

    cp $c2
    cp $a1

jr_00e_5769:
    cp a
    ld hl, $213f
    ccf
    ld de, $071f
    db $fc
    add a
    cp $85
    db $fd
    add h
    db $fc
    add h
    db $fc
    add h
    db $fc
    ld c, b
    ld a, b
    jr nc, jr_00e_57b8

    db $fd
    dec b
    ld hl, sp+$08
    ldh a, [$fff0]
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $0300
    nop
    add l
    add h
    inc b
    inc b
    dec d
    dec b
    inc [hl]
    inc c
    ld [hl], h
    inc c
    db $f4
    inc c
    db $e4
    inc d
    call nz, Call_000_3f24
    ld [hl-], a
    dec l
    dec hl
    jp hl


    rst $28
    jr c, jr_00e_57d7

    ld hl, sp-$09
    inc e
    inc de
    ld a, l
    ld [de], a
    ld a, a
    ld l, b
    ld [bc], a
    nop
    ld [bc], a
    inc bc
    add e
    inc bc
    add e
    add e

jr_00e_57b8:
    jp nz, Jump_00e_4383

    jp nz, $e223

    inc de
    di
    scf
    ld d, $17
    rla
    add c
    add c
    ld b, b
    ret nz

    ret nz

    ld b, b
    jp $8140


    add b
    nop
    nop
    inc c
    rlca
    adc h
    rlca
    adc l

jr_00e_57d5:
    add [hl]
    rst $08

jr_00e_57d7:
    add h
    rrca
    ld [$0f1f], sp
    sbc b
    ld [$0033], sp
    ld h, e
    jp $61a1


    ret nc

    jr nc, jr_00e_57d7

    db $10
    ld hl, sp+$08
    ld hl, sp-$78
    ld a, h
    ld b, h
    db $fc
    ld b, h
    add c
    ld b, c
    ld bc, $8181
    add c
    pop bc
    ld b, c
    ld b, c
    ld b, c
    ld hl, $1121
    ld de, $1111
    rst $38

Jump_00e_5801:
    ret nz

    rst $38
    rst $00
    ld hl, sp-$38
    ld hl, sp-$38
    ld hl, sp-$38
    db $fc
    call nz, $c4fc
    rst $38
    jp $3ee2


    pop af
    rra

jr_00e_5814:
    ldh a, [$ff9f]
    ld a, b
    ld c, a
    ld a, b
    ld c, a
    ld a, h
    ld b, a
    ld a, h
    ld b, a
    cp $87
    ld de, $091f
    rrca
    add a
    add [hl]
    ld b, a
    ret nz

    ld c, a
    ret nz

    ld a, $e1
    inc a
    ldh [c], a
    jr c, jr_00e_5814

    or b
    ld [$50a0], sp
    add b
    ld b, b
    add b
    ld b, b
    nop
    add b
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    nop
    rrca
    nop
    ld c, $01
    inc l
    ld [bc], a
    ld l, b
    inc d
    ld h, b
    db $10
    ld h, b
    db $10
    ld b, b
    jr nz, jr_00e_57d5

    ld b, h
    inc b
    add h
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc c
    ld [$0808], sp
    ld [$7f08], sp
    ld d, d
    rst $38
    sbc [hl]
    ld h, e
    ld [hl+], a
    jp Jump_00e_4342


    ld b, e
    ld b, a
    ld b, a
    ld c, a
    ld c, b
    sbc $51
    ld [$3cf8], sp
    db $fc
    rst $38
    ld b, a
    adc c
    adc b
    add hl, bc
    ld [$8999], sp
    ldh a, [c]
    ldh a, [c]
    ld b, e
    jp RST_00


    nop
    nop
    pop hl
    ret nz

    rst $00
    ld b, a
    jp z, Jump_000_09cb

    add hl, bc
    ld de, $e111
    pop hl
    scf
    nop
    ld a, a
    ld de, $3edf
    pop hl
    cp $01
    cp $f1
    cp $1d
    ld c, $07
    ld [bc], a
    cp $42
    rst $38
    add d
    rst $18
    ld hl, $31df
    rst $18
    dec a
    rst $18
    inc sp
    db $dd
    inc sp
    db $fc
    ld [de], a
    add hl, bc
    add hl, bc
    add hl, bc
    add hl, bc
    adc c
    adc c
    pop af
    ld [hl], c
    add c
    ld b, c
    ld bc, $0181
    ld bc, $0101
    cp a
    and b
    cp a
    and b
    sbc a
    sub b
    adc a
    adc b
    adc a
    adc [hl]
    sbc l
    sub l
    cp h
    and h
    cp h
    and h
    db $fd
    dec b
    db $fd
    inc b
    rst $38
    inc b
    rst $38
    inc b
    ei
    ld [$f1f2], sp
    nop
    nop
    nop
    nop
    ldh a, [$ffc8]
    ld h, b
    db $10
    ld b, b
    and b
    nop
    add b
    ld bc, $0180
    nop
    rrca
    nop
    dec c
    ld [bc], a
    nop
    nop
    nop
    nop
    nop
    nop
    add b
    nop
    add b
    ld b, b
    add b
    ld b, b
    add b
    ld b, b
    nop
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
    jr jr_00e_5922

    db $10
    db $10
    db $10
    db $10
    db $10
    db $10
    db $10
    db $10
    ld de, $3910
    db $10
    ld a, a
    ld [$5dde], sp

jr_00e_5922:
    rst $28
    ld h, a
    rst $08
    ld b, e
    adc $02
    call z, $dc04
    inc b
    db $fc

jr_00e_592d:
    inc c
    db $f4
    inc d
    call nz, $e4c7
    and a
    add hl, hl
    cpl
    ld d, $1e
    rra
    rra
    nop
    nop
    ld [hl], b
    ld [hl], b
    sbc h
    sbc h
    ld b, c
    pop bc
    add a
    add [hl]
    ld c, $08
    ld [$f008], sp
    ldh a, [rDIV]
    nop
    ld b, $04
    rlca
    inc b
    ld bc, $0101
    nop
    nop
    nop
    nop

jr_00e_5957:
    nop
    inc bc
    inc bc
    inc c
    rrca
    jr nc, jr_00e_599d

    ret nc

    rst $28
    ld hl, sp+$14
    ldh a, [$ff98]
    ldh [$ffb0], a
    ldh [$ffe0], a
    ld h, b
    ldh [rNR41], a
    ldh [rNR10], a
    ldh a, [$ffd0]
    ldh a, [rSB]
    ld bc, $0103
    rlca
    ld bc, $0107
    ccf
    ld bc, $0b35
    ld sp, $3109
    add hl, bc
    db $fc
    call nz, $c2fe
    cp $c2
    cp $c2
    cp $c2
    cp [hl]
    and d
    sbc h
    sbc h
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
    ld bc, $0300
    nop
    inc bc

jr_00e_599d:
    nop
    rst $38
    rst $38
    inc e
    ld [bc], a
    inc a
    ld [bc], a
    ld a, b
    inc b
    ldh a, [$ff08]
    ldh [rNR10], a
    ret nz

    jr nz, jr_00e_592d

    ld b, b
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
    nop
    nop
    nop
    rst $38
    rst $38
    nop
    nop
    ld bc, $0300
    nop
    rlca
    nop
    rrca
    nop
    ld c, $01
    inc l
    ld [bc], a
    rst $38
    rst $38
    rst $30
    inc c
    db $e3
    inc de
    ret nz

    jr nz, jr_00e_5957

    ld b, b
    nop
    add b
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    ldh [c], a
    ld h, d
    add e
    add d
    inc bc
    ld [bc], a
    inc bc
    ld [bc], a
    inc bc
    ld [bc], a
    ld bc, $0101
    ld bc, $ffff
    sbc [hl]
    sub d
    ld sp, hl
    sub c
    ld hl, sp+$60
    db $fc
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    rst $38
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    ld bc, $0003
    rlca
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    rst $38
    ld a, e
    add a
    db $fc
    inc b
    db $fc
    ld [$90fc], sp
    cp $90
    rst $38
    ld a, b
    rst $00
    ld b, a
    rst $38
    rst $38
    jr nc, @+$32

    db $10
    db $10
    ld [$0408], sp
    inc b
    inc b
    inc b
    add d
    add d
    ld [bc], a
    ld [bc], a
    rst $38
    rst $38
    ld hl, $0111
    ld bc, $0101
    ld bc, $0101
    ld bc, $0101
    ld bc, $ff01
    rst $38
    ld bc, $0ed0
    ld [hl+], a
    ld h, b
    nop
    nop
    ld h, b
    inc a
    inc a
    ld h, [hl]
    nop
    jr nc, jr_00e_5a8a

    inc a
    nop
    nop
    jr c, jr_00e_5a8b

    jr jr_00e_5a55

jr_00e_5a55:
    jr nc, @+$11

    ld [$041c], sp
    ld [$261c], sp
    nop
    nop
    inc c
    inc c
    jr jr_00e_5a7b

    jr nc, jr_00e_5a95

    ld a, $3e
    rrca
    jr @+$08

    ld b, $1c
    inc e
    ld b, b
    ld b, c
    ld b, $06
    ld h, $26
    inc e
    inc e
    rra
    ld [$002c], sp
    nop
    ld c, h

jr_00e_5a7b:
    ld c, h
    ld a, [hl]
    ld a, [hl]
    inc c
    nop
    nop
    nop
    nop
    adc e
    nop
    ld a, $3e
    jr nc, jr_00e_5ab9

    inc a

jr_00e_5a8a:
    inc a

jr_00e_5a8b:
    ld b, $00
    nop
    rra
    jr z, jr_00e_5ac1

    nop
    nop
    inc a
    inc a

jr_00e_5a95:
    ld [hl-], a
    nop
    nop
    ld sp, hl
    sbc h
    cpl

jr_00e_5a9b:
    ld [$3e3e], sp
    ld c, a
    jr @+$03

    jr @+$81

    jr z, @+$07

    jr z, jr_00e_5b16

    jr z, @+$20

    ld e, $41
    ld [$085f], sp
    sbc a
    jr jr_00e_5b2f

    ld a, [hl]
    and l
    jr jr_00e_5b25

    sbc a
    nop
    nop
    ld a, h

jr_00e_5ab9:
    ld a, h
    xor a
    ld [$2805], sp
    cp a
    jr jr_00e_5b21

jr_00e_5ac1:
    nop

jr_00e_5ac2:
    db $10
    cp a
    jr jr_00e_5ae5

    jr jr_00e_5a9b

    jr jr_00e_5ae9

    ld [$7e7e], sp
    dec e
    ld [$2733], sp
    dec b
    jr z, @+$11

    jr z, jr_00e_5b52

    ld a, h
    inc sp
    jr jr_00e_5b19

    jr z, jr_00e_5b4a

    ld l, [hl]
    rst $38
    jr z, @+$0f

    add hl, de
    ld l, a
    jr c, jr_00e_5b20

    inc a

jr_00e_5ae5:
    rrca
    ld e, c
    ld a, $3e

jr_00e_5ae9:
    ld hl, $bb00
    jr z, jr_00e_5b5a

    ld l, h
    jr c, @+$3a

    cpl
    ld [$6c6c], sp
    ld a, b
    ld a, b
    ld [hl], b
    ld [hl], b
    ld a, b
    ld a, b
    ld l, h
    ld l, h
    ld e, a
    db $10
    sbc a
    ld [$188b], sp
    sub c
    jr jr_00e_5b75

    ld [$18bd], sp
    ld e, d
    nop
    db $10
    ld b, d
    ld b, d
    nop
    nop
    ld h, d
    nop
    nop
    ld [hl], d
    ld [hl], d
    ld e, d

jr_00e_5b16:
    ldh a, [$ff61]
    ld e, d

jr_00e_5b19:
    ld c, [hl]
    ld c, [hl]
    ld b, [hl]
    nop
    nop
    ld a, a
    ld a, c

jr_00e_5b20:
    rst $18

jr_00e_5b21:
    jr z, jr_00e_5ac2

    ld c, b
    and c

jr_00e_5b25:
    add hl, de
    ld l, h
    ld l, h
    ld [hl], $36
    rst $38
    ld e, b
    sbc a
    jr jr_00e_5b95

jr_00e_5b2f:
    add b
    db $e4
    ld h, [hl]
    jr nc, jr_00e_5b64

    inc c
    inc c
    ld b, $06
    cp a
    add hl, de
    ld a, [hl]
    ld a, [hl]
    cp a
    add hl, sp
    jr @+$1a

    rst $08
    jr z, @-$1f

    add hl, sp
    db $ed
    add hl, de
    add $e7
    inc h
    nop

jr_00e_5b4a:
    nop
    reti


    ld [$0000], sp
    ld b, d
    nop
    nop

jr_00e_5b52:
    sbc l
    jr @+$61

    add hl, de
    dec de
    ld [$1a01], sp

jr_00e_5b5a:
    inc h

jr_00e_5b5b:
    inc h
    rrca
    jr jr_00e_5b70

    jr c, jr_00e_5bb0

    ld [$f9f0], sp

jr_00e_5b64:
    ld a, [hl]
    ld a, [hl]
    ld b, $06
    dec c
    ld a, [de]
    ld c, a
    add hl, de
    ld c, a
    ld c, d
    add a
    add hl, bc

jr_00e_5b70:
    ld c, a
    ld a, [bc]
    ld c, $0e
    ld a, c

jr_00e_5b75:
    ld [$187f], sp
    dec d
    ld a, [bc]
    adc c
    jr jr_00e_5b84

    ld a, [bc]
    ld c, c
    nop
    ld a, l
    ld a, [bc]
    ld b, d
    ld b, d

jr_00e_5b84:
    ld h, c
    jr @+$26

    inc h
    rrca
    add hl, bc
    ld bc, $0301
    ld [bc], a
    rlca
    inc b
    ld c, $09
    inc e
    ld b, b
    nop

jr_00e_5b95:
    inc de
    jr c, jr_00e_5bbf

    ld a, a
    ld b, b
    ld a, a
    nop
    ld [$3840], sp
    daa
    inc e
    inc de
    ld c, $09
    rlca
    inc b
    nop
    inc b

jr_00e_5ba8:
    inc bc
    ld [bc], a
    ld bc, $5f01
    ld [hl], b
    ld e, a
    ld [hl], a

jr_00e_5bb0:
    ld e, a
    halt
    ld bc, $ff38
    nop
    rst $38
    pop bc
    rst $38
    jr nz, jr_00e_5b5b

    ld h, e
    rst $38
    ld h, d
    rst $38

jr_00e_5bbf:
    ld h, [hl]
    ld bc, $0020
    rst $38
    add h
    rst $38
    call nz, Call_00e_46ff
    rrca
    nop
    ld h, a
    ld bc, $2a00
    xor b
    ld h, l
    rra
    nop
    ld h, $01
    ld b, b
    and a
    cpl
    nop
    inc hl
    rst $38
    ld hl, $41ff
    ld bc, $8100
    ld bc, $0100
    ccf
    nop
    xor d
    ld bc, $31c4
    nop
    add [hl]
    ld bc, $8700
    ld bc, $8500
    rra
    db $10
    ld sp, $a638
    ld a, [$fa0e]
    adc $fa
    ld l, [hl]
    dec c
    inc d
    ld bc, $0e10
    ld bc, $7d08
    ld e, b
    ld e, a
    ld [hl], b
    rst $38
    add $ff
    rst $00
    inc bc
    nop
    and $7d
    jr nc, jr_00e_5c77

jr_00e_5c12:
    rst $38
    db $e4
    call nc, $ffae
    ld h, h
    ld bc, $0030
    ld [hl], c
    nop
    and $1d
    jr nz, jr_00e_5ba8

    ld [$7100], sp
    nop
    ld [hl], a
    ld [$087f], sp
    ld hl, $0089
    nop
    ld [hl], c
    nop
    ld [$8446], a
    ld bc, $c430
    call $a600
    cpl
    ld b, b
    rra
    nop
    ld a, a
    nop
    xor $01
    nop
    add c
    jr jr_00e_5c12

    ld a, [$af0e]
    dec sp
    rra
    and b
    inc bc
    rra
    jr nz, jr_00e_5c8d

    ld c, a
    ld a, a
    cp a
    dec sp
    rst $38
    ld a, [bc]
    ld bc, $0003
    ret nc

    inc sp
    ld hl, sp-$08
    inc b
    db $fc
    ldh a, [c]
    cp $40
    ldh [rVBK], a
    ld a, a
    jr nz, jr_00e_5ca4

    rra
    rra
    dec h
    cp b
    ldh a, [c]
    cp $04
    db $fc
    ld hl, sp-$08
    dec b
    ld l, h
    nop
    ld hl, sp+$00
    ld hl, sp-$41
    ld a, b

jr_00e_5c77:
    nop
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$03
    ret c

    ld [hl-], a
    ld bc, $0180
    ld d, b
    rst $38
    db $fd
    inc bc
    ld bc, $1d48
    ld c, b

jr_00e_5c8d:
    inc e
    nop
    dec e
    ld d, b
    ld bc, $6001
    ld l, a
    ld bc, $0008
    nop
    ld [$0814], sp
    pop bc
    ld a, $14
    ld [$0800], sp
    dec bc
    nop

jr_00e_5ca4:
    add l
    ld bc, $2881
    and d
    rst $38
    cp l
    jp $1801


    add c
    adc a
    add hl, bc
    rst $38
    rst $38
    inc a
    sbc e
    ld [bc], a
    ld h, b

jr_00e_5cb7:
    rst $38
    ld l, [hl]
    and c
    ld [bc], a
    inc a
    sbc [hl]
    ld bc, $7571
    rrca
    jr jr_00e_5d29

    rst $38
    ld a, [hl]
    xor l
    ld a, [de]
    or [hl]
    ld bc, $180d
    ld e, d
    ld bc, $4200
    rra
    db $10
    ld a, [hl]
    dec l
    nop
    inc bc
    ld [$0805], sp
    nop
    or a
    ld l, $df
    ld [bc], a
    cpl
    jr @-$1f

    ld a, [bc]
    inc a
    db $e4
    ld de, $1ae9
    inc h
    ld d, a
    nop
    jr @-$0a

    ld de, $402f
    inc b
    ld [de], a
    ld a, h
    dec bc
    inc de
    ld a, h
    rst $38
    jr jr_00e_5cb7

    ld l, h
    rst $38
    ld h, [hl]
    ld a, $00
    rst $38
    ld hl, sp-$7f
    ei
    add l
    ei
    add l
    di
    adc l
    jp $11bd


    inc bc
    nop
    ld [$8f99], sp
    ret nz

    nop
    rst $38
    and l
    ld bc, $0f00
    jr nz, @-$01

jr_00e_5d16:
    add e
    ld bc, $1e28
    jr jr_00e_5d53

    inc de
    inc bc
    jr z, jr_00e_5d4f

    db $10
    jp $dbbd


    ld bc, $8700
    rst $38
    ccf

jr_00e_5d29:
    jr z, @+$01

    ld e, b
    cpl
    jr jr_00e_5d16

    sbc c
    rst $20
    sbc c
    cpl
    jr nz, @-$2d

    ld [$4003], sp
    or a
    ld [bc], a
    dec c
    ld d, b
    ret


    ld [de], a
    dec c
    ld d, b

jr_00e_5d40:
    ld de, $bf28
    xor c
    jp $8e49


    ld l, b
    inc b
    ld e, b
    nop
    nop
    rlca
    rlca
    ld a, l

jr_00e_5d4f:
    ld c, $05
    jr jr_00e_5d40

jr_00e_5d53:
    ld c, $c3
    jp $0ee1


    rst $00
    rst $00
    rrca
    jr z, @-$38

    ld [bc], a
    sbc c
    add $f1
    ld c, $e6
    and $66
    ld h, [hl]
    ld h, e
    ld h, e
    dec c
    rrca
    ld h, e
    ld h, e
    add hl, bc
    ld [$0e3f], sp
    jp Jump_000_1dc3


    rrca
    ld b, b
    ldh a, [c]
    rst $00
    rst $00
    ld h, [hl]
    ld h, [hl]
    rlca
    rlca
    dec h

jr_00e_5d7d:
    ld [$c7c7], sp
    dec l
    rrca
    ldh [$ffe0], a
    inc bc
    jr @+$07

    jr z, jr_00e_5d89

jr_00e_5d89:
    ld hl, sp+$00
    ld hl, sp+$0f
    add e
    nop

jr_00e_5d8f:
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    nop
    add c
    jp Jump_00e_5801


    jr nc, jr_00e_5dd8

    inc bc
    inc bc
    inc b
    rlca
    dec b
    ld b, c
    ld de, $1c03
    ld l, a
    ld b, h
    ld c, a
    ld b, d
    ret nz

    ret nz

    ld h, b
    and b
    ld h, b
    and b
    dec b
    ld b, $01
    ld e, b
    inc de
    ld [$9803], sp
    ld a, a
    cp a
    ld b, b
    and b
    add c
    cp a
    ld a, a
    add b
    inc b
    rlca

Jump_00e_5dc3:
    rst $10
    dec b
    inc bc
    sub b
    ld d, e
    ld d, [hl]
    ld d, b
    ld h, b
    and b

Call_00e_5dcc:
    ldh [rNR41], a
    ret nz

    ret nz

    push hl
    ld e, h
    inc bc
    inc d
    cp h
    ld c, e
    cp [hl]
    dec bc

jr_00e_5dd8:
    add e
    jp $c784


    adc c
    rst $08
    adc d
    adc $01
    ld [$d2ff], sp
    dec b
    pop bc
    jp Jump_00e_6021


    ld h, b
    db $e3
    sub c
    di
    ld d, c
    ld [hl], e
    ld bc, $1508
    jr jr_00e_5d7d

    rst $08
    add h
    rst $00
    add e
    jp Jump_000_0bbf


Call_00e_5dfb:
    dec d
    jr jr_00e_5d8f

    ld h, b
    inc hl
    di
    ld hl, $c1e3
    jp Jump_000_0bbf


    cp $0b
    adc [hl]
    add hl, sp

jr_00e_5e0b:
    db $10
    ccf
    jr c, @-$1d

    db $e3
    and c
    ld bc, $8b30
    rst $08
    ret nz

    ld b, b
    adc b
    rst $08

jr_00e_5e19:
    adc a
    rst $08
    add b
    ret nz

    ld bc, $5f10
    dec b
    cp c
    ei
    add hl, bc
    ei
    cp c
    ei
    rra
    ld [$d6e1], sp
    ld a, [$3fe3]
    jr z, jr_00e_5eaf

    ld [$7f8b], sp
    nop
    adc e
    ld h, l
    nop
    ld a, a
    jr z, jr_00e_5e0b

    ld a, a
    nop
    pop de
    ld h, l
    nop
    rla
    ld [$1819], sp

jr_00e_5e43:
    ld a, a
    jr jr_00e_5e5d

    ld [$4003], sp
    add hl, de
    jr jr_00e_5ecb

    jr c, @-$72

    call z, $dc94
    and l
    db $fd
    or l
    db $fd
    sub l
    db $dd
    sub h
    call c, Call_000_08bf
    ld [hl], c
    nop

jr_00e_5e5d:
    nop
    ld [hl], e
    adc c
    ei
    ld [hl], l
    rst $38
    ld d, l
    rst $18
    sub l
    sbc a
    add hl, hl
    dec sp
    sub h
    call c, $dc94
    sub l
    ld [de], a
    ret nz

    db $dd
    ld bc, $9d08
    db $dd
    cp a
    jr jr_00e_5e19

    db $e3
    ld b, c
    jp $ff7d


    dec b
    rst $38
    db $fd
    cp h
    ld b, $3f
    ld l, b
    inc b
    ld h, [hl]
    sub l
    db $dd
    ccf
    jr c, @+$4f

    rst $08
    ld [hl], c
    di
    add hl, bc
    ei
    dec sp
    jr jr_00e_5eec

    ld [$dc9c], sp
    cp a
    inc c
    ld d, a
    ld [$8055], sp
    nop
    rst $18
    ld [hl], l
    rst $38
    adc c
    ei
    ld [hl], c
    ld [hl], e
    rst $38
    jr z, jr_00e_5e43

    call c, $fea2
    db $dd
    rst $38
    push de
    rst $30
    inc b

jr_00e_5eaf:
    ld [$e7e5], sp
    ccf
    add hl, de
    add hl, sp
    dec sp
    ld b, l
    ld a, a
    cp e
    rst $38
    xor e
    rst $28
    ld bc, $9408
    call c, $f8a8
    ld e, b
    ld h, b
    ret nc

    ldh a, [$ffdf]
    ld h, h
    rlca
    jr z, @+$0f

jr_00e_5ecb:
    rst $38
    dec d
    jr nz, @-$43

    rst $38
    ld b, l
    ld a, a
    add hl, sp
    dec sp
    rst $38
    inc c
    and l
    ld hl, $0060
    nop
    ld d, b
    ld [hl], b
    ld l, b
    ld e, b
    ld [hl], h
    ld c, h
    ld a, d
    ld b, [hl]
    ld a, d
    ld b, [hl]
    ld [hl], h
    ld c, h
    ld l, b
    ld e, b
    ld d, b
    ld [hl], b
    inc b

jr_00e_5eec:
    jr jr_00e_5f4e

    ld h, b
    ld l, d
    inc e
    ld e, [hl]
    ld h, d
    ld l, $32
    ld d, $1a
    ld a, [bc]
    ld c, $7b
    dec de
    ld a, [hl]
    inc l
    ld b, $06
    ld a, [bc]
    add b
    rst $38
    ld c, $16
    ld a, [de]
    ld l, $32
    ld e, [hl]
    ld h, d
    sub c
    ld a, [$f800]
    nop
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp-$01
    daa
    nop
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$7b
    inc l
    ld a, a
    add b
    inc e
    ld e, a
    cp $01
    inc de
    db $10
    ld de, $4300
    ld d, a
    cp $01
    ld d, e
    and a
    rrca
    ld b, $09
    ld b, $09
    nop
    rrca
    ld h, b
    scf
    ldh a, [$ff60]

jr_00e_5f4e:
    sub b
    jr nc, jr_00e_5f71

    ld h, b
    sub b
    nop
    ldh a, [rNR22]
    or b
    adc c
    ld l, a

jr_00e_5f59:
    ccf
    add hl, de
    ld h, $19
    ld h, $00
    ccf
    and b
    scf
    db $fc
    sbc b
    nop
    db $10
    ld h, h
    sbc b
    ld h, h
    nop
    db $fc
    nop
    inc bc
    ld bc, $0102
    ld [bc], a

jr_00e_5f71:
    nop
    ld hl, $c03d
    add b
    ld b, b
    jr c, jr_00e_5f59

    add b
    ld b, b
    nop
    ld de, $3f45
    ldh [$ff31], a
    ld l, a
    inc a
    jr jr_00e_5fa9

    jr @+$26

    nop
    inc a
    ccf
    ld hl, sp+$7f
    jr nz, @+$31

    xor b
    ld a, a
    nop
    ccf
    add sp, -$59
    jr z, @-$3f

    ld l, b
    sub a
    xor b
    daa
    xor b
    ld d, a
    xor b
    jp nz, Jump_000_01a1

    ld b, b
    inc b
    ld [bc], a
    ld b, b
    nop
    nop
    add b
    ccf
    ccf

jr_00e_5fa9:
    ccf
    jr nz, @+$32

    cpl
    jr nc, jr_00e_5fde

    inc sp
    cpl
    ld [hl-], a
    ld l, $1f
    ld [$1cff], sp
    nop
    rst $38
    rst $38
    inc b
    nop
    ld b, $18
    cpl
    ld [$fcfc], sp
    db $fc
    inc b
    inc c
    db $f4
    inc c
    db $f4
    call z, $4cf4
    ld c, b
    inc b
    ld [hl], h
    ld [hl-], a
    ld l, $01
    ld e, b
    ld c, h
    ld [hl], h
    ld bc, $3258
    ld l, $33
    ld c, c
    nop
    jr nc, jr_00e_600c

    ccf

jr_00e_5fde:
    jr nz, @+$41

    ld a, $02
    ccf
    ld l, e
    jr jr_00e_6032

    nop
    ld c, e
    ld [$0807], sp
    ld a, h
    nop
    ld c, h
    ld [hl], h
    call z, Call_000_0049
    inc c
    db $f4
    db $fc
    inc b
    db $fc
    db $fc
    ld bc, $8b02
    ld [$fefe], sp
    cp $82
    cp $ee
    jr c, jr_00e_602c

    ld bc, $fc28
    db $fc
    cp $82
    rst $38
    cp c

jr_00e_600c:
    ld b, b
    ld [$a5e7], sp
    rst $20
    and l

jr_00e_6012:
    rst $38
    cp l
    add hl, bc
    ld [$7777], sp
    ld [hl], a

jr_00e_6019:
    ld d, l
    ld bc, $7f18
    ld c, c
    ld a, $22
    nop

Jump_00e_6021:
    inc b
    inc e
    inc d
    inc a
    inc a
    inc a
    inc h
    ld a, [hl]
    ld e, d
    ld a, [hl]
    ld e, d

jr_00e_602c:
    ld hl, $ff18
    add c
    ld e, $1e

jr_00e_6032:
    ccf
    nop
    nop
    ld hl, $4c7f
    ld [hl], e
    ld d, d
    ld [hl], e
    ld d, e
    ld [hl], b
    ld d, b
    ld [hl], b
    ld d, b
    ld [hl], a
    ld d, a
    rrca
    rrca

jr_00e_6044:
    rrca
    nop
    nop
    add hl, bc
    sbc a
    sub [hl]
    sbc a
    sub [hl]
    cp c
    xor c
    add hl, sp
    add hl, hl
    ccf
    cpl
    cp a
    and b
    dec e
    dec e
    dec e
    add b
    nop
    dec d
    sbc l
    sub l
    sbc l
    sub l
    db $dd
    ld d, l
    ld bc, $ce18
    adc $ce
    ld c, d
    adc $4a
    xor $2a
    nop
    db $10
    xor $2a
    cp $1a
    cp $5a
    cp $4a
    ld a, $3e
    ld a, [hl]
    ld b, d
    ld l, a
    db $10
    push hl
    rlca
    dec b
    or b
    ld de, $0a0e
    inc e
    inc d
    adc c
    jr c, jr_00e_6019

    db $10
    jr c, jr_00e_6012

    ld [$4003], sp
    rst $20
    inc e
    inc d
    ld bc, $1c50
    rst $38
    cp l

jr_00e_6094:
    ld h, c
    nop
    rra
    ld e, b
    ld [hl], a
    ld d, h
    ld [hl], a
    ld d, [hl]
    adc l
    nop
    ld bc, $7f00
    ld c, h
    ccf
    ld hl, $1e1e
    cp a
    xor a
    cp c
    jp nz, $a900

    ld bc, $3928
    add hl, hl
    add hl, sp
    add hl, sp
    add a
    jr z, jr_00e_6044

    jr nz, jr_00e_6094

    cp $62
    cp $62
    sbc $52
    sbc $16
    ld [bc], a
    ld d, d
    sub l
    ld [$0099], sp
    adc $77
    jr z, jr_00e_60c9

jr_00e_60c9:
    nop
    jr c, jr_00e_6104

    ld a, a
    ld [$0707], sp
    rrca
    ld [$101f], sp
    db $10
    ld l, b
    rra
    ld de, $121e
    ld bc, $c018
    ret nz

    ldh [rNR41], a
    ldh a, [rNR10]
    ld bc, $9000
    ld bc, $1718
    jr z, @+$21

    add b
    ld bc, $1f11
    db $10
    rrca
    ld [$0707], sp
    rla
    jr z, @+$25

    ld [$20e0], sp
    ret nz

    ret nz

Call_00e_60fb:
    inc bc
    inc bc
    rlca
    add b
    ld [hl], b
    inc b
    rrca
    ld a, [bc]
    rrca

jr_00e_6104:
    ld c, $03
    ld [bc], a
    ld bc, $e018
    ldh [$ffe0], a
    jr nz, jr_00e_610f

    ld c, b

jr_00e_610f:
    rla
    jr z, jr_00e_6131

    jr nz, jr_00e_6117

    ld l, c
    nop
    dec e

jr_00e_6117:
    ld e, b
    ldh [$ffe0], a
    ld a, a
    jr nz, @+$15

    db $eb
    ld [$0a3b], sp
    ldh [$ffe0], a
    ldh a, [rNR10]
    ld hl, sp+$08
    ld hl, sp-$78
    ld a, b
    ld [bc], a
    ld de, HeaderROMSize
    ld [$90f0], sp

jr_00e_6131:
    ld bc, $0301
    ld [bc], a
    ld h, c
    nop
    add hl, bc
    rra
    inc de
    and l
    nop
    db $10
    rra
    rra
    ld bc, $7351
    nop
    ld b, b
    add b
    add b
    nop
    nop
    ld hl, sp-$08
    dec h
    nop
    ld [$f8f8], sp
    cp a
    jr nz, @+$19

    dec a
    ld [$1807], sp
    ldh [rTAC], a
    rlca
    inc b
    cp a
    ld d, b
    and c
    nop
    rlca

jr_00e_615f:
    rlca
    nop
    nop
    inc e
    inc e
    inc e

jr_00e_6165:
    inc d
    ccf
    ld [$10bf], sp

jr_00e_616a:
    reti


    jr z, jr_00e_6184

    ld c, b
    cp a
    jr nz, jr_00e_61d0

    ld [$0061], sp
    dec b
    sbc l
    add hl, bc
    ld c, $0a
    ld e, $12
    ldh a, [$fff0]
    db $fd
    ld c, b
    ldh a, [$ff90]
    adc a
    add hl, bc
    rra

jr_00e_6184:
    ld c, [hl]
    pop de
    rla
    ld a, e
    jr jr_00e_6165

    ld a, [bc]
    rla
    add hl, bc
    ld hl, sp-$68
    ld a, e
    db $10
    sbc b
    inc hl
    ld bc, $1ff0
    rra
    sub a
    db $10
    rla
    dec h
    jr z, jr_00e_61dc

jr_00e_619d:
    jr nz, jr_00e_6217

    push de
    ldh a, [rP1]
    nop
    ld c, c
    add hl, de
    dec [hl]
    ld [$c87f], sp
    ccf
    ld de, $0108
    nop
    add hl, bc
    ld bc, $0810
    rst $38
    jr nz, jr_00e_619d

    and c
    add hl, bc
    dec bc
    add hl, bc
    ld b, e
    ld l, b
    dec de
    jr nc, @+$25

    nop
    rlca
    inc b
    inc bc
    inc bc
    dec de
    add hl, hl
    ld hl, sp-$78
    ld hl, sp+$08
    add c
    ld bc, $7fe0
    jr nz, jr_00e_616a

    nop

jr_00e_61d0:
    ld bc, $fe9f
    nop
    db $10
    cp a
    jr c, jr_00e_615f

    add hl, de
    rst $18
    jr jr_00e_625b

jr_00e_61dc:
    ld c, c
    ret nz

    ld b, b
    ld bc, $c040
    rst $38
    ld c, c
    ld a, a
    ld [$49ff], sp
    ret


    add hl, bc
    add hl, de
    ld a, [hl+]
    rst $38
    ld sp, $613f
    rst $38
    nop
    ccf
    ld c, d
    inc hl
    ld a, [bc]
    ld a, a
    ld e, c
    cp a
    ld [$1981], sp
    ld b, e
    add hl, bc
    ld a, a
    adc c
    cpl
    ld l, h
    ld bc, $1000
    ld [hl+], a
    ld h, b
    nop
    nop
    ld h, b
    inc a
    inc a
    ld h, [hl]
    nop
    jr nc, jr_00e_624c

    inc a
    nop
    nop
    jr c, jr_00e_624d

    jr jr_00e_6217

jr_00e_6217:
    jr nc, @+$11

    ld [$041c], sp
    ld [$261c], sp
    nop
    nop
    inc c
    inc c
    jr jr_00e_623d

    jr nc, jr_00e_6257

    ld a, $3e
    rrca
    jr @+$08

    ld b, $1c
    inc e
    ld b, b
    ld b, c
    ld b, $06
    ld h, $26
    inc e
    inc e
    rra
    ld [$002c], sp
    nop
    ld c, h

jr_00e_623d:
    ld c, h
    ld a, [hl]
    ld a, [hl]
    inc c
    nop
    nop
    nop
    nop
    adc e
    nop
    ld a, $3e
    jr nc, jr_00e_627b

    inc a

jr_00e_624c:
    inc a

jr_00e_624d:
    ld b, $00
    nop
    rra
    jr z, jr_00e_6283

    nop
    nop
    inc a
    inc a

jr_00e_6257:
    ld [hl-], a
    nop
    nop
    ld sp, hl

jr_00e_625b:
    sbc h
    cpl

jr_00e_625d:
    ld [$3e3e], sp
    ld c, a
    jr @+$03

    jr @+$81

    jr z, @+$07

    jr z, jr_00e_62d8

    jr z, @+$20

    ld e, $41
    ld [$085f], sp
    sbc a
    jr jr_00e_62f1

    ld a, [hl]
    and l
    jr jr_00e_62e7

    sbc a
    nop
    nop
    ld a, h

jr_00e_627b:
    ld a, h
    xor a
    ld [$2805], sp
    cp a
    jr jr_00e_62e3

jr_00e_6283:
    nop

jr_00e_6284:
    db $10
    cp a
    jr jr_00e_62a7

    jr jr_00e_625d

    jr jr_00e_62ab

    ld [$7e7e], sp
    dec e
    ld [$2733], sp
    dec b
    jr z, @+$11

    jr z, jr_00e_6314

    ld a, h
    inc sp
    jr jr_00e_62db

    jr z, jr_00e_630c

    ld l, [hl]
    rst $38
    jr z, @+$0f

    add hl, de
    ld l, a
    jr c, jr_00e_62e2

    inc a

jr_00e_62a7:
    rrca
    ld e, c
    ld a, $3e

jr_00e_62ab:
    ld hl, $bb00
    jr z, jr_00e_631c

    ld l, h
    jr c, @+$3a

    cpl
    ld [$6c6c], sp
    ld a, b
    ld a, b
    ld [hl], b
    ld [hl], b
    ld a, b
    ld a, b
    ld l, h
    ld l, h
    ld e, a
    db $10
    sbc a
    ld [$188b], sp
    sub c
    jr jr_00e_6337

    ld [$18bd], sp
    ld e, d
    nop
    db $10
    ld b, d
    ld b, d
    nop
    nop
    ld h, d
    nop
    nop
    ld [hl], d
    ld [hl], d
    ld e, d

jr_00e_62d8:
    ldh a, [$ff61]
    ld e, d

jr_00e_62db:
    ld c, [hl]
    ld c, [hl]
    ld b, [hl]
    nop
    nop
    ld a, a
    ld a, c

jr_00e_62e2:
    rst $18

jr_00e_62e3:
    jr z, jr_00e_6284

    ld c, b
    and c

jr_00e_62e7:
    add hl, de
    ld l, h
    ld l, h
    ld [hl], $36
    rst $38
    ld e, b
    sbc a
    jr jr_00e_6357

jr_00e_62f1:
    add b
    db $e4
    ld h, [hl]
    jr nc, jr_00e_6326

    inc c
    inc c
    ld b, $06
    cp a
    add hl, de
    ld a, [hl]
    ld a, [hl]
    cp a
    add hl, sp
    jr @+$1a

    rst $08
    jr z, @-$1f

    add hl, sp
    db $ed
    add hl, de
    add $e7
    inc h
    nop

jr_00e_630c:
    nop
    reti


    ld [$0000], sp
    ld b, d
    nop
    nop

jr_00e_6314:
    sbc l
    jr jr_00e_6376

    add hl, de
    dec de
    ld [$1a01], sp

jr_00e_631c:
    inc h
    inc h
    rrca

jr_00e_631f:
    jr jr_00e_6332

    jr c, jr_00e_6372

    ld [$f9f0], sp

jr_00e_6326:
    ld a, [hl]
    ld a, [hl]
    ld b, $06
    dec c
    ld a, [de]
    ld c, a
    add hl, de
    ld c, a
    ld c, d
    add a
    add hl, bc

jr_00e_6332:
    ld c, a
    ld a, [bc]
    ld c, $0e
    ld a, c

jr_00e_6337:
    ld [$187f], sp
    dec d
    ld a, [bc]
    adc c
    jr jr_00e_6346

    ld a, [bc]
    ret


    ccf
    ld a, l
    ld a, [bc]
    ld b, d
    ld b, d

jr_00e_6346:
    ld h, c
    jr @+$26

    inc h
    rrca
    add hl, bc
    or c
    ld e, c
    ld sp, hl
    jr c, @-$5f

    add hl, hl
    pop bc
    ld e, b
    dec bc
    ld e, b
    xor a

jr_00e_6357:
    ld a, [bc]
    sub c
    jr @+$08

    ld b, $00
    adc b
    ld c, $06
    ld c, $0c
    inc e
    inc c
    inc e
    jr jr_00e_639f

    jr jr_00e_63a1

    ld [hl], b
    ld [bc], a
    ld [hl], b
    jr nc, @+$72

    rst $28
    ld hl, $83ff

jr_00e_6372:
    sub c
    ld e, c
    dec bc
    ld e, b

jr_00e_6376:
    cp a
    jr @+$23

    ld a, [de]
    ld b, e
    ld a, [de]
    ld a, l
    ld e, b
    rra
    jr z, jr_00e_63d2

Jump_00e_6381:
    ld c, c
    dec bc
    ld e, b
    cp a
    adc b
    ld l, h
    ld l, h
    ld l, [hl]
    ld l, h
    ld l, [hl]
    ld d, b
    ld a, [de]
    rst $38
    nop
    xor a
    ld [bc], a
    rlca
    add hl, bc
    ld h, e
    inc bc
    ld c, e
    ld bc, $2b67
    sra d
    rra
    jr z, jr_00e_631f

    dec hl

jr_00e_639f:
    ld [hl], b
    ld h, b

jr_00e_63a1:
    ld [hl], b
    ld [hl], b
    jr c, jr_00e_63dd

    inc e
    inc e
    ld hl, sp+$03
    ld c, $0e
    ld c, $cb
    ld bc, $38df
    and c
    dec hl
    ld e, c
    ld a, [hl+]
    ld e, e
    nop
    ld e, h
    jr @+$01

    jr nz, jr_00e_63c0

    dec b
    ld a, l
    ld a, l
    nop
    nop

jr_00e_63c0:
    ret nz

    ld bc, $fefe
    ld [$1008], sp
    db $10
    ld sp, $1519
    add hl, de
    jp hl


    dec hl
    jr nz, jr_00e_63f0

    ld a, $3e

jr_00e_63d2:
    ld [hl+], a
    ld [hl+], a

jr_00e_63d4:
    ld d, h
    nop
    nop
    ld d, h
    inc c
    inc c
    ld [$3008], sp

jr_00e_63dd:
    jr nc, jr_00e_63e7

    ld [$7f7f], sp
    db $10
    db $10
    inc hl
    inc hl
    ld a, h

jr_00e_63e7:
    nop
    nop
    ld a, h
    ld [de], a
    ld [de], a
    jr nz, jr_00e_640e

    rra
    rra

jr_00e_63f0:
    nop
    nop
    db $10
    db $10
    ld e, $1e
    ld [hl+], a
    ld [hl+], a
    ld b, d
    ret z

    ld bc, $0442
    inc b
    rra
    ld [$0000], sp
    dec de
    ld a, [bc]
    rra
    ld a, [bc]
    rrca
    jr z, jr_00e_6487

    ld a, [hl]
    ld [bc], a
    ld [bc], a
    inc d
    inc d

jr_00e_640e:
    jr jr_00e_63d4

    nop
    jr jr_00e_6423

    nop
    nop
    jr nz, jr_00e_6437

    ld b, b
    nop
    jr nz, @+$39

    ld a, [bc]
    ld b, h
    ld b, h
    jr c, @+$3a

    inc b
    inc b

jr_00e_6422:
    ld a, a

jr_00e_6423:
    ld a, a
    add c
    ld c, b
    inc bc
    jr @+$3e

    inc a
    ld b, [hl]
    ld b, [hl]
    add hl, sp
    add hl, sp
    rrca
    ld [$0c0c], sp
    inc d
    nop
    nop
    inc c
    inc c

jr_00e_6437:
    ld d, c
    ld [$2022], sp
    inc c
    ld [hl+], a
    ld a, c
    ld a, c
    dec h
    dec h
    ld d, e
    jr jr_00e_6488

    ld b, h
    ld c, b
    ld c, b
    pop bc
    dec bc
    ld l, c
    ld [$0808], sp
    inc d
    inc d
    rrca
    ld b, b
    ld bc, $c51a
    dec bc
    cp l
    ld [$18bf], sp
    ld a, [bc]
    ld a, [bc]
    jp z, $20ca

    jr nz, jr_00e_6422

    jp nz, Jump_000_2222

    adc a
    ld [$06f0], sp
    ld [$aff0], sp
    ld l, h
    cp a
    inc l
    ld b, b
    ld b, b
    and b
    ldh [$ffbb], a
    db $db
    cp h
    call nz, $1ccf
    rlca
    rlca
    inc e
    jr @+$42

    nop
    jr nc, @+$22

    rst $38
    rst $38
    ld [hl], b
    ld a, a
    rst $18
    inc c
    rst $38
    rst $38

jr_00e_6487:
    add b

jr_00e_6488:
    nop
    ld bc, $0300
    inc bc
    ld b, $08
    sub b
    inc b
    ld hl, sp-$08
    rst $28
    inc e
    ldh [$ffe0], a
    rst $38
    rst $38
    add [hl]
    ld [bc], a
    ld bc, $1b01
    ld [$80ff], sp
    ld bc, $7850
    ld h, c
    rst $38
    db $fd
    inc bc
    ld bc, $1d48
    ld c, b
    inc e
    nop
    dec e
    ld d, b
    ld bc, $003c
    inc a
    inc a
    ld [bc], a
    ld [bc], a
    ld b, e
    dec c
    dec bc
    add hl, bc
    jr nz, jr_00e_64bd

jr_00e_64bd:
    ld bc, $1e20
    ld e, $1c
    inc e
    ld a, [hl+]
    ld a, [hl+]
    ld c, c
    nop
    db $10
    add hl, hl
    add hl, hl
    ld [de], a
    ld [de], a
    inc b
    inc b
    stop
    ld bc, $7e10
    ld a, [hl]
    db $10
    db $10
    ld a, $3e
    ld d, l
    nop
    nop
    ld c, c
    ld c, c
    ld [hl-], a
    ld [hl-], a
    ld b, b
    ld b, b
    jr nz, jr_00e_6503

    ld d, b
    jr nz, @+$28

    ld h, $18
    jr jr_00e_6523

    add hl, de
    ccf
    ccf
    ld de, $7d11
    ld a, l
    rra
    ld [$0051], sp
    db $10
    ld h, $60
    ld b, d
    ld h, $42
    ld b, d
    ld e, a
    ld e, a
    add e
    dec bc
    inc bc
    jr jr_00e_6547

jr_00e_6503:
    ld b, h
    pop hl
    inc c
    jr nz, jr_00e_6528

    cp $fe
    ld e, l
    ld [$1022], sp
    ld c, b
    ld [hl+], a
    inc e
    inc e
    dec h
    nop
    nop
    jr nz, jr_00e_6537

    jr nc, jr_00e_6549

    inc l
    inc l
    ld l, a
    ld [$2020], sp
    cp a
    dec a
    add b
    nop

jr_00e_6523:
    ld bc, $4080
    ld b, b
    ret nz

jr_00e_6528:
    ret nz

    rlca
    rlca
    add hl, de
    ld e, e
    nop
    jr jr_00e_6540

    inc c
    inc c
    inc bc
    ld [bc], a
    dec c
    nop
    nop

jr_00e_6537:
    dec c
    ld c, $0a
    rst $18
    ld h, e
    rst $28
    jr nc, jr_00e_65be

jr_00e_653f:
    db $10

jr_00e_6540:
    ld a, a
    jr c, jr_00e_653f

    ld b, e
    ld hl, sp+$47
    di

jr_00e_6547:
    nop
    nop

jr_00e_6549:
    adc a
    push hl
    sbc l

jr_00e_654c:
    ld c, $0f
    add c
    add c
    ldh [$ff60], a
    jr jr_00e_654c

    ld a, a
    rst $38
    rst $38
    adc l
    rst $38
    ld [$0380], sp
    cp a
    dec e
    rst $38
    nop
    add c
    ei
    add l
    ei
    add l
    di
    adc l
    jp $ffbd


    add c
    dec c
    ld bc, $3e61
    rrca
    nop
    rst $38
    cp l
    rst $38
    and l
    ld bc, $0f00
    jr nz, @-$01

    add e
    ld bc, $1e28
    jr jr_00e_65a5

    nop
    ld bc, $2f38
    db $10
    jp Jump_00e_6ebd


    add sp, -$25
    ld bc, $3f00
    jr z, jr_00e_65cd

    nop
    jp $1801


    cpl
    jr c, @-$17

    sbc c
    rst $20
    sbc c
    cpl
    jr nz, jr_00e_659c

jr_00e_659c:
    ld bc, $9d58
    ld bc, $500d
    ccf
    sub b
    xor a

jr_00e_65a5:
    ld de, $500d
    ld de, $f928
    sbc c
    adc [hl]
    ld a, b
    inc b
    ld e, b
    dec b
    dec b
    dec h
    dec h
    ld a, b
    ld a, b
    dec [hl]
    add hl, bc
    dec h
    dec h
    ld l, a
    ld a, [de]
    ld b, b
    dec b

jr_00e_65be:
    ld [hl+], a
    ld [hl+], a
    inc h
    inc h
    ld a, [hl]
    ld a, [hl]
    dec e
    dec bc
    db $10
    dec h
    ld bc, $0005
    nop
    db $10

jr_00e_65cd:
    db $10
    jr z, jr_00e_65f8

    ld b, h
    inc a
    nop
    ld b, h
    ld [bc], a
    rrca
    ld [de], a
    dec b
    cpl
    ld c, e
    inc e
    nop
    ld hl, sp+$30
    jr nc, jr_00e_6618

    jr z, jr_00e_661e

    inc h
    ld a, $22
    ld a, $22
    stop
    inc a
    inc h
    jr c, jr_00e_6615

    ld a, c
    dec b
    db $fc
    add e
    rst $38
    ld h, b
    ld a, a
    jr jr_00e_6615

    ld b, $07

jr_00e_65f8:
    pop hl
    pop hl
    jr nz, jr_00e_65fc

jr_00e_65fc:
    ld hl, sp+$18
    cp $06
    ld bc, $0279
    pop bc
    ret nz

    inc sp
    ldh [$ff1f], a
    ld hl, sp-$79
    cp $67
    ld a, a
    ld b, b
    nop
    ccf
    rra
    db $e3
    inc hl
    db $f4
    inc d

jr_00e_6615:
    ld bc, $fb08

jr_00e_6618:
    dec de
    ld sp, hl
    add hl, hl
    ei
    dec hl
    db $fc

jr_00e_661e:
    xor h
    ld a, [bc]
    ld bc, $0000
    ld d, b
    dec bc
    dec bc
    xor $9e
    pop de
    or c
    ldh [$ffa0], a
    ld b, e
    ld b, e
    ld b, [hl]
    ld b, [hl]
    inc b
    inc b
    inc c
    nop
    nop
    inc c
    sbc h
    sub h
    sbc l
    xor a
    add l
    sub a
    adc a
    sbc l
    sbc a
    adc l
    rla
    inc d
    call z, $680c
    nop
    nop
    ld [$0000], sp
    pop af
    rrca
    pop hl
    rra
    rst $20
    ld e, $cf
    add hl, sp
    ret c

    or b
    ret nc

    or b
    ret nc

    ld bc, $d400
    inc b
    adc a
    adc a
    rst $20
    jp $31f1


    ld hl, sp-$68
    db $fc
    ld c, h
    ld a, d
    ld l, $39
    cpl
    jr c, jr_00e_66a9

    ld [hl], b
    rrca
    or c
    ld hl, sp+$03
    ret c

    cp e
    add hl, hl
    jp $ef29


    jr c, jr_00e_667b

    inc bc
    inc b
    rlca

jr_00e_667b:
    dec b
    ld b, $79
    ld c, c
    ld [bc], a
    ld [$390f], sp
    ret nz

    add b
    inc bc
    ret nz

    ld h, b
    and b
    ld h, b
    and b
    dec b
    ld b, $01
    ld e, b
    inc de
    ld [$9803], sp
    ld a, a
    cp a
    ld b, b
    cp a
    ld a, a
    add b
    ret nz

    ret nz

    inc b
    rlca
    rlca
    inc b
    inc bc
    inc bc
    ret nc

    ld d, c
    ld d, [hl]
    ld d, b
    ld h, b
    and b
    ldh [rNR41], a

jr_00e_66a9:
    ret nz

    ret nz

    ld [hl], l
    ld l, b
    dec sp
    ld [hl+], a
    ld bc, $ae20
    ld [de], a
    ld a, l
    sbc [hl]
    ld l, [hl]
    or e
    ld l, a
    or b
    ld l, [hl]
    cp a
    ld l, [hl]
    or e
    ld a, l
    sbc [hl]
    xor a
    ld [de], a
    ld e, $ee
    sub d
    ret


    inc sp
    ld bc, $fd18
    ld e, $0f

jr_00e_66cb:
    jr c, jr_00e_66cb

    ccf

jr_00e_66ce:
    dec d
    ld [$0adf], sp
    xor $31
    ld bc, $fc28
    ccf
    ret nz

    ld c, b
    cp a
    ld [$c80c], sp
    ldh [rNR41], a
    sbc [hl]
    ld a, [de]
    ld c, b
    ld a, [hl-]
    ld bc, $02ff
    rst $38
    inc b
    rst $38
    ld hl, sp+$01
    jr nc, jr_00e_66ce

    jr nz, jr_00e_66f1

    ld e, b

jr_00e_66f1:
    ld [hl], d
    ld l, d
    inc bc
    and b
    add hl, hl
    jr c, jr_00e_672b

    jr jr_00e_66fa

jr_00e_66fa:
    nop
    jr c, jr_00e_6735

    ld l, h
    ld l, h
    ld b, h
    ld b, h
    add $c6
    adc $00
    nop
    sub $00
    db $10

jr_00e_6709:
    ld [bc], a
    add c
    and $00
    nop
    ld b, h
    ld b, h
    ld l, h
    ld l, h
    jr c, @+$3a

    ld c, l
    ld a, [bc]
    ld [$1808], sp
    jr @+$7a

    ld a, b
    ld d, e
    adc [hl]
    dec sp
    ldh a, [c]
    adc a
    ld e, $3f
    ld [$00c6], sp
    nop
    push de
    ld c, $69
    cpl

jr_00e_672b:
    ld h, b
    ld h, b
    ret nz

    nop
    nop
    cp $fe
    rra
    ld c, b
    ld d, a

jr_00e_6735:
    rrca
    dec l
    ld c, $fd
    ld c, $57
    add c
    cpl
    ld [$285f], sp
    ld [hl], c
    rrca
    inc e
    nop
    db $10
    inc l
    nop
    jr nz, jr_00e_6795

jr_00e_6749:
    nop
    nop
    call z, $fecc
    cp $0c
    inc c
    call Call_000_040a
    ld a, [hl]
    cp $fe
    ld c, e
    ld [$c0c0], sp
    ld hl, sp-$08
    db $ec
    db $ec
    ld h, l
    jr jr_00e_67a1

    ld e, b
    ld a, a
    jr jr_00e_6787

    jr c, @+$03

    jr z, @-$3f

jr_00e_676a:
    jr z, jr_00e_676a

    cp $61
    cp $7d
    jr jr_00e_6749

    rra
    rrca
    ld a, a
    cp a
    jr z, jr_00e_6709

    jr @+$0d

    jr z, @+$61

    ld l, b
    ld d, a
    jr z, jr_00e_67ee

    ld l, [hl]
    ld a, $3e
    pop bc
    jr jr_00e_67a5

    add hl, de

jr_00e_6787:
    rra
    add b
    nop
    rra
    ccf
    ld hl, $4e7e
    ld [hl], b

jr_00e_6790:
    ld d, b
    ld bc, $3c28
    inc a

jr_00e_6795:
    ld a, [hl]
    ld b, d
    ld a, [hl]
    ld e, d
    rst $20
    and l
    ld bc, $0100
    jr z, jr_00e_6813

    ld [hl], e

jr_00e_67a1:
    ld [hl], e
    ld d, d
    ld [hl], e
    ld d, d

jr_00e_67a5:
    ld a, e
    ld c, d
    ld a, e
    ld c, d
    ld a, a
    ld b, [hl]
    ld a, a
    ld d, [hl]
    ld a, a
    nop
    ld [bc], a
    ld d, d
    cp a
    cp a
    cp a
    and b
    cp a
    cp e
    adc [hl]
    adc d
    ld bc, $bb28
    cp e
    cp e
    xor d
    cp e
    xor d
    inc b
    nop
    dec sp
    ld a, [hl+]
    ld bc, $9d28
    sbc l
    sbc l
    sub l
    sbc l
    sub l
    db $dd
    ld d, l
    db $dd
    ld d, l
    db $fd
    dec [hl]
    db $fd
    ld l, b
    add h
    or l
    db $fd
    sub l
    sub l
    ld bc, HeaderDestinationCode
    ld c, b
    rst $38
    inc d
    cp a
    ldh [$ffa0], a
    ld bc, $fe08
    cp [hl]
    cp $82
    ld a, c
    jr c, jr_00e_682c

    nop
    ld a, a

jr_00e_67ee:
    ld c, a
    ccf
    ld hl, $1e1e
    ld a, c
    jr c, jr_00e_6874

    ld e, d
    ld a, [hl]
    ld b, d
    inc a
    inc a
    ld a, a
    ld e, b
    ld a, a
    ld h, b
    dec de
    ld e, b
    ld [hl], a
    ld d, h
    ld [hl], a
    ld d, h
    add l
    ld [$0089], sp
    ld [hl], e
    ld a, c
    jr c, jr_00e_6790

    db $10
    adc [hl]
    ld a, c
    jr c, jr_00e_6795

    db $10

jr_00e_6813:
    dec sp
    db $fd
    push bc
    ld b, b
    ld [$c5fd], sp
    cp l
    and l
    cp l
    and l
    add l
    ld [$949c], sp
    sbc h
    sbc h
    ld a, l

jr_00e_6825:
    jr c, jr_00e_6825

    ld [hl-], a
    db $fc
    add h
    db $10
    ld [bc], a

jr_00e_682c:
    ld a, b
    ld a, b
    cp $be
    ld a, e
    jr jr_00e_6813

    and b
    rst $38
    cp a
    adc a
    dec c
    jr c, jr_00e_6872

    ld a, h
    ld b, h
    cp $92
    ld b, h
    nop
    xor $aa
    ld bc, $fe78
    sub d
    ld a, h
    ld l, a
    rlca
    inc e
    inc e
    inc a
    inc h
    ld a, h
    ld d, h
    ld a, h
    ld [hl], h
    inc e
    ld b, $82
    inc d
    ld bc, $f890
    ld bc, $223e
    ld a, a

jr_00e_685c:
    ld e, l
    ld [hl], a
    ld d, l
    ld bc, $7500
    ld c, $0a
    ld c, $0a
    daa
    ld [$0410], sp
    jr c, jr_00e_6894

    jr c, jr_00e_6896

    rst $08

jr_00e_686f:
    nop
    ld e, a
    ld a, a

jr_00e_6872:
    ld b, c
    ld a, a

jr_00e_6874:
    ld a, a
    ld e, a
    db $10
    or d
    xor $aa
    adc $ca
    db $10
    inc d

jr_00e_687e:
    ld c, $0a
    ld a, $3a
    ret


    inc b
    ld [hl-], a
    ld c, $0a
    adc $ca
    ld e, a
    db $10
    or d
    ld e, a
    ld [$0e0e], sp
    ld e, $80
    ld d, d
    ld [de], a

jr_00e_6894:
    ld e, $12

jr_00e_6896:
    ld a, $2a
    ld a, $2a
    rst $28
    nop
    ld e, d
    add a
    jr @+$01

    cp e
    add hl, hl
    ld b, $fb
    ld c, l
    ld [$200e], sp
    nop

jr_00e_68a9:
    ld c, $fe
    cp $fe
    add d
    or e
    jr z, jr_00e_68a9

    cp b
    db $fc
    add h
    cp $f2
    ld c, $0a
    xor $ea
    ld a, e
    rst $38
    ccf
    jr c, jr_00e_687e

    jr nc, jr_00e_686f

    rra
    jr nz, jr_00e_692f

    nop
    cp a
    ld c, b
    ccf
    db $10
    ld a, [$2899]
    sbc l
    jr z, @+$05

    jr nc, jr_00e_6910

    jr c, @+$03

    ld bc, $00e7
    dec bc
    ld b, c
    rst $38
    jr jr_00e_685c

    ld bc, $591f
    cp $9a
    ld a, [hl]
    ld b, d
    ld a, $3a
    add c
    jr jr_00e_6906

    add hl, de
    ld hl, sp-$18
    cp $fe
    ei
    db $fd
    db $fd
    nop
    nop
    rst $38
    ld [hl], e
    ld a, a
    scf
    add hl, sp
    add hl, de
    rra
    adc [hl]
    adc [hl]
    ld a, [bc]
    ld [$0808], sp
    dec bc
    dec bc
    ld [$9938], sp
    ld [$0909], sp

jr_00e_6906:
    ld [$0b00], sp
    nop
    ld c, h
    ld e, [hl]
    ld a, a
    add b
    ld e, h
    ld e, [hl]

jr_00e_6910:
    cp $01
    ld de, $7a00
    ld d, [hl]
    cp $01
    adc d
    and [hl]
    ld b, b
    ret nz

    rrca
    ld b, $09
    ld b, $09
    nop
    ld a, a
    dec a
    ldh a, [$ff60]
    sub b
    ld h, b
    sub b
    nop

jr_00e_692a:
    ldh a, [rNR22]
    or b
    ld c, b
    ld l, [hl]

jr_00e_692f:
    add b
    nop
    ccf
    add hl, de
    ld h, $19
    ld h, $00
    ccf
    ld e, a
    ld [hl], $fc
    sbc b
    ld h, h
    sbc b
    ld h, h
    nop
    db $fc
    nop
    ld b, b
    ldh [$ff03], a
    ld bc, $0102
    ld [bc], a
    nop
    ld hl, $c03d
    add b
    ld b, b
    add b
    ld b, b
    nop
    ld de, $3f45
    ldh [$ffb0], a
    ld l, [hl]
    ret nz

    rst $38
    inc a
    jr @+$26

    jr @+$26

    nop
    db $dd
    ld a, [hl]
    ld a, a
    xor b
    cpl
    xor b
    ccf
    add sp, -$59
    jr z, jr_00e_692a

    ld l, b
    sub a
    xor b
    daa
    xor b
    ld d, a
    xor b
    adc b
    daa
    nop
    nop
    ld a, [hl]
    ld h, h
    ld e, d
    ld d, [hl]
    db $d3
    sbc $71
    ld e, a
    pop af
    rst $28
    jr c, jr_00e_69a9

    ld a, [$fe25]
    pop de
    nop
    nop
    inc b
    nop
    inc b
    ld b, $07
    rlca
    ld b, $07
    add l
    ld b, $87
    add h
    ld b, a
    push bc
    ld h, $e6
    nop
    db $10
    ld l, [hl]
    inc l
    cpl
    ld l, $03
    inc bc
    add c
    add c
    add b
    add b
    add [hl]
    add b
    ld h, [hl]
    ld c, $18

jr_00e_69a9:
    rrca
    add hl, de
    nop
    db $10
    ld c, $1b
    inc c
    sbc a
    ld [$101f], sp
    ccf
    rra
    jr nc, jr_00e_69c8

    ld h, a
    rst $28
    ld b, $b9
    rst $00
    ld e, d
    add b
    nop
    ld h, [hl]
    ld d, d
    ld l, [hl]
    inc [hl]
    inc l
    inc h
    inc a
    xor a

jr_00e_69c8:
    inc c
    or $0f
    halt
    adc a
    ld l, c
    sbc a
    dec hl
    rst $18
    nop
    nop
    cp d
    sbc $94
    db $f4
    ld h, b
    ld h, b
    nop
    nop
    db $db
    inc a
    sbc e
    ld a, h
    and l
    ld a, [hl]
    dec h
    cp $00
    nop
    ld h, a
    cp $5a
    db $db
    add c
    add c
    nop
    nop
    ld l, a
    ldh a, [$ff6e]
    pop af
    sub [hl]
    ld sp, hl
    call nc, Call_00e_60fb
    nop
    ld e, l
    ld a, e
    add hl, hl
    cpl
    ld b, $0d
    rlca

jr_00e_69fe:
    adc a
    ld l, [hl]
    inc bc
    inc bc
    inc c
    rrca
    inc de

jr_00e_6a05:
    inc e
    cpl
    jr nc, jr_00e_6a68

    ld b, b
    nop
    ld h, b

jr_00e_6a0c:
    ld a, a
    ld b, e
    cp h
    rst $00
    cp l
    scf
    dec b
    jr nc, jr_00e_6a05

    ret z

    jr c, jr_00e_6a0c

    inc c
    ld a, [$fe06]
    nop
    adc l
    jp nz, $e33d

    cp l
    ld h, e
    ld bc, $0201
    nop
    nop
    ld bc, $0000
    rlca
    jr @-$7e

    add b
    ld b, b
    nop
    nop

jr_00e_6a32:
    ld b, $00
    add b
    nop
    nop
    rlca
    jr jr_00e_69fe

    add h
    ld b, d
    jp nz, $61a1

    pop hl
    jr nz, jr_00e_6a32

    db $10
    ldh a, [rNR10]
    ld hl, sp+$18
    nop
    adc b
    ld hl, sp-$78
    xor c
    ld a, [de]
    xor h
    ld a, [bc]
    jr jr_00e_6a61

    db $10
    db $10
    ld de, $fe10
    and l
    cp $3d
    rst $00
    nop
    nop
    ld b, h
    add a
    add l
    add [hl]
    add [hl]

jr_00e_6a61:
    adc a
    adc a
    sbc a
    sub c
    cp h
    and e
    db $10

jr_00e_6a68:
    ldh a, [$ff78]
    ld hl, sp-$01
    nop
    ld [$138f], sp
    db $10
    inc de
    ld de, $1232
    db $e4
    db $e4
    add a
    add a
    sub [hl]
    ld a, [bc]
    jp $8f80


    adc a
    nop
    nop
    sub h
    sub a
    inc de
    inc de
    ld [hl+], a
    ld [hl+], a
    jp nz, Jump_00e_6fc2

    nop
    rst $38
    inc hl
    cp a
    ld a, h
    jp Jump_000_00fc


    ld bc, $fc03
    db $e3
    db $fc
    dec sp
    inc e
    rrca
    inc b
    and c
    inc bc
    inc b
    cp a
    ld b, e
    cp [hl]
    ld h, d
    cp [hl]
    ld a, d
    nop
    nop
    and [hl]
    ld h, [hl]
    and d
    ld h, d
    ldh [rNR41], a
    ld bc, $0800
    cp $ff
    nop
    nop
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp-$01
    rst $38
    nop
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp-$01
    ld a, a
    nop
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$1c
    db $10
    ccf
    nop
    ld [bc], a
    ccf
    jr nz, @+$41

    cpl
    ccf
    add hl, hl
    add hl, sp
    jr z, @+$3a

    ld bc, $0f18
    rrca
    adc b
    adc a
    ld c, e
    rst $08
    nop
    nop
    ld c, d
    adc $aa
    xor $aa
    xor $ab
    rst $28
    xor b
    rst $28
    pop bc
    pop bc
    ld [hl+], a
    db $e3
    sub d
    di
    inc b
    add b
    ld d, l
    ld [hl], a
    ld bc, $a508
    rst $20
    ld b, h
    rst $00
    db $e3
    db $e3
    ld [de], a
    di
    jp nc, Jump_000_2af3

    dec sp
    ld bc, $8008
    ld de, $fbea
    ld a, [bc]
    ei
    adc [hl]
    adc [hl]
    adc d
    ld bc, $4750
    jr z, jr_00e_6b83

    add hl, sp
    cpl
    ld e, c
    nop
    ccf
    ccf
    xor e
    ld [bc], a
    nop
    rst $28
    ld c, c
    ld [$eeaa], sp

jr_00e_6b68:
    ld c, d
    adc $4a
    adc $8a
    adc [hl]
    ld c, $0e
    ld b, l
    rst $00
    and l
    rst $20
    jp Boot


    ld [$1851], sp
    ld [hl], a
    ld [hl], a
    ld [$4bfb], a
    jr jr_00e_6bd2

jr_00e_6b81:
    jr @+$3d

jr_00e_6b83:
    dec sp
    adc d
    adc [hl]
    xor d
    xor [hl]
    jp c, Jump_00e_40fe

    inc b
    adc d
    cp $22
    cp $52
    sbc $2f
    ld [$e0e0], sp
    and b
    ld bc, $3c50
    inc a
    ld b, d
    ld a, [hl]
    ld e, d
    ld b, $02
    ld a, [hl]
    ld b, e
    jr @+$4b

    ld [$3f3f], sp
    ld b, c
    ld a, a
    sbc a
    rst $38
    inc hl
    jr @-$6e

    ldh a, [rOBP0]
    ld a, b
    rst $38
    rst $38
    ld [$8140], sp
    rst $38
    cp a
    rrca
    jr nz, @-$40

    cp $82
    cp $fc
    db $fc
    add d
    cp $b9
    rst $38
    ld [hl], e
    jr jr_00e_6b81

    xor b
    ld bc, $84fe
    db $fc
    ld c, l
    jr c, @-$3f

    add hl, hl
    nop
    rst $38

jr_00e_6bd2:
    add hl, de
    jr nz, jr_00e_6b68

    ld [$7e5a], sp
    ld b, d
    ld a, [hl]
    inc a
    inc a
    inc h
    nop
    ld c, b
    inc a

jr_00e_6be0:
    ld [de], a
    ld e, $0a
    ld c, $05
    rlca
    dec b
    rlca
    ld sp, hl
    rst $38
    dec a
    ld [$febe], sp
    cpl
    ld e, b
    or h
    ld b, $11
    db $fc
    rst $08
    jr @-$39

    jr jr_00e_6be0

    rst $20
    db $e3
    db $e3
    and d
    ld bc, $bb50
    cp e
    xor d
    ld bc, $9d50
    sbc l
    sub l
    ld bc, $0110
    nop
    ld d, l
    db $dd
    ld d, l
    db $dd
    dec [hl]
    db $fd
    or l
    db $fd
    sub l
    db $fd
    adc $07
    ld bc, $ce4a
    ld a, [hl+]
    nop
    ld [bc], a
    xor $2a
    xor $1a
    cp $5a
    cp $4a
    cp $af
    add sp, -$5e
    db $e3
    xor d
    db $eb
    or [hl]
    rst $38
    nop
    inc b
    and d
    rst $38
    adc b
    rst $38
    sub h
    rst $30
    and d
    db $e3
    jp Jump_00e_5dc3


    ld e, b
    cp e
    cp e
    push bc
    db $fd
    push bc
    jr nz, @+$22

    db $fd
    and l
    cp l
    and l
    cp l
    ld h, l
    ld [$9d95], sp
    sbc l
    sbc l
    ld h, d
    cp $62
    add hl, sp
    ld bc, $de52
    ld hl, $6f00
    add hl, bc
    ld c, d
    adc $ce
    adc $bf
    add sp, $01
    nop
    ld [$6022], sp
    nop
    nop
    ld h, b
    inc a
    inc a
    ld h, [hl]
    nop
    jr nc, jr_00e_6ca9

    inc a
    nop
    nop
    jr c, jr_00e_6caa

    jr jr_00e_6c74

jr_00e_6c74:
    jr nc, @+$11

    ld [$041c], sp
    ld [$261c], sp
    nop
    nop
    inc c
    inc c
    jr jr_00e_6c9a

    jr nc, jr_00e_6cb4

    ld a, $3e
    rrca
    jr @+$08

    ld b, $1c
    inc e
    ld b, b
    ld b, c
    ld b, $06
    ld h, $26
    inc e
    inc e
    rra
    ld [$002c], sp
    nop
    ld c, h

jr_00e_6c9a:
    ld c, h
    ld a, [hl]
    ld a, [hl]
    inc c
    nop
    nop
    nop
    nop
    adc e
    nop
    ld a, $3e
    jr nc, jr_00e_6cd8

    inc a

jr_00e_6ca9:
    inc a

jr_00e_6caa:
    ld b, $00
    nop
    rra
    jr z, jr_00e_6ce0

    nop
    nop
    inc a
    inc a

jr_00e_6cb4:
    ld [hl-], a
    nop
    nop
    ld sp, hl
    sbc h
    cpl

jr_00e_6cba:
    ld [$3e3e], sp
    ld c, a
    jr @+$03

    jr @+$81

    jr z, @+$07

    jr z, jr_00e_6d35

    jr z, @+$20

    ld e, $41
    ld [$085f], sp
    sbc a
    jr jr_00e_6d4e

    ld a, [hl]
    and l
    jr jr_00e_6d44

    sbc a
    nop
    nop
    ld a, h

jr_00e_6cd8:
    ld a, h
    xor a
    ld [$2805], sp
    cp a
    jr jr_00e_6d40

jr_00e_6ce0:
    nop

jr_00e_6ce1:
    db $10
    cp a
    jr jr_00e_6d04

    jr jr_00e_6cba

    jr jr_00e_6d08

    ld [$7e7e], sp
    dec e
    ld [$2733], sp
    dec b
    jr z, @+$11

    jr z, jr_00e_6d71

    ld a, h
    inc sp
    jr jr_00e_6d38

    jr z, jr_00e_6d69

    ld l, [hl]
    rst $38
    jr z, @+$0f

    add hl, de
    ld l, a
    jr c, jr_00e_6d3f

    inc a

jr_00e_6d04:
    rrca
    ld e, c
    ld a, $3e

jr_00e_6d08:
    ld hl, $bb00
    jr z, jr_00e_6d79

    ld l, h
    jr c, @+$3a

    cpl
    ld [$6c6c], sp
    ld a, b
    ld a, b
    ld [hl], b
    ld [hl], b
    ld a, b
    ld a, b
    ld l, h
    ld l, h
    ld e, a
    db $10
    sbc a
    ld [$188b], sp
    sub c
    jr jr_00e_6d94

    ld [$18bd], sp
    ld e, d
    nop
    db $10
    ld b, d
    ld b, d
    nop
    nop
    ld h, d
    nop
    nop
    ld [hl], d
    ld [hl], d
    ld e, d

jr_00e_6d35:
    ldh a, [$ff61]
    ld e, d

jr_00e_6d38:
    ld c, [hl]
    ld c, [hl]
    ld b, [hl]
    nop
    nop
    ld a, a
    ld a, c

jr_00e_6d3f:
    rst $18

jr_00e_6d40:
    jr z, jr_00e_6ce1

    ld c, b
    and c

jr_00e_6d44:
    add hl, de
    ld l, h
    ld l, h
    ld [hl], $36
    rst $38
    ld e, b
    sbc a
    jr jr_00e_6db4

jr_00e_6d4e:
    add b
    db $e4
    ld h, [hl]
    jr nc, jr_00e_6d83

    inc c
    inc c
    ld b, $06
    cp a
    add hl, de
    ld a, [hl]
    ld a, [hl]
    cp a
    add hl, sp
    jr @+$1a

    rst $08
    jr z, @-$1f

    add hl, sp
    db $ed
    add hl, de
    add $e7
    inc h
    nop

jr_00e_6d69:
    nop
    reti


    ld [$0000], sp
    ld b, d

jr_00e_6d6f:
    nop
    nop

jr_00e_6d71:
    sbc l
    jr jr_00e_6dd3

    add hl, de
    dec de
    ld [$1a01], sp

jr_00e_6d79:
    inc h
    inc h
    rrca
    jr jr_00e_6d8f

    jr c, jr_00e_6dcf

    ld [$f9f0], sp

jr_00e_6d83:
    ld a, [hl]
    ld a, [hl]
    ld b, $06
    dec c
    ld a, [de]
    ld c, a
    add hl, de
    ld c, a
    ld c, d
    add a
    add hl, bc

jr_00e_6d8f:
    ld c, a
    ld a, [bc]
    ld c, $0e
    ld a, c

jr_00e_6d94:
    ld [$187f], sp
    dec d
    ld a, [bc]
    adc c
    jr jr_00e_6da3

    ld a, [bc]
    ld c, c
    add b
    ld a, l
    ld a, [bc]
    ld b, d
    ld b, d

jr_00e_6da3:
    ld h, c
    jr jr_00e_6dca

    inc h
    rrca
    add hl, bc
    rst $38
    rst $38
    add c
    add c
    cp l
    cp l
    cp l
    and l
    ld bc, $1000

jr_00e_6db4:
    add l
    cp l
    add c
    add c
    rst $38
    nop
    jr @-$3b

    rst $38
    db $db
    ld bc, $c300
    dec c
    jr jr_00e_6d6f

    xor e
    push de
    push de
    inc bc
    jr z, @-$2d

jr_00e_6dca:
    nop
    dec e
    jr nz, @-$59

    rst $38

jr_00e_6dcf:
    sbc c
    ld bc, $a500

jr_00e_6dd3:
    ld hl, $cf08
    ld a, [hl+]
    ret nz

    ret nz

    ldh a, [$ffb0]
    ld a, h
    ld c, h
    ccf
    inc hl
    nop
    jr jr_00e_6de6

    inc b
    ld b, $06
    rlca

jr_00e_6de6:
    dec b
    rrca
    ld [$080d], sp
    inc c
    ld bc, $ef10
    ld a, [bc]
    ld bc, $8301
    nop
    nop
    add d
    rst $00
    ld b, h
    xor $28
    ld a, h
    db $10
    jr c, jr_00e_6dfe

jr_00e_6dfe:
    ld b, b
    ld b, b
    ldh [$ffa0], a
    ldh a, [rNR10]
    cp b
    nop
    ld bc, $1c08
    inc b
    rrca
    inc bc
    rlca
    nop
    inc bc
    dec de
    nop
    ld b, $06
    ld e, $18
    ld a, a
    ld h, c
    rst $30
    add b
    inc b
    add c
    add $02
    add [hl]
    ld [bc], a
    ld b, $02
    rra
    ld l, e
    ccf
    jr nz, jr_00e_6e29

    nop
    nop
    ccf

jr_00e_6e29:
    rra
    jr nc, jr_00e_6e3c

    nop
    add e
    scf
    rla
    dec [hl]
    dec d
    inc [hl]
    inc d
    call z, $b3c8
    nop
    or l
    nop
    ld b, c
    ld b, c

jr_00e_6e3c:
    ld e, l
    ld e, l
    ld d, l
    nop
    nop
    ld b, $18
    db $10
    ld d, b
    inc bc
    rrca
    ld [$0404], sp
    ld d, l
    ld d, l
    ld d, h
    ld d, h
    ld d, [hl]
    ld d, [hl]
    ld e, a
    dec bc
    rra
    ld [$1111], sp
    push de
    add b
    inc b
    push de

jr_00e_6e5a:
    sub l
    sub l
    or l
    or l
    rlca
    ld bc, $281f
    ld [hl], l
    ld [hl], l
    cpl
    ld [$ffff], sp
    inc bc
    ld bc, $00fe
    nop
    ld [bc], a
    db $fc
    ld hl, sp+$0c
    ld [$282c], sp
    xor h
    xor b
    db $ec
    add sp, $35
    dec d
    scf
    rla
    jr nc, jr_00e_6e8e

    ld [hl-], a
    db $10
    ccf
    rra
    ccf
    sbc c
    nop
    rst $38
    add b
    rst $38
    rst $38
    ld d, l
    ld [$4141], sp
    rlca

jr_00e_6e8e:
    ld bc, $08d3
    nop
    ldh [$ff80], a
    dec h
    add b
    ld d, [hl]
    ld d, [hl]
    halt
    halt
    ld b, $06
    rrca
    jr jr_00e_6e5a

    dec bc
    or l
    nop
    nop
    ld sp, $0f31
    jr z, jr_00e_6eb0

    nop
    ld b, b
    nop
    ld d, l
    ld d, l
    ld [hl], l
    ld [hl], l
    inc b

jr_00e_6eb0:
    inc b
    cpl
    jr jr_00e_6ef3

    inc c
    inc sp
    inc de
    ld l, h
    ld l, b
    inc l
    jr z, jr_00e_6ec8

    db $10

Jump_00e_6ebd:
    ld [bc], a
    ld [$f8fc], sp
    db $fc
    add sp, $03
    cp b
    ld [$04fc], sp

jr_00e_6ec8:
    rst $28
    ld l, e
    ld h, b
    ld b, b
    ld h, c
    ld b, b
    ld h, e
    ld b, b
    nop
    inc b
    rst $28
    add c
    cp $86
    ld a, b
    jr @+$62

    ld h, b
    add b
    add b
    ld h, e
    nop
    nop
    ldh a, [$ffc0]
    jr c, jr_00e_6f03

    nop
    nop
    dec e
    db $10
    rrca
    ld [$0507], sp
    ld [bc], a
    ld [bc], a
    inc e
    nop
    ld a, $08
    ld [hl], a
    inc d

jr_00e_6ef3:
    db $e3
    ld [hl+], a
    sub b
    nop
    pop bc
    ld b, c
    add b
    add b
    dec hl
    inc c
    jr nc, @+$12

    ld bc, $b008
    db $10

jr_00e_6f03:
    ldh a, [rNR10]
    ldh [$ffa0], a
    ld h, b
    ld h, b
    nop
    inc b
    jr nz, jr_00e_6f2d

    db $fc
    call nz, $323e
    rrca
    dec c
    inc bc

jr_00e_6f14:
    inc bc
    ld b, a
    inc a
    db $10
    db $10
    jr z, jr_00e_6f43

    cp $00
    ld [bc], a
    cp $fe
    add d
    cp $fe
    xor d
    xor d
    ld d, h
    ld d, h
    ld b, c
    inc c
    ld e, h
    ld b, h
    adc [hl]
    add d

jr_00e_6f2d:
    sbc $82
    add b
    nop
    ld a, h
    ld b, h

jr_00e_6f33:
    jr c, jr_00e_6f5d

    db $10
    db $10
    rst $38
    call nc, $8100
    pop bc
    add d
    jp $c784


    add a
    rst $00
    nop

jr_00e_6f43:
    jr @-$7d

    pop bc
    add c
    pop bc
    rst $38
    rst $38
    ld bc, $c1ff
    jp $0141


    jr nc, jr_00e_6f65

    ld [$c181], sp
    add a
    ld d, $10
    rst $00
    rra

jr_00e_6f5a:
    ld [$00fe], sp

jr_00e_6f5d:
    rst $38
    add hl, de
    jr @+$73

    di
    ld de, $f1f3

jr_00e_6f65:
    di
    ld bc, $120e
    add b
    rst $38
    add e
    ld bc, $3d02
    nop
    adc e
    rst $08
    adc d
    adc $8c
    call z, $c080
    ccf
    jr jr_00e_6f9c

    db $e3
    pop de
    di
    ld d, c
    ld [hl], e
    db $10
    jr nz, jr_00e_6fd4

    ld [hl], e
    and c
    db $e3
    ld e, e
    ld [$c785], sp
    adc c
    rst $08
    adc b
    rst $08
    adc a
    rst $08
    ccf
    jr jr_00e_6f14

    add e
    ret z

    ld [hl+], a
    ld bc, $f103
    ccf
    add b
    adc h

jr_00e_6f9c:
    call z, $0887
    ccf
    jr z, jr_00e_6f33

    ccf
    nop
    pop de
    di
    ld hl, $003f
    add b
    ret nz

    nop
    add hl, hl
    adc h
    call z, $cf8b
    add h
    rst $00
    add e
    jp $087f


    and c
    db $e3
    ld d, a
    ld [$1991], sp
    nop
    pop bc
    jp Jump_000_07c7


Jump_00e_6fc2:
    ld a, a
    jr jr_00e_6f5a

    ld bc, $4801
    rst $38
    db $fd
    inc bc
    ld bc, $1d48
    ld c, b
    cp a
    ld [$481d], sp
    cp a

jr_00e_6fd4:
    ld [$3c3c], sp
    ld a, [hl]
    ld b, d
    rst $38
    ld [bc], a
    cp $81
    or c
    ld [bc], a
    add c
    rst $38
    sbc c
    ld a, [hl]
    ld b, d
    inc a
    inc a
    rst $28
    ld a, [bc]
    ld bc, $bf38
    ld a, [hl-]
    nop
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$6f
    dec bc
    nop
    adc h
    rst $38
    add c
    ei
    add l
    ei
    add l
    di
    adc l
    jp $97bd


    nop
    ld [hl], b
    dec bc
    add c
    rst $38
    cp l
    ld d, c
    inc bc
    ld h, [hl]
    db $e3
    and l
    dec b
    nop
    ld a, a
    inc de
    db $fd
    add e
    ld bc, $8e28
    inc hl
    add c
    ld bc, $2f40
    db $10
    jp $dbbd


    ld bc, $3f00
    jr z, @+$40

    nop
    add [hl]
    rst $38
    jp $1801


    cpl
    jr c, @-$17

    sbc c
    rst $20
    sbc c
    cpl
    jr nz, @+$2f

    dec bc
    inc bc
    ld b, b
    dec a
    inc de
    dec c
    ld b, b
    cpl
    inc hl
    dec c
    ld b, b

jr_00e_703d:
    ld de, $bf28
    xor b
    jp $8e49


    ld l, b
    inc b
    ld e, b
    nop
    nop
    rlca
    rlca
    ld a, l
    ld c, $05
    jr jr_00e_703d

    ld c, $c3
    jp $0ee1


    rst $00
    rst $00
    rrca
    jr z, @-$38

    ld [bc], a
    sbc c
    add $f1
    ld c, $e6
    and $66
    ld h, [hl]
    ld h, e
    ld h, e
    dec c
    rrca
    ld h, e
    ld h, e
    add hl, bc
    ld [$0e3f], sp
    jp Jump_000_1dc3


    rrca
    ld b, b

jr_00e_7072:
    ldh a, [c]
    rst $00
    rst $00
    ld h, [hl]
    ld h, [hl]
    rlca
    rlca
    dec h
    ld [$c7c7], sp
    dec l
    rrca
    ldh [$ffe0], a
    inc bc
    jr @+$07

    jr z, jr_00e_7086

jr_00e_7086:
    ld hl, sp+$00
    ld hl, sp+$0f
    nop
    nop
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    adc b
    ld bc, $07e0
    ld [hl-], a
    sub b
    nop
    nop
    ld h, b
    add c
    jp Jump_00e_5801


    rra
    jr c, jr_00e_70a5

    inc bc
    inc b
    rlca

jr_00e_70a5:
    dec b
    ld b, $2f
    jr c, @+$01

    rst $38
    ld [bc], a
    ld [$0e01], sp
    ccf
    jr c, jr_00e_7072

    ret nz

    ld h, b
    and b
    ld h, b
    and b
    dec b
    ld b, $01
    ld e, b
    inc de
    ld [$9803], sp
    ld a, a
    cp a
    ld b, b
    cp a
    nop
    inc bc
    ld a, a
    add b
    inc b
    rlca
    rlca
    inc b
    inc bc
    inc bc
    add l
    ld b, b
    ld d, [hl]
    ld h, b
    ld h, b
    and b
    ldh [rNR41], a
    ret nz

    ret nz

    db $ed
    daa
    ld [hl], l
    ld c, b
    add c
    nop
    ld hl, sp+$18
    jr nc, @+$01

    nop
    nop
    xor b
    db $10
    ld bc, $b210
    nop
    or b
    ld b, b
    xor a
    ld [$20e0], sp
    rst $38
    jr nz, jr_00e_7101

    rrca
    nop
    ld bc, $3030
    ld b, b
    ld b, c
    add b
    add b
    nop
    ld [$0001], sp
    ld a, $00

jr_00e_7101:
    ld [$8880], sp
    ld h, e
    db $e3
    inc b
    jr nz, @+$1e

    ld e, $1c
    add hl, hl
    inc a
    inc a
    ld b, e
    ld b, e
    add b
    cp b
    ld b, b
    inc [hl]
    nop
    ld c, $2e
    add hl, de
    ldh [rNR41], a
    nop
    ld [bc], a
    db $10
    db $10
    ld [$0488], sp
    inc a
    ld [bc], a
    ld [bc], a
    ld bc, $113f
    rlca
    rlca
    jr jr_00e_7149

    ld hl, $2021
    nop
    ld b, b
    ld [bc], a
    add b
    inc b
    add b
    ld c, a
    ld de, $9c9c
    ld h, d
    ld b, d
    add c
    ret c

    nop
    ld l, $00
    ld [hl], b
    and c
    ld [bc], a
    ld e, [hl]
    add hl, sp
    ld a, h
    ld l, h
    add e
    ld a, b
    ld l, h

jr_00e_7149:
    ld bc, $0110
    nop
    ld a, h
    dec b
    ld [$0060], sp
    sbc h
    jr c, jr_00e_7157

    adc h
    nop

jr_00e_7157:
    ld b, b
    ld bc, $ffff
    add b
    rst $38
    adc a
    rst $08
    adc b
    rst $08
    adc e
    rst $08
    adc d
    adc $8b
    rlca
    nop
    rst $38
    nop
    nop
    rst $38
    ld bc, $f1ff
    di
    ld de, $f1f3
    di
    ld bc, $c103
    jp $e321


    adc a
    jr nz, jr_00e_717f

    rst $08
    add b

jr_00e_717f:
    ret nz

    adc h
    call z, $0819
    add a
    rst $00
    add b
    adc $00
    sub c
    di
    ld d, c
    ld [hl], e
    ld d, c
    ld [hl], e
    ret nz

    cpl
    sub c
    di
    ld hl, $c1e3
    jp Jump_000_003c


    ldh [rP1], a
    ccf
    jr jr_00e_71c5

    ld [$0801], sp
    ccf
    jr z, @-$2d

    daa
    db $10
    and c
    db $e3
    jr nc, @-$72

    add b
    ret nz

    add c
    pop bc
    ld bc, $3f28
    ld [$e3a1], sp
    ld b, c
    jp $1801


    ccf
    jr jr_00e_71bb

jr_00e_71bb:
    nop
    ld h, [hl]
    nop
    jr nc, jr_00e_71c0

jr_00e_71c0:
    db $10
    ld a, [hl]
    ld a, [hl]
    ld e, d
    ld e, d

jr_00e_71c5:
    nop
    nop
    jr jr_00e_71e1

    inc a
    inc a
    ld h, [hl]
    inc h
    dec d
    jr z, jr_00e_71d0

jr_00e_71d0:
    nop
    ld a, [hl]
    call c, Call_00e_7e9b
    jr jr_00e_71d7

jr_00e_71d7:
    ld b, b
    inc c
    add hl, bc
    ld sp, $6028
    nop
    nop
    ccf
    ld c, b

jr_00e_71e1:
    ld b, c
    jr @+$03

    jr jr_00e_7228

    nop
    db $10
    ld e, l
    ld [$7e7e], sp
    ld h, c
    jr c, @+$29

    inc bc
    ld e, l
    ld [$584d], sp
    ld b, e
    ld [$6060], sp
    add e
    jr jr_00e_7237

    inc a
    ld c, l
    ld e, b
    ld a, l
    ld [$1f1f], sp
    ccf
    ld hl, $4e7e
    inc b
    ld [$5070], sp
    ld bc, $3c28
    inc a
    ld a, [hl]
    ld b, d
    ld a, [hl]

jr_00e_7211:
    ld e, d
    rst $20
    and l
    ld bc, $7328
    ld [hl], e
    ld [hl], e
    ld d, d
    nop
    nop
    ld [hl], e
    ld d, d
    ld a, e
    ld c, d
    ld a, e
    ld c, d
    ld a, a
    ld b, [hl]
    ld a, a
    ld d, [hl]
    ld a, a
    ld d, d

jr_00e_7228:
    cp a
    cp a
    cp a
    and b
    db $10
    jr nz, @-$3f

    cp e
    adc [hl]
    adc d
    ld bc, $bb28
    cp e
    cp e

jr_00e_7237:
    xor d
    cp e
    xor d
    dec sp
    ld a, [hl+]
    ld bc, $9d28
    sbc l
    nop
    nop
    sbc l
    sub l
    sbc l
    sub l
    db $dd
    ld d, l
    db $dd
    ld d, l
    db $fd
    dec [hl]
    db $fd
    or l
    db $fd
    sub l
    adc $ce
    inc c
    ld b, d
    adc $4a
    ld bc, $3148
    ld [bc], a
    add c
    rst $38
    cp a
    ldh [$ffa0], a
    ld bc, $fe08
    cp [hl]
    cp $82
    ld a, c
    jr c, jr_00e_72e7

    jr nz, jr_00e_726a

jr_00e_726a:
    ld c, a
    ccf
    ld hl, $1e1e
    ld a, c
    jr c, jr_00e_72f0

    ld e, d
    ld a, [hl]
    ld b, d
    inc a
    inc a
    ld a, a
    ld e, b
    ld a, a
    ld e, b
    or b
    dec c
    ld [hl], a
    ld d, h
    ld [hl], a
    ld d, h
    add l
    ld [$0089], sp
    ld [hl], e
    ld a, c
    jr c, @-$7b

    db $10
    adc [hl]
    ld a, c
    jr c, jr_00e_7211

    db $10

jr_00e_728f:
    dec sp
    db $fd
    push bc
    db $fd
    jr nz, jr_00e_7299

    push bc
    cp l
    and l
    cp l

jr_00e_7299:
    and l
    add l
    ld [$949c], sp
    sbc h
    sbc h
    ld a, l

jr_00e_72a1:
    jr c, jr_00e_72a1

    ld [hl-], a
    db $fc
    add h
    ld a, b
    ld [$7801], sp
    cp $be
    ld a, e
    jr jr_00e_728f

    and b
    rst $38
    cp a
    adc c
    nop
    rst $38
    jr c, jr_00e_72ef

    ld a, h
    ld b, h
    cp $92
    inc b
    nop
    xor $aa
    ld bc, $fe78
    sub d
    ld a, h
    ld b, h
    jr c, @+$3a

    inc e
    inc e
    inc a
    inc h
    ld a, h
    ld d, h
    ld a, h
    jr @+$0a

    ld [hl], h
    inc e
    inc d
    ld bc, $0090
    nop
    ld a, $22
    ld a, a
    ld e, l
    ld [hl], a
    ld d, l
    ld bc, $7500
    ld c, $0a
    ld c, $42
    db $10
    ld a, [bc]
    daa

jr_00e_72e7:
    ld [$2838], sp
    jr c, @+$2a

    rst $08
    nop

jr_00e_72ee:
    ld e, a

jr_00e_72ef:
    ld a, a

jr_00e_72f0:
    ld b, c
    ld a, a
    ld a, a
    ld e, a
    db $10
    or d
    xor $aa
    nop
    ld b, b
    adc $ca
    ld c, $0a
    ld a, $3a
    inc a
    inc h
    ld a, $32
    ld c, $0a
    adc $ca
    ld e, a
    db $10
    or d
    ld bc, $5f28
    ld [$0e0e], sp
    ld e, $12
    ld e, $12
    ld a, $2a
    ld a, $2a
    rst $28
    nop
    ld e, d
    add a
    jr @+$01

    cp e
    dec b
    ld [bc], a
    inc hl
    ld bc, $4dfb
    ld [$0e0e], sp
    cp $fe
    cp $82
    or e
    jr z, @-$06

    cp b
    db $fc
    add h
    cp $f2
    or b
    rst $30
    ld c, $0a
    xor $ea
    ccf
    jr c, @-$3f

    jr nc, jr_00e_72ee

    rra
    jr nz, jr_00e_73ae

    nop
    cp a
    ld c, b
    ccf
    db $10
    ld a, [$2899]
    sbc l
    jr z, @+$05

    jr nc, jr_00e_738f

    jr c, jr_00e_7371

    ld a, b
    ld bc, $e701
    nop
    dec bc
    ld b, c
    rst $38
    jr @+$21

    ld e, c
    cp $9a
    ld a, [hl]
    ld b, d
    ld a, $3a
    add c
    jr jr_00e_7385

    add hl, de
    rst $18
    ld l, h
    inc b
    ret nc

    rst $38
    ld h, [hl]

jr_00e_736d:
    inc c
    ld a, a
    cp a
    dec de

jr_00e_7371:
    ldh [c], a
    inc [hl]
    cp $01
    ld de, $e400
    ld c, h
    nop
    cp $01
    rrca
    ld e, b
    ccf
    dec [hl]
    rrca
    ld b, $09
    ld b, $08

jr_00e_7385:
    jr jr_00e_7390

    nop
    rrca
    ld c, a
    dec [hl]
    ldh a, [$ff60]
    sub b
    ld h, b

jr_00e_738f:
    sub b

jr_00e_7390:
    nop
    ldh a, [rNR22]

jr_00e_7393:
    or b
    ld a, b
    ld l, l
    ccf
    add hl, de
    ld h, $10
    nop
    add hl, de
    ld h, $00
    ccf
    adc a
    dec [hl]
    db $fc
    sbc b
    ld h, h
    sbc b
    ld h, h
    nop
    db $fc
    nop
    inc bc
    ld bc, $0802
    inc e

jr_00e_73ae:
    ld bc, $0002
    ld hl, $c03d
    add b
    ld b, b
    add b
    ld b, b
    nop
    ld de, $3f45
    ldh [$ffe0], a
    ld l, l
    inc a
    jr jr_00e_73e6

    ld hl, sp+$7f
    jr jr_00e_73ea

    nop
    ld l, c
    inc bc
    ccf
    ld hl, sp+$7f
    db $10
    cpl
    xor b
    ccf
    add sp, -$59
    jr z, jr_00e_7393

    ld l, b
    sub a
    xor b
    daa
    xor b
    ld d, a
    xor b
    ret nc

    jr c, jr_00e_736d

    inc h
    ld [hl], b
    ld c, b
    inc b
    ld h, b
    ld [hl], b
    ld [hl], b
    rst $28

jr_00e_73e6:
    add hl, bc
    inc a
    inc a
    xor a

jr_00e_73ea:
    ld e, h
    ld a, [hl]
    ld a, [hl]
    ld b, $00
    nop
    ld c, $06
    ld c, $0c
    inc e
    inc e

jr_00e_73f6:
    nop
    inc c
    inc e
    rrca
    db $10
    ld [hl], e
    inc e
    cp l
    inc c
    ld a, h
    ld a, h
    cp l
    jp $c7b9


    ld e, d
    ld h, [hl]
    ld d, d
    ld l, [hl]
    inc [hl]
    inc b
    nop
    inc l
    inc h
    scf
    nop
    nop
    nop
    or $0f
    halt
    adc a
    ld l, c
    sbc a
    dec hl
    rst $18
    cp d
    sbc $94
    ld [bc], a
    nop
    db $f4
    db $dd
    inc c
    db $db
    inc a
    sbc e
    ld a, h
    and l
    ld a, [hl]
    dec h
    cp $67
    cp $5a
    db $db
    add c
    add c
    nop
    add b
    nop
    nop
    ld l, a
    ldh a, [$ff6e]
    pop af
    sub [hl]
    ld sp, hl
    call nc, Call_00e_5dfb
    ld a, e
    add hl, hl
    cpl
    ld b, $0d
    rlca
    ld bc, $5f00
    ld l, [hl]
    inc bc
    inc bc
    inc c
    rrca
    inc de
    inc e

jr_00e_744d:
    cpl
    jr nc, jr_00e_74af

    ld h, b
    ld a, a
    ld b, e
    cp h

jr_00e_7454:
    rst $00
    cp l
    nop
    nop
    add $c0
    ret nz

    jr nc, jr_00e_744d

    ret z

    jr c, jr_00e_7454

    inc c
    ld a, [$fe06]
    jp nz, $e33d

    cp l
    ret nc

    ld l, b
    ld h, e
    ld bc, $0201
    nop
    nop
    ld bc, $0000
    rlca
    jr jr_00e_73f6

    add b
    ld b, b
    nop
    nop
    add b
    nop
    nop
    rlca
    jr jr_00e_749c

    ldh [rP1], a
    inc e

jr_00e_7483:
    ld c, $0e
    ld c, $06
    rrca

jr_00e_7488:
    dec a
    ld a, e
    ld c, l
    rra
    dec c
    jr c, jr_00e_74a7

    jr c, jr_00e_74c1

    jr nc, jr_00e_74c3

    ld [hl], b
    jr nc, jr_00e_7488

    nop
    ld [hl], b
    ld a, h
    dec b
    ld a, [hl]
    ld a, [hl]

jr_00e_749c:
    ccf
    dec l
    ld b, l
    dec e
    rrca
    ld [$6800], sp
    ld bc, $0150

jr_00e_74a7:
    nop
    ld bc, $ffff
    db $fd
    add e
    rst $30
    rst $28

jr_00e_74af:
    dec [hl]
    dec l
    ld bc, $ff28
    rst $38
    rst $30
    inc c
    cp a
    ld a, a
    and c
    ld [bc], a
    db $10
    ld h, c

jr_00e_74bd:
    ld bc, $b918
    ld a, c

jr_00e_74c1:
    rst $38
    rst $38

jr_00e_74c3:
    rst $28
    jr jr_00e_7483

    ld a, e
    xor l
    ld l, e
    ld bc, $af08
    ld l, b
    xor l
    nop
    jr nz, @+$6d

    rst $28
    rst $28
    db $fd
    dec de
    db $fd
    srl l
    dec hl
    dec a
    dec hl
    db $fd
    db $db
    add hl, bc
    ld [$3c3c], sp
    nop
    ret nz

    ld a, [hl]
    ld b, d
    db $dd
    cp a
    push de
    or a
    db $d3
    or e
    ld l, b
    ld e, b
    ld l, b
    ld e, b
    inc [hl]
    inc l
    ld c, c
    jr c, @+$55

    ld [$6040], sp
    dec a
    dec a

jr_00e_74f9:
    jp hl


    add hl, de
    cp c
    ld a, c
    ld c, l
    jr jr_00e_74bd

    ld a, l
    push af
    dec c
    db $fd
    db $fd
    ld c, c
    jr jr_00e_750d

    jr z, jr_00e_74f9

    ld b, $00
    rst $28

jr_00e_750d:
    ld c, c
    ld [$3803], sp
    ccf
    ccf
    ld a, [de]
    ld d, $1a
    ld d, $0d
    dec bc
    call $edcb
    xor e
    db $fd
    add b
    ld [bc], a
    cp e
    ld a, d
    ld b, [hl]
    inc a
    inc a
    nop
    nop
    and c
    ld e, b
    nop
    nop
    nop
    db $fd
    db $fd
    ei
    rlca
    cp l
    ld a, e
    ld b, b
    nop
    and l
    ld h, a
    and l
    ld h, a
    cp e
    ld a, a
    rrca
    ld [$ffff], sp
    cp a
    ld h, b
    or a
    ld l, a
    or h
    ld l, h
    or h
    ld [$6c01], sp
    or a
    ld l, a
    rra
    ld [$bcbc], sp
    ld [hl], h
    db $ec
    dec c
    nop
    db $ec
    or h
    db $ec

jr_00e_7555:
    ld [hl], h
    db $ec
    nop
    nop
    ld b, b
    jr c, @+$81

    ld a, a
    ld a, l
    ld b, e
    ld l, a
    ld e, a
    sbc l
    ld [$5868], sp
    ld l, [hl]
    ld e, [hl]
    sbc a
    ld l, b
    ld c, c
    jr z, jr_00e_756f

    jr jr_00e_7555

    rst $20

jr_00e_756f:
    inc bc
    ld bc, $2849
    inc bc
    jr @-$02

    db $fc
    or h
    xor h
    inc [hl]
    inc l

jr_00e_757b:
    ld bc, $3718
    cpl
    ccf
    jr nz, jr_00e_75c1

    ccf
    ld a, d
    ld [$460c], sp
    ld l, [hl]
    ld e, [hl]
    ld c, e
    jr jr_00e_757b

    rst $18
    ld a, l
    jp $ffff


    adc a
    ld [$4800], sp
    ld bc, $0fd0
    ld [hl+], a
    ld h, b
    nop
    nop
    ld h, b
    inc a
    inc a
    ld h, [hl]
    nop
    jr nc, jr_00e_75df

    inc a
    nop
    nop
    jr c, jr_00e_75e0

    jr jr_00e_75aa

jr_00e_75aa:
    jr nc, @+$11

    ld [$041c], sp
    ld [$261c], sp
    nop
    nop
    inc c
    inc c
    jr jr_00e_75d0

    jr nc, jr_00e_75ea

    ld a, $3e
    rrca
    jr @+$08

    ld b, $1c

jr_00e_75c1:
    inc e
    ld b, b
    ld b, c
    ld b, $06
    ld h, $26
    inc e
    inc e
    rra
    ld [$002c], sp
    nop
    ld c, h

jr_00e_75d0:
    ld c, h
    ld a, [hl]
    ld a, [hl]
    inc c
    nop
    nop
    nop
    nop
    adc e
    nop
    ld a, $3e
    jr nc, jr_00e_760e

    inc a

jr_00e_75df:
    inc a

jr_00e_75e0:
    ld b, $00
    nop
    rra
    jr z, jr_00e_7616

    nop
    nop
    inc a
    inc a

jr_00e_75ea:
    ld [hl-], a
    nop
    nop
    ld sp, hl
    sbc h
    cpl

jr_00e_75f0:
    ld [$3e3e], sp
    ld c, a
    jr @+$03

    jr @+$81

    jr z, @+$07

    jr z, jr_00e_766b

    jr z, @+$20

    ld e, $41
    ld [$085f], sp
    sbc a
    jr jr_00e_7684

    ld a, [hl]
    and l
    jr jr_00e_767a

    sbc a
    nop
    nop
    ld a, h

jr_00e_760e:
    ld a, h
    xor a
    ld [$2805], sp
    cp a
    jr jr_00e_7676

jr_00e_7616:
    nop

jr_00e_7617:
    db $10
    cp a
    jr jr_00e_763a

    jr jr_00e_75f0

    jr jr_00e_763e

    ld [$7e7e], sp
    dec e
    ld [$2733], sp
    dec b
    jr z, @+$11

    jr z, jr_00e_76a7

    ld a, h
    inc sp
    jr jr_00e_766e

    jr z, jr_00e_769f

    ld l, [hl]
    rst $38
    jr z, @+$0f

    add hl, de
    ld l, a
    jr c, jr_00e_7675

    inc a

jr_00e_763a:
    rrca
    ld e, c
    ld a, $3e

jr_00e_763e:
    ld hl, $bb00
    jr z, jr_00e_76af

    ld l, h
    jr c, @+$3a

    cpl
    ld [$6c6c], sp
    ld a, b
    ld a, b
    ld [hl], b
    ld [hl], b
    ld a, b
    ld a, b
    ld l, h
    ld l, h
    ld e, a
    db $10
    sbc a
    ld [$188b], sp
    sub c
    jr jr_00e_76ca

    ld [$18bd], sp
    ld e, d
    nop
    db $10
    ld b, d
    ld b, d
    nop
    nop
    ld h, d
    nop
    nop
    ld [hl], d
    ld [hl], d
    ld e, d

jr_00e_766b:
    ldh a, [$ff61]
    ld e, d

jr_00e_766e:
    ld c, [hl]
    ld c, [hl]
    ld b, [hl]
    nop
    nop
    ld a, a
    ld a, c

jr_00e_7675:
    rst $18

jr_00e_7676:
    jr z, jr_00e_7617

    ld c, b
    and c

jr_00e_767a:
    add hl, de
    ld l, h
    ld l, h
    ld [hl], $36
    rst $38
    ld e, b
    sbc a
    jr jr_00e_76ea

jr_00e_7684:
    add b
    db $e4
    ld h, [hl]
    jr nc, jr_00e_76b9

    inc c
    inc c
    ld b, $06
    cp a
    add hl, de
    ld a, [hl]
    ld a, [hl]
    cp a
    add hl, sp
    jr @+$1a

    rst $08
    jr z, @-$1f

    add hl, sp
    db $ed
    add hl, de
    add $e7
    inc h
    nop

jr_00e_769f:
    nop
    reti


    ld [$0000], sp
    ld b, d
    nop
    nop

jr_00e_76a7:
    sbc l
    jr @+$61

    add hl, de
    dec de
    ld [$1a01], sp

jr_00e_76af:
    inc h
    inc h
    rrca
    jr jr_00e_76c5

    jr c, @+$51

    ld [$99f0], sp

jr_00e_76b9:
    ld a, [hl]
    ld a, [hl]
    ld b, $06
    dec c
    ld a, [de]
    ld c, a
    add hl, de
    ld b, l
    ld a, [hl+]
    dec sp
    ld a, [bc]

jr_00e_76c5:
    ld d, c
    ld a, [hl-]
    ld c, $0e
    ld a, e

jr_00e_76ca:
    ld [$087f], sp
    nop
    nop
    rla
    ld a, [bc]
    add hl, bc
    db $10
    adc e
    jr jr_00e_7706

    jr nc, @+$7f

    ld a, [bc]
    cp $c6
    cp $ee
    cp $7c
    cp $38
    inc bc
    nop
    xor $fe
    add $21
    ld hl, $0a71

jr_00e_76ea:
    ld b, h
    ld a, h
    add d
    cp $01
    ld [$7c44], sp
    ld d, c
    add hl, bc
    jr c, jr_00e_772e

    ld a, h
    ld b, h
    ld c, $10
    add d
    ld a, h
    cp $ff
    ld b, h
    ld h, c
    add hl, bc
    nop
    ld hl, sp+$00
    ld hl, sp+$00

jr_00e_7706:
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp-$01
    rst $38
    nop
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00

jr_00e_772e:
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp-$01
    rlca
    nop
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$09
    xor b
    inc bc
    inc bc
    inc b
    rlca
    dec b
    ld [hl-], a
    ret nz

    ld b, $27
    jr c, @+$01

    rst $38
    ld [bc], a
    ld [$3837], sp
    ret nz

    ret nz

    ld h, b
    and b
    ld h, b
    and b
    dec b
    ld b, $01
    ld e, b
    ld b, c
    ld e, $f9
    ldh a, [$ff03]
    jr z, jr_00e_77d2

    ld e, d
    pop de
    ld e, [hl]
    or c
    ccf
    rrca
    jr c, @+$23

jr_00e_7780:
    ld c, a
    add c
    rrca
    ld a, b
    ld a, b
    ld h, h
    ld h, h
    cpl
    ld c, b
    cp a
    ccf
    scf
    rrca
    ld b, l

jr_00e_778e:
    ld c, $fc
    inc hl
    inc a
    inc a
    adc e
    ld c, $26
    rra
    add e
    ld [$4803], sp
    ld e, c
    rrca
    xor l
    rra
    ret


    ld c, $ef
    ld a, [hl]
    ld a, h
    ld a, h
    ld l, h
    nop
    nop
    ld l, [hl]
    ld l, [hl]
    rlca
    ld a, [hl]
    ld a, l
    adc b
    sbc a
    cpl
    add b
    rra
    ld h, h
    ld h, h
    ld a, b
    ld a, b
    nop
    nop
    xor c
    rra
    xor e
    rrca
    ld c, a
    jr z, jr_00e_781c

    jr jr_00e_778e

    jr c, jr_00e_7780

    ld e, b
    inc b
    ld h, b
    jr nz, @+$09

    rlca
    inc b
    inc bc
    inc bc
    ld e, l
    ld b, c
    ld [hl], $61
    ld h, b
    and b

jr_00e_77d2:
    ldh [rNR41], a
    ret nz

    ret nz

    ld d, l
    ld c, c
    add b
    add b
    ld e, $5e
    cp a
    ld bc, $6240
    add hl, bc
    ld l, b
    ld bc, $3803
    rst $38
    ld bc, $fd01
    ld bc, $2b40
    ld c, b
    cpl
    db $10
    dec l
    ld d, b
    inc bc
    dec sp

jr_00e_77f3:
    jr nz, jr_00e_77f3

    nop
    ld bc, $fc00
    nop
    ld sp, hl
    ld bc, $03fb
    ld hl, sp+$4b
    jr nz, jr_00e_7811

    nop
    and $e0
    ldh a, [rNR10]
    di
    ld [$f360], sp
    rlca
    ld b, $5b
    ld [$00c0], sp

jr_00e_7811:
    rra
    rra
    ld a, a
    ld h, b
    ldh [$ff80], a
    add b
    push de
    add hl, bc
    dec [hl]
    db $10

jr_00e_781c:
    jr c, jr_00e_781e

jr_00e_781e:
    ld [hl-], a

jr_00e_781f:
    jr c, jr_00e_781f

    add $c6
    ld [bc], a
    ld b, $02

jr_00e_7826:
    inc c
    inc b
    ld c, a
    ld e, b
    rst $38
    nop
    ld a, e
    ld c, b
    add a
    ld [$80bc], sp
    nop
    inc b
    cp c
    add c
    and e
    add d
    xor [hl]
    adc h
    adc h
    adc b
    sbc b
    sub b
    ld bc, $7808
    ld a, b
    rst $38
    add a
    add a
    ld bc, $4c00
    ld b, d
    add hl, de
    ld bc, $c2cb
    pop hl
    ld hl, $1e3e

jr_00e_7851:
    inc e
    inc b
    jr c, jr_00e_786d

    ld h, d
    jr nz, jr_00e_7826

    nop

jr_00e_7859:
    ld b, b
    ld b, b
    pop hl
    pop hl
    ldh a, [rNR10]
    call c, Call_00e_788c
    ld c, b
    cp $86
    db $fc
    db $fc
    ld bc, $01fb
    ret nz

    nop
    nop

jr_00e_786d:
    nop
    ldh [$ffc0], a
    jr nc, jr_00e_7892

    or b
    jr nz, @-$66

    db $10
    reti


    db $10
    rst $18
    ld de, $0ece
    dec c
    nop
    ld b, b
    inc b
    dec c
    inc b
    add hl, sp
    ld [$3073], sp
    rst $00
    ld b, b
    rst $18
    ret nz

    rra
    nop

Call_00e_788c:
    ld a, a
    cp e
    db $10
    ldh a, [rP1]
    nop

jr_00e_7892:
    nop
    rst $00
    rlca
    sbc a
    jr jr_00e_7851

jr_00e_7898:
    jr nz, jr_00e_7859

    ld hl, $1e9e
    rlca
    nop
    ld [hl], e
    ld [hl], b
    ld hl, sp+$00
    ld [$8f88], sp
    rlca
    add a
    nop
    ldh [$ff80], a
    ld [hl], b
    ld h, b
    jr @+$12

    push hl
    jr jr_00e_78ee

    inc a
    rst $38
    jp Jump_00e_4002


    jp Jump_000_1a95


    nop
    add a
    nop
    ld [hl-], a
    jr nc, @+$7a

    ld c, b
    call $8785
    ld [bc], a
    ld [bc], a
    call nc, $f802
    ld b, b
    nop
    nop
    add e
    inc bc
    ccf
    inc a
    db $fc
    ld h, d
    ld sp, $0007
    di
    ldh a, [$fff8]
    ld [$070f], sp
    rlca
    add e
    ld [hl+], a
    push bc
    ld a, [hl+]
    ld e, l
    ld bc, $0002
    ld hl, sp-$08
    rst $38
    ld de, $8120
    sbc a
    ld [bc], a
    ld a, a
    ld b, e

jr_00e_78ee:
    jp Jump_000_110b


    inc bc
    nop
    nop
    nop
    ccf
    inc bc
    db $fd
    ld bc, $017d
    dec a
    ld bc, $8181
    ld sp, hl
    ld a, c
    ld [hl], c
    ld de, $21e5
    ld b, h
    ld [$91f5], sp
    push hl
    jr jr_00e_7898

    adc b
    xor h
    ld bc, $a600
    add h
    or e
    add d
    scf
    ld l, e
    ld h, b

jr_00e_7917:
    jr nz, jr_00e_7955

    inc e
    nop
    nop
    ld e, $02
    inc bc
    ld bc, $0003
    rlca
    ld [bc], a
    dec c
    dec b
    ld b, $02
    cp $82
    jp $0281


    nop
    pop bc
    ld e, c
    ld bc, $0003
    rst $00
    ld bc, $c6fe
    jr c, @+$3a

    ld h, b
    nop
    ccf
    nop
    sbc a
    add b
    add b
    ld bc, $40cf
    rst $28
    jr nz, @-$0f

    jr nz, jr_00e_7917

    pop hl
    nop
    db $db
    add hl, bc
    db $fc
    nop
    pop hl
    ld bc, $0ecf
    sbc $00
    ld b, b

jr_00e_7955:
    db $10
    ret c

    db $10
    db $db
    db $10
    ret nz

    nop
    rst $08
    rrca
    rra
    db $10
    ldh a, [$ffe0]
    ldh [$ff8b], a
    add hl, de
    rst $38
    add a
    dec b
    add hl, bc
    jr @-$61

    dec hl
    and c
    add hl, bc
    nop
    nop
    ld bc, $5f00
    nop
    ld bc, $0600
    and c
    ld bc, $3c7c
    ret nz

    ld b, b
    add h
    nop
    nop
    add b
    ld d, c
    ld de, $1c5c
    ld e, c
    jr jr_00e_79cb

    nop
    sub a
    db $10
    ld h, l
    ld h, c
    call $ddc1
    stop
    pop bc
    sbc l
    add c
    dec a
    dec h
    ld [hl+], a
    cp e
    add d
    cp e
    add d
    cp c
    add c
    cp l
    add c
    cp h
    add b
    cp [hl]
    dec d
    nop
    ld bc, $bf00
    ld b, b
    db $10
    add b
    ld b, a
    nop
    ret nz

    add b
    ret nz

    add b
    ld [hl], c
    ld b, b
    add hl, sp
    jr nc, jr_00e_79b9

    ld bc, $0101

jr_00e_79b9:
    and b
    ld c, a
    nop
    inc de
    ld bc, $127e
    xor $6a
    add [hl]
    add [hl]
    sub d
    add d
    inc bc
    nop
    ld a, l
    ld a, [bc]
    ccf

jr_00e_79cb:
    ld a, c
    ld de, $0002
    rst $38
    ld a, a
    ld bc, $13df
    call z, $e00c
    nop
    db $e3
    inc bc
    rst $28
    inc c
    call z, $9808
    db $10
    inc b
    inc bc
    jr nc, jr_00e_7a04

    adc a
    dec bc
    db $fd
    add h
    adc h
    inc b
    rlca
    call nc, $8522
    add hl, bc
    jr nc, jr_00e_7a11

    ld [hl], $20
    rst $28
    add $8c
    add c
    db $db
    ld a, [bc]
    rst $28
    ld [$4c47], sp
    add b
    nop
    pop bc
    or b
    jr jr_00e_7a5f

    inc d

jr_00e_7a04:
    ld b, b
    nop
    ldh [rLCDC], a
    or b
    and b

jr_00e_7a0a:
    ld h, a
    ld e, h
    ld b, $00
    db $10
    halt
    inc h

jr_00e_7a11:
    add e
    ld [$0001], sp

jr_00e_7a15:
    rrca
    ld bc, $0e1e
    inc e
    inc b
    ld a, h

jr_00e_7a1c:
    inc d
    db $ed
    ld l, l
    add l
    nop
    and b
    add l
    adc d
    adc d
    and d
    add d
    add hl, sp
    ld bc, $007c
    scf
    jr nc, jr_00e_7a15

    ldh [$ff27], a
    add hl, bc
    ld a, a
    ld bc, $8020
    ld bc, $088c
    rst $28
    ld [$07e7], sp
    ldh a, [$ffd1]
    ld [bc], a
    dec d
    dec de
    pop bc
    ld b, c
    ld [hl], c
    ld sp, $08f8
    ld sp, hl
    nop
    ld b, $e8
    dec e
    inc d
    call z, $e70c
    rlca
    pop af
    ld bc, $1827
    dec b
    ld a, [bc]
    jr nc, jr_00e_7a89

    ld a, d
    ld c, d
    rst $08
    ld c, d
    adc b
    add l

jr_00e_7a5f:
    dec sp
    ld c, e
    ld a, a
    rst $30
    ld [bc], a
    ld h, b
    ld b, b
    ld bc, $3838
    jr nz, jr_00e_7a0a

    jr jr_00e_7a1c

    ld e, b
    ret nz

    add b
    ld b, $bb
    add hl, bc
    dec b
    nop
    ld e, l
    ld bc, $1001
    dec h
    jp Jump_00e_6381


    ld b, c
    ld h, [hl]
    ld b, d
    ld a, $26
    ret c

    ret c

    rst $00
    ld b, b
    jp $1000


jr_00e_7a89:
    ld b, b
    ld a, e
    jr c, jr_00e_7abd

    jr nz, jr_00e_7aa7

    db $10
    ld c, h
    ld [$08ec], sp
    db $ed
    ld bc, $e700
    inc b
    di
    nop
    jr nz, jr_00e_7a9f

    jr c, @+$12

jr_00e_7a9f:
    ld l, h
    jr z, @-$38

    ld b, h
    rst $10
    ld b, h
    sub e
    add e

jr_00e_7aa7:
    cp b
    add b
    dec bc
    dec bc
    jr jr_00e_7ab5

    ld [$3310], sp
    db $10
    scf
    ld bc, $f700

jr_00e_7ab5:
    db $10
    rst $30
    ret nc

    jr nz, @+$22

    inc hl
    inc hl
    cp e

jr_00e_7abd:
    dec de
    adc a
    nop
    daa
    nop
    ld sp, $7720
    ld d, b
    ld h, a

jr_00e_7ac7:
    ld h, b
    cpl
    jr nz, jr_00e_7ac7

    ld b, c
    ld d, e
    db $fc
    nop
    push bc
    ld [hl], l
    inc bc
    ld bc, $c038
    add b

jr_00e_7ad6:
    add b
    and a
    rst $20
    ldh [$fff1], a
    db $10
    inc e
    inc c
    ld c, $41
    ld [bc], a
    add c
    jr @-$03

    dec de
    inc sp
    ld a, [bc]
    rst $18
    ld b, b
    ld bc, $c708
    ei
    nop
    db $eb
    ld bc, $4c0f
    rst $08
    ld [$3d30], sp
    inc bc
    call z, Call_000_0093
    ld bc, $4f08
    add hl, hl
    ld hl, $031a
    ld bc, $1033
    ld h, a
    jr nz, jr_00e_7ad6

    ld b, h
    add a
    ld b, b
    sbc a
    pop de
    ld de, $007f
    ld b, a
    dec b
    inc b
    db $fc
    dec sp
    ld sp, $0c57
    rra
    ld a, [bc]
    dec sp
    ld [bc], a
    ei
    ld [bc], a
    rla
    jr z, jr_00e_7b20

jr_00e_7b20:
    nop
    add a
    add l
    xor a
    adc c
    adc a
    adc c
    adc $4e
    ldh a, [$ff30]
    db $fc
    call z, $323e

jr_00e_7b2f:
    adc a
    rrca
    ld bc, $0b0c
    inc c
    ld a, l
    ld b, l
    db $dd
    adc l
    pop af
    sub c
    ld [hl], h
    ld d, b
    ld h, [hl]
    adc l
    dec b
    inc de
    ld a, [bc]
    rra
    nop

jr_00e_7b44:
    jp Jump_000_00c0


    ld d, [hl]
    ei
    jr c, jr_00e_7b44

    adc b
    ld a, l
    ld [hl], h
    dec c
    inc c
    cp $4d
    ld d, b
    ld c, e
    inc b
    add b
    adc a
    ld [$d1b0], sp
    inc de
    ret c

    ld c, b
    call $9810
    db $10
    ld e, l
    ld a, [bc]
    inc bc
    ld bc, $09d9
    jr nc, jr_00e_7b80

    ld de, $5d9f
    ld [hl+], a
    ld e, a
    ld a, [de]
    rst $38
    nop
    or l
    jr jr_00e_7b2f

    ld [$4038], sp
    and $04
    or $4f
    ld bc, $3ad9
    db $dd
    ld a, [bc]

jr_00e_7b80:
    inc c
    inc b
    rla
    db $10
    scf
    jr nc, jr_00e_7bfe

    ld d, b
    ld bc, $6708
    inc d
    inc b
    ld h, b
    rrca
    add hl, bc
    dec b
    ldh [$ff31], a
    inc hl
    pop af
    ld bc, $06f7
    or $31
    nop
    ld b, $06
    ccf
    add hl, sp
    ld a, c
    dec b
    nop
    db $d3
    ld bc, $bdc0
    inc d
    inc c
    nop
    ld h, l
    ld h, h
    ld [hl], c
    ld d, b
    rst $30
    sub b
    or e
    db $10
    dec de
    ld [$0619], sp
    nop
    ld [$0c4b], sp
    adc c
    ld [$20b0], sp
    inc sp
    jr nz, @+$69

    ld b, e
    ld l, h
    ld b, h
    ld l, l
    ld b, h
    ld a, c
    ld c, b
    ld h, a
    ld l, h
    ld h, b
    jr nz, jr_00e_7c3b

    rrca
    ld sp, $0d57
    ld sp, hl
    add a
    ld hl, $2d63
    sbc c
    ld [$10f3], sp
    rst $20
    ldh [rBCPD], a
    ld [$2575], sp
    ld bc, $0801
    ld bc, $0300
    rst $38
    dec c
    rst $38
    ld de, $13ff
    rst $38
    dec h
    rst $38
    db $f4
    ld c, $00
    rst $38
    add b
    rst $38
    nop
    inc c
    ld h, b
    rst $38
    db $10
    rst $38
    sub b
    rst $38
    ld c, b
    rst $38

jr_00e_7bfe:
    cp $f3
    dec sp
    ld hl, $2da3
    ld e, $0c
    di
    ld [de], a
    ld [$e380], sp
    db $e3
    ld [$329f], sp
    dec c
    inc b
    add hl, de
    ld [$089b], sp
    ei
    adc b
    ld [hl], e
    ld [hl], b
    rlca
    rst $00
    dec d
    nop
    xor b
    ld a, e
    ld c, b
    jr c, jr_00e_7c4a

    cp [hl]
    ld h, $9e
    ld [de], a
    call z, $e10c
    rst $10
    dec e
    dec h
    ld d, a
    nop
    ld de, $005f
    xor d
    ld a, e
    inc bc
    ld l, c
    stop
    ld d, e
    nop
    sub b
    ld e, e

jr_00e_7c3b:
    nop
    ld h, b
    ld h, e
    nop
    rst $30
    dec d
    dec bc
    ld c, [hl]
    add b
    dec c
    ld b, $0b
    ld c, [hl]
    add e
    rrca

jr_00e_7c4a:
    dec bc
    ld c, [hl]
    ld bc, $0006
    ld bc, $5790
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Call_00e_7e9b:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Call_00e_7fe3:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
