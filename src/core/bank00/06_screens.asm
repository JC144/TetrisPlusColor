; ============================================================================
; bank00/06_screens.asm — $2041-$3ee8: AdvanceScreenState + screen/game state machines
; Part of SECTION "ROM Bank $000"; included in order by bank00_core_engine.asm.
; ============================================================================
ASSERT @ == $2041 ; AdvanceScreenState, state machine progression
AdvanceScreenState:
    ld a, [SCREEN_SUBSTATE]
    inc a
    ld [SCREEN_SUBSTATE], a
    ret


    ld b, $00
    ld c, $00
    ld e, $15
    call RenderTilemapCell
    ld h, $00
    ld l, $00
    ld b, $14
    ld c, $12
    call QueueTextDraw
    ret


Call_000_205e:
    ld a, $0b
    rst $10
    ld hl, $0012
    add hl, de
    ld a, [hl]
    or a
    jp z, Jump_000_20d6

    dec a
    ld b, $00
    ld c, a
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    ld hl, $5893
    add hl, bc
    push hl
    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, $00
    ld c, a
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    pop hl
    add hl, bc
    push hl
    ld hl, $0013
    add hl, de
    ld a, [hl]
    and $03
    ld b, $00
    ld c, a
    sla c
    rl b
    pop hl
    add hl, bc
    push hl
    ld a, [hl]
    ld b, a
    ld hl, $0003
    add hl, de
    ld a, [hl]
    add b
    ld [hl], a
    pop hl
    inc hl
    ld a, [hl]
    ld b, a
    ld hl, $0002
    add hl, de
    ld a, [hl]
    add b
    ld [hl], a
    ld hl, $0013
    add hl, de
    ld a, [hl]
    inc a
    ld [hl], a

Jump_000_20d6:
    ld a, $01
    rst $18
    ret


Call_000_20da:
    push af

jr_000_20db:
    ldh a, [rSTAT]
    and $03
    jr nz, jr_000_20db

    pop af
    ret


Call_000_20e3:
    ld a, [$d605]
    ld b, a
    ld a, [$d63d]
    xor b
    ret z

    ld a, b
    ld [$d63d], a
    ld a, [$d601]
    or a
    ret nz

    ld a, $07
    ld [GAME_STATE], a
    ld a, $03

Call_000_20fc:
    ld [SCREEN_SUBSTATE], a
    ld a, $02
    ld [$c5a8], a
    ret


Call_000_2105:
    ld a, [$d605]
    and a
    ret z

    ld a, [$d604]
    and a
    ret nz

    ld a, [$d600]
    and a
    ret z

    ld a, [$d604]
    and a
    ret nz

    ld a, $81
    ldh [rSC], a
    ret


Jump_000_211e:
    push af
    push bc
    push de

Jump_000_2121:
    push hl
    xor a
    ld [$d607], a
    ld a, [$d605]
    and a
    jr nz, jr_000_2169

    ld a, [$d606]
    and a
    jr z, jr_000_215f

    ldh a, [rSB]
    cp $dd
    jr z, jr_000_214b

    cp $fe
    jr z, jr_000_2153

    xor a
    ld [$d600], a
    ld a, $dd
    ldh [rSB], a
    ld a, $80
    ldh [rSC], a
    jp Jump_000_21bc


jr_000_214b:
    ld a, $01
    ld [$d600], a
    ld [$d601], a

jr_000_2153:
    ld a, $01
    ld [$d605], a
    ld a, [$d602]
    inc a
    ld [$d602], a

jr_000_215f:
    xor a
    ldh [rSB], a
    ld a, $80
    ldh [rSC], a
    jp Jump_000_21bc


jr_000_2169:
    ld a, $01
    ld [$d604], a
    ld a, [$d600]
    xor $01
    ld [$d600], a
    ld hl, $d611
    ld a, [$d603]
    ld e, a
    xor a
    ld d, a
    add hl, de
    ldh a, [rSB]
    ld [hl], a
    ld hl, $d620
    add hl, de
    ld a, [hl]
    ldh [rSB], a
    ld a, $80
    ldh [rSC], a
    ld a, [$d603]
    inc a
    ld [$d603], a
    ld b, a
    ld a, [$d602]
    cp b
    jp nz, Jump_000_21ac

    xor a
    ld [$d603], a
    ld [$d604], a
    call Call_000_22af
    call Call_000_2271
    jr jr_000_21bc

Jump_000_21ac:
    ld a, [$d600]
    and a
    jr z, jr_000_21bc

    ld bc, $001a
    call Call_000_2230
    ld a, $81
    ldh [rSC], a

Jump_000_21bc:
jr_000_21bc:
    pop hl
    pop de
    pop bc
    pop af
    reti


Jump_000_21c1:
    push af
    ld a, $02
    ldh [rTAC], a
    ld a, $eb
    ldh [rTIMA], a
    ld a, $81
    ldh [rSC], a
    pop af
    reti


Call_000_21d0:
    ld a, $00
    ld [$d602], a
    ld a, $dd
    ldh [rSB], a
    ld [$d606], a
    ld a, $80
    ldh [rSC], a
    xor a
    ld [$d600], a
    ld [$d605], a
    ld [$d63d], a
    ld [$d601], a
    ld [$d604], a
    ld [$d603], a
    ld [$d607], a
    ld [$c7d8], a
    ld [$d633], a
    ld [$d638], a
    ld [$d635], a
    ld [$d63a], a
    ld [$d637], a
    ld [$d63c], a
    ret


    xor a
    ldh [rSB], a
    ld [$d606], a
    ld [$d601], a
    ret


Call_000_2216:
    ld a, $fe
    ldh [rSB], a
    ld a, $81
    ldh [rSC], a
    ret


Call_000_221f:
    ld a, [$d605]

Jump_000_2222:
    and a
    ret nz

    ld a, $dd
    ldh [rSB], a
    ld [$d606], a
    ld a, $80
    ldh [rSC], a
    ret


Call_000_2230:
jr_000_2230:
    dec bc
    ld a, b
    or c
    jr nz, jr_000_2230

    ret


Call_000_2236:
    di
    ld a, $01
    ld [$d637], a
    ld a, [$d633]
    ld l, a
    ld h, $d4
    ld b, $00
    ld de, $d62d
    ld a, [de]
    ld [hl], a
    inc l
    add b
    ld b, a
    inc de
    ld a, [de]
    ld [hl], a
    inc l
    add b
    ld b, a
    inc de
    ld a, [de]
    ld [hl], a
    inc l
    add b
    ld b, a
    inc de
    ld a, [de]
    ld [hl], a
    inc l
    add b
    jr nz, jr_000_2263

    jr c, jr_000_2263

    ei
    ret


jr_000_2263:
    ld a, l
    ld [$d633], a
    xor a
    ld hl, $d62d
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ei
    ret


Call_000_2271:
    ld a, [$d637]
    and a
    jr z, jr_000_22a6

    xor a
    ld [$d637], a
    ld a, [$d635]
    ld l, a
    ld h, $d4
    ld b, $00
    ld de, $d620
    ld a, [hl]
    inc l
    ld [de], a
    add b
    ld b, a
    inc de
    ld a, [hl]
    inc l
    ld [de], a
    add b
    ld b, a
    inc de
    ld a, [hl]
    inc l
    ld [de], a
    add b
    ld b, a
    inc de
    ld a, [hl]
    inc l
    ld [de], a
    add b
    jr nz, jr_000_22a1

    jr c, jr_000_22a1

    ret


jr_000_22a1:
    ld a, l
    ld [$d635], a
    ret


jr_000_22a6:
    xor a
    ld hl, $d620
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ret


Call_000_22af:
    ld a, $01
    ld [$d63c], a
    ld a, [$d638]
    ld l, a
    ld h, $d5
    ld b, $00
    ld de, $d611
    ld a, [de]
    ld [hl], a
    inc l
    add b
    ld b, a
    inc de
    ld a, [de]
    ld [hl], a
    inc l
    add b
    ld b, a
    inc de
    ld a, [de]
    ld [hl], a
    inc l
    add b
    ld b, a
    inc de
    ld a, [de]
    ld [hl], a
    inc l
    add b
    jr nz, jr_000_22da

    jr c, jr_000_22da

    ret


jr_000_22da:
    ld a, l
    ld [$d638], a
    ret


Call_000_22df:
    di
    ld a, [$d63c]
    and a
    jr z, jr_000_2317

    xor a
    ld [$d63c], a
    ld a, [$d63a]
    ld l, a
    ld h, $d5
    ld b, $00
    ld de, $d627
    ld a, [hl]
    inc l
    ld [de], a
    add b
    ld b, a
    inc de
    ld a, [hl]
    inc l
    ld [de], a
    add b
    ld b, a
    inc de
    ld a, [hl]
    inc l
    ld [de], a
    add b
    ld b, a
    inc de
    ld a, [hl]
    inc l
    ld [de], a
    add b
    jr nz, jr_000_2311

    jr c, jr_000_2311

    ei
    ret


jr_000_2311:
    ld a, l
    ld [$d63a], a
    ei
    ret


jr_000_2317:
    xor a
    ld hl, $d627
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ei
    ret


Call_000_2321:
    ld de, $c0a0
    ld b, $19

jr_000_2326:
    ld hl, $0005
    add hl, de
    ld a, [hl]
    ld hl, $2353
    push de
    ld d, $00
    ld e, a
    sla e
    rl d
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    pop de
    push de
    push bc
    jp hl


Jump_000_233e:
    pop bc
    pop de
    ld h, d

Jump_000_2341:
    ld l, e
    ld de, $0020
    add hl, de
    ld d, h
    ld e, l
    dec b
    jr nz, jr_000_2326

    ld a, [$c5ac]
    inc a
    ld [$c5ac], a
    ret


    inc sp
    inc h
    scf
    inc h
    ld l, l
    inc h
    or c
    inc h
    ld e, c
    dec h
    and d
    dec h
    jr nc, jr_000_2387

    ld e, e
    ld h, $78
    ld h, $f2
    ld h, $64
    daa
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    add hl, bc
    jr z, jr_000_23a5

    jr z, jr_000_23bd

    jr z, jr_000_23ad

jr_000_237a:
    inc h
    inc sp

jr_000_237c:
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h

jr_000_2387:
    inc sp
    inc h
    inc sp

jr_000_238a:
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h

Call_000_2391:
    inc sp
    inc h
    ret c

    jr z, jr_000_237a

    jr z, jr_000_237c

jr_000_2398:
    jr z, jr_000_238a

    jr z, jr_000_2398

    jr z, jr_000_23a6

    add hl, hl
    inc d
    add hl, hl
    jr nz, jr_000_23cc

    inc sp
    inc h

jr_000_23a5:
    inc sp

jr_000_23a6:
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h

jr_000_23ad:
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc l
    add hl, hl
    ld a, d
    add hl, hl
    sbc $29
    and e
    ld a, [hl+]

jr_000_23bd:
    rst $30
    ld a, [hl+]
    ld a, a
    dec hl
    or c
    dec hl
    ld a, b
    ld h, $f2
    ld h, $64
    daa
    inc sp
    inc h
    inc sp

jr_000_23cc:
    inc h
    inc sp
    inc h

