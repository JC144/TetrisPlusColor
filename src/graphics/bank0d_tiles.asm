; ============================================================================
; BANK $0D - Tile & Sprite Data
; ============================================================================
; Address: $4000-$7FFF (switchable)
;
; Graphics tile and sprite definitions. Binary tile pattern data.
;
; ============================================================================
; Originally disassembled with mgbdis v3.0 by Matt Currie

SECTION "ROM Bank $00d", ROMX[$4000], BANK[$d]

    ld bc, $0eb0
    ld [hl+], a
    ld h, b
    nop
    nop
    ld h, b
    inc a
    inc a
    ld h, [hl]
    nop
    jr nc, jr_00d_404a

    inc a
    nop
    nop
    jr c, jr_00d_404b

    jr jr_00d_4015

jr_00d_4015:
    jr nc, @+$11

    ld [$041c], sp
    ld [$261c], sp
    nop
    nop
    inc c
    inc c
    jr jr_00d_403b

    jr nc, jr_00d_4055

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

jr_00d_403b:
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
    jr nc, jr_00d_4079

    inc a

jr_00d_404a:
    inc a

jr_00d_404b:
    ld b, $00
    nop
    rra
    jr z, jr_00d_4081

    nop
    nop
    inc a
    inc a

jr_00d_4055:
    ld [hl-], a
    nop
    nop
    ld sp, hl
    sbc h
    cpl

jr_00d_405b:
    ld [$3e3e], sp
    ld c, a
    jr @+$03

    jr @+$81

    jr z, @+$07

    jr z, jr_00d_40d6

    jr z, @+$20

    ld e, $41
    ld [$085f], sp
    sbc a
    jr jr_00d_40ef

    ld a, [hl]
    and l
    jr jr_00d_40e5

    sbc a
    nop
    nop
    ld a, h

jr_00d_4079:
    ld a, h
    xor a
    ld [$2805], sp
    cp a
    jr jr_00d_40e1

jr_00d_4081:
    nop

jr_00d_4082:
    db $10
    cp a
    jr jr_00d_40a5

    jr jr_00d_405b

    jr jr_00d_40a9

    ld [$7e7e], sp
    dec e
    ld [$2733], sp
    dec b
    jr z, @+$11

    jr z, jr_00d_4112

    ld a, h
    inc sp
    jr jr_00d_40d9

    jr z, jr_00d_410a

    ld l, [hl]
    rst $38
    jr z, @+$0f

    add hl, de
    ld l, a
    jr c, jr_00d_40e0

    inc a

jr_00d_40a5:
    rrca
    ld e, c
    ld a, $3e

jr_00d_40a9:
    ld hl, $bb00
    jr z, jr_00d_411a

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
    jr jr_00d_4135

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

jr_00d_40d6:
    ldh a, [$ff61]
    ld e, d

jr_00d_40d9:
    ld c, [hl]
    ld c, [hl]
    ld b, [hl]
    nop
    nop
    ld a, a
    ld a, c

jr_00d_40e0:
    rst $18

jr_00d_40e1:
    jr z, jr_00d_4082

    ld c, b
    and c

jr_00d_40e5:
    add hl, de
    ld l, h
    ld l, h
    ld [hl], $36
    rst $38
    ld e, b
    sbc a
    jr @+$68

jr_00d_40ef:
    add b
    db $e4
    ld h, [hl]
    jr nc, jr_00d_4124

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

jr_00d_410a:
    nop
    reti


    ld [$0000], sp
    ld b, d
    nop
    nop

jr_00d_4112:
    sbc l
    jr jr_00d_4174

    add hl, de
    dec de
    ld [$1a01], sp

jr_00d_411a:
    inc h
    inc h
    rrca
    jr jr_00d_4130

    jr c, jr_00d_4170

    ld [$e4f0], sp

jr_00d_4124:
    ld a, [hl]
    ld a, [hl]
    ld b, $06
    dec c
    ld a, [de]
    ld c, a
    add hl, de
    ld c, a
    ld c, d
    ld d, c
    add hl, de

jr_00d_4130:
    ld b, d
    ld b, d
    ld b, c
    jr jr_00d_4159

jr_00d_4135:
    inc h
    rst $28
    ld [$2a65], sp
    ld e, e
    ld a, [bc]
    and c
    call Call_00d_5a7b
    db $10
    db $10
    jr nz, jr_00d_4164

    adc l
    ld a, [bc]
    ld a, [bc]
    nop
    nop
    sub l
    ld c, d
    ld d, b
    nop
    nop
    sbc a
    ld e, d
    ld c, $0e
    ret


    ld [$18cf], sp
    cpl
    ld b, b
    ld h, l

jr_00d_4159:
    ld a, [bc]
    reti


    jr jr_00d_41b4

    ld a, [bc]
    ld b, l
    ld [$0028], sp
    nop
    ld [de], a

jr_00d_4164:
    ld [de], a
    ld a, [hl+]
    ld a, [hl+]
    ld b, h
    ld b, h
    ld a, [hl-]
    ld a, [hl-]
    rst $08
    ld a, [bc]
    ld b, d
    db $10
    ld [bc], a

jr_00d_4170:
    ld b, d
    sbc c
    sbc c
    and c

jr_00d_4174:
    nop
    nop
    sbc c
    sbc c
    ld b, d
    ld b, d
    ld [hl], a
    ld [$4242], sp
    cp c
    cp c
    and l
    and l

jr_00d_4182:
    cpl
    ld b, [hl]
    inc bc
    ld [$080f], sp
    rst $38
    ld l, d
    ld hl, $630a
    nop
    nop
    ld a, [hl]
    ld a, [hl]
    ld [hl], b
    nop
    db $10
    ld h, c
    ld a, [hl+]
    ld a, a
    ld a, a
    ld [hl], e
    nop
    stop
    ld c, b
    ld [bc], a
    nop
    ld a, a
    ld a, a
    ld e, a
    ld a, [bc]
    ld a, a
    ld a, a
    rra
    ld [$7f7f], sp
    pop hl
    ld a, [bc]
    ld h, e
    ld h, e
    ld h, b
    ld h, b
    ld a, $3e
    ret nz

    dec sp
    rlca

jr_00d_41b4:
    rlca
    ld h, a
    ld h, a
    ccf
    ccf
    ccf
    jr z, jr_00d_41e9

    jr @+$31

    jr jr_00d_4201

    dec bc
    inc e
    nop
    jr nz, jr_00d_41e4

    ld e, b
    add c
    ld a, [bc]
    ld hl, sp-$08
    ld [hl+], a
    adc b
    call z, RST_00
    cp $fe
    and $00
    nop
    cp $fe
    nop
    nop
    add $00
    db $10
    ld a, h
    ld a, h
    jr c, jr_00d_41df

jr_00d_41df:
    db $10
    add c
    jr jr_00d_4182

    dec sp

jr_00d_41e4:
    rrca
    rrca
    ccf
    ccf
    rst $38

jr_00d_41e9:
    rst $38
    xor a
    dec sp
    cp $fe
    rst $38
    nop
    nop
    cp a
    ld c, e
    add b
    add b
    ldh [rP1], a
    inc d
    ldh [rSB], a
    ld bc, $0303
    rlca
    rlca
    rrca
    rrca

jr_00d_4201:
    rra
    nop
    nop
    ccf
    nop
    nop
    rst $38
    rst $38
    db $dd
    ld [$dd0c], sp
    adc b
    adc b
    dec de
    ld [$c0c0], sp
    ldh [c], a
    ldh [c], a
    rst $30
    rst $30
    rrca
    jr z, @-$07

    dec bc
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    ld [hl], a
    nop
    sbc h
    ldh a, [$fff0]
    ld hl, sp-$08
    db $fc
    db $fc
    ld a, [hl]
    ld a, [hl]
    ccf
    ccf
    cpl
    ld [$08cf], sp
    ld c, a
    ld c, b
    add b
    add b
    rra
    inc a
    add $36
    inc bc
    nop
    db $10
    cpl
    inc a
    adc a
    adc a
    adc [hl]
    nop
    nop
    ccf
    inc a
    db $e3
    nop
    db $10
    ld c, a

jr_00d_4247:
    inc a
    add e
    nop
    db $10
    ld e, a
    inc a
    ld hl, sp-$08
    sub b
    ld h, c
    ld sp, hl
    ld sp, hl
    ei
    ei
    rrca
    ld c, b
    db $fc
    db $fc
    rst $28
    ld [$2c81], sp
    ld a, $3e
    ld a, a
    ld a, a
    rst $08
    ld e, b
    pop de
    ld [$087f], sp
    ld bc, $7d7f
    ld a, l
    ld c, a
    dec de
    ld a, h
    ld a, h
    ld a, [hl]
    ld a, [hl]
    ld hl, $df08
    rst $18
    adc a
    adc a
    rlca
    rlca
    inc bc
    nop
    rlca
    inc bc
    ld bc, $2301
    inc hl
    ld [hl], a
    ld [hl], a
    ret nz

    nop
    ld h, b
    and l
    jr jr_00d_428e

    jr c, @-$70

    adc [hl]
    sbc [hl]
    sbc [hl]

jr_00d_428e:
    sbc h
    ld bc, $0008
    db $10
    sbc a
    sbc a
    cp a
    cp a
    cp h
    cp h
    db $e3
    db $e3
    di
    di
    ret


    add hl, de
    di
    di
    ei
    ei
    ld l, h
    jr jr_00d_4321

    ld a, e
    and l
    jr jr_00d_42af

    ld l, b
    ei
    nop
    db $10
    pop bc

jr_00d_42af:
    ld [$dede], sp
    adc [hl]
    adc [hl]
    rlca
    add hl, bc
    inc bc
    jr jr_00d_4247

    adc [hl]
    rst $30
    ld a, [hl]
    ld b, $f7
    rst $20
    jr @+$07

    jr z, jr_00d_42de

    jr c, jr_00d_42ea

    jr jr_00d_433a

    add hl, bc
    ld a, e
    add hl, bc
    rrca
    rrca
    and e
    jr @-$5b

    add hl, bc
    rst $38
    rst $38
    ld a, a
    ld a, a
    ld a, $80
    add hl, de
    ld a, $1c
    inc e
    jr c, jr_00d_4314

    ld [hl], b
    ld [hl], b

jr_00d_42de:
    ld d, e
    ld e, c
    dec [hl]
    add hl, bc
    rst $30
    rst $30
    dec e
    ld [$2d87], sp
    cp h
    cp h

jr_00d_42ea:
    cp b
    ldh [c], a
    ld hl, $f7b8
    ld c, c
    ld a, e
    ld a, e
    dec sp
    nop
    db $10
    ld d, l
    add hl, sp
    sbc e
    jr jr_00d_4309

    ld c, b
    ld sp, hl
    ld sp, hl

jr_00d_42fd:
    ld hl, sp-$08
    rst $00
    dec l
    sbc $de
    ld [hl], b
    ldh [$fffe], a
    cp $fc
    db $fc

jr_00d_4309:
    rrca
    jr c, jr_00d_42fd

    add hl, bc
    ld e, a
    ld c, b
    rst $38
    rst $38
    ccf
    ccf
    rrca

jr_00d_4314:
    rrca
    push af
    dec a
    ld b, e
    ld a, [bc]
    add l
    ld c, c
    inc b
    jp nz, $e0e0

    sbc a
    ld e, b

jr_00d_4321:
    nop
    nop
    dec b
    dec b
    ld a, l
    ld a, l
    ld l, l
    ld a, [bc]
    ld [$1008], sp
    db $10
    ld hl, $250d
    dec hl
    ld bc, $3900
    ld l, $20
    jr nz, jr_00d_4376

    ld a, $22

jr_00d_433a:
    ld [hl+], a
    ld d, h
    ld d, h
    inc c
    inc c
    ld [$3008], sp
    jr nc, jr_00d_4349

    ld b, b
    ld c, b
    dec b
    dec h
    dec h

jr_00d_4349:
    ld a, b
    ld a, b
    dec h
    nop
    db $10
    ld b, h
    ld b, h
    ld c, b
    ld c, b
    ld d, c
    ld c, $02
    ld [bc], a
    db $dd
    dec de
    jr nz, jr_00d_4362

    nop
    jr nz, @+$20

    ld e, $2f
    ld [$6666], sp

jr_00d_4362:
    add hl, hl
    add hl, hl
    ld sp, $6131
    ld h, c
    ld [hl+], a
    ld [hl+], a
    inc h
    inc h
    nop
    ldh [rP1], a
    nop
    ld h, $26
    ld l, d
    ld l, d
    ld a, [hl+]
    ld a, [hl+]

jr_00d_4376:
    ld [hl-], a
    ld [hl-], a
    ld h, d
    ld h, d
    ld hl, $0000
    ld e, a
    dec bc
    ld l, c
    ld [$00a1], sp
    ld bc, $0808
    ld [$0606], sp
    sub c
    inc c
    ld b, c
    nop
    db $10
    ld b, b
    ld b, b
    ld d, b
    ld d, b
    jr nz, jr_00d_43b4

    inc b
    inc b
    inc b
    ld [hl+], a
    ld a, a
    ld a, a
    inc bc
    jr jr_00d_43d9

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
    ld [$0400], sp
    inc b
    ld [$0000], sp
    ld a, a
    ld a, a

jr_00d_43b4:
    db $10
    db $10
    inc hl
    inc hl
    ld a, h
    ld a, h
    ld [de], a
    ld [de], a
    jr nz, jr_00d_43de

    inc b
    ld a, $1f
    rra
    ld d, a
    inc c
    ld e, $1e
    ld [hl+], a
    ld [hl+], a
    ld b, d
    ld b, d
    dec e
    ld [$0c21], sp
    db $eb
    inc c
    rst $28
    inc c
    rrca
    jr z, @+$80

    ld a, [hl]
    ld b, b
    inc c
    ld [bc], a

jr_00d_43d9:
    ld [bc], a
    inc d
    inc d
    jr jr_00d_43f6

jr_00d_43de:
    ld [hl], e
    ld [$2020], sp
    ld b, b
    nop
    jr nz, @+$09

    dec c
    ld b, h
    ld b, h
    jr c, jr_00d_4423

    inc e
    ldh a, [$ff3e]
    ld a, $53
    ld [$0857], sp
    add hl, hl
    rra
    adc b

jr_00d_43f6:
    adc b
    ret c

    ret c

    xor b
    xor b
    adc b
    nop
    nop
    add hl, sp
    ld a, h
    nop
    ld hl, sp+$00
    ld hl, sp+$0f
    ld bc, $f800
    nop
    ld hl, sp+$00
    ld hl, sp+$07
    cp b
    ei
    ei
    rst $38
    di
    ld bc, $e300
    rst $38
    db $e3
    ei
    jp $c3fb


    db $10
    ld [$83f3], sp
    rst $38

jr_00d_4420:
    rst $30
    rrca
    db $10

jr_00d_4423:
    pop af
    db $fd
    pop af
    db $fd
    ldh a, [$fffc]
    ld bc, $cf00
    rst $08
    rst $28
    rst $08
    ld [hl+], a
    nop
    rst $38
    ld bc, $4f38
    rst $18
    rst $18
    rrca
    ld [$c7f7], sp
    rst $30
    jp $c3f3


    pop af
    pop bc
    ldh a, [c]
    jp nz, Boot

    sbc a
    sbc a
    rst $18
    sbc [hl]
    rst $38
    sbc [hl]
    rst $38
    sbc h
    ld bc, $9800
    rst $38
    sbc b
    cp $90
    ld a, [hl]
    ld a, [hl]
    ld a, [bc]
    nop
    rst $38
    ld bc, $7f20
    ld bc, $f910
    ld sp, hl
    db $fd
    ld a, c
    rst $38
    ld a, c
    rst $38
    add hl, sp
    cp a
    add hl, sp
    cp a
    add hl, de
    sub b
    nop
    sbc a
    add hl, de
    sbc a
    add hl, bc
    rrca

jr_00d_4471:
    nop
    ld sp, hl
    rst $38
    ld bc, $c140
    add c
    pop hl
    pop hl
    pop af
    pop af
    ld sp, hl
    pop af
    add e
    nop
    rla
    jr z, jr_00d_4420

    inc b
    ld hl, sp-$02
    ld hl, sp-$01
    ld hl, sp+$23
    jr z, jr_00d_44c3

    scf
    ld a, e
    ld h, e
    db $fd
    pop hl
    db $fc
    ldh a, [$ff60]
    ld [bc], a
    cp $f8
    cp $fc
    rst $38
    ld bc, $4305
    inc b
    db $fc
    rst $38
    ld bc, $7c08
    ld a, a
    ld a, h
    ccf
    inc a
    rra
    ret nz

    ld h, c
    inc e
    di
    add e
    ld h, e
    inc bc
    inc hl
    inc b
    ld b, h
    or e
    ld [$4803], sp
    ld a, a
    ld c, a
    ccf
    rrca
    sbc h
    inc bc
    ld bc, $f730
    jr nz, jr_00d_44c1

jr_00d_44c1:
    add $ff

jr_00d_44c3:
    adc $ff
    sbc $01
    nop
    adc $f7
    add $f3
    jp nz, $c1f1

    ld l, [hl]
    nop

jr_00d_44d1:
    xor h
    db $10
    inc bc
    nop
    add h
    nop
    add b
    ld bc, $8018
    ret nz

    add b
    or l
    jr @+$07

    jr c, jr_00d_4471

    add hl, bc
    add a
    ld bc, $0183
    ld e, $80
    add c
    ld bc, $bb30
    ld c, b
    rst $00
    jr nz, jr_00d_451c

    add hl, bc
    pop hl
    ld sp, hl
    add c
    pop hl
    ld bc, $01c1
    pop bc
    add c
    rst $38
    cp l
    nop
    rrca
    nop
    ld bc, $e518
    jr nz, @+$0f

    inc d
    ld l, l
    dec c
    rrca
    rrca
    add a
    add a
    jp $8fc3


    adc h
    rst $00
    call nz, $e0e3
    and b
    ld h, [hl]
    pop af
    ldh a, [$fff8]
    ldh a, [$fffc]
    jp hl


jr_00d_451c:
    ld [$bffc], sp
    ld c, h
    ld bc, $0722
    cp a
    ld d, b
    nop
    db $fc
    dec b
    ld b, $bc
    jr c, @+$09

    nop
    ld [bc], a
    nop
    inc bc
    nop
    di
    jp $c3f7


    rst $30
    rst $00
    sub c
    ld de, $ffdf
    nop
    rst $30
    nop
    ldh [rNR43], a
    ld h, h
    add b
    ld bc, $0040
    ldh [rP1], a
    cp a
    ld c, b
    ccf
    nop
    rra
    nop
    cp c
    jr c, jr_00d_44d1

    ld bc, $08e5
    ld a, e
    ld c, c
    cp $00
    dec [hl]
    nop
    ld a, [hl]
    nop
    pop hl
    pop bc
    pop hl
    pop bc
    pop af
    add c
    ld hl, $0ffc
    ld [$21e1], sp
    ld e, $6d
    ld d, $00
    ld a, a
    ld [bc], a
    and b
    nop
    ld l, l
    add hl, bc
    ld a, a
    ld a, h
    ld a, a
    jr c, jr_00d_45f4

    jr c, @+$80

    ld [hl], b
    cp h
    nop
    ret c

    ccf
    inc c
    add b
    ld bc, $6750
    inc [hl]
    and d
    ld b, $01
    ld c, b
    db $e3
    dec b
    inc b
    rst $38
    ld bc, $2f48
    ld [$ff87], sp
    add h
    ld bc, $8700
    add hl, bc
    db $10
    cpl
    ld [$fff0], sp
    ld a, [bc]
    ld [$0108], sp
    nop
    ldh a, [$ff39]
    nop
    rst $38
    adc a
    adc a
    ret z

    ld c, a
    ld hl, sp+$2f
    ld bc, $4f20
    ld hl, sp-$71
    ldh [$ffb0], a
    ld [de], a
    ldh [$ff30], a
    ldh [$ff38], a
    ld bc, $0340
    ld b, $42
    ld bc, $4140
    sub l
    ld b, $02
    add e
    ld bc, $8730
    inc b
    pop af
    jr nz, jr_00d_45e9

    pop af
    ei
    ld [de], a
    rst $38
    inc d
    ld bc, $1200
    db $fd
    ld de, $10fd
    db $fc
    db $10
    adc a
    db $10
    rrca
    rst $38
    ld b, [hl]
    ld de, $0310
    nop
    cp a

jr_00d_45e1:
    jr jr_00d_45e1

    rst $38
    ld [bc], a
    scf
    ld [bc], a
    nop
    ld d, c

jr_00d_45e9:
    ld [bc], a
    inc b
    rst $38
    add d
    ld bc, $ff00
    rst $38
    ld bc, $1bbf

jr_00d_45f4:
    ld bc, $c350
    jr nc, jr_00d_4628

    dec h
    call $0f08
    ld c, b
    call $fc08
    rra
    ld b, b
    ret


    ld [$000f], sp
    cp a
    cpl
    ld b, b
    ld d, h
    ld c, e
    ld hl, sp+$0f
    add sp, $7b
    nop
    xor c
    ld hl, $1b6a
    ccf
    ld c, [hl]
    db $10
    ld e, a
    ld b, b
    ld a, [hl]
    nop
    ld l, a
    ld c, b
    ld a, a
    ld b, b
    cp a
    jr nc, @+$01

    rrca
    rst $18
    nop
    rst $08
    dec b

jr_00d_4628:
    ld e, b
    xor a
    dec l
    ld hl, sp+$7f
    ld h, b
    rla
    rst $38
    ld h, h
    rst $38
    add a
    ei
    nop
    pop hl
    cp a
    dec a
    sbc a
    ld e, b
    ld [bc], a
    ld l, l
    ld bc, $8ef8
    rlca
    cp $29
    ld [bc], a
    rst $28
    dec h
    sub e
    ld de, $007f
    ccf
    rst $38
    dec l
    db $ed
    ld [$40df], sp
    nop
    inc a
    inc bc
    inc bc
    inc b
    rlca
    dec b
    rrca
    ld [hl], b
    ld l, a
    dec b
    add hl, de
    ld a, $02
    ld [$3c20], sp
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
    ld [$4803], sp
    nop
    nop
    nop
    nop
    inc c
    inc c
    ld d, $16
    ld hl, $4d29
    ld d, l
    db $fd
    adc c
    ld a, l
    ld d, c
    dec hl
    ld hl, $0003
    nop
    inc bc
    dec c
    inc c
    rra
    rra
    ld a, a
    ld h, b
    rst $30
    adc a
    cp e
    ld a, a
    db $ed
    sub $f9
    dec l
    ld hl, sp+$00
    nop
    ld hl, sp-$79
    add a
    rst $38
    pop af
    rst $28
    ld e, $fd
    db $e3
    sbc e
    db $fc
    ld h, a
    ld e, a
    db $ec
    rst $18
    nop
    nop
    nop
    nop
    ld b, $06
    add a
    add l
    bit 1, l
    db $eb
    xor l
    db $eb
    ld l, l
    cp $1a
    cp h
    call nz, RST_00
    add b
    nop
    jr jr_00d_46d5

    ld h, h
    ld h, h
    cp h
    xor h
    or d
    add d
    ld d, d
    ld d, d
    ld c, d
    ld c, d
    or h
    or h
    and b
    inc a
    ld b, b
    ld b, b
    ld bc, $0201
    ld [bc], a
    ld b, $04
    or b
    inc e

jr_00d_46d5:
    rra
    rra
    rst $20
    and $c3
    ld b, c
    ret nz

    ld c, e
    scf
    add b
    nop
    ret nz

    add b
    ldh [$ff60], a
    ldh a, [rNR10]
    cp b
    adc b
    call c, Call_000_1944
    jr @+$06

    inc b
    ld [bc], a
    nop
    jr jr_00d_476f

    rlca
    nop
    nop
    ld bc, $f201
    jp c, $f515

    ld [hl], c
    ld [hl], c
    ld l, c
    add hl, hl
    inc l
    jr z, jr_00d_477a

    ld [hl], b
    cp b
    ret z

    nop
    nop
    ld c, h
    sbc b
    ccf
    ld l, e
    ld a, $2e
    dec e
    dec d
    dec h
    dec h
    inc b
    inc b
    ld [hl], e
    ld [hl], b
    db $10
    ld [hl], b
    nop
    nop
    ld b, c
    jr nc, jr_00d_479b

    jp $e2be


    ld l, a
    or c
    rst $38
    ld sp, $5efe
    ldh a, [$ff50]
    add sp, $78
    ld b, b
    nop
    add sp, -$68
    dec b
    dec b
    dec c
    add hl, bc
    nop
    ld [$0e0f], sp
    dec e
    ld de, $6b77
    cp $86
    add b
    nop
    nop
    nop
    add a
    inc bc
    db $fc
    inc e
    rst $20
    db $e3
    inc a
    inc e
    ldh [$ffe0], a
    and b
    jr nz, @+$77

    jr nc, jr_00d_47ca

    nop
    nop
    ld b, h
    rst $38
    rst $38
    rla
    nop
    rst $38
    cp $df
    ld c, l
    ld h, l
    ld h, l
    or $72
    rst $30
    or e
    nop
    nop
    nop
    nop
    jr c, jr_00d_479d

    db $fc
    db $f4
    adc [hl]
    adc d
    sbc [hl]
    ld b, $bf
    dec h
    sbc a
    sbc c

jr_00d_476f:
    cp e
    sub l
    and [hl]
    nop
    nop
    inc e
    rst $38
    sbc e
    ld h, a
    ld h, d
    ld l, a

jr_00d_477a:
    ld c, l
    ccf
    dec [hl]
    scf
    dec h
    daa
    inc hl
    daa
    jr nz, @+$05

    nop
    nop
    ld hl, $870e
    cp h
    rst $38
    cp h
    cpl
    ld a, e
    rst $08
    db $fd
    cp e
    cp $21
    rst $38
    add sp, $68
    nop
    ld [bc], a
    sbc b
    ld l, b
    sbc b

jr_00d_479b:
    ret nc

    or b

jr_00d_479d:
    and b
    ldh [rLCDC], a
    ld b, b
    or l
    ld [$8080], sp
    xor [hl]
    jp c, Jump_00d_7c7c

    ld [$0200], sp
    ld [bc], a
    ld bc, $03ea
    ld bc, $0301
    inc bc
    dec b
    inc b
    ld a, a
    ld a, h
    ld [hl], b
    ld h, b
    jr nz, @+$22

    ld bc, $a700
    rlca

jr_00d_47c0:
    jp $3cbc


    ld a, a
    ld l, e
    rst $28
    and l
    cp a
    inc b
    inc c

jr_00d_47ca:
    inc b
    rra
    ld a, [bc]
    cp a
    ld sp, $0000
    db $fd
    ret z

    ld sp, hl
    sbc d
    rst $30
    ld h, d
    db $db
    sub c
    cp $82
    call c, Call_00d_605c
    jr nz, jr_00d_47c0

    jr nz, jr_00d_47ea

    add b
    ldh [$ffa0], a
    ret nz

    cp $00
    nop
    nop

