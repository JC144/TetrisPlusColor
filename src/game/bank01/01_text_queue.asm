; ============================================================================
; bank01/01_text_queue.asm — $541a-$681e: text/tile queue machinery
; Part of SECTION "ROM Bank $001"; included in order by bank01_game_logic.asm.
; ============================================================================
ASSERT @ == $541a ; QueueTextDraw
QueueTextDraw:
    ld a, [$c5da]
    cp $04
    ret z

    push hl
    ld hl, $c5ca
    ld d, $00
    ld e, a
    sla e
    sla e
    add hl, de
    ld d, h
    ld e, l
    pop hl
    ld a, h
    ld [de], a
    inc de
    ld a, l
    ld [de], a
    inc de
    ld a, b
    ld [de], a
    inc de
    ld a, c
    ld [de], a
    ld a, [$c5da]
    inc a
    ld [$c5da], a
    ld a, [$c5c8]
    or $04
    ld [$c5c8], a
    ret


Call_001_544a:
    push af

jr_001_544b:
    ldh a, [rSTAT]
    and $03
    jr nz, jr_001_544b

    pop af
    ret


Call_001_5453:
    ld b, $20
    ld a, $00

jr_001_5457:
    ld [hl+], a
    dec b
    jr nz, jr_001_5457

    ld a, $01
    ld [RENDER_REQUEST], a
    ret


Call_001_5461:
    ld b, $0f

Jump_001_5463:
    ld hl, $0000
    add hl, de
    ld a, [hl]
    or a
    jr nz, jr_001_5472

    ld hl, $0005
    add hl, de
    ld a, [hl]
    or a
    ret z

jr_001_5472:
    ld h, d
    ld l, e
    ld de, $0020
    add hl, de
    ld d, h
    ld e, l
    dec b
    jp nz, Jump_001_5463

    ret


Call_001_547f:
    ld a, [$c64a]
    or a
    jp nz, Jump_001_550a

    ldh a, [$ff8d]
    and $08
    jp z, Jump_001_5562

    ld a, [$c73d]
    or a
    jr z, jr_001_5495

    xor a
    ret


jr_001_5495:
    ld a, $01
    ld [$cb90], a
    ld hl, $d001
    ld de, $d800
    ld b, $0a
    ld c, $11

jr_001_54a4:
    push hl

jr_001_54a5:
    ld a, [hl]
    ld [de], a
    ld [hl], $00
    inc de
    inc hl
    dec b
    jr nz, jr_001_54a5

    pop hl
    push bc
    ld bc, $0020
    add hl, bc
    pop bc
    ld b, $0a
    dec c
    jr nz, jr_001_54a4

    ld hl, $c0a0
    ld b, $19

jr_001_54bf:
    ld a, [hl]
    and $01
    jr z, jr_001_54ca

    ld a, [hl]
    and $fe
    or $02
    ld [hl], a

jr_001_54ca:
    ld de, $0020
    add hl, de
    dec b
    jr nz, jr_001_54bf

    ld e, $11
    ld a, [$c5a8]
    cp $00
    jr z, jr_001_54e9

    ld e, $0e
    cp $03
    jr z, jr_001_54e9

    ld a, [$a459]
    cp $1f
    jr nz, jr_001_54e9

    ld e, $0f

jr_001_54e9:
    ld b, $01
    ld c, $06
    call Call_001_5f03
    ld h, $00
    ld l, $01
    ld b, $0a
    ld c, $12
    call Call_001_5e20
    ld a, $01
    ld [RENDER_REQUEST], a
    ld [$c64a], a
    xor a
    ld [$c73e], a
    jp Jump_001_5562


Jump_001_550a:
    call Call_001_5566
    or a
    jp z, Jump_001_5562

    xor a
    ld [$cb90], a
    ld hl, $d001
    ld de, $d800
    ld b, $0a
    ld c, $11

jr_001_551f:
    push hl

jr_001_5520:
    ld a, [de]
    ld [hl], a
    ld a, $00
    ld [de], a
    inc de
    inc hl
    dec b
    jr nz, jr_001_5520

    pop hl
    push bc
    ld bc, $0020
    add hl, bc
    pop bc
    ld b, $0a
    dec c
    jr nz, jr_001_551f

    ld hl, $c0a0
    ld b, $19

jr_001_553b:
    ld a, [hl]
    and $02
    jr z, jr_001_5546

    ld a, [hl]
    and $fd
    or $01
    ld [hl], a

jr_001_5546:
    ld de, $0020
    add hl, de
    dec b
    jr nz, jr_001_553b

    ld h, $00
    ld l, $01
    ld b, $0a
    ld c, $12
    call Call_001_5e20
    ld a, $01
    ld [RENDER_REQUEST], a
    ld a, $00
    ld [$c64a], a

Jump_001_5562:
    ld a, [$c64a]
    ret


Call_001_5566:
    ld a, [$c5a8]
    cp $00
    jr nz, jr_001_5572

    call GBC_PauseMenuValidate  ; was: ldh a, [$ff8d] / and $08 (iso-size)
    nop
    ret


jr_001_5572:
    ld a, [$c73e]
    cp $02
    jp z, Jump_001_55fe

    ld hl, $d101
    ld a, [$c73e]
    sla a
    sla a
    sla a
    sla a
    sla a
    sla a
    ld b, $00
    ld c, a
    add hl, bc
    ld [hl], $00
    ldh a, [$ff8d]
    and $c0
    jr z, jr_001_55a1

    ld a, [$c73e]
    inc a
    and $01
    ld [$c73e], a

jr_001_55a1:
    ld hl, $d101
    ld a, [$c73e]
    sla a
    sla a
    sla a
    sla a
    sla a
    sla a
    ld b, $00
    ld c, a
    add hl, bc
    ld [hl], $f4
    ld h, $01
    ld l, $01
    ld b, $01
    ld c, $03
    call Call_001_5e20
    ld a, [$c5a8]
    cp $01
    jp nz, Jump_001_55db

    ld a, [$a459]
    cp $1f
    jp nz, Jump_001_55db

    ldh a, [$ff8d]
    and $02
    jp nz, Jump_001_55fe

Jump_001_55db:
    call GBC_PauseMenuValidate  ; was: ldh a, [$ff8d] / and $08 (iso-size)
    nop
    ret z

    ld a, [$c73e]
    cp $00
    jr nz, jr_001_55ea

    ld a, $01
    ret


jr_001_55ea:
    ld hl, $c1a0
    call Call_001_5453
    ld a, $0b
    ld [PROF_ACTION1], a
    ld de, $c100
    call ClearObjectSubfield
    ld a, $01
    ret


Jump_001_55fe:
    ld a, [$c73e]
    cp $02
    jp z, Jump_001_563d

    ld e, $10
    ld b, $01
    ld c, $06
    call Call_001_5f03
    ld h, $00
    ld l, $01
    ld b, $0a
    ld c, $12
    call Call_001_5e20
    ld a, $01
    ld [$c180], a
    ld a, $28
    ld [$c182], a
    ld a, $60
    ld [$c183], a
    ld a, $be
    ld [$c184], a
    ld a, $01
    ld [RENDER_REQUEST], a
    ld a, $02
    ld [$c73e], a
    xor a
    ld [$c73f], a
    ret


Jump_001_563d:
    ldh a, [$ff8d]
    and $20
    jr nz, jr_001_5655

    ldh a, [$ff8c]
    and $20
    jr z, jr_001_566d

    ld a, [$c740]
    inc a
    ld [$c740], a
    and $07
    jp nz, Jump_001_56f0

jr_001_5655:
    xor a
    ld [$c740], a
    ld a, [$c73f]
    dec a
    ld [$c73f], a
    cp $ff
    jp nz, Jump_001_56f0

    ld a, $63
    ld [$c73f], a
    jp Jump_001_56f0