jr_000_23cf:
    inc sp
    inc h
    inc sp
    inc h
    call $e22c
    inc l
    ld hl, sp+$2c
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    adc e
    dec l
    db $10
    ld l, $d2
    ld l, $ad
    jr nc, jr_000_2438

Jump_000_23fc:
    jr nc, jr_000_23cf

    cpl
    inc sp

Call_000_2400:
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    ld [$342b], a
    inc l
    ld a, [hl]
    inc l
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    inc sp
    inc h
    jp Jump_000_233e


    ret


    push de

jr_000_2438:
    call Call_001_5e50
    call Call_001_5ec6
    call Call_001_5eeb
    call Call_001_5e50
    call Call_001_5ec6
    call Call_001_5e50
    pop de
    ld a, $81
    ld [$c120], a
    ld a, $08
    ld [$c122], a
    ld a, $98
    ld [$c123], a
    ld a, $a5
    ld [$c124], a
    ld a, $27
    ld [$c125], a
    ld hl, $0005
    add hl, de
    ld [hl], $02
    jp Jump_000_233e


    push de
    call Call_001_5eeb
    call Call_001_5ec6
    call Call_001_5e50
    pop de
    call $6985
    call $6938
    call $6960
    call Call_001_5ef2
    call $696e
    ld hl, $c0c0
    call Call_001_5453
    ld hl, $c0c5
    ld [hl], $10
    ld hl, $c0d4
    ld a, [$c5ae]
    ld [hl], a
    ld hl, $c0d6
    ld [hl], $02
    ld hl, $c0d8
    ld [hl], $02
    ld a, $01
    ld [$c136], a
    ld hl, $0005
    add hl, de
    ld [hl], $00
    jp Jump_000_233e


    call Call_001_5ef2
    ld h, $d2
    ld l, $01
    ld b, $00
    ld c, $00
    push de
    ld e, $11

Jump_000_24bf:
    push hl
    ld d, $0a

Jump_000_24c2:
    ld a, [hl]
    or a
    jp nz, Jump_000_24d5

    pop hl
    push bc
    ld bc, $ffe0
    add hl, bc
    pop bc
    dec e
    jp nz, Jump_000_24bf

    jp Jump_000_24fd


Jump_000_24d5:
    inc hl
    dec d
    jp nz, Jump_000_24c2

    pop hl
    push de
    push bc
    ld d, h
    ld e, l
    ld hl, $c5e1
    sla c
    rl b
    add hl, bc
    ld b, h
    ld c, l
    ld a, d
    ld [bc], a
    inc bc
    ld a, e
    ld [bc], a
    ld h, d
    ld l, e
    pop bc
    pop de
    inc c
    push bc
    ld bc, $ffe0
    add hl, bc
    pop bc
    dec e
    jp nz, Jump_000_24bf

Jump_000_24fd:
    ld a, $00
    ld [$c5e9], a
    ld hl, $c5e1
    ld a, [hl]
    or a
    jp z, Jump_000_254f

    ld a, $01
    ld [$c5e9], a
    ld hl, $c5e3
    ld a, [hl]
    or a
    jp z, Jump_000_2536

    ld a, $02
    ld [$c5e9], a
    ld hl, $c5e5
    ld a, [hl]
    or a
    jp z, Jump_000_2536

    ld a, $03
    ld [$c5e9], a
    ld hl, $c5e7
    ld a, [hl]
    or a
    jp z, Jump_000_2536

    ld a, $04
    ld [$c5e9], a

Jump_000_2536:
    pop de
    ld hl, $0005
    add hl, de
    ld [hl], $04
    ld hl, $001b
    add hl, de
    ld [hl], $00
    call $69ba
    call $69f9
    call $6a48
    jp Jump_000_233e


Jump_000_254f:
    pop de
    ld hl, $0005
    add hl, de
    ld [hl], $02
    jp Jump_000_233e


    push de
    ld a, [$c5c8]
    or $10
    ld [$c5c8], a
    ld hl, $001b
    add hl, de
    ld a, [hl]
    cp $0f
    jp z, Jump_000_258c

    add $01
    ld [hl], a
    ld hl, $c5e1
    ld c, $04

Jump_000_2574:
    ld a, [hl+]
    or a
    jp z, Jump_000_259e

    ld d, a
    ld e, [hl]
    ld b, $0a
    ld a, $e7

jr_000_257f:
    ld [de], a
    inc de
    dec b
    jr nz, jr_000_257f

    inc hl
    dec c
    jp nz, Jump_000_2574

    jp Jump_000_259e


Jump_000_258c:
    ld hl, $0005
    add hl, de
    ld [hl], $05
    ld hl, $001b
    add hl, de
    ld [hl], $00
    ld hl, $001a
    add hl, de
    ld [hl], $00

Jump_000_259e:
    pop de
    jp Jump_000_233e


    push de
    ld a, [$c5c8]
    or $10
    ld [$c5c8], a
    ld hl, $001b
    add hl, de
    ld a, [hl]
    or a
    jp z, Jump_000_25b8

    dec a
    ld [hl], a
    jr jr_000_2626

Jump_000_25b8:
    ld hl, $001a
    add hl, de
    ld a, [hl]
    ld b, $00
    ld c, a
    ld hl, $262a
    add hl, bc
    ld a, [hl]
    cp $ff
    jp z, Jump_000_25f8

    ld [$c659], a
    ld hl, $001b
    add hl, de
    ld [hl], $02
    ld hl, $001a
    add hl, de
    ld a, [hl]
    inc a
    ld [hl], a
    ld hl, $c5e1
    ld c, $04

Jump_000_25df:
    ld a, [hl+]
    or a
    jp z, Jump_000_2626

    ld d, a
    ld e, [hl]
    ld b, $0a
    ld a, [$c659]

jr_000_25eb:
    ld [de], a
    inc de
    dec b
    jr nz, jr_000_25eb

    inc hl
    dec c
    jp nz, Jump_000_25df

    jp Jump_000_2626


Jump_000_25f8:
    ld hl, $c5e1
    ld c, $04

Jump_000_25fd:
    ld a, [hl+]
    or a
    jp z, Jump_000_2612

    ld d, a
    ld e, [hl]
    ld b, $0a
    ld a, $00

jr_000_2608:
    ld [de], a
    inc de
    dec b
    jr nz, jr_000_2608

    inc hl
    dec c
    jp nz, Jump_000_25fd

Jump_000_2612:
    pop de
    push de
    ld hl, $0005
    add hl, de
    ld [hl], $06
    ld hl, $001b
    add hl, de
    ld [hl], $00
    ld hl, $001a
    add hl, de
    ld [hl], $00

Jump_000_2626:
jr_000_2626:
    pop de
    jp Jump_000_233e


    rst $20
    add sp, -$17
    ld [$ff00], a
    ld hl, $001b
    add hl, de
    ld a, [hl]
    cp $0f
    jp z, Jump_000_2640

    add $01
    ld [hl], a
    jp Jump_000_233e


Jump_000_2640:
    call $68b8
    push de
    ld hl, $c5e1
    ld d, h
    ld e, l
    ld hl, $c5ea
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    pop de
    ld hl, $0005
    add hl, de
    ld [hl], $07
    jp Jump_000_233e


    ld a, [$c5c8]
    or $01
    ld [$c5c8], a
    ld hl, $c5ea
    ld a, [hl]
    cp $ff
    jp nz, Jump_000_233e

    ld hl, $0005
    add hl, de
    ld [hl], $02
    call $6a95
    jp Jump_000_233e


    ld a, $01
    ld [$c73d], a
    ld a, $00
    ld [$c0e5], a
    ld [$c125], a
    push de
    ld hl, $001b
    add hl, de
    ld [hl], $00
    ld h, $d0
    ld l, $01
    ld b, $0a
    ld c, $11

jr_000_2694:
    push hl

jr_000_2695:
    ld a, [hl]
    or a
    jr z, jr_000_269b

    ld [hl], $ec

jr_000_269b:
    inc hl
    dec b
    jr nz, jr_000_2695

    pop hl
    ld d, $00
    ld e, $20
    add hl, de
    ld b, $0a
    dec c
    jr nz, jr_000_2694

    ld h, $00
    ld l, $01
    ld b, $0a
    ld c, $12
    call Call_001_5e20
    ld d, $d0
    ld e, $04
    ld hl, $c5b0
    ld b, $05
    ld c, $04

jr_000_26c0:
    push de

jr_000_26c1:
    ld a, [de]
    ld [hl+], a
    inc de
    dec b
    jr nz, jr_000_26c1

    pop de
    push hl
    ld hl, $0020
    add hl, de
    ld d, h
    ld e, l
    pop hl
    ld b, $05
    dec c
    jr nz, jr_000_26c0

    pop de
    ld hl, $0005
    add hl, de
    ld a, $09
    ld [hl], a
    ld hl, $0005
    add hl, de
    ld a, $09
    ld [hl], a
    ld hl, $001d
    add hl, de
    ld [hl], $00
    ld a, $02
    ld [SOUND_CONTROL], a
    jp Jump_000_233e


    ld hl, $001b
    add hl, de
    ld a, [hl]
    cp $c4
    jp z, Jump_000_274f

    push af
    call Call_001_6cde
    pop af
    inc a
    ld [hl], a
    and $10
    jp z, Jump_000_2734

    ld hl, $001d
    add hl, de
    ld [hl], $00
    push de
    ld d, $d0
    ld e, $04
    ld hl, $c5b0
    ld b, $05
    ld c, $04

jr_000_271a:
    push de

jr_000_271b:
    ld a, [hl]
    ld [de], a
    inc hl
    inc de
    dec b
    jr nz, jr_000_271b

    pop de
    push hl
    ld hl, $0020

Call_000_2727:
    add hl, de
    ld d, h
    ld e, l
    pop hl
    ld b, $05
    dec c
    jr nz, jr_000_271a

    pop de
    jp Jump_000_233e


Jump_000_2734:
    ld hl, $001d
    add hl, de
    ld a, [hl]
    or a
    jr nz, jr_000_2742

    ld [hl], $01
    ld a, $17
    ldh [$ffa1], a

jr_000_2742:
    push de
    ld hl, $c0c0
    ld d, h
    ld e, l
    call Call_001_6ae9
    pop de
    jp Jump_000_233e


Jump_000_274f:
    ld hl, $001b
    add hl, de
    ld [hl], $00
    ld hl, $0014
    add hl, de
    ld [hl], $00
    ld hl, $0005
    add hl, de
    ld [hl], $0a
    jp Jump_000_233e


    ld hl, $0014
    add hl, de
    ld a, [hl]
    cp $2d
    jp z, Jump_000_27a7

    ld hl, $0014
    add hl, de
    ld a, [hl]
    ld hl, $27af
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld [hl], $d0
    inc hl
    ld [hl], $d1
    pop hl
    ld b, $00
    ld c, $20
    add hl, bc
    ld [hl], $d2
    inc hl
    ld [hl], $d3
    ld hl, $0014
    add hl, de
    ld a, [hl]
    inc a
    ld [hl], a
    ld h, $00
    ld l, $01
    ld b, $0a
    ld c, $12
    call Call_001_5e20
    jp Jump_000_233e


