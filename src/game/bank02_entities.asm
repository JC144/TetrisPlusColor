; ============================================================================
; BANK $02 - Entity & Object Management
; ============================================================================
; Address: $4000-$7FFF (switchable)
;
; Object and entity management system: jump table dispatch, object state
; machines, animation controllers, and rendering request handling.
;
; Key structures:
;   Jump table dispatch at $4032
;   Object timer management
;   Animation state handlers
;
; ============================================================================
; Originally disassembled with mgbdis v3.0 by Matt Currie

SECTION "ROM Bank $002", ROMX[$4000], BANK[$2]

    ld a, [$c185]
    or a
    ret nz

    ld hl, $001f
    add hl, de
    ld a, [hl]
    cp $78
    jr z, jr_002_4011

    inc a
    ld [hl], a
    ret


jr_002_4011:
    ld [hl], $00
    ld hl, $001e
    add hl, de
    ld a, [hl]
    inc a
    ld [hl], a
    ret


    ld hl, $0014
    add hl, de
    ld a, [hl]
    ld hl, $4032
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push de
    jp hl


Jump_002_4030:
    pop de
    ret


    ld [hl], $40
    ld e, c
    ld b, b
    ld hl, $001b
    add hl, de
    ld a, [hl]
    inc a
    cp $0f
    jr z, jr_002_4044

    ld [hl], a
    jp Jump_002_4030


jr_002_4044:
    ld hl, $0011
    add hl, de
    ld [hl], $18
    ld hl, $0012
    add hl, de
    ld [hl], $04
    ld hl, $0014
    add hl, de
    ld [hl], $01
    jp Jump_002_4030


    ld a, $01
    ld [RENDER_REQUEST], a
    call Call_000_01e3
    ld hl, $0002
    add hl, de
    ld a, [hl]
    cp $b0
    jp nz, Jump_002_4030

    ld h, d
    ld l, e
    call Call_000_01e6
    jp Jump_002_4030


    ld hl, $0014
    add hl, de
    ld a, [hl]
    ld hl, $408a
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push de
    jp hl


Jump_002_4088:
    pop de
    ret


    adc [hl]
    ld b, b
    cp l
    ld b, b
    ld hl, $001b
    add hl, de
    ld a, [hl]
    inc a
    cp $0f
    jr z, jr_002_409c

    ld [hl], a
    jp Jump_002_4088


jr_002_409c:
    ld hl, $0011
    add hl, de
    ld [hl], $1c
    ld hl, $0012
    add hl, de
    ld [hl], $06
    ld hl, $001b
    add hl, de
    ld [hl], $00
    ld hl, $0015
    add hl, de
    ld [hl], $00
    ld hl, $0014
    add hl, de
    ld [hl], $01
    jp Jump_002_4088


    ld a, $01
    ld [RENDER_REQUEST], a
    call Call_000_01e3
    ld hl, $001b
    add hl, de
    ld a, [hl]
    cp $3c
    jr z, jr_002_4105

    ld hl, $001b
    add hl, de
    ld a, [hl]
    inc a
    ld [hl], a
    and $03
    jp nz, Jump_002_4088

    ld hl, $0015
    add hl, de
    ld a, [hl]
    cp $09
    jp z, Jump_002_4088

    ld b, $00
    ld c, a
    sla c
    rl b
    ld hl, $410d
    add hl, bc
    ld a, [hl+]
    ld b, a
    ld a, [hl]
    ld c, a
    ld hl, $0011
    add hl, de
    ld [hl], b
    ld hl, $0012
    add hl, de
    ld [hl], c
    ld hl, $0015
    add hl, de
    inc [hl]
    jp Jump_002_4088


jr_002_4105:
    ld h, d
    ld l, e
    call Call_000_01e6
    jp Jump_002_4088


    inc e
    dec b
    dec de
    inc b
    ld a, [de]
    inc bc
    add hl, de
    ld [bc], a
    jr jr_002_4119

    rla
    ld [bc], a

jr_002_4119:
    ld d, $03
    dec d
    inc b
    inc d
    dec b
    ld hl, $0014
    add hl, de
    ld a, [hl]
    ld hl, $4136
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push de
    jp hl


Jump_002_4134:
    pop de
    ret


    ld a, [hl-]
    ld b, c
    ld l, c
    ld b, c
    ld hl, $001b
    add hl, de
    ld a, [hl]
    inc a
    cp $0f
    jr z, jr_002_4148

    ld [hl], a
    jp Jump_002_4134


jr_002_4148:
    ld hl, $0011
    add hl, de
    ld [hl], $00
    ld hl, $0012
    add hl, de
    ld [hl], $05
    ld hl, $001b
    add hl, de
    ld [hl], $00
    ld hl, $0015
    add hl, de
    ld [hl], $00
    ld hl, $0014
    add hl, de
    ld [hl], $01
    jp Jump_002_4134


    ld a, $01
    ld [RENDER_REQUEST], a
    call Call_000_01e3
    ld hl, $0003
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $a8
    sub b
    jr c, jr_002_41b6

    ld hl, $001b
    add hl, de
    ld a, [hl]
    inc a
    ld [hl], a
    and $03
    jp nz, Jump_002_4134

    ld hl, $0015
    add hl, de
    ld a, [hl]
    ld hl, $41be
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl]
    cp $ff
    jp z, Jump_002_4134

    ld a, [hl+]
    push hl
    ld hl, $0012
    add hl, de
    ld [hl], a
    pop hl
    ld a, [hl]
    ld hl, $0011
    add hl, de
    ld [hl], a
    ld hl, $0015
    add hl, de
    ld a, [hl]
    inc a
    ld [hl], a
    jp Jump_002_4134


jr_002_41b6:
    ld h, d
    ld l, e
    call Call_000_01e6
    jp Jump_002_4134


    inc b
    nop
    inc bc
    nop
    ld [bc], a
    nop
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $0210
    db $10
    inc bc
    db $10
    inc b
    db $10
    dec b
    db $10
    ld b, $10
    rlca
    db $10
    ld [$ff10], sp
    db $10
    ld hl, $0014
    add hl, de
    ld a, [hl]
    ld hl, $41f7
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push de
    jp hl


Jump_002_41f5:
    pop de
    ret


    db $fd
    ld b, c
    ld a, [de]
    ld b, d
    or b
    ld b, d
    ld a, $01
    ld [RENDER_REQUEST], a
    ld hl, $0003
    add hl, de
    ld a, [hl]
    cp $40
    jr z, jr_002_4211

    sub $01
    ld [hl], a
    jp Jump_002_41f5


jr_002_4211:
    ld hl, $0014
    add hl, de
    ld [hl], $01
    jp Jump_002_41f5


    ld hl, $0002
    add hl, de
    ld a, [hl]
    ld [$c659], a
    ld hl, $0003
    add hl, de
    ld a, [hl]
    ld [$c65b], a
    push de
    ld de, $c1e0
    ld b, $00
    ld c, $08