jr_001_566d:
    ldh a, [$ff8d]
    and $10
    jr nz, jr_001_5684

    ldh a, [$ff8c]
    and $10
    jr z, jr_001_5699

    ld a, [$c740]
    inc a
    ld [$c740], a
    and $07
    jr nz, jr_001_56f0

jr_001_5684:
    xor a
    ld [$c740], a
    ld a, [$c73f]
    inc a
    ld [$c73f], a
    cp $64
    jr nz, jr_001_56f0

    xor a
    ld [$c73f], a
    jr jr_001_56f0

jr_001_5699:
    ldh a, [$ff8d]
    and $40
    jr nz, jr_001_56b0

    ldh a, [$ff8c]
    and $40
    jr z, jr_001_56c6

    ld a, [$c740]
    inc a
    ld [$c740], a
    and $07
    jr nz, jr_001_56f0

jr_001_56b0:
    xor a
    ld [$c740], a
    ld a, [$c73f]
    add $0a
    ld [$c73f], a
    sub $64
    jr c, jr_001_56f0

    xor a
    ld [$c73f], a
    jr jr_001_56f0

jr_001_56c6:
    ldh a, [$ff8d]
    and $80
    jr nz, jr_001_56dd

    ldh a, [$ff8c]
    and $80
    jr z, jr_001_56f0

    ld a, [$c740]
    inc a
    ld [$c740], a
    and $07
    jr nz, jr_001_56f0

jr_001_56dd:
    xor a
    ld [$c740], a
    ld a, [$c73f]
    sub $0a
    ld [$c73f], a
    jr nc, jr_001_56f0

    ld a, $63
    ld [$c73f], a

Jump_001_56f0:
jr_001_56f0:
    ld a, [$c73f]
    inc a
    ld b, $64
    ld c, $00

jr_001_56f8:
    ld d, a
    sub b
    jr c, jr_001_56ff

    inc c
    jr jr_001_56f8

jr_001_56ff:
    ld a, c
    add $81
    ld [$d145], a
    ld a, d
    ld b, $0a
    ld c, $00

jr_001_570a:
    ld d, a
    sub b
    jr c, jr_001_5711

    inc c
    jr jr_001_570a

jr_001_5711:
    ld a, c
    add $81
    ld [$d146], a
    ld a, d
    ld b, $01
    ld c, $00

jr_001_571c:
    ld d, a
    sub b
    jr c, jr_001_5723

    inc c
    jr jr_001_571c

jr_001_5723:
    ld a, c
    add $81
    ld [$d147], a
    ld h, $01
    ld l, $45
    ld b, $03
    ld c, $01
    call Call_001_5e20
    ldh a, [$ff8d]
    and $02
    jr z, jr_001_5762

    xor a
    ld [$c73e], a
    ld [$c740], a
    ld hl, $c180
    call Call_001_5453
    ld a, $01
    ld [RENDER_REQUEST], a
    ld e, $0f
    ld b, $01
    ld c, $06
    call Call_001_5f03
    ld h, $00
    ld l, $01
    ld b, $0a
    ld c, $12
    call Call_001_5e20
    xor a
    ret


jr_001_5762:
    ldh a, [$ff8d]
    and $08
    ret z

    xor a
    ld [$cb90], a
    ld a, [$c73f]
    ld [$c5c4], a
    ld hl, $57fa
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld [$c6db], a
    ld a, [hl]
    ld [$c6dc], a
    ld hl, $d001
    ld c, $11

jr_001_5789:
    push hl
    ld b, $0a

jr_001_578c:
    xor a
    ld [hl+], a
    dec b
    jr nz, jr_001_578c

    pop hl
    push bc
    ld bc, $0020
    add hl, bc
    pop bc
    dec c
    jr nz, jr_001_5789

    ld h, $00
    ld l, $01
    ld b, $0a
    ld c, $11
    call Call_001_5e20
    ld hl, $c5fd
    xor a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    call Call_001_5ac2
    ld a, $02
    ld [SCREEN_SUBSTATE], a
    ld hl, $c180
    call Call_001_5453
    ld hl, $d02d
    ld c, $04

jr_001_57c1:
    ld b, $04
    push hl

jr_001_57c4:
    ld a, $00
    ld [hl+], a
    dec b
    jr nz, jr_001_57c4

    pop hl
    ld de, $0020
    add hl, de
    dec c
    jr nz, jr_001_57c1

    ld hl, $d071
    ld c, $02

jr_001_57d7:
    ld b, $02
    push hl

jr_001_57da:
    ld a, $00
    ld [hl+], a
    dec b
    jr nz, jr_001_57da

    pop hl
    ld de, $0020
    add hl, de
    dec c
    jr nz, jr_001_57d7

    ld h, $00
    ld l, $2d
    ld b, $06
    ld c, $04
    call Call_001_5e20
    ld a, $01
    ld [RENDER_REQUEST], a
    xor a
    ret


    nop
    nop
    nop
    ld bc, $0200
    nop
    inc bc
    nop
    inc b
    nop
    dec b
    nop
    ld b, $00
    rlca
    nop
    ld [$0900], sp
    nop
    ld a, [bc]
    nop
    dec bc
    nop
    inc c
    nop
    dec c
    nop
    ld c, $00
    rrca
    nop
    stop
    ld de, $1200
    nop
    inc de
    ld bc, $0100
    ld bc, $0201
    ld bc, $0103
    inc b
    ld bc, $0105
    ld b, $01
    rlca
    ld bc, $0108
    add hl, bc
    ld bc, $010a
    dec bc
    ld bc, $010c
    dec c
    ld bc, $010e
    rrca
    ld bc, $0110
    ld de, $1201
    ld bc, $0213
    nop
    ld [bc], a
    ld bc, $0202
    ld [bc], a
    inc bc
    ld [bc], a
    inc b
    ld [bc], a
    dec b
    ld [bc], a
    ld b, $02
    rlca
    ld [bc], a
    ld [$0902], sp
    ld [bc], a
    ld a, [bc]
    ld [bc], a
    dec bc
    ld [bc], a
    inc c
    ld [bc], a
    dec c
    ld [bc], a
    ld c, $02
    rrca
    ld [bc], a
    db $10
    ld [bc], a
    ld de, $1202
    ld [bc], a
    inc de
    inc bc
    nop
    inc bc
    ld bc, $0203
    inc bc
    inc bc
    inc bc
    inc b
    inc bc
    dec b
    inc bc
    ld b, $03
    rlca
    inc bc
    ld [$0903], sp
    inc bc
    ld a, [bc]
    inc bc
    dec bc
    inc bc
    inc c
    inc bc
    dec c
    inc bc
    ld c, $03
    rrca
    inc bc
    db $10
    inc bc
    ld de, $1203
    inc bc
    inc de
    inc b
    nop
    inc b
    ld bc, $0204
    inc b
    inc bc
    inc b
    inc b
    inc b
    dec b
    inc b
    ld b, $04
    rlca
    inc b
    ld [$0904], sp
    inc b
    ld a, [bc]
    inc b
    dec bc
    inc b
    inc c
    inc b
    dec c
    inc b
    ld c, $04
    rrca
    inc b
    db $10
    inc b
    ld de, $1204
    inc b
    inc de
    ld a, [$c64a]
    or a
    jp nz, Jump_001_5938

    ld a, [GAME_MODE]
    and $d0
    cp $d0
    jr nz, jr_001_58d5

    jp Jump_001_58df


jr_001_58d5:
    ldh a, [$ff8d]
    and $08
    ret z

    ld a, $d0
    ld [$d62d], a