jr_00d_47ea:
    cpl
    daa
    dec de
    ld a, [de]
    rra
    inc d
    rrca
    ld [$cb0e], sp
    inc b
    nop
    nop
    rla
    inc e
    inc d
    rra
    ei
    ld [$99f3], sp
    rst $38
    ld e, [hl]
    ldh a, [rNR13]
    rst $30
    inc de
    db $fc
    db $fc
    add b
    rrca
    db $fc
    inc b
    ld a, $02
    ret nz

    ret nz

    ld b, b
    ld bc, $cb10
    inc b
    jp c, $d516

    add hl, de
    sbc a
    ld c, e
    ld b, $fe
    rst $38
    dec [hl]
    nop
    nop
    ret z

    ld c, b
    sub e
    add c
    or $82
    rst $28
    ld b, e
    rst $28
    inc h
    cp a
    sbc e
    sbc a
    sub c
    adc a
    adc a
    jr jr_00d_4832

jr_00d_4832:
    ld sp, hl
    ld sp, hl
    cp a
    add hl, sp
    rlca
    di
    add hl, bc
    or a
    and c
    rst $28
    pop bc
    cp a
    ld c, $ff
    ld hl, sp-$0c
    ret nz

    cp e
    jr nz, jr_00d_4866

    nop
    ld c, a
    ld bc, $0207
    ld l, [hl]
    ld [de], a
    add b
    ld a, a
    ld h, b
    rst $38
    jr nz, @+$01

    ret nz

    jp hl


    dec bc
    push af
    xor $00
    nop
    ld a, [hl-]
    or $ee
    ld l, $ef
    dec h
    add sp, $34
    cp $1c
    ei
    dec bc

jr_00d_4866:
    ld sp, hl
    ld [$027e], sp
    nop
    nop
    ld a, a
    ld [bc], a
    ld a, l
    rrca
    pop af
    rst $38
    ld [hl], e
    ld c, $3f
    ld b, $fb
    ld a, [$82c3]
    ld a, a
    ld a, a
    nop
    inc b
    jr c, @+$41

    ccf
    inc b
    rra
    inc b
    adc a
    adc h
    rst $38
    ld [hl], b
    add hl, de
    inc c
    inc b
    rlca
    rlca
    inc b
    inc bc
    inc bc
    ld bc, $2b0c
    ld h, [hl]
    add d
    ld h, b
    and b
    ldh [rNR41], a
    ret nz

    ret nz

    and a
    cp [hl]
    ld bc, $0fa0
    ld [hl+], a
    ld h, b
    nop
    nop
    ld h, b
    inc a
    inc a
    ld h, [hl]
    nop
    jr nc, jr_00d_48e7

    inc a
    nop
    nop
    jr c, jr_00d_48e8

    jr jr_00d_48b2

jr_00d_48b2:
    jr nc, @+$11

    ld [$041c], sp
    ld [$261c], sp
    nop
    nop
    inc c
    inc c
    jr jr_00d_48d8

    jr nc, jr_00d_48f2

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

jr_00d_48d8:
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
    jr nc, jr_00d_4916

    inc a

jr_00d_48e7:
    inc a

jr_00d_48e8:
    ld b, $00
    nop
    rra
    jr z, jr_00d_491e

    nop
    nop
    inc a
    inc a

jr_00d_48f2:
    ld [hl-], a
    nop
    nop
    ld sp, hl
    sbc h
    cpl

jr_00d_48f8:
    ld [$3e3e], sp
    ld c, a
    jr @+$03

    jr @+$81

    jr z, @+$07

    jr z, jr_00d_4973

    jr z, @+$20

    ld e, $41
    ld [$085f], sp
    sbc a
    jr jr_00d_498c

    ld a, [hl]
    and l
    jr jr_00d_4982

    sbc a
    nop
    nop
    ld a, h

jr_00d_4916:
    ld a, h
    xor a
    ld [$2805], sp
    cp a
    jr jr_00d_497e

jr_00d_491e:
    nop

jr_00d_491f:
    db $10
    cp a
    jr jr_00d_4942

    jr jr_00d_48f8

    jr jr_00d_4946

    ld [$7e7e], sp
    dec e
    ld [$2733], sp
    dec b
    jr z, @+$11

    jr z, jr_00d_49af

    ld a, h
    inc sp
    jr jr_00d_4976

    jr z, jr_00d_49a7

    ld l, [hl]
    rst $38
    jr z, @+$0f

    add hl, de
    ld l, a
    jr c, jr_00d_497d

    inc a

jr_00d_4942:
    rrca
    ld e, c
    ld a, $3e

jr_00d_4946:
    ld hl, $bb00
    jr z, jr_00d_49b7

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
    jr jr_00d_49d2

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

jr_00d_4973:
    ldh a, [$ff61]
    ld e, d

jr_00d_4976:
    ld c, [hl]
    ld c, [hl]
    ld b, [hl]
    nop
    nop
    ld a, a
    ld a, c

jr_00d_497d:
    rst $18

jr_00d_497e:
    jr z, jr_00d_491f

    ld c, b
    and c

jr_00d_4982:
    add hl, de
    ld l, h
    ld l, h
    ld [hl], $36
    rst $38
    ld e, b
    sbc a
    jr jr_00d_49f2

jr_00d_498c:
    add b
    db $e4
    ld h, [hl]
    jr nc, @+$32

    inc c
    inc c
    ld b, $06
    cp a
    add hl, de
    ld a, [hl]
    ld a, [hl]

jr_00d_4999:
    cp a
    add hl, sp
    jr jr_00d_49b5

jr_00d_499d:
    rst $08
    jr z, @-$1f

    add hl, sp
    db $ed
    add hl, de
    add $93
    inc h
    nop

jr_00d_49a7:
    nop
    reti


    ld [$0000], sp
    ld b, d
    nop
    nop

jr_00d_49af:
    sbc l
    jr jr_00d_49c7

    ld [$08ff], sp

jr_00d_49b5:
    inc h
    inc h

jr_00d_49b7:
    ld bc, $241a
    inc h
    ld l, a
    add hl, bc
    jp Jump_000_2d0c


    jr jr_00d_4a11

    jr c, jr_00d_4a42

    ld a, [hl]
    ld b, $06

jr_00d_49c7:
    dec c
    ld a, [de]
    ld c, a
    add hl, de
    inc bc
    inc bc
    db $eb
    add hl, bc
    inc bc
    jr jr_00d_49d5

jr_00d_49d2:
    inc bc
    nop
    nop

jr_00d_49d5:
    db $10
    ld [de], a
    add $c6
    ld h, [hl]
    ld h, [hl]
    ld de, $6618
    ld h, [hl]
    rst $00
    rst $00
    rra
    jr z, jr_00d_49eb

    rlca
    ld de, $e60a
    and $00
    nop

jr_00d_49eb:
    ld [de], a
    nop
    jp Jump_00d_66c3


    ld h, [hl]
    ld h, e

jr_00d_49f2:
    ld h, e
    ldh [$ffe0], a
    xor a
    add hl, bc
    ld h, e
    ld h, e
    rrca
    jr jr_00d_49ff

    inc bc
    ret nz

    ld [de], a

jr_00d_49ff:
    or b
    ret nz

    cp a
    add hl, bc
    jp $1fc3


    ld [$6161], sp
    ld bc, $c101
    pop bc
    ld h, c
    nop
    nop
    rrca

jr_00d_4a11:
    jr jr_00d_4999

    nop
    jr nc, jr_00d_499d

    ld a, [hl]
    rra
    ld [$0829], sp
    jp $601a


    ld h, b
    ret nz

    ret nz

    call $100a
    nop
    nop
    rlca
    ld c, b
    or a
    ld a, [bc]
    dec b
    add hl, hl
    db $ed
    ld l, d
    dec bc
    sbc b
    ccf
    nop
    adc b
    ccf
    ccf
    jr nz, jr_00d_4a67

    cpl
    jr nc, jr_00d_4a69

    inc sp
    cpl
    ld [hl-], a
    ld l, $1f
    dec bc
    rst $38
    rst $38

jr_00d_4a42:
    rst $38
    inc b
    nop
    inc bc
    nop
    ld b, $18
    cpl
    dec bc
    db $fc
    db $fc
    db $fc
    inc b
    inc c
    db $f4
    inc c
    db $f4
    call z, $4cf4
    ld [hl], h
    ld [hl-], a
    ld l, $03
    rrca
    ld bc, $4f58
    dec sp
    inc bc
    inc bc
    inc b
    rlca
    dec b
    ld b, $5f
    dec sp

jr_00d_4a67:
    ld b, h
    nop

jr_00d_4a69:
    ld b, b
    jr z, jr_00d_4acd

    nop
    ld b, c
    ld b, c
    add b
    add b
    nop
    nop
    ld a, a
    rst $28
    cp a
    ld [hl], b
    rra
    rra
    ld h, b
    ld h, b
    add a
    add a
    ret nz

    ret nz

    db $fc
    db $fc
    ccf
    ccf
    nop
    nop
    add e
    add e
    ld hl, sp+$78
    ld h, c
    ld h, c
    jp nc, $f2d2

    ldh a, [c]
    ld a, c
    add hl, hl
    cp $26

jr_00d_4a93:
    cp $26
    nop
    nop
    rst $38
    ei
    ld a, a
    ld a, l
    or b
    or b
    ld c, b
    ld c, b
    ret z

    ret z

    jr nc, jr_00d_4a93

    ret nc

    ret nc

    ld d, b
    ld d, b
    ld b, b
    add [hl]
    and b
    and b
    nop
    nop
    ld c, h
    ld [hl], h
    ld bc, $0558
    ld b, $01
    ld e, b
    pop bc
    dec sp
    ld [hl], b
    ld h, b
    ld [hl], b
    ld [hl], b
    sub c
    ld a, [bc]
    ld a, a
    nop
    pop af
    ld a, [de]
    inc de
    dec de
    ld hl, $910b
    ld c, d
    ld d, c
    ld e, d
    ld bc, $311b
    ld e, d

jr_00d_4acd:
    ld a, a
    and c
    ld a, [hl]
    and d
    halt
    cp d
    ld l, a
    xor c
    ld a, [hl]
    nop
    nop
    or d
    ld l, h
    or h
    ld a, h
    and h
    ld l, [hl]
    or d
    rst $38
    rst $00
    ld a, a
    ld b, a
    db $fd
    db $fd
    ld d, b
    ld d, b
    ld b, a
    stop
    ld b, [hl]
    ld b, c
    ld b, c
    add [hl]
    dec e
    inc b
    rst $38
    inc c
    rst $38
    db $e3
    rst $38
    add h
    ld a, a
    ld d, h
    ld a, a
    ld e, a
    ld [hl], $80
    inc b
    ld h, $05
    rlca
    ld a, [de]
    dec e
    add b
    add b
    sub e
    add hl, bc
    ret nz

    ld b, b
    rlca
    ld [$0000], sp
    add b
    add b
    inc e
    ldh a, [rTAC]
    inc e
    ld c, $0e
    ld c, $8b
    ld [bc], a
    ld c, a
    inc l
    rrca
    ld l, e
    xor e
    dec hl
    ld l, a
    inc l
    xor l
    ld c, d
    xor a
    ld a, [bc]
    ld a, c
    or a
    ld l, a
    xor a
    ld a, a
    nop
    nop
    cp a
    ld h, c
    and c
    ld b, c
    pop bc
    ld c, a
    rst $08
    ld d, b
    ret nc

    ld h, b
    and b
    jr jr_00d_4b4f

    sub b
    sub b
    pop hl
    nop
    nop
    pop hl
    ld [hl], e
    ld d, d
    ld [hl], a
    ld d, l
    rst $38
    ld l, e
    db $db
    rst $18
    dec h
    inc h
    inc sp
    inc a
    rst $38
    rst $38
    cp h
    nop
    jr jr_00d_4b5b

jr_00d_4b4f:
    ld a, [de]
    ld a, [bc]
    dec de
    add hl, bc
    ld a, a
    ld d, e
    ld a, [hl]
    ld [hl-], a
    db $fc
    inc l
    inc bc
    ld a, [de]

jr_00d_4b5b:
    push de
    inc e
    add b
    add b
    ld a, h
    ldh [$ff08], a
    ld a, h
    inc b
    rlca
    rlca
    inc b
    add a
    ld a, [bc]
    add [hl]
    sub c
    dec [hl]
    ld a, [bc]
    and b
    ldh [rNR41], a
    inc sp
    ld c, b
    rra
    add hl, de
    rlca
    rlca
    nop
    nop
    add hl, bc
    add hl, bc
    rla
    rla
    rra
    jr @+$0b

    ld [$1011], sp
    ld de, $fe11
    add $0f
    ld bc, $0000
    adc a
    ld bc, $fdff
    adc [hl]
    add d
    adc [hl]
    add d
    sbc h
    add h
    inc e
    inc b
    ld [bc], a
    ld [bc], a
    adc h
    adc h
    ld c, $00
    ld d, b
    nop
    nop
    ld [hl], l
    ld a, [hl+]
    ccf
    dec l
    ld bc, $fe01
    rst $38
    inc b
    rst $38
    rst $38
    rlca
    inc hl
    ld hl, $7d7f
    nop
    nop
    ld a, d
    ld b, a
    ld a, e
    ld b, [hl]
    rst $38
    rst $38

jr_00d_4bb7:
    ld l, l
    inc e
    ld c, $f9
    rst $38
    rst $38
    jr c, @+$0a

    ld hl, sp-$08
    nop
    inc [hl]
    ret c

    jr c, @-$16

    jr @-$06

    ld hl, sp-$70
    ld [hl], b
    db $10
    ldh a, [$ffe7]
    ld [bc], a
    and b
    ld bc, $2f58
    ld c, d
    rlca
    dec b
    inc b
    nop
    rrca
    add hl, bc
    adc a
    dec a
    ret nz

    ret nz

    ldh [$ffa0], a
    ldh a, [$ff90]
    rra
    ld de, $253b
    ld [hl], e
    ld c, l
    db $e3
    nop
    nop
    sbc l
    db $e3
    sbc l
    ld [hl], e
    ld c, l
    dec sp
    dec h
    rra
    ld de, $88f8
    call c, $cea4
    or d
    rst $00
    nop
    jr nz, jr_00d_4bb7

    rst $00
    cp c
    adc $b2
    call c, $f8a4
    adc b
    rrca
    add hl, bc
    rlca
    dec b
    rst $18
    ld c, b
    ldh a, [$ff90]
    adc h
    ld [bc], a
    ldh [$ffa0], a
    inc bc
    ld c, c
    sbc e
    jr jr_00d_4c1a

    inc bc
    dec b
    nop

jr_00d_4c1a:
    nop
    add hl, bc
    nop
    nop
    nop
    nop
    cp $fe
    ld hl, $a021
    nop
    ldh [$ffe0], a
    jr @+$1a

    inc b
    rla
    ld bc, $9f06
    ld [de], a
    add b
    add b
    ld b, b
    ld b, b
    ccf
    ccf
    ld h, c
    ld h, c
    inc c

Call_00d_4c39:
    ld [bc], a
    add [hl]
    add [hl]
    pop bc
    inc c
    ld a, a
    jr c, jr_00d_4c61

    ldh [$ffa0], a
    ld h, b
    ld [$0000], sp
    dec bc
    dec bc
    inc c
    inc c
    ld sp, $0031
    nop
    ld b, a
    ld b, a
    ld a, e
    ld a, e
    ld bc, $9801
    sbc b
    db $e3
    db $e3
    inc c
    inc c
    ld a, b
    ld [hl], b
    ld hl, sp-$08
    nop
    nop

jr_00d_4c61:
    ldh a, [$ffe0]
    ldh a, [$ffc0]
    ld hl, sp-$80
    call z, Call_000_02cc
    ld [bc], a
    ld [hl-], a
    ld [hl-], a
    ld a, h
    ld a, h
    ld l, b
    ld l, b
    sub e
    nop
    ld [hl], a
    dec bc
    adc e
    dec de
    ld bc, $fd01
    ld [de], a
    dec b
    dec b
    ld bc, $7f04
    ld h, e
    rst $18
    sbc $38
    jr c, jr_00d_4c97

    ld de, $8400
    rst $00
    rst $00
    ld a, b
    db $fd
    ld c, d

jr_00d_4c8e:
    call $ffff
    add b
    add b
    ld d, a
    nop
    jr nz, jr_00d_4d07

jr_00d_4c97:
    ld [hl], b
    ret z

    nop
    nop
    ld [hl+], a
    jr nc, jr_00d_4c8e

    rrca
    ld bc, $2e32
    inc sp
    ld l, c
    inc bc
    jr nc, jr_00d_4cd6

    ccf
    jr nz, jr_00d_4ce9

    ccf
    daa
    dec sp
    inc l
    dec sp
    ld c, h
    ld [hl], h

jr_00d_4cb1:
    ld [bc], a
    ld bc, $69cc
    inc bc
    inc c
    db $f4
    db $fc
    inc b
    db $fc
    db $fc
    xor e
    ld c, $30
    jr nc, jr_00d_4cf9

    jr c, jr_00d_4cff

    inc a
    ld a, $01
    jr nz, jr_00d_4cc8

jr_00d_4cc8:
    nop
    inc a
    inc a
    jr c, jr_00d_4d05

    jr nc, jr_00d_4cff

    nop
    nop
    dec b
    dec b
    ld a, l
    ld a, l
    push de

jr_00d_4cd6:
    ld [$0808], sp
    rrca
    nop
    ld a, a
    jr z, jr_00d_4cb1

    ld c, $db
    dec c
    db $db
    ld e, $20
    jr nz, jr_00d_4d24

    ld a, $22
    ld [hl+], a

jr_00d_4ce9:
    ld d, h
    ld d, h
    inc c
    inc c
    ld [$0008], sp
    nop
    jr nc, jr_00d_4d23

    ld [$7f08], sp
    ld a, a
    db $10
    db $10

jr_00d_4cf9:
    inc hl
    inc hl
    ld a, h
    ld a, h
    ld [de], a
    ld [de], a

jr_00d_4cff:
    jr nz, jr_00d_4d21

    inc b
    ret z

    rra
    rra

jr_00d_4d05:
    cpl
    inc c

jr_00d_4d07:
    ld e, $1e
    ld [hl+], a
    ld [hl+], a
    ld b, d
    ld b, d
    inc b
    inc b
    rra
    ld [$0000], sp
    dec bc
    dec c
    rrca
    dec c
    ld bc, $0f62
    jr z, jr_00d_4d9a

    ld a, [hl]
    ld [bc], a
    ld [bc], a
    inc d
    inc d

jr_00d_4d21:
    jr jr_00d_4d3b

jr_00d_4d23:
    ld d, a

jr_00d_4d24:
    inc c
    jr nz, jr_00d_4d47

    ld b, b
    nop
    jr nz, jr_00d_4d52

    dec c
    ld b, h
    add b
    ld b, b
    ld b, h
    jr c, jr_00d_4d6a

    inc b
    inc b
    ld a, a
    ld a, a
    inc bc
    jr @+$3e

    inc a
    ld b, [hl]

jr_00d_4d3b:
    ld b, [hl]
    add hl, sp
    add hl, sp
    rrca
    ld [$240c], sp
    db $10
    inc c
    inc d
    nop
    nop

jr_00d_4d47:
    inc c
    inc c
    ld d, c
    ld [$2222], sp
    ld a, c
    ld a, c
    dec h
    dec h
    ld d, e

jr_00d_4d52:
    jr jr_00d_4d98

    ld b, h
    ld c, b
    ldh a, [c]
    rst $38
    ld c, b
    ld h, c
    rra
    ld c, $0e
    adc e
    dec c
    adc a
    ld e, h
    di
    inc b
    dec de
    ld [de], a
    adc a
    ld e, d
    nop
    ld hl, sp+$00

jr_00d_4d6a:
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

jr_00d_4d98:
    rst $38
    nop

jr_00d_4d9a:
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
    ld hl, sp+$1f
    sbc a
    nop

jr_00d_4dbc:
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$05
    ret z

    rst $30
    ld b, $07
    dec b
    ld b, $01
    jr c, @-$36

    ld l, $f5
    dec c
    ld bc, $d808
    ld l, $7c
    ld a, h
    rrca
    ld e, b
    ld a, b
    add b
    ld a, [hl]
    ld a, [hl]
    jr jr_00d_4ddc

jr_00d_4ddc:
    db $10
    cpl
    jr c, jr_00d_4def

    ld l, b
    ccf
    ld e, b
    ld b, d
    ld b, d
    ld h, d
    ld b, d
    ld h, d
    ld h, d
    ld [hl], d
    ld h, d
    jr z, jr_00d_4e24

    rst $38
    pop af

jr_00d_4def:
    sbc d
    jr nz, jr_00d_4e01

    ld hl, sp+$1f
    ld e, b
    ld [hl], l
    ld l, $05
    jr z, @-$43

    ld c, b
    rst $00
    ld [$18b5], sp
    dec b
    ld l, b

jr_00d_4e01:
    ld a, h
    ld a, h
    ld h, b
    nop
    jr nz, jr_00d_4dbc

    jr @+$07

    cp b

jr_00d_4e0a:
    ccf
    ld l, b
    nop
    call nz, Call_00d_7272
    ld a, d
    ld [hl], d
    ld a, d
    ld e, d
    ld e, [hl]
    ld e, d
    ld e, [hl]
    ld c, [hl]
    nop
    nop
    ld b, [hl]
    ld b, [hl]
    ld b, [hl]
    ld d, c
    add hl, de
    dec de
    add hl, bc
    jr c, jr_00d_4e0a

    ld a, [hl]

jr_00d_4e24:
    ld a, [hl]
    ld e, d
    nop
    nop
    ld h, c
    add hl, de
    dec l
    add hl, hl
    ld h, [hl]
    ld h, [hl]
    ld [hl], c
    add hl, de
    dec l
    add hl, hl
    rrca
    jr z, jr_00d_4eb3

    ld a, [hl]
    ld a, a
    ld [$1005], sp
    cp l
    ld d, b
    add c
    db $fc
    cp a
    jr z, jr_00d_4e45

    rlca
    rlca
    inc b
    inc bc

jr_00d_4e45:
    inc bc
    ld e, c
    jr @+$3e

    inc a
    ld b, $49
    or a
    ld [$4916], sp
    ld [hl], l
    add hl, bc
    rrca
    ld e, b
    cpl
    ld e, b
    ld hl, $3fcf
    ld l, b
    ld b, [hl]
    ld b, d
    ld b, d
    ld b, d
    ld d, [hl]
    ld c, c
    ld e, d
    ld e, d
    rrca
    ld e, b
    ld l, a
    ld l, b
    dec hl
    add hl, bc
    ld a, a
    ld e, b
    ld a, [hl]
    ld a, [hl]
    adc a
    ld d, b
    cp a
    jr nz, jr_00d_4e81

    nop
    ldh [rNR41], a
    ret nz

    ret nz

    ld e, l
    adc d
    ld bc, $0fa0
    ld [hl+], a
    ld h, b
    nop
    nop
    ld h, b
    inc a

jr_00d_4e81:
    inc a
    ld h, [hl]
    nop
    jr nc, jr_00d_4ec2

    inc a
    nop
    nop
    jr c, jr_00d_4ec3

    jr jr_00d_4e8d

jr_00d_4e8d:
    jr nc, @+$11

    ld [$041c], sp
    ld [$261c], sp
    nop
    nop
    inc c
    inc c
    jr jr_00d_4eb3

    jr nc, jr_00d_4ecd

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

jr_00d_4eb3:
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
    jr nc, jr_00d_4ef1

    inc a

jr_00d_4ec2:
    inc a

jr_00d_4ec3:
    ld b, $00
    nop
    rra
    jr z, jr_00d_4ef9

    nop
    nop
    inc a
    inc a

jr_00d_4ecd:
    ld [hl-], a
    nop
    nop
    ld sp, hl
    sbc h
    cpl

jr_00d_4ed3:
    ld [$3e3e], sp
    ld c, a
    jr @+$03

    jr @+$81

    jr z, @+$07

    jr z, jr_00d_4f4e

    jr z, @+$20

    ld e, $41
    ld [$085f], sp
    sbc a
    jr jr_00d_4f67

    ld a, [hl]
    and l
    jr jr_00d_4f5d

    sbc a
    nop
    nop
    ld a, h

jr_00d_4ef1:
    ld a, h
    xor a
    ld [$2805], sp
    cp a
    jr jr_00d_4f59

jr_00d_4ef9:
    nop

jr_00d_4efa:
    db $10
    cp a
    jr jr_00d_4f1d

    jr jr_00d_4ed3

Call_00d_4f00:
    jr jr_00d_4f21

    ld [$7e7e], sp
    dec e
    ld [$2733], sp
    dec b
    jr z, @+$11

    jr z, jr_00d_4f8a

    ld a, h
    inc sp
    jr jr_00d_4f51

    jr z, jr_00d_4f82

    ld l, [hl]
    rst $38
    jr z, @+$0f

    add hl, de
    ld l, a
    jr c, jr_00d_4f58

    inc a

jr_00d_4f1d:
    rrca
    ld e, c
    ld a, $3e

jr_00d_4f21:
    ld hl, $bb00
    jr z, jr_00d_4f92

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
    jr jr_00d_4fad

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

jr_00d_4f4e:
    ldh a, [$ff61]
    ld e, d

jr_00d_4f51:
    ld c, [hl]
    ld c, [hl]
    ld b, [hl]
    nop
    nop
    ld a, a
    ld a, c

jr_00d_4f58:
    rst $18

jr_00d_4f59:
    jr z, jr_00d_4efa

    ld c, b
    and c

jr_00d_4f5d:
    add hl, de
    ld l, h
    ld l, h
    ld [hl], $36
    rst $38
    ld e, b
    sbc a
    jr jr_00d_4fcd

jr_00d_4f67:
    add b
    db $e4
    ld h, [hl]
    jr nc, jr_00d_4f9c

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

jr_00d_4f82:
    nop
    reti


    ld [$0000], sp
    ld b, d
    nop
    nop

jr_00d_4f8a:
    sbc l
    jr jr_00d_4fec

    add hl, de
    dec de
    ld [$1a01], sp

jr_00d_4f92:
    inc h
    inc h
    rrca
    jr jr_00d_4fa8

    jr c, jr_00d_4fe8

    ld [$f9f0], sp

jr_00d_4f9c:
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

jr_00d_4fa8:
    ld c, a

jr_00d_4fa9:
    ld a, [bc]
    ld c, $0e
    ld a, c

jr_00d_4fad:
    ld [$187f], sp
    dec d
    ld a, [bc]
    adc c
    jr jr_00d_4fbc

    ld a, [bc]
    ld bc, $7d54
    ld a, [bc]
    jr c, jr_00d_4ff4

jr_00d_4fbc:
    ld l, h
    ld l, h
    ld b, h
    ld b, h
    add $c6
    adc $00
    nop
    sub $00
    db $10
    and $00
    nop
    ld b, h
    ld [bc], a

jr_00d_4fcd:
    cp h
    ld b, h
    ld c, a
    add hl, de
    nop
    nop
    ld [$1808], sp
    jr jr_00d_5050

    ld a, b
    push bc
    ld c, b
    sub c
    ld a, [hl+]
    ld l, a
    jr jr_00d_501f

    ld [$00c6], sp
    nop
    inc hl
    jp Jump_000_0a63


jr_00d_4fe8:
    adc c
    jr z, jr_00d_504b

    ld h, b

jr_00d_4fec:
    ret nz

    nop
    nop
    cp $fe
    rra
    ld c, b
    or e