Jump_000_27a7:
    ld hl, $c0bc
    ld [hl], $01
    jp Jump_000_233e


    ld bc, $03d2
    jp nc, $d205

    rlca
    jp nc, $d209

    ret


    pop de
    rst $00
    pop de
    push bc
    pop de
    jp $c1d1


    pop de
    add c
    pop de
    add e
    pop de
    add l
    pop de
    add a
    pop de
    adc c
    pop de
    ld c, c
    pop de
    ld b, a
    pop de
    ld b, l
    pop de
    ld b, e
    pop de
    ld b, c
    pop de
    ld bc, $03d1
    pop de
    dec b
    pop de
    rlca
    pop de
    add hl, bc
    pop de
    ret


    ret nc

    rst $00
    ret nc

    push bc
    ret nc

    jp $c1d0


    ret nc

    add c
    ret nc

    add e
    ret nc

    add l
    ret nc

    add a
    ret nc

    adc c
    ret nc

    ld c, c
    ret nc

    ld b, a
    ret nc

    ld b, l
    ret nc

    ld b, e
    ret nc

    ld b, c
    ret nc

    ld bc, $03d0
    ret nc

    dec b
    ret nc

    rlca
    ret nc

    add hl, bc
    ret nc

    call $6acb
    call $6b65
    or a
    jr z, jr_000_281d

    call Call_001_6f0b
    ld hl, $c0a5
    ld [hl], $08
    jp Jump_000_233e


jr_000_281d:
    call Call_001_6ae9
    ld hl, $001b
    add hl, de
    ld [hl], $12
    ld hl, $0005
    add hl, de
    ld [hl], $11
    jp Jump_000_233e


    ld hl, $001b
    add hl, de
    ld a, [hl]
    or a
    jr z, jr_000_283c

    dec a
    ld [hl], a
    jp Jump_000_233e


jr_000_283c:
    ld hl, $0005
    add hl, de
    ld [hl], $12
    jp Jump_000_233e


    call $6e65
    ldh a, [$ff8d]
    and $30
    jp z, Jump_000_2852

    call $6d48

Jump_000_2852:
    ldh a, [$ff8c]
    and $30
    jp z, Jump_000_285c

    call $6cf7

Jump_000_285c:
    ldh a, [$ff8d]
    and $80
    jp z, Jump_000_2869

    call $6e10
    jp Jump_000_233e


Jump_000_2869:
    ldh a, [$ff8c]
    and $80
    jp z, Jump_000_2873

    call $6d92

Jump_000_2873:
    ld hl, $0005
    add hl, de
    ld a, [hl]
    or a
    jp z, Jump_000_233e

    ld hl, $0014
    add hl, de
    ld a, [hl]
    or a
    jp z, Jump_000_288a

    dec a
    ld [hl], a
    jp Jump_000_233e


Jump_000_288a:
    ld a, $00
    call Call_001_6c54
    or a
    jr z, jr_000_28b6

    ld hl, $0019
    add hl, de
    ld a, [hl]
    or a
    jr nz, jr_000_28a7

    ld [hl], $01
    ld hl, $0014
    add hl, de
    ld a, [$c5af]
    ld [hl], a
    jp Jump_000_233e


jr_000_28a7:
    ld a, $07
    ldh [$ffa1], a
    call Call_001_6f0b
    ld hl, $c0a5
    ld [hl], $03
    jp Jump_000_233e


jr_000_28b6:
    ld hl, $0014
    add hl, de
    ld a, [$c5ae]
    ld [hl], a
    ld hl, $0019
    add hl, de
    ld [hl], $00
    call Call_001_6bea
    ld bc, $0020
    call Call_001_6ce7
    ld a, $00
    call Call_001_6ee9
    call Call_001_6ae9
    jp Jump_000_233e


    ld a, $02
    rst $10
    call Call_001_4000
    ld a, $01
    rst $18
    jp Jump_000_233e


    ld a, $02
    rst $10
    call $401b
    ld a, $01
    rst $18
    jp Jump_000_233e


Call_000_28f0:
    ld a, $02
    rst $10
    call $4073
    ld a, $01
    rst $18
    jp Jump_000_233e


    ld a, $02
    rst $10
    call $411f
    ld a, $01
    rst $18
    jp Jump_000_233e


    ld a, $02
    rst $10
    call $41e0
    ld a, $01
    rst $18
    jp Jump_000_233e


    ld a, $02
    rst $10
    call $42d5
    ld a, $01
    rst $18
    jp Jump_000_233e


    ld a, $02
    rst $10
    call $4364
    ld a, $01
    rst $18
    jp Jump_000_233e


    push de
    ld a, [$c5a8]
    cp $02
    call z, $5e92
    ld a, [$c5a8]
    cp $02
    call nz, $5e50
    call Call_001_5ec6
    call Call_001_5eeb
    ld a, [$c5a8]
    cp $02
    call z, $5e92
    ld a, [$c5a8]
    cp $02
    call nz, $5e50
    call Call_001_5ec6
    ld a, [$c5a8]
    cp $02
    call z, $5e92
    ld a, [$c5a8]
    cp $02
    call nz, $5e50
    pop de
    ld a, $32
    ld [$c5ae], a
    ld a, $0a
    ld [$c5af], a
    ld hl, $0005
    add hl, de
    ld [hl], $32
    jp Jump_000_233e


    ld a, [$c5a8]
    cp $01
    call z, $6f12
    ld a, [$c734]
    cp $02
    call z, $6f12
    call Call_001_5ef2
    ld a, [$c6da]
    or a
    jr z, jr_000_299c

    ld hl, $0005
    add hl, de
    ld [hl], $00
    jp Jump_000_233e


jr_000_299c:
    push de
    call Call_001_5eeb
    call Call_001_5ec6
    ld a, [$c5a8]
    cp $02
    call z, $5e92
    ld a, [$c5a8]
    cp $02
    call nz, $5e50
    pop de
    ld hl, $c0c0
    call Call_001_5453
    ld hl, $c0c5
    ld [hl], $40
    ld hl, $c0d4
    ld a, [$c5ae]
    ld [hl], a
    ld hl, $c0d6
    ld [hl], $02
    ld hl, $c0d8
    ld [hl], $03
    ld a, $00
    ld [$c0f6], a
    ld hl, $0005
    add hl, de
    ld [hl], $00
    jp Jump_000_233e


    ld a, [$c735]
    inc a
    ld [$c735], a
    ld a, $01
    ld [$c0f6], a
    call Call_001_5ef2
    ld h, $d2
    ld l, $01
    ld b, $00
    ld c, $00
    push de
    ld e, $11

Jump_000_29f8:
    push hl
    ld d, $0a

Jump_000_29fb:
    ld a, [hl]
    or a
    jr z, jr_000_2a06

    and $f0
    cp $70
    jp nz, Jump_000_2a14

jr_000_2a06:
    pop hl
    push bc
    ld bc, $ffe0
    add hl, bc
    pop bc
    dec e
    jp nz, Jump_000_29f8

    jp Jump_000_2a3c


Jump_000_2a14:
    inc hl
    dec d
    jp nz, Jump_000_29fb

    pop hl
    push de
    push bc
    ld d, h
    ld e, l
    ld hl, $c5e1
    sla c
    rl b
    add hl, bc
    ld b, h
    ld c, l
    ld a, d
    ld [bc], a
    inc bc
    ld a, e
    ld [bc], a
    ld h, d
    ld l, e
    pop bc
    pop de
    inc c
    push bc
    ld bc, $ffe0
    add hl, bc
    pop bc
    dec e
    jp nz, Jump_000_29f8

Jump_000_2a3c:
    ld a, $00
    ld [$c5e9], a
    ld hl, $c5e1
    ld a, [hl]
    or a
    jp z, Jump_000_2a8d

    ld a, $01
    ld [$c5e9], a
    ld hl, $c5e3
    ld a, [hl]
    or a
    jp z, Jump_000_2a75

    ld a, $02
    ld [$c5e9], a
    ld hl, $c5e5
    ld a, [hl]
    or a
    jp z, Jump_000_2a75

    ld a, $03
    ld [$c5e9], a
    ld hl, $c5e7
    ld a, [hl]
    or a
    jp z, Jump_000_2a75

    ld a, $04
    ld [$c5e9], a

Jump_000_2a75:
    pop de
    ld hl, $0005
    add hl, de
    ld [hl], $34
    ld hl, $001b
    add hl, de
    ld [hl], $00
    ld a, [$c5a8]
    cp $02
    call nz, $6f40
    jp Jump_000_233e


Jump_000_2a8d:
    pop de
    ld hl, $0005
    add hl, de
    ld a, [$c5a8]
    cp $02
    jr z, jr_000_2a9e

    ld [hl], $32
    jp Jump_000_233e


jr_000_2a9e:
    ld [hl], $68
    jp Jump_000_233e


    push de
    ld a, [$c5c8]
    or $10
    ld [$c5c8], a
    ld hl, $001b
    add hl, de
    ld a, [hl]
    cp $0f
    jp z, Jump_000_2ad6

    add $01
    ld [hl], a
    ld hl, $c5e1
    ld c, $04

Jump_000_2abe:
    ld a, [hl+]
    or a
    jp z, Jump_000_2af3

    ld d, a
    ld e, [hl]
    ld b, $0a
    ld a, $e7

jr_000_2ac9:
    ld [de], a
    inc de
    dec b
    jr nz, jr_000_2ac9

    inc hl
    dec c
    jp nz, Jump_000_2abe

    jp Jump_000_2af3


Jump_000_2ad6:
    ld hl, $0005
    add hl, de
    ld [hl], $35
    ld hl, $001b
    add hl, de
    ld [hl], $00
    ld hl, $001a
    add hl, de
    ld [hl], $00
    ld a, [$c5a8]
    cp $02
    jr nz, jr_000_2af3

    ld a, $0b
    ldh [$ffa1], a

Jump_000_2af3:
jr_000_2af3:
    pop de
    jp Jump_000_233e


    push de
    ld a, [$c5c8]
    or $10
    ld [$c5c8], a
    ld hl, $001b
    add hl, de
    ld a, [hl]
    or a
    jp z, Jump_000_2b0d

    dec a
    ld [hl], a
    jr jr_000_2b7b

Jump_000_2b0d:
    ld hl, $001a
    add hl, de
    ld a, [hl]
    ld b, $00
    ld c, a
    ld hl, $262a
    add hl, bc
    ld a, [hl]
    cp $ff
    jp z, Jump_000_2b4d

    ld [$c659], a
    ld hl, $001b
    add hl, de
    ld [hl], $02
    ld hl, $001a
    add hl, de
    ld a, [hl]
    inc a
    ld [hl], a
    ld hl, $c5e1
    ld c, $04

Jump_000_2b34:
    ld a, [hl+]
    or a
    jp z, Jump_000_2b7b

    ld d, a
    ld e, [hl]
    ld b, $0a
    ld a, [$c659]

jr_000_2b40:
    ld [de], a
    inc de
    dec b
    jr nz, jr_000_2b40

    inc hl
    dec c
    jp nz, Jump_000_2b34

    jp Jump_000_2b7b


Jump_000_2b4d:
    ld hl, $c5e1
    ld c, $04

Jump_000_2b52:
    ld a, [hl+]
    or a
    jp z, Jump_000_2b67

    ld d, a
    ld e, [hl]
    ld b, $0a
    ld a, $00