Jump_001_58df:
    ld a, $01
    ld [$cb90], a
    ld hl, $d001
    ld de, $d800
    ld b, $0a
    ld c, $11

jr_001_58ee:
    push hl

jr_001_58ef:
    ld a, [hl]
    ld [de], a
    ld [hl], $00
    inc de
    inc hl
    dec b
    jr nz, jr_001_58ef

    pop hl
    push bc
    ld bc, $0020
    add hl, bc
    pop bc
    ld b, $0a
    dec c
    jr nz, jr_001_58ee

    ld hl, $c0a0
    ld b, $19

jr_001_5909:
    ld a, [hl]
    and $01
    jr z, jr_001_5914

    ld a, [hl]
    and $fe
    or $02
    ld [hl], a

jr_001_5914:
    ld de, $0020
    add hl, de
    dec b
    jr nz, jr_001_5909

    ld b, $01
    ld c, $06
    ld e, $11
    call Call_001_5f03
    ld h, $00
    ld l, $01
    ld b, $0a
    ld c, $11
    call Call_001_5e20
    ld a, $01
    ld [RENDER_REQUEST], a
    ld [$c64a], a
    ret


Jump_001_5938:
    ld a, [GAME_MODE]
    and $d0
    cp $d0
    jr z, jr_001_594b

    ldh a, [$ff8d]
    and $08
    ret z

    ld a, $d0
    ld [$d62d], a

jr_001_594b:
    xor a
    ld [$cb90], a
    ld hl, $d001
    ld de, $d800
    ld b, $0a
    ld c, $11

jr_001_5959:
    push hl

jr_001_595a:
    ld a, [de]
    ld [hl], a
    ld a, $00
    ld [de], a
    inc de
    inc hl
    dec b
    jr nz, jr_001_595a

    pop hl
    push bc
    ld bc, $0020
    add hl, bc
    pop bc
    ld b, $0a
    dec c
    jr nz, jr_001_5959

    ld hl, $c0a0
    ld b, $19

jr_001_5975:
    ld a, [hl]
    and $02
    jr z, jr_001_5980

    ld a, [hl]
    and $fd
    or $01
    ld [hl], a

jr_001_5980:
    ld de, $0020
    add hl, de
    dec b
    jr nz, jr_001_5975

    ld h, $00
    ld l, $01
    ld b, $0a
    ld c, $11
    call Call_001_5e20
    ld a, $01
    ld [RENDER_REQUEST], a
    xor a
    ld [$c64a], a
    ret


Call_001_599c:
    ld a, [hl]
    ld b, $00

jr_001_599f:
    ld c, a
    sub $64
    jr c, jr_001_59a7

    inc b
    jr jr_001_599f

jr_001_59a7:
    ld a, $81
    add b
    ld [de], a
    inc de
    ld a, c
    ld b, $00

jr_001_59af:
    ld c, a
    sub $0a
    jr c, jr_001_59b7

    inc b
    jr jr_001_59af

jr_001_59b7:
    ld a, $81
    add b
    ld [de], a
    inc de
    ld a, $81
    add c
    ld [de], a
    ret


Call_001_59c1:
    push hl
    push de
    push bc
    ld hl, $c5f5
    ld de, $c5f8
    ld a, [hl]
    ld b, a
    ld a, [de]
    add b
    daa
    ld [hl], a
    ld hl, $c5f4
    ld de, $c5f7
    ld a, [hl]
    ld b, a
    ld a, [de]
    adc b
    daa
    ld [hl], a
    ld hl, $c5f3
    ld de, $c5f6
    ld a, [hl]
    ld b, a
    ld a, [de]
    adc b
    daa
    ld [hl], a
    jr nc, jr_001_59f4

    ld hl, $c5f3
    ld a, $99
    ld [hl+], a
    ld [hl+], a
    ld a, $99
    ld [hl], a

jr_001_59f4:
    ld b, $00
    ld a, [$c5f3]
    swap a
    and $0f
    ld hl, $5ab8
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    cp $81
    jr z, jr_001_5a0d

    ld b, $01
    jr jr_001_5a0f

jr_001_5a0d:
    ld a, $00

jr_001_5a0f:
    ld hl, $d0ed
    ld [hl], a
    ld a, [$c5f3]
    and $0f
    ld hl, $5ab8
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    cp $81
    jr z, jr_001_5a28

    ld b, $01
    jr jr_001_5a30

jr_001_5a28:
    ld c, a
    ld a, b
    or a
    ld a, c
    jr nz, jr_001_5a30

    ld a, $00

jr_001_5a30:
    ld hl, $d0ee
    ld [hl], a
    ld a, [$c5f4]
    swap a
    and $0f
    ld hl, $5ab8
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    cp $81
    jr z, jr_001_5a4b

    ld b, $01
    jr jr_001_5a53

jr_001_5a4b:
    ld c, a
    ld a, b
    or a
    ld a, c
    jr nz, jr_001_5a53

    ld a, $00

jr_001_5a53:
    ld hl, $d0ef
    ld [hl], a
    ld a, [$c5f4]
    and $0f
    ld hl, $5ab8
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    cp $81
    jr z, jr_001_5a6c

    ld b, $01
    jr jr_001_5a74

jr_001_5a6c:
    ld c, a
    ld a, b
    or a
    ld a, c
    jr nz, jr_001_5a74

    ld a, $00

jr_001_5a74:
    ld hl, $d0f0
    ld [hl], a
    ld a, [$c5f5]
    swap a
    and $0f
    ld hl, $5ab8
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    cp $81
    jr z, jr_001_5a8f

    ld b, $01
    jr jr_001_5a97

jr_001_5a8f:
    ld c, a
    ld a, b
    or a
    ld a, c
    jr nz, jr_001_5a97

    ld a, $00

jr_001_5a97:
    ld hl, $d0f1
    ld [hl], a
    ld a, [$c5f5]
    and $0f
    ld hl, $5ab8
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    ld hl, $d0f2
    ld [hl], a
    ld a, [$c5c8]
    or $08
    ld [$c5c8], a
    pop bc
    pop de
    pop hl
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

Call_001_5ac2:
    push hl
    push de
    push bc
    ld hl, $c5fc
    ld de, $c600
    ld a, [hl]
    ld b, a
    ld a, [de]
    add b
    daa
    ld [hl], a
    ld hl, $c5fb
    ld de, $c5ff
    ld a, [hl]
    ld b, a
    ld a, [de]
    adc b
    daa
    ld [hl], a
    ld hl, $c5fa
    ld de, $c5fe
    ld a, [hl]
    ld b, a
    ld a, [de]
    adc b
    daa
    ld [hl], a
    ld hl, $c5f9
    ld de, $c5fd
    ld a, [hl]
    ld b, a
    ld a, [de]
    adc b
    daa
    ld [hl], a
    jr nc, jr_001_5b00

    ld hl, $c5f9
    ld a, $99
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl], a

jr_001_5b00:
    ld b, $00
    ld a, [$c5f9]
    swap a
    and $0f
    ld hl, $5ab8
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    cp $81
    jr z, jr_001_5b19

    ld b, $01
    jr jr_001_5b1b

jr_001_5b19:
    ld a, $00

jr_001_5b1b:
    ld hl, $d10c
    ld [hl], a
    ld a, [$c5f9]
    and $0f
    ld hl, $5ab8
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    cp $81
    jr z, jr_001_5b34

    ld b, $01
    jr jr_001_5b3c

jr_001_5b34:
    ld c, a
    ld a, b
    or a
    ld a, c
    jr nz, jr_001_5b3c

    ld a, $00