jr_00d_4ff4:
    ld a, [bc]
    inc e
    inc e
    ld c, $0e
    adc e
    ld a, [bc]
    cpl

jr_00d_4ffc:
    ld [$103b], sp
    ld e, a
    jr z, jr_00d_4fa9

    ld a, [bc]
    inc e
    nop
    db $10
    cp c
    ld a, [bc]
    cp l
    ld a, [de]
    ld c, h
    ld c, h
    call z, $fecc
    cp $bf
    ld a, [bc]
    nop
    nop
    cp $02
    ccf
    cp $4b
    ld [$c0c0], sp
    ld hl, sp-$08
    db $ec

jr_00d_501f:
    db $ec
    ld h, l
    jr @+$41

    ld e, b
    ld a, a
    jr jr_00d_5048

    jr c, @+$03

    jr z, @-$3f

jr_00d_502b:
    jr z, jr_00d_502b

    cp $ff
    ld [hl], b
    ld a, l
    jr @-$07

    jr jr_00d_4ffc

    ld e, b
    cp a
    ld c, b
    sub c
    jr @+$0d

jr_00d_503b:
    jr z, jr_00d_509c

    ld l, b
    ld d, a
    jr z, jr_00d_50af

    ld l, [hl]
    ld a, $3e
    pop bc
    jr jr_00d_5066

    add hl, hl

jr_00d_5048:
    pop bc
    dec hl
    inc bc

jr_00d_504b:
    jr nz, jr_00d_5050

    inc bc
    inc b
    rlca

jr_00d_5050:
    dec b
    ld b, $cf
    dec sp
    rst $38
    rst $38
    ld [bc], a
    ld [$3bdf], sp
    ret nz

    ret nz

    ld h, b
    and b
    ld h, b
    and b
    inc e
    jr @+$07

    ld b, $01
    ld e, b

jr_00d_5066:
    inc de
    ld [$4803], sp
    inc b
    rlca
    rlca
    inc b
    inc bc
    inc bc
    dec d
    ld b, h
    ld b, [hl]
    ld h, b
    ld h, b
    and b
    ldh [$ff08], a
    nop
    jr nz, jr_00d_503b

    ret nz

    dec [hl]
    ld l, h
    ld h, b
    ld h, b
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
    ret nz

    add b
    ld [hl], h
    ld c, h
    ld l, b
    ld e, b
    ld d, b
    ld [hl], b
    ld c, e
    dec bc
    ld e, e
    inc c
    ld e, [hl]
    ld h, d
    ld l, $32
    ld d, $1a

jr_00d_509c:
    ld a, [bc]
    ld [hl], l
    ld bc, $8001
    ld l, c
    ld c, h
    ld b, $06
    ld a, [bc]
    ld c, $16
    ld a, [de]
    ld l, $32
    ld e, [hl]
    ld h, d
    inc a
    inc a

jr_00d_50af:
    ld [bc], a
    ld [bc], a
    add e
    inc c
    ld [$1000], sp
    db $10
    jr nz, jr_00d_50b9

jr_00d_50b9:
    nop
    ld e, $1e
    nop
    nop
    ld h, $26
    ld l, d
    ld l, d
    ld a, [hl+]
    ld a, [hl+]
    ld [hl-], a
    ld [hl-], a
    ld [$6221], sp
    ld h, d
    ld hl, $0000
    dec b
    dec b
    ld a, l
    ld a, l
    dec de
    jr jr_00d_50f4

    jr nz, jr_00d_50e6

    db $10
    ld d, c
    inc c
    ld b, d
    ld b, d
    ld [bc], a
    add b
    ld b, c
    nop
    db $10
    ld b, b
    ld b, b
    ld d, b
    ld d, b
    jr nz, jr_00d_5106

jr_00d_50e6:
    inc b
    inc b
    ld a, a
    ld a, a
    inc c
    inc c
    inc d
    nop
    nop
    nop
    db $10
    inc c
    inc c
    inc b

jr_00d_50f4:
    inc b
    ld [$2208], sp
    ld [hl+], a
    ld a, c
    ld a, c
    dec h
    dec h
    rst $08
    ld a, [bc]
    inc h
    inc h
    ld b, h
    add b
    ld sp, $4844

jr_00d_5106:
    ld c, b
    ld b, d
    ld b, d
    ld e, a
    ld e, a
    db $d3
    ld a, [bc]
    inc bc
    jr jr_00d_5154

    ld b, h
    ld b, b
    nop
    jr nz, jr_00d_5122

    jr jr_00d_514f

    jr c, jr_00d_5129

    ld l, a
    rst $38
    rst $38
    rst $38
    add b
    ld bc, $ff50
    db $fd

jr_00d_5122:
    inc bc
    ld bc, $1d48
    ld c, b
    inc e
    nop

jr_00d_5129:
    dec e
    ld d, b
    ld bc, $003c
    ccf
    dec c
    ccf
    nop
    ld a, b
    ccf
    ccf
    jr nz, @+$32

    cpl
    jr nc, jr_00d_5169

    inc sp
    cpl
    ld [hl-], a
    ld l, $79
    add hl, de
    ld [hl], a
    ld bc, $097d
    ld a, [hl]
    ld hl, $00fc
    jr nz, @-$02

    db $fc
    inc b
    inc c
    db $f4
    inc c

jr_00d_514f:
    db $f4
    call z, $4cf4
    ld [hl], h

jr_00d_5154:
    ld [hl-], a
    ld l, $01
    ld e, b
    ld c, h
    ld [hl], h
    ld de, $0118
    ld e, b
    ld [hl-], a
    ld l, $33
    ld c, c
    nop
    jr nc, jr_00d_5194

    ccf
    jr nz, @+$41

    ccf

jr_00d_5169:
    rst $00
    add hl, sp
    call z, Call_00d_4c39
    ld [hl], h
    call z, Call_000_0081
    ld c, c
    nop
    inc c
    db $f4
    db $fc
    inc b
    db $fc
    db $fc
    cp e
    dec c
    jr nc, jr_00d_51ae

    jr z, @+$3a

    inc [hl]
    inc l
    ld a, [hl-]
    ld h, $40
    sub b
    ld a, [hl-]
    ld h, $34
    inc l
    jr z, jr_00d_51c4

    ld d, c
    dec bc
    ld a, a
    ld a, a
    ld [$1008], sp
    nop

jr_00d_5194:
    db $10
    ld [$7508], sp
    ld e, c
    inc bc
    ld h, b
    dec bc
    adc b
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
    ld bc, $000f

jr_00d_51ae:
    rst $38
    sbc b
    adc a
    cp l
    rst $38
    and l
    ld bc, $0f00
    jr nz, @-$01

    add e
    ld bc, $1e28
    jr jr_00d_51e4

    nop
    ld bc, $2f38
    db $10

jr_00d_51c4:
    jp $dbbd


    ld bc, $1b00
    cp $3f
    jr z, jr_00d_520c

    nop
    jp $1801


    cpl
    jr c, @-$17

    sbc c
    rst $20
    sbc c
    cpl
    jr nz, jr_00d_51f3

    add hl, bc
    inc bc
    ld b, b
    jr z, jr_00d_51f1

    dec c
    ld b, b
    cp c
    ld [de], a

jr_00d_51e4:
    dec c
    ld d, b

jr_00d_51e6:
    rrca
    daa
    ld de, $bf28
    xor b
    adc [hl]
    ld l, b
    inc b
    ld e, b
    nop

jr_00d_51f1:
    nop
    rlca

jr_00d_51f3:
    rlca
    ld a, l
    ld c, $05
    jr jr_00d_51e6

    ld c, $c3
    jp $0ee1


    rst $00
    rst $00
    add hl, bc
    ld h, h
    rrca
    jr z, @-$38

    add $f1
    ld c, $e6
    and $66
    ld h, [hl]

jr_00d_520c:
    ld h, e
    ld h, e
    dec c
    rrca
    ld h, e
    ld h, e
    add hl, bc
    ld [$0e3f], sp
    jp $c902


    jp Jump_000_0f1d


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

    jr z, @-$77

    rra
    ld d, c
    ld e, $73
    ld e, $81
    ld c, $78
    ld a, b
    ld h, h
    ld h, h
    ld b, e
    ccf
    ld sp, $315e
    dec e
    sub c
    ld c, l
    rra
    adc [hl]
    add c
    daa
    ld h, h
    ld a, h
    ld a, b
    rst $38
    ld e, a
    dec [hl]
    dec e
    ld a, a
    ld c, a
    ccf
    ld a, h
    nop
    ld hl, sp+$00
    ld hl, sp+$16

jr_00d_5256:
    ld a, [hl-]
    cp e

jr_00d_5258:
    add hl, hl
    jp Jump_00d_5f29


    db $fc
    ld e, a
    db $fc
    ld e, a
    db $fc
    ld e, a
    cp h
    sbc a
    dec bc
    ret nz

    ld bc, $d800
    jr @+$4e

    sbc b
    reti


    sbc c
    ld bc, $5408
    dec hl
    add $c6
    ld l, a
    ld l, a
    ld l, e
    nop
    nop
    cp a
    inc bc
    ld bc, $0103
    nop
    ld [hl], e

jr_00d_5280:
    jr jr_00d_52a2

    ld [hl], c
    ld e, e
    ld e, c
    ld bc, $2f08
    jr z, jr_00d_5256

    adc h
    sbc $9e
    sub $96
    ret c

    sbc b
    add h
    dec hl
    ld h, l
    ld h, l
    ld b, $08
    or l
    nop
    db $10
    cpl
    jr z, jr_00d_5258

    cp c
    or e
    or c
    or e
    or c

jr_00d_52a2:
    cp e
    cp c
    ld d, l
    jr jr_00d_5280

    sbc c
    sbc $9e
    add [hl]
    ld h, c
    ret nz

    db $fd
    inc de
    ld d, l
    jr jr_00d_531d

    ld l, e
    set 1, e
    jp nz, Jump_00d_551b

    jr jr_00d_5315

    ld e, c
    ld [hl], e
    ld [hl], c
    xor $03
    ldh a, [$ff03]
    call z, $0200
    adc h

jr_00d_52c5:
    add $86
    sub $96
    sbc $9e
    call z, $2f8c
    jr jr_00d_52c5

    push af
    or l
    or l
    or a
    or a
    ld c, $0c
    or e
    nop
    nop
    ldh a, [c]
    dec de
    ld d, l
    ld [$b1b3], sp
    inc sp
    ld sp, $393b
    cpl
    jr @-$3f

jr_00d_52e7:
    jr z, @-$31

    adc l
    pop de
    sub c
    inc hl
    ld h, c
    ld bc, $1408
    inc l
    add hl, sp
    add hl, sp
    ld [hl+], a
    nop
    nop
    ld a, [hl-]
    ld a, [hl-]

jr_00d_52f9:
    cp a
    jr z, jr_00d_532f

    ld sp, $a9ab
    ld bc, $8f08
    inc c
    rst $08
    db $10
    add d
    adc a
    ret z

    adc b
    rlc c
    nop
    ret z

    adc b
    rst $08

jr_00d_530f:
    adc a
    ld h, d
    inc c
    cp $fe
    ld b, e

jr_00d_5315:
    ld b, e
    ld e, e

jr_00d_5317:
    ld bc, $9c00
    sub b
    ld b, e
    ld b, e

jr_00d_531d:
    sbc a
    inc de
    rst $28
    db $10
    inc bc
    jr jr_00d_5317

    pop af
    ld d, l
    jr jr_00d_52f9

    sub c
    call $bf8d
    jr jr_00d_5351

    inc hl

jr_00d_532f:
    ld d, a
    ld [$3930], sp

jr_00d_5333:
    ld [hl+], a
    ld [hl+], a
    cp d
    cp d
    adc a
    jr z, jr_00d_5391

    jr jr_00d_52e7

    xor c
    cp a
    jr jr_00d_530f

    adc a
    ld c, l
    add hl, bc
    inc bc
    jr jr_00d_5333

    inc c
    jp nz, Jump_000_08c2

    ld de, $425a
    ld e, d
    ld a, [de]
    dec b
    ld a, a

jr_00d_5351:
    ld a, a
    ccf
    ccf
    ret nc

    add hl, bc
    dec de
    add hl, de
    db $db
    ld bc, $1b00
    add hl, de
    ei
    ld [$f910], sp
    ei
    ld sp, hl
    cp a
    ld c, b
    pop bc
    add c
    jp nz, $c282

    add d

jr_00d_536b:
    rst $00
    add a
    ldh a, [c]
    inc c
    inc a
    inc a
    db $db
    nop
    ld [bc], a
    db $db
    inc h
    inc h
    ld b, d
    ld b, d
    ld a, [hl]
    ld a, [hl]
    jp Jump_00d_7fc3


jr_00d_537e:
    add hl, hl
    add e
    add c
    ld b, e
    ld b, c
    ld b, e
    ld b, c
    inc a
    jr jr_00d_536b

    pop hl
    xor a
    add hl, hl
    jp $0108


    ld [$055f], sp

jr_00d_5391:
    inc e
    ld h, $26
    ld e, e
    ld e, e
    ld a, [hl+]
    ld a, [hl+]
    xor a
    add hl, hl
    di
    pop af
    inc de
    ld [bc], a
    jp $0111


    ld [$82c2], sp
    jp $c183


    add c
    adc a
    jr c, jr_00d_53fc

    ld [$c3c3], sp
    add c
    add c
    dec bc
    dec bc
    ld h, b
    ld a, [bc]
    ret nz

    and c
    ld b, e
    ld b, c
    jp $83c1


    add c
    pop af
    jr jr_00d_537e

    jr jr_00d_5418

    ld [$85c5], sp
    push bc
    add l
    adc e
    nop
    add e
    xor a
    inc c
    dec b
    nop
    dec de
    rrca
    xor l
    nop
    nop
    cp l
    cp l
    rst $38
    jr @+$01

    rst $38
    di
    pop af
    inc sp
    ld sp, $3133
    ld h, e
    add sp, $01
    ld h, c
    ld h, e
    ld h, c
    adc e
    nop
    pop bc
    ld a, a
    add hl, sp
    or c
    add hl, bc
    ld bc, $9408
    dec l
    and $e6
    call $cccd
    call z, $92ee
    ret nz

    xor $3f
    ld a, [hl+]
    ld a, e

jr_00d_53fc:
    ld a, c
    scf
    ld [$3133], sp
    cpl
    jr c, @-$26

    sbc b
    ret c

    sbc b
    sbc $9e
    call nz, $e12d
    add hl, bc
    ldh a, [rNR11]
    or e
    or e
    ld h, e
    ld h, e
    cpl
    jr c, jr_00d_5447

    jr jr_00d_546d

jr_00d_5418:
    jr jr_00d_5475

    ld [$1a3f], sp
    rst $00
    rst $00
    jp RST_00


    set 1, e
    and $fe
    ldh a, [$ffe6]
    ld [bc], a
    ld e, $55
    jr @-$6b

    ld [$1a3f], sp
    ld d, l
    ld [$1859], sp
    ld l, a
    ld a, [de]
    ld h, e
    ld h, e
    di
    di
    ld e, e
    jr jr_00d_546f

    ld h, $eb
    dec e
    dec de
    dec e
    ld bc, $8e10
    dec d
    ld a, l

jr_00d_5447:
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
    adc l
    ld [$fdff], sp
    ld e, $24
    sub e
    xor $33
    ld bc, $fd18
    ld e, $0f

jr_00d_545f:
    jr c, jr_00d_545f

    ccf
    dec d
    ld [$0dbf], sp
    xor $31
    ld bc, $fc28
    ccf
    and b

jr_00d_546d:
    ld d, e
    rst $38

jr_00d_546f:
    ret


    nop
    ld hl, sp+$00
    ld hl, sp+$00

jr_00d_5475:
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$0c
    add a
    ld a, a
    add b
    inc e
    ld e, a
    cp $01
    ld de, $7a00
    ld d, [hl]
    inc b
    inc b
    cp $01
    adc d
    and [hl]
    rrca
    ld b, $09
    ld b, $09
    nop
    rrca
    ld h, b
    scf
    ldh a, [$ff60]
    sub b
    ld h, b
    sub b
    inc c
    ld [$f000], sp
    rla
    or b
    adc c
    ld l, a
    ccf
    add hl, de
    ld h, $19
    ld h, $00
    ccf
    and b
    scf
    db $fc
    sbc b
    ld h, h
    sbc b
    nop
    inc b
    ld h, h
    nop
    db $fc
    nop
    inc bc
    ld bc, $0102
    ld [bc], a
    nop
    ld sp, $c03d
    add b
    ld b, b
    add b
    ld b, b
    ld c, $fc
    nop
    ld hl, $3f45
    ldh [$ff31], a
    ld l, a
    inc a
    jr jr_00d_54f8

    jr jr_00d_54fa

    nop
    ld c, c
    ld b, $3f
    ld hl, sp+$7f
    db $10
    cpl
    xor b
    ccf
    add sp, -$59
    jr z, @+$81

    nop
    cp a
    ld l, b
    sub a

jr_00d_54e8:
    xor b
    daa
    xor b
    ld d, a
    xor b
    nop
    ld hl, sp+$00
    ld hl, sp-$11
    ld d, $b9
    rst $00
    ld e, d
    ld h, [hl]
    ld d, d

jr_00d_54f8:
    ld l, [hl]
    inc [hl]

jr_00d_54fa:
    inc l
    inc h
    ld bc, $a700
    rlca
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
    db $f4
    ld h, b
    nop
    nop
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

Jump_00d_551b:
    cp $67
    cp $5a
    db $db
    add c
    nop
    nop
    add c
    nop
    nop
    ld l, a
    ldh a, [$ff6e]
    pop af
    sub [hl]
    ld sp, hl
    call nc, Call_00d_5dfb
    ld a, e
    add hl, hl
    cpl
    ld b, $03
    nop
    dec c
    rlca
    xor a
    ld l, e
    inc bc
    inc bc
    inc c
    rrca
    inc de
    inc e

jr_00d_553f:
    cpl
    jr nc, @+$61

    ld h, b
    ld a, a
    ld b, e
    cp h

jr_00d_5546:
    rst $00
    nop
    nop
    cp l
    add $c0
    ret nz

    jr nc, jr_00d_553f

    ret z

    jr c, jr_00d_5546

    inc c
    ld a, [$fe06]
    jp nz, $e33d

    and b
    pop de
    cp l
    ld h, e
    ld bc, $0201
    nop
    nop
    ld bc, $0000
    rlca
    jr jr_00d_54e8

    add b
    ld b, b
    nop
    nop
    add b
    nop
    nop
    rlca
    jr jr_00d_5573

    nop

jr_00d_5573:
    sub e
    ld l, d
    ld bc, $0590
    ld a, [hl]
    jr nz, jr_00d_557b

jr_00d_557b:
    nop
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$12
    ld h, b
    ld bc, $0f01
    rrca
    rra
    inc d
    daa
    jr jr_00d_5597

    rlca
    nop
    ld bc, $787f
    rst $38

jr_00d_5596:
    add b

jr_00d_5597:
    pop hl
    ldh [$fff8], a
    jr jr_00d_55d3

    jr jr_00d_5596

    ld hl, sp-$02
    ld b, $ff
    ld bc, $08ff

jr_00d_55a5:
    ld [$f81e], sp
    ldh a, [$ff2b]
    jr nc, jr_00d_55ba

    rst $38
    ldh a, [rIE]
    nop
    ld a, a
    rrca
    ld d, a
    jr jr_00d_55a5

    ldh a, [$fff8]
    ld [$1240], sp

jr_00d_55ba:
    ld hl, sp+$08
    ldh a, [rNR10]
    ldh [$ffe0], a
    ld h, a
    ret c

    rlca
    rlca
    add a
    ld e, b
    db $fc
    db $fc
    sub a
    add sp, $3c
    jr z, jr_00d_5605

    nop
    nop
    jr nc, @+$32

    jr nz, @+$73

jr_00d_55d3:
    ld b, c
    ld h, e
    ld b, e
    and a
    and a
    xor [hl]
    xor [hl]
    inc a
    inc a
    rlca
    rlca
    rra
    nop
    nop
    rra
    ld a, h
    ld a, h
    pop af
    ldh a, [$ffc7]
    jp Jump_000_0f0c


    inc sp
    inc e
    ld h, a
    ld a, a
    jp $3ec1


    nop
    nop
    rra
    ld [hl], e
    ld a, h
    sub b
    rst $38
    ld l, c
    sbc a
    rst $30
    ld c, $fc
    inc b
    ld a, l
    add l
    ldh a, [rIE]
    rrca
    nop
    add b

jr_00d_5605:
    pop af
    cp $02
    db $fd
    inc bc
    dec sp
    call z, $fec5
    ld [hl], e
    ccf
    adc d
    adc [hl]
    add b
    add b
    ld sp, hl
    ld [$0400], sp
    add b
    add b
    ld b, b
    ret nz

    and b
    ld h, b
    ldh [$ffa0], a
    ld b, b
    ld b, b
    pop af
    ld e, b
    ld bc, $1901
    add hl, de
    daa
    nop
    nop
    ld h, $38
    jr c, jr_00d_56a7

    ld c, b
    ldh a, [$ff90]
    or b
    sub b
    and b
    jr nz, jr_00d_5657

    jr nz, @+$01

    add e
    ldh [rP1], a
    nop
    ld h, b
    jr jr_00d_5658

    ld c, $06
    inc bc
    ld bc, $0001
    ld bc, $0f00
    ld bc, $8080
    ldh [rP1], a
    jr nz, jr_00d_56b0

    jr nc, jr_00d_5662

    jr jr_00d_565c

    dec c
    dec b
    sbc a

jr_00d_5657:
    sbc [hl]

jr_00d_5658:
    ldh [$ff60], a
    sbc a

jr_00d_565b:
    adc a

jr_00d_565c:
    ld b, a
    add hl, hl
    ld hl, sp-$08
    nop
    nop

jr_00d_5662:
    ld [$1008], sp
    db $10
    jr nz, @+$22

    ld a, b
    jr c, jr_00d_56dc

    ld [hl], c
    db $e3
    db $e3
    push bc
    rst $00
    adc e
    adc h
    nop

jr_00d_5673:
    nop
    sbc e
    inc c
    rla
    jr jr_00d_56a0

    jr c, jr_00d_5673

    ld hl, sp-$3e
    jp nz, $0507

    inc c
    ld [$888c], sp
    ld bc, $0004
    ld [$8080], sp
    cp [hl]
    add $54
    ld l, h
    add hl, hl
    add hl, sp
    ld de, $0000
    add b
    add c
    add b
    add b
    add b
    ld d, b
    jr nz, jr_00d_565b

    adc $4e

jr_00d_569d:
    ld c, b
    scf
    nop

jr_00d_56a0:
    db $10
    ld d, c
    nop
    cp h
    add h
    add d
    add d

jr_00d_56a7:
    inc bc
    inc bc
    sub a
    ld l, c
    inc bc
    ld [bc], a
    ld l, c
    nop
    nop

jr_00d_56b0:
    ld [$0406], sp
    ld bc, $0708
    ld bc, $9200
    nop
    jr nz, jr_00d_56df

    jr nz, @+$41

    inc hl
    inc a
    inc l
    di
    ld sp, $0000
    rst $08
    ld b, [hl]
    sbc a
    sbc d
    ld a, $0e
    pop af
    jr nc, jr_00d_569d

    rst $00
    ld a, a
    ld a, [hl-]
    rst $38
    pop bc
    rst $38
    nop
    and c
    add b
    ld bc, $7f08
    ld a, $ff

jr_00d_56dc:
    jp nz, Jump_000_0009

jr_00d_56df:
    ld bc, $019d
    add c
    rst $38
    pop hl
    rst $38
    rst $30
    ret nz

    ret nz

    ld h, l
    nop
    inc bc
    nop
    di
    db $10

jr_00d_56ef:
    pop af
    add hl, bc
    ldh [$ffe0], a
    ld l, [hl]
    ld sp, $714e
    ld e, [hl]
    ld h, e
    ld e, l
    ld h, l
    sbc b
    add sp, -$48
    ret z

    nop
    ld [$c8b8], sp
    or h
    call z, $8080
    add a
    add b
    adc b
    add b
    sub b
    inc hl
    jr nz, jr_00d_56ef

    ret nz

    ld b, a
    ld b, a
    ld b, b
    nop
    ld [$160f], sp
    add hl, de
    rra
    db $10
    ld bc, $0f08
    ld [$0707], sp
    inc bc
    ld [bc], a
    add e
    add d
    add e
    nop
    ld c, b
    add d
    add l
    add a
    add [hl]
    add l
    adc e
    adc h
    sub e
    sbc h
    dec a
    ld a, $39
    add hl, bc
    ret nz

    ld b, b
    dec sp
    add hl, bc
    ldh [rSC], a
    nop
    ldh [$ff59], a
    ld [$0707], sp
    inc b
    inc b
    add hl, bc
    add hl, bc
    inc de
    ld [de], a
    daa
    inc h
    ld b, e
    ld b, d
    dec a
    dec a
    nop
    inc b
    nop
    nop
    ccf
    ld [hl+], a
    rst $38
    ld b, d
    rst $38
    add e
    rst $38
    rlca
    ld bc, $8300
    rst $38
    pop bc
    ccf
    jr nz, jr_00d_5761

    nop

jr_00d_5761:
    sub l
    db $10
    ld bc, $c7ff
    ld sp, hl
    cp a
    di
    sbc l
    rst $30
    add hl, de
    rst $38
    ld [$f8ff], sp
    rst $38
    or b
    nop
    nop
    rst $38
    db $10
    rst $38
    add hl, de
    rst $38
    and $ff
    inc b
    rst $38
    ld b, $ff
    db $fd
    ld hl, sp-$68
    db $fc
    add h
    nop
    nop
    cp $82
    rst $38
    ld hl, $25ff
    rst $38
    ld c, c
    ld a, [$ff4a]
    or a
    or e
    rst $08
    or d
    adc $00
    nop
    and h
    call c, $fc8c
    sub h
    db $f4
    and h
    db $e4
    ld b, h
    ld b, h
    inc b
    inc b
    jr c, jr_00d_57de

    ld b, $06
    ld [hl-], a
    nop
    dec b
    ld hl, sp+$08
    rlca
    ld [bc], a
    add d
    add hl, bc

jr_00d_57b1:
    sub a
    ld [de], a
    ei
    ld a, [$fecf]
    sbc a
    rst $28
    cp [hl]
    ret z

    cp a
    ret nc

    nop
    nop
    db $fc
    ret c

    rst $30
    rst $00
    ldh [c], a
    ld [bc], a
    pop hl
    ld bc, $01c1
    pop bc
    pop bc
    ld sp, $0931
    add hl, bc
    inc e
    nop
    rrc a
    db $ed
    ld c, b
    rst $20
    add hl, bc
    ld l, h
    ld c, d
    ld b, $18
    inc e
    jr nz, jr_00d_57fd

jr_00d_57de:
    jr jr_00d_57e7

    rlca
    ld [bc], a
    ld a, [bc]
    inc b
    nop
    ld [bc], a
    inc a

jr_00d_57e7:
    jr z, jr_00d_57b1

    sbc e
    dec bc
    inc a
    inc a
    jp $8543


    nop
    ld [bc], a
    rst $38
    rst $38
    ld h, l
    ld b, l
    ld h, d
    nop
    nop
    ld b, d
    pop hl