Jump_002_4232:
    ld a, $01
    ld [de], a
    ld hl, $0004
    add hl, de
    ld [hl], $a3
    ld hl, $0005
    add hl, de
    ld [hl], $26
    ld hl, $4298
    push de
    ld d, $00
    ld e, b
    add hl, de
    push bc
    ld a, [hl]
    ld b, a
    ld a, [$c659]
    add b
    pop bc
    pop de
    ld hl, $0002
    add hl, de
    ld [hl], a
    inc b
    ld hl, $4298
    push de
    ld d, $00
    ld e, b
    add hl, de
    push bc
    ld a, [hl]
    ld b, a
    ld a, [$c65b]
    add b
    pop bc
    pop de
    ld hl, $0003
    add hl, de
    ld [hl], a
    inc b
    ld hl, $4298
    push de
    ld d, $00
    ld e, b
    add hl, de
    ld a, [hl]
    pop de
    ld hl, $0011
    add hl, de
    ld [hl], a
    ld hl, $0020
    add hl, de
    ld d, h
    ld e, l
    inc b
    dec c
    jp nz, Jump_002_4232

    pop de
    ld hl, $0014
    add hl, de
    ld [hl], $02
    ld a, $01
    ld [RENDER_REQUEST], a
    jp Jump_002_41f5


    ld [$1e00], sp
    jr nz, jr_002_429d

jr_002_429d:
    rra
    jr c, jr_002_42a0

jr_002_42a0:
    ld [bc], a
    nop
    db $10
    dec e
    db $10
    jr jr_002_42c3

    jr c, jr_002_42b9

    inc b
    jr nz, @+$1a

    ld b, $38
    jr @+$0a

    ld hl, $001b
    add hl, de
    ld a, [hl]
    cp $78
    jr z, jr_002_42be

jr_002_42b9:
    inc a
    ld [hl], a
    jp Jump_002_41f5


jr_002_42be:
    ld h, d
    ld l, e
    call Call_000_01e6

jr_002_42c3:
    ld b, $0a

jr_002_42c5:
    push bc
    call Call_000_01e9
    pop bc
    dec b
    jr nz, jr_002_42c5

    ld hl, $c0a5
    ld [hl], $02
    jp Jump_002_41f5


    ld hl, $0014
    add hl, de
    ld a, [hl]
    ld hl, $42ec
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push de
    jp hl


Jump_002_42ea:
    pop de
    ret


    xor $42
    ld a, $01
    ld [RENDER_REQUEST], a
    ld hl, $0003
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $a0
    sub b
    jp c, Jump_002_433c

    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld hl, $4344
    ld b, $00
    ld c, a
    add hl, bc
    ld a, [hl]
    ld hl, $0012
    add hl, de
    ld [hl], a
    call Call_000_01e3
    ld hl, $001b
    add hl, de
    ld a, [hl]
    inc a
    ld [hl], a
    and $03
    jp nz, Jump_002_42ea

    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $10
    sub b
    jr c, jr_002_4336

    cp $00
    jp z, Jump_002_42ea

    ld a, [hl]
    inc a
    ld [hl], a
    jp Jump_002_42ea


jr_002_4336:
    ld a, [hl]
    dec a
    ld [hl], a
    jp Jump_002_42ea


Jump_002_433c:
    ld h, d
    ld l, e
    call Call_000_01e6
    jp Jump_002_42ea


    ld b, $05
    inc b
    inc bc
    inc bc
    ld [bc], a
    ld [bc], a
    ld bc, $0101
    ld [bc], a
    ld [bc], a
    inc bc
    inc bc
    inc b
    dec b
    ld b, $05
    inc b
    inc bc
    inc bc
    ld [bc], a
    ld [bc], a
    ld bc, $0101
    ld [bc], a
    ld [bc], a
    inc bc
    inc bc
    inc b
    dec b
    ld hl, $0014
    add hl, de
    ld a, [hl]
    ld hl, $437b
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push de
    jp hl


Jump_002_4379:
    pop de
    ret


    add c
    ld b, e
    ret nz

    ld b, e
    rlca
    ld b, h
    ld a, [$c185]
    or a
    jp nz, Jump_002_4379

    ld a, [$c0fe]
    ld b, a
    ld hl, $001e
    add hl, de
    ld a, [hl]
    sub b
    jp nc, Jump_002_4379

    inc [hl]
    ld hl, $0003
    add hl, de
    dec [hl]
    dec [hl]
    ld a, $01
    ld [RENDER_REQUEST], a
    ld hl, $001e
    add hl, de
    ld a, [hl]
    cp $44
    jp nz, Jump_002_4379

    ld hl, $001b
    add hl, de
    ld [hl], $00
    ld hl, $0014
    add hl, de
    ld [hl], $01
    ld hl, $0016
    add hl, de
    ld [hl], $00
    jp Jump_002_4379


    ld hl, $0016
    add hl, de
    ld a, [hl]
    or a
    jp nz, Jump_002_43e5

    ld a, $01
    ld [RENDER_REQUEST], a
    ld hl, $001b
    add hl, de
    ld a, [hl]
    inc a
    ld [hl], a
    and $04
    jr nz, jr_002_43df

    ld a, $81
    ld [de], a
    jp Jump_002_4379


jr_002_43df:
    ld a, $91
    ld [de], a
    jp Jump_002_4379


Jump_002_43e5:
    ld a, $81
    ld [de], a
    ld hl, $001b
    add hl, de
    ld [hl], $00
    ld hl, $0011
    add hl, de
    ld [hl], $10
    ld hl, $0012
    add hl, de
    ld [hl], $00
    ld hl, $0014
    add hl, de
    ld [hl], $02
    ld a, $0a
    ldh [$ffa1], a
    jp Jump_002_4379


    ld a, $01
    ld [RENDER_REQUEST], a
    call Call_000_01e3
    ld hl, $0003
    add hl, de
    ld a, [hl]
    ld b, $98
    sub b
    jp nc, Jump_002_4435

    ld hl, $001b
    add hl, de
    ld a, [hl]
    inc a
    ld [hl], a
    and $02
    jp nz, Jump_002_4379

    ld hl, $0012
    add hl, de
    ld a, [hl]
    cp $0c
    jp z, Jump_002_4379

    inc a
    ld [hl], a
    jp Jump_002_4379


Jump_002_4435:
    ld a, $98
    ld [hl], a
    ld a, [$c0fe]
    ld b, $44
    sub b
    ld [$c0fe], a
    ld hl, $001e
    add hl, de
    ld [hl], $00
    ld hl, $c60b
    ld [hl], $01
    call Call_000_01ec
    ld hl, $c0fd
    ld a, [hl]
    inc a
    cp $1f
    jr nz, jr_002_445a

    ld a, $1e

jr_002_445a:
    ld [hl], a
    ld hl, $0014
    add hl, de
    ld [hl], $00
    jp Jump_002_4379


    ld a, [$a459]
    cp $1f
    ret z

    ld a, [$c6dc]
    ld hl, $44a9
    ld b, $00
    ld c, a
    add hl, bc
    ld a, [hl]
    or a
    ret z

    push de
    ld a, $01
    ld [$c1c0], a
    ld a, $30
    ld [$c1c2], a
    ld a, $c0
    ld [$c1c3], a
    ld de, $c1c0
    ld a, $0a
    call Call_002_49b4
    pop de
    ld h, d
    ld l, e
    ld de, $c240
    ld b, $20
    push hl
    push de

jr_002_4499:
    ld a, [hl+]
    ld [de], a
    inc de
    dec b
    jr nz, jr_002_4499

    pop de
    pop hl
    ld b, $20
    xor a