jr_001_5b3c:
    ld hl, $d10c
    ld [hl], a
    ld a, [$c5fa]
    swap a
    and $0f
    ld hl, $5ab8
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    cp $81
    jr z, jr_001_5b57

    ld b, $01
    jr jr_001_5b5f

jr_001_5b57:
    ld c, a
    ld a, b
    or a
    ld a, c
    jr nz, jr_001_5b5f

    ld a, $00

jr_001_5b5f:
    ld hl, $d10d
    ld [hl], a
    ld a, [$c5fa]
    and $0f
    ld hl, $5ab8
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    cp $81
    jr z, jr_001_5b78

    ld b, $01
    jr jr_001_5b80

jr_001_5b78:
    ld c, a
    ld a, b
    or a
    ld a, c
    jr nz, jr_001_5b80

    ld a, $00

jr_001_5b80:
    ld hl, $d10e
    ld [hl], a
    ld a, [$c5fb]
    swap a
    and $0f
    ld hl, $5ab8
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    cp $81
    jr z, jr_001_5b9b

    ld b, $01
    jr jr_001_5ba3

jr_001_5b9b:
    ld c, a
    ld a, b
    or a
    ld a, c
    jr nz, jr_001_5ba3

    ld a, $00

jr_001_5ba3:
    ld hl, $d10f
    ld [hl], a
    ld a, [$c5fb]
    and $0f
    ld hl, $5ab8
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    cp $81
    jr z, jr_001_5bbc

    ld b, $01
    jr jr_001_5bc4

jr_001_5bbc:
    ld c, a
    ld a, b
    or a
    ld a, c
    jr nz, jr_001_5bc4

    ld a, $00

jr_001_5bc4:
    ld hl, $d110
    ld [hl], a
    ld a, [$c5fc]
    swap a
    and $0f
    ld hl, $5ab8
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    cp $81
    jr z, jr_001_5bdf

    ld b, $01
    jr jr_001_5be7

jr_001_5bdf:
    ld c, a
    ld a, b
    or a
    ld a, c
    jr nz, jr_001_5be7

    ld a, $00

jr_001_5be7:
    ld hl, $d111
    ld [hl], a
    ld a, [$c5fc]
    and $0f
    ld hl, $5ab8
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    ld hl, $d112
    ld [hl], a
    ld a, [$c5c8]
    or $08
    ld [$c5c8], a
    pop bc
    pop de
    pop hl
    ret


Call_001_5c08:
    push hl
    push de
    push bc
    ld hl, $c602
    ld de, $c604
    ld a, [hl]
    ld b, a
    ld a, [de]
    add b
    daa
    ld [hl], a
    ld hl, $c601
    ld de, $c603
    ld a, [hl]
    ld b, a
    ld a, [de]
    adc b
    daa
    ld [hl], a
    jr nc, jr_001_5c2c

    ld hl, $c601
    ld a, $99
    ld [hl+], a
    ld [hl], a

jr_001_5c2c:
    ld b, $00
    ld a, [$c601]
    swap a
    and $0f
    ld hl, $5ab8
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    cp $81
    jr z, jr_001_5c45

    ld b, $01
    jr jr_001_5c47

jr_001_5c45:
    ld a, $00

jr_001_5c47:
    ld hl, $d1ae
    ld [hl], a
    ld a, [$c601]
    and $0f
    ld hl, $5ab8
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    cp $81
    jr z, jr_001_5c60

    ld b, $01
    jr jr_001_5c68

jr_001_5c60:
    ld c, a
    ld a, b
    or a
    ld a, c
    jr nz, jr_001_5c68

    ld a, $00

jr_001_5c68:
    ld hl, $d1af
    ld [hl], a
    ld a, [$c602]
    swap a
    and $0f
    ld hl, $5ab8
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    ld hl, $d1b0
    ld [hl], a
    ld a, [$c602]
    and $0f
    ld hl, $5ab8
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    ld hl, $d1b2
    ld [hl], a
    ld hl, $d1b1
    ld [hl], $a5
    ld a, [$c5c8]
    or $08
    ld [$c5c8], a
    pop bc
    pop de
    pop hl
    ret


Call_001_5ca1:
    push hl
    push de
    push bc
    ld hl, $c606
    ld de, $c608
    ld a, [hl]
    ld b, a
    ld a, [de]
    add b
    daa
    ld [hl], a
    ld hl, $c605
    ld de, $c607
    ld a, [hl]
    ld b, a
    ld a, [de]
    adc b
    daa
    ld [hl], a
    jr nc, jr_001_5cc5

    ld hl, $c605
    ld a, $99
    ld [hl+], a
    ld [hl], a

jr_001_5cc5:
    ld b, $00
    ld a, [$c605]
    swap a
    and $0f
    ld hl, $5ab8
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    cp $81
    jr z, jr_001_5cde

    ld b, $01
    jr jr_001_5ce0

jr_001_5cde:
    ld a, $00

jr_001_5ce0:
    ld hl, $d20e
    ld [hl], a
    ld a, [$c605]
    and $0f
    ld hl, $5ab8
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    cp $81
    jr z, jr_001_5cf9

    ld b, $01
    jr jr_001_5d01

jr_001_5cf9:
    ld c, a
    ld a, b
    or a
    ld a, c
    jr nz, jr_001_5d01

    ld a, $00

jr_001_5d01:
    ld hl, $d20f
    ld [hl], a
    ld a, [$c606]
    swap a
    and $0f
    ld hl, $5ab8
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    ld hl, $d210
    ld [hl], a
    ld a, [$c606]
    and $0f
    ld hl, $5ab8
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    ld hl, $d212
    ld [hl], a
    ld hl, $d211
    ld [hl], $a5
    ld a, [$c5c8]
    or $08
    ld [$c5c8], a
    pop bc
    pop de
    pop hl
    ret


    push hl
    push de
    push bc
    ld hl, $c60a
    ld de, $c60b
    ld a, [hl]
    ld b, a
    ld a, [de]
    add b
    daa
    ld [hl], a
    jr nc, jr_001_5d51

    ld hl, $c60a
    ld a, $99
    ld [hl], a

jr_001_5d51:
    ld a, [$c60a]
    and $0f
    ld hl, $5ab8
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    ld hl, $d152
    ld [hl], a
    ld a, [$c60a]
    swap a
    and $0f
    ld hl, $5ab8
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    cp $81
    jr nz, jr_001_5d77

    ld a, $00

jr_001_5d77:
    ld hl, $d151
    ld [hl], a
    ld a, [$c5c8]
    or $08
    ld [$c5c8], a
    pop bc
    pop de
    pop hl
    ret


Call_001_5d87:
    push hl
    push de
    push bc
    ld hl, $c60d
    ld de, $c60f
    ld a, [hl]
    ld b, a
    ld a, [de]
    add b
    daa
    ld [hl], a
    ld hl, $c60c
    ld de, $c60e
    ld a, [hl]
    ld b, a
    ld a, [de]
    adc b
    daa
    ld [hl], a
    and $f0
    jr z, jr_001_5daf

    ld hl, $c60c
    ld a, $09
    ld [hl+], a
    ld a, $99
    ld [hl], a

jr_001_5daf:
    ld b, $00
    ld a, [$c60c]
    and $0f
    ld hl, $5ab8
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    cp $81
    jr z, jr_001_5dc6

    ld b, $01
    jr jr_001_5dc8

jr_001_5dc6:
    ld a, $00

jr_001_5dc8:
    ld hl, $d1b0
    ld [hl], a
    ld a, [$c60d]
    swap a
    and $0f
    ld hl, $5ab8
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    cp $81
    jr z, jr_001_5de3

    ld b, $01
    jr jr_001_5deb

jr_001_5de3:
    ld c, a
    ld a, b
    or a
    ld a, c
    jr nz, jr_001_5deb

    ld a, $00