jr_00d_57fb:
    pop bc
    ld a, b

jr_00d_57fd:
    jr c, jr_00d_57fb

    inc b
    rst $30
    or h
    db $d3
    ldh a, [c]
    dec h
    push hl
    ld [hl], h
    db $f4
    adc c
    nop
    add b
    ld sp, hl
    dec bc
    ld a, [$f2f2]
    inc b
    inc b
    cp $04
    db $fc
    jr c, @-$06

    ret z

    ret c

    sub b
    and e
    add hl, bc
    ret nz

    ld [bc], a
    rla
    db $10
    ccf
    db $10
    inc bc
    ld [bc], a
    dec h
    ld a, [bc]
    ld e, [hl]
    jr nc, jr_00d_5878

    ld d, e
    add hl, bc
    sub b
    db $10
    ret z

    adc b
    call z, Call_000_0084
    inc b
    db $e4
    add h
    ld [hl], d
    ld b, d
    ld a, c
    ld b, c
    ld [hl], $36
    ld hl, $3f21
    dec hl
    ld [bc], a
    ld [bc], a
    add a
    add a
    ld b, $00
    ld bc, $0606
    inc b
    adc h
    sbc b
    sbc b
    sub b
    ld hl, sp+$25
    nop

jr_00d_5850:
    db $10
    db $10
    inc hl
    inc hl
    ld b, b
    ld b, b
    jr nz, jr_00d_5858

jr_00d_5858:
    nop
    jr nz, jr_00d_588b

    db $10
    jr nc, jr_00d_586e

    inc a
    inc a
    ld a, $22
    ld a, a
    ld a, l
    rst $38
    ldh a, [c]
    add hl, de
    jr nz, jr_00d_58a8

    nop
    nop
    ld b, c
    ld a, $42

jr_00d_586e:
    dec sp
    ld b, a
    ld [hl], d
    adc [hl]
    ld [hl], h
    adc h
    ld l, b
    sbc b
    xor b
    ret c

jr_00d_5878:
    add a
    add b
    rrca
    nop
    nop
    nop
    rst $38
    ld hl, sp+$3f
    rlca
    ld a, a
    inc c
    ld a, b
    jr nc, @-$3e

    ld b, b
    add c
    add c
    rst $38

jr_00d_588b:
    add a
    db $fc
    nop
    nop
    ld a, h
    ld hl, sp+$48
    ret c

    ret z

    ld hl, sp+$7c
    call $8246
    add e
    add c
    ld bc, $c8cc
    ld l, b
    inc b
    add b
    jr z, @+$33

    add a
    nop
    ccf
    db $10
    ld e, a

jr_00d_58a8:
    jr nc, @+$01

    jr nz, @+$01

    and b
    ccf
    jr nz, jr_00d_592f

    jr nz, jr_00d_58b9

    nop
    dec b
    db $10
    inc bc
    ld [$0110], sp

jr_00d_58b9:
    ld [$30c0], sp
    cp $00
    rst $30
    ld [$04f3], sp
    di
    dec c

jr_00d_58c4:
    ld [de], a
    rst $38
    nop
    ld a, $00
    nop
    or d
    inc c
    ld c, h
    nop
    jr nz, jr_00d_5850

    db $10
    ret nz

    inc c
    ldh a, [rSC]
    ldh a, [rSC]
    cp $01
    ld a, a
    ld d, d
    nop
    ld a, b
    push de
    add hl, bc
    ld b, $04
    xor l
    ld a, [bc]
    jr nc, jr_00d_58c4

    ld [bc], a
    and $c4
    db $fc
    ld [$c8f8], sp
    ld a, b
    jr nc, jr_00d_591f

    inc bc
    inc b
    add h
    ld a, [bc]
    adc b
    ld [bc], a
    rra
    rrca
    rlca
    inc bc
    inc bc
    inc bc
    rlca
    ld bc, $0801
    rrca
    ld bc, $011f
    sbc a
    nop
    nop
    pop af
    sbc a
    ldh a, [c]
    rra
    ldh a, [c]
    rrca

jr_00d_590c:
    ld a, [$f63f]
    ld a, a
    add $ff
    add d
    rst $38
    ld bc, $b481
    ld d, c
    ld bc, $5b83
    ld a, [bc]
    ld bc, $0135

jr_00d_591f:
    ld bc, $0110
    ld h, a
    jr nz, jr_00d_590c

    ld hl, $ff01
    and b
    ld bc, $9010
    ld bc, $1010

jr_00d_592f:
    rla
    add b
    rst $28
    ld bc, $1095
    add hl, bc
    db $10
    ld [$096b], sp
    nop
    nop
    jr nc, jr_00d_596e

    inc c
    inc c
    jr nc, jr_00d_5972

    ld [$0908], sp
    jr jr_00d_5947

jr_00d_5947:
    ld [bc], a
    nop
    nop
    ld [bc], a
    ld [bc], a
    inc c
    inc c
    ld a, b
    ld a, b
    ld [$2000], sp
    nop
    nop
    ld a, h
    ld a, h
    nop
    nop
    nop
    xor b
    cp $fe
    ld [bc], a
    ld [bc], a
    inc b
    inc b
    jr jr_00d_597b

    ld h, b
    ld h, b
    ld c, d
    nop
    nop
    ld b, b
    nop
    nop
    ld b, d
    nop
    nop

jr_00d_596e:
    db $10
    add b
    ld b, h
    ld b, h

jr_00d_5972:
    jr c, @+$3a

    or a
    inc c
    inc h
    inc h
    ld a, $3e
    ld h, l

jr_00d_597b:
    ld h, l
    ld [de], a
    ld [de], a
    db $10
    db $10
    dec [hl]
    ld [$0014], sp
    ld a, $3e
    inc bc
    ld [$1904], sp
    inc de
    ld e, $1e
    db $10
    db $10
    ld a, [hl]

jr_00d_5990:
    ld a, [hl]
    db $10
    db $10
    ld a, $3e
    ld d, l
    ld hl, $0000
    nop
    ld c, c
    ld c, c
    ld [hl-], a
    ld [hl-], a
    rst $20
    ld l, h
    ld bc, $0600
    ld [bc], a
    nop
    nop
    nop
    ld h, b
    rlca
    cp $0f
    ld hl, sp+$1f
    ldh a, [$ff3f]
    ldh [$ff7e], a
    pop bc
    ld a, h
    ret nz

    inc a
    ldh [rP1], a
    db $10
    inc l
    ldh a, [$ffe0]
    nop
    ret nz

    nop
    jp $fc00


    inc bc
    nop
    db $fc
    add hl, hl
    jr @+$0e

    ld [bc], a
    ld h, b
    add b
    nop
    inc e
    add c

jr_00d_59cd:
    ld h, b
    ld bc, $0180
    nop
    ld bc, $bc18
    jp $c0bf


    cp a
    ret nz

    sbc [hl]
    pop hl
    nop
    nop
    adc h
    di
    add c
    cp $c3
    cp h
    pop af
    adc $7f
    add b
    ccf
    ret nz

    rrca
    ldh a, [rTAC]
    ld hl, sp+$00
    nop
    ld [hl], d
    adc l
    ld hl, sp+$07
    db $fc
    inc bc
    db $fc
    inc bc
    add a
    ld a, b
    rst $00
    jr c, jr_00d_5990

    ld l, h
    add hl, sp
    add $00
    nop
    ld a, h
    add e
    cp $01
    rst $38
    nop
    ld a, a
    add b
    ld hl, sp+$07
    ldh a, [rIF]
    ldh [$ff1f], a
    ldh [$ff1f], a
    add b

jr_00d_5a13:
    ld bc, $3fc0
    nop
    rst $38
    nop
    rst $38
    inc bc
    inc bc
    nop
    ld bc, $0358
    db $fc
    inc b
    ei
    ld b, $f9
    rrca
    ld [bc], a
    nop
    ldh a, [rSCX]
    ld [$f807], sp
    inc bc
    db $fc
    db $e3
    inc e
    pop af
    ld c, $64
    sbc e
    rrca
    ldh a, [$ff8f]
    ld [hl], b

jr_00d_5a39:
    nop
    nop
    rst $20
    jr jr_00d_5a39

    inc b
    db $fc
    inc bc
    sbc [hl]
    ld [hl], b
    sub [hl]
    ld a, b
    rst $08
    jr c, jr_00d_5a13

    inc a
    rst $20
    inc e
    jr nz, jr_00d_59cd

    ld h, h
    sbc a
    daa

jr_00d_5a50:
    call c, $950b

jr_00d_5a53:
    jr nz, jr_00d_5a53

    ld bc, $1ee1
    inc e
    ldh [$fff0], a
    nop
    ldh [$ff95], a
    nop
    ld a, [bc]
    nop
    jr nz, @-$4d

    nop
    add b
    sub $30
    jr c, jr_00d_5a50

    ld a, h
    inc de
    ld e, $09
    rrca
    inc b
    rlca
    ld [bc], a
    rlca
    ld [bc], a
    ld b, b
    jr nz, @+$0d

    ld bc, $0933
    cp $01

Call_00d_5a7b:
    and c
    ld [$609f], sp
    rst $08
    jr nc, @-$7b

    ld a, h
    sub l
    ld [$c13e], sp
    add b
    nop
    sbc [hl]
    ld h, c
    call $f233
    rrca
    ld sp, hl
    xor l
    nop

jr_00d_5a92:
    db $fd
    inc bc
    ld a, [hl]
    add e
    rra
    db $fc
    rst $38
    ld sp, hl
    nop
    nop
    rst $30
    rrca
    rst $38
    ld [hl], b
    rst $08
    rst $38
    or l
    adc $75
    sbc [hl]
    jp hl


    add hl, hl
    ldh [rIE], a
    ldh a, [$ff1f]
    nop
    db $10
    ld hl, sp-$31
    db $fc
    cpl
    rst $38
    rla
    rst $38
    db $ed
    rst $38
    cp a
    ld l, a
    ld e, e
    or l
    ld [$ff5c], sp
    and d

jr_00d_5abf:
    nop

jr_00d_5ac0:
    nop
    and e
    inc hl
    ld [hl+], a
    db $fd
    sbc $73
    ld d, d
    daa
    ld h, $fe
    ld bc, $817e
    ld a, $c1
    sbc l
    adc b
    nop
    ld h, d
    db $eb
    inc d
    sbc a
    ld [$06f9], sp
    adc a
    sbc l
    nop
    rst $30
    jr jr_00d_5abf

    jr nc, jr_00d_5ac0

    jr nc, jr_00d_5a92

    ld [hl], b
    jr nc, jr_00d_5ae7

jr_00d_5ae7:
    ld a, $e0
    ld a, $e0
    adc c
    jr c, jr_00d_5b57

    add hl, hl
    ld bc, $0200
    ld bc, $0204
    inc b
    ld [bc], a
    ld a, [bc]
    inc b
    nop
    nop
    dec de
    inc b
    ld d, $09
    pop bc
    ld sp, $c101
    inc bc
    ld bc, $0306
    rlca
    ld bc, $010f
    ret nz

    nop
    add e
    inc b
    ld b, c
    add d
    ld a, [hl]
    add c
    ld [de], a
    add hl, bc
    ld b, l
    add hl, bc
    rra
    ldh [$ff8f], a
    ldh a, [$ff87]
    ld hl, sp+$3d
    jp RST_00


    sbc e
    ld h, [hl]
    jp $c43f


    inc a
    db $e4
    inc e
    ldh a, [c]
    ld c, $ff
    ld bc, $03fc
    ret nz

    ret


    nop
    nop
    add b
    add b
    ret nz

    add $40
    ld h, b
    ldh a, [$ffb0]
    ld a, e
    ld l, e
    rst $38
    xor l
    rst $38
    ei
    ld h, $3f
    nop
    nop
    inc d
    rra
    inc b
    rra
    ccf
    rra
    ldh [c], a
    ld a, a
    sub d
    rst $38
    sbc e
    cp $b7
    cp $fb
    db $fc
    add b
    nop

jr_00d_5b57:
    ld a, l
    jp nz, $c17e

    rst $38
    add b
    rst $38
    inc de
    ld bc, $827d
    cp e
    ld b, h
    db $fc
    inc bc
    cp $01
    ld bc, $a300
    ld [$e11e], sp
    ret nz

jr_00d_5b6f:
    ccf
    ret nz

    ccf
    add b
    ld a, a
    ld a, $e0
    ld l, $f0
    ld e, $f0
    ld d, $84
    nop
    ld hl, sp+$0f
    sbc [hl]
    ld bc, $fef3
    ld a, a
    adc [hl]
    rst $38
    ld l, c
    dec d
    ld a, [bc]
    dec de
    inc b
    dec sp
    inc b
    dec l
    ld [bc], a
    nop
    nop
    dec l
    ld [bc], a
    dec h
    ld [bc], a
    ld [de], a
    ld bc, $0011
    pop bc
    ld [bc], a
    ld bc, $0102
    nop
    inc bc
    ld bc, $3008
    jp nz, $c603

    ld bc, $0600
    add e
    jp $f97c


    ld h, $fc
    db $e3
    and l
    jr jr_00d_5b6f

    add hl, bc
    ld sp, hl
    ld b, $00
    ld bc, $0ef1
    rst $20
    jr jr_00d_5c04

    cp b
    rrca
    ldh a, [rHDMA3]
    add hl, bc
    rst $20
    jr @+$01

    cp h
    ld a, a
    ldh a, [$ff7f]
    nop
    nop
    rst $08
    ld a, a
    ret z

    ccf
    rst $38
    inc h
    db $e4
    ld e, a
    rst $38
    jr z, @+$01

    db $d3
    db $fc
    ld [hl], a
    ld hl, sp-$61
    nop
    nop
    sub b
    ld l, a
    pop af
    adc $f2
    ld b, h
    ld a, b
    add a
    ei
    or e
    adc $d7
    dec hl
    db $fc
    inc c
    di
    nop
    nop
    inc sp
    db $fc
    db $fc
    inc bc
    inc bc
    ld a, b
    ld a, b
    rst $38
    add a
    rst $18
    ld [$ff80], sp
    ld h, b
    ld a, a
    sbc b
    nop
    ld [$149f], sp
    rla

jr_00d_5c04:
    inc c
    rrca
    jp z, Jump_000_32cb

    inc sp
    jp z, $adcb

    ld [$00fc], sp
    ldh a, [$ff08]
    or b
    nop
    ret nz

    jr nc, jr_00d_5c37

    ret nz

    ld a, [hl-]
    ld [hl], c
    xor h
    ld [bc], a
    db $10
    rst $18
    ld bc, $0028
    daa
    nop
    inc hl
    nop
    ld h, c

jr_00d_5c26:
    nop
    jr z, jr_00d_5c89

    ld h, e
    ld bc, $3762
    ld bc, $0103
    nop
    ccf
    ld bc, $7eff
    rst $38
    add b

jr_00d_5c37:
    ld a, a
    ld bc, $3910
    ld de, $0470
    add [hl]
    rst $00
    jr c, jr_00d_5c7b

    ld a, [bc]
    ld hl, sp+$07
    di
    inc c
    ld sp, hl
    ld b, $03
    add hl, bc
    ld l, b
    ld a, [de]
    cp $01
    cp a
    ld d, a
    ld e, a
    add hl, hl
    add b
    ld bc, $609f
    rrca
    ldh a, [$ff67]
    sbc b
    pop af
    ld sp, hl
    ld bc, $00c3
    rrca
    di
    dec c
    rst $20
    dec de
    adc $33
    nop
    nop
    adc [hl]
    ld [hl], e
    cp b
    jr nc, jr_00d_5c26

    jr nc, @-$3a

    add b
    jp Jump_00d_60c0


    jr nz, jr_00d_5c26

    sub b
    call c, Call_000_00cc
    nop

jr_00d_5c7b:
    rst $30
    or e
    push af
    dec [hl]
    ld l, e
    dec sp
    ld d, a
    cpl
    rst $38
    pop bc
    call z, Call_000_0fc7
    rlca

jr_00d_5c89:
    inc e
    rrca
    db $f4
    ld b, b

jr_00d_5c8d:
    ldh a, [rIE]
    cpl
    dec hl
    add a
    cp b
    ld [de], a
    inc d
    inc hl
    ld b, h
    inc bc
    ld [hl], e
    ld a, [hl+]
    ld b, d
    inc bc
    ld b, d
    inc bc
    ld b, e

jr_00d_5c9f:
    ld bc, $0000
    nop
    ld h, b
    nop
    ld c, h
    nop
    ld b, e
    nop
    pop bc
    ld l, c
    jr nz, @+$1b

    ld bc, $f398
    ld c, h
    ld hl, sp+$27
    ld hl, sp+$1f
    ld hl, sp+$07
    nop
    ld [$0df2], sp
    rst $20
    jr jr_00d_5c8d

    jr nc, @-$5f

    ld h, b
    ccf
    ret nz

    ld a, a
    and l
    ld bc, $837c
    add hl, sp
    add $30
    inc bc

jr_00d_5ccc:
    inc de
    db $ec
    add a
    ld a, b
    dec sp
    add hl, bc
    xor e
    ld [$0cf3], sp
    scf
    dec bc
    xor a
    jr z, @+$01

    nop
    ld e, $e3
    dec a
    jp Jump_000_0001


    db $d3
    jr c, jr_00d_5ccc

    jr jr_00d_5d45

    call z, $e0e0
    rst $38
    rra
    db $fc
    rrca
    db $fc
    rlca
    db $fc
    rlca
    ld a, [$0000]
    rlca
    db $fd
    inc bc
    jr nz, @+$41

    ret nz

    rst $38
    ld b, c
    cp $27
    ld hl, sp+$37
    add sp, $4f
    ldh a, [$ff8f]
    ld sp, hl
    nop
    dec h
    inc bc
    ld hl, sp+$00
    dec b
    dec bc
    or l
    dec bc
    ld bc, $0708
    dec de
    xor e
    dec bc
    inc bc
    nop
    ld [bc], a
    nop
    ld b, $00
    ld c, $00
    jr jr_00d_5c9f

    ccf
    rlca
    ld bc, $53f2
    rrca
    ld [hl], b
    ret nz

    rst $38
    ldh [$ff7f], a
    jr jr_00d_5d43

    ld c, $05
    inc bc
    inc bc
    inc sp
    nop
    ld b, $cc
    ld bc, $03f9
    dec sp
    ld hl, $7f80
    ret nz

    cp a
    ld h, b
    rst $38
    jr nz, jr_00d_5d7c

    add hl, hl
    xor a

jr_00d_5d43:
    jr @-$0d

jr_00d_5d45:
    ld c, $63
    add hl, bc
    ld e, a
    add hl, hl
    ld c, a
    and b
    cp c
    ld bc, $13d0
    cp l
    ld a, [de]
    ld e, l
    add hl, bc
    di
    inc c
    add a
    add hl, de
    ldh a, [rIF]
    db $e4
    dec de
    adc $31
    di
    ld [$9b80], sp
    inc bc
    ld d, a
    ld [hl], a
    inc bc
    jr jr_00d_5db7

    inc h
    ld bc, $1c00
    ld bc, $0e10
    sbc a
    nop
    inc bc
    ldh a, [c]
    adc c
    sub a
    inc e
    ld bc, $0300
    dec b
    nop
    ld [hl], a

jr_00d_5d7c:
    inc c
    or e
    inc c
    add b
    inc bc
    nop
    sub a
    inc b
    rst $20
    ld [$30df], sp
    rst $38
    db $10
    rst $28
    jr @+$01

    ld [$0df6], sp
    ld a, h
    rlca
    ld a, l
    ld b, $1c
    ld a, $3f
    inc b
    ld h, a
    jr z, @+$5d

    add hl, bc
    sbc a
    ld a, [de]
    inc sp
    call z, $f807
    rrca
    ld a, [hl-]
    ld e, l
    ld e, c
    sub c
    inc c
    ld l, e
    dec de
    ld de, $ef0c
    stop
    ld [bc], a
    rst $30
    ld [$0404], sp
    ld a, a
    ld a, a
    inc c

jr_00d_5db7:
    inc c
    inc d
    nop
    nop
    inc c
    inc c
    inc b
    inc b
    ld [$0008], sp
    ld c, b
    ld a, [bc]
    ld a, [bc]
    nop
    nop
    inc a
    inc a
    ld [bc], a
    ld [bc], a
    nop
    nop
    jr nz, jr_00d_5dcf

jr_00d_5dcf:
    nop
    ld e, $1e
    cpl
    dec l
    ld a, [hl]
    ld [hl+], a
    nop
    ld a, [hl]
    add hl, sp
    dec l
    ld b, d
    ld b, d
    ld b, c
    nop
    db $10
    ld b, b
    ld b, b
    ld d, b
    ld d, b
    jr nz, jr_00d_5e05

    nop
    nop
    jr nc, jr_00d_5e19

    ret nz

    nop
    inc c
    inc c
    jr nc, jr_00d_5e1f

    ld [$0908], sp
    jr @+$39

    ld [$7f7f], sp
    ld hl, $1221
    ld [de], a

Call_00d_5dfb:
    inc d
    inc d
    ld [bc], a
    jr nz, jr_00d_5e10

    nop
    nop
    dec b
    dec b
    dec h

jr_00d_5e05:
    dec h
    ccf
    ccf
    inc h
    inc h
    ld b, h
    ld b, h
    ld [$0000], sp
    db $10

jr_00d_5e10:
    stop
    ld bc, $4040
    ld b, a
    ld b, a
    ld e, c
    ld e, c

jr_00d_5e19:
    ld b, d
    ld b, d
    dec a
    ld [$4c4c], sp

jr_00d_5e1f:
    ld b, e
    ld b, e
    dec b
    dec b
    ld a, l
    ld [$7d40], sp
    db $10
    db $10
    ld l, e
    ld [$2020], sp
    db $10
    db $10
    inc c
    inc c
    ld [$3e08], sp
    ld a, $03
    ld [$8604], sp
    nop
    inc b
    ld a, a
    jr jr_00d_5e73

    jr @+$12

    db $10
    jr c, @+$3a

    ld b, e
    ld [$4343], sp
    ld [hl+], a
    ld [hl+], a
    ld a, c
    ld a, c
    dec h
    dec h
    ld [bc], a
    ld [$0024], sp
    db $10
    ld b, h
    ld b, h
    ld c, b
    ld c, b
    inc e
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
    inc [hl]
    nop
    inc b
    inc b
    rst $18
    dec e
    ld h, [hl]
    nop
    nop
    ld e, d
    sbc c
    ld bc, $0650
    ld d, d
    ld a, d
    nop
    nop

jr_00d_5e73:
    ld h, b
    jr nz, jr_00d_5eb6

    ld bc, $3f28
    ld bc, $0000
    ld a, a
    rra
    jr c, @+$01

    ld bc, $0200
    ld [$f80f], sp
    rrca
    or b
    ld bc, $0402
    rlca
    cpl
    jr nc, jr_00d_5ece

    ccf
    rst $38
    jp nz, $04ff

    ei
    db $fc
    ld a, a

jr_00d_5e97:
    jr @+$1a

    jr jr_00d_5e97

    db $e4
    cp $20
    ld d, b
    rra
    rst $38
    dec b
    rst $38
    ld [bc], a
    ld c, a
    ld c, b
    ld a, a
    add b
    add b
    rst $38
    ld bc, $0102
    jr z, @-$01

    ld bc, $0300
    ld a, $21
    cp $9f

jr_00d_5eb6:
    ld c, b
    sbc l
    ld c, b
    adc d
    db $10
    adc l
    ld b, b
    rrca
    ld l, b
    ld bc, $ad01
    jr c, jr_00d_5ee3

    rra
    ldh [$ffe0], a
    xor l
    nop
    ret nz

    ccf
    nop
    inc b
    rst $38

jr_00d_5ece:
    db $10
    rra
    rrca
    rrca
    ccf
    ccf
    ret nz

    ret nz

    ccf
    cp l
    ld [$847f], sp
    rst $38
    dec c
    rst $38
    inc bc
    nop
    nop
    db $10
    and [hl]

jr_00d_5ee3:
    nop
    db $fd
    ld e, $e3
    rst $38
    ret nc

    rst $38
    ld d, b
    ld a, a
    ld a, a
    add d
    rst $18
    pop hl
    rst $30
    ld sp, hl
    nop
    nop
    rst $38
    ld a, [hl]
    rst $38
    rra
    cp a
    rst $00
    ld [hl], a
    ld sp, hl
    adc a
    db $fc
    add b
    add b
    ret nz

    ld b, b
    pop bc
    ld b, c
    nop
    nop
    pop hl
    ld hl, $21e1
    db $e3
    ldh [c], a
    rst $20
    push hl
    cp $7a
    ld h, l
    ld h, l
    sbc b
    sbc b
    ld [$0008], sp
    ld d, h
    or a
    or a
    rst $18
    reti


    adc c
    adc b
    sbc b
    sbc b
    ld h, a
    ld h, a
    ld c, a
    ld b, c
    ld a, a
    ccf
    ld bc, $7b40

Jump_00d_5f29:
    jr @+$04

    nop
    ld b, $02
    inc bc
    inc bc
    dec b
    db $fd
    ld a, [$160a]
    inc d
    ld l, a
    add hl, bc
    ld l, a
    nop
    ccf
    ld hl, sp-$28
    add [hl]
    ld b, $04
    nop
    ld bc, $7d01
    add hl, sp
    ret nz

    ret nz

    jr nc, jr_00d_5f88

    rra
    ld [$8484], sp
    rrca
    rrca
    ld [bc], a
    inc bc
    inc b
    nop
    ld bc, $0507
    rlca
    ld b, $06
    inc b
    rst $38
    rst $38
    or l
    nop
    rla
    ld sp, hl
    ld e, $f2
    cp h
    ldh [$ff7e], a
    nop
    add b
    ld [hl], b
    cp a
    ldh a, [$ffbf]
    add sp, -$41
    add sp, $3f
    ldh a, [$ff38]
    rla
    ld a, l
    ld d, e
    ld a, a
    jp z, Jump_000_00aa

    nop
    nop
    ld b, b
    rst $38
    db $10
    rst $38
    db $10
    cp a
    ld a, [hl]
    db $eb
    or a
    adc a
    dec bc
    adc [hl]
    adc e
    add a

jr_00d_5f88:
    push bc
    add a
    nop
    nop
    ld b, l
    adc a
    add c
    rst $38
    ld bc, $01ff
    cp a
    rla
    rst $18
    ld [$86ef], sp
    ld d, a
    db $e3
    cpl
    nop
    ld b, $f1
    rla
    ld hl, sp+$1f
    rst $38
    sub b
    ldh a, [$ff81]
    add d
    ld bc, $4508
    add hl, bc
    add c
    ldh [c], a
    pop bc
    ld [hl+], a
    ld b, c
    ld b, $00
    ld [hl+], a
    sub c
    nop
    ld bc, $2450
    inc h
    ld h, h
    ld b, h
    ld c, h
    ld c, b
    rst $08
    adc b
    rst $08
    adc a
    db $fc
    adc b
    ldh a, [rP1]
    nop
    ldh a, [$ffc7]
    add e
    nop
    nop
    rlca
    nop
    ld a, a
    rlca
    db $fc
    ld a, b
    ret nz

    add b
    rrca
    rlca
    rst $38
    nop
    ld [bc], a
    ld a, b
    rst $38
    add b
    ld a, [hl]
    ld b, d
    rst $38
    ld a, a
    pop hl
    ret nz

    db $dd
    ld bc, $ff7e