jr_002_44a4:
    ld [hl+], a
    dec b
    jr nz, jr_002_44a4

    ret


    nop
    nop
    ld bc, $0000
    ld bc, $0000
    ld bc, $0000
    ld bc, $0000
    ld bc, $0000
    ld bc, $0100
    push de
    ld a, $14
    ldh [$ffa1], a
    ld de, $c1c0
    ld a, $0b
    call Call_002_49b4
    ld a, $01
    ld [$c220], a
    ld a, $30
    ld [$c222], a
    ld a, $98
    ld [$c223], a
    ld a, [$c735]
    ld b, $0b
    sub b
    jr nc, jr_002_44e6

    ld hl, $4523
    jr jr_002_4503

jr_002_44e6:
    ld a, [$c735]
    ld b, $15
    sub b
    jr nc, jr_002_44f3

    ld hl, $4537
    jr jr_002_4503

jr_002_44f3:
    ld a, [$c735]
    ld b, $1f
    sub b
    jr nc, jr_002_4500

    ld hl, $454b
    jr jr_002_4503

jr_002_4500:
    ld hl, $455f

jr_002_4503:
    ld a, [$c6dc]
    ld b, $00
    ld c, a
    add hl, bc
    ld a, [hl]
    ld d, a
    ld hl, $c736

jr_002_450f:
    ld a, [hl]
    or a
    jr z, jr_002_4516

    inc hl
    jr jr_002_450f

jr_002_4516:
    ld a, d
    ld [hl], a
    ld de, $c220
    call Call_002_49b4
    pop de
    call Call_002_4573
    ret


    nop
    nop
    inc c
    nop
    nop
    stop
    nop
    inc d
    nop
    nop
    jr jr_002_4530

jr_002_4530:
    nop
    inc e
    nop
    nop
    inc bc
    nop
    rlca
    nop
    nop
    dec c
    nop
    nop
    ld de, $0000
    dec d
    nop
    nop
    add hl, de
    nop
    nop
    dec e
    nop
    nop
    inc b
    nop
    rlca
    nop
    nop
    ld c, $00
    nop
    ld [de], a
    nop
    nop
    ld d, $00
    nop
    ld a, [de]
    nop
    nop
    ld e, $00
    nop
    dec b
    nop
    rlca
    nop
    nop
    rrca
    nop
    nop
    inc de
    nop
    nop
    rla
    nop
    nop
    dec de
    nop
    nop
    rra
    nop
    nop
    ld b, $00
    rlca

Call_002_4573:
    push de
    ld a, [$c735]
    ld b, $0b
    sub b
    jr nc, jr_002_4581

    ld hl, $45bd
    jr jr_002_459e

jr_002_4581:
    ld a, [$c735]
    ld b, $15
    sub b
    jr nc, jr_002_458e

    ld hl, $460d
    jr jr_002_459e

jr_002_458e:
    ld a, [$c735]
    ld b, $1f
    sub b
    jr nc, jr_002_459b

    ld hl, $465d
    jr jr_002_459e

jr_002_459b:
    ld hl, $46ad

jr_002_459e:
    ld a, [$c6dc]
    ld b, $00
    ld c, a
    sla c
    rl b
    sla c
    rl b
    add hl, bc
    ld de, $c5fd
    ld b, $04

jr_002_45b2:
    ld a, [hl+]
    ld [de], a
    inc de
    dec b
    jr nz, jr_002_45b2

    call Call_000_019b
    pop de
    ret


    nop
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
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $0050
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
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld d, b
    nop
    nop
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
    nop
    nop
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
    jr nz, jr_002_4675

jr_002_4675:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_002_4681

jr_002_4681:
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nc, jr_002_46dd

jr_002_46dd:
    nop
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
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld hl, $c736
    ld a, [hl]
    or a
    ret z

    ld a, $01
    ld [$c220], a
    ld a, $20
    ld [$c222], a
    ld a, $50
    ld [$c223], a
    ld a, [hl]
    ld de, $c220
    push hl
    call Call_002_49b4
    pop hl
    inc hl
    ld a, [hl]
    or a
    ret z

    ld a, $01
    ld [$c240], a
    ld a, $40
    ld [$c242], a
    ld a, $50
    ld [$c243], a
    ld a, [hl]
    ld de, $c240
    push hl
    call Call_002_49b4
    pop hl
    inc hl
    ld a, [hl]
    or a
    ret z

    ld a, $01
    ld [$c260], a
    ld a, $60
    ld [$c262], a
    ld a, $50
    ld [$c263], a
    ld a, [hl]
    ld de, $c260
    push hl
    call Call_002_49b4
    pop hl
    inc hl
    ld a, [hl]
    or a
    ret z

    ld a, $01
    ld [$c280], a
    ld a, $80
    ld [$c282], a
    ld a, $50
    ld [$c283], a
    ld a, [hl]
    ld de, $c280
    push hl
    call Call_002_49b4
    pop hl
    inc hl
    ld a, [hl]
    or a
    ret z

    ld a, $01
    ld [$c2a0], a
    ld a, $20
    ld [$c2a2], a
    ld a, $70
    ld [$c2a3], a
    ld a, [hl]
    ld de, $c2a0
    push hl
    call Call_002_49b4
    pop hl
    inc hl
    ld a, [hl]
    or a
    ret z

    ld a, $01
    ld [$c2c0], a
    ld a, $40
    ld [$c2c2], a
    ld a, $70
    ld [$c2c3], a
    ld a, [hl]
    ld de, $c2c0
    push hl
    call Call_002_49b4
    pop hl
    inc hl
    ld a, [hl]
    or a
    ret z

    ld a, $01
    ld [$c2e0], a
    ld a, $60
    ld [$c2e2], a
    ld a, $70
    ld [$c2e3], a
    ld a, [hl]
    ld de, $c2e0
    push hl
    call Call_002_49b4
    pop hl
    ret


    ld a, [$c7d3]
    ld hl, $47d3
    ld b, $00
    ld c, a
    add hl, bc
    ld a, [hl]
    ld [$c7d2], a
    ret


    ld bc, $0503
    rlca
    add hl, bc
    ld a, [$c5a8]
    cp $01
    ld a, $01
    jr nz, jr_002_47e4

    ld a, [$a0ec]

jr_002_47e4:
    ld hl, $481c
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, h
    ld [$c659], a
    ld a, l
    ld [$c65a], a
    ld hl, $001b
    add hl, de
    ld a, [hl]
    ld b, $00
    ld c, a
    sla c
    rl b
    ld a, [$c659]
    ld h, a
    ld a, [$c65a]
    ld l, a
    add hl, bc
    ld b, h
    ld c, l
    ld hl, $001a
    add hl, de
    ld a, [bc]
    ld [hl], a
    dec hl
    inc bc
    ld a, [bc]
    ld [hl], a
    ret


    inc h
    ld c, b
    adc b
    ld c, b
    db $ec
    ld c, b
    ld d, b
    ld c, c
    ld h, b
    add hl, bc
    ld h, b
    add hl, bc
    ld h, b
    add hl, bc
    ld [$0807], sp
    rlca
    ld b, b
    ld b, $b0
    inc b
    or b
    inc b
    add h
    inc bc
    add h
    inc bc
    jr nz, @+$05

    jr nz, jr_002_483f

    jr nz, jr_002_4841

    ld e, b

jr_002_483f:
    ld [bc], a
    ld e, b