jr_001_5deb:
    ld hl, $d1b1
    ld [hl], a
    ld a, [$c60d]
    and $0f
    ld hl, $5ab8
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    ld hl, $d1b2
    ld [hl], a
    ld a, [$c5c8]
    or $08
    ld [$c5c8], a
    pop bc
    pop de
    pop hl
    ret


Call_001_5e0c:
    ld a, [$c5c5]
    ld b, a
    ld c, $06

jr_001_5e12:
    add b
    dec c
    jr nz, jr_001_5e12

    ld c, a
    ld a, [$c5db]
    add c
    add b
    ld [$c5c5], a
    ret


Call_001_5e20:
    ld a, [$c5da]
    cp $04
    ret z

    push hl
    ld hl, $c5ca
    ld d, $00
    ld e, a
    sla e
    sla e
    add hl, de
    ld d, h
    ld e, l
    pop hl
    ld a, h
    ld [de], a
    inc de
    ld a, l
    ld [de], a
    inc de
    ld a, b
    ld [de], a
    inc de
    ld a, c
    ld [de], a
    ld a, [$c5da]
    inc a
    ld [$c5da], a
    ld a, [$c5c8]
    or $04
    ld [$c5c8], a
    ret


Call_001_5e50:
    call Call_001_5e0c
    ld a, [$c5c5]
    ld hl, $4000
    ld c, a
    ld b, $00
    add hl, bc
    ld a, [hl]
    ld b, a
    ld a, [$c647]
    sub b
    jr nz, jr_001_5e73

    ld a, [$c648]
    sub b
    jr nz, jr_001_5e73

    inc b
    ld a, b
    cp $07
    jr nz, jr_001_5e73

    ld b, $00

jr_001_5e73:
    ld a, b
    ld [$c649], a
    ld a, [$c734]
    cp $01
    ret z

    ld a, b
    ld b, $11
    ld c, $03
    ld e, a
    call Call_001_5f03
    ld h, $00
    ld l, $71
    ld b, $02
    ld c, $02
    call Call_001_5e20
    ret


    ld a, [$c7ad]
    ld b, $00
    ld c, a
    sla c
    rl b
    ld hl, $4100
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [$c7ae]
    ld b, $00
    ld c, a
    add hl, bc
    inc a
    ld [$c7ae], a
    ld a, [hl]
    ld [$c649], a
    ld b, $11
    ld c, $03
    ld e, a
    call Call_001_5f03
    ld h, $00
    ld l, $71
    ld b, $02
    ld c, $02
    call Call_001_5e20
    ret


Call_001_5ec6:
    ld a, [$c649]
    ld [$c648], a
    ld a, [$c734]
    cp $01
    ret z

    ld a, [$c649]
    add $07
    ld b, $0d
    ld c, $01
    ld e, a
    call Call_001_5f03
    ld h, $00
    ld l, $2d
    ld b, $04
    ld c, $04
    call Call_001_5e20
    ret


Call_001_5eeb:
    ld a, [$c648]
    ld [$c647], a
    ret


Call_001_5ef2:
    ld hl, $c5e1
    ld a, $00
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    ret


Call_001_5f03:
    push de
    ld a, b
    and $1f
    ld b, a
    ld a, c
    and $1f
    ld c, a
    ld d, $00
    ld e, c
    sla e
    rl d
    sla e
    rl d
    sla e
    rl d
    sla e
    rl d
    sla e
    rl d
    ld hl, $d000
    ld c, b
    ld b, $00
    add hl, bc
    add hl, de
    pop de
    push hl
    ld hl, $5fe2
    ld d, $00
    sla e
    rl d
    add hl, de
    ld a, [hl+]
    ld d, [hl]
    ld e, a
    pop hl
    ld b, h
    ld c, l
    ld a, [de]
    cp $ff
    ret z

    and $03
    jr z, jr_001_5f4d

    dec a
    jr z, jr_001_5f6c

    dec a
    jr z, jr_001_5f8f

    jr jr_001_5fb6

jr_001_5f4d:
    inc de
    ld a, [de]
    cp $ff
    ret z

    cp $fe
    jr z, jr_001_5f5d

    cp $fd
    jr z, jr_001_5f69

    ld [hl+], a
    jr jr_001_5f4d

jr_001_5f5d:
    push de
    ld de, $0020
    ld h, b
    ld l, c
    add hl, de
    ld b, h
    ld c, l
    pop de
    jr jr_001_5f4d

jr_001_5f69:
    inc hl
    jr jr_001_5f4d

jr_001_5f6c:
    inc de
    ld a, [de]
    cp $ff
    ret z

    cp $fe
    jr z, jr_001_5f82

    cp $fd
    jr z, jr_001_5f87

    ld [hl], a
    push de
    ld de, $0020
    add hl, de
    pop de
    jr jr_001_5f6c

jr_001_5f82:
    inc bc
    ld h, b
    ld l, c
    jr jr_001_5f6c

jr_001_5f87:
    push de
    ld de, $0020
    add hl, de
    pop de
    jr jr_001_5f6c

jr_001_5f8f:
    inc de
    ld a, [de]
    cp $ff
    ret z

    cp $fe
    jr z, jr_001_5fa7

    cp $fd
    jr z, jr_001_5fb3

    push bc
    ld b, a
    inc de
    ld a, [de]

jr_001_5fa0:
    ld [hl+], a
    dec b
    jr nz, jr_001_5fa0

    pop bc
    jr jr_001_5f8f

jr_001_5fa7:
    push de
    ld de, $0020
    ld h, b
    ld l, c
    add hl, de
    ld b, h
    ld c, l
    pop de
    jr jr_001_5f8f

jr_001_5fb3:
    inc hl
    jr jr_001_5f8f

jr_001_5fb6:
    inc de
    ld a, [de]
    cp $ff
    ret z

    cp $fe
    jr z, jr_001_5fd4

    cp $fd
    jr z, jr_001_5fd9

    push bc
    ld b, a
    inc de
    ld a, [de]

jr_001_5fc7:
    ld [hl], a
    push de
    ld de, $0020
    add hl, de
    pop de
    dec b
    jr nz, jr_001_5fc7

    pop bc
    jr jr_001_5fb6

jr_001_5fd4:
    inc bc
    ld h, b
    ld l, c
    jr jr_001_5fb6

jr_001_5fd9:
    push de
    ld de, $0020
    add hl, de
    pop de
    jr jr_001_5fb6

    ret


    ld b, $60
    dec c
    ld h, b
    inc d
    ld h, b
    dec de
    ld h, b
    ld [hl+], a
    ld h, b
    add hl, hl
    ld h, b
    jr nc, jr_001_6050

    scf
    ld h, b
    ld c, h
    ld h, b
    ld h, c
    ld h, b
    halt
    ld h, b
    adc e
    ld h, b
    and b
    ld h, b
    or l
    ld h, b
    jp z, $e860

    ld h, b
    ld b, c
    ld h, c
    sbc d
    ld h, c
    nop
    ld d, b
    ld d, c
    cp $52
    ld d, e
    rst $38
    nop
    ld d, h
    ld d, l
    cp $56
    ld d, a
    rst $38
    nop
    ld e, b
    ld e, c
    cp $5a
    ld e, e
    rst $38
    nop
    ld e, h
    ld e, l
    cp $5e
    ld e, a
    rst $38
    nop
    ld h, b
    ld h, c
    cp $62
    ld h, e
    rst $38
    nop
    ld h, h
    ld h, l
    cp $66
    ld h, a
    rst $38
    nop
    ld l, b
    ld l, c
    cp $6a
    ld l, e
    rst $38
    nop
    nop
    nop
    nop
    nop
    cp $e0
    ldh [$ffe0], a
    ldh [$fffe], a
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    rst $38
    nop
    nop
    nop
    nop