jr_00d_5fe5:
    add a
    rst $38
    add d
    rst $38
    ld [bc], a
    nop
    ld h, b
    sbc l
    ld [$e7e7], sp
    jr c, @+$1a

    inc b
    inc b
    call z, $fecc
    halt
    cp $4a
    rra
    ldh a, [rP1]
    nop
    rst $18
    ldh a, [$ff6f]
    ld e, b
    ld [hl], a

jr_00d_6003:
    ld c, h
    cp e
    add $bd
    db $e3
    call c, Call_000_0ed3
    rrca
    ld sp, hl
    ld b, a
    nop
    ld b, b
    pop af
    ld c, a
    db $e3
    ld e, [hl]
    jp $e77e


    inc a
    rst $38
    jr @+$01

    add b
    rst $38
    jp Jump_000_0a15


    rst $38
    nop
    nop
    ld bc, $03fe
    db $fc
    rlca
    ei
    inc e
    pop hl
    ld a, [hl]
    add b
    rst $38

jr_00d_602e:
    ret nc

    ld [hl], b
    ret nc

    ld [hl], b
    adc b
    nop
    jr nc, jr_00d_602e

    ld c, b
    cp b
    ret z

    jr c, jr_00d_6003

    jr c, jr_00d_5fe5

    ld a, b
    sbc b
    ld a, b
    ld b, c
    sub e
    nop
    inc bc
    ld c, b
    inc bc
    ld b, e
    nop
    nop
    ld b, $44
    ld [$1048], sp
    ld d, b
    inc hl
    ld h, c
    rra
    ld e, a
    rlca
    ld b, h
    rlca
    ld b, [hl]
    rrca
    inc c
    nop
    ret nz

    ccf

Call_00d_605c:
    ld de, $637f
    rst $38
    rst $00
    rst $38
    ld b, a
    rst $38
    inc bc
    rst $38
    add c
    rst $38
    ld h, b
    ld d, e
    nop
    ld l, c
    ld a, [bc]
    adc b
    ld [$ff87], sp
    ld hl, sp+$59
    stop
    rst $38
    ld [hl], b
    ld bc, $f000
    rst $38
    ld hl, $00fb
    ld [bc], a
    rst $38
    inc b
    cp $00
    nop
    inc c
    db $fc
    sub h
    cp $86
    rst $38
    pop bc
    cp $26
    ld hl, sp+$08
    ldh a, [$ff90]
    ldh a, [rSVBK]
    db $10
    add b
    nop
    db $10
    rra
    rra
    cpl
    jr c, jr_00d_60db

    jr nc, @+$03

    ld [$705f], sp
    ld c, a
    ld e, b
    ld c, a
    ld e, b
    db $fc
    xor a
    nop
    ld bc, $7fff
    rst $38

jr_00d_60ac:
    ret


    rst $38
    ld d, b
    rst $38
    add sp, $4b
    nop
    ret nc

    rst $38
    ld b, b
    ldh [rIE], a
    db $db
    ccf
    nop
    nop
    or $0e
    cp $82

Jump_00d_60c0:
    xor $92
    or $8a
    db $fc
    db $e4
    sbc h
    sbc h
    jr nz, @-$1e

    jr nz, jr_00d_60ac

    ld c, $40
    ret nz

    rst $28
    nop
    rla
    dec hl
    sbc a
    ld l, b
    rrca
    ld c, b
    rlca
    ld b, l
    rrca
    ld c, b

jr_00d_60db:
    rrca
    ld c, h
    inc bc
    ld b, e
    ld c, c
    add hl, de
    rst $38
    nop
    add b
    sub b
    rst $38
    inc c
    rst $38
    dec bc
    rst $30
    ld de, $e1e3
    inc hl
    ld [hl+], a
    inc h
    inc h
    jr jr_00d_610b

    db $ed

jr_00d_60f4:
    stop
    nop
    rst $38
    db $fc
    ld c, a
    add $47
    inc h
    daa
    ld b, e
    ld b, e
    ld e, b
    ld e, a
    cp $34
    rst $38
    set 3, c
    nop
    db $10
    sub b
    adc b

jr_00d_610b:
    adc b
    adc d
    adc d
    sub c
    sub c
    ld hl, $023f
    ld sp, hl
    ld [$0000], sp
    ret nc

    ret nc

    ld h, b
    inc b
    ld [$4020], sp
    nop
    nop
    ret nz

    add b
    jr z, jr_00d_60f4

    ld e, a
    ld d, b
    ccf
    jr nz, @+$03

    jr z, @+$21

    ld de, $0f0e
    jr nc, jr_00d_6130

jr_00d_6130:
    rst $38
    and c
    rst $38
    ld b, c
    db $db
    ld bc, $0801
    ret nz

    ccf
    ldh [$ff3f], a
    pop hl
    inc c
    inc b
    inc c
    inc b
    ret c

    ld b, b
    inc bc
    ret z

    ldh a, [$ffb0]
    ldh [$ffa0], a
    ldh [rSC], a
    ld [$af20], sp
    ld l, e
    ccf
    ld l, c
    ld bc, $1840
    ld b, a
    ld h, e
    sbc h
    nop
    add b
    rlca
    ld hl, sp+$12
    call z, $fc02
    rlca
    ld hl, sp-$7f
    ld a, [hl]
    ld h, $de
    add c
    ld a, a
    add b
    ld h, a
    ld [hl+], a
    nop
    nop
    add c
    nop
    rst $30
    nop
    ld [hl+], a
    inc a
    ret z

    ldh a, [rTMA]
    ld hl, sp-$39
    jr c, jr_00d_61c5

    jr nc, jr_00d_61c7

    jr nc, jr_00d_617d

jr_00d_617d:
    ld [bc], a
    adc a
    ld [hl], b
    nop
    rst $38
    add hl, bc
    jr nc, jr_00d_61bd

    nop
    ld c, $04
    inc d
    inc b
    inc bc
    ldh a, [rIF]
    ldh a, [rIF]
    stop
    db $f4
    ld [$040b], sp
    sbc b
    ld a, [bc]
    ld bc, $4300
    add b
    nop
    ret nz

    ld a, h
    add b
    inc b
    rlca
    ld b, c
    nop
    dec b
    ld a, $30
    rst $08
    ld l, a
    add b
    pop bc
    nop
    add b
    dec sp
    dec de
    cp $76
    add hl, de
    ld [hl], c
    ld c, $18
    ld b, $07
    and b
    nop
    nop
    rst $38

jr_00d_61ba:
    inc a
    ret nc

    ld l, [hl]

jr_00d_61bd:
    ld hl, sp+$0b
    rst $28
    ld b, [hl]
    inc h
    adc [hl]
    nop
    rlca

jr_00d_61c5:
    rlca
    rrca

jr_00d_61c7:
    ret


    dec e
    di
    nop
    inc b
    ld a, [hl-]
    ld h, [hl]
    ld [hl], h

jr_00d_61cf:
    ld c, h
    ld l, b
    ld e, $10
    rra
    nop
    rra
    rst $18
    ld c, c
    ld b, b
    inc hl
    ld b, b
    inc hl
    ld hl, $0800
    sbc [hl]
    inc e
    ret nz

    ld c, $e0
    rrca
    ldh a, [rTAC]
    ld hl, sp+$03
    db $fc
    ld [hl-], a
    inc c
    cp $01
    rrca
    nop
    jr nz, jr_00d_61f4

    rrca
    nop

jr_00d_61f4:
    or c
    nop
    db $fc
    ld bc, $4f00
    or b
    ld bc, $005d
    dec b
    ld hl, sp-$3c
    dec sp
    ldh [$ff1f], a
    add b
    db $10
    ld a, b
    rlca
    rrca
    nop
    inc bc
    nop
    di
    ld [hl], $1c
    cp $3f
    ret nz

    ld a, a
    rst $30
    add hl, de
    nop
    ld l, h
    sub b
    ld a, [bc]
    ld [hl+], a
    jr nc, jr_00d_61ba

    ld bc, $6d0f
    inc d
    ret nz

    ccf
    ret nz

    ccf
    rlca
    dec a
    nop
    rra
    ld bc, $ddbf
    inc bc
    rlca
    ld hl, sp+$01
    nop
    add d
    inc c
    db $e3
    ld e, [hl]
    db $dd
    cp e
    cp [hl]
    ld h, l
    cp [hl]
    ld h, e
    sbc [hl]
    push af
    db $fd
    ld l, e
    rst $38
    ld a, [bc]
    ld a, $04
    add b
    set 3, a
    sub a
    inc c
    add b
    rst $28
    sub b
    rst $10
    xor b
    rst $00
    jr c, jr_00d_61cf

    ld a, a
    nop
    rst $38
    db $dd
    ld b, a
    inc b
    add d
    nop
    cp $0b
    inc b
    di
    inc c
    ret z

    ccf
    or b
    rrca
    nop
    nop
    cp $e9
    ld d, $e0
    rra
    ldh a, [rIF]
    nop
    adc b
    db $fc
    inc bc
    rst $38
    nop
    ccf
    ret nz

    ld bc, $3cfe
    inc a
    ld [bc], a
    add e
    inc d
    db $10
    db $10
    jr nz, jr_00d_627c

jr_00d_627c:
    nop
    nop
    add b
    ld e, $1e
    nop
    nop
    ld h, $26
    ld l, d
    ld l, d
    ld a, [hl+]
    ld a, [hl+]
    ld [hl-], a
    ld [hl-], a
    ld h, d
    ld h, d
    ld hl, $0000
    nop
    ld c, b
    dec b
    dec b
    dec h
    dec h
    jr z, jr_00d_62c0

    ld a, [hl]
    ld a, [hl]
    ld [$1008], sp
    nop
    nop
    inc c
    inc c
    add sp, $13
    ld a, a
    add hl, de
    ld b, b
    pop hl
    dec bc
    inc d
    inc d
    db $db
    add hl, bc
    ld b, c
    dec b
    jr nz, @+$81

    ld a, a
    ld hl, $1221
    ld [de], a
    inc d
    inc d
    ld hl, $0008
    ld b, b
    jr nz, jr_00d_62bd

jr_00d_62bd:
    inc e
    inc e
    ld a, [hl+]

jr_00d_62c0:
    ld a, [hl+]
    ld c, c
    nop
    nop
    add hl, hl
    add hl, hl
    ld [de], a
    ld [de], a
    inc b
    inc b
    rra
    ld [$3e3e], sp
    nop
    ld b, h
    ld [hl+], a
    ld [hl+], a
    ld d, h
    ld d, h
    inc c
    inc c
    ld [$3008], sp
    jr nc, jr_00d_630a

    ld [$7e7e], sp
    ld [hl+], a
    nop
    jr nz, jr_00d_632e

    nop
    nop
    ld c, h
    nop
    nop
    ld a, h
    ld a, h
    nop
    nop
    cp $fe
    ld [bc], a
    ld [bc], a
    inc b
    inc b
    jr jr_00d_630b

    ld h, b
    ld [bc], a
    ld hl, $1f60
    ld a, b
    ld b, b
    ld b, b
    ld b, d
    ld b, d
    ld [hl+], a
    ld [hl+], a
    rra
    ld [$0808], sp
    ld [hl], b
    ld [hl], b
    adc a
    ld [$2020], sp
    ld d, b

jr_00d_630a:
    ld b, b

jr_00d_630b:
    jr nc, jr_00d_633d

    inc l
    inc l
    xor a
    ld [$1f20], sp
    ld [bc], a
    ld [$7f08], sp
    ld a, a
    ld b, c
    ld b, c
    ld bc, $0000
    ld b, $58
    nop
    ld b, $18
    jr jr_00d_638b

    ld a, [bc]
    ld l, e
    ld a, [bc]
    ld b, d
    nop
    nop
    ld b, h
    ld b, h
    jr c, jr_00d_6366

jr_00d_632e:
    ld [$3f08], sp
    ccf
    db $10
    jr nz, jr_00d_6335

jr_00d_6335:
    db $10
    ld e, $1e
    ld hl, $9521
    inc c
    inc e

jr_00d_633d:
    inc e
    nop
    nop
    inc h
    inc h
    ld a, $3e
    ld h, l
    ld h, l
    db $10
    ret c

    ld de, $1211
    ld [de], a
    sbc e
    ld a, [bc]
    inc a
    inc a
    nop
    nop
    ld a, $3e
    ccf
    ld [$1881], sp
    ld c, d
    nop
    nop
    ccf
    ld c, b
    jp Jump_000_2f00


    ld c, $31
    jr jr_00d_6376

    ld [de], a
    db $10

jr_00d_6366:
    db $10
    rst $28

jr_00d_6368:
    ld [$5800], sp
    ld bc, $05f0
    ld [bc], a
    nop
    nop
    nop
    ld h, b
    ld h, h
    sbc a
    ld [hl], h

jr_00d_6376:
    adc a
    ld a, d
    add a
    ld a, [hl-]
    rst $00
    cp l
    jp $e19e


jr_00d_637f:
    xor [hl]
    pop de
    nop
    nop
    ld a, [hl]
    pop bc
    ld b, b
    rst $38
    jr nz, @+$01

    inc hl
    rst $38

jr_00d_638b:
    dec e
    cp $17
    ld hl, sp-$6d
    rst $38
    adc h
    db $fc
    nop
    ld b, b
    adc b
    ld hl, sp+$0e
    rst $38
    ld [hl], a
    ld hl, sp-$42
    pop bc
    rst $30
    rrca
    cp b
    ld a, b
    ret nz

    ret nz

    dec sp
    ld [$20fb], sp
    ld b, b
    rlca
    call c, $e03c
    ldh [rLYC], a
    ld [$0c0c], sp
    ld a, [de]
    ld d, $3d
    inc hl
    add b
    add b
    ld d, c
    jr z, jr_00d_63bb

    nop

jr_00d_63bb:
    nop
    ld bc, $0203
    rlca
    inc b
    dec bc
    inc c
    rlca
    inc b
    dec b
    ld b, $05
    ld b, $03
    ld [bc], a

jr_00d_63cb:
    add e
    nop
    ld b, b
    add d
    add d
    add e

jr_00d_63d1:
    add c
    add c
    rst $28
    rra
    rst $30
    rrca
    rst $30
    rrca
    rst $38
    rlca
    ei
    ld bc, $7310
    inc c
    add b
    adc a
    ld bc, $0000
    dec de
    jr z, jr_00d_6368

    add b
    ret nz

    ret nz

    ldh [$ffe0], a
    and b
    ld h, b
    jr nz, jr_00d_63d1

    ld h, b
    ld bc, $4000
    ld bc, $c3c3
    ld b, $05
    inc c
    dec bc
    sbc a
    jr c, jr_00d_637f

    nop
    nop
    ret nz

    ret nz

    ld [hl], a
    ret z

    ld e, a
    ldh [$ffde], a
    nop
    nop
    pop hl
    dec hl
    scf
    inc h
    ccf
    jr jr_00d_6430

    inc c
    rrca
    inc bc
    inc bc
    ld c, b
    ld hl, sp+$68
    ld hl, sp-$6c
    nop
    ld h, $fc
    inc c
    db $fc
    ld [$10f8], sp
    ldh a, [rNR41]
    ldh [$ff93], a
    jr jr_00d_64a1

    ld [$0101], sp
    reti


    jr jr_00d_64ad

    ld b, c
    nop

jr_00d_6430:
    nop
    cp $83
    db $fd
    rlca
    ld sp, hl
    rra
    ldh [c], a
    ld a, $c4
    db $fc
    ld a, b
    ld a, b
    nop
    nop
    add [hl]
    add l
    ret nc

    nop
    add h
    add a
    inc bc
    inc bc
    push af
    jr c, jr_00d_63cb

    nop
    nop
    inc bc
    ld c, c
    ld h, a
    sbc a
    ld e, b
    cp a
    ld l, $f1
    rst $38
    jp Jump_000_0600


    inc a
    inc l

jr_00d_645a:
    jr jr_00d_6474

    nop
    nop
    rlca
    rlca
    ret nz

    nop
    nop
    db $d3
    jr c, @-$0e

    ldh a, [$ff0c]
    dec bc
    inc c
    add b
    inc bc
    dec bc

jr_00d_646d:
    add hl, bc
    rrca
    rrca
    rrca
    rlca
    rlca
    add hl, sp

jr_00d_6474:
    add hl, de
    rra
    jr jr_00d_646d

    jr z, jr_00d_6481

    rlca
    ld hl, sp-$08
    call c, Call_000_0064
    ld [hl], b

jr_00d_6481:
    sbc $66
    xor $32
    db $ed
    inc sp
    pop af
    rra
    db $fd
    rra
    db $e3

jr_00d_648c:
    ccf
    ld e, a
    ld l, c
    nop
    ld hl, sp+$39
    add hl, hl
    rrca
    nop
    nop
    ld [$101f], sp
    cpl
    jr nc, jr_00d_649c

jr_00d_649c:
    nop
    cp $fe
    ld a, a
    add e

jr_00d_64a1:
    rst $38
    dec b
    rst $38
    ld [$00f7], sp
    jr nz, jr_00d_64c1

    rst $18
    jr nc, jr_00d_645a

    ld [hl], c

jr_00d_64ad:
    inc c
    ld [$080e], sp
    rlca
    ld b, $01
    ld bc, $090d
    add b
    add b
    and b
    ld b, b
    add c
    add c
    ld e, $0e
    inc bc
    jp hl


jr_00d_64c1:
    nop
    add b
    add a
    nop
    jr nc, jr_00d_64e7

    ld a, h
    ld a, b
    rst $38
    add [hl]
    sub c
    ld [$1870], sp
    ld [bc], a
    jr nc, jr_00d_64f1

    rrca
    dec d
    ld [$09db], sp
    rra
    jr @+$72

    ld h, b
    ret nz

    ld [$0080], sp
    ldh [$ffc0], a
    ld a, b
    jr nc, jr_00d_6504

    inc b
    ld e, $0c

jr_00d_64e7:
    jp nz, $847e

    dec hl
    ld hl, $c141
    add c
    add c
    add hl, bc

jr_00d_64f1:
    add hl, bc
    rlca
    rlca
    ccf
    jr c, jr_00d_656f

    nop
    ld [bc], a
    ld d, b
    ldh a, [$ffa0]
    rst $38
    ccf
    rst $38
    db $fc

jr_00d_6500:
    rst $38
    jp $18e5


jr_00d_6504:
    ld hl, sp+$48
    ld a, h
    inc h
    cp $fe
    jr nc, jr_00d_648c

    db $fd
    ld bc, $fcff
    sra c
    and a
    add hl, bc
    ret nz

    ret nz

    jr nz, jr_00d_6538

    ccf
    jr nz, jr_00d_6579

    ld h, c
    add c
    ld a, [hl+]
    nop
    jr nz, jr_00d_6521

jr_00d_6521:
    ld a, [$7fc7]
    add c
    rst $38
    ld bc, $2f00
    pop af
    ld e, a
    pop hl
    cp l
    jp $827e


    db $fc
    inc b
    nop
    nop
    ld [hl], h
    adc h
    jr c, jr_00d_6500

jr_00d_6538:
    db $10
    ldh a, [$ff03]
    ld [bc], a
    ld b, $04
    ld [$1808], sp
    db $10
    db $10
    db $10
    inc [hl]
    ld b, b
    jr nc, @+$22

    ld bc, $0708
    adc b
    add hl, hl
    inc de
    ld a, [de]
    nop
    ldh [$ff80], a
    db $fc
    ld [hl], b
    ccf
    ld c, $0f
    dec d
    jr nc, jr_00d_6561

    ld bc, $8c00
    ld bc, $000f
    rst $38

jr_00d_6561:
    add b
    rst $38
    ld h, b
    ld a, a
    jr @+$41

    ld b, $0f
    ld bc, $0607
    rra
    nop
    nop

jr_00d_656f:
    add hl, de
    ld a, $27
    ld a, b
    ld c, a
    ldh a, [c]
    sbc a
    push af
    sbc l
    ld h, h

jr_00d_6579:
    ld a, h
    inc hl
    ccf
    cp $7f
    add d
    nop
    ld bc, $9fff
    ei
    ldh [$ffa0], a
    adc b
    adc b
    jr nc, @-$71

    ld bc, $098f
    ld h, a
    rst $38
    sub h
    sbc a
    ld c, h
    nop
    jr nz, jr_00d_65e4

    ld l, $27
    xor h
    and a
    ld l, c
    rrca
    add hl, bc
    rrca
    add hl, de
    rrca
    ldh [rNR41], a
    sub l
    nop
    ldh [rLCDC], a
    ld bc, $83c4
    ld de, $0e0e
    ld de, $7f11
    ld b, b
    ld a, a
    ld b, b
    ccf
    ld [hl], l
    ld sp, $8080
    and b
    inc de
    ld [bc], a
    sbc l
    add hl, sp
    nop
    db $10
    add hl, bc
    ld c, $30
    jr nz, @+$1a

    db $10
    ld e, $10
    rrca
    ld [$0407], sp
    dec b
    ld a, [bc]
    add b
    add b
    inc bc
    nop
    ld [hl+], a
    nop
    rlca
    nop
    rra
    inc bc
    rst $38
    rlca
    rst $38
    rrca
    ld bc, $ff00
    rra
    rra
    db $d3
    ld de, $e080
    ld [bc], a
    ld [hl+], a

jr_00d_65e4:
    ldh [$ff03], a
    ld bc, $fcf8
    ld hl, sp-$04
    db $fc
    rlca
    nop
    sbc a
    ld [$001f], sp
    ccf
    ld bc, $7f00
    ld b, $00
    nop
    ld a, e
    ld a, [bc]
    jr z, @+$41

    inc d
    rla
    rlca
    rlca
    rrca
    ld a, [bc]
    rst $18
    call nc, Call_000_343e
    ld e, $14
    nop
    nop
    sbc a
    ld [de], a
    rst $08
    adc c
    ld h, [hl]
    add $30
    ldh a, [rIE]
    add hl, hl
    ld a, e
    ld c, c
    ld a, a
    ld c, l
    ld a, e
    ld l, $00
    nop
    ld a, e
    cp $12
    ld e, $7b
    cpl
    db $fc
    call nz, $ccfc
    cp $52
    rst $38
    ld h, a
    ld hl, sp+$48
    stop
    ld sp, hl
    ret nc

    ldh [$ffe0], a
    db $10
    dec bc
    jr nz, jr_00d_6657

    ld d, [hl]
    ld d, [hl]
    ld e, d
    ld e, d
    call nc, $8e94
    adc [hl]
    ld b, b
    nop
    nop
    ld b, b
    ld b, c
    ld b, c
    ld hl, $2221
    inc hl
    ld hl, $2021
    jr nz, jr_00d_665e

    db $10
    ld d, $16
    dec bc
    nop
    jr jr_00d_6661

    adc d
    adc l

jr_00d_6657:
    ld c, b
    rst $08
    ld c, b
    rst $08
    ld b, h
    rst $00
    rst $00

jr_00d_665e:
    rst $00
    push hl
    ld a, [hl+]

jr_00d_6661:
    rst $10
    add hl, bc
    add [hl]
    add [hl]
    inc c
    nop
    sbc c
    ld [$1010], sp
    jr nz, jr_00d_668d

    rra
    rra
    rrca
    sub a
    nop
    rst $38
    rlca
    daa
    ld bc, $0801
    ld bc, $00fc
    nop
    ld [bc], a
    add b
    db $fd
    ld bc, $f808
    ld sp, hl
    ld hl, sp-$05
    jr nc, @-$0b

    nop
    ei
    ld [de], a
    di
    ld [hl+], a
    db $e3

jr_00d_668d:
    ld b, d
    ld bc, $0008
    nop
    rst $30
    ld b, h
    rst $38
    jr c, @+$01

    nop
    rst $28
    cpl
    pop bc
    pop bc
    dec de
    dec de
    daa
    inc h
    inc l
    jr z, jr_00d_66a3

jr_00d_66a3:
    nop
    ld c, b
    ld c, b
    sbc e
    sub c
    rra
    ld d, $ff
    dec l
    ld a, $18
    cp h
    ld [$9cff], sp
    rst $38
    ld h, a
    nop
    ret nz

    ld a, a
    inc h
    rst $38
    call nc, Call_000_38ff
    pop af
    ld [hl], c
    adc $4e
    ret z

    ld c, b
    adc a

Jump_00d_66c3:
    adc a
    ccf
    ld a, [de]
    inc sp
    ld bc, $1000
    ld [bc], a
    inc b
    inc b
    ldh a, [c]
    ldh a, [c]

jr_00d_66cf:
    ld c, $0e
    nop
    nop
    jr nc, jr_00d_66d5

jr_00d_66d5:
    ld a, b
    ld bc, $1500
    dec d

jr_00d_66da:
    ld [$0102], sp
    ld [$13bb], sp
    inc bc
    jr c, jr_00d_66e3

jr_00d_66e3:
    ld a, h
    nop
    sbc [hl]
    ld [hl], a
    inc hl
    rlca
    rlca
    ld a, b
    ld a, b
    add h
    add h
    ld [bc], a
    jr nz, jr_00d_66f7

    ld [bc], a
    nop
    nop
    ld h, b
    ld b, b
    nop

jr_00d_66f7:
    ld [$8181], sp
    ld [bc], a
    scf
    nop
    rst $20
    add hl, bc
    inc bc
    inc bc
    ld a, $3c
    ld hl, sp-$80
    jr z, jr_00d_66cf

    ldh a, [rNR10]
    ld h, b
    jr nz, jr_00d_676c

    ld b, b
    add [hl]

jr_00d_670e:
    add hl, bc
    rst $38
    db $fc
    rlca
    ld a, d
    ld [hl+], a
    ld e, $35
    ld bc, $081f
    inc d
    nop
    rst $38
    nop
    ld bc, $8000
    sub l
    ld bc, $7f20
    jr nz, jr_00d_6765

    db $10
    cp a
    jr jr_00d_6746

    jr jr_00d_6744

    db $10
    ld de, $4000
    inc bc
    ld a, [bc]
    ld b, $04
    and e
    dec de
    ccf
    rrca
    rst $38
    ld h, h
    rst $38
    sub h
    adc a
    rrca
    ld b, $04
    ld b, $08
    and $02

jr_00d_6744:
    add d
    ld [bc], a

jr_00d_6746:
    adc e
    dec bc
    add e
    add b
    add a
    add b
    ccf
    ld de, $010a
    ld [$f100], sp
    ld bc, $4300
    db $10
    dec b
    jr nz, jr_00d_66da

    dec bc
    ld e, $00
    inc a
    nop
    db $fc
    nop
    cp $13
    jr nc, jr_00d_67c0

jr_00d_6765:
    ld bc, $10b9
    cp $01
    db $10
    rst $38

jr_00d_676c:
    nop
    db $10
    db $10
    ld [$310b], sp
    jr nz, jr_00d_6795

    nop
    jr nz, jr_00d_67a8

    ld hl, $1111
    daa
    inc de
    jp $0301


    db $10
    inc d
    ld c, $00
    rrca
    ld b, $08
    nop
    inc bc
    ld bc, $53c1
    jr jr_00d_670e

    rst $38
    ld h, d
    ld a, a
    inc [hl]
    rst $38
    jr z, @+$01

    inc h