jr_002_4841:
    ld [bc], a
    sub b
    ld bc, $0190
    sub b
    ld bc, $0190
    sub b
    ld bc, $00c8
    ret z

    nop
    ret z

    nop
    ret z

    nop
    ret z

    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld b, b
    ld b, $40
    ld b, $40
    ld b, $40
    ld b, $40
    ld b, $b0
    inc b
    or b
    inc b
    or b
    inc b
    or b
    inc b
    add h
    inc bc
    add h
    inc bc
    cp h
    ld [bc], a
    cp h
    ld [bc], a
    db $f4
    ld bc, $01f4
    inc l
    ld bc, $012c
    inc l
    ld bc, $00c8
    ret z

    nop
    ret z

    nop
    ret z

    nop
    ret z

    nop
    ret z

    nop
    ret z

    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    or b
    inc b
    or b
    inc b
    or b
    inc b
    add sp, $03
    add sp, $03
    add h
    inc bc
    cp h
    ld [bc], a
    cp h
    ld [bc], a
    cp h
    ld [bc], a
    db $f4
    ld bc, $01f4
    inc l
    ld bc, $012c
    inc l
    ld bc, $012c
    ret z

    nop
    ret z

    nop
    ret z

    nop
    ret z

    nop
    ret z

    nop
    ret z

    nop
    ret z

    nop
    ret z

    nop
    ret z

    nop
    ret z

    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    add h
    inc bc
    add h
    inc bc
    add h
    inc bc
    jr nz, @+$05

    jr nz, jr_002_495d

    jr nz, jr_002_495f

    ld e, b

jr_002_495d:
    ld [bc], a
    ld e, b

jr_002_495f:
    ld [bc], a
    ld e, b
    ld [bc], a
    db $f4
    ld bc, $01f4
    db $f4
    ld bc, $012c
    inc l
    ld bc, $012c
    ret z

    nop
    ret z

    nop
    ret z

    nop
    ret z

    nop
    ret z

    nop
    ret z

    nop
    ret z

    nop
    ret z

    nop
    ret z

    nop
    ret z

    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop
    ld h, h
    nop

Call_002_49b4:
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


    ld hl, $c5f3
    ld de, $a104
    ld c, $03

jr_002_49f8:
    ld a, [hl+]
    ld b, a
    ld a, [de]
    sub b
    jr c, jr_002_4a09

    cp $00
    jr nz, jr_002_4a06

    inc de
    dec c
    jr nz, jr_002_49f8

jr_002_4a06:
    ld a, $00
    ret


jr_002_4a09:
    ld hl, $a104
    ld de, $c5f3
    ld a, [$c5f3]
    ld [hl+], a
    ld a, [$c5f4]
    ld [hl+], a
    ld a, [$c5f5]
    ld [hl+], a
    ld a, $8b
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld a, [$c60a]
    ld [hl+], a
    ld a, [$c60c]
    ld [hl+], a
    ld a, [$c60d]
    ld [hl+], a
    ld [hl], $01
    ld hl, $a104
    ld de, $a0fa
    ld c, $03

jr_002_4a36:
    ld a, [hl+]
    ld b, a
    ld a, [de]
    sub b
    jr c, jr_002_4a44

    cp $00
    jr nz, jr_002_4a7e

    inc de
    dec c
    jr nz, jr_002_4a36

jr_002_4a44:
    ld de, $a104
    ld hl, $a0fa
    ld c, $0a

jr_002_4a4c:
    ld a, [de]
    ld b, a
    ld a, [hl]
    ld [de], a
    ld [hl], b
    inc de
    inc hl
    dec c
    jr nz, jr_002_4a4c

    ld hl, $a0fa
    ld de, $a0f0
    ld c, $03

jr_002_4a5e:
    ld a, [hl+]
    ld b, a
    ld a, [de]
    sub b
    jr c, jr_002_4a6c

    cp $00
    jr nz, jr_002_4a7e

    inc de
    dec c
    jr nz, jr_002_4a5e

jr_002_4a6c:
    ld de, $a0fa
    ld hl, $a0f0
    ld c, $0a

jr_002_4a74:
    ld a, [de]
    ld b, a
    ld a, [hl]
    ld [de], a
    ld [hl], b
    inc de
    inc hl
    dec c
    jr nz, jr_002_4a74

jr_002_4a7e:
    call Call_000_01cb
    ld a, $01
    ret


    ld hl, $c5f9
    ld de, $a12c
    ld c, $04

jr_002_4a8c:
    ld a, [hl+]
    ld b, a
    ld a, [de]
    sub b
    jr c, jr_002_4a9d

    cp $00
    jr nz, jr_002_4a9a

    inc de
    dec c
    jr nz, jr_002_4a8c

jr_002_4a9a:
    ld a, $00
    ret


jr_002_4a9d:
    ld hl, $a12c
    ld de, $c5f9
    ld a, [$c5f9]
    ld [hl+], a
    ld a, [$c5fa]
    ld [hl+], a
    ld a, [$c5fb]
    ld [hl+], a
    ld a, [$c5fc]
    ld [hl+], a
    ld a, $8b
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld a, [$a459]
    cp $1f
    jr z, jr_002_4ac9

    ld a, [$c6db]
    ld [hl+], a
    ld a, [$c6dc]
    ld [hl+], a
    jr jr_002_4acf

jr_002_4ac9:
    ld a, $05
    ld [hl+], a
    ld a, $ff
    ld [hl+], a

jr_002_4acf:
    ld [hl], $01
    ld hl, $a12c
    ld de, $a122
    ld c, $04

jr_002_4ad9:
    ld a, [hl+]
    ld b, a
    ld a, [de]
    sub b
    jr c, jr_002_4ae7

    cp $00
    jr nz, jr_002_4b21

    inc de
    dec c
    jr nz, jr_002_4ad9

jr_002_4ae7:
    ld de, $a12c
    ld hl, $a122
    ld c, $0a

jr_002_4aef:
    ld a, [de]
    ld b, a
    ld a, [hl]
    ld [de], a
    ld [hl], b
    inc de
    inc hl
    dec c
    jr nz, jr_002_4aef

    ld hl, $a122
    ld de, $a118
    ld c, $04

jr_002_4b01:
    ld a, [hl+]
    ld b, a
    ld a, [de]
    sub b
    jr c, jr_002_4b0f

    cp $00
    jr nz, jr_002_4b21

    inc de
    dec c
    jr nz, jr_002_4b01

jr_002_4b0f:
    ld de, $a122
    ld hl, $a118
    ld c, $0a

jr_002_4b17:
    ld a, [de]
    ld b, a
    ld a, [hl]
    ld [de], a
    ld [hl], b
    inc de
    inc hl
    dec c
    jr nz, jr_002_4b17