jr_001_6050:
    nop
    cp $00
    pop hl
    pop hl
    nop
    cp $00
    pop hl
    pop hl
    nop
    cp $00
    nop
    nop
    nop
    rst $38
    nop
    nop
    nop
    nop
    nop
    cp $e2
    ldh [c], a
    ldh [c], a
    nop
    cp $00
    ldh [c], a
    nop
    nop
    cp $00
    nop
    nop
    nop
    rst $38
    nop
    nop
    nop
    nop
    nop
    cp $e3
    db $e3
    db $e3
    nop
    cp $00
    nop
    db $e3
    nop
    cp $00
    nop
    nop
    nop
    rst $38
    nop
    nop
    nop
    nop
    nop
    cp $e4
    db $e4
    db $e4
    nop
    cp $e4
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    rst $38
    nop
    nop
    nop
    nop
    nop
    cp $e5
    push hl
    nop
    nop
    cp $00
    push hl
    push hl
    nop
    cp $00
    nop
    nop
    nop
    rst $38
    nop
    nop
    nop
    nop
    nop
    cp $00
    and $e6
    nop
    cp $e6
    and $00
    nop
    cp $00
    nop
    nop
    nop
    rst $38
    nop
    nop
    nop
    sbc d
    adc e
    xor h
    sbc l
    adc a
    cp $fe
    nop
    adc l
    sbc c
    sbc b
    sbc [hl]
    sub e
    sbc b
    sbc a
    adc a
    cp $fe
    nop
    sbc h
    adc a
    sbc [hl]
    sub e
    sbc h
    adc a
    nop
    rst $38
    nop
    nop
    nop
    sbc d
    adc e
    xor h
    sbc l
    adc a
    nop
    nop
    nop
    cp $00
    ds 9, 0 ; 9 x nop ($00)
    cp $00
    adc l
    sbc c
    sbc b
    sbc [hl]
    sub e
    sbc b
    sbc a
    adc a
    nop
    cp $00
    ds 9, 0 ; 9 x nop ($00)
    cp $00
    sbc h
    adc a
    sbc [hl]
    sub e
    sbc h
    adc a
    nop
    nop
    nop
    cp $02
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    inc b
    nop
    cp $05
    sbc d
    sbc h
    adc a
    sbc l
    sbc l
    nop
    adc h
    ld b, $00
    cp $08
    add hl, bc
    add hl, bc
    add hl, bc
    add hl, bc
    add hl, bc
    add hl, bc
    add hl, bc
    ld a, [bc]
    nop
    rst $38
    nop
    nop
    nop
    sbc d
    adc e
    xor h
    sbc l
    adc a
    nop
    nop
    nop
    cp $03
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    cp $00
    nop
    sbc l
    sbc [hl]
    adc e
    sub c
    adc a
    nop
    nop
    nop
    cp $00
    ds 9, 0 ; 9 x nop ($00)
    cp $00
    ds 9, 0 ; 9 x nop ($00)
    cp $09
    add hl, bc
    add hl, bc
    add hl, bc
    add hl, bc
    add hl, bc
    add hl, bc
    add hl, bc
    add hl, bc
    add hl, bc
    cp $00
    ds 9, 0 ; 9 x nop ($00)
    cp $00
    ds 9, 0 ; 9 x nop ($00)
    rst $38
    nop
    nop
    nop
    xor $ef
    ldh a, [$fff1]
    ldh a, [c]
    di
    nop
    nop
    cp $ff

ClearObjectSubfield:
    ld hl, $0014
    add hl, de
    ld [hl], $00
    ret


Call_001_61ae:
    ld a, $00
    ld [MOVE_RESULT], a
    ld hl, $0002
    add hl, de
    ld a, [hl]
    sub $08
    srl a
    ret c

    srl a
    ret c

    srl a
    ret c

Call_001_61c4:
    ld hl, $0011
    add hl, de
    ld a, [hl]
    or a
    jp nz, Jump_001_61f9

    ld bc, $ffff
    call Call_001_6659
    call Call_001_662c
    or a
    jp nz, Jump_001_61e5

    ld a, [hl]
    or a
    jp z, Jump_001_61e5

    and $f0
    cp $70
    jp nz, Jump_001_6223

Jump_001_61e5:
    ld bc, $ffe0
    add hl, bc
    call Call_001_662c
    or a
    ret nz

    ld a, [hl]
    or a
    ret z

    and $f0
    cp $70
    ret z

    jp Jump_001_6223


Jump_001_61f9:
    ld bc, $0002
    call Call_001_6659
    call Call_001_662c
    or a
    jp nz, Jump_001_6212

    ld a, [hl]
    or a
    jp z, Jump_001_6212

    and $f0
    cp $70
    jp nz, Jump_001_6223

Jump_001_6212:
    ld bc, $ffe0
    add hl, bc
    call Call_001_662c
    or a
    ret nz

    ld a, [hl]
    or a
    ret z

    and $f0
    cp $70
    ret z

Jump_001_6223:
    ld a, $01
    ld [MOVE_RESULT], a
    ret


Call_001_6229:
    ld a, $00
    ld [MOVE_RESULT], a
    ld a, [$c6cd]
    ld [$c651], a
    ld a, [$c6ce]
    and $f0
    inc a
    ld [$c652], a
    ld a, [$c6c6]
    ld hl, $d061

jr_001_6243:
    cp $00
    jr z, jr_001_6250

    push de
    ld de, $0020
    add hl, de
    pop de
    dec a
    jr jr_001_6243

jr_001_6250:
    ld b, $00

Jump_001_6252:
    ld a, [$c651]
    sub h
    jr nz, jr_001_625e

    ld a, [$c652]
    sub l
    jr z, jr_001_626c

jr_001_625e:
    push de
    ld de, $0020
    add hl, de
    pop de
    inc b
    ld a, b
    cp $04
    ret z

    jp Jump_001_6252


jr_001_626c:
    ld a, $01
    ld [MOVE_RESULT], a
    ret


    ld a, $00
    ld [MOVE_RESULT], a
    ld a, [$c6cd]
    ld [$c651], a
    ld a, [$c6ce]
    and $f0
    inc a
    ld [$c652], a
    ld a, [$c6c6]
    ld hl, $d061

jr_001_628c:
    cp $00
    jr z, jr_001_6299

    push de
    ld de, $0020
    add hl, de
    pop de
    dec a
    jr jr_001_628c

jr_001_6299:
    ld b, $00

Jump_001_629b:
    ld a, [$c651]
    sub h
    jr nz, jr_001_62a6

    ld a, [$c652]
    sub l
    ret z

jr_001_62a6:
    push de
    ld de, $0020
    add hl, de
    pop de
    inc b
    ld a, b
    cp $04
    jr z, jr_001_62b5

    jp Jump_001_629b


jr_001_62b5:
    ld a, $01
    ld [MOVE_RESULT], a
    ret


Call_001_62bb:
    ld a, $00
    ld [MOVE_RESULT], a
    ld hl, $0002
    add hl, de
    ld a, [hl]
    sub $08
    srl a
    jp c, Jump_001_6366

    srl a
    jp c, Jump_001_6366

    srl a
    jp c, Jump_001_6366

    ld bc, $0020
    call Call_001_6659
    call Call_001_662c
    or a
    jp nz, Jump_001_62ed

    ld a, [hl]
    or a
    jp z, Jump_001_62ed

    and $f0
    cp $70
    ret nz

Jump_001_62ed:
    ld bc, $0001
    add hl, bc
    call Call_001_662c
    or a
    jp nz, Jump_001_6302

    ld a, [hl]
    or a
    jp z, Jump_001_6302

    and $f0
    cp $70
    ret nz