jr_00d_6795:
    rst $38
    call nz, Call_000_00ff
    ld c, $ce
    ld sp, hl
    adc a
    ldh a, [$ff1f]
    ldh a, [$ff1f]
    ldh [$ff3f], a
    push de
    ld [$0977], sp
    sbc l

jr_00d_67a8:
    add hl, bc
    ld [$0408], sp
    inc b
    nop
    db $10
    dec b
    dec b
    dec d
    dec d
    db $fc
    db $fc
    jr nc, jr_00d_67e7

    ld d, b
    ld d, b
    jr nc, @+$32

    adc a
    add hl, bc
    halt
    halt
    ld a, [hl+]

jr_00d_67c0:
    dec h
    ld bc, $0000
    ld [hl-], a
    nop
    nop
    ld h, d

Call_00d_67c8:
    ld h, d
    ld h, a
    ld [$3e3e], sp
    rlca
    add hl, bc
    ld e, $1e
    ld h, c
    ld h, c
    dec e
    dec e
    ld [hl+], a
    ld c, b
    nop
    ld [hl+], a
    inc e
    inc e
    ld c, a
    dec l
    ld a, [hl]
    ld a, [hl]
    ld e, c
    dec e
    ld [hl+], a
    ld [hl+], a
    ld a, c
    ld a, c
    jr nz, jr_00d_6807

jr_00d_67e7:
    ld b, d
    ld b, d
    ld c, a
    call nz, Call_00d_4f00
    ld [de], a
    nop
    nop
    inc c
    inc c
    ld [$0000], sp
    inc e
    inc bc
    db $10
    jr c, jr_00d_6832

    inc h
    inc h
    ld b, h
    ld b, h
    ld b, e
    ld h, b
    ld l, b
    ld b, e
    dec b
    dec b
    ld a, l
    ld a, l
    ld l, a

jr_00d_6807:
    jr jr_00d_6818

    ld a, [bc]
    inc c
    inc c
    inc a
    inc a
    ld h, l
    add hl, bc
    nop
    rst $00
    nop
    add e
    ld [$001e], sp
    ld c, b

jr_00d_6818:
    ld e, $3c
    inc a
    nop
    nop
    ld a, $3e
    ld b, c
    ld b, c
    ld bc, $7101
    add hl, bc
    jr jr_00d_683f

    ld c, a
    ld l, b
    inc e
    stop
    inc e
    ld a, [hl+]
    ld a, [hl+]
    ld c, c
    nop
    db $10

jr_00d_6832:
    add hl, hl
    add hl, hl
    ld [de], a
    ld [de], a
    inc b
    inc b
    nop
    nop
    inc a
    inc a
    ld h, [hl]
    jr c, jr_00d_683f

jr_00d_683f:
    ld h, [hl]
    ld c, $0e
    cp l
    inc c
    pop bc
    inc c
    nop
    ld l, b
    ld bc, $0790
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
    ld hl, sp+$0c
    sub b
    sub $21
    inc b
    ld [bc], a
    ld [$0001], sp
    ld a, [bc]
    ld bc, $1b00
    inc c
    nop
    nop
    ld hl, sp+$19
    jr z, jr_00d_688d

    rrca
    ccf
    jr nc, jr_00d_68a7

    jr @+$05

    inc bc
    nop
    ld bc, $1d1f
    ei
    ldh [c], a
    rst $38
    rst $38

jr_00d_688d:
    ld hl, sp+$07
    dec [hl]
    ld [$0c0c], sp
    ld a, [$fdfa]
    dec b
    rrca
    jr nz, jr_00d_68da

    inc bc
    add e
    add b
    ld h, c
    ldh [$ff1f], a
    jr z, jr_00d_68ae

    inc c
    ret


    ret


    push hl
    and l

jr_00d_68a7:
    ei
    sbc e
    ld d, l
    jr jr_00d_690c

    add h
    cp b

jr_00d_68ae:
    ld h, b
    sub b
    nop
    nop
    ld h, b
    ld h, b
    or b
    sub b
    ld h, l
    add sp, -$80
    ld a, a
    dec de
    sbc c
    db $10
    and e
    ld [$089c], sp
    db $10
    ld d, c
    nop
    jp nz, $0800

    ld [bc], a
    nop
    ld [hl+], a
    inc e
    nop
    ld [$0007], sp
    ld a, c
    ld [$7c1c], sp
    ld h, b
    ldh a, [$ff80]
    ldh [$ff80], a
    ld h, b
    add b

jr_00d_68da:
    nop
    ld b, b
    jr nc, jr_00d_690e

    rrca
    rrca
    rst $38
    rst $38
    or a
    jr @+$09

    rlca
    ld a, c
    ld a, [hl]
    db $eb
    sbc h
    rst $30
    jr jr_00d_68ee

    nop

jr_00d_68ee:
    rrca
    jr z, @+$01

    rst $38
    pop af
    rrca
    ei
    rlca
    or d
    ld c, [hl]
    dec e
    ld hl, sp-$19
    cp $19
    rra
    inc c
    nop
    nop
    rlca
    add e
    inc bc
    ldh a, [$ffe0]
    sbc h
    sbc b
    ld h, a
    ld h, a
    rst $38
    adc a

jr_00d_690c:
    push af
    sbc l

jr_00d_690e:
    ld [$5eba], a
    nop
    add b
    cp $a2
    cp $df
    ld [hl], c
    ld a, $3e
    sbc [hl]
    ld a, [bc]
    ldh [$ff60], a
    ldh [rNR41], a
    ret nz

    ret nz

    ei
    xor b
    inc h
    nop
    ld bc, $1501
    ld e, c
    cp $fe
    dec h
    jp hl


    dec b
    ld b, $0f
    ld [$101f], sp
    ld a, $21
    ld a, [hl]
    ld b, c
    nop
    nop
    cp $b5
    call z, Call_000_0ccb
    dec bc
    rst $18
    add hl, sp
    cp [hl]
    ld h, [hl]

jr_00d_6944:
    cp $5e

jr_00d_6946:
    ld [hl], b
    ldh [$ff9e], a
    adc [hl]
    nop
    nop
    sub d
    sbc d
    sbc [hl]
    sub [hl]
    add d
    sub [hl]
    ld [hl], h
    adc h
    push hl
    sbc a
    and a
    ld e, a
    add $7e
    ld h, $3e
    nop
    nop
    dec d
    rra
    ld c, $0d
    dec b
    inc b
    ld a, $15
    rrca
    call z, $e2c3
    db $e3
    ldh a, [c]
    add e
    jp nz, Jump_000_0002

    jp Jump_000_0001


    ld b, e
    add d
    add [hl]
    add [hl]
    ld b, c
    pop bc
    and b
    ld h, b
    ret nc

    jr nc, jr_00d_6946

    jr c, jr_00d_6944

    inc a
    stop
    db $e4
    inc e
    cp $7e
    add e
    ld [$8283], sp
    ld b, a
    ld b, a
    ld a, [hl+]
    ld a, [hl+]
    inc d
    inc d
    inc [hl]
    inc h
    inc h
    jr nz, jr_00d_6996

jr_00d_6996:
    inc h
    ld a, a
    ld a, a
    ldh a, [$ffb0]
    xor a
    jr jr_00d_699f

    nop

jr_00d_699f:
    rlca
    inc bc
    inc e
    inc c
    ccf
    ld bc, $c0cf
    nop
    db $10
    inc hl
    jr nz, @+$21

    db $10
    ccf
    rrca
    ldh a, [rSVBK]
    add a
    add b
    ld a, a
    rrca
    push bc
    jp hl


    inc c
    dec bc
    dec c
    ld h, b
    nop
    dec bc
    ld a, [bc]
    ld c, $0c
    inc c
    ld c, h
    ld de, $01f2
    add $c2
    nop
    jr nz, jr_00d_69eb

    jr nc, jr_00d_69dd

    add hl, de
    ld [$0030], sp
    ld [$1810], sp
    db $10
    ld [bc], a
    nop
    add e
    ld de, $1e80
    inc c
    cp d
    or d

jr_00d_69dd:
    ld c, d
    ld [hl], d
    inc l
    inc [hl]
    inc l
    nop
    nop

jr_00d_69e4:
    inc [hl]
    add hl, sp
    ld bc, $0203
    rlca
    inc b

jr_00d_69eb:
    rrca
    ld [$0d0a], sp
    ld [$080f], sp
    rrca
    inc b
    nop
    ld [bc], a
    rlca
    xor $9e
    rst $38
    ld sp, $41ff
    rst $38
    add b
    ld bc, $9100
    ld a, [hl]
    ldh [c], a
    ld a, h
    call z, Call_000_0064
    nop
    ld b, h
    ld b, [hl]
    ld b, h
    ld b, a
    ld b, d
    rst $00
    add e
    adc [hl]
    add d
    sbc h
    add h
    ld sp, hl
    adc b
    di
    sub c
    ld [hl], c
    nop
    nop
    jr nc, jr_00d_69e4

    ld b, e
    adc a
    add h
    rra
    ld [$307f], sp
    rst $18
    ld [hl], b
    sbc a
    ldh a, [$ff1f]
    ldh a, [$fff0]
    nop
    ret nz

    rst $38
    rst $38
    inc c
    rst $38
    ld [bc], a
    rst $38
    ld bc, $01ff
    db $fd
    inc bc
    ld sp, hl
    rlca
    di
    sbc a
    ldh a, [$ffaf]
    ld [hl], b
    ld c, b
    nop
    ld [$0606], sp
    add l
    ld c, c
    jr jr_00d_6a60

    sbc a
    ld [$7068], sp
    call c, $f9bc
    cp [hl]
    ld b, [hl]
    ld b, [hl]
    adc b
    nop
    nop
    adc b
    inc bc
    inc bc
    ld a, [bc]
    dec c
    scf
    add hl, sp
    ld c, a
    ld [hl], c
    ld e, a
    ld [hl], e

jr_00d_6a60:
    ld e, l
    ld l, l
    ld a, $22
    ld e, [hl]
    nop
    nop
    ld b, d
    ld [hl], b
    or b
    ldh [$ffc0], a
    ldh [$ff80], a
    pop hl
    ld hl, $41e1
    and $46
    cp $8a
    ld a, d
    nop
    nop
    ld [hl], d
    and $a3
    call z, $89c7
    adc [hl]
    dec de
    inc c
    inc sp
    inc e
    dec sp
    inc e
    ld a, e
    inc e
    ld a, l
    nop
    nop
    ld l, $38
    rst $18
    db $fc
    rra
    rst $38
    ccf
    cp $3f
    db $fd
    ld a, $fd
    ld a, $fb
    inc a
    ei
    nop
    ld [hl+], a
    inc e
    dec b
    rst $38
    ld e, $e1
    rst $38
    ret nz

    rst $38
    nop
    ld bc, $3c28
    inc a
    ld h, [hl]
    nop
    nop
    ld a, [hl]
    ld a, [hl]
    add c
    dec d
    dec b
    ld [$6666], sp
    nop
    nop
    ld a, h
    ld a, h
    rrca
    ld [$2805], sp
    nop
    rra
    db $10
    ld h, b
    nop
    db $10
    ld h, [hl]
    ld h, [hl]
    inc a
    adc $99
    inc a
    rra
    jr z, jr_00d_6af9

    jr jr_00d_6aed

    ld [$7e7e], sp
    dec e
    ld [$2805], sp
    rrca
    jr z, jr_00d_6b54

    ld a, h
    inc sp
    jr jr_00d_6b1b

jr_00d_6adc:
    jr z, @+$70

    ld l, [hl]
    ld h, l
    ld [$08c7], sp
    ccf
    ld [$1867], sp
    ld l, a
    jr c, jr_00d_6b26

    inc a
    jr jr_00d_6aed

jr_00d_6aed:
    jr nc, jr_00d_6b4e

    ld [$3e3e], sp
    inc c
    nop
    jr nz, jr_00d_6b62

    ld l, h
    jr c, jr_00d_6b31

jr_00d_6af9:
    ld bc, $2ff8
    ld [$6c6c], sp
    ld a, b
    ld a, b
    ld [hl], b
    ld [hl], b
    ld a, b
    ld a, b
    ld l, h
    ld l, h
    sbc a
    ld [$188b], sp
    sub c
    jr jr_00d_6b7d

    ld [$18bd], sp
    add d
    add b
    ld e, d
    nop
    db $10
    ld b, d
    ld b, d
    nop
    nop
    ld h, d

jr_00d_6b1b:
    nop
    nop
    ld [hl], d
    ld [hl], d
    ld e, d
    ld e, d
    ld c, [hl]
    ld c, [hl]
    ld b, [hl]
    nop
    nop

jr_00d_6b26:
    rrca
    inc a
    cp a
    jr jr_00d_6adc

    jr z, @-$3f

    ld [$3981], sp
    inc bc

jr_00d_6b31:
    inc bc
    inc b
    rlca
    dec b
    ld b, $91
    add hl, sp
    ld e, c
    inc bc
    ld e, h
    dec hl
    and [hl]
    ld de, $c0c0
    ret nz

    add c
    ld h, b
    and b
    ld h, b
    and b
    dec b
    ld b, $01
    ld e, b
    inc de
    ld [$4803], sp

jr_00d_6b4e:
    inc b
    rlca
    rlca
    inc b
    inc bc
    inc bc

jr_00d_6b54:
    rst $10
    ld b, c
    ld a, c
    jr jr_00d_6b9f

    ld h, b
    ld h, b
    and b
    ld l, a
    ld e, e
    ld e, a
    add hl, hl
    rra
    ld c, c

jr_00d_6b62:
    ld a, e
    add hl, de

jr_00d_6b64:
    ld l, h
    ld l, h
    ld [hl], $36
    ld a, a
    ld e, c
    rra
    add hl, de
    ld h, [hl]
    ld h, [hl]
    jr nc, jr_00d_6b90

    ld e, a
    jr nc, jr_00d_6b7f

    inc c
    ld b, $06
    ld a, a
    add hl, de
    ld a, [hl]
    ld a, [hl]
    cpl
    add hl, sp
    dec de

jr_00d_6b7d:
    ld a, [bc]
    adc l

jr_00d_6b7f:
    add hl, sp
    ld e, a
    ld c, c
    jr c, jr_00d_6b87

    inc h
    ld e, c
    add hl, bc

jr_00d_6b87:
    nop
    ld a, h
    ld c, $00
    ld b, d
    nop
    nop
    dec e
    add hl, de

jr_00d_6b90:
    rst $18
    add hl, de
    dec de
    ld [$1971], sp
    inc h
    inc h
    rrca
    jr jr_00d_6bac

    jr c, jr_00d_6c08

    ld a, [bc]
    ld a, [hl]

jr_00d_6b9f:
    ld a, [hl]
    ld b, $06
    ret nz

    ld a, c
    inc c
    inc c
    jr jr_00d_6bc0

    jr nc, jr_00d_6bda

    rst $08
    add hl, de

jr_00d_6bac:
    ret


    ld b, b
    rst $08
    ld sp, $0e0e
    sub l
    ld a, [bc]
    ld a, a
    jr jr_00d_6b64

    add hl, bc
    adc c
    jr jr_00d_6beb

    inc sp
    inc b
    nop
    nop
    cp e

jr_00d_6bc0:
    inc b
    ld [$5310], sp
    inc de
    jp hl


    ld a, d
    ld b, b
    ld b, b
    add b
    add b
    rst $38
    ld a, d
    ld bc, $0d20
    ld a, [bc]
    ret nz

    nop
    nop
    ld l, b
    rst $38
    ld bc, $03a8
    db $fc

jr_00d_6bda:
    rrca
    ldh a, [$ff3f]
    ret nz

    nop
    rst $38
    ld bc, $07fe
    ld [$2826], sp
    adc h
    nop
    rra
    ldh [$ff30], a

jr_00d_6beb:
    or b
    ld c, d
    adc b
    ld hl, $01ff
    ld bc, $0810
    rst $30
    inc e
    di
    ld e, $f1
    rra
    ldh a, [rP1]
    nop
    rra
    db $fc
    rlca
    ld hl, sp+$0f
    ld a, b
    rst $08
    or h
    rst $28
    cp h
    rst $20

jr_00d_6c08:
    cp d
    rst $20
    sbc [hl]
    di
    sbc a
    nop
    add hl, de
    ld sp, hl
    ld h, b
    rst $38
    jr @+$01

    rlca
    cp $01
    add l
    jr nc, @+$40

    jp Jump_000_0031


    sub h
    nop
    cp a
    ret nz

    ld a, a
    jr nz, jr_00d_6c26

    ldh [rNR22], a

jr_00d_6c26:
    ld hl, sp+$0e
    db $fd
    sbc a
    ld [$fe01], sp
    inc bc
    ld [hl], $08
    ldh a, [rIF]
    ldh a, [$ff1f]
    ldh [$ff7f], a
    add d
    add b
    add b
    or b
    jr nc, jr_00d_6c43

    ld a, [$e01c]
    ld h, b
    xor d
    jr nc, jr_00d_6c62

jr_00d_6c43:
    ldh a, [rIE]
    add hl, de
    rrca
    ld c, $07
    adc $10
    nop
    ld [$7f80], sp
    ldh [$ff5f], a
    ldh a, [$ff8f]
    ld hl, sp+$0f
    ld hl, sp+$1f
    ld hl, sp-$22
    nop
    inc b
    ei
    dec bc
    cp $00
    nop
    ld a, [bc]
    db $fc

jr_00d_6c62:
    inc c
    ldh a, [$ff30]
    ret nz

    ld b, b
    sbc a
    sbc a
    sbc $52
    db $fd
    ld e, h
    di
    di
    ldh a, [rP1]
    nop
    nop
    ld [hl], b
    nop
    inc de
    nop
    inc bc
    ld bc, $0103
    sub d
    db $fd
    di
    db $fc
    add hl, bc
    ld e, $1c
    nop
    nop
    ccf
    ccf
    ldh [rIE], a
    ret nz

    ld [hl], e
    adc a
    rst $08
    inc a
    ld c, $ff
    pop bc
    ccf
    rst $38
    nop
    rst $18
    nop
    nop
    nop
    rst $20
    nop
    ldh [rP1], a
    pop af
    nop
    add $00
    add b
    rst $38

jr_00d_6ca1:
    ldh a, [rIE]
    inc c
    rst $38
    jp RST_00


    ccf
    ldh [$ff1f], a
    db $fc
    inc bc
    cp $01
    ld a, a
    nop
    ld [hl+], a
    rst $38
    ld d, c
    rst $38
    jr z, @+$01

    inc h
    nop
    nop
    rst $38
    or h
    rst $28
    cp d
    rst $20
    ld e, d
    rst $20
    or d
    ld c, a
    rra
    pop hl
    ccf
    jp nz, $c23e

    ld a, [hl]
    nop
    nop
    add h
    ld a, h
    add h
    ld a, h
    sbc b
    db $ed
    jr c, jr_00d_6ca1

    ld a, e
    ret nz

    add b
    inc bc
    ld bc, $070f
    rra
    nop
    nop
    rra
    ld a, a
    inc a
    rst $38
    ld [hl], c
    xor $c6
    ret c

    adc b
    ccf
    rra
    rst $38
    ld hl, sp-$08
    ldh [$ffe0], a
    jr nc, jr_00d_6cf0

jr_00d_6cf0:
    nop
    rst $38
    ld a, a
    add b
    add hl, de
    nop
    dec c
    ld [$68ef], sp
    rst $08
    adc b
    adc a
    adc b
    sbc a
    sub b
    rst $38
    ld h, a
    jr nz, jr_00d_6d14

    ld hl, sp-$08
    pop hl
    ldh [rIE], a
    ld c, a
    add hl, sp
    add b

jr_00d_6d0c:
    ld a, a
    ld b, b
    rst $38
    add c
    add e
    ld bc, $c100

jr_00d_6d14:
    add b
    pop bc
    nop
    nop
    ld b, b
    pop bc
    ld b, b
    ldh [rLCDC], a
    ldh [$ffa0], a
    ld h, b
    and b
    ccf
    ldh a, [$ff7f]
    ret nz

    cp a
    ret nz

    cp [hl]
    nop
    nop
    pop bc
    cp b
    rst $00
    sub c
    rst $28
    ld d, d
    ld l, a
    ld b, h
    ld a, [hl]
    db $fc
    nop
    jp $1f3c


    db $fc
    ld h, a
    nop
    nop
    db $fc
    adc e
    db $fc
    sub $f9
    inc [hl]
    dec sp
    db $f4
    ei
    sbc a
    nop
    rrca
    nop
    ld e, h
    inc bc
    ld hl, sp+$00
    nop
    rlca
    or d
    ld c, a
    dec h
    rst $18
    add hl, de
    rst $38
    ccf
    rst $38
    db $f4
    rrca
    rst $28
    rra
    and b
    rra
    or a
    nop
    nop
    ld [$049b], sp
    ret c

    rlca
    ld c, e
    add a
    ld b, h
    add e
    bit 7, a
    add a
    rst $38
    adc a
    rst $38
    sub e
    nop
    nop
    cp $03
    cp $c3
    ld a, a
    and $3e
    db $fc
    jr jr_00d_6d0c

    db $10
    and c
    ld hl, $a3e7
    ld c, a
    nop
    nop
    ld c, a
    ld e, a
    ld e, a
    rst $38
    rst $38
    ld a, [hl]
    ld a, [hl]
    ld a, c
    ld a, c
    rst $38
    ld a, a
    cp $fe
    db $fd
    db $fc
    rst $20
    nop
    nop
    db $e3
    call z, $30cc
    db $10
    ldh [$ff60], a
    add b
    add b
    sbc a
    adc a
    ld [hl], e
    ld [hl], d
    add e
    add d
    jp Jump_000_3000


    ld b, d
    ld b, e
    ld b, d
    ld h, e
    ld [hl+], a
    inc hl
    ld [hl+], a
    inc sp
    ld [de], a
    cp $03
    rst $38
    ld d, e
    add hl, de
    ld [$e902], sp
    add hl, bc
    nop
    nop
    dec d
    dec d
    ldh [rNR41], a
    or b
    ldh [$fff0], a
    ldh a, [$ffb0]
    ret nc

    or b
    ret nc

    ld a, b
    sub b
    add sp, $28
    nop
    ld [bc], a
    ret z

    ret z

    ld c, l
    ld a, c
    ld h, e
    ld [hl-], a
    ld [hl], d
    ld [hl-], a
    ld d, b
    nop
    nop
    ld d, l
    ld d, b
    ld h, l
    jr nz, jr_00d_6e23

    ld b, b
    nop
    nop
    ldh a, [$ff1f]
    ld [$090f], sp
    rrca
    dec b
    rlca
    ld [hl+], a
    ld [hl+], a
    jr nz, @+$22

    ret nz

    nop
    jr z, jr_00d_6df9

    nop
    nop
    ld a, [hl]
    pop hl
    rst $38
    sbc h
    cp a
    ld [hl+], a

jr_00d_6df9:
    inc bc
    ld bc, $0101
    ld de, $1011
    db $10
    ld b, $00
    nop
    nop
    rst $20
    add b
    rst $30
    add b
    cp a
    ret nz

    cp l
    jp nz, $e659

    ld e, d
    rst $20
    ld a, [hl+]
    scf
    dec [hl]
    ld a, $90
    nop
    db $fc
    inc b
    rst $38
    inc bc
    ld e, l

jr_00d_6e1c:
    jr jr_00d_6e1c

    ld [bc], a
    add hl, bc
    ld [$7272], sp

jr_00d_6e23:
    push hl
    push hl
    ret z

    ld c, b
    sub b
    sub b
    nop
    ld bc, $2020
    ld [hl], b
    ld [hl], b
    db $fc
    adc b
    rst $38
    rlca
    xor a
    ld a, [bc]
    add b
    add b
    ld b, b
    ld b, b
    jr nz, jr_00d_6e5b

    add hl, de
    nop
    nop
    add hl, de
    ld b, $06
    add a
    rlca
    inc de
    inc de
    dec d
    dec d
    inc d
    inc d
    jr jr_00d_6e63

    ld [hl], b
    ld [hl], e
    and b
    nop
    nop
    and h
    ld b, b
    ld c, b
    add b
    add a
    call nc, Call_000_34d4
    inc [hl]
    sub [hl]
    sub d

jr_00d_6e5b:
    ld d, d
    ld d, d
    ld c, d
    jp z, Jump_000_0082

    inc b
    ld b, d

jr_00d_6e63:
    inc bc
    ld hl, $0101
    add hl, bc
    add hl, bc
    rlca
    ld b, $08
    nop
    db $10
    inc b
    inc b
    inc c
    ld [$1009], sp
    nop
    add hl, bc
    pop bc
    ret nz

    jr nz, jr_00d_6e7a

jr_00d_6e7a:
    nop
    jr nc, jr_00d_6e8d

    jr c, @+$0a

    inc e
    inc c
    di
    di
    inc b
    inc b
    ld [$4400], sp
    ld [$3f3f], sp
    jr nc, jr_00d_6ecc

jr_00d_6e8d:
    ld c, $31
    ld e, $21
    ld [de], a
    ld bc, $d000
    ldh [c], a
    inc e
    db $10
    inc bc
    inc b
    stop
    nop
    ld [$0a00], sp
    ld bc, $0500
    ld bc, $0302
    dec [hl]
    ld a, $ab
    cp h
    or e
    xor h
    ld a, [de]
    nop
    add d
    dec h
    ld hl, sp-$39
    ld a, d
    add a
    dec e
    db $e3
    dec b
    ei
    ld e, $6b
    cp $00
    ld hl, sp+$00
    ldh a, [rNR31]
    ld [bc], a
    ld [$e003], sp
    nop
    ret nz

    ld bc, $8000
    nop
    ld hl, sp-$08

jr_00d_6ecc:
    ld d, c
    ld [hl], e
    ld h, d
    ld d, e
    ld bc, $0081
    ld b, b
    nop
    jr nz, jr_00d_6ee7

    ld b, b
    nop
    db $10
    ld [$6410], sp
    nop
    add hl, bc
    nop
    ld b, $06
    ld b, $f4
    db $f4
    rra
    rrca

jr_00d_6ee7:
    add l
    dec de
    db $10
    ld [$e008], sp
    ld [bc], a
    inc e
    and a
    ld [$c2c2], sp
    ld a, a
    ccf
    ld bc, $0001

jr_00d_6ef8:
    ld bc, $d010
    ld h, h
    rst $20
    sbc e
    nop
    nop
    rst $38
    add c
    ld [hl], $02
    ld [de], a
    ld [bc], a
    db $10
    ld [bc], a
    ld [de], a
    inc b

jr_00d_6f0a:
    nop
    inc b
    inc c
    rrca
    db $fc
    rst $38
    ld h, b
    nop
    inc a
    inc bc
    ld c, $03
    rlca
    xor e
    ld [bc], a
    xor a
    ld a, [bc]

jr_00d_6f1b:
    ld bc, $e1ff
    cp a
    pop af
    sbc a
    ei
    adc [hl]
    ld a, e
    ret nz

    and b
    ld c, $3f

jr_00d_6f28:
    inc b
    ccf
    nop