jr_002_4b21:
    call Call_000_01cb
    ld a, $01
    ret


    inc sp
    ld c, e
    dec a
    ld c, e
    ld b, a
    ld c, e
    ld d, c
    ld c, e
    ld e, e
    ld c, e
    ld h, l
    ld c, e
    nop
    nop
    adc a
    sub c
    and e
    sbc d
    sbc [hl]
    nop
    nop
    nop
    adc e
    sbc b
    sub c
    sub l
    sbc c
    sbc h
    nop
    and c
    adc e
    sbc [hl]
    nop
    nop
    nop
    sub a
    adc e
    and e
    adc e
    nop
    nop
    nop
    nop
    sub l
    sbc b
    sbc c
    sbc l
    sbc l
    sbc c
    sbc l
    nop
    nop
    nop
    adc e
    sbc [hl]
    sub [hl]
    adc e
    sbc b
    sbc [hl]
    sub e
    sbc l
    nop
    nop
    nop
    sbc l
    sbc [hl]
    adc e
    sub c
    adc a
    nop
    adc e
    sub [hl]
    sub [hl]
    nop
    nop
    ld hl, $cc00
    ld bc, $d0ea
    call Call_002_4c7d
    ld hl, $cc03
    ld bc, $d0e5
    call Call_002_4c4c
    ld hl, $cc06
    ld bc, $d108
    call Call_002_4ecd
    ld hl, $cc07
    ld bc, $d110
    call Call_002_4e6b
    ld hl, $cc0a
    ld bc, $d14a
    call Call_002_4c7d
    ld hl, $cc0d
    ld bc, $d145
    call Call_002_4c4c
    ld hl, $cc10
    ld bc, $d168
    call Call_002_4ecd
    ld hl, $cc11
    ld bc, $d170
    call Call_002_4e6b
    ld hl, $cc14
    ld bc, $d1aa
    call Call_002_4c7d
    ld hl, $cc17
    ld bc, $d1a5
    call Call_002_4c4c
    ld hl, $cc1a
    ld bc, $d1c8
    call Call_002_4ecd
    ld hl, $cc1b
    ld bc, $d1d0
    call Call_002_4e6b
    ret


    ld hl, $cc28
    ld bc, $d2e8
    call Call_002_4d4d
    ld hl, $cc2c
    ld bc, $d2e5
    call Call_002_4c4c
    ld hl, $cc2f
    ld bc, $d303
    call Call_002_4c55
    ld hl, $cc30
    ld bc, $d311
    call Call_002_4ef3
    ld hl, $cc32
    ld bc, $d348
    call Call_002_4d4d
    ld hl, $cc36
    ld bc, $d345
    call Call_002_4c4c
    ld hl, $cc39
    ld bc, $d363
    call Call_002_4c55
    ld hl, $cc3a
    ld bc, $d371
    call Call_002_4ef3
    ld hl, $cc3c
    ld bc, $d3a8
    call Call_002_4d4d
    ld hl, $cc40
    ld bc, $d3a5
    call Call_002_4c4c
    ld hl, $cc43
    ld bc, $d3c3
    call Call_002_4c55
    ld hl, $cc44
    ld bc, $d3d1
    call Call_002_4ef3
    ret


Call_002_4c4c:
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl]
    ld [bc], a
    ret


Call_002_4c55:
    push hl
    inc hl
    ld a, [hl]
    ld [$c659], a
    pop hl
    ld a, [hl]
    ld hl, $4b27
    ld d, $00
    ld e, a
    sla e
    rl d
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld d, $0a
    ld a, [$c659]
    cp $ff
    jr nz, jr_002_4c76

    ld d, $0d

jr_002_4c76:
    ld a, [hl+]
    ld [bc], a
    inc bc
    dec d
    jr nz, jr_002_4c76

    ret


Call_002_4c7d:
    ld a, $00
    ld [$c659], a
    ld a, [hl]
    swap a
    and $0f
    push hl
    ld hl, $5228
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    pop hl
    cp $81
    jr z, jr_002_4c9e

    push af
    ld a, $01
    ld [$c659], a
    pop af
    jr jr_002_4ca0

jr_002_4c9e:
    ld a, $00

jr_002_4ca0:
    ld [bc], a
    ld a, [hl+]
    and $0f
    push hl
    ld hl, $5228
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    pop hl
    cp $81
    jr z, jr_002_4cbb

    push af
    ld a, $01
    ld [$c659], a
    pop af
    jr jr_002_4cc5

jr_002_4cbb:
    ld d, a
    ld a, [$c659]
    or a
    ld a, d
    jr nz, jr_002_4cc5

    ld a, $00

jr_002_4cc5:
    inc bc
    ld [bc], a
    ld a, [hl]
    swap a
    and $0f
    push hl
    ld hl, $5228
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    pop hl
    cp $81
    jr z, jr_002_4ce3

    push af
    ld a, $01
    ld [$c659], a
    pop af
    jr jr_002_4ced

jr_002_4ce3:
    ld d, a
    ld a, [$c659]
    or a
    ld a, d
    jr nz, jr_002_4ced

    ld a, $00

jr_002_4ced:
    inc bc
    ld [bc], a
    ld a, [hl+]
    and $0f
    push hl
    ld hl, $5228
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    pop hl
    cp $81
    jr z, jr_002_4d09

    push af
    ld a, $01
    ld [$c659], a
    pop af
    jr jr_002_4d13

jr_002_4d09:
    ld d, a
    ld a, [$c659]
    or a
    ld a, d
    jr nz, jr_002_4d13

    ld a, $00

jr_002_4d13:
    inc bc
    ld [bc], a
    ld a, [hl]
    swap a
    and $0f
    push hl
    ld hl, $5228
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    pop hl
    cp $81
    jr z, jr_002_4d31

    push af
    ld a, $01
    ld [$c659], a
    pop af
    jr jr_002_4d3b

jr_002_4d31:
    ld d, a
    ld a, [$c659]
    or a
    ld a, d
    jr nz, jr_002_4d3b

    ld a, $00

jr_002_4d3b:
    inc bc
    ld [bc], a
    ld a, [hl]
    and $0f
    push hl
    ld hl, $5228
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    pop hl
    inc bc
    ld [bc], a
    ret


Call_002_4d4d:
    ld a, $00
    ld [$c659], a
    ld a, [hl]
    swap a
    and $0f
    push hl
    ld hl, $5228
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    pop hl
    cp $81
    jr z, jr_002_4d6e

    push af
    ld a, $01
    ld [$c659], a
    pop af
    jr jr_002_4d70

jr_002_4d6e:
    ld a, $00

jr_002_4d70:
    ld [bc], a
    ld a, [hl+]
    and $0f
    push hl
    ld hl, $5228
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    pop hl
    cp $81
    jr z, jr_002_4d8b

    push af
    ld a, $01
    ld [$c659], a
    pop af
    jr jr_002_4d95

jr_002_4d8b:
    ld d, a
    ld a, [$c659]
    or a
    ld a, d
    jr nz, jr_002_4d95

    ld a, $00

jr_002_4d95:
    inc bc
    ld [bc], a
    ld a, [hl]
    swap a
    and $0f
    push hl
    ld hl, $5228
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    pop hl
    cp $81
    jr z, jr_002_4db3

    push af
    ld a, $01
    ld [$c659], a
    pop af
    jr jr_002_4dbd

jr_002_4db3:
    ld d, a
    ld a, [$c659]
    or a
    ld a, d
    jr nz, jr_002_4dbd

    ld a, $00

jr_002_4dbd:
    inc bc
    ld [bc], a
    ld a, [hl+]
    and $0f
    push hl
    ld hl, $5228
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    pop hl
    cp $81
    jr z, jr_002_4dd9

    push af
    ld a, $01
    ld [$c659], a
    pop af
    jr jr_002_4de3

jr_002_4dd9:
    ld d, a
    ld a, [$c659]
    or a
    ld a, d
    jr nz, jr_002_4de3

    ld a, $00

jr_002_4de3:
    inc bc
    ld [bc], a
    ld a, [hl]
    swap a
    and $0f
    push hl
    ld hl, $5228
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    pop hl
    cp $81
    jr z, jr_002_4e01

    push af
    ld a, $01
    ld [$c659], a
    pop af
    jr jr_002_4e0b