jr_000_2b5d:
    ld [de], a
    inc de
    dec b
    jr nz, jr_000_2b5d

    inc hl
    dec c
    jp nz, Jump_000_2b52

Jump_000_2b67:
    pop de
    push de
    ld hl, $0005
    add hl, de
    ld [hl], $36
    ld hl, $001b
    add hl, de
    ld [hl], $00
    ld hl, $001a
    add hl, de
    ld [hl], $00

Jump_000_2b7b:
jr_000_2b7b:
    pop de
    jp Jump_000_233e


    ld hl, $001b
    add hl, de
    ld a, [hl]
    cp $0f
    jp z, Jump_000_2b8f

    add $01
    ld [hl], a
    jp Jump_000_233e


Jump_000_2b8f:
    call $68b8
    push de
    ld hl, $c5e1
    ld d, h
    ld e, l
    ld hl, $c5ea
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    pop de
    ld hl, $0005
    add hl, de
    ld [hl], $37
    ld a, $09
    ldh [$ffa1], a
    call $78d1
    jp Jump_000_233e


    ld a, [$c5c8]
    or $01
    ld [$c5c8], a
    ld hl, $c5ea
    ld a, [hl]
    cp $ff
    jp nz, Jump_000_233e

    ld a, [$c5a8]
    cp $02
    jr z, jr_000_2bd2

    ld hl, $0005
    add hl, de
    ld [hl], $32
    jp Jump_000_233e


jr_000_2bd2:
    ld hl, $0005
    add hl, de
    ld [hl], $68
    ld a, [$c5e9]
    dec a
    or a
    jp z, Jump_000_233e

    ld b, a
    ld a, $c0
    or b
    ld [$d62d], a
    jp Jump_000_233e


    ld a, [$c7ab]
    or a
    jr nz, jr_000_2bf9

    ld hl, $0005
    add hl, de
    ld [hl], $32
    jp Jump_000_233e


jr_000_2bf9:
    push de
    ld [$c7ba], a
    ld bc, $c7b2
    ld hl, $c7bb
    ld d, $08

jr_000_2c05:
    ld a, [bc]
    ld [hl+], a
    inc bc
    dec d
    jr nz, jr_000_2c05

    pop de
    xor a
    ld [$c7c3], a
    ld [$c7ab], a
    ld [$c7b2], a
    ld [$c7b3], a
    ld [$c7b4], a
    ld [$c7b5], a
    ld [$c7b6], a
    ld [$c7b7], a
    ld [$c7b8], a
    ld [$c7b9], a
    ld hl, $0005
    add hl, de
    ld [hl], $69
    jp Jump_000_233e


    call $75e4
    ld a, [$c7c3]
    ld hl, $c7bb
    ld b, $00
    ld c, a
    add hl, bc
    ld a, [hl]
    ld b, a
    ld hl, $d201
    ld c, $00

jr_000_2c48:
    ld a, c
    cp $0a
    jr z, jr_000_2c60

    ld a, b
    cp c
    jr nz, jr_000_2c57

    ld a, $00
    ld [hl+], a
    inc c
    jr jr_000_2c48

jr_000_2c57:
    ld a, [$c7c6]
    add $e0
    ld [hl+], a
    inc c
    jr jr_000_2c48

jr_000_2c60:
    ld a, [$c7c6]
    inc a
    cp $07
    jr nz, jr_000_2c6a

    ld a, $00

jr_000_2c6a:
    ld [$c7c6], a
    ld hl, $c5ea
    ld [hl], $d2
    inc hl
    ld [hl], $01
    ld hl, $0005
    add hl, de
    ld [hl], $6a
    jp Jump_000_233e


    ld a, [$c5c8]
    or $01
    ld [$c5c8], a
    ld hl, $c5ea
    ld a, [hl]
    cp $ff
    jp nz, Jump_000_233e

    ld a, [PROF_ACTION1]
    or a
    jr nz, jr_000_2cad

    ld a, [PROF_ACTION2]
    or a
    jr nz, jr_000_2cad

    push de
    ld de, $c100
    ld hl, $0003
    add hl, de
    ld a, [hl]
    sub $08
    ld [hl], a
    pop de
    ld a, $01
    ld [RENDER_REQUEST], a

jr_000_2cad:
    ld a, [$c7c3]
    inc a
    ld [$c7c3], a
    ld b, a
    ld a, [$c7ba]
    cp b
    jr z, jr_000_2cc4

    ld hl, $0005
    add hl, de
    ld [hl], $69
    jp Jump_000_233e


jr_000_2cc4:
    ld hl, $0005
    add hl, de
    ld [hl], $32
    jp Jump_000_233e


    call $6acb
    call Call_001_6ae9
    ld hl, $001b
    add hl, de
    ld [hl], $12
    ld hl, $0005
    add hl, de
    ld [hl], $41
    jp Jump_000_233e


    ld hl, $001b
    add hl, de
    ld a, [hl]
    or a
    jr z, jr_000_2cef

    dec a
    ld [hl], a
    jp Jump_000_233e


jr_000_2cef:
    ld hl, $0005
    add hl, de
    ld [hl], $42
    jp Jump_000_233e


    call $6e65
    ldh a, [$ff8d]
    and $30
    jp z, Jump_000_2d05

    call $6d48

Jump_000_2d05:
    ldh a, [$ff8c]
    and $30
    jp z, Jump_000_2d0f

Jump_000_2d0c:
    call $6cf7

Jump_000_2d0f:
    ldh a, [$ff8d]
    and $80
    jp z, Jump_000_2d1c

    call $6e10
    jp Jump_000_233e


Jump_000_2d1c:
    ldh a, [$ff8c]
    and $80
    jp z, Jump_000_2d26

    call $6d92

Jump_000_2d26:
    ld hl, $0005
    add hl, de
    ld a, [hl]
    or a
    jp z, Jump_000_233e

    ld hl, $0014
    add hl, de
    ld a, [hl]
    or a
    jp z, Jump_000_2d3d

    dec a
    ld [hl], a
    jp Jump_000_233e


Jump_000_2d3d:
    ld a, $00
    call Call_001_6c54
    or a
    jr z, jr_000_2d69

    ld hl, $0019
    add hl, de
    ld a, [hl]
    or a
    jr nz, jr_000_2d5a

    ld [hl], $01
    ld hl, $0014
    add hl, de
    ld a, [$c5af]
    ld [hl], a
    jp Jump_000_233e


jr_000_2d5a:
    ld a, $07
    ldh [$ffa1], a
    call Call_001_6f0b
    ld hl, $c0a5
    ld [hl], $33
    jp Jump_000_233e


jr_000_2d69:
    ld hl, $0014
    add hl, de
    ld a, [$c5ae]
    ld [hl], a
    ld hl, $0019
    add hl, de
    ld [hl], $00
    call Call_001_6bea
    ld bc, $0020
    call Call_001_6ce7
    ld a, $00
    call Call_001_6ee9
    call Call_001_6ae9
    jp Jump_000_233e


    ld hl, $0014
    add hl, de
    ld a, [hl]
    ld hl, $2da4
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


Jump_000_2da0:
    pop de
    jp Jump_000_233e


    xor b
    dec l
    sra l
    ld hl, $001b
    add hl, de
    ld a, [hl]
    inc a
    cp $0f
    jr z, jr_000_2db6

    ld [hl], a
    jp Jump_000_2da0


jr_000_2db6:
    ld hl, $001b
    add hl, de
    ld [hl], $1e
    ld hl, $0015
    add hl, de
    ld [hl], $08
    ld hl, $0014
    add hl, de
    ld [hl], $01
    jp Jump_000_2da0


    ld a, $01
    ld [RENDER_REQUEST], a
    ld a, $01
    ld [de], a
    ld a, [$c5ac]
    and $01
    jr z, jr_000_2de5

    ld hl, $0003
    add hl, de
    dec [hl]
    ld a, [hl]
    cp $24
    jp z, Jump_000_2e08

jr_000_2de5:
    ld hl, $001b
    add hl, de
    ld a, [hl]
    or a
    jr z, jr_000_2df2

    dec a
    ld [hl], a
    jp Jump_000_2da0


jr_000_2df2:
    ld a, $00
    ld [de], a
    ld hl, $0015
    add hl, de
    ld a, [hl]
    cp $01
    jr z, jr_000_2e00

    dec a
    ld [hl], a

jr_000_2e00:
    ld hl, $001b
    add hl, de
    ld [hl], a
    jp Jump_000_2da0


Jump_000_2e08:
    ld h, d
    ld l, e
    call Call_001_5453
    jp Jump_000_2da0


    ld hl, $0014
    add hl, de
    ld a, [hl]
    ld hl, $2e29
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


Jump_000_2e25:
    pop de
    jp Jump_000_233e


    dec l
    ld l, $51
    ld l, $21
    dec de
    nop
    add hl, de
    ld [hl], $00
    ld hl, $0017
    add hl, de
    ld [hl], $00
    ld hl, $001c
    add hl, de
    ld [hl], $00
    ld a, $02
    rst $10
    call $47d8
    ld a, $01
    rst $18
    ld hl, $0014
    add hl, de
    ld [hl], $01
    jp Jump_000_2e25


    ld a, [$c6da]
    or a
    jp nz, Jump_000_2e25

    ld hl, $0017
    add hl, de
    ld a, [hl+]
    ld b, a
    ld a, [hl]
    ld c, a
    ld hl, $0019
    add hl, de
    ld a, [hl+]
    sub b
    jr c, jr_000_2e6e

    jr nz, jr_000_2e9d

    ld a, [hl]
    sub c
    jr nc, jr_000_2e9d

jr_000_2e6e:
    ld hl, $0016
    add hl, de
    ld a, [hl]
    or a
    jp nz, Jump_000_2e25

    ld hl, $001b
    add hl, de
    ld a, [hl]
    inc a
    ld [hl], a
    ld a, $02
    rst $10
    call $47d8
    ld a, $01
    rst $18
    ld hl, $0017
    add hl, de
    ld a, $00
    ld [hl+], a
    ld [hl], a
    ld a, [$c6c6]
    inc a
    ld [$c6c6], a
    ld a, $13
    ldh [$ffa1], a
    jp Jump_000_2e25


jr_000_2e9d:
    ld a, [$c5a8]
    cp $02
    jr z, jr_000_2eb0

    ld a, [$c735]
    ld b, a
    ld hl, $001c
    add hl, de
    ld a, [hl]
    sub b
    jr nz, jr_000_2ec0

jr_000_2eb0:
    ld hl, $0018
    add hl, de
    ld a, [hl]
    add $01
    ld [hl], a
    dec hl
    ld a, [hl]
    adc $00
    ld [hl], a
    jp Jump_000_2e25


jr_000_2ec0:
    ld a, b
    ld [hl], a
    ld hl, $0018
    add hl, de
    ld a, [hl]
    add $3c
    ld [hl], a
    dec hl
    ld a, [hl]
    adc $00
    ld [hl], a
    jp Jump_000_2e25


    ld hl, $0014
    add hl, de
    ld a, [hl]
    ld hl, $2eeb
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