jr_00d_6f2b:
    rra
    cp [hl]
    dec hl
    ld [bc], a
    db $10
    ldh [$ff1f], a
    ld bc, $80fe
    sub e
    nop
    add b
    rrca
    jr nz, jr_00d_6f2b

    ret nz

    nop
    rst $38
    ret nz

    ccf
    db $e4
    inc hl
    ld [hl+], a
    db $10
    rst $08
    inc de
    rrca
    jr nc, jr_00d_6f28

    jr nz, jr_00d_6f0a

    ld b, b

jr_00d_6f4c:
    ld l, a
    add b
    rra
    ld c, b
    ld a, [bc]
    inc c
    inc b
    add b
    nop
    inc bc
    cpl
    jr z, jr_00d_6ef8

    jr nz, jr_00d_6f1b

    rra
    rst $20
    ld [$8241], sp
    ld [$0072], sp
    ld c, $4f
    jr z, jr_00d_6f28

    and b
    ld d, e
    nop
    inc b
    ld [bc], a
    inc b
    nop
    ld [bc], a
    ld e, a
    jr z, jr_00d_6f97

    inc b
    ld bc, $0202
    inc b

jr_00d_6f77:
    inc b
    rrca
    jr c, @+$21

    adc a
    ld [bc], a
    ld [bc], a
    nop
    rrca
    ld a, a
    jr nc, jr_00d_6f83

jr_00d_6f83:
    rst $38
    ld hl, sp+$07
    add b
    ld a, a
    nop
    rst $38
    ldh [$ff1f], a
    ld h, b
    sbc a
    jr jr_00d_6f77

    inc bc
    nop
    ld d, l
    inc l
    ld d, e
    inc c
    rlca

jr_00d_6f97:
    ld hl, sp+$19
    and $1f
    ldh [rTAC], a
    ld hl, sp-$02
    ld bc, $02fd
    dec sp
    call nz, $8d00
    or $08
    db $ed
    db $10
    ret c

    jr nz, jr_00d_6f4c

    ld h, b
    ld e, l
    inc c
    cp a
    sub d

jr_00d_6fb2:
    inc h
    sbc d
    inc e
    pop bc
    nop
    db $fc
    ld [hl], e
    ld bc, $0981
    rrca
    jr c, jr_00d_6fb2

    inc b
    ld sp, hl
    ld [bc], a
    ld a, h
    ld bc, $0811
    cp d
    inc e
    ldh a, [rIF]
    ret nz

    inc c
    ld a, [hl]
    add c
    rlca
    ld a, b
    nop
    ld b, d
    nop
    ccf
    jp $e01c


    rra
    rlca
    ld hl, sp-$08
    ld c, [hl]
    inc b
    inc bc

jr_00d_6fde:
    db $fc
    rst $38
    nop
    add hl, hl
    inc c
    rrca
    adc $04
    ldh a, [$fff5]
    ld [$0c10], sp
    add hl, hl
    jr jr_00d_6fde

    rrca
    ld a, [de]
    inc b

jr_00d_6ff1:
    inc [hl]
    ld de, $03fc
    ld h, $0c
    nop
    rst $38
    inc a
    inc a
    ld h, [hl]
    add hl, bc
    ld c, h
    nop
    nop
    ld a, [hl]
    ld a, [hl]
    dec b
    ld [$6666], sp
    nop
    nop
    ld a, h
    ld a, h
    rrca
    ld [$2805], sp
    nop
    nop
    rra
    ld [$e160], sp
    sbc h
    nop
    db $10
    ld h, [hl]
    ld h, [hl]
    inc a
    inc a
    rra
    jr z, jr_00d_704b

    jr jr_00d_703f

    ld [$7e7e], sp
    dec e
    ld [$2805], sp
    rrca
    jr z, jr_00d_70a6

    ld a, h
    inc sp
    jr jr_00d_70a7

jr_00d_702e:
    adc h
    ccf
    jr z, jr_00d_70a0

    ld l, [hl]
    ld h, l
    ld [$083f], sp
    ld h, a
    jr jr_00d_70a9

    jr c, jr_00d_7078

    inc a
    jr jr_00d_703f

jr_00d_703f:
    jr nc, jr_00d_70a0

    ld [$3e3e], sp
    inc c
    nop
    jr nz, jr_00d_7058

    add b
    ld l, h
    ld l, h

jr_00d_704b:
    jr c, jr_00d_7085

    cpl
    ld [$6c6c], sp
    ld a, b
    ld a, b
    ld [hl], b
    ld [hl], b
    ld a, b
    ld a, b
    ld l, h

jr_00d_7058:
    ld l, h
    sbc a
    ld [$082f], sp
    adc e
    jr jr_00d_6ff1

    jr jr_00d_70d1

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
    ld e, d
    ld hl, sp-$40
    ld c, [hl]
    ld c, [hl]
    ld b, [hl]

jr_00d_7078:
    nop
    nop
    cp a
    jr jr_00d_702e

    jr z, @-$3f

    ld [$3dff], sp
    inc bc
    inc bc
    inc b

jr_00d_7085:
    rlca
    dec b
    ld b, $08
    ld b, [hl]
    inc sp
    ld a, [de]
    sub c
    add e
    jr nz, jr_00d_70c6

    ret nz

    ret nz

    ld h, b
    ld a, a
    inc b
    dec b
    ld b, $01
    ld e, b
    inc de
    ld [$4803], sp
    inc b
    rlca

jr_00d_709f:
    rlca

jr_00d_70a0:
    inc b
    inc bc
    inc sp
    ld [de], a
    pop bc
    add a

jr_00d_70a6:
    ld b, [hl]

jr_00d_70a7:
    sbc b
    ld h, b

jr_00d_70a9:
    and b
    ldh [rNR41], a
    ret nz

    ld [hl], l
    ld [hl+], a
    ld a, e
    ld c, $5f
    add hl, hl
    rra
    ld c, c
    ld a, e
    add hl, de
    ld l, h
    ld l, h
    ld [hl], $36
    ld a, a

jr_00d_70bc:
    ld e, c
    ld bc, $1f92
    add hl, de
    ld h, [hl]
    ld h, [hl]
    jr nc, @+$32

    inc c

jr_00d_70c6:
    inc c
    ld b, $06
    ld a, a
    add hl, de
    ld a, [hl]
    ld a, [hl]
    cpl
    add hl, sp
    jr @+$1a

jr_00d_70d1:
    ld c, a
    add hl, hl
    dec de
    sbc a
    rst $18
    jr c, jr_00d_709f

    add hl, de
    inc h
    nop
    nop
    ld e, c
    add hl, bc
    nop
    nop
    ld b, d
    nop
    nop
    dec e
    add hl, de
    rst $18
    add hl, de
    dec de
    ld [$1971], sp
    inc h
    inc h
    rrca
    jr @+$05

    ld [hl], b
    ld de, $4f38
    ld [$7e7e], sp
    ld b, $06
    inc c
    inc c
    jr jr_00d_7115

    jr nc, @+$32

    rst $08
    add hl, de
    ret


    ld b, b
    rst $08
    ld sp, $5e0e
    jr nz, @+$10

    ld a, c
    ld [$187f], sp
    xor l
    add hl, bc
    adc c
    jr @+$32

    nop
    nop
    nop

jr_00d_7115:
    nop
    ld [$1008], sp
    db $10
    ld de, $409c
    ld b, b
    cp $07
    add b
    ld l, l
    inc hl
    nop
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp+$41
    call Call_000_1c1c
    dec sp
    daa
    ld a, a
    jr nc, jr_00d_70bc

    ld a, h
    ldh a, [$ffa0]
    ret nz

    dec a
    ld bc, $193f
    rst $38
    rst $38
    rst $30
    ld c, $fd
    inc bc
    rra
    nop
    rlca
    xor d

jr_00d_714e:
    inc b
    ld [bc], a
    ld h, b
    ld bc, $161d
    ld [hl], b
    ldh a, [$ffec]
    sbc h
    ld a, e
    rst $00
    cp [hl]
    ld h, c
    rst $18
    jr nc, jr_00d_714e

    ld de, $7802
    add hl, hl
    add b
    ldh [rSB], a
    add b
    ret nz

    ld b, b
    ldh [rNR41], a
    ld h, c
    ld hl, sp-$53
    ld d, l
    ld d, b
    ld [$01b9], sp
    jr c, jr_00d_71ad

    ld d, b
    ld [hl], b
    and b
    ldh [$ffa7], a

jr_00d_717a:
    jr z, jr_00d_71bc

    rst $20
    ld e, d
    db $dd
    dec e
    ld e, b
    cp $20
    inc sp
    jr nz, jr_00d_71a6

    ld d, b
    ld [hl], b
    ret nc

    ldh a, [rNR10]
    ldh a, [rHDMA1]
    ld d, e
    ld bc, HeaderLogo
    rra
    ld c, $f6
    add hl, hl
    rrca
    rlca
    ld a, a
    jr c, jr_00d_717a

    ld l, l
    dec b
    rst $38
    ld [$0cf7], sp
    ld [hl], a
    rrca
    ld a, e
    nop
    add b
    ld a, h

jr_00d_71a6:
    cp a
    ret nz

jr_00d_71a8:
    rst $38
    nop
    ld a, $01
    rra

jr_00d_71ad:
    rrca
    ldh a, [rNR10]
    rst $38
    rrca
    rst $30
    ld hl, sp+$55
    ld h, $80
    nop
    db $fc
    inc bc
    cp $1f

jr_00d_71bc:
    rra
    xor $f1
    ld h, e
    ld c, $fd
    inc bc
    or $0e

jr_00d_71c5:
    ret c

    jr c, jr_00d_71a8

    ldh [rNR42], a
    nop
    ld [hl], a
    dec bc
    ldh [rNR41], a
    ld b, b
    ret nz

    dec hl
    ld a, [hl+]
    ld bc, $0701
    rlca
    jr jr_00d_71f8

    dec a
    ld [hl+], a
    inc e
    ld e, $00
    ld [bc], a
    ld b, $04
    dec bc
    inc c
    rrca
    ld [$f02f], sp
    ld a, a
    ld c, c
    nop
    rst $38
    nop
    ld sp, hl
    nop
    ld c, l
    nop
    nop
    ld bc, $0817
    rst $30
    ld [$3fc0], sp

jr_00d_71f8:
    db $fc
    inc bc
    push de
    inc c
    db $e4
    rra
    add $3f

jr_00d_7200:
    and l
    ld a, a
    xor d
    nop
    nop
    ld a, e
    jr jr_00d_7200

    inc b
    db $fc
    ld [bc], a
    cp $21
    rst $38
    sbc c
    rst $38
    sub l
    rst $30
    ld c, d
    ld a, [$00ca]
    nop
    ld a, [$70f8]
    ret nz

    add b
    ld bc, $0700
    inc bc
    inc a
    rra
    ldh [$ff7f], a
    add e
    db $fc
    rra
    add e
    pop bc
    ld e, a
    nop
    add e
    nop

jr_00d_722d:
    ld a, a
    add c
    rst $38
    dec c
    di
    rra
    dec c
    ccf
    dec b
    ld a, a
    adc a
    ldh a, [$ffbf]
    ret nz

    dec bc
    jr jr_00d_71c5

    jr jr_00d_725c

    inc c
    cp $01
    di
    ld c, [hl]
    ld a, l
    rrca
    ld a, a
    rlca
    ret nz

    ret nz

    ld b, b
    ret nz

jr_00d_724d:
    ld b, b
    sub l
    jr c, jr_00d_722d

    ld a, [hl-]
    rrca
    ld [$1817], sp
    nop
    nop
    rra
    db $10
    dec hl
    inc [hl]

jr_00d_725c:
    inc hl
    inc a
    dec hl
    inc a
    scf
    inc [hl]
    ld h, $25
    rst $20
    jr jr_00d_724d

    rra
    nop
    nop
    db $eb
    add hl, de
    add sp, $19
    add sp, $18
    ld a, b
    adc b

Call_00d_7272:
    or $8e
    jp nc, $f5ee

    or $8b
    jp z, $c040

    adc c
    adc e
    add c
    add c
    add c
    nop
    jr z, jr_00d_7288

    ld b, $06
    inc b
    or b

jr_00d_7288:
    or b
    sub b
    sub b
    db $d3
    rra
    call $a319
    inc b
    ld a, c
    jr c, jr_00d_72fd

    scf
    inc bc
    rst $38
    rrca
    ld bc, $1f00
    ld bc, $ef08
    rra
    ld a, a
    rlca
    ret nz

    rst $38
    ldh [rIE], a
    ldh a, [rNR13]
    nop
    ld bc, $0400
    nop
    rst $08
    ldh a, [$ff9d]
    nop
    ld bc, $03ff
    rst $30
    rrca
    ld a, l
    db $fd
    add h
    db $fc
    ld c, b
    cp b
    inc c
    db $10
    ret z

    add hl, sp
    push hl
    ld bc, $1000
    add b
    add b
    ld bc, $131f
    ld h, d
    ld b, e
    adc [hl]
    halt
    dec sp
    pop hl
    pop hl
    pop af
    ld b, b
    nop
    ld de, $10f0
    dec b
    rlca

jr_00d_72d7:
    ld [bc], a
    nop
    nop
    ld h, b
    ld h, b
    sub b
    sub b
    ld [$0868], sp
    ld l, b
    sub c
    nop
    nop
    sub c
    ld a, $3e
    inc l
    inc l
    inc e
    inc e
    inc a
    inc [hl]
    ld c, b
    ld e, h
    xor h
    sbc h
    or d
    jp nc, Jump_000_006d

    nop
    db $ed
    ld b, $04
    ld [bc], a
    ld [bc], a
    db $fc

jr_00d_72fd:
    db $fc
    ret c

    adc b
    ld l, h
    ld b, h
    or [hl]
    and d
    call c, Call_000_12dc
    ld b, $40
    ld d, $b6
    ld l, e
    dec bc
    ld de, $ff06
    add hl, bc
    rst $38
    dec bc
    rst $38
    inc d
    rst $18
    db $f4
    rst $38
    jr c, jr_00d_72d7

    ld bc, $000f

jr_00d_731d:
    jr nc, jr_00d_731d

    rlca
    ld sp, hl
    ld a, [hl]
    rst $38
    add h
    rst $38
    inc b
    ei
    inc c
    rst $38
    ccf
    dec sp
    add hl, de
    add e
    ld bc, $ce0c
    nop
    nop
    ld sp, $e679
    sbc e
    db $e4
    pop de
    ld a, $a8
    ld [hl], b
    nop
    db $e3
    inc de
    adc h
    ld c, a
    jr nc, jr_00d_7381

    ld bc, $f10a
    ld bc, $06f9
    rrca
    ld sp, $c23f

jr_00d_734c:
    rst $38
    ld [bc], a
    or e
    nop
    ld [bc], a
    dec b
    jr jr_00d_734c

    ld hl, sp-$08
    ld [$0010], sp
    ld hl, sp+$08
    ldh a, [$fff0]
    ld a, [hl-]
    ld [bc], a
    db $10
    pop hl
    pop hl
    pop hl
    ld hl, $6f6f
    ld a, a
    ld e, b
    ld a, a
    ld [hl], b
    nop
    nop
    db $fd
    and e
    rst $38
    xor [hl]
    rst $30
    ld hl, sp-$23
    db $e3
    di
    rrca
    dec h
    and l
    rst $28
    rst $28
    ldh a, [c]
    db $d3
    nop
    nop
    ld l, h
    rst $28
    db $e3

jr_00d_7381:
    ld h, d
    rst $18
    sbc h
    adc [hl]
    dec b
    rlca
    inc bc
    sbc $de
    inc e
    inc d
    db $fc
    db $ec
    nop
    add d
    add h
    add h
    ld c, b
    ret z

    ld a, a
    cp a
    rst $18
    rst $00
    rrca
    sbc l
    rlca
    rlca
    nop
    inc e
    inc bc
    ld a, a
    ld e, c
    nop
    ld bc, $a500
    ld bc, $ff80
    ret nz

    ccf
    db $10
    ld e, a
    ld sp, $207f
    rst $38
    ld h, b
    rst $18

jr_00d_73b2:
    or b
    ld e, a
    jr nc, jr_00d_73b7

    nop

jr_00d_73b7:
    rst $38
    ld [bc], a
    jr c, jr_00d_73b2

    cp $fb
    rrca
    db $fd
    rlca
    rst $38
    ld [hl], a
    ld sp, hl
    adc a
    cp $05
    ei
    inc c
    nop
    nop
    ei
    inc a
    swap h
    dec bc
    db $f4
    db $db
    db $e4
    db $d3
    inc l
    ld e, e
    and h
    sbc e
    db $e4
    ld e, e
    db $e4
    add h
    nop
    dec de
    db $e4
    db $dd
    add hl, hl
    ei
    inc b
    db $fc
    inc bc
    ld l, l
    add hl, de
    ld a, [hl]
    add c
    ld a, [hl]
    add c
    cp [hl]
    ld b, c
    cp [hl]
    ld b, c
    nop
    inc b

Call_00d_73f0:
    sbc $21
    ld e, $e1
    adc $31
    pop bc
    jp $fc03


    add hl, de
    ld a, [de]
    cp $01
    xor $11
    pop bc
    jr nc, jr_00d_7413

    ld a, $fe
    cp $fe
    cp l
    ld [$01a7], sp
    dec bc
    db $f4
    inc b
    ei
    ld bc, $4dfe
    add hl, bc

jr_00d_7413:
    ld [bc], a
    ld [bc], a
    adc a
    adc b
    or b
    adc l
    rst $38
    ld [hl], b
    dec h
    ld a, [bc]
    adc a
    ld [hl], b
    inc bc
    nop
    nop
    rlca
    rlca
    adc a
    adc b
    rrca
    jr jr_00d_749c

    rlca
    ret nz

    xor a
    ld bc, $0001
    ld c, l
    ld [hl-], a
    ld hl, sp+$07
    rst $38
    ld c, b
    rst $00
    ld c, h
    jp $8386


    add c
    ret nz

    add b
    pop bc
    add b
    add c
    nop
    nop
    ret nz

    ld [hl], e

jr_00d_7444:
    ldh [$fffc], a
    ld b, a
    rst $38
    rlca
    db $ec
    jr jr_00d_7444

    ldh a, [rIE]
    jr nz, @+$01

    inc hl
    cp h
    nop
    nop
    ld a, a
    rst $00
    ld hl, sp-$25
    db $e4
    db $db
    inc h
    db $db
    inc h
    ld d, a
    jr z, @+$19

    add sp, -$2d
    db $ec
    pop de
    ld [$2e01], sp
    ret nc

    cpl
    dec c
    ld l, d
    or $09
    ld a, [$0105]
    ld [$03fc], sp
    db $fc
    inc bc
    ld sp, hl
    ld b, $f2
    jr z, @+$11

    dec c
    ld [bc], a
    db $fd
    add l
    ld [$7c00], sp
    ld bc, $b748
    and [hl]
    ld a, [de]
    dec c
    ld [$0fc9], sp
    or h
    ld a, [de]
    ld [hl], e
    adc h
    ld b, $f9
    inc h
    nop
    inc b
    ei
    ret nz

    ld a, [de]
    jr nz, @-$1f

    adc l
    ld c, $f0
    rrca

jr_00d_749c:
    ld sp, $00ce
    rst $38
    ld b, b
    cp a
    nop
    rst $38
    nop
    inc c
    ld [bc], a
    db $fd
    nop
    rst $38
    ldh a, [rIF]
    db $ec
    inc de
    ldh [$ff1f], a
    ld sp, $a740
    ld h, l
    ld bc, $0d20
    ld h, $29
    nop
    nop
    ld hl, sp+$16
    ld b, b
    rlca
    rlca
    inc hl
    ld e, b
    rst $38
    rst $38
    inc sp
    ld e, b
    ret nz

    ret nz

    ld b, e
    jr jr_00d_74cc

    nop

jr_00d_74cc:
    nop
    nop
    nop
    nop
    nop
    rrca
    rrca
    ld b, $04
    nop
    nop
    jr @+$1a

    inc e
    inc d
    ldh [$ffe0], a
    add a
    rlca
    cp b
    cp a
    nop
    nop
    ld b, a
    ld a, b
    ld b, b
    ld a, a
    nop
    nop
    inc bc
    inc bc
    rlca

jr_00d_74ec:
    rlca
    rrca
    rrca
    pop af
    cp $3f
    ret nz

    add d
    db $10
    rst $38
    ccf
    nop
    add h
    rst $38
    ld a, e
    adc h
    rst $38
    nop
    ld [$ff3f], sp
    ld bc, $4fe0
    nop
    ld a, h
    adc h
    cp $80
    nop
    ld b, $ff
    add l
    rst $38
    db $f4
    rst $38
    cp $12
    nop
    rra
    add a
    inc bc
    inc bc
    inc bc
    dec b
    rlca
    ld a, [bc]
    nop
    ld [$940e], sp
    sbc h
    add sp, -$08
    call c, $a2fc
    cp $c2
    cp $a3
    jr c, @+$03

    ld bc, $0203
    nop
    nop
    inc bc
    ld [bc], a
    dec bc
    ld [$1f1f], sp
    inc a
    inc h
    ld a, b
    ld c, b
    ld hl, sp-$70
    ret nc

    db $10
    or b
    jr nz, jr_00d_75a1

    nop
    jr nz, jr_00d_7564

    cp $fe
    inc bc
    ld a, c
    nop
    ret


    jr c, @+$3a

    jr c, jr_00d_74ec

    add [hl]
    rst $20
    ld h, c
    inc sp
    db $10
    add hl, de
    nop
    nop
    ld [$040c], sp
    inc b
    inc b
    ld b, $02
    inc bc
    inc bc
    inc b
    inc b
    sbc h
    sbc b
    rst $00

jr_00d_7564:
    ld b, a
    ret nz

    nop
    nop
    nop
    pop hl
    ld hl, $1273
    ld a, a
    rrca
    ccf
    ccf
    add hl, de
    ld e, $37
    jr c, jr_00d_75a4

    ld sp, $009c
    nop
    sub e
    add hl, de
    ld d, $13
    ld e, $96
    sbc a
    inc h
    rst $18
    call z, $dc3f
    scf
    sbc d
    ld [hl], e

jr_00d_7589:
    or a
    nop
    nop
    ld h, l
    cp h
    ld l, b
    jr c, jr_00d_7589

    add hl, hl
    jp hl


    ld [hl], e
    adc a
    db $f4

jr_00d_7596:
    inc c
    db $eb
    dec de
    add sp, $18
    ld [hl], b
    nop
    nop
    sub b
    or b
    ret nc

jr_00d_75a1:
    ld d, c
    ld [hl], c
    ld [hl+], a

jr_00d_75a4:
    jr nz, jr_00d_7596

    ldh [$fffc], a
    jr @+$01

    add [hl]
    db $fd
    ld b, a
    ld a, h
    nop
    nop
    daa
    ld [hl], $33
    ld h, $23
    ld h, $83
    db $fc
    db $fc
    jr nc, jr_00d_762b

    ld [$c618], sp
    adc [hl]
    ld h, l
    nop
    nop
    db $e3
    sub d
    ld [hl], c
    ret


    jr c, jr_00d_763c

    adc h
    rlca
    inc b
    rlca
    inc b
    ld c, $08
    ld c, $08
    inc c
    ld c, b
    nop
    ld [$101c], sp
    ld bc, $6008
    ld b, b
    nop
    ld [$80c0], sp

jr_00d_75df:
    add c
    add c
    adc a
    add [hl]
    cp e
    sbc l
    xor $02
    nop
    di
    dec de
    ld bc, $1f00
    rrca
    rst $30
    ld a, b
    cp a
    rst $08
    rst $38
    ld [hl], b
    rst $38
    add b
    rst $08
    nop
    ld [de], a
    nop
    nop
    ld [bc], a
    rst $38
    rst $38
    ld a, a
    add b
    rst $38
    rst $38
    jr @+$01

    pop hl
    ld e, $ff
    ld [$0cf7], sp
    db $fc
    ld [bc], a
    nop
    inc b
    dec c
    ld bc, $fe00
    rst $38
    inc de
    db $fd
    add $39
    xor $11
    cp $01
    add hl, de
    add hl, de
    db $fd
    nop
    nop
    db $fd
    rst $38
    inc bc
    db $fc
    inc b
    ld hl, sp+$18
    ldh [$ffa0], a
    ret nz

    ret nz

jr_00d_762b:
    add b
    add b
    ld h, b
    ldh [c], a
    ld d, c
    add b
    nop
    di
    ld d, c
    ldh a, [$ffc8]
    ld hl, sp+$48
    ld a, b
    ld bc, $5408

jr_00d_763c:
    ld [hl], h
    add c
    ld bc, $0180
    ld b, b
    add b
    nop
    nop
    ld e, $5e
    ld hl, $203f
    ccf
    daa
    jr c, jr_00d_766d

    db $10
    inc bc
    add e
    add d
    ld [de], a
    nop
    stop
    nop
    db $10
    jr nz, jr_00d_765a

jr_00d_765a:
    jr z, jr_00d_75df

    sub e
    add h
    add a
    adc a
    adc a
    cp d
    add $7d
    ld b, e
    ld a, b
    ld c, a
    nop
    nop
    halt
    ld c, a
    ld sp, hl
    add a

jr_00d_766d:
    ccf
    jp nz, $e31d

    db $ec
    rst $30
    rra
    rla
    dec de
    inc e
    cpl
    ld sp, $0000
    cp $c7
    db $fc
    rrca
    db $fc
    scf
    db $dd
    ld h, d
    cp a
    and b
    ld a, l
    sbc [hl]
    push hl
    ld a, [hl]
    add l
    cp $00
    jr nc, jr_00d_76ab

    and $7e
    add a
    rst $38
    rrca
    rst $38
    rra
    rst $38
    rra
    cp a
    nop
    sub l
    ld bc, $1003
    ld a, $c1
    ld b, b
    add b
    ret nz

    rst $38
    and c
    cp $f7
    rrca
    ld bc, $e708
    rra

jr_00d_76ab:
    rst $08
    ccf
    inc de
    rst $38
    inc a
    db $e3
    or c
    ld bc, $0818
    inc bc
    cp $82
    add [hl]
    ld bc, $0001
    db $fc
    call nz, $c4bc
    ld a, h
    add h
    inc sp
    ld l, d
    ld a, [hl+]
    ld l, $09
    rrca
    add b
    nop
    ld [$090f], sp
    rrca
    ld b, $06
    ld [bc], a
    nop
    db $10
    rrca
    rrca
    nop
    nop
    cp $e0
    sbc h
    ld a, h
    nop
    nop
    inc a
    ld h, h
    rst $38
    ld b, a
    cp h
    ld h, a
    sbc h
    ld [hl], a
    jr jr_00d_7706

    db $eb
    ld a, h
    cp e
    call z, $c4ff
    nop
    nop
    ld a, d
    ld c, l
    db $dd
    ldh a, [c]
    ld a, l
    adc $d4
    adc a
    ld [de], a
    rst $38
    jp hl


    rra
    or $0e
    db $f4
    inc c
    nop
    nop
    db $f4
    inc c
    db $e4
    inc e
    add h