jr_002_4e01:
    ld d, a
    ld a, [$c659]
    or a
    ld a, d
    jr nz, jr_002_4e0b

    ld a, $00

jr_002_4e0b:
    inc bc
    ld [bc], a
    ld a, [hl+]
    and $0f
    push hl
    ld hl, $5228
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    pop hl
    cp $81
    jr z, jr_002_4e27

    push af
    ld a, $01
    ld [$c659], a
    pop af
    jr jr_002_4e31

jr_002_4e27:
    ld d, a
    ld a, [$c659]
    or a
    ld a, d
    jr nz, jr_002_4e31

    ld a, $00

jr_002_4e31:
    inc bc
    ld [bc], a
    ld a, [hl]
    swap a
    and $0f
    push hl
    ld hl, $5228
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    pop hl
    cp $81
    jr z, jr_002_4e4f

    push af
    ld a, $01
    ld [$c659], a
    pop af
    jr jr_002_4e59

jr_002_4e4f:
    ld d, a
    ld a, [$c659]
    or a
    ld a, d
    jr nz, jr_002_4e59

    ld a, $00

jr_002_4e59:
    inc bc
    ld [bc], a
    ld a, [hl]
    and $0f
    push hl
    ld hl, $5228
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    pop hl
    inc bc
    ld [bc], a
    ret


Call_002_4e6b:
    ld a, $00
    ld [$c659], a
    ld a, [hl+]
    and $0f
    push hl
    ld hl, $5228
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    pop hl
    cp $81
    jr z, jr_002_4e8a

    push af
    ld a, $01
    ld [$c659], a
    pop af
    jr jr_002_4e94

jr_002_4e8a:
    ld d, a
    ld a, [$c659]
    or a
    ld a, d
    jr nz, jr_002_4e94

    ld a, $00

jr_002_4e94:
    ld [bc], a
    ld a, [hl]
    swap a
    and $0f
    push hl
    ld hl, $5228
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    pop hl
    cp $81
    jr z, jr_002_4eb1

    push af
    ld a, $01
    ld [$c659], a
    pop af
    jr jr_002_4ebb

jr_002_4eb1:
    ld d, a
    ld a, [$c659]
    or a
    ld a, d
    jr nz, jr_002_4ebb

    ld a, $00

jr_002_4ebb:
    inc bc
    ld [bc], a
    ld a, [hl]
    and $0f
    push hl
    ld hl, $5228
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    pop hl
    inc bc
    ld [bc], a
    ret


Call_002_4ecd:
    ld a, [hl]
    swap a
    and $0f
    push hl
    ld hl, $5228
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    pop hl
    cp $81
    jr nz, jr_002_4ee2

    ld a, $00

jr_002_4ee2:
    ld [bc], a
    ld a, [hl]
    and $0f
    push hl
    ld hl, $5228
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    pop hl
    inc bc
    ld [bc], a
    ret


Call_002_4ef3:
    ld a, [hl]
    cp $ff
    jr nz, jr_002_4efe

    ld a, $00
    ld [bc], a
    inc bc
    ld [bc], a
    ret


jr_002_4efe:
    ld a, [hl]
    add $01
    ld e, $00

jr_002_4f03:
    ld d, a
    sub $0a
    jr c, jr_002_4f0b

    inc e
    jr jr_002_4f03

jr_002_4f0b:
    ld a, e
    or a
    jr z, jr_002_4f19

    push de
    ld hl, $5228
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    pop de

jr_002_4f19:
    ld [bc], a
    ld a, d
    ld hl, $5228
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    inc bc
    ld [bc], a
    ret


    ld hl, $c63c
    ld a, [hl+]
    cp $0e
    jr nz, jr_002_4f74

    ld a, [hl]
    cp $10
    jr nz, jr_002_4f74

    ld a, [$cc09]
    or a
    jr z, jr_002_4f49

    xor a
    ld [$cc09], a
    ld hl, $cc03
    ld bc, $d0e5
    call Call_002_4c4c
    ld a, $01
    ret


jr_002_4f49:
    ld a, [$cc13]
    or a
    jr z, jr_002_4f5f

    xor a
    ld [$cc13], a
    ld hl, $cc0d
    ld bc, $d145
    call Call_002_4c4c
    ld a, $01
    ret


jr_002_4f5f:
    ld a, [$cc1d]
    or a
    ret z

    xor a
    ld [$cc1d], a
    ld hl, $cc17
    ld bc, $d1a5
    call Call_002_4c4c
    ld a, $01
    ret


jr_002_4f74:
    ld a, [$c63d]
    add $01
    ld [$c63d], a
    ld a, [$c63c]
    adc $00
    ld [$c63c], a
    ld a, [$cc09]
    or a
    jr z, jr_002_4f92

    ld hl, $cc00
    ld bc, $d0e5
    jr jr_002_4fab

jr_002_4f92:
    ld a, [$cc13]
    or a
    jr z, jr_002_4fa0

    ld hl, $cc0a
    ld bc, $d145
    jr jr_002_4fab

jr_002_4fa0:
    ld a, [$cc1d]
    or a
    ret z

    ld hl, $cc14
    ld bc, $d1a5

jr_002_4fab:
    ld de, $c64b
    ld a, h
    ld [de], a
    inc de
    ld a, l
    ld [de], a
    ldh a, [$ff8d]
    and $33
    jr z, jr_002_5005

    and $11
    jr z, jr_002_4feb

    ld hl, $c64b
    ld a, [hl+]
    ld l, [hl]
    ld h, a
    ld d, $00
    ld e, $09
    add hl, de
    ld a, [hl]
    cp $03
    jr nz, jr_002_4fe2

    ldh a, [$ff8d]
    and $10
    jp nz, Jump_002_5077

    ld [hl], $00
    ld hl, $c64b
    ld a, [hl+]
    ld l, [hl]
    ld h, a
    call Call_002_4c4c
    ld a, $01
    ret


jr_002_4fe2:
    inc a
    ld [hl], a
    ld a, $03
    ldh [$ffa1], a
    jp Jump_002_5077


jr_002_4feb:
    ld hl, $c64b
    ld a, [hl+]
    ld l, [hl]
    ld h, a
    ld d, $00
    ld e, $09
    add hl, de
    ld a, [hl]
    cp $01
    jp z, Jump_002_5077

    dec a
    ld [hl], a
    ld a, $03
    ldh [$ffa1], a
    jp Jump_002_5077


jr_002_5005:
    ldh a, [$ff8d]
    and $c0
    jr z, jr_002_501c

    ld a, $03
    ldh [$ffa1], a
    ld a, $00
    ld [$c63e], a
    ldh a, [$ff8d]
    and $80
    jr nz, jr_002_5034

    jr jr_002_5057

jr_002_501c:
    ld a, [$c63e]
    inc a
    ld [$c63e], a
    and $07
    jp nz, Jump_002_5077

    ldh a, [$ff8c]
    and $c0
    jp z, Jump_002_5077

    and $80
    jp z, Jump_002_5057

jr_002_5034:
    ld hl, $c64b
    ld a, [hl+]
    ld l, [hl]
    ld h, a
    push hl
    ld d, $00
    ld e, $09
    add hl, de
    ld a, [hl]
    pop hl
    dec a
    add $03
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    cp $8b
    jr z, jr_002_5051

    dec a
    jr jr_002_5053

jr_002_5051:
    ld a, $a8

jr_002_5053:
    ld [hl], a
    jp Jump_002_5077