Jump_001_6302:
    ld a, $01
    ld [MOVE_RESULT], a
    ld bc, $001f
    add hl, bc
    call Call_001_662c
    or a
    jp nz, Jump_001_631c

    ld a, [hl]
    or a
    jp z, Jump_001_631c

    and $f0
    cp $70
    ret nz

Jump_001_631c:
    ld bc, $0001
    add hl, bc
    call Call_001_662c
    or a
    jp nz, Jump_001_6331

    ld a, [hl]
    or a
    jp z, Jump_001_6331

    and $f0
    cp $70
    ret nz

Jump_001_6331:
    ld a, $01
    ld [MOVE_RESULT], a
    ld bc, $001f
    add hl, bc
    call Call_001_662c
    or a
    jp nz, Jump_001_634b

    ld a, [hl]
    or a
    jp z, Jump_001_634b

    and $f0
    cp $70
    ret nz

Jump_001_634b:
    ld bc, $0001
    add hl, bc
    call Call_001_662c
    or a
    jp nz, Jump_001_6360

    ld a, [hl]
    or a
    jp z, Jump_001_6360

    and $f0
    cp $70
    ret nz

Jump_001_6360:
    ld a, $02
    ld [MOVE_RESULT], a
    ret


Jump_001_6366:
    ld bc, $0020
    call Call_001_6659
    call Call_001_662c
    or a
    jp nz, Jump_001_637d

    ld a, [hl]
    or a
    jp z, Jump_001_637d

    and $f0
    cp $70
    ret nz

Jump_001_637d:
    ld bc, $0001
    add hl, bc
    call Call_001_662c
    or a
    jp nz, Jump_001_6392

    ld a, [hl]
    or a
    jp z, Jump_001_6392

    and $f0
    cp $70
    ret nz

Jump_001_6392:
    ld bc, $0001
    add hl, bc
    call Call_001_662c
    or a
    jp nz, Jump_001_63a7

    ld a, [hl]
    or a
    jp z, Jump_001_63a7

    and $f0
    cp $70
    ret nz

Jump_001_63a7:
    ld a, $01
    ld [MOVE_RESULT], a
    ld bc, $001e
    add hl, bc
    call Call_001_662c
    or a
    jp nz, Jump_001_63c1

    ld a, [hl]
    or a
    jp z, Jump_001_63c1

    and $f0
    cp $70
    ret nz

Jump_001_63c1:
    ld bc, $0001
    add hl, bc
    call Call_001_662c
    or a
    jp nz, Jump_001_63d6

    ld a, [hl]
    or a
    jp z, Jump_001_63d6

    and $f0
    cp $70
    ret nz

Jump_001_63d6:
    ld bc, $0001
    add hl, bc
    call Call_001_662c
    or a
    jp nz, Jump_001_63eb

    ld a, [hl]
    or a
    jp z, Jump_001_63eb

    and $f0
    cp $70
    ret nz

Jump_001_63eb:
    ld a, $01
    ld [MOVE_RESULT], a
    ld bc, $001e
    add hl, bc
    call Call_001_662c
    or a
    jp nz, Jump_001_6405

    ld a, [hl]
    or a
    jp z, Jump_001_6405

    and $f0
    cp $70
    ret nz

Jump_001_6405:
    ld bc, $0001
    add hl, bc
    call Call_001_662c
    or a
    jp nz, Jump_001_641a

    ld a, [hl]
    or a
    jp z, Jump_001_641a

    and $f0
    cp $70
    ret nz

Jump_001_641a:
    ld bc, $0001
    add hl, bc
    call Call_001_662c
    or a
    jp nz, Jump_001_642f

    ld a, [hl]
    or a
    jp z, Jump_001_642f

    and $f0
    cp $70
    ret nz

Jump_001_642f:
    ld a, $02
    ld [MOVE_RESULT], a
    ret


    ld a, $00
    ld [MOVE_RESULT], a
    ld hl, $0003
    add hl, de
    ld a, [hl]
    sub $10
    srl a
    ret c

    srl a
    ret c

    srl a
    ret c

    ld bc, $0020
    call Call_001_6659
    call Call_001_662c
    or a
    jp nz, Jump_001_6463

    ld a, [hl]
    or a
    jp z, Jump_001_6463

    and $f0
    cp $70
    jp nz, Jump_001_64a3

Jump_001_6463:
    ld bc, $0001
    add hl, bc
    call Call_001_662c
    or a
    jp nz, Jump_001_647a

    ld a, [hl]
    or a
    jp z, Jump_001_647a

    and $f0
    cp $70
    jp nz, Jump_001_64a3

Jump_001_647a:
    ld hl, $0002
    add hl, de
    ld a, [hl]
    sub $08
    srl a
    jr c, jr_001_648c

    srl a
    jr c, jr_001_648c

    srl a
    ret nc

jr_001_648c:
    ld bc, $0020
    call Call_001_6659
    ld bc, $0002
    add hl, bc
    call Call_001_662c
    or a
    ret nz

    ld a, [hl]
    or a
    ret z

    and $f0
    cp $70
    ret z

Jump_001_64a3:
    ld a, $01
    ld [MOVE_RESULT], a
    ret


Call_001_64a9:
    ld a, $00
    ld [MOVE_RESULT], a
    ld a, [$c6cd]
    ld h, a
    ld a, [$c6ce]
    and $f0
    inc a
    ld l, a
    ld bc, $d201
    ld a, b
    sub h
    ret nz

    ld a, c
    sub l
    ret nz

    ld a, $01
    ld [MOVE_RESULT], a
    ret


Call_001_64c8:
    ld a, $00
    ld [MOVE_RESULT], a
    ld hl, $0002
    add hl, de
    ld a, [hl]
    sub $08
    srl a
    ret c

    srl a
    ret c

    srl a
    ret c

    ld bc, $0000
    call Call_001_6659
    call Call_001_662c
    or a
    jp nz, Jump_001_64f6

    ld a, [hl]
    or a
    jp z, Jump_001_64f6

    and $f0
    cp $70
    jp nz, Jump_001_6535

Jump_001_64f6:
    ld bc, $0001
    add hl, bc
    call Call_001_662c
    or a
    jp nz, Jump_001_650d

    ld a, [hl]
    or a
    jp z, Jump_001_650d

    and $f0
    cp $70
    jp nz, Jump_001_6535

Jump_001_650d:
    ld bc, $ffdf
    add hl, bc
    call Call_001_662c
    or a
    jp nz, Jump_001_6524

    ld a, [hl]
    or a
    jp z, Jump_001_6524

    and $f0
    cp $70
    jp nz, Jump_001_6535

Jump_001_6524:
    ld bc, $0001
    add hl, bc
    call Call_001_662c
    or a
    ret nz

    ld a, [hl]
    or a
    ret z

    and $f0
    cp $70
    ret z

Jump_001_6535:
    ld a, $01
    ld [MOVE_RESULT], a
    ret


Call_001_653b:
    ld a, $00
    ld [MOVE_RESULT], a
    ld a, [$c6cd]
    ld [$c651], a
    ld a, [$c6ce]
    and $f0
    inc a
    ld [$c652], a
    ld a, [$c6c6]
    ld hl, $d061

jr_001_6555:
    cp $00
    jr z, jr_001_6562

    push de
    ld de, $0020
    add hl, de
    pop de
    dec a
    jr jr_001_6555

jr_001_6562:
    ld b, $00

Jump_001_6564:
    ld a, [$c651]
    sub h
    jr nz, jr_001_6570

    ld a, [$c652]
    sub l
    jr z, jr_001_657e