Jump_000_2ee7:
    pop de
    jp Jump_000_233e


    db $f4
    ld l, $fd
    ld l, $f1
    ld l, $c3
    rst $20
    ld l, $21
    inc d
    nop
    add hl, de
    ld [hl], $01
    jp Jump_000_2ee7


    call Call_000_205e

Jump_000_2f00:
    ld hl, $0003

Jump_000_2f03:
    add hl, de
    ld a, [hl]
    sub $a0
    jp nc, Jump_000_2f51

    ld hl, $0011
    add hl, de
    ld a, [hl]
    cp $11
    jp z, Jump_000_2ee7

    cp $0f
    jp z, Jump_000_2ee7

    ld hl, $0016
    add hl, de
    ld a, [hl]
    ld hl, $2f59
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl

Jump_000_2f2d:
    ld hl, $0015
    add hl, de
    ld a, [hl]
    ld b, $00
    ld c, a
    sla c
    rl b
    pop hl
    add hl, bc
    ld a, [hl+]

Jump_000_2f3c:
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
    jp Jump_000_2ee7


Jump_000_2f51:
    ld h, d
    ld l, e
    call Call_001_5453
    jp Jump_000_2ee7


    ld h, c
    cpl
    or a
    cpl
    ld a, e
    cpl
    sbc c
    cpl
    inc e
    ld b, $1b
    dec b
    ld a, [de]
    inc b
    add hl, de
    inc bc
    jr jr_000_2f6d

    rla
    inc bc

jr_000_2f6d:
    ld d, $04
    dec d
    dec b
    inc d
    ld b, $13
    rlca
    ld [de], a
    ld [$0a11], sp
    db $10
    ld a, [bc]
    ld e, $08
    dec e
    rlca
    inc e
    ld b, $1b
    dec b
    ld a, [de]
    inc b
    add hl, de
    inc bc
    jr jr_000_2f8b

    rla
    inc bc

jr_000_2f8b:
    ld d, $04
    dec d
    dec b
    inc d
    ld b, $13
    rlca
    ld [de], a
    ld [$0a11], sp
    db $10
    ld a, [bc]
    ld [bc], a
    ld [$0703], sp
    inc b
    ld b, $05
    dec b
    ld b, $04
    rlca
    inc bc
    ld [$0902], sp
    inc bc
    ld a, [bc]
    inc b
    dec bc
    dec b
    inc c
    ld b, $0d
    rlca
    ld c, $08
    rrca
    ld a, [bc]
    db $10
    ld a, [bc]
    inc b
    ld b, $05
    dec b
    ld b, $04
    rlca
    inc bc
    ld [$0902], sp
    inc bc

Jump_000_2fc3:
    ld a, [bc]
    inc b
    dec bc
    dec b
    inc c
    ld b, $0d
    rlca
    ld c, $08
    rrca
    ld a, [bc]
    db $10
    ld a, [bc]
    ld hl, $0014
    add hl, de
    ld a, [hl]
    ld hl, $2fea
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


Jump_000_2fe6:
    pop de
    jp Jump_000_233e


    xor $2f
    inc bc
    jr nc, @+$23

    dec d
    nop
    add hl, de
    ld [hl], $00
    ld hl, $0013
    add hl, de
    ld [hl], $00
    ld hl, $0014
    add hl, de
    ld [hl], $01

Jump_000_3000:
    jp Jump_000_2fe6


    ld hl, $0013
    add hl, de
    ld a, [hl]
    inc a
    ld [hl], a
    cp $06
    jp nz, Jump_000_2fe6

    ld [hl], $00
    ld hl, $0015
    add hl, de
    ld a, [hl]
    inc a

Call_000_3017:
    ld [hl], a
    cp $0a
    jr nz, jr_000_302e

    xor a
    ld [hl], a
    ld a, [$c72f]
    add $0a
    ld [$c72f], a
    ld a, [$c72e]
    adc $00
    ld [$c72e], a

jr_000_302e:
    ld hl, $c607
    ld [hl], $00
    inc hl
    ld [hl], $01
    call Call_001_5ca1
    jp Jump_000_2fe6


    ld hl, $0014
    add hl, de
    ld a, [hl]

Jump_000_3041:
    ld hl, $3053
    ld b, $00
    ld c, a

Call_000_3047:
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


Jump_000_3050:
jr_000_3050:
    jp Jump_000_233e


    ld d, a
    jr nc, @+$7b

    jr nc, jr_000_3079

    nop
    nop
    add hl, de
    ld [hl], $01
    call Call_000_3c88
    ld a, $20
    call ClearObjectFields
    ld hl, $c105
    ld a, $53
    ld [hl], a
    ld a, $01
    ld [PROF_ACTION1], a
    ld hl, $0005
    add hl, de
    ld [hl], $00
    jp Jump_000_3050


jr_000_3079:
    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jr nz, jr_000_3050

    ld a, $02
    ld [PROF_ACTION3], a

Call_000_3087:
    ld a, $03
    ld [PROF_ACTION4], a
    ld a, $31
    ld [$c0a5], a
    ld a, [$c5a8]
    cp $02
    jr z, jr_000_30a5

    ld a, [$c734]
    cp $01
    jr z, jr_000_30a5

    ld hl, $c125
    ld a, $55
    ld [hl], a

jr_000_30a5:
    ld h, d
    ld l, e
    call Call_001_5453
    jp Jump_000_3050


    ld a, [PROF_ACTION1]
    or a
    jr nz, jr_000_30c6

    ld a, [PROF_ACTION2]
    or a
    jr nz, jr_000_30c6

    ld a, [PROF_ACTION3]
    or a
    jr nz, jr_000_30c6

    ld a, [PROF_ACTION4]
    or a
    jp z, Jump_000_233e

jr_000_30c6:
    push af
    call Call_000_3d56
    call $6584
    pop af
    ld hl, $30e2
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


Jump_000_30de:
    pop de
    jp Jump_000_233e


    db $fc
    jr nc, @+$01

    jr nc, jr_000_314a

    ld sp, $31a3
    and c
    ld [hl-], a
    add h

jr_000_30ed:
    inc sp
    add d
    inc [hl]
    dec sp
    dec [hl]
    add hl, bc
    ld [hl], $f3
    ld [hl], $25
    jr c, jr_000_30ed

    jr c, jr_000_30c6

    add hl, sp

Jump_000_30fc:
    jp Jump_000_30de


    ld hl, $0014
    add hl, de
    ld a, [hl]
    ld hl, $3113
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


    rla
    ld sp, $3135
    xor a
    ld [$c73d], a
    ld hl, $0000
    add hl, de
    ld [hl], $01

Jump_000_3121:
    call Call_000_3c88
    call Call_000_3d0d
    ld a, $22
    call ClearObjectFields
    ld hl, $0014
    add hl, de
    ld [hl], $01
    jp Jump_000_30de


    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jp nz, Jump_000_30de

    ld hl, $c1a5
    ld a, $54
    ld [hl], a
    ld a, $01
    ld [$c1b4], a

jr_000_314a:
    push de
    ld de, $c1a0
    ld a, $21
    call ClearObjectFields
    pop de
    ld a, $00
    ld [PROF_ACTION1], a
    call ClearObjectSubfield
    ld a, $10
    ldh [$ffa1], a
    jp Jump_000_30de


    ld hl, $0014
    add hl, de
    ld a, [hl]
    ld hl, $3177
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


    ld a, e
    ld sp, $3189
    ld a, $23
    call ClearObjectFields
    ld hl, $0014
    add hl, de
    ld [hl], $01
    jp Jump_000_30de


    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jp nz, Jump_000_30de

    ld a, $01
    ld [RENDER_REQUEST], a
    ld a, $00
    ld [PROF_ACTION3], a
    call ClearObjectSubfield
    jp Jump_000_30de


    ld hl, $0014
    add hl, de
    ld a, [hl]
    ld hl, $31b7
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


    cp e
    ld sp, $31d6
    ld hl, $0012
    add hl, de
    ld [hl], $00
    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $24
    add b
    call ClearObjectFields
    ld hl, $0014
    add hl, de
    ld [hl], $01
    jp Jump_000_30de


    ld a, [$c0a5]
    sub $35
    jp nc, Jump_000_30de

    call Call_001_64a9
    ld a, [MOVE_RESULT]
    or a
    jr z, jr_000_31f2

    ld a, $0c
    ld [PROF_ACTION1], a
    call ClearObjectSubfield
    jp Jump_000_30de


jr_000_31f2:
    call Call_001_653b
    ld a, [MOVE_RESULT]
    or a
    jp z, Jump_000_3207

    ld a, $0b
    ld [PROF_ACTION1], a
    call ClearObjectSubfield
    jp Jump_000_30de


Jump_000_3207:
    call Call_001_64c8
    ld a, [MOVE_RESULT]
    or a
    jp z, Jump_000_321c

    ld a, $08
    ld [PROF_ACTION3], a
    call ClearObjectSubfield
    jp Jump_000_30de


Jump_000_321c:
    call Call_001_62bb
    ld a, [MOVE_RESULT]
    or a
    jp z, Jump_000_3240

    cp $02
    jr z, jr_000_3235

    ld a, $06
    ld [PROF_ACTION2], a
    call ClearObjectSubfield
    jp Jump_000_30de


jr_000_3235:
    ld a, $07
    ld [PROF_ACTION2], a
    call ClearObjectSubfield
    jp Jump_000_30de


Jump_000_3240:
    call Call_001_61ae
    ld a, [MOVE_RESULT]
    or a
    jp z, Jump_000_325d

    ld hl, $0011
    add hl, de
    ld a, [hl]
    xor $01
    ld [hl], a
    ld a, $04
    ld [PROF_ACTION3], a
    call ClearObjectSubfield
    jp Jump_000_30de


Jump_000_325d:
    call Call_001_6229
    ld a, [MOVE_RESULT]
    or a
    jp z, Jump_000_3272

    ld a, $05
    ld [PROF_ACTION4], a
    call ClearObjectSubfield
    jp Jump_000_30de


Jump_000_3272:
    ld hl, $0012
    add hl, de
    ld a, [hl]
    cp $05
    jr z, jr_000_3280

    inc a
    ld [hl], a
    jp Jump_000_30de


jr_000_3280:
    ld [hl], $00
    call Call_001_6663
    ld a, $01
    ld [RENDER_REQUEST], a
    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, $01
    or a
    jp nz, Jump_000_3297

    ld b, $ff

Jump_000_3297:
    ld hl, $0002
    add hl, de
    ld a, [hl]
    add b
    ld [hl], a
    jp Jump_000_30de


    ld hl, $0014
    add hl, de
    ld a, [hl]
    ld hl, $32b5
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


    cp c
    ld [hl-], a
    and $32
    call Call_001_6229
    ld a, [MOVE_RESULT]
    or a
    jp nz, Jump_000_32d1

    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $26

Jump_000_32cb:
    add b
    call ClearObjectFields
    jr jr_000_32dd

Jump_000_32d1:
    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $36
    add b
    call ClearObjectFields

jr_000_32dd:
    ld hl, $0014
    add hl, de
    ld [hl], $01
    jp Jump_000_30de


    ld a, [$c0a5]
    sub $35
    jp nc, Jump_000_30de

    call Call_001_64a9
    ld a, [MOVE_RESULT]
    or a
    jr z, jr_000_3302

    ld a, $0c
    ld [PROF_ACTION1], a
    call ClearObjectSubfield
    jp Jump_000_30de