jr_00d_7706:
    ld a, h
    ld [$1ff8], sp
    db $10
    rrca
    inc c
    rlca
    inc b
    db $e3
    ldh [c], a
    ld b, b
    ld b, b
    dec e
    db $fd
    cp $02
    rst $38
    ld bc, $0001
    rra
    cp $1f
    rst $38
    ld c, $ff
    inc b
    dec hl
    ld [bc], a
    ret nz

    ret nz

    nop
    ccf
    jr nz, jr_00d_7749

    jr jr_00d_777b

    or b
    sbc a
    jr z, @+$09

    ld [hl], b
    ld bc, $06ff
    cp $3c
    ld hl, sp+$08
    ld hl, sp+$00
    db $10
    ld [$10f0], sp
    ldh [rNR41], a
    ret nz

    ld b, b
    add b
    add b
    ld hl, sp+$78
    ccf
    xor a
    ld h, d

jr_00d_7749:
    nop
    nop
    ld [bc], a
    sub c
    nop
    ld c, a
    ld [bc], a
    inc b
    dec b
    ld [bc], a
    add hl, sp
    ld [bc], a
    ld [bc], a
    ld [bc], a
    and e
    ld a, [bc]
    ld e, $73
    cpl
    di
    rst $18
    ld a, [$c0af]
    nop
    nop
    ld h, e
    pop bc
    ld h, a
    jp nz, $e33d

    ldh a, [rIE]
    cp h
    sbc a
    rst $28
    ccf

jr_00d_776f:
    ret c

    ld [hl], b
    ld sp, hl
    stop
    nop
    ld hl, sp+$10
    cp b
    ret nc

    ld l, a
    sbc a

jr_00d_777b:
    ld l, b
    sbc b
    jr nc, jr_00d_776f

    ret nc

    ldh a, [$ff50]
    jr nc, jr_00d_7794

    ldh a, [rP1]
    nop
    add sp, $18
    inc e
    inc a
    cp $f2
    ld l, $32
    rst $38
    nop
    rst $28
    jr nc, @+$01

jr_00d_7794:
    ld de, $19ff
    inc b
    nop
    cp $0e
    ld l, c
    nop
    ld d, b
    ld hl, sp+$30
    add a
    add a
    db $f4
    db $f4
    add hl, de
    add hl, bc
    inc c
    ld [hl], h
    ld b, $3a
    ld bc, $0100
    nop
    ld a, [de]
    ld b, $1a
    rst $38
    rst $38
    sub h
    sub a
    inc d
    rla
    sub h
    sub a
    adc h
    adc a
    adc e
    adc e
    add b
    db $10
    add $87
    ld [hl], d
    ld [hl], e
    jp nc, $12f2

    ld bc, $1400
    db $f4
    ld [hl+], a
    ldh [c], a
    add hl, bc
    ld [$e323], sp
    rlca
    nop
    nop
    ld bc, $0303
    rrca
    inc b
    rra
    ld [$303f], sp
    ld a, a
    ld b, b

jr_00d_77de:
    db $fc
    add e
    ld hl, sp+$07
    ld hl, sp+$20
    jr nz, jr_00d_77de

    ld b, $fe
    db $fd
    inc bc
    add hl, bc
    inc bc
    inc h
    db $db
    ld [hl], $ff
    ld [de], a
    rst $38
    ld [de], a
    add e
    dec bc
    add b
    add b
    ld b, b
    nop
    ld b, b
    ret nz

    ldh [rNR41], a
    ldh [$ffa0], a
    pop af
    add hl, bc
    sbc h
    adc a
    adc a
    add e
    adc $83
    ld c, a
    ld b, e
    ld c, [hl]
    nop
    nop
    ld b, e
    ld b, [hl]
    ld b, d
    ld h, a
    ld b, e
    ld h, $23
    ld [$f8f8], sp
    ld hl, sp+$18
    ld hl, sp-$28
    ld hl, sp+$38
    nop
    nop
    ld hl, sp-$68
    ld a, b
    adc b
    ld hl, sp+$78
    ld hl, sp+$3e
    ld [hl+], a
    ld a, [hl-]
    ld h, $26
    ld a, $3e
    ld a, $69
    nop
    nop
    scf
    ld b, c
    ld l, a
    ld d, a
    ld l, a
    ld a, c
    ld a, a
    ldh a, [$ff30]
    ret nc

    ret nc

    ld [$0408], sp
    inc b
    inc bc
    add b
    ld c, b
    inc bc
    nop
    nop

jr_00d_7845:
    inc b
    inc b
    ld [$9308], sp
    nop
    ld a, [hl-]
    inc c
    db $f4
    inc de
    ld bc, $c0f0
    nop
    db $10
    ld [hl], c
    jr nc, jr_00d_7867

    ld de, $1139
    rra

jr_00d_785b:
    sub h
    add hl, bc
    db $ec
    inc hl
    dec h
    push hl
    jr c, jr_00d_785b

    jr nz, jr_00d_7845

    or a
    dec sp

jr_00d_7867:
    db $fc
    add a
    ld a, [hl]
    jr nc, jr_00d_786c

jr_00d_786c:
    ld a, e
    inc bc
    ld bc, $be03
    dec bc
    rst $18
    inc de
    ld l, a
    sbc d
    ld a, a
    adc e
    inc [hl]
    call z, $cc34
    add h
    db $fc
    nop
    inc bc
    add h
    db $fc
    ld a, b
    ld a, b
    rst $38
    rst $38
    add b
    add b
    dec h
    inc l
    ld c, c
    dec bc
    add e
    add e
    ld h, $22
    daa
    inc hl
    nop
    nop
    daa
    ld [hl+], a
    ld b, [hl]
    ld b, d
    add [hl]
    add d
    inc bc
    ld bc, $8181
    ld c, l
    ld c, l
    ret z

    jr c, @-$36

    ld hl, sp+$20
    nop
    ld hl, sp+$38
    inc a
    inc b
    inc e
    ld bc, $1800
    ld [$0818], sp
    ld e, c
    ld b, a
    ld a, l
    ld a, a
    ld b, e
    ld b, a
    nop
    inc b
    ld h, d
    ld b, [hl]
    ld h, $32
    ld e, $12
    ld c, $0a
    ld a, [hl]
    ld d, [hl]
    ld sp, $ff04
    rst $38
    rlca

jr_00d_78c8:
    db $fc
    add hl, de
    nop
    nop
    ldh [rNR41], a
    db $fc
    jr jr_00d_78c8

    rrca
    db $fc
    inc bc
    rst $38
    rst $38
    ret nz

    rst $38
    rst $38
    ld hl, sp-$11
    add $00
    inc bc
    inc bc
    pop bc
    ld c, $07
    ld sp, hl
    cp $07
    ld hl, sp+$1f
    db $10
    pop hl
    ld c, c
    cp $0a
    db $fc
    ld a, [$f71c]
    nop
    nop
    ld e, $e9
    rra
    db $f4
    rrca
    ei
    rlca
    cp $01
    ld [hl], b
    rrca
    ret nz

    ccf
    ret nz

    ccf
    ld [hl], b
    ld [bc], a
    add b
    rrca
    dec c
    ld [bc], a
    rst $38
    sbc h
    ldh [rIE], a
    ld a, a
    ld c, $f0
    inc bc
    db $fc
    inc bc
    db $fc
    ld b, $f8
    inc hl
    inc bc
    nop
    nop
    rst $38
    add hl, sp
    rlca
    rst $38
    cp $fe
    ld a, [hl]
    ld d, e
    ccf
    ld e, a
    jr c, @-$0f

    ld a, b
    sub a
    ld hl, sp+$2f
    nop
    add [hl]
    ldh a, [$ffdf]
    ldh [$ff7f], a
    add b
    cp l
    sbc l
    ld h, e
    ccf
    ld h, d
    nop
    push de
    ld [hl-], a
    di
    di
    rra
    db $fc
    ld b, c
    ld c, d

jr_00d_793d:
    nop
    sub c
    ccf
    dec hl
    cp h
    sub a
    rst $18
    ld c, b
    rst $38
    jr nc, jr_00d_793d

    ld a, [hl+]
    inc a
    inc a
    ld h, [hl]
    nop
    nop
    ld a, [hl]
    ld a, [hl]
    dec b
    ld [$0ac0], sp
    ld h, [hl]
    ld h, [hl]
    nop
    nop
    ld a, h

jr_00d_7959:
    ld a, h
    rrca
    ld [$2805], sp
    nop
    rra
    db $10
    ld h, b
    nop
    db $10
    ld h, [hl]
    ld h, [hl]
    inc a
    inc a
    rst $20
    call z, $281f
    dec l
    jr jr_00d_798e

    ld [$7e7e], sp
    dec e
    ld [$2805], sp
    rrca
    jr z, jr_00d_79f5

    ld a, h
    inc sp
    jr jr_00d_79bc

    jr z, jr_00d_79ed

    ld l, [hl]
    ld h, l
    ld [$083f], sp
    ld h, e
    add h
    ld h, a
    jr jr_00d_79f8

    jr c, jr_00d_79c7

    inc a
    jr jr_00d_798e

jr_00d_798e:
    jr nc, jr_00d_79ef

    ld [$3e3e], sp
    inc c
    nop
    jr nz, jr_00d_7a03

    ld l, h
    jr c, jr_00d_79d2

    cpl
    ld [$7c00], sp
    ld l, h
    ld l, h
    ld a, b
    ld a, b
    ld [hl], b
    ld [hl], b
    ld a, b
    ld a, b
    ld l, h
    ld l, h
    sbc a
    ld [$188b], sp
    sub c
    jr jr_00d_7a1e

    ld [$18bd], sp
    ld e, d
    ld b, c
    ret nz

    nop
    db $10
    ld b, d
    ld b, d
    nop
    nop
    ld h, d

jr_00d_79bc:
    nop
    nop
    ld [hl], d
    ld [hl], d
    ld e, d
    ld e, d
    ld c, [hl]
    ld c, [hl]
    ld b, [hl]
    nop
    nop

jr_00d_79c7:
    cp a
    jr jr_00d_7959

    ld bc, $28b1
    cp a
    ld [$3df3], sp
    add hl, de

jr_00d_79d2:
    dec b
    rlca
    dec b
    ld b, $db
    ld d, l
    sbc $55
    ret nz

    ret nz

    ld h, b
    and b
    ld h, b
    and b
    dec b
    adc [hl]
    ld sp, hl
    ld b, $01
    ld e, b
    inc de

jr_00d_79e7:
    ld [$4803], sp
    inc b
    rlca
    rlca

jr_00d_79ed:
    ld a, e
    ld [de], a

jr_00d_79ef:
    ld b, [hl]
    xor b
    ld h, b
    and b
    sbc e
    inc bc

jr_00d_79f5:
    dec h
    ld h, $6f

jr_00d_79f8:
    ld c, $5f
    add hl, hl
    rra
    ld c, c
    ld h, c
    add b
    ld a, e
    add hl, de
    ld l, h
    ld l, h

jr_00d_7a03:
    ld [hl], $36
    ld a, a
    ld e, c
    rra
    add hl, de
    ld h, [hl]
    ld h, [hl]
    jr nc, @+$32

    inc c
    inc c
    ld b, $06
    ld a, a
    add hl, de
    db $e4
    add $7e
    ld a, [hl]
    cpl
    add hl, sp
    jr @+$1a

    ld c, a
    add hl, hl
    rst $18

jr_00d_7a1e:
    jr c, jr_00d_79e7

    add hl, de
    inc h
    nop
    nop
    ld e, c
    add hl, bc
    nop
    nop
    ld b, d
    nop
    nop
    dec e
    add hl, de
    rst $20
    nop
    rst $18
    add hl, de
    dec de
    ld [$1971], sp
    inc h
    inc h
    rrca
    jr jr_00d_7a4b

    jr c, jr_00d_7a8b

    ld [$7e7e], sp
    ld b, $06
    inc c
    inc c
    jr jr_00d_7a5d

    sbc h
    rla
    jr nc, jr_00d_7a79

    rst $08
    add hl, de

jr_00d_7a4b:
    ret


    ld b, b
    rst $08
    ld sp, $0e0e
    ld a, c
    ld [$187f], sp
    xor l
    add hl, bc
    adc c
    jr jr_00d_7a8a

    nop
    nop
    nop

jr_00d_7a5d:
    nop
    ld [$07e8], sp
    ld [$1010], sp
    ld d, a
    sbc a
    ld b, b
    and c
    inc b
    ld [hl], c
    rst $38
    nop
    ld hl, sp+$00
    ld hl, sp+$00
    ld hl, sp-$2f
    ld b, a
    nop
    ccf
    nop
    sbc [hl]
    nop
    nop

jr_00d_7a79:
    nop
    rst $08
    nop
    rst $20
    nop
    di
    nop
    ld sp, hl
    nop
    db $fc
    nop
    db $fc
    inc b
    db $db
    ld [$08fb], sp

jr_00d_7a8a:
    add b

jr_00d_7a8b:
    nop
    ld a, h
    inc b
    or e
    inc bc
    ret c

    nop
    db $ec
    ld bc, $9200

jr_00d_7a96:
    sub d
    ld d, a
    ld d, h
    ld l, a
    ld h, a
    rst $38
    rst $28
    nop
    ld b, b
    dec sp
    inc a
    ccf
    inc sp
    ld e, h
    ld h, a
    cp e
    rst $08
    rst $10
    ccf
    ld a, a
    rst $38
    ei
    db $fc
    pop bc
    ld b, $3f
    nop
    db $10
    ret z

    rst $38
    daa
    rst $30
    sub b
    sub b
    ld a, e
    add b
    rst $38
    ldh [$ffdf], a
    inc a
    xor c
    inc bc
    ld sp, hl
    add a
    rst $38
    nop
    nop
    ld b, h
    db $fc
    and h
    db $fc
    sbc $02
    ld a, [hl]
    ld [bc], a
    ld a, [hl-]
    ld [bc], a
    cp d
    inc bc
    rst $30
    add c
    db $ed
    ld bc, $3008
    ld e, e
    ld bc, $9b37
    cpl
    ldh a, [rP1]
    cp $fc
    inc bc
    ld hl, sp+$07
    rst $20
    or c
    ld bc, $4093
    ldh [$ffc0], a
    ld b, h
    ld [hl+], a
    jr c, jr_00d_7b0d

    ld a, a
    nop
    rst $38
    nop
    ld h, e
    adc e
    jr nz, jr_00d_7b15

    rlca
    adc l
    ld l, $fc
    nop
    jr nc, jr_00d_7a96

    ld b, $7f
    add b
    nop
    ld [bc], a
    cp $00
    rst $28
    nop
    rst $30
    nop
    ld a, a
    nop
    call c, Call_000_008d

jr_00d_7b0d:
    ret nz

    nop
    ldh [rP1], a
    ld [hl], c
    ld bc, $0010

jr_00d_7b15:
    ld [hl-], a
    inc bc
    add h

jr_00d_7b18:
    rlca
    ld [hl], c
    ld a, [hl-]
    inc e
    db $fc
    jr z, jr_00d_7b18

    ld d, l
    pop af
    call nc, Call_00d_73f0
    ld [hl], b
    ld l, b
    ld b, b
    nop
    ld l, b
    ret c

    ld hl, sp-$64
    db $e4
    nop
    add [hl]
    ld b, $08
    ld [$0009], sp
    add hl, sp
    jr c, jr_00d_7b7f

    ld a, b
    ld l, b
    nop
    nop
    ld e, b
    jr c, @+$2a

    ld a, h
    inc a
    jr nc, jr_00d_7b72

    ret z

    ld a, b
    call nc, Call_000_3a6c
    ld h, $34
    inc l
    ld e, b
    nop
    nop
    ld l, b
    adc b
    ld hl, sp+$2f
    ld bc, $000e
    ld e, $00
    inc a

jr_00d_7b57:
    nop
    jr jr_00d_7b5a

jr_00d_7b5a:
    add hl, bc
    nop
    rlca
    nop
    nop
    nop
    ld [bc], a
    nop
    ccf
    ret nz

    sbc a
    ldh [$ffbf], a
    ret nz

    call $ffb2
    add b
    rst $38
    add b
    db $fc
    nop
    nop
    add e

jr_00d_7b72:
    ldh a, [$ff8f]
    ldh a, [$ff0c]
    ret nz

    ccf
    ld c, $f1
    rst $38
    nop
    rst $08
    jr nc, @-$5f

jr_00d_7b7f:
    ld h, b
    ld a, a
    jr nz, jr_00d_7b83

jr_00d_7b83:
    add b
    or $09
    ld bc, $c003
    rlca
    add b
    nop
    jp $e703


    inc b
    cp $00
    db $fd
    ret nz

    nop
    nop
    jr c, jr_00d_7b57

    ret nz

    ei
    call c, Call_00d_7ef9
    db $ed
    ldh a, [c]
    ld d, a
    cp b
    sbc a
    ld hl, sp-$05
    call c, Call_000_020b
    nop
    inc e
    ld b, e
    rlca
    ld h, b
    db $e3
    add e
    ld c, [hl]
    ld c, h
    jr c, jr_00d_7be2

    sbc b
    sbc b
    db $e4
    ld b, h
    ld [hl], d
    ld [hl-], a
    add c
    nop
    nop
    add c
    ldh [c], a
    ld h, d
    sbc a
    sbc [hl]
    ld a, [bc]
    dec bc
    dec b
    dec b
    inc bc
    inc bc
    rlca
    dec b
    dec b
    inc b
    db $d3
    nop
    nop
    rst $38
    ldh a, [$ff3f]
    xor c
    ld l, a
    daa
    and $c7
    call nz, Call_000_2727
    dec a
    inc a
    jp z, $11ca

    nop
    nop
    ld de, $e7e7

jr_00d_7be2:
    db $e3
    and d
    rst $30
    ld d, [hl]
    ei
    ld e, [hl]
    di
    ccf
    rst $38
    adc h
    rst $30
    ld c, d
    call nz, $8000
    db $fc
    inc a
    db $fc
    cp $92
    pop af
    and c
    rst $20
    and a
    xor $2a
    ld a, [$fa12]
    ld a, [de]
    add a
    dec e
    nop
    db $10
    ld a, h
    ld a, h
    add d
    add d
    ld [bc], a
    ld [bc], a
    xor d
    xor d
    xor h
    xor h
    rst $30
    adc b
    sbc c
    ld [$e19e], sp
    ld b, b
    nop
    nop
    ld a, a
    jr nc, jr_00d_7c59

    ld [$040f], sp
    rlca
    di
    inc c
    db $e3
    inc e
    jp $063c


    ld sp, hl
    inc bc
    nop
    nop
    db $fc
    rrca
    ldh a, [rNR23]
    rst $20
    nop
    rst $38
    call nz, $c43c
    inc a
    add d
    ld a, [hl]
    ld h, d
    sbc [hl]
    pop hl
    inc b
    jr z, @+$21

    pop bc
    ld c, b
    add hl, bc
    rst $38
    dec sp
    inc c
    dec sp
    inc c
    ld [hl], a
    ld [$721c], sp
    ld de, $d3c1
    nop
    ld l, c
    ld c, c
    nop
    nop
    add [hl]
    add h
    add e
    add e
    pop bc
    ld b, b
    pop bc
    ld b, b
    ld [hl], e

jr_00d_7c59:
    ld sp, $0f1f
    rst $38
    db $e3
    add h
    add h
    nop
    nop
    ld c, h
    ld c, b
    jr z, jr_00d_7c8e

    sbc b
    sub b
    call z, Call_00d_67c8
    inc h
    inc sp
    inc de
    sbc h
    adc b
    sbc l
    sbc c
    nop
    nop
    db $ec
    ld h, h
    rst $18
    ld e, h
    rst $08
    ld b, e
    rst $28
    ld l, l

Jump_00d_7c7c:
    db $e3
    ld h, c
    sbc $52
    sbc a
    sbc a
    db $fd
    ld b, l
    nop
    ld [$82ff], sp
    rst $38
    add b
    rst $30
    adc a
    ld a, e
    ld a, h

jr_00d_7c8e:
    ld d, a
    ld l, a
    ld hl, sp+$14
    ld bc, $16f6
    ldh [c], a
    ld [hl+], a
    add b
    nop
    ld [hl], c
    pop af
    xor e
    jp c, $fe7f

    add c
    ld [hl-], a
    dec d
    or b
    or b
    db $e3
    db $e3
    cp $ff
    ret z

    ccf
    nop
    nop
    ld sp, hl
    rrca
    pop af
    rst $38
    ld b, $ff
    ld a, b
    rst $38
    inc a
    ccf
    ei
    rst $00
    or a
    add b
    db $ec
    add b
    nop
    ld bc, $807c
    ld e, a
    add b
    sub a
    ld [$0b94], sp
    or [hl]
    rlca
    rst $38
    jr c, @+$01

    ld h, a
    rra
    sub $21
    ld b, b
    add b
    or a
    ld b, b
    ld c, $c0
    ld a, l
    add b
    cp h
    cpl
    ret nz

    rst $38
    ld a, a
    ccf
    ret


    scf
    db $db
    inc h
    ld h, a
    add hl, bc
    pop de
    nop
    inc bc
    jr c, @-$5f

    ldh [$ff1f], a
    call c, $ff67
    sub $07
    rrca
    ld e, b
    ld b, b
    rst $38
    jp Jump_000_23fc


    rst $38
    ld d, $f9
    jr nz, jr_00d_7cfb

jr_00d_7cfb:
    inc d
    ld hl, sp+$0f
    ld hl, sp+$08
    rra
    nop
    db $10
    rst $38
    di
    inc e
    rst $38
    di
    dec a
    cp $c0
    jr nc, jr_00d_7d0d

jr_00d_7d0d:
    nop
    or e
    ld h, b
    ld a, [$ffc1]
    rst $38
    rrca
    ei
    or $7c
    xor $b4

jr_00d_7d1a:
    daa
    inc [hl]
    and a
    ld [hl-], a
    nop
    add b
    dec h
    di
    db $d3
    or c
    add e
    db $fc
    ldh [c], a
    nop
    ld [$5b00], sp
    nop
    ei
    nop
    rst $18
    ld bc, $0000
    nop
    halt
    adc c
    scf
    dec bc
    scf
    inc c
    db $f4
    inc c
    db $ec
    inc e
    or h
    ld a, h
    cp $c2
    add e
    add c
    nop
    nop
    jp $fbc1


    nop
    rst $38
    add b
    cp $61
    ld a, c
    ld d, $19
    ld c, $0f
    rlca
    rlca
    ld [bc], a
    nop
    add b
    add a
    add h
    rst $08
    jr nc, jr_00d_7d1a

    ld b, c
    db $fc
    inc bc
    adc $33
    db $fd
    rst $38
    ld hl, $f1df
    ld l, e
    ld b, $00
    inc bc
    adc a
    ldh a, [$ff87]
    ld hl, sp-$7d
    db $fc
    add c
    cp $95
    ld e, b
    push de
    nop
    ccf
    ldh a, [rIF]
    ldh a, [rIF]
    ld hl, sp-$7e
    ld [bc], a
    rlca
    rla
    ld l, b
    dec b
    cp $02
    rst $38
    ld [bc], a
    or e
    ld b, b
    db $fc
    or l
    ld [de], a
    ccf
    ret nz

    adc a
    ldh a, [rBGP]
    ld hl, sp+$00
    nop
    ld [hl], b
    cp a
    rst $38
    rrca
    ld de, $9031
    ld sp, $30d1
    rst $18
    ccf
    cp a
    ld h, b
    ld a, a
    ret nz

    nop
    add b
    cp a
    ret nz

    ld l, a
    sub b
    halt
    adc c
    or $89
    add sp, -$69
    ldh [$ff7f], a
    rst $38
    rra
    ldh a, [$ffe9]
    ld [de], a
    nop
    nop
    ld h, $e2
    call c, $4974
    ret c

jr_00d_7dbe:
    sbc e
    ret z

    rra
    ld [$08ff], sp
    rst $28
    jr @+$01

    stop
    nop
    ld c, a
    ld c, a
    ld a, a
    jr nc, jr_00d_7dbe

    db $10
    ldh a, [c]
    dec c
    db $fd
    ld b, $fa
    rlca
    pop de
    cpl
    ld b, c
    cp a
    nop
    ld a, [bc]
    cp $ff
    xor h
    ld e, a
    ret z

    ccf
    sub b
    ld a, a
    jr nz, jr_00d_7ded

    ld bc, $2b80

jr_00d_7de9:
    ld d, c
    ld bc, $03fe

jr_00d_7ded:
    db $fc
    db $10
    ld h, b
    rlca
    ld hl, sp-$08
    rlca
    ld bc, $f418
    dec bc
    ldh a, [c]
    dec c

jr_00d_7dfa:
    ld sp, hl
    ld b, $fc
    inc bc
    or l
    ld l, b
    dec h
    ld [$0006], sp
    nop
    ld sp, hl
    dec b
    ld a, [$f00e]
    ld a, [bc]
    db $f4
    inc e
    ldh [rNR14], a
    add sp, -$19
    inc bc
    ld b, [hl]
    add c
    add [hl]
    nop
    nop
    add hl, bc
    ld d, $09
    inc c
    inc de
    inc l
    inc de
    ld e, b
    daa
    or b
    ld c, a
    dec bc
    db $f4
    jp Jump_000_30fc


    add h
    ld [$0eff], sp
    ld [hl], l
    ld sp, $00ff
    rst $18
    jr nz, @-$7c

    dec bc
    ldh a, [rIE]
    rrca
    adc a
    add hl, de
    jr nz, jr_00d_7de9

    ld h, b
    ld h, a
    ld [$c000], sp
    rst $00
    add b
    ld bc, $c000
    ld b, [hl]

jr_00d_7e45:
    pop bc
    db $ed
    add e
    add [hl]
    ld a, a
    adc b
    ld a, a
    or c
    ld a, a
    ld b, c
    ld bc, $c6c2
    ld hl, $ff00
    ldh [rIE], a
    ldh [$ffbf], a
    and b
    ld a, a
    ld [hl], b
    rra
    ld e, $e1
    ld a, a
    add b
    adc [hl]
    jr nz, jr_00d_7dfa

    nop
    ld b, c
    ld h, b
    and a
    rrca
    rlca
    ld hl, sp-$02
    ld bc, $d0fe
    ld d, c
    ld h, b
    sbc a
    jr nc, @-$2f

    jr nc, jr_00d_7e45

    ld c, c
    add hl, bc
    cp c
    jr jr_00d_7e96

    nop
    nop
    ldh [$ff3e], a
    pop bc
    ccf
    ret nz

    ld a, $c1
    ld a, b
    add a
    ld h, b
    sbc a
    ld b, b
    cp a
    nop
    rst $38
    ld h, b
    ldh [$ff81], a
    sbc a
    ret nz

    ccf
    add b
    ld a, a
    ld a, l
    ld l, c

jr_00d_7e96:
    rst $28
    db $10
    ld bc, $1e10
    inc e
    ld [hl], b
    rst $38
    ldh a, [$ff9f]
    ret nc

    ccf
    ld [hl], a
    ld [$0018], sp
    ld a, [$fc87]
    rrca
    ld b, c
    db $eb
    ld [$f20d], sp
    dec bc
    db $f4
    dec bc
    db $f4
    ld [hl], c
    adc [hl]
    add e
    ld a, h
    rrca
    ld [hl-], a
    nop
    ldh a, [rDMA]
    ld a, b
    adc a
    ld [hl], b
    ld [hl], b
    ld e, d
    ld hl, $006d
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Call_00d_7ef9:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Jump_00d_7fc3:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