jr_001_6570:
    push de
    ld de, $0020
    add hl, de
    pop de
    inc b
    ld a, b
    cp $02
    ret z

    jp Jump_001_6564


jr_001_657e:
    ld a, $01
    ld [MOVE_RESULT], a
    ret


    push hl
    push de
    push bc
    ld de, $c0c0
    ld hl, $0005
    add hl, de
    ld a, [hl]
    or a
    jp nz, Jump_001_65b0

    ld a, $00
    ld [$c6cf], a
    ld [$c6d0], a
    ld [$c6d1], a
    ld [$c6d2], a
    ld [$c6d3], a
    ld [$c6d4], a
    ld [$c6d5], a
    ld [$c6d6], a
    jp Jump_001_6628


Jump_001_65b0:
    ld hl, $0011
    add hl, de
    ld a, [hl+]
    ld b, a
    ld a, [hl]
    ld c, a
    ld hl, $0013
    add hl, de
    ld a, [hl]
    push de
    ld hl, $430b
    ld d, $00
    ld e, a
    sla e
    rl d
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    pop de
    push hl
    ld hl, $0004
    add hl, de
    ld a, [hl]
    pop hl
    ld d, $00
    ld e, a
    sla e
    rl d
    sla e
    rl d
    sla e
    rl d
    add hl, de
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    push hl
    ld h, b
    ld l, c
    add hl, de
    ld a, h
    ld [$c6cf], a
    ld a, l
    ld [$c6d0], a
    pop hl
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    push hl
    ld h, b
    ld l, c
    add hl, de
    ld a, h
    ld [$c6d1], a
    ld a, l
    ld [$c6d2], a
    pop hl
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    push hl
    ld h, b
    ld l, c
    add hl, de
    ld a, h
    ld [$c6d3], a
    ld a, l
    ld [$c6d4], a
    pop hl
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    push hl
    ld h, b
    ld l, c
    add hl, de
    ld a, h
    ld [$c6d5], a
    ld a, l
    ld [$c6d6], a
    pop hl

Jump_001_6628:
    pop bc
    pop de
    pop hl
    ret


Call_001_662c:
    push hl
    push de
    push bc
    ld de, $c6cf
    ld a, [de]
    or a
    jp z, Jump_001_6655

    ld b, $04

jr_001_6639:
    ld a, [de]
    sub h
    jr nz, jr_001_6646

    inc de
    ld a, [de]
    sub l
    jr nz, jr_001_664f

    ld a, $01
    jr jr_001_6655

jr_001_6646:
    inc de
    inc de
    dec b
    jr nz, jr_001_6639

    ld a, $00
    jr jr_001_6655

jr_001_664f:
    inc de
    dec b
    jr nz, jr_001_6639

    ld a, $00

Jump_001_6655:
jr_001_6655:
    pop bc
    pop de
    pop hl
    ret


Call_001_6659:
    ld a, [$c6cd]
    ld h, a
    ld a, [$c6ce]
    ld l, a
    add hl, bc
    ret


Call_001_6663:
    ld hl, $0013
    add hl, de
    ld [hl], $00
    ret


    push hl
    push de
    push bc
    ld de, $c0c0
    ld hl, $0005
    add hl, de
    ld a, [hl]
    or a
    jp z, Jump_001_66e4

    ld a, $00
    ld [hl], a
    ld hl, $0011
    add hl, de
    ld a, [hl+]
    ld b, a
    ld a, [hl]
    ld c, a
    ld hl, $0013
    add hl, de
    ld a, [hl]
    push de
    ld hl, $430b
    ld d, $00
    ld e, a
    sla e
    rl d
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    pop de
    push hl
    ld hl, $0004
    add hl, de
    ld a, [hl]
    pop hl
    ld d, $00
    ld e, a
    sla e
    rl d
    sla e
    rl d
    sla e
    rl d
    add hl, de
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    push hl
    ld h, b
    ld l, c
    add hl, de
    ld [hl], $00
    pop hl
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    push hl
    ld h, b
    ld l, c
    add hl, de
    ld [hl], $00
    pop hl
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    push hl
    ld h, b
    ld l, c
    add hl, de
    ld [hl], $00
    pop hl
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    push hl
    ld h, b
    ld l, c
    add hl, de
    ld [hl], $00
    pop hl
    ld a, [$c5c8]
    or $02
    ld [$c5c8], a

Jump_001_66e4:
    ld a, [$c734]
    cp $01
    jp z, Jump_001_6723

    ld hl, $d02d
    ld c, $04

jr_001_66f1:
    ld b, $04
    push hl

jr_001_66f4:
    ld a, $00
    ld [hl+], a
    dec b
    jr nz, jr_001_66f4

    pop hl
    ld de, $0020
    add hl, de
    dec c
    jr nz, jr_001_66f1

    ld hl, $d071
    ld c, $02

jr_001_6707:
    ld b, $02
    push hl

jr_001_670a:
    ld a, $00
    ld [hl+], a
    dec b
    jr nz, jr_001_670a

    pop hl
    ld de, $0020
    add hl, de
    dec c
    jr nz, jr_001_6707

    ld h, $00
    ld l, $2d
    ld b, $06
    ld c, $04
    call Call_001_5e20

Jump_001_6723:
    pop bc
    pop de
    pop hl
    ret


    xor a
    ld [$c5ed], a
    ld [$c6c6], a
    ld [$c6c7], a
    ld [$c6c8], a
    ld [PROF_ACTION1], a
    ld [PROF_ACTION2], a
    ld [PROF_ACTION3], a
    ld [PROF_ACTION4], a
    ld [$c6cd], a
    ld [$c6ce], a
    ld [$c6cf], a
    ld [$c6d0], a
    ld [$c6d1], a
    ld [$c6d2], a
    ld [$c6d3], a
    ld [$c6d4], a
    ld [$c6d5], a
    ld [$c6d6], a
    ld [$c6d7], a
    ld [$c6d8], a
    ld [$c6d9], a
    ld [$c6da], a
    ld [$c5fd], a
    ld [$c5fe], a
    ld [$c5ff], a
    ld [$c600], a
    ld [$c603], a
    ld [$c604], a
    ld [$c605], a
    ld [$c606], a
    ld [$c607], a
    ld [$c608], a
    ld [$c609], a
    ld [$c5ac], a
    ld [$c5ae], a
    ld [$c5af], a
    ld [$c5b0], a
    ld [$c5b1], a
    ld [$c5b2], a
    ld [$c5b3], a
    ld [$c5b4], a
    ld [$c5b5], a
    ld [$c5b6], a
    ld [$c5b7], a
    ld [$c5b8], a
    ld [$c5b9], a
    ld [$c5ba], a
    ld [$c5bb], a
    ld [$c5bc], a
    ld [$c5bd], a
    ld [$c5be], a
    ld [$c5bf], a
    ld [$c5c0], a
    ld [$c5c1], a
    ld [$c5c2], a
    ld [$c5c3], a
    ld [$c647], a
    ld [$c648], a
    ld [$c649], a
    ld [$c64a], a
    ld [$c72e], a
    ld [$c72f], a
    ld [$c730], a
    ld [$c731], a
    ld [$c732], a
    ld [$c733], a
    ld [$c734], a
    ld [$c735], a
    ld [$c73d], a
    ret


    ld a, $00
    ld [$c5f0], a
    ld [$c5f1], a
    ld [$c5f2], a
    ret


Call_001_67f8:
    ld a, $ff
    ld [$c5f0], a
    ld [$c5f1], a
    ld [$c5f2], a
    ret


    ld a, $e4
    ld [$c5f0], a
    ld [$c5f1], a
    ld a, $d2
    ld [$c5f2], a
    ret