jr_000_3302:
    call Call_001_653b
    ld a, [MOVE_RESULT]
    or a
    jp z, Jump_000_3317

    ld a, $0b
    ld [PROF_ACTION1], a
    call ClearObjectSubfield
    jp Jump_000_30de


Jump_000_3317:
    call Call_001_62bb
    ld a, [MOVE_RESULT]
    or a
    jp z, Jump_000_3345

    cp $02
    jr z, jr_000_3335

    ld a, $06
    ld [PROF_ACTION2], a
    ld a, $00
    ld [PROF_ACTION3], a
    call ClearObjectSubfield
    jp Jump_000_30de


jr_000_3335:
    ld a, $07
    ld [PROF_ACTION2], a
    ld a, $00
    ld [PROF_ACTION3], a

Call_000_333f:
    call ClearObjectSubfield
    jp Jump_000_30de


Jump_000_3345:
    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jp nz, Jump_000_30de

    ld hl, $0013
    add hl, de
    inc [hl]
    ld a, [hl]
    sub $07
    jr c, jr_000_3379

    call Call_001_6229
    ld a, [MOVE_RESULT]
    or a
    jp nz, Jump_000_336e

    ld a, $09
    ld [PROF_ACTION3], a
    call ClearObjectSubfield
    jp Jump_000_30de


Jump_000_336e:
    ld a, $0a
    ld [PROF_ACTION3], a
    call ClearObjectSubfield
    jp Jump_000_30de


jr_000_3379:
    ld a, $00
    ld [PROF_ACTION3], a
    call ClearObjectSubfield
    jp Jump_000_30de


    ld hl, $0014
    add hl, de
    ld a, [hl]
    ld hl, $3398
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


    sbc h
    inc sp
    or a
    inc sp
    ld hl, $0012
    add hl, de
    ld [hl], $00
    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $28
    add b
    call ClearObjectFields
    ld hl, $0014
    add hl, de
    ld [hl], $01
    jp Jump_000_30de


    ld a, [$c0a5]
    sub $35
    jp nc, Jump_000_30de

    call Call_001_64a9
    ld a, [MOVE_RESULT]
    or a
    jr z, jr_000_33d3

    ld a, $0c
    ld [PROF_ACTION1], a
    call ClearObjectSubfield
    jp Jump_000_30de


jr_000_33d3:
    call Call_001_653b
    ld a, [MOVE_RESULT]
    or a
    jp z, Jump_000_33e8

    ld a, $0b
    ld [PROF_ACTION1], a
    call ClearObjectSubfield
    jp Jump_000_30de


Jump_000_33e8:
    call Call_001_64c8
    ld a, [MOVE_RESULT]
    or a
    jp z, Jump_000_33fd

    ld a, $08
    ld [PROF_ACTION3], a
    call ClearObjectSubfield
    jp Jump_000_30de


Jump_000_33fd:
    call Call_001_62bb
    ld a, [MOVE_RESULT]
    or a
    jp z, Jump_000_3421

    cp $02
    jr z, jr_000_3416

    ld a, $06
    ld [PROF_ACTION2], a
    call ClearObjectSubfield
    jp Jump_000_30de


jr_000_3416:
    ld a, $07
    ld [PROF_ACTION2], a
    call ClearObjectSubfield
    jp Jump_000_30de


Jump_000_3421:
    call Call_001_61ae
    ld a, [MOVE_RESULT]
    or a
    jp z, Jump_000_343e

    ld hl, $0011
    add hl, de
    ld a, [hl]
    xor $01
    ld [hl], a
    ld a, $04
    ld [PROF_ACTION3], a
    call ClearObjectSubfield
    jp Jump_000_30de


Call_000_343e:
Jump_000_343e:
    call $6272
    ld a, [MOVE_RESULT]
    or a
    jp z, Jump_000_3453

    ld a, $03
    ld [PROF_ACTION4], a
    call ClearObjectSubfield
    jp Jump_000_30de


Jump_000_3453:
    ld hl, $0012
    add hl, de
    ld a, [hl]
    cp $02
    jr z, jr_000_3461

    inc a
    ld [hl], a
    jp Jump_000_30de


jr_000_3461:
    ld [hl], $00
    call Call_001_6663
    ld a, $01
    ld [RENDER_REQUEST], a
    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, $01
    or a
    jp nz, Jump_000_3478

    ld b, $ff

Jump_000_3478:
    ld hl, $0002
    add hl, de
    ld a, [hl]
    add b
    ld [hl], a
    jp Jump_000_30de


    ld hl, $0014
    add hl, de
    ld a, [hl]
    ld hl, $3496
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


    sbc h
    inc [hl]
    cp d
    inc [hl]
    dec c
    dec [hl]
    ld hl, $0012
    add hl, de
    ld [hl], $00
    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $2a
    add b
    call ClearObjectFields
    call Call_001_6663
    ld hl, $0014
    add hl, de
    ld [hl], $01
    jp Jump_000_30de


    call $6435
    ld a, [MOVE_RESULT]
    or a
    jp z, Jump_000_34d9

    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $2e
    add b
    call ClearObjectFields
    ld hl, $0014
    add hl, de

Call_000_34d4:
    ld [hl], $02
    jp Jump_000_30de


Jump_000_34d9:
    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jp nz, Jump_000_30de

    ld hl, $0012
    add hl, de
    ld a, [hl]
    cp $00
    jr z, jr_000_34f1

    inc a
    ld [hl], a
    jp Jump_000_30de


jr_000_34f1:
    ld [hl], $00
    ld a, $01
    ld [RENDER_REQUEST], a
    ld hl, $0003
    add hl, de
    ld a, [hl]
    add $01
    ld [hl], a
    ld hl, $0015
    add hl, de
    ld a, [hl]
    or a
    jp z, Jump_000_30de

    dec [hl]
    jp Jump_000_30de


    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jp nz, Jump_000_30de

    call Call_001_64a9
    ld a, [MOVE_RESULT]
    or a
    jr z, jr_000_3530

    ld a, $00
    ld [PROF_ACTION2], a
    ld a, $0c
    ld [PROF_ACTION1], a
    call ClearObjectSubfield
    jp Jump_000_30de


jr_000_3530:
    ld a, $00
    ld [PROF_ACTION2], a
    call ClearObjectSubfield
    jp Jump_000_30de


    ld hl, $0014
    add hl, de
    ld a, [hl]
    ld hl, $354f
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


    ld d, l
    dec [hl]
    ld a, c
    dec [hl]
    db $db
    dec [hl]
    ld hl, $0012
    add hl, de
    ld [hl], $00
    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $2c
    add b
    call ClearObjectFields
    call Call_001_6663
    ld hl, $0014
    add hl, de
    ld [hl], $01
    ld hl, $001b
    add hl, de
    ld [hl], $00
    jp Jump_000_30de


    call $6435
    ld a, [MOVE_RESULT]
    or a
    jp z, Jump_000_3598

    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $30
    add b
    call ClearObjectFields
    ld hl, $0014
    add hl, de
    ld [hl], $02
    jp Jump_000_30de


Jump_000_3598:
    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jp nz, Jump_000_30de

    ld hl, $001b
    add hl, de
    ld a, [hl]
    or a
    jr nz, jr_000_35b1

    ld a, $01
    ld [hl], a
    ld a, $19
    ldh [$ffa1], a

jr_000_35b1:
    ld hl, $0012
    add hl, de
    ld a, [hl]
    cp $00
    jr z, jr_000_35bf

    inc a
    ld [hl], a
    jp Jump_000_30de


jr_000_35bf:
    ld [hl], $00
    ld a, $01
    ld [RENDER_REQUEST], a
    ld hl, $0003
    add hl, de
    ld a, [hl]
    add $01
    ld [hl], a
    ld hl, $0015
    add hl, de
    ld a, [hl]
    or a
    jp z, Jump_000_30de

    dec [hl]
    jp Jump_000_30de


    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jp nz, Jump_000_30de

    call Call_001_64a9
    ld a, [MOVE_RESULT]
    or a
    jr z, jr_000_35fe

    ld a, $00
    ld [PROF_ACTION2], a
    ld a, $0c
    ld [PROF_ACTION1], a
    call ClearObjectSubfield
    jp Jump_000_30de


jr_000_35fe:
    ld a, $00
    ld [PROF_ACTION2], a
    call ClearObjectSubfield
    jp Jump_000_30de


    ld hl, $0014
    add hl, de
    ld a, [hl]
    ld hl, $361d
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


    inc hl
    ld [hl], $3b
    ld [hl], $aa
    ld [hl], $21
    ld de, $1900
    ld a, [hl]
    ld b, a
    ld a, $32
    add b
    call ClearObjectFields
    call Call_001_6663
    ld hl, $0014
    add hl, de
    ld [hl], $01
    jp Jump_000_30de


    ld a, [$c0a5]
    sub $35
    jp nc, Jump_000_30de

    call Call_001_653b
    ld a, [MOVE_RESULT]
    or a
    jp z, Jump_000_3658

    ld a, $0b
    ld [PROF_ACTION1], a
    call ClearObjectSubfield
    jp Jump_000_30de


Jump_000_3658:
    call Call_001_64c8
    ld a, [MOVE_RESULT]
    or a
    jr nz, jr_000_366c

    ld a, $00
    ld [PROF_ACTION3], a
    call ClearObjectSubfield
    jp Jump_000_30de


jr_000_366c:
    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jp nz, Jump_000_30de

    ld hl, $0003
    add hl, de
    ld a, [hl]
    sub $08
    ld [hl], a
    call Call_000_3d56
    call Call_001_64c8
    ld a, [MOVE_RESULT]
    or a
    jr z, jr_000_3695

    ld a, $08
    ld [PROF_ACTION3], a
    call ClearObjectSubfield
    jp Jump_000_30de


jr_000_3695:
    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $34
    add b
    call ClearObjectFields
    ld hl, $0014
    add hl, de
    ld [hl], $02
    jp Jump_000_30de


    ld a, [$c0a5]
    sub $35
    jp nc, Jump_000_30de

    call Call_001_653b
    ld a, [MOVE_RESULT]
    or a
    jp z, Jump_000_36c7

    ld a, $0b
    ld [PROF_ACTION1], a
    call ClearObjectSubfield
    jp Jump_000_30de


Jump_000_36c7:
    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jp nz, Jump_000_30de

    call Call_000_3d56
    call Call_001_64c8
    ld a, [MOVE_RESULT]
    or a
    jr z, jr_000_36e8

    ld a, $08
    ld [PROF_ACTION3], a
    call ClearObjectSubfield
    jp Jump_000_30de


jr_000_36e8:
    ld a, $00
    ld [PROF_ACTION3], a
    call ClearObjectSubfield
    jp Jump_000_30de


    ld hl, $0014
    add hl, de
    ld a, [hl]
    ld hl, $3707
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


    dec c
    scf
    dec h
    scf
    xor $37
    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $38
    add b
    call ClearObjectFields
    call Call_001_6663
    ld hl, $0014
    add hl, de
    ld [hl], $01
    jp Jump_000_30de


    ld a, [$c0a5]
    sub $35
    jp nc, Jump_000_30de

    call Call_001_653b
    ld a, [MOVE_RESULT]
    or a
    jp z, Jump_000_3742

    ld a, $0b
    ld [PROF_ACTION1], a
    call ClearObjectSubfield
    jp Jump_000_30de