Jump_002_5057:
jr_002_5057:
    ld hl, $c64b
    ld a, [hl+]
    ld l, [hl]
    ld h, a
    push hl
    ld d, $00
    ld e, $09
    add hl, de
    ld a, [hl]
    pop hl
    dec a
    add $03
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    cp $a8
    jr z, jr_002_5074

    inc a
    jr jr_002_5076

jr_002_5074:
    ld a, $8b

jr_002_5076:
    ld [hl], a

Jump_002_5077:
    ld hl, $c64b
    ld a, [hl+]
    ld l, [hl]
    ld h, a
    ld d, $00
    ld e, $03
    add hl, de
    push bc
    call Call_002_4c4c
    pop bc
    ld a, [$c63d]
    and $02
    jp nz, Jump_002_50a4

    ld hl, $c64b
    ld a, [hl+]
    ld l, [hl]
    ld h, a
    ld d, $00
    ld e, $09
    add hl, de
    ld a, [hl]
    dec a
    ld h, b
    ld l, c
    ld d, $00
    ld e, a
    add hl, de
    ld [hl], $ed

Jump_002_50a4:
    ld a, $00
    ret


    ld hl, $c63c
    ld a, [hl+]
    cp $0e
    jr nz, jr_002_50f5

    ld a, [hl]
    cp $10
    jr nz, jr_002_50f5

    ld a, [$cc31]
    or a
    jr z, jr_002_50ca

    xor a
    ld [$cc31], a
    ld hl, $cc2c
    ld bc, $d2e5
    call Call_002_4c4c
    ld a, $01
    ret


jr_002_50ca:
    ld a, [$cc3b]
    or a
    jr z, jr_002_50e0

    xor a
    ld [$cc3b], a
    ld hl, $cc36
    ld bc, $d345
    call Call_002_4c4c
    ld a, $01
    ret


jr_002_50e0:
    ld a, [$cc45]
    or a
    ret z

    xor a
    ld [$cc45], a
    ld hl, $cc40
    ld bc, $d3a5
    call Call_002_4c4c
    ld a, $01
    ret


jr_002_50f5:
    ld a, [$c63d]
    add $01
    ld [$c63d], a
    ld a, [$c63c]
    adc $00
    ld [$c63c], a
    ld a, [$cc31]
    or a
    jr z, jr_002_5113

    ld hl, $cc28
    ld bc, $d2e5
    jr jr_002_512c

jr_002_5113:
    ld a, [$cc3b]
    or a
    jr z, jr_002_5121

    ld hl, $cc32
    ld bc, $d345
    jr jr_002_512c

jr_002_5121:
    ld a, [$cc45]
    or a
    ret z

    ld hl, $cc3c
    ld bc, $d3a5

jr_002_512c:
    ld de, $c64b
    ld a, h
    ld [de], a
    inc de
    ld a, l
    ld [de], a
    ldh a, [$ff8d]
    and $33
    jr z, jr_002_5186

    and $11
    jr z, jr_002_516c

    ld hl, $c64b
    ld a, [hl+]
    ld l, [hl]
    ld h, a
    ld d, $00
    ld e, $09
    add hl, de
    ld a, [hl]
    cp $03
    jr nz, jr_002_5163

    ldh a, [$ff8d]
    and $10
    jp nz, Jump_002_51f8

    ld [hl], $00
    ld hl, $c64b
    ld a, [hl+]
    ld l, [hl]
    ld h, a
    call Call_002_4c4c
    ld a, $01
    ret


jr_002_5163:
    inc a
    ld [hl], a
    ld a, $03
    ldh [$ffa1], a
    jp Jump_002_51f8


jr_002_516c:
    ld hl, $c64b
    ld a, [hl+]
    ld l, [hl]
    ld h, a
    ld d, $00
    ld e, $09
    add hl, de
    ld a, [hl]
    cp $01
    jp z, Jump_002_51f8

    dec a
    ld [hl], a
    ld a, $03
    ldh [$ffa1], a
    jp Jump_002_51f8


jr_002_5186:
    ldh a, [$ff8d]
    and $c0
    jr z, jr_002_519d

    ld a, $03
    ldh [$ffa1], a
    ld a, $00
    ld [$c63e], a
    ldh a, [$ff8d]
    and $80
    jr nz, jr_002_51b5

    jr jr_002_51d8

jr_002_519d:
    ld a, [$c63e]
    inc a
    ld [$c63e], a
    and $07
    jp nz, Jump_002_51f8

    ldh a, [$ff8c]
    and $c0
    jp z, Jump_002_51f8

    and $80
    jp z, Jump_002_51d8

jr_002_51b5:
    ld hl, $c64b
    ld a, [hl+]
    ld l, [hl]
    ld h, a
    push hl
    ld d, $00
    ld e, $09
    add hl, de
    ld a, [hl]
    pop hl
    dec a
    add $04
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    cp $8b
    jr z, jr_002_51d2

    dec a
    jr jr_002_51d4

jr_002_51d2:
    ld a, $a8

jr_002_51d4:
    ld [hl], a
    jp Jump_002_51f8


Jump_002_51d8:
jr_002_51d8:
    ld hl, $c64b
    ld a, [hl+]
    ld l, [hl]
    ld h, a
    push hl
    ld d, $00
    ld e, $09
    add hl, de
    ld a, [hl]
    pop hl
    dec a
    add $04
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    cp $a8
    jr z, jr_002_51f5

    inc a
    jr jr_002_51f7

jr_002_51f5:
    ld a, $8b

jr_002_51f7:
    ld [hl], a

Jump_002_51f8:
    ld hl, $c64b
    ld a, [hl+]
    ld l, [hl]
    ld h, a
    ld d, $00
    ld e, $04
    add hl, de
    push bc
    call Call_002_4c4c
    pop bc
    ld a, [$c63d]
    and $02
    jp nz, Jump_002_5225

    ld hl, $c64b
    ld a, [hl+]
    ld l, [hl]
    ld h, a
    ld d, $00
    ld e, $09
    add hl, de
    ld a, [hl]
    dec a
    ld h, b
    ld l, c
    ld d, $00
    ld e, a
    add hl, de
    ld [hl], $ed

Jump_002_5225:
    ld a, $00
    ret


    add c
    add d
    add e
    add h
    add l
    add [hl]
    add a
    adc b
    adc c
    adc d
    ld a, [$c7c7]
    cp $00
    jp nz, Jump_002_532b

    ld a, $52
    ld [$c1e5], a
    ld a, $74
    ld [$c1e4], a
    ld a, $20
    ld [$c1e2], a
    ld a, $40
    ld [$c1e3], a
    ld a, $52
    ld [$c205], a
    ld a, $75
    ld [$c204], a
    ld a, $28
    ld [$c202], a
    ld a, $40
    ld [$c203], a
    ld a, $52
    ld [$c225], a
    ld a, $76
    ld [$c224], a
    ld a, $30
    ld [$c222], a
    ld a, $40
    ld [$c223], a
    ld a, $52
    ld [$c245], a
    ld a, $77
    ld [$c244], a
    ld a, $38
    ld [$c242], a
    ld a, $40
    ld [$c243], a
    ld a, $52
    ld [$c265], a
    ld a, $78
    ld [$c264], a
    ld a, $40
    ld [$c262], a
    ld a, $40
    ld [$c263], a
    ld a, $52
    ld [$c285], a
    ld a, $79
    ld [$c284], a
    ld a, $48
    ld [$c282], a
    ld a, $40
    ld [$c283], a
    ld a, $52
    ld [$c2a5], a
    ld a, $7a
    ld [$c2a4], a
    ld a, $20
    ld [$c2a2], a
    ld a, $48
    ld [$c2a3], a
    ld a, $52
    ld [$c2c5], a
    ld a, $7b
    ld [$c2c4], a
    ld a, $28
    ld [$c2c2], a
    ld a, $48
    ld [$c2c3], a
    ld a, $52
    ld [$c2e5], a
    ld a, $7c
    ld [$c2e4], a
    ld a, $30
    ld [$c2e2], a
    ld a, $48
    ld [$c2e3], a
    ld a, $52
    ld [$c305], a
    ld a, $7d
    ld [$c304], a
    ld a, $38
    ld [$c302], a
    ld a, $48
    ld [$c303], a
    ld a, $52
    ld [$c325], a
    ld a, $7e
    ld [$c324], a
    ld a, $40
    ld [$c322], a
    ld a, $48
    ld [$c323], a
    ld a, $52
    ld [$c345], a
    ld a, $7f
    ld [$c344], a
    ld a, $48
    ld [$c342], a
    ld a, $48
    ld [$c343], a
    ret