Jump_000_3742:
    call Call_001_62bb
    ld a, [MOVE_RESULT]
    or a
    jp z, Jump_000_375f

    cp $02
    jr z, jr_000_3754

    ld a, $06
    jr jr_000_3756

jr_000_3754:
    ld a, $07

jr_000_3756:
    ld [PROF_ACTION2], a
    call ClearObjectSubfield
    jp Jump_000_30de


Jump_000_375f:
    call Call_001_64c8
    ld a, [MOVE_RESULT]
    or a
    jp z, Jump_000_377c

    ld a, $08
    ld [$c6d7], a
    ld hl, PROF_ACTION3
    ld a, h
    ld [$c6d8], a
    ld a, l
    ld [$c6d9], a
    jp Jump_000_37d9


Jump_000_377c:
    ld hl, $0011
    add hl, de
    ld a, [hl]
    push af
    ld [hl], $00
    call Call_001_61ae
    pop af
    ld hl, $0011
    add hl, de
    ld [hl], a
    ld a, [MOVE_RESULT]
    or a
    jp z, Jump_000_37ac

    ld hl, $0011
    add hl, de
    ld a, [hl]
    push af
    ld [hl], $01
    call Call_001_61ae
    pop af
    ld hl, $0011
    add hl, de
    ld [hl], a
    ld a, [MOVE_RESULT]
    or a
    jp nz, Jump_000_37bf

Jump_000_37ac:
    ld a, $00
    ld [$c6d7], a
    ld hl, PROF_ACTION3
    ld a, h
    ld [$c6d8], a
    ld a, l
    ld [$c6d9], a
    jp Jump_000_37d9


Jump_000_37bf:
    call Call_001_6229
    ld a, [MOVE_RESULT]
    or a
    jp z, Jump_000_30de

    ld a, $0a
    ld [$c6d7], a
    ld hl, PROF_ACTION3
    ld a, h
    ld [$c6d8], a
    ld a, l
    ld [$c6d9], a

Jump_000_37d9:
    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $3a
    add b
    call ClearObjectFields
    ld hl, $0014
    add hl, de
    ld [hl], $02
    jp Jump_000_30de


    ld a, [$c0a5]
    sub $35
    jp nc, Jump_000_30de

    call Call_001_653b
    ld a, [MOVE_RESULT]
    or a
    jp z, Jump_000_380b

    ld a, $0b
    ld [PROF_ACTION1], a
    call ClearObjectSubfield
    jp Jump_000_30de


Jump_000_380b:
    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jp nz, Jump_000_30de

    ld hl, $c6d8
    ld a, [hl+]
    ld l, [hl]
    ld h, a
    ld a, [$c6d7]
    ld [hl], a
    call ClearObjectSubfield
    jp Jump_000_30de


    ld hl, $0014
    add hl, de
    ld a, [hl]
    ld hl, $3839
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


    dec a
    jr c, @+$57

    jr c, @+$23

    ld de, $1900
    ld a, [hl]
    ld b, a
    ld a, $3c
    add b
    call ClearObjectFields
    call Call_001_6663
    ld hl, $0014
    add hl, de
    ld [hl], $01
    jp Jump_000_30de


    ld a, [$c0a5]
    sub $35
    jp nc, Jump_000_30de

    call Call_001_653b
    ld a, [MOVE_RESULT]
    or a
    jp z, Jump_000_3872

    ld a, $0b
    ld [PROF_ACTION1], a
    call ClearObjectSubfield
    jp Jump_000_30de


Jump_000_3872:
    call Call_001_62bb
    ld a, [MOVE_RESULT]
    or a
    jp z, Jump_000_388f

    cp $02
    jr z, jr_000_3884

    ld a, $06
    jr jr_000_3886

jr_000_3884:
    ld a, $07

jr_000_3886:
    ld [PROF_ACTION2], a
    call ClearObjectSubfield
    jp Jump_000_30de


Jump_000_388f:
    call Call_001_64c8
    ld a, [MOVE_RESULT]
    or a
    jp z, Jump_000_38a4

    ld a, $08
    ld [PROF_ACTION3], a
    call ClearObjectSubfield
    jp Jump_000_30de


Jump_000_38a4:
    ld hl, $0011
    add hl, de
    ld a, [hl]
    push af
    ld [hl], $00
    call Call_001_61ae
    pop af
    ld hl, $0011
    add hl, de
    ld [hl], a
    ld a, [MOVE_RESULT]
    or a
    jp z, Jump_000_38d4

    ld hl, $0011
    add hl, de
    ld a, [hl]
    push af
    ld [hl], $01
    call Call_001_61ae
    pop af
    ld hl, $0011
    add hl, de
    ld [hl], a
    ld a, [MOVE_RESULT]
    or a
    jp nz, Jump_000_38df

Jump_000_38d4:
    ld a, $00
    ld [PROF_ACTION3], a
    call ClearObjectSubfield
    jp Jump_000_30de


Jump_000_38df:
    call $6272
    ld a, [MOVE_RESULT]
    or a
    jp z, Jump_000_30de

    ld a, $09
    ld [PROF_ACTION3], a
    call ClearObjectSubfield
    jp Jump_000_30de


    ld hl, $0014
    add hl, de
    ld a, [hl]
    ld hl, $3908
    ld b, $00
    ld c, a

Call_000_38ff:
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


    db $10
    add hl, sp
    ld d, a
    add hl, sp
    add l
    add hl, sp
    cp c
    add hl, sp
    ld a, $01
    call GBC_RoundEndPieceErase ; was: ld [$c73d], a (also stops the piece engine)
    ld a, $02
    ld [SOUND_CONTROL], a
    ld a, $01
    ld [$c6da], a
    ld a, $c4
    ld [$d62d], a
    ld [$c7d6], a
    ld a, [$c5a8]
    cp $02
    jp z, Jump_000_30de

    ld a, $05
    ldh [$ffa1], a
    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $3e
    add b
    call ClearObjectFields
    ld hl, $0012
    add hl, de
    ld [hl], $00
    ld hl, $c120
    call Call_001_5453
    ld hl, $0014
    add hl, de
    ld [hl], $01
    call Call_001_6663
    jp Jump_000_30de


    ld a, $01
    ld [RENDER_REQUEST], a
    ld hl, $0012
    add hl, de
    ld a, [hl]
    cp $08
    jr z, jr_000_3972

    inc a
    ld [hl], a
    ld hl, $0003
    add hl, de
    ld a, [hl]
    sub $02
    ld [hl], a
    jp Jump_000_30de


jr_000_3972:
    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jp nz, Jump_000_30de

    ld hl, $0014
    add hl, de
    ld [hl], $02
    jp Jump_000_30de


    ld a, $01
    ld [RENDER_REQUEST], a
    ld hl, $0012
    add hl, de
    ld a, [hl]
    cp $00
    jr z, jr_000_39a0

    dec a
    ld [hl], a
    ld hl, $0003
    add hl, de
    ld a, [hl]
    add $02
    ld [hl], a
    jp Jump_000_30de


jr_000_39a0:
    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $40
    add b
    call ClearObjectFields
    ld hl, $0014
    add hl, de
    ld [hl], $03
    ld a, $15
    ldh [$ffa1], a
    jp Jump_000_30de


    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jp nz, Jump_000_30de

    ld a, $01
    ld [$c0bc], a
    jp Jump_000_30de


    ld hl, $0014
    add hl, de
    ld a, [hl]
    ld hl, $39df
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


    pop af
    add hl, sp
    inc sp
    ld a, [hl-]
    ld a, e
    ld a, [hl-]
    or b
    ld a, [hl-]
    ret c

    ld a, [hl-]
    cpl
    dec sp
    ld l, c
    dec sp
    ld b, $3c
    dec e
    inc a
    ld a, $01
    call GBC_RoundEndPieceErase ; was: ld [$c73d], a (also stops the piece engine)
    ld a, $02
    ld [$c6da], a
    ld a, $c8
    ld [$d62d], a
    ld [$c7d6], a
    ld a, [$c5a8]
    cp $02
    jp z, Jump_000_30de

    ld a, $14
    ldh [$ffa0], a
    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $42
    add b
    call ClearObjectFields
    ld hl, $c120
    call Call_001_5453
    ld hl, $0014
    add hl, de
    ld [hl], $01
    call Call_001_6663
    ld hl, $0016
    add hl, de
    ld [hl], $00
    jp Jump_000_30de


    ld hl, $0016
    add hl, de
    ld a, [hl]
    or a
    jr nz, jr_000_3a48

    ld [hl], $01
    ld a, [$c734]
    cp $01
    jp z, Jump_000_3a48

    call Call_000_3d79

Jump_000_3a48:
jr_000_3a48:
    ld a, $01
    ld [RENDER_REQUEST], a
    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jp nz, Jump_000_30de

    ld a, [$c734]
    cp $01
    jr nz, jr_000_3a66

    ld a, $01
    ld [$c0bc], a
    jp Jump_000_30de


jr_000_3a66:
    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a

Call_000_3a6c:
    ld a, $48
    add b
    call ClearObjectFields
    ld hl, $0014
    add hl, de
    ld [hl], $02
    jp Jump_000_30de


    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jp nz, Jump_000_30de

    ld a, [$c5ed]
    add $08
    ld [$c5ed], a
    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $44
    add b
    call ClearObjectFields
    ld a, $02
    rst $10
    ld a, [$c5a8]
    cp $01
    call z, $4464
    ld a, $01
    rst $18
    ld hl, $0014
    add hl, de
    ld [hl], $03
    jp Jump_000_30de


    ld a, $01
    ld [RENDER_REQUEST], a
    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jp nz, Jump_000_30de

    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $46
    add b
    call ClearObjectFields
    ld hl, $0014
    add hl, de
    ld [hl], $04
    ld a, $19
    ldh [$ffa1], a
    jp Jump_000_30de


    ld a, [$c5ac]
    and $01
    jp nz, Jump_000_30de

    ld a, $01
    ld [RENDER_REQUEST], a
    ld a, [$c1c0]
    or a
    jr z, jr_000_3af2

    ld a, [$c1c3]
    dec a
    ld [$c1c3], a

Jump_000_3af2:
jr_000_3af2:
    ld a, [$c5ed]
    add $01
    ld [$c5ed], a
    cp $18
    jr nz, jr_000_3b0d

    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $4c
    add b
    call ClearObjectFields
    jp Jump_000_30de


jr_000_3b0d:
    cp $30
    jp nz, Jump_000_30de

    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $4a
    add b
    call ClearObjectFields
    ld hl, $0014
    add hl, de
    ld [hl], $05
    ld a, $1a
    ldh [$ffa1], a
    ld a, $04
    ldh [$ffa0], a
    jp Jump_000_30de


    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jp nz, Jump_000_30de

    ld hl, $0012
    add hl, de
    ld [hl], $00
    ld hl, $0002
    add hl, de
    ld a, [hl]
    sub $30
    jr c, jr_000_3b55

    ld hl, $0011
    add hl, de
    ld [hl], $00
    ld a, $4e
    call ClearObjectFields
    jr jr_000_3b60

jr_000_3b55:
    ld hl, $0011
    add hl, de
    ld [hl], $01
    ld a, $4f
    call ClearObjectFields

jr_000_3b60:
    ld hl, $0014
    add hl, de
    ld [hl], $06
    jp Jump_000_30de


    ld hl, $0002
    add hl, de
    ld a, [hl]
    sub $30
    jp z, Jump_000_3bd1

    ldh a, [$ff8c]
    and $01
    jr z, jr_000_3b96

    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $51
    add b
    ld hl, $0007
    add hl, de
    ld [hl], a
    ld hl, $0012
    add hl, de
    ld a, [hl]
    sub $01
    jr nc, jr_000_3bb3

    ld a, [hl]
    inc a
    ld [hl], a
    jp Jump_000_30de


jr_000_3b96:
    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $4e
    add b
    ld hl, $0007
    add hl, de
    ld [hl], a
    ld hl, $0012
    add hl, de
    ld a, [hl]
    sub $05
    jr nc, jr_000_3bb3

    ld a, [hl]
    inc a
    ld [hl], a
    jp Jump_000_30de


jr_000_3bb3:
    ld [hl], $00
    ld a, $01
    ld [RENDER_REQUEST], a
    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, $01
    or a
    jp nz, Jump_000_3bc7

    ld b, $ff

Jump_000_3bc7:
    ld hl, $0002
    add hl, de
    ld a, [hl]
    add b
    ld [hl], a
    jp Jump_000_30de


Jump_000_3bd1:
    ld a, [$c1c0]
    or a
    jr z, jr_000_3bf4

    ld a, $02
    rst $10
    call $44bd
    ld a, $01
    rst $18
    ld a, $5b
    call ClearObjectFields
    ld hl, $001b
    add hl, de
    ld [hl], $00
    ld hl, $0014
    add hl, de
    ld [hl], $08
    jp Jump_000_30de


jr_000_3bf4:
    ld a, $11
    ldh [$ffa1], a
    ld a, $50
    call ClearObjectFields
    ld hl, $0014
    add hl, de
    ld [hl], $07
    jp Jump_000_30de


    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jp nz, Jump_000_30de

    ld h, d
    ld l, e
    call Call_001_5453
    ld a, $02
    ld [$c0bc], a
    jp Jump_000_30de


    ld a, $01
    ld [RENDER_REQUEST], a
    ldh a, [$ff8c]
    and $01
    jr nz, jr_000_3c47

    ld hl, $0007
    add hl, de
    ld a, $5b
    ld [hl], a
    ld hl, $001b
    add hl, de
    ld a, [hl]
    inc a
    ld [hl], a
    and $03
    jr nz, jr_000_3c64

    ld a, [$c223]
    cp $80
    jr z, jr_000_3c64

    dec a
    ld [$c223], a
    jr jr_000_3c64

jr_000_3c47:
    ld hl, $0007
    add hl, de
    ld a, $5c
    ld [hl], a
    ld hl, $001b
    add hl, de
    ld a, [hl]
    inc a
    ld [hl], a
    and $01
    jr nz, jr_000_3c64

    ld a, [$c223]
    cp $80
    jr z, jr_000_3c64

    dec a
    ld [$c223], a

jr_000_3c64:
    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jp nz, Jump_000_30de

    ld hl, $c1c0
    call Call_001_5453
    ld hl, $c220
    call Call_001_5453
    ld a, $50
    call ClearObjectFields
    ld hl, $0014
    add hl, de
    ld [hl], $07
    jp Jump_000_30de


Call_000_3c88:
    ld a, $09
    rst $10
    ld a, [$c5a8]
    cp $02
    jp z, Jump_000_3cbb

    ld a, [$c5a8]
    cp $03
    jp z, Jump_000_3ccd

    ld a, [$c6db]
    ld b, $00
    ld c, a
    sla c
    rl b
    ld hl, $5e1e
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [$c6dc]
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    jp Jump_000_3cd4


Jump_000_3cbb:
    ld a, [$c5c4]
    ld b, $00
    ld c, a
    sla c
    rl b
    ld hl, $6261
    add hl, bc
    ld a, [hl+]
    jp Jump_000_3cd4


Jump_000_3ccd:
    ld hl, $c688
    ld a, [hl+]
    jp Jump_000_3cd4


Jump_000_3cd4:
    push hl
    ld b, $00
    ld c, a
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    ld hl, $0010
    add hl, bc
    ld a, l
    ld hl, $0002
    add hl, de
    ld [hl], a
    pop hl
    ld a, [hl]
    ld b, $00

Call_000_3cf2:
    ld c, a
    sla c
    rl b
    sla c
    rl b
    sla c
    rl b
    ld hl, $0020
    add hl, bc
    ld a, l
    ld hl, $0003
    add hl, de
    ld [hl], a
    ld a, $01
    rst $18
    ret


Call_000_3d0d:
    ld a, $09
    rst $10
    ld a, [$c5a8]
    cp $02
    jp z, Jump_000_3d3c

    ld a, [$c5a8]
    cp $03
    jp z, Jump_000_3d4a

    ld a, [$c6db]
    ld b, $00
    ld c, a
    sla c
    rl b
    ld hl, $5ef0
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [$c6dc]
    ld b, $00
    ld c, a
    add hl, bc
    ld a, [hl+]
    jp Jump_000_3d4d


Jump_000_3d3c:
    ld a, [$c5c4]
    ld b, $00
    ld c, a
    ld hl, $6275
    add hl, bc
    ld a, [hl]
    jp Jump_000_3d4d


Jump_000_3d4a:
    ld a, [$c68a]

Jump_000_3d4d:
    ld hl, $0011
    add hl, de
    ld [hl], a
    ld a, $01
    rst $18
    ret


Call_000_3d56:
    ld hl, $0002
    add hl, de
    ld a, [hl]
    ldh [$ff8f], a
    ld hl, $0003
    add hl, de
    ld a, [hl]
    dec a
    ldh [$ff8e], a
    push de
    call Call_000_19bb
    pop de
    ld a, h
    and $0f
    sub $08
    or $d0
    ld [$c6cd], a
    ld a, l
    ld [$c6ce], a
    ret


Call_000_3d79:
    push hl
    push de
    push bc
    ld b, $01
    ld c, $09
    ld e, $70
    call RenderTilemapCell
    ld hl, $0000
    ld b, $14
    ld c, $12
    call QueueTextDraw
    ld hl, $c601
    ld de, $c605
    ld c, $02

jr_000_3d97:
    ld a, [hl+]
    ld b, a
    ld a, [de]
    sub b
    jr c, jr_000_3db3

    cp $00
    jr nz, jr_000_3da5

    inc de
    dec c
    jr nz, jr_000_3d97

jr_000_3da5:
    ld hl, $d121
    ld b, $0a
    ld a, $00

jr_000_3dac:
    ld [hl+], a
    dec b
    jr nz, jr_000_3dac

    jp Jump_000_3dc1


jr_000_3db3:
    ld hl, $c601
    ld de, $c605
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    call Call_001_5c08

Jump_000_3dc1:
    ld hl, $d182
    ld de, $d20e
    ld b, $05

jr_000_3dc9:
    ld a, [de]
    ld [hl+], a
    inc de
    dec b
    jr nz, jr_000_3dc9

    ld a, [$c72e]
    sub $02
    jr c, jr_000_3e00

    or a
    jr nz, jr_000_3de0

    ld a, [$c72f]
    sub $58
    jr c, jr_000_3e00

jr_000_3de0:
    ld hl, $d1c2
    ld [hl], $98
    inc hl
    ld [hl], $99
    inc hl
    ld [hl], $00
    inc hl
    ld [hl], $8c
    inc hl
    ld [hl], $99
    inc hl
    ld [hl], $98
    inc hl
    ld [hl], $9f
    inc hl
    ld [hl], $9d
    inc hl
    ld [hl], $00
    jp Jump_000_3e7c


jr_000_3e00:
    ld a, [$c72e]
    or a
    jp nz, Jump_000_3e3d

    ld a, [$c72f]
    sub $64
    jp c, Jump_000_3e13

    or a
    jp nz, Jump_000_3e3d

Jump_000_3e13:
    ld hl, $d1c2
    ld a, $83
    ld [hl], a
    inc hl
    ld a, $81
    ld [hl], a
    inc hl
    ld a, $81
    ld [hl], a
    inc hl
    ld a, $81
    ld [hl], a
    inc hl
    ld a, $81
    ld [hl], a
    ld hl, $c5fd
    ld [hl], $00
    inc hl
    ld [hl], $02
    inc hl
    ld [hl], $00
    inc hl
    ld [hl], $00
    call Call_001_5ac2
    jp Jump_000_3e7c


Jump_000_3e3d:
    ld hl, $c730
    ld [hl], $00
    inc hl
    ld [hl], $02
    inc hl
    ld [hl], $00
    inc hl
    ld [hl], $00
    ld hl, $c5fd
    ld [hl], $00
    inc hl
    ld [hl], $02
    inc hl
    ld [hl], $00
    inc hl
    ld [hl], $00
    ld a, [$c72f]
    sub $64
    ld c, a
    ld a, [$c72e]
    sbc $00
    ld b, a

jr_000_3e65:
    ld hl, $c730
    call Call_000_3e80
    ld hl, $c5fd
    call Call_000_3e80
    dec bc
    ld a, b
    or c
    jr nz, jr_000_3e65

    call Call_000_3ea6
    call Call_001_5ac2

Jump_000_3e7c:
    pop bc
    pop de
    pop hl
    ret


Call_000_3e80:
    push hl
    push de
    push bc
    ld bc, $0003
    add hl, bc
    ld a, [hl]
    ld b, $40
    sub b
    daa
    ld [hl], a
    dec hl
    ld a, [hl]
    ld b, $00
    sbc b
    daa
    ld [hl], a
    dec hl
    ld a, [hl]
    ld b, $00
    sbc b
    daa
    ld [hl], a
    dec hl
    ld a, [hl]
    ld b, $00
    sbc b
    daa
    ld [hl], a
    pop bc
    pop de
    pop hl
    ret


Call_000_3ea6:
    push hl
    push de
    push bc
    ld hl, $c731
    ld de, $d1c1
    ld b, $03
    ld c, $00

Jump_000_3eb3:
    ld a, [hl]
    swap a
    and $0f
    or a
    jr z, jr_000_3ec2

    ld c, $01
    add $81
    ld [de], a
    jr jr_000_3ec9

jr_000_3ec2:
    ld a, c
    or a
    jr z, jr_000_3ec9

    ld a, $81
    ld [de], a

jr_000_3ec9:
    inc de
    ld a, [hl]
    and $0f
    or a
    jr z, jr_000_3ed7

    ld c, $01
    add $81
    ld [de], a
    jr jr_000_3ede

jr_000_3ed7:
    ld a, c
    or a
    jr z, jr_000_3ede

    ld a, $81
    ld [de], a

jr_000_3ede:
    inc hl
    inc de
    dec b
    jp nz, Jump_000_3eb3

    pop bc
    pop de
    pop hl
    ret