Jump_002_532b:
    ld a, [$c7c7]
    cp $01
    jp nz, Jump_002_53fc

    ld a, $52
    ld [$c1e5], a
    ld a, $6a
    ld [$c1e4], a
    ld a, $24
    ld [$c1e2], a
    ld a, $40
    ld [$c1e3], a
    ld a, $52
    ld [$c205], a
    ld a, $6b
    ld [$c204], a
    ld a, $2c
    ld [$c202], a
    ld a, $40
    ld [$c203], a
    ld a, $52
    ld [$c225], a
    ld a, $6c
    ld [$c224], a
    ld a, $34
    ld [$c222], a
    ld a, $40
    ld [$c223], a
    ld a, $52
    ld [$c245], a
    ld a, $6d
    ld [$c244], a
    ld a, $3c
    ld [$c242], a
    ld a, $40
    ld [$c243], a
    ld a, $52
    ld [$c265], a
    ld a, $6e
    ld [$c264], a
    ld a, $44
    ld [$c262], a
    ld a, $40
    ld [$c263], a
    ld a, $52
    ld [$c285], a
    ld a, $6f
    ld [$c284], a
    ld a, $24
    ld [$c282], a
    ld a, $48
    ld [$c283], a
    ld a, $52
    ld [$c2a5], a
    ld a, $70
    ld [$c2a4], a
    ld a, $2c
    ld [$c2a2], a
    ld a, $48
    ld [$c2a3], a
    ld a, $52
    ld [$c2c5], a
    ld a, $71
    ld [$c2c4], a
    ld a, $34
    ld [$c2c2], a
    ld a, $48
    ld [$c2c3], a
    ld a, $52
    ld [$c2e5], a
    ld a, $72
    ld [$c2e4], a
    ld a, $3c
    ld [$c2e2], a
    ld a, $48
    ld [$c2e3], a
    ld a, $52
    ld [$c305], a
    ld a, $73
    ld [$c304], a
    ld a, $44
    ld [$c302], a
    ld a, $48
    ld [$c303], a
    ret


Jump_002_53fc:
    ld a, $52
    ld [$c1e5], a
    ld a, $60
    ld [$c1e4], a
    ld a, $24
    ld [$c1e2], a
    ld a, $40
    ld [$c1e3], a
    ld a, $52
    ld [$c205], a
    ld a, $61
    ld [$c204], a
    ld a, $2c
    ld [$c202], a
    ld a, $40
    ld [$c203], a
    ld a, $52
    ld [$c225], a
    ld a, $62
    ld [$c224], a
    ld a, $34
    ld [$c222], a
    ld a, $40
    ld [$c223], a
    ld a, $52
    ld [$c245], a
    ld a, $63
    ld [$c244], a
    ld a, $3c
    ld [$c242], a
    ld a, $40
    ld [$c243], a
    ld a, $52
    ld [$c265], a
    ld a, $64
    ld [$c264], a
    ld a, $44
    ld [$c262], a
    ld a, $40
    ld [$c263], a
    ld a, $52
    ld [$c285], a
    ld a, $65
    ld [$c284], a
    ld a, $24
    ld [$c282], a
    ld a, $48
    ld [$c283], a
    ld a, $52
    ld [$c2a5], a
    ld a, $66
    ld [$c2a4], a
    ld a, $2c
    ld [$c2a2], a
    ld a, $48
    ld [$c2a3], a
    ld a, $52
    ld [$c2c5], a
    ld a, $67
    ld [$c2c4], a
    ld a, $34
    ld [$c2c2], a
    ld a, $48
    ld [$c2c3], a
    ld a, $52
    ld [$c2e5], a
    ld a, $68
    ld [$c2e4], a
    ld a, $3c
    ld [$c2e2], a
    ld a, $48
    ld [$c2e3], a
    ld a, $52
    ld [$c305], a
    ld a, $69
    ld [$c304], a
    ld a, $44
    ld [$c302], a
    ld a, $48
    ld [$c303], a
    ret


    ld a, $52
    ld [$c205], a
    ld a, $c7
    ld [$c204], a
    ld a, $30
    ld [$c202], a
    ld a, $20
    ld [$c203], a
    ld a, $52
    ld [$c225], a
    ld a, $c8
    ld [$c224], a
    ld a, $38
    ld [$c222], a
    ld a, $20
    ld [$c223], a
    ld a, $52
    ld [$c245], a
    ld a, $c9
    ld [$c244], a
    ld a, $30
    ld [$c242], a
    ld a, $28
    ld [$c243], a
    ld a, $52
    ld [$c265], a
    ld a, $ca
    ld [$c264], a
    ld a, $38
    ld [$c262], a
    ld a, $28
    ld [$c263], a
    ld a, $52
    ld [$c285], a
    ld a, $cb
    ld [$c284], a
    ld a, $30
    ld [$c282], a
    ld a, $30
    ld [$c283], a
    ld a, $52
    ld [$c2a5], a
    ld a, $cc
    ld [$c2a4], a
    ld a, $38
    ld [$c2a2], a
    ld a, $30
    ld [$c2a3], a
    ld a, $52
    ld [$c2c5], a
    ld a, $cd
    ld [$c2c4], a
    ld a, $30
    ld [$c2c2], a
    ld a, $38
    ld [$c2c3], a
    ld a, $52
    ld [$c2e5], a
    ld a, $ce
    ld [$c2e4], a
    ld a, $38
    ld [$c2e2], a
    ld a, $38
    ld [$c2e3], a
    ld a, $52
    ld [$c305], a
    ld a, $cf
    ld [$c304], a
    ld a, $30
    ld [$c302], a
    ld a, $40
    ld [$c303], a
    ld a, $52
    ld [$c325], a
    ld a, $d0
    ld [$c324], a
    ld a, $38
    ld [$c322], a
    ld a, $40
    ld [$c323], a
    ld a, $52
    ld [$c345], a
    ld a, $d1
    ld [$c344], a
    ld a, $30
    ld [$c342], a
    ld a, $48
    ld [$c343], a
    ld a, $52
    ld [$c365], a
    ld a, $d2
    ld [$c364], a
    ld a, $38
    ld [$c362], a
    ld a, $48
    ld [$c363], a
    ret


    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
