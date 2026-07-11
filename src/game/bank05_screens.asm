; ============================================================================
; BANK $05 - Screen State Handlers
; ============================================================================
; Address: $4000-$7FFF (switchable)
;
; Screen state machine handlers for all game screens: title, mode select,
; gameplay, results, and VS modes. Manages UI transitions, menu logic,
; and screen initialization via SCREEN_SUBSTATE jump tables.
;
; Key structures:
;   SCREEN_SUBSTATE jump table at $4013
;   Screen initialization routines
;   Menu/UI state management
;   Tilemap data tables
;
; ============================================================================
; Originally disassembled with mgbdis v3.0 by Matt Currie

SECTION "ROM Bank $005", ROMX[$4000], BANK[$5]

    ld a, [SCREEN_SUBSTATE]
    ld hl, $4013
    ld d, $00
    ld e, a
    sla e
    rl d
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


    ret


    cpl
    ld b, b
    ccf
    ld b, b
    add c
    ld e, d
    ld a, [hl]
    ld b, b
    adc e
    ld b, b
    sub l
    ld b, b
    add c
    ld e, d
    pop bc
    ld b, b
    pop bc
    ld b, b
    db $ed
    ld b, b
    ld c, $41
    add c
    ld e, d
    inc sp
    ld b, c
    ld b, e
    ld b, c
    ld a, $01
    ld [RENDER_REQUEST], a
    ld a, $40
    ld [$c5ab], a
    call Call_000_016b
    jp Jump_000_0165


    xor a
    call Call_000_0159
    call Call_005_6107
    cp $00
    jr z, jr_005_406e

    cp $01
    jr z, jr_005_4068

    ld a, [$c67f]
    or a
    jr z, jr_005_4057

    call Call_000_01dd

jr_005_4057:
    call Call_005_621a
    ld e, $0f
    call Call_000_015c
    ld a, $08
    call Call_000_0162
    call Call_000_0165
    ret


jr_005_4068:
    call Call_005_621a
    jp Jump_005_4078


jr_005_406e:
    xor a
    ld [$c5a7], a
    ld [$c683], a
    ld [$c682], a

Jump_005_4078:
    ld a, $05
    ld [SCREEN_SUBSTATE], a
    ret


    ldh a, [$ff8d]
    and $01
    ret z

    ld a, $08
    call Call_000_0162
    jp Jump_000_0165


    ld a, $01
    call Call_000_0168
    or a
    ret z

    jp Jump_000_0165


    ld a, [$c67f]
    or a
    jr z, jr_005_409e

    call Call_000_01b6

jr_005_409e:
    ld e, $3e
    call Call_000_015c
    ld h, $00
    ld l, $00
    ld b, $14
    ld c, $1f                   ; was $1c: cover the credit row 30 (rows 0-30)
    call Call_000_0153
    ld a, $83
    ldh [rLCDC], a
    call Call_000_0174
    ld a, $08
    call Call_000_0162
    xor a
    ld [$c5ed], a
    jp Jump_000_0165


    ld a, [$c5ab]
    cp $00
    jr z, jr_005_40cd

    dec a
    ld [$c5ab], a
    ret


jr_005_40cd:
    ld a, [$c5db]
    and $03
    ret nz

    ld a, [$c5ed]
    cp $68
    jr nz, jr_005_40e8

    ld a, $40
    ld [$c5ab], a
    ld a, $08
    call Call_000_0162
    call Call_000_0165
    ret


jr_005_40e8:
    inc a
    ld [$c5ed], a
    ret


    ld a, [$c5ab]
    cp $00
    jr z, jr_005_40f9

    dec a
    ld [$c5ab], a
    ret


jr_005_40f9:
    ld a, $01
    call Call_000_0168
    or a
    ret z

    xor a
    ld [$c5ed], a
    ld a, $01
    ld [GAME_STATE], a
    xor a
    ld [SCREEN_SUBSTATE], a
    ret


    ld a, [$c67f]
    or a
    jr z, jr_005_4117

    call Call_000_01b3

jr_005_4117:
    xor a
    ld [$c5ed], a
    ld e, $2b
    call Call_000_015c
    call Call_000_0174
    call Call_000_016b
    ld a, $08
    call Call_000_0162
    ld a, $40
    ld [$c5ab], a
    jp Jump_000_0165


    ld a, [$c5ab]
    dec a
    ld [$c5ab], a
    ret nz

    ld a, $08
    call Call_000_0162
    jp Jump_000_0165


    ld a, $01
    call Call_000_0168
    or a
    ret z

    ld a, $01
    ld [GAME_STATE], a
    xor a
    ld [SCREEN_SUBSTATE], a
    ret


    ld a, [SCREEN_SUBSTATE]
    ld hl, $4167
    ld d, $00
    ld e, a
    sla e
    rl d
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


    ret


    ld l, a
    ld b, c
    sub e
    ld b, c
    or [hl]
    ld b, c
    and e
    ld b, d
    ld a, [$c67f]
    or a
    jr z, jr_005_4178

    call Call_000_01ad

jr_005_4178:
    xor a
    call Call_000_0159
    ld e, $20
    call Call_000_015c
    ld a, $83
    ldh [rLCDC], a
    call Call_000_0174
    call Call_000_016b
    ld a, $08
    call Call_000_0162
    jp Jump_000_0165


    ld a, $01
    ld [RENDER_REQUEST], a
    ld a, $00
    call Call_000_0168
    or a
    ret z

    xor a
    ld [ANIM_FRAME], a
    ld [$c699], a
    ld [$c69a], a
    ld [$c69b], a
    ld [$c69c], a
    ld a, $03
    ldh [$ffa0], a
    jp Jump_000_0165


    ld b, $04
    ld c, $0f
    ld e, $01
    call Call_000_0156
    ld h, $01
    ld l, $e0
    ld b, $14
    ld c, $01
    call Call_000_0153
    ld a, [ANIM_FRAME]
    inc a
    ld [ANIM_FRAME], a
    and $20
    jp z, Jump_005_41ea

    ld b, $04
    ld c, $0f
    ld e, $02
    call Call_000_0156
    ld h, $01
    ld l, $e0
    ld b, $14
    ld c, $01
    call Call_000_0153

Jump_005_41ea:
    ldh a, [$ff8d]
    and $08
    jr z, jr_005_4201

    ld a, $02
    ldh [$ffa1], a
    ld a, $08
    call Call_000_0162
    ld a, $02
    ld [SOUND_CONTROL], a
    jp Jump_000_0165


jr_005_4201:
    ldh a, [$ff8c]
    and $04
    jr nz, jr_005_423c

    ld a, [$c69a]
    or a
    ret nz

    ldh a, [$ff8d]
    or a
    ret z

    ld hl, $428f
    ld d, $00
    ld a, [$c699]
    ld e, a
    add hl, de
    ld a, [hl]
    ld b, a
    ldh a, [$ff8d]
    cp b
    jr z, jr_005_4227

    ld a, $00
    ld [$c699], a
    ret


jr_005_4227:
    ld a, [$c699]
    inc a
    ld [$c699], a
    cp $0a
    jr nz, jr_005_423b

    ld a, $18
    ldh [$ffa1], a
    ld a, $01
    ld [$c69a], a

jr_005_423b:
    ret


jr_005_423c:
    ld a, [$c69c]
    or a
    ret nz

    ldh a, [$ff8d]
    or a
    ret z

    ld hl, $4299
    ld d, $00
    ld a, [$c69b]
    ld e, a
    add hl, de
    ld a, [hl]
    ld b, a
    ldh a, [$ff8d]
    cp b
    jr z, jr_005_425c

    ld a, $00
    ld [$c69b], a
    ret


jr_005_425c:
    ld a, [$c69b]
    inc a
    ld [$c69b], a
    cp $0a
    jr nz, jr_005_428e

    ld a, $13
    ldh [$ffa1], a
    ld a, $01
    ld [$c69c], a
    ld a, $1f
    ld [$c67e], a
    ld [$a459], a
    xor a
    ld [$c6db], a
    ld [$a456], a
    ld [$c6dc], a
    ld [$a457], a
    ld [$c5c4], a
    ld [$a458], a
    jp Jump_005_61c4


jr_005_428e:
    ret


    ld b, b
    db $10
    add b
    jr nz, jr_005_42d4

    add b
    ld [bc], a
    ld bc, $2010
    ld bc, $0201
    ld [bc], a
    jr nz, jr_005_42bf

    db $10
    db $10
    ld b, b
    add b
    ld a, $01
    call Call_000_0168
    or a
    ret z

    ld a, $02
    ld [GAME_STATE], a
    xor a
    ld [SCREEN_SUBSTATE], a
    jp Jump_005_61eb


    ld a, [SCREEN_SUBSTATE]
    ld hl, $42c9
    ld d, $00
    ld e, a

jr_005_42bf:
    sla e
    rl d
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


    ret


    ei
    ld b, d
    add c
    ld e, d
    jr nc, @+$45

    adc e
    ld b, e
    add c
    ld e, d
    ld a, h

jr_005_42d4:
    ld b, h
    pop de
    ld b, h
    add c
    ld e, d
    ld h, $45
    ld a, d
    ld b, l
    adc l
    ld b, l
    add c
    ld e, d
    jp nz, $9246

    ld b, a
    cp h
    ld b, a
    inc bc
    ld c, b
    ld [de], a
    ld c, b
    inc l
    ld c, b
    add c
    ld e, d
    ld d, l
    ld c, b
    ld [hl], h
    ld c, b
    add l
    ld c, b
    add c
    ld e, d
    and h
    ld c, b
    or $48
    ld a, [$c67f]
    or a
    jr z, jr_005_4304

    call Call_000_01dd

jr_005_4304:
    ld a, $03
    call Call_000_0159
    ld e, $24
    call Call_000_015c
    call Call_000_016b
    ld a, $08
    call Call_000_0162
    ld a, $04
    ldh [$ffa0], a
    xor a
    ld hl, $c5f9
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    call GBC_PuzzleMenuInit     ; was: xor a / ld [$c685],a / call Call_005_5d14 (iso-size)
    nop
    nop
    nop
    nop
    jp Jump_000_0165


    ldh a, [$ff8d]
    and $01
    jr z, jr_005_4357

    ld a, [$a459]
    cp $ff
    jr nz, jr_005_4349

    ld a, $02
    ld [SOUND_CONTROL], a
    xor a
    ld [$c686], a
    jp Jump_005_434f


jr_005_4349:
    ld a, [$c685]
    ld [$c686], a

Jump_005_434f:
    ld a, $08
    call Call_000_0162
    jp Jump_000_0165


jr_005_4357:
    call Call_005_5d14
    ldh a, [$ff8d]
    and $40
    jr z, jr_005_4373

    call Call_005_5d31
    ld a, [$c685]
    xor $01
    ld [$c685], a
    call Call_005_5d14
    ld a, $03
    ldh [$ffa1], a
    ret


jr_005_4373:
    ldh a, [$ff8d]
    and $80
    ret z

    call Call_005_5d31
    ld a, [$c685]
    xor $01
    ld [$c685], a
    call Call_005_5d14
    ld a, $03
    ldh [$ffa1], a
    ret


    ld a, $01
    call Call_000_0168
    or a
    ret z

    ld a, $08
    call Call_000_0162
    ld a, [$a459]
    cp $ff
    jp z, Jump_005_4470

    ld a, [$c685]
    cp $00
    jp z, Jump_005_440a

    ld e, $37
    call Call_000_015c
    ld a, $07
    ld [SCREEN_SUBSTATE], a
    ld a, [$a459]
    cp $1f
    jr nz, jr_005_43cd

    ld e, $5d
    ld b, $04
    ld c, $09
    call Call_000_0156
    ld h, $01
    ld l, $24
    ld b, $0c
    ld c, $03
    call Call_000_0153
    ret


jr_005_43cd:
    ld a, [$a456]
    add $48
    ld e, a
    ld b, $04
    ld c, $09
    call Call_000_0156
    ld h, $01
    ld l, $24
    ld b, $0c
    ld c, $01
    call Call_000_0153
    ld a, [$a457]
    inc a
    call Call_005_62de
    ld a, e
    swap a
    and $0f
    add $81
    ld [$d16e], a
    ld a, e
    and $0f
    add $81
    ld [$d16f], a
    ld h, $01
    ld l, $6e
    ld b, $02
    ld c, $01
    jp Jump_000_0153


    ret


Jump_005_440a:
    ld a, $01
    ld [$c685], a
    ld e, $25
    call Call_000_015c
    call Call_000_0165
    ld a, [$a459]
    cp $1f
    jr nz, jr_005_4433

    ld e, $5d
    ld b, $04
    ld c, $09
    call Call_000_0156
    ld h, $01
    ld l, $24
    ld b, $0c
    ld c, $03
    call Call_000_0153
    ret


jr_005_4433:
    ld a, [$a456]
    add $48
    ld e, a
    ld b, $04
    ld c, $09
    call Call_000_0156
    ld h, $01
    ld l, $24
    ld b, $0c
    ld c, $01
    call Call_000_0153
    ld a, [$a457]
    inc a
    call Call_005_62de
    ld a, e
    swap a
    and $0f
    add $81
    ld [$d16e], a
    ld a, e
    and $0f
    add $81
    ld [$d16f], a
    ld h, $01
    ld l, $6e
    ld b, $02
    ld c, $01
    jp Jump_000_0153


    ret


Jump_005_4470:
    ld a, [$a0ec]
    ld [$c685], a
    ld a, $15
    ld [SCREEN_SUBSTATE], a
    ret


    ldh a, [$ff8d]
    and $02
    jr nz, jr_005_4488

    ldh a, [$ff8d]
    and $01
    jr z, jr_005_449d

jr_005_4488:
    ld a, $08
    call Call_000_0162
    ld a, [$c685]
    cp $01
    jp z, Jump_005_449a

    ld a, $02
    ld [SOUND_CONTROL], a

Jump_005_449a:
    jp Jump_000_0165


jr_005_449d:
    call Call_005_5d43
    ldh a, [$ff8d]
    and $10
    jr z, jr_005_44b9

    call Call_005_5d69
    ld a, [$c685]
    xor $01
    ld [$c685], a
    call Call_005_5d43
    ld a, $03
    ldh [$ffa1], a
    ret


jr_005_44b9:
    ldh a, [$ff8d]
    and $20
    ret z

    call Call_005_5d69
    ld a, [$c685]
    xor $01
    ld [$c685], a
    call Call_005_5d43
    ld a, $03
    ldh [$ffa1], a
    ret


    ld a, $01
    call Call_000_0168
    or a
    ret z

    ld a, [$c685]
    cp $01
    jp z, Jump_005_450f

    xor a
    ld [$a456], a
    ld [$c6db], a
    ld [$a457], a
    ld [$c6dc], a
    ld [$a458], a
    ld [$c5c4], a
    ld a, $ff
    ld [$a459], a
    ld [$c67e], a
    ld a, $01
    ld [$a0ec], a
    call Call_005_61c4
    ld a, [$a0ec]
    ld [$c685], a
    ld a, $15
    ld [SCREEN_SUBSTATE], a
    ret


Jump_005_450f:
    ld a, $08
    call Call_000_0162
    call GBC_PuzzleMenuReload   ; was: xor a / ld [$c685],a / call Call_005_5d14
    nop                         ;      / ld e,$24 / call Call_000_015c (iso-size)
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, $01
    ld [SCREEN_SUBSTATE], a
    ret


    ldh a, [$ff8d]
    and $02
    jr z, jr_005_453c

    ld a, $08
    call Call_000_0162
    ld a, $01
    ld [$c685], a
    ld a, $06
    ld [SCREEN_SUBSTATE], a
    ret


jr_005_453c:
    ldh a, [$ff8d]
    and $01
    ret z

    xor a
    ld [$c6db], a
    ld [$c6dc], a
    ld [$c5c4], a
    ld a, [$a459]
    ld [$c67e], a
    cp $1f
    jr z, jr_005_4567

    ld a, [$a456]
    ld [$c6db], a
    ld a, [$a457]
    ld [$c6dc], a
    ld a, [$a458]
    ld [$c5c4], a

jr_005_4567:
    ld hl, $c603
    xor a
    ld [hl+], a
    ld [hl], a
    ld a, $08
    call Call_000_0162
    ld a, $02
    ld [SOUND_CONTROL], a
    jp Jump_000_0165


    ld a, $01
    call Call_000_0168
    or a
    ret z

    ld a, [$a0ec]
    ld [$c685], a
    ld a, $15
    ld [SCREEN_SUBSTATE], a
    ret


    ld a, [$c67f]
    or a
    jr z, jr_005_4596

    call Call_000_01b9

jr_005_4596:
    ld a, $08
    call Call_000_0159
    ld e, $2c
    call Call_000_015c
    xor a
    ld [$c6db], a
    ld [$c6dc], a
    ld [$c72d], a
    ld a, [$c67e]
    push af
    cp $ff
    jr nz, jr_005_45b7

    ld a, $00
    ld [$c67e], a

jr_005_45b7:
    ld a, [$c67e]
    and $0f
    cp $0f
    jp z, Jump_005_4651

    ld hl, $c200
    ld a, $11
    ld [hl], a
    ld hl, $c202
    ld a, $54
    ld [hl], a
    ld hl, $c203
    ld a, $54
    ld [hl], a
    ld hl, $c204
    ld a, [$c67e]
    and $01
    jr z, jr_005_45e1

    ld a, $bc
    jr jr_005_45e3

jr_005_45e1:
    ld a, $bb

jr_005_45e3:
    ld [hl], a
    ld hl, $c220
    ld a, $11
    ld [hl], a
    ld hl, $c222
    ld a, $74
    ld [hl], a
    ld hl, $c223
    ld a, $54
    ld [hl], a
    ld hl, $c224
    ld a, [$c67e]
    and $02
    jr z, jr_005_4604

    ld a, $bc
    jr jr_005_4606

jr_005_4604:
    ld a, $bb

jr_005_4606:
    ld [hl], a
    ld hl, $c240
    ld a, $11
    ld [hl], a
    ld hl, $c242
    ld a, $2c
    ld [hl], a
    ld hl, $c243
    ld a, $5c
    ld [hl], a
    ld hl, $c244
    ld a, [$c67e]
    and $04
    jr z, jr_005_4627

    ld a, $bc
    jr jr_005_4629

jr_005_4627:
    ld a, $bb

jr_005_4629:
    ld [hl], a
    ld hl, $c260
    ld a, $11
    ld [hl], a
    ld hl, $c262
    ld a, $4c
    ld [hl], a
    ld hl, $c263
    ld a, $4c
    ld [hl], a
    ld hl, $c264
    ld a, [$c67e]
    and $08
    jr z, jr_005_464a

    ld a, $bc
    jr jr_005_464c

jr_005_464a:
    ld a, $bb

jr_005_464c:
    ld [hl], a
    pop af
    jp Jump_005_466a


Jump_005_4651:
    pop af
    ld hl, $c260
    ld a, $11
    ld [hl], a
    ld hl, $c262
    ld a, $3c
    ld [hl], a
    ld hl, $c263
    ld a, $4c
    ld [hl], a
    ld hl, $c264
    ld a, $bb
    ld [hl], a

Jump_005_466a:
    ld hl, $c1e0
    ld a, $11
    ld [hl], a
    ld hl, $c1e2
    ld a, $20
    ld [hl], a
    ld hl, $c1e3
    ld a, $40
    ld [hl], a
    ld hl, $c1e4
    ld a, $bd
    ld [hl], a
    ld a, [$c67e]
    cp $ff
    jr z, jr_005_469e

    ld b, $04
    ld a, [$c67e]

jr_005_468e:
    srl a
    jr nc, jr_005_469e

    push af
    ld a, [$c6db]
    inc a
    ld [$c6db], a
    pop af
    dec b
    jr nz, jr_005_468e

jr_005_469e:
    ld a, [$c67e]
    cp $ff
    jr z, jr_005_46b0

    and $0f
    cp $0f
    jr nz, jr_005_46b0

    ld a, $04
    ld [$c6db], a

jr_005_46b0:
    call Call_005_4763
    call Call_005_5d8f
    ld a, $05
    ldh [$ffa0], a
    ld a, $08
    call Call_000_0162
    jp Jump_000_0165


    ld a, $01
    ld [RENDER_REQUEST], a
    ld a, [$c5db]
    and $07
    jr nz, jr_005_46d5

    ld hl, $c1e0
    ld a, [hl]
    xor $01
    ld [hl], a

jr_005_46d5:
    call Call_005_4763
    ldh a, [$ff8d]
    and $01
    jr z, jr_005_46eb

    ld a, $08
    call Call_000_0162
    ld a, $02
    ld [SOUND_CONTROL], a
    jp Jump_000_0165


jr_005_46eb:
    ld a, [$c6db]
    cp $04
    ret z

    call Call_005_5d8f
    ldh a, [$ff8d]
    and $10
    jr z, jr_005_470e

    ld a, [$c6db]
    push af
    call Call_005_4727
    pop bc
    ld a, [$c6db]
    cp b
    ret z

    ld a, $03
    ldh [$ffa1], a
    jp Jump_005_4763


jr_005_470e:
    ldh a, [$ff8d]
    and $20
    ret z

    ld a, [$c6db]
    push af
    call Call_005_4739
    pop bc
    ld a, [$c6db]
    cp b
    ret z

    ld a, $03
    ldh [$ffa1], a
    jp Jump_005_4763


Call_005_4727:
jr_005_4727:
    ld a, [$c6db]
    inc a
    cp $04
    jr nz, jr_005_4730

    xor a

jr_005_4730:
    ld [$c6db], a
    call Call_005_474c
    jr nz, jr_005_4727

    ret


Call_005_4739:
jr_005_4739:
    ld a, [$c6db]
    dec a
    cp $ff
    jr nz, jr_005_4743

    ld a, $03

jr_005_4743:
    ld [$c6db], a
    call Call_005_474c
    jr nz, jr_005_4739

    ret


Call_005_474c:
    ld a, [$c67e]
    cp $ff
    ret z

    ld hl, $4780
    ld a, [$c6db]
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, [$c67e]
    and b
    ret


Call_005_4763:
Jump_005_4763:
    ld hl, $4788
    ld a, [$c6db]
    ld d, $00
    ld e, a
    sla e
    rl d
    add hl, de
    ld a, [hl+]
    push hl
    ld hl, $c1e2
    ld [hl], a
    pop hl
    ld a, [hl]
    ld hl, $c1e3
    ld [hl], a
    jp Jump_005_5d8f


    ld bc, $0402
    ld [$2010], sp
    ld b, b
    add b
    ld d, h
    ld d, h
    ld [hl], h
    ld d, h
    inc l
    ld e, h
    ld c, h
    ld c, h
    inc a
    ld c, h
    ld a, $01
    call Call_000_0168
    or a
    ret z

    xor a
    ld [$c6dc], a
    ld [$c5c4], a
    ld hl, $47b7
    ld d, $00
    ld a, [$c6db]
    ld e, a
    add hl, de
    ld a, [hl]
    ld [$c5c4], a
    call Call_005_628d
    call Call_000_0174
    jp Jump_000_0165


    nop
    inc d
    jr z, @+$3e

    ld d, b
    ld a, [$c6db]
    cp $04
    jr z, jr_005_47e1

    ld a, [$c67f]
    or a
    jr z, jr_005_47cc

    call Call_000_01bc

jr_005_47cc:
    ld a, $0a
    call Call_000_0159
    ld a, [$c6db]
    add $11
    call Call_000_0159
    ld e, $2f
    call Call_000_015c
    jp Jump_005_47f4


jr_005_47e1:
    ld a, [$c67f]
    or a
    jr z, jr_005_47ea

    call Call_000_01e0

jr_005_47ea:
    ld a, $0f
    call Call_000_0159
    ld e, $3c
    call Call_000_015c

Jump_005_47f4:
    ld a, $16
    ldh [$ffa0], a
    call Call_000_016b
    ld a, $08
    call Call_000_0162
    jp Jump_000_0165


    ld a, $00
    call Call_000_0168
    or a
    ret z

    ld a, $6c
    ld [ANIM_FRAME], a
    jp Jump_000_0165


    ldh a, [$ff8d]
    and $0f
    jr nz, jr_005_4820

    ld a, [ANIM_FRAME]
    dec a
    ld [ANIM_FRAME], a
    ret nz

jr_005_4820:
    xor a
    ld [ANIM_FRAME], a
    ld a, $08
    call Call_000_0162
    jp Jump_000_0165


    ld a, $01
    call Call_000_0168
    or a
    ret z

    ld a, [$c6db]
    cp $04
    jr z, jr_005_4843

    add $38
    ld e, a
    call Call_000_015c
    jp Jump_005_4848


jr_005_4843:
    ld e, $3d
    call Call_000_015c

Jump_005_4848:
    ld a, $6c
    ld [ANIM_FRAME], a
    ld a, $08
    call Call_000_0162
    jp Jump_000_0165


    ldh a, [$ff8d]
    and $0f
    jr nz, jr_005_4863

    ld a, [ANIM_FRAME]
    dec a
    ld [ANIM_FRAME], a
    ret nz

jr_005_4863:
    xor a
    ld [ANIM_FRAME], a
    ld a, $08
    call Call_000_0162
    ld a, $02
    ld [SOUND_CONTROL], a
    jp Jump_000_0165


    ld a, $01
    call Call_000_0168
    or a
    ret z

    ld a, $06
    ld [GAME_STATE], a
    xor a
    ld [SCREEN_SUBSTATE], a
    ret


    ld a, [$c67f]
    or a
    jr z, jr_005_488e

    call Call_000_01dd

jr_005_488e:
    ld a, $03
    call Call_000_0159
    ld e, $5c
    call Call_000_015c
    ld a, $04
    ldh [$ffa0], a
    ld a, $08
    call Call_000_0162
    jp Jump_000_0165


    ldh a, [$ff8d]
    and $01
    jr z, jr_005_48b7

    ld a, $08
    call Call_000_0162
    ld a, $02
    ld [SOUND_CONTROL], a
    jp Jump_000_0165


jr_005_48b7:
    call $5ceb
    ldh a, [$ff8d]
    and $40
    jr z, jr_005_48d9

    ld a, [$c685]
    cp $00
    jr z, jr_005_48d9

    call Call_005_5d05
    ld a, [$c685]
    dec a
    ld [$c685], a
    call $5ceb
    ld a, $03
    ldh [$ffa1], a
    ret


jr_005_48d9:
    ldh a, [$ff8d]
    and $80
    ret z

    ld a, [$c685]
    cp $03
    ret z

    call Call_005_5d05
    ld a, [$c685]
    inc a
    ld [$c685], a
    call $5ceb
    ld a, $03
    ldh [$ffa1], a
    ret


    ld a, $01
    call Call_000_0168
    or a
    ret z

    ld a, [$c685]
    ld [$a0ec], a
    call Call_005_61c4
    ld a, [$c686]
    or a
    jr nz, jr_005_4912

    ld a, $0a
    ld [SCREEN_SUBSTATE], a
    ret


jr_005_4912:
    ld a, $06
    ld [GAME_STATE], a
    xor a
    ld [SCREEN_SUBSTATE], a
    ld [$c72d], a
    ret


    ld a, [SCREEN_SUBSTATE]
    ld hl, $4932
    ld d, $00
    ld e, a
    sla e
    rl d
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


    ret


    ld c, h
    ld c, c
    add c
    ld e, d
    add c
    ld c, c
    call nc, $b049
    ld c, d
    jp $964a


    ld c, e
    adc $4b
    call c, $024b
    ld d, b
    cpl
    ld d, b
    ld l, b
    ld d, l
    ld a, a
    ld d, l
    ld a, [$c67f]
    or a
    jr z, jr_005_4955

    call Call_000_01dd

jr_005_4955:
    ld a, $09
    call Call_000_0159
    ld a, $05
    call Call_000_0159
    ld e, $2e
    call Call_000_015c
    call Call_000_016b
    xor a
    ld [$c685], a
    ld a, $08
    call Call_000_0162
    ld a, $04
    ldh [$ffa0], a
    call Call_000_0174
    xor a
    ld [$c685], a
    call Call_005_5cb5
    jp Jump_000_0165


    ldh a, [$ff8d]
    and $01
    jr z, jr_005_4995

    ld a, $08
    call Call_000_0162
    ld a, $02
    ld [SOUND_CONTROL], a
    call Call_000_0165
    ret


jr_005_4995:
    call Call_005_5cb5
    ldh a, [$ff8d]
    and $40
    jr z, jr_005_49b7

    ld a, [$c685]
    cp $00
    jr z, jr_005_49b7

    call Call_005_5cd4
    ld a, [$c685]
    dec a
    ld [$c685], a
    call Call_005_5cb5
    ld a, $03
    ldh [$ffa1], a
    ret


jr_005_49b7:
    ldh a, [$ff8d]
    and $80
    ret z

    ld a, [$c685]
    cp $02
    ret z

    call Call_005_5cd4
    ld a, [$c685]
    inc a
    ld [$c685], a
    call Call_005_5cb5
    ld a, $03
    ldh [$ffa1], a
    ret


    ld a, $01
    call Call_000_0168
    or a
    ret z

    ld a, [$c685]
    cp $00
    jr z, jr_005_4a46

    dec a
    jr z, jr_005_4a14

    ld a, [$c67f]
    or a
    jr z, jr_005_49ee

    call Call_000_01b0

jr_005_49ee:
    ld a, $09
    call Call_000_0159
    ld a, $01
    call Call_000_0159
    ld hl, $4fc0
    ld de, $9000
    ld bc, $0550
    call Call_000_0177
    ld e, $21
    call Call_000_015c
    ld a, $02
    ld [GAME_STATE], a
    ld a, $01
    ld [SCREEN_SUBSTATE], a
    ret


jr_005_4a14:
    ld a, [$c67f]
    or a
    jr z, jr_005_4a1d

    call Call_000_01d1

jr_005_4a1d:
    ld a, $09
    call Call_000_0159
    ld a, $03
    call Call_000_0159
    ld b, $00
    ld c, $00
    ld e, $23
    call Call_000_0156
    ld h, $00
    ld l, $00
    ld b, $14
    ld c, $20
    call Call_000_0153
    ld a, $08
    call Call_000_0162
    ld a, $07
    ld [SCREEN_SUBSTATE], a
    ret


jr_005_4a46:
    ld a, [$c67f]
    or a
    jr z, jr_005_4a4f

    call Call_000_01c8

jr_005_4a4f:
    ld hl, $c1e0
    ld a, $11
    ld [hl], a
    ld hl, $c1e4
    ld [hl], $77
    ld a, $00
    ld [$c688], a
    ld a, $0f
    ld [$c689], a
    ld a, $00
    ld [$c68a], a
    ld hl, $c200
    ld a, $11
    ld [hl], a
    ld hl, $c204
    ld [hl], $78
    ld a, $10
    ld [$c68b], a
    ld a, $90
    ld [$c68c], a
    ld a, $79
    ld [$c68d], a
    call Call_005_5dd7
    call Call_005_5da7
    ld e, $2d
    call Call_000_015c
    ld a, $08
    call Call_000_0162
    xor a
    ld [$c6da], a
    ld [$c5ac], a
    ld a, $03
    ld [$c6c7], a
    xor a
    ld [$c6c6], a
    call Call_000_017d
    ld a, $10
    ldh [$ffa0], a
    ld [$c840], a
    jp Jump_000_0165


    ld a, $01
    ld [RENDER_REQUEST], a
    ld a, $00
    call Call_000_0168
    or a
    ret z

    xor a
    ld [$c685], a
    jp Jump_000_0165


    ld a, $ff
    ld [$c694], a
    xor a
    ld [$c692], a
    ld a, $58
    ld [$c68b], a
    ld a, $90
    ld [$c68c], a
    call Call_005_5da7
    ldh a, [$ff8d]
    and $01
    jr z, jr_005_4b3b

    ld a, $04
    ldh [$ffa1], a
    ld a, [$c685]
    cp $07
    jr nz, jr_005_4af8

    ld a, $08
    call Call_000_0162
    ld a, $02
    ld [SOUND_CONTROL], a
    call Call_000_0165
    ret


jr_005_4af8:
    ld a, $0a
    ld [SCREEN_SUBSTATE], a
    ld e, $40
    ld a, [$c685]
    cp $00
    jr z, jr_005_4b1a

    cp $01
    jr z, jr_005_4b1a

    cp $02
    jr z, jr_005_4b18

    cp $06
    jr z, jr_005_4b13

    ret


jr_005_4b13:
    ld e, $0c
    jp Jump_005_4b1a


jr_005_4b18:
    ld e, $42

Jump_005_4b1a:
jr_005_4b1a:
    ld b, $0d
    ld c, $0d
    call Call_000_0156
    ld h, $01
    ld l, $ac
    ld b, $08
    ld c, $04
    call Call_000_0153
    ld a, [$c685]
    cp $02
    ret nz

    ld a, $01
    ld [$c686], a
    call Call_005_5fed
    ret


jr_005_4b3b:
    ldh a, [$ff8d]
    and $10
    jr z, jr_005_4b53

    ld a, $03
    ldh [$ffa1], a
    ld a, [$c685]
    cp $07
    jr nz, jr_005_4b4e

    ld a, $ff

jr_005_4b4e:
    inc a
    ld [$c685], a
    ret


jr_005_4b53:
    ldh a, [$ff8d]
    and $20
    jr z, jr_005_4b6b

    ld a, $03
    ldh [$ffa1], a
    ld a, [$c685]
    cp $00
    jr nz, jr_005_4b66

    ld a, $08

jr_005_4b66:
    dec a
    ld [$c685], a
    ret


jr_005_4b6b:
    ldh a, [$ff8d]
    and $40
    jr z, jr_005_4b80

    ld a, $03
    ldh [$ffa1], a
    ld a, [$c685]
    sub $02
    and $07
    ld [$c685], a
    ret


jr_005_4b80:
    ldh a, [$ff8d]
    and $80
    jr z, jr_005_4b95

    ld a, $03
    ldh [$ffa1], a
    ld a, [$c685]
    add $02
    and $07
    ld [$c685], a
    ret


jr_005_4b95:
    ret


    ld a, $01
    call Call_000_0168
    or a
    ret z

    ld a, [$c67f]
    or a
    jr z, jr_005_4ba6

    call Call_000_01dd

jr_005_4ba6:
    ld a, $09
    call Call_000_0159
    ld a, $05
    call Call_000_0159
    ld e, $2e
    call Call_000_015c
    ld a, $08
    call Call_000_0162
    xor a
    ld [$c685], a
    call Call_005_5cb5
    call Call_000_0174
    ld a, $04
    ldh [$ffa0], a
    ld a, $01
    ld [SCREEN_SUBSTATE], a
    ret


    ld a, $00
    call Call_000_0168
    or a
    ret z

    xor a
    ld [$c692], a
    jp Jump_000_0165


    ld a, [$c692]
    ld hl, $4bef
    ld d, $00
    ld e, a
    sla e
    rl d
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


    ret


    dec bc
    ld c, h
    ld e, $4c
    or a
    ld c, h
    ld [$374c], a
    ld c, l
    ld e, c
    ld c, l
    jp nc, $ef4d

    ld c, l
    xor [hl]
    ld c, [hl]
    call $de4e
    ld c, [hl]
    ccf
    ld c, a
    ld e, b
    ld c, a
    ld a, e
    ld c, a
    xor a
    ld hl, $c5f9
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    xor a
    ld [$c5c4], a
    jp Jump_005_4fa7


    ld hl, $a0d8
    ld d, $00
    ld a, [$c5c4]
    ld e, a
    sla e
    rl d
    add hl, de
    ld de, $c601
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
    ld a, $10
    ldh [$ffa0], a
    ld [$c840], a
    call Call_000_0180
    call Call_000_0174
    call Call_000_0189
    call Call_000_018c
    call Call_000_018f
    call Call_000_0192
    call Call_005_4fa7
    ld a, $00
    ld [ANIM_FRAME], a
    ld b, $01
    ld c, $00
    ld e, $47
    call Call_000_0156
    ld h, $00
    ld l, $01
    ld b, $10
    ld c, $11
    call Call_000_0153
    ld a, [$c5c4]
    add $01
    ld c, $00

jr_005_4c70:
    ld b, a
    sub $0a
    jr c, jr_005_4c78

    inc c
    jr jr_005_4c70

jr_005_4c78:
    ld a, c
    or a
    jr nz, jr_005_4c93

    push bc
    ld b, $03
    ld c, $07
    ld e, $80
    call Call_000_0156
    pop bc
    ld a, b
    add $81
    ld b, $09
    ld c, $07
    ld e, a
    call Call_000_0156
    ret


jr_005_4c93:
    push bc
    ld b, $02
    ld c, $07
    ld e, $80
    call Call_000_0156
    pop bc
    push bc
    ld a, c
    add $81
    ld b, $08
    ld c, $07
    ld e, a
    call Call_000_0156
    pop bc
    ld a, b
    add $81
    ld b, $09
    ld c, $07
    ld e, a
    call Call_000_0156
    ret


    ld a, $01
    ld [RENDER_REQUEST], a
    ld a, [ANIM_FRAME]
    cp $78
    jr z, jr_005_4cc8

    inc a
    ld [ANIM_FRAME], a
    ret


jr_005_4cc8:
    call Call_005_4faf
    ld hl, $c0e5
    ld a, $51
    ld [hl], a
    ld hl, $c1a5
    ld a, $54
    ld [hl], a
    ld a, $00
    ld [$c1b4], a
    ld a, $02
    ld [$c734], a
    ld a, $01
    ld [$c73d], a
    call Call_005_4fa7
    ret


    call Call_000_0195
    or a
    ret nz

    call Call_000_0183
    ld a, [$c116]
    or a
    call z, Call_000_017d
    call Call_000_0186
    call Call_000_01ef
    ld a, [$c69a]
    or a
    jr z, jr_005_4d12

    ldh a, [$ff8c]
    and $44
    cp $44
    jr nz, jr_005_4d12

    ld a, $02
    ld [$c0bc], a

jr_005_4d12:
    ld hl, $c0bc
    ld a, [hl]
    or a
    ret z

    cp $02
    jr z, jr_005_4d2c

    ld a, $00
    ld [ANIM_FRAME], a
    call Call_000_0174
    call Call_005_4fa7
    ld a, $13
    ldh [$ffa0], a
    ret


jr_005_4d2c:
    ld a, $08
    call Call_000_0162
    ld a, $0a
    ld [$c692], a
    ret


    ld a, $3c
    ld [ANIM_FRAME], a
    ld a, $0a
    ld [$c5a5], a
    ld b, $01
    ld c, $04
    ld e, $60
    call Call_000_0156
    ld h, $00
    ld l, $00
    ld b, $14
    ld c, $12
    call Call_000_0153
    call Call_005_4fa7
    ret


    ldh a, [$ff8d]
    and $08
    jr z, jr_005_4d7f

    ld b, $01
    ld c, $00
    ld e, $47
    call Call_000_0156
    ld h, $00
    ld l, $01
    ld b, $0a
    ld c, $11
    call Call_000_0153
    ld a, $01
    ldh [$ffa0], a
    xor a
    ld [ANIM_FRAME], a
    call Call_005_4fa7
    ret


jr_005_4d7f:
    ldh a, [$ff8d]
    and $01
    jr z, jr_005_4d8a

    ld a, $3c
    ld [ANIM_FRAME], a

jr_005_4d8a:
    ld a, [ANIM_FRAME]
    cp $3c
    jr z, jr_005_4d96

    inc a
    ld [ANIM_FRAME], a
    ret


jr_005_4d96:
    ld a, $00
    ld [ANIM_FRAME], a
    ld a, [$c5a5]
    sub $01
    jr c, jr_005_4dbf

    ld [$c5a5], a
    add $61
    ld b, $0a
    ld c, $04
    ld e, a
    call Call_000_0156
    ld h, $00
    ld l, $01
    ld b, $0a
    ld c, $12
    call Call_000_0153
    ld a, $17
    ldh [$ffa1], a
    ret


jr_005_4dbf:
    ld a, $00
    ld [ANIM_FRAME], a
    ld [$c5a5], a
    call Call_005_4fa7
    call Call_005_4fa7
    ld a, $01
    ldh [$ffa0], a
    ret


    ld a, [ANIM_FRAME]
    inc a
    ld [ANIM_FRAME], a
    cp $05
    ret nz

    ld hl, $c5fd
    ld a, $00
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl], $01
    call Call_000_0189
    ld a, $01
    ld [$c692], a
    ret


    ld de, $c0a0
    ld hl, $0014
    add hl, de
    ld a, [hl]
    cp $2d
    jp z, Jump_005_4e33

    ld hl, $0014
    add hl, de
    ld a, [hl]
    ld hl, $4e54
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
    call Call_000_0153
    ret


Jump_005_4e33:
    ld a, $15
    ldh [$ffa0], a
    ld b, $04
    ld c, $06
    ld e, $03
    call Call_000_0156
    ld h, $00
    ld l, $01
    ld b, $0a
    ld c, $12
    call Call_000_0153
    ld a, $00
    ld [ANIM_FRAME], a
    call Call_005_4fa7
    ret


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

    ld a, [ANIM_FRAME]
    cp $b4
    jr z, jr_005_4eba

    inc a
    ld [ANIM_FRAME], a
    ret


jr_005_4eba:
    ld a, $00
    ld [ANIM_FRAME], a
    ld a, $08
    call Call_000_0162
    ld a, $02
    ld [SOUND_CONTROL], a
    call Call_005_4fa7
    ret


    ld a, $01
    call Call_000_0168
    or a
    ret z

    xor a
    ld [SCREEN_SUBSTATE], a
    ld a, $08
    ld [GAME_STATE], a
    ret


    ld a, $01
    call Call_000_0168
    or a
    ret z

    call Call_005_62b0
    xor a
    ld [$c5ed], a
    ld b, $00
    ld c, $00
    ld e, $23
    call Call_000_0156
    ld h, $00
    ld l, $01
    ld b, $14
    ld c, $11
    call Call_000_0153
    ld a, $08
    call Call_000_0162
    call Call_000_0174
    ld a, [$c5c4]
    cp $09
    jr z, jr_005_4f13

    call Call_005_4fa7
    ret


jr_005_4f13:
    ld a, [$c67f]
    or a
    jr z, jr_005_4f1c

    call Call_000_01d4

jr_005_4f1c:
    ld b, $01
    ld c, $04
    ld e, $4e
    call Call_000_0156
    ld a, $20
    call Call_000_0162
    xor a
    ld [ANIM_FRAME], a
    ld [$c5ec], a
    ld [$c5ed], a
    ld a, $18
    ldh [$ffa0], a
    call Call_005_4fa7
    call Call_005_4fa7
    ret


    ld a, $01
    ld [RENDER_REQUEST], a
    ld a, $00
    call Call_000_0168
    or a
    ret z

    ld a, [$c5c4]
    inc a
    ld [$c5c4], a
    ld a, $01
    ld [$c692], a
    ret


    ld a, $01
    ld [RENDER_REQUEST], a
    ld a, $00
    call Call_000_0168
    or a
    ret z

    ld a, [ANIM_FRAME]
    inc a
    ld [ANIM_FRAME], a
    cp $ff
    ret nz

    ld a, $20
    call Call_000_0162
    xor a
    ld [$c5a5], a
    call Call_005_4fa7
    ret


    ld a, [ANIM_FRAME]
    or a
    jr z, jr_005_4f86

    dec a
    ld [ANIM_FRAME], a
    ret


jr_005_4f86:
    ld a, [$c5a5]
    or a
    jr nz, jr_005_4f96

    ld a, $02
    ld [SOUND_CONTROL], a
    ld a, $01
    ld [$c5a5], a

jr_005_4f96:
    ld a, $01
    call Call_000_0168
    or a
    ret z

    xor a
    ld [SCREEN_SUBSTATE], a
    ld a, $08
    ld [GAME_STATE], a
    ret


Call_005_4fa7:
Jump_005_4fa7:
    ld a, [$c692]
    inc a
    ld [$c692], a
    ret


Call_005_4faf:
    ld hl, $a42e
    ld d, $00
    ld a, [$c5c4]
    ld e, a
    sla e
    rl d
    sla e
    rl d
    add hl, de
    ld a, [hl+]
    ld [$c688], a
    ld a, [hl+]
    ld [$c689], a
    ld a, [hl+]
    ld [$c68a], a
    ld a, [hl+]
    ld [$c6c6], a
    ld hl, $60df
    ld d, $00
    ld a, [$c5c4]
    ld e, a
    sla e
    rl d
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld de, $c6dd
    ld bc, $004b

jr_005_4fe8:
    ld a, [hl+]
    ld [de], a
    inc de
    dec bc
    ld a, b
    or c
    jr nz, jr_005_4fe8

    ld h, $00
    ld l, $01
    ld b, $0a
    ld c, $11
    call Call_000_0153
    ld de, $c6dd
    call Call_005_546c
    ret


    ld a, $01
    call Call_000_0168
    or a
    ret z

    ld a, $09
    call Call_000_0159
    ld a, $01
    call Call_000_0159
    ld hl, $4fc0
    ld de, $9000
    ld bc, $0550
    call Call_000_0177
    ld e, $21
    call Call_000_015c
    ld a, $02
    ld [GAME_STATE], a
    ld a, $01
    ld [SCREEN_SUBSTATE], a
    ret


    ldh a, [$ff8d]
    and $08
    jr z, jr_005_5073

    ld a, $05
    ldh [$ffa1], a
    ld a, [$c685]
    cp $03
    jr nz, jr_005_504a

    xor a
    ld [$c220], a
    ld [$c240], a
    jp Jump_005_5e54


jr_005_504a:
    ld a, [$c685]
    cp $06
    jr nz, jr_005_5058

    ld a, $01
    ld [$c0bc], a
    jr jr_005_5073

jr_005_5058:
    ld a, [$c685]
    cp $00
    jr nz, jr_005_5065

    call Call_005_5ec5
    jp Jump_005_5e54


jr_005_5065:
    ld a, [$c685]
    cp $01
    jp nz, Jump_005_5e54

    call Call_005_5ec5
    jp Jump_005_5e54


jr_005_5073:
    ld a, [$c685]
    cp $00
    jp z, Jump_005_5094

    dec a
    jp z, Jump_005_5094

    dec a
    jp z, Jump_005_515b

    dec a
    jp z, Jump_005_52db

    dec a
    jp z, Jump_005_515e

    dec a
    jp z, Jump_005_5202

    dec a
    jp z, Jump_005_5499

    ret


Jump_005_5094:
    ldh a, [$ff8d]
    and $01
    jr z, jr_005_50ba

    ld e, $41
    ld b, $0d
    ld c, $0d
    call Call_000_0156
    ld h, $01
    ld l, $ac
    ld b, $08
    ld c, $04
    call Call_000_0153
    ld a, $01
    ld [$c686], a
    call Call_005_5fed
    call Call_000_0165
    ret


jr_005_50ba:
    call Call_005_50f1
    call Call_005_5123
    ldh a, [$ff8d]
    and $10
    jr z, jr_005_50d8

    ld a, $03
    ldh [$ffa1], a
    ld a, [$c687]
    cp $09
    jr nz, jr_005_50d3

    ld a, $ff

jr_005_50d3:
    inc a
    ld [$c687], a
    ret


jr_005_50d8:
    ldh a, [$ff8d]
    and $20
    jr z, jr_005_50f0

    ld a, $03
    ldh [$ffa1], a
    ld a, [$c687]
    cp $00
    jr nz, jr_005_50eb

    ld a, $0a

jr_005_50eb:
    dec a
    ld [$c687], a
    ret


jr_005_50f0:
    ret


Call_005_50f1:
    ld a, [$c687]
    add $01
    daa
    ld b, a
    and $f0
    swap a
    sla a
    ld c, $a8
    add c
    ld [$d1cf], a
    inc a
    ld [$d1ef], a
    ld a, b
    and $0f
    sla a
    ld c, $a8
    add c
    ld [$d1d0], a
    inc a
    ld [$d1f0], a
    ld h, $01
    ld l, $cf
    ld b, $02
    ld c, $02
    call Call_000_0153
    ret


Call_005_5123:
    ld a, $01
    ld [RENDER_REQUEST], a
    ld a, [$c694]
    ld b, a
    ld a, [$c687]
    cp b
    ret z

    ld a, [$c694]
    cp $ff
    jr nz, jr_005_5151

    ld de, $c7f2
    call Call_005_5424
    ld hl, $c695
    ld a, [$c688]
    ld [hl+], a
    ld a, [$c689]
    ld [hl+], a
    ld a, [$c68a]
    ld [hl+], a
    ld a, [$c6c6]
    ld [hl], a

jr_005_5151:
    call Call_005_6060
    ld a, [$c687]
    ld [$c694], a
    ret


Jump_005_515b:
    jp Jump_005_5f16


Jump_005_515e:
    call Call_005_5dd7
    ldh a, [$ff8d]
    or a
    jr nz, jr_005_5174

    ld a, [$c7f0]
    inc a
    ld [$c7f0], a
    and $07
    ret nz

    ldh a, [$ff8c]
    or a
    ret z

jr_005_5174:
    ld [$c7f1], a
    xor a
    ld [$c7f0], a
    ldh a, [$ff8d]
    and $01
    jr z, jr_005_518b

    ld a, $04
    ldh [$ffa1], a
    ld a, $05
    ld [SCREEN_SUBSTATE], a
    ret


jr_005_518b:
    ld a, [$c7f1]
    and $10
    jr z, jr_005_51a2

    ld a, [$c688]
    cp $08
    jr z, jr_005_51a2

    inc a
    ld [$c688], a
    ld a, $03
    ldh [$ffa1], a
    ret


jr_005_51a2:
    ld a, [$c7f1]
    and $20
    jr z, jr_005_51b9

    ld a, [$c688]
    cp $00
    jr z, jr_005_51b9

    dec a
    ld [$c688], a
    ld a, $03
    ldh [$ffa1], a
    ret


jr_005_51b9:
    ld a, [$c7f1]
    and $40
    jr z, jr_005_51d8

    ld a, [$c6c6]
    ld b, a
    ld a, [$c689]
    sub $04
    cp b
    jr z, jr_005_51d8

    ld a, [$c689]
    dec a
    ld [$c689], a
    ld a, $03
    ldh [$ffa1], a
    ret


jr_005_51d8:
    ld a, [$c7f1]
    and $80
    jp z, Jump_005_51ef

    ld a, [$c689]
    cp $0f
    jr z, jr_005_51ef

    inc a
    ld [$c689], a
    ld a, $03
    ldh [$ffa1], a

Jump_005_51ef:
jr_005_51ef:
    ldh a, [$ff8d]
    and $04
    ret z

    ld a, [$c68a]
    inc a
    and $01
    ld [$c68a], a
    ld a, $03
    ldh [$ffa1], a
    ret


Jump_005_5202:
    ldh a, [$ff8d]
    or a
    jr nz, jr_005_5215

    ld a, [$c7f0]
    inc a
    ld [$c7f0], a
    and $07
    ret nz

    ldh a, [$ff8c]
    or a
    ret z

jr_005_5215:
    ld [$c7f1], a
    xor a
    ld [$c7f0], a
    xor a
    ld [$c6da], a
    ld [$c5ac], a
    ld a, $03
    ld [$c6c7], a
    ldh a, [$ff8d]
    and $01
    jr z, jr_005_5238

    ld a, $04
    ldh [$ffa1], a
    ld a, $05
    ld [SCREEN_SUBSTATE], a
    ret


jr_005_5238:
    ld a, [$c7f1]
    and $40
    jr z, jr_005_5255

    ld a, [$c6c6]
    cp $00
    jr z, jr_005_5255

    dec a
    ld [$c6c6], a
    call Call_000_017d
    call Call_005_527a
    ld a, $13
    ldh [$ffa1], a
    ret


jr_005_5255:
    ld a, [$c7f1]
    and $80
    ret z

    ld a, [$c6c6]
    ld b, a
    ld a, [$c689]
    sub $04
    cp b
    ret z

    call Call_005_52b3
    or a
    ret nz

    ld a, $13
    ldh [$ffa1], a
    ld a, [$c6c6]
    inc a
    ld [$c6c6], a
    call Call_000_017d
    ret


Call_005_527a:
    ld a, [$c6c6]
    inc a
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
    ld hl, $d061
    add hl, bc
    ld b, $0a
    xor a
    push hl

jr_005_529d:
    ld [hl+], a
    dec b
    jr nz, jr_005_529d

    pop hl
    ld a, h
    and $0f
    ld h, a
    ld a, l
    and $f0
    inc a
    ld l, a
    ld b, $0a
    ld c, $01
    call Call_000_0153
    ret


Call_005_52b3:
    ld a, [$c6c6]
    inc a
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
    ld hl, $d061
    add hl, bc
    ld b, $0a

jr_005_52d4:
    ld a, [hl+]
    or a
    ret nz

    dec b
    jr nz, jr_005_52d4

    ret


Jump_005_52db:
    call Call_005_5e6e
    ldh a, [$ff8d]
    or a
    jr nz, jr_005_52f8

    ld a, [$c694]
    or a
    ret nz

    ld a, [$c7f0]
    inc a
    ld [$c7f0], a
    and $07
    ret nz

    ldh a, [$ff8c]
    or a
    ret z

    jr jr_005_5307

jr_005_52f8:
    ld b, a
    ldh a, [$ff8d]
    and $f0
    jr z, jr_005_5306

    ldh a, [$ff8c]
    and $03
    or b
    jr jr_005_5307

jr_005_5306:
    ld a, b

jr_005_5307:
    ld [$c7f1], a
    xor a
    ld [$c7f0], a
    ld [$c694], a
    ld a, [$c7f1]
    and $01
    jr z, jr_005_5340

    ld a, [$c68b]
    ldh [$ff8f], a
    ld a, [$c68c]
    ldh [$ff8e], a
    call Call_005_53d1
    call Call_005_53fe
    or a
    jr z, jr_005_5340

    ld a, [$c68d]
    add $67
    ld [hl], a
    ld a, h
    and $0f
    ld h, a
    ld b, $01
    ld c, $01
    call Call_000_0153
    ld a, $04
    ldh [$ffa1], a

jr_005_5340:
    ld a, [$c7f1]
    and $02
    jr z, jr_005_5365

    ld a, [$c68b]
    ldh [$ff8f], a
    ld a, [$c68c]
    ldh [$ff8e], a
    call Call_005_53d1
    ld [hl], $00
    ld a, h
    and $0f
    ld h, a
    ld b, $01
    ld c, $01
    call Call_000_0153
    ld a, $04
    ldh [$ffa1], a

jr_005_5365:
    ld a, [$c7f1]
    and $10
    jr z, jr_005_537d

    ld a, [$c68b]
    cp $58
    jr z, jr_005_537d

    add $08
    ld [$c68b], a
    ld a, $03
    ldh [$ffa1], a
    ret


jr_005_537d:
    ld a, [$c7f1]
    and $20
    jr z, jr_005_5395

    ld a, [$c68b]
    cp $10
    jr z, jr_005_5395

    sub $08
    ld [$c68b], a
    ld a, $03
    ldh [$ffa1], a
    ret


jr_005_5395:
    ld a, [$c7f1]
    and $40
    jr z, jr_005_53bb

    ld a, [$c6c6]
    ld b, a
    ld a, [$c68c]
    sub $30
    srl a
    srl a
    srl a
    cp b
    jr z, jr_005_53bb

    ld a, [$c68c]
    sub $08
    ld [$c68c], a
    ld a, $03
    ldh [$ffa1], a
    ret


jr_005_53bb:
    ld a, [$c7f1]
    and $80
    ret z

    ld a, [$c68c]
    cp $90
    ret z

    add $08
    ld [$c68c], a
    ld a, $03
    ldh [$ffa1], a
    ret


Call_005_53d1:
    ldh a, [$ff8e]
    sub $10
    srl a
    srl a
    srl a
    ld de, $0000
    ld e, a
    ld hl, $d000
    ld b, $20

jr_005_53e4:
    add hl, de
    dec b
    jr nz, jr_005_53e4

    ldh a, [$ff8f]
    sub $08
    srl a
    srl a
    srl a
    ld de, $0000
    ld e, a
    add hl, de
    ld a, h
    ldh [$ff90], a
    ld a, l
    ldh [$ff91], a
    ret


Call_005_53fe:
    ld a, [hl]
    or a
    ret nz

    ld d, h
    ld e, l
    ld a, e
    and $f0
    inc a
    ld e, a
    ld b, $0a
    ld c, $00

jr_005_540c:
    ld a, [de]
    or a
    jr z, jr_005_5411

    inc c

jr_005_5411:
    inc de
    dec b
    jr nz, jr_005_540c

    ld a, c
    ld b, $09
    sub b
    jr nc, jr_005_541e

    ld a, $01
    ret


jr_005_541e:
    ld a, $06
    ldh [$ffa1], a
    xor a
    ret


Call_005_5424:
    ld hl, $d041
    ld c, $0f

Jump_005_5429:
    push hl
    ld b, $05

Jump_005_542c:
    ld a, [hl]
    and $f0
    cp $e0
    jr z, jr_005_5438

    ld a, $00
    ld [de], a
    jr jr_005_543f

jr_005_5438:
    ld a, [hl]
    and $0f
    inc a
    swap a
    ld [de], a

jr_005_543f:
    inc hl
    ld a, [hl]
    and $f0
    cp $e0
    jr z, jr_005_5450

    ld a, [de]
    push bc
    ld b, $00
    or b
    pop bc
    ld [de], a
    jr jr_005_545a

jr_005_5450:
    ld a, [hl]
    and $0f
    inc a
    push bc
    ld b, a
    ld a, [de]
    or b
    pop bc
    ld [de], a

jr_005_545a:
    inc hl
    inc de
    dec b
    jp nz, Jump_005_542c

    pop hl
    push de
    ld de, $0020
    add hl, de
    pop de
    dec c
    jp nz, Jump_005_5429

    ret


Call_005_546c:
    ld hl, $d041
    ld c, $0f

jr_005_5471:
    push hl
    ld b, $05

jr_005_5474:
    ld a, [de]
    and $f0
    jr z, jr_005_547e

    swap a
    dec a
    add $e0

jr_005_547e:
    ld [hl], a
    inc hl
    ld a, [de]
    and $0f
    jr z, jr_005_5488

    dec a
    add $e0

jr_005_5488:
    ld [hl], a
    inc hl
    inc de
    dec b
    jr nz, jr_005_5474

    pop hl
    push de
    ld de, $0020
    add hl, de
    pop de
    dec c
    jr nz, jr_005_5471

    ret


Jump_005_5499:
    ld a, [$c692]
    ld hl, $54ac
    ld d, $00
    ld e, a
    sla e
    rl d
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


    ret


    or d
    ld d, h
    add sp, $54
    ld b, $55
    ld de, $c6dd
    call Call_005_5424
    ld a, [$c6c6]
    push af
    call Call_000_0180
    call Call_000_0174
    pop af
    ld [$c6c6], a
    ld [$c693], a
    ld hl, $c0e5
    ld a, $51
    ld [hl], a
    ld hl, $c1a5
    ld a, $54
    ld [hl], a
    ld a, $00
    ld [$c1b4], a
    ld a, $01
    ld [$c73d], a
    ld a, $01
    ld [$c734], a
    ld [$c692], a
    ret


    call Call_000_0183
    call Call_000_017d
    call Call_000_0186
    call Call_000_01ef
    ld a, [$c0bc]
    or a
    ret z

    call Call_000_0174
    xor a
    ld [$c5ac], a
    ld a, $02
    ld [$c692], a
    ret


    ld b, $01
    ld c, $00
    ld e, $47
    call Call_000_0156
    ld de, $c6dd
    call Call_005_546c
    call Call_005_5534
    ld h, $00
    ld l, $01
    ld b, $0a
    ld c, $11
    call Call_000_0153
    xor a
    ld [$c692], a
    ld [$c734], a
    ld a, $10
    ldh [$ffa0], a
    ld [$c840], a
    jp Jump_005_5e54


Call_005_5534:
    ld hl, $c1e0
    ld a, $11
    ld [hl], a
    ld hl, $c1e4
    ld [hl], $77
    ld hl, $c200
    ld a, $11
    ld [hl], a
    call Call_005_5dd7
    call Call_005_5da7
    xor a
    ld [$c220], a
    ld [$c240], a
    xor a
    ld [$c6da], a
    ld [$c5ac], a
    ld a, [$c693]
    ld [$c6c6], a
    ld a, $03
    ld [$c6c7], a
    call Call_000_017d
    ret


    call Call_005_5f16
    ld a, [$c686]
    cp $00
    ret nz

    ld a, [$c685]
    cp $00
    jr z, jr_005_557d

    cp $01
    jr z, jr_005_557e

    ret


jr_005_557d:
    ret


jr_005_557e:
    ret


    ret


    ld a, [SCREEN_SUBSTATE]
    ld hl, $5593
    ld d, $00
    ld e, a
    sla e
    rl d
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


    ret


    xor e
    ld d, l
    reti


    ld d, l
    ld b, $56
    sbc [hl]
    ld d, [hl]
    xor e
    ld d, [hl]
    ret c

    ld d, [hl]
    dec b
    ld d, a
    add $57
    ldh a, [c]
    ld d, a
    add c
    ld e, d
    ld c, $58
    sub l
    ld e, b
    ld a, [$c67f]
    or a
    jp z, Jump_005_55b5

    call Call_000_01b0

Jump_005_55b5:
    ld a, $01
    call Call_000_0159
    ld hl, $4000
    ld de, $9000
    ld bc, $0550
    call Call_000_0177
    ld e, $21
    call Call_000_015c
    ld a, $83
    ldh [rLCDC], a
    xor a
    ld [$c5a8], a
    call Call_000_016b
    jp Jump_000_0165


    call Call_000_0174
    ld a, [$c5a8]
    add $10
    ld e, a
    ld b, $06
    ld c, $0f
    call Call_000_0156
    ld h, $01
    ld l, $e6
    ld b, $08
    ld c, $01
    call Call_000_0153
    ld a, $08
    call Call_000_0162
    ld a, [$c5a8]
    call Call_005_564a
    ld a, $04
    ldh [$ffa0], a
    jp Jump_000_0165


    ld a, $00
    call Call_000_0168
    or a
    ret z

    ld a, [$c66d]
    or a
    jr z, jr_005_5617

    call Call_000_017a
    ret


jr_005_5617:
    ldh a, [$ff8d]
    and $09
    jp nz, Jump_005_568d

    ldh a, [$ff8d]
    and $10
    jr z, jr_005_5635

    ld a, $03
    ldh [$ffa1], a
    ld a, [$c5a8]
    cp $04
    jr z, jr_005_5632

    inc a
    jr jr_005_564a

jr_005_5632:
    xor a
    jr jr_005_564a

jr_005_5635:
    ldh a, [$ff8d]
    and $20
    ret z

    ld a, $03
    ldh [$ffa1], a
    ld a, [$c5a8]
    cp $00
    jr z, jr_005_5648

    dec a
    jr jr_005_564a

jr_005_5648:
    ld a, $04

Call_005_564a:
jr_005_564a:
    ld [$c5a8], a
    ld hl, $5694
    ld d, $00
    ld e, a
    sla e
    rl d
    add hl, de
    ld a, [hl+]
    ld [$c66f], a
    ld a, [hl]
    ld [$c66e], a
    ld a, $90
    ld [$c670], a
    ld a, $00
    ld [$c671], a
    xor a
    ld [$c672], a
    ld a, $01
    ld [$c66d], a
    ld a, [$c5a8]
    ld b, $10
    add b
    ld b, $06
    ld c, $0f
    ld e, a
    call Call_000_0156
    ld h, $01
    ld l, $e6
    ld b, $08
    ld c, $01
    call GBC_NavQueueAndPump    ; was: call Call_000_0153 (iso-size)
    ret


Jump_005_568d:
    xor a
    ld [ANIM_FRAME], a
    jp Jump_000_0165


    nop
    ld b, b
    ld b, b
    ld b, l
    add b
    ld c, d
    ret nz

    ld c, a
    nop
    ld d, l
    ld a, $08
    call Call_000_0162
    ld a, $02
    ld [SOUND_CONTROL], a
    jp Jump_000_0165


    ld a, $01
    call Call_000_0168
    or a
    ret z

    call Call_000_0174
    ld a, [$c5a8]
    cp $04
    jp z, Jump_005_56d0

    ld a, [$c5a8]
    ld hl, $56d3
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    ld [GAME_STATE], a
    xor a
    ld [SCREEN_SUBSTATE], a
    ret


Jump_005_56d0:
    jp Jump_000_0165


    inc bc
    dec b
    rlca
    ld [$fa00], sp
    ld a, a
    add $b7
    jp z, Jump_005_56e2

    call Call_000_01dd

Jump_005_56e2:
    ld e, $26
    call Call_000_015c
    xor a
    ld [$c684], a
    ld [$c683], a
    ld [$c682], a
    call Call_005_5b96
    call Call_005_5bae
    call Call_005_5bc8
    call Call_000_016b
    ld a, $08
    call Call_000_0162
    jp Jump_000_0165


    ld a, $00
    call Call_000_0168
    or a
    jp z, Jump_005_57c5

    call Call_005_5c2a
    call Call_005_5bc8
    ldh a, [$ff8d]
    and $02
    jp nz, Jump_005_5730

    ldh a, [$ff8d]
    and $01
    jp z, Jump_005_5771

    ld a, [$c684]
    cp $06
    jr z, jr_005_5730

    cp $05
    jr z, jr_005_5740

    jp Jump_005_5752


Jump_005_5730:
jr_005_5730:
    ld a, $08
    call Call_000_0162
    ld a, $02
    ld [SOUND_CONTROL], a
    call Call_000_0165
    jp Jump_005_61c4


jr_005_5740:
    ld a, $08
    call Call_000_0162
    ld a, $02
    ld [SOUND_CONTROL], a
    ld a, $08
    ld [SCREEN_SUBSTATE], a
    jp Jump_005_61c4


Jump_005_5752:
    ld a, [$c684]
    cp $03
    jp nz, Jump_005_5762

    ld a, [$c682]
    inc a
    inc a
    ldh [$ffa0], a
    ret


Jump_005_5762:
    ld a, [$c684]
    cp $04
    jp nz, Jump_005_5771

    ld a, [$c683]
    inc a
    ldh [$ffa1], a
    ret


Jump_005_5771:
    ldh a, [$ff8d]
    and $40
    jp z, Jump_005_5791

    ld a, [$c684]
    cp $00
    jp z, Jump_005_5791

    ld a, $03
    ldh [$ffa1], a
    call Call_005_5bff
    ld a, [$c684]
    dec a
    ld [$c684], a
    jp Jump_005_5c2a


Jump_005_5791:
    ldh a, [$ff8d]
    and $80
    jp z, Jump_005_57b1

    ld a, [$c684]
    cp $06
    jp z, Jump_005_57b1

    ld a, $03
    ldh [$ffa1], a
    call Call_005_5bff
    ld a, [$c684]
    inc a
    ld [$c684], a
    jp Jump_005_5c2a


Jump_005_57b1:
    ldh a, [$ff8d]
    and $10
    jp z, Jump_005_57bb

    call Call_005_5a90

Jump_005_57bb:
    ldh a, [$ff8d]
    and $20
    jp z, Jump_005_57c5

    call Call_005_5b12

Jump_005_57c5:
    ret


    ld a, $01
    call Call_000_0168
    or a
    ret z

    ld a, [$c67f]
    or a
    jp z, Jump_005_57d7

    call Call_000_01b0

Jump_005_57d7:
    ld hl, $5500
    ld de, $9000
    ld bc, $0550
    call Call_000_0177
    ld e, $21
    call Call_000_015c
    ld a, $04
    ldh [$ffa0], a
    ld a, $01
    ld [SCREEN_SUBSTATE], a
    ret


    ld a, $01
    call Call_000_0168
    or a
    ret z

    ld e, $0e
    call Call_000_015c
    ld a, $08
    call Call_000_0162
    ld a, $01
    ld [$c686], a
    call Call_005_586d
    jp Jump_000_0165


    ldh a, [$ff8d]
    and $01
    jr z, jr_005_582f

    ld a, $04
    ldh [$ffa1], a
    ld a, [$c686]
    cp $00
    jr nz, jr_005_5822

    call Call_005_621a

jr_005_5822:
    ld a, $08
    call Call_000_0162
    ld a, $02
    ld [SOUND_CONTROL], a
    jp Jump_000_0165


jr_005_582f:
    ldh a, [$ff8d]
    and $30
    jr z, jr_005_586c

    ld b, $05
    ld a, [$c686]
    cp $00
    jr z, jr_005_5840

    ld b, $0b

jr_005_5840:
    ld e, $17
    ld c, $0a
    call Call_000_0156
    ld h, $01
    ld l, $45
    ld a, [$c686]
    cp $00
    jr z, jr_005_5856

    ld h, $01
    ld l, $4b

jr_005_5856:
    ld b, $01
    ld c, $01
    call Call_000_0153
    ld a, [$c686]
    xor $01
    ld [$c686], a
    call Call_005_586d
    ld a, $03
    ldh [$ffa1], a

jr_005_586c:
    ret


Call_005_586d:
    ld b, $05
    ld a, [$c686]
    cp $00
    jr z, jr_005_5878

    ld b, $0b

jr_005_5878:
    ld e, $16
    ld c, $0a
    call Call_000_0156
    ld h, $01
    ld l, $45
    ld a, [$c686]
    cp $00
    jr z, jr_005_588e

    ld h, $01
    ld l, $4b

jr_005_588e:
    ld b, $01
    ld c, $01
    jp Jump_000_0153


    ld a, $01
    call Call_000_0168
    or a
    ret z

    ld e, $26
    call Call_000_015c
    call Call_005_5b96
    call Call_005_5bae
    call Call_005_5bc8
    call Call_000_016b
    ld a, $08
    call Call_000_0162
    ld a, $05
    ld [$c684], a
    ld a, $06
    ld [SCREEN_SUBSTATE], a
    ret


    ret


    ld a, [SCREEN_SUBSTATE]
    inc a
    ld [SCREEN_SUBSTATE], a
    ret


    ld a, [SCREEN_SUBSTATE]
    ld hl, $58d9
    ld d, $00
    ld e, a
    sla e
    rl d
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


    ret


    pop af
    ld e, b
    dec e
    ld e, c
    ld sp, $5059
    ld e, c
    ld [hl], c
    ld e, c
    adc b
    ld e, c
    or [hl]
    ld e, c
    or [hl]
    ld e, c
    or a
    ld e, c
    jp nc, $e059

    ld e, c
    ld hl, sp+$59
    ld a, [$c67f]
    or a
    jr z, jr_005_58fa

    call Call_000_01da

jr_005_58fa:
    xor a
    ld [$c5ed], a
    xor a
    call Call_000_0159
    ld e, $2a
    call Call_000_015c
    call Call_000_016b
    xor a
    ld [$c681], a
    ld [$c5ab], a
    ld a, $19
    ldh [$ffa0], a
    ld a, $10
    call Call_000_0162
    jp Jump_000_0165


    ld a, $00
    call Call_000_0168
    or a
    ret z

    ld a, [$c5ab]
    dec a
    ld [$c5ab], a
    cp $00
    ret nz

    jp Jump_000_0165


    ld a, [$c681]
    add $90
    ld e, a
    ld b, $01
    ld c, $09
    call Call_000_0156
    ld h, $01
    ld l, $21
    ld b, $12
    ld c, $08
    call Call_000_0153
    xor a
    ld [$c5ab], a
    jp Jump_000_0165


    ld a, [$c5ab]
    dec a
    ld [$c5ab], a
    cp $00
    ret nz

    ld a, [$c681]
    cp $0b
    jr nz, jr_005_5964

    jp Jump_000_0165


jr_005_5964:
    ld a, [$c681]
    inc a
    ld [$c681], a
    ld a, $02
    ld [SCREEN_SUBSTATE], a
    ret


    ld a, [$c5ab]
    dec a
    ld [$c5ab], a
    cp $00
    ret nz

    ld a, $02
    ld [SOUND_CONTROL], a
    ld a, $08
    call Call_000_0162
    jp Jump_000_0165


    ld a, $01
    call Call_000_0168
    or a
    ret z

    ld a, [$c67e]
    cp $1f
    jr z, jr_005_59ab

    ld a, $03
    call Call_000_0159
    ld e, $34
    call Call_000_015c
    ld a, $08
    call Call_000_0162
    ld a, $08
    ld [SCREEN_SUBSTATE], a
    ret


jr_005_59ab:
    ld a, $06
    ld [GAME_STATE], a
    ld a, $0c
    ld [SCREEN_SUBSTATE], a
    ret


    ret


    ld a, [$c67f]
    or a
    jr z, jr_005_59c0

    call Call_000_01dd

jr_005_59c0:
    ld a, $03
    call Call_000_0159
    ld e, $34
    call Call_000_015c
    ld a, $08
    call Call_000_0162
    jp Jump_000_0165


    ld a, $00
    call Call_000_0168
    or a
    ret z

    xor a
    ld [$c5ab], a
    jp Jump_000_0165


    ldh a, [$ff8d]
    and $01
    jr nz, jr_005_59f0

    ld a, [$c5ab]
    dec a
    ld [$c5ab], a
    cp $00
    ret nz

jr_005_59f0:
    ld a, $08
    call Call_000_0162
    jp Jump_000_0165


    ld a, $01
    call Call_000_0168
    or a
    ret z

    ld a, $1f
    ld [$c67e], a
    ld [$a459], a
    xor a
    ld [$a458], a
    ld [$c5c4], a
    ld [$a457], a
    ld [$c6dc], a
    ld [$a456], a
    ld [$c6db], a
    call Call_005_61c4
    ld a, $06
    ld [GAME_STATE], a
    ld a, $0c
    ld [SCREEN_SUBSTATE], a
    ret


    ld a, [SCREEN_SUBSTATE]
    ld hl, $5a3b
    ld d, $00
    ld e, a
    sla e
    rl d
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


    ret


    ccf
    ld e, d
    ld c, h
    ld e, d
    ld a, $08
    call Call_000_0162
    ld a, $02
    ld [SOUND_CONTROL], a
    jp Jump_000_0165


    ld a, $01
    call Call_000_0168
    or a
    ret z

    call Call_000_0174
    ld a, [$c67f]
    push af
    call Call_000_01f5
    call Call_000_016e
    call Call_000_0171
    ld a, $01
    ld [RENDER_REQUEST], a
    xor a
    ldh [rIF], a
    ld a, $0d
    ldh [rIE], a
    ei
    call Call_000_01f8
    pop af
    ld [$c67f], a
    ld a, $01
    ld [GAME_STATE], a
    xor a
    ld [SCREEN_SUBSTATE], a
    ret


    ld a, $01
    ld [RENDER_REQUEST], a
    ld a, $00
    call Call_000_0168
    or a
    ret z

    jp Jump_000_0165


Call_005_5a90:
    ld a, [$c684]
    cp $00
    jp z, Jump_005_5aa9

    dec a
    jp z, Jump_005_5abc

    dec a
    jp z, Jump_005_5ad8

    dec a
    jp z, Jump_005_5af4

    dec a
    jp z, Jump_005_5b04

    ret


Jump_005_5aa9:
    ld a, [$a45a]
    xor $01
    ld [$a45a], a
    cp $01
    jr nz, jr_005_5ab9

    ld a, $02
    ldh [$ffa0], a

jr_005_5ab9:
    jp Jump_005_5b96


Jump_005_5abc:
    ld a, [$a0ef]
    ld b, a
    ld a, [$a0ee]
    cp $02
    jp nz, Jump_005_5aca

    ld a, $ff

Jump_005_5aca:
    inc a
    ld [$a0ee], a
    sub b
    jp z, Jump_005_5abc

    call Call_005_5bae
    jp Jump_005_61eb


Jump_005_5ad8:
    ld a, [$a0ee]
    ld b, a
    ld a, [$a0ef]
    cp $02
    jp nz, Jump_005_5ae6

    ld a, $ff

Jump_005_5ae6:
    inc a
    ld [$a0ef], a
    sub b
    jp z, Jump_005_5ad8

    call Call_005_5bae
    jp Jump_005_61eb


Jump_005_5af4:
    ld a, [$c682]
    cp $17
    jp z, Jump_005_5b03

    inc a
    ld [$c682], a
    call Call_005_5bc8

Jump_005_5b03:
    ret


Jump_005_5b04:
    ld a, [$c683]
    cp $19
    ret z

    inc a
    ld [$c683], a
    call Call_005_5bc8
    ret


Call_005_5b12:
    ld a, [$c684]
    cp $00
    jp z, Jump_005_5b2b

    dec a
    jp z, Jump_005_5b3e

    dec a
    jp z, Jump_005_5b5a

    dec a
    jp z, Jump_005_5b76

    dec a
    jp z, Jump_005_5b86

    ret


Jump_005_5b2b:
    ld a, [$a45a]
    xor $01
    ld [$a45a], a
    cp $01
    jr nz, jr_005_5b3b

    ld a, $02
    ldh [$ffa0], a

jr_005_5b3b:
    jp Jump_005_5b96


Jump_005_5b3e:
    ld a, [$a0ef]
    ld b, a
    ld a, [$a0ee]
    cp $00
    jp nz, Jump_005_5b4c

    ld a, $03

Jump_005_5b4c:
    dec a
    ld [$a0ee], a
    sub b
    jp z, Jump_005_5b3e

    call Call_005_5bae
    jp Jump_005_61eb


Jump_005_5b5a:
    ld a, [$a0ee]
    ld b, a
    ld a, [$a0ef]
    cp $00
    jp nz, Jump_005_5b68

    ld a, $03

Jump_005_5b68:
    dec a
    ld [$a0ef], a
    sub b
    jp z, Jump_005_5b5a

    call Call_005_5bae
    jp Jump_005_61eb


Jump_005_5b76:
    ld a, [$c682]
    cp $00
    jp z, Jump_005_5b85

    dec a
    ld [$c682], a
    call Call_005_5bc8

Jump_005_5b85:
    ret


Jump_005_5b86:
    ld a, [$c683]
    cp $00
    jp z, Jump_005_5b95

    dec a
    ld [$c683], a
    call Call_005_5bc8

Jump_005_5b95:
    ret


Call_005_5b96:
Jump_005_5b96:
    ld a, [$a45a]
    add $5a
    ld e, a
    ld b, $0e
    ld c, $04
    call Call_000_0156
    ld h, $00
    ld l, $8e
    ld b, $03
    ld c, $01
    jp Jump_000_0153


Call_005_5bae:
    ld a, [$a0ee]
    add $1c
    ld e, a
    ld b, $10
    ld c, $07
    call Call_000_0156
    ld a, [$a0ef]
    add $1c
    ld e, a
    ld b, $10
    ld c, $08
    jp Jump_000_0156


Call_005_5bc8:
    ld a, [$c682]
    swap a
    and $0f
    add $81
    ld [$d16f], a
    ld a, [$c682]
    and $0f
    add $81
    ld [$d170], a
    ld a, [$c683]
    swap a
    and $0f
    add $81
    ld [$d18f], a
    ld a, [$c683]
    and $0f
    add $81
    ld [$d190], a
    ld h, $00
    ld l, $ef
    ld b, $02
    ld c, $06
    jp Jump_000_0153


Call_005_5bff:
    call Call_005_5c58
    ld e, $17
    call Call_000_0156
    ld a, [$c684]
    cp $01
    jp z, Jump_005_5c1e

    cp $02
    jp z, Jump_005_5c1e

    cp $03
    jp z, Jump_005_5c1e

    cp $04
    jp nz, Jump_005_5c29

Jump_005_5c1e:
    call Call_005_5c67
    ld e, $17
    call Call_000_0156
    call Call_005_5c91

Jump_005_5c29:
    ret


Call_005_5c2a:
Jump_005_5c2a:
    call Call_005_5c58
    ld e, $16
    call Call_000_0156
    call Call_005_5c86
    ld a, [$c684]
    cp $01
    jp z, Jump_005_5c4c

    cp $02
    jp z, Jump_005_5c4c

    cp $03
    jp z, Jump_005_5c4c

    cp $04
    jp nz, Jump_005_5c57

Jump_005_5c4c:
    call Call_005_5c67
    ld e, $16
    call Call_000_0156
    call Call_005_5c91

Jump_005_5c57:
    ret


Call_005_5c58:
    ld a, [$c684]
    ld hl, $5ca7
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    ld c, a
    ld b, $02
    ret


Call_005_5c67:
    ld a, [$c684]
    ld hl, $5cae
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    ld c, a
    ld a, [$c684]
    cp $01
    jp z, Jump_005_5c83

    cp $02
    jp z, Jump_005_5c83

    ld b, $08
    ret


Jump_005_5c83:
    ld b, $03
    ret


Call_005_5c86:
    ld h, $00
    ld l, $82
    ld b, $01
    ld c, $0d
    jp Jump_000_0153


Call_005_5c91:
    ld h, $00
    ld l, $e3
    ld b, $01
    ld c, $02
    call Call_000_0153
    ld h, $01
    ld l, $68
    ld b, $01
    ld c, $02
    jp Jump_000_0153


    inc b
    ld b, $06
    ld a, [bc]
    ld a, [bc]
    ld c, $10
    nop
    rlca
    ld [$0c0b], sp
    nop
    nop

Call_005_5cb5:
    ld a, [$c685]
    ld hl, $5ce8
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    ld c, a
    ld b, $07
    ld e, $1f
    call Call_000_0156
    ld l, $47
    ld h, $01
    ld b, $01
    ld c, $05
    call Call_000_0153
    ret


Call_005_5cd4:
    ld a, [$c685]
    ld hl, $5ce8
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    ld c, a
    ld b, $07
    ld e, $17
    call Call_000_0156
    ret


    ld a, [bc]
    inc c
    ld c, $fa
    add l
    add $cb
    daa
    add $09
    ld c, a
    ld b, $04
    ld e, $04
    call Call_000_0156
    ld h, $01
    ld l, $24
    ld b, $01
    ld c, $07
    jp Jump_000_0153


Call_005_5d05:
    ld a, [$c685]
    sla a
    add $09
    ld c, a
    ld b, $04
    ld e, $17
    jp Jump_000_0156


Call_005_5d14:
    ld c, $0c                   ; was $0a: NEW GAME now on the bottom row
    ld a, [$c685]
    cp $00
    jr z, jr_005_5d1f

    ld c, $0a                   ; was $0c: CONTINUE now on the top row

jr_005_5d1f:
    ld b, $05
    ld e, $04
    call Call_000_0156
    ld l, $45
    ld h, $01
    ld b, $01
    ld c, $04
    jp Jump_000_0153


Call_005_5d31:
    ld c, $0c                   ; was $0a: NEW GAME now on the bottom row
    ld a, [$c685]
    cp $00
    jr z, jr_005_5d3c

    ld c, $0a                   ; was $0c: CONTINUE now on the top row

jr_005_5d3c:
    ld b, $05
    ld e, $17
    jp Jump_000_0156


Call_005_5d43:
    ld b, $06
    ld a, [$c685]
    cp $00

jr_005_5d4a:
    jr z, jr_005_5d4e

    ld b, $0d

jr_005_5d4e:
    ld c, $0f
    ld e, $04
    call Call_000_0156
    ld l, $e6
    ld a, [$c685]
    cp $00
    jr z, jr_005_5d60

    ld l, $ed

jr_005_5d60:
    ld h, $01
    ld b, $01
    ld c, $01
    jp Jump_000_0153


Call_005_5d69:
    ld b, $06
    ld a, [$c685]
    cp $00
    jr z, jr_005_5d74

    ld b, $0d

jr_005_5d74:
    ld c, $0f
    ld e, $17
    call Call_000_0156
    ld l, $e6
    ld a, [$c685]
    cp $00
    jr z, jr_005_5d86

    ld l, $ed

jr_005_5d86:
    ld h, $01
    ld b, $01
    ld c, $01
    jp Jump_000_0153


Call_005_5d8f:
Jump_005_5d8f:
    ld a, [$c6db]
    add $48
    ld e, a
    ld b, $05
    ld c, $10
    call Call_000_0156
    ld h, $02
    ld l, $05
    ld b, $0a
    ld c, $01
    jp Jump_000_0153


Call_005_5da7:
    ld a, [$c685]
    ld hl, $5dc7
    ld d, $00
    ld e, a
    sla e
    rl d
    add hl, de
    ld a, [hl+]
    push hl
    ld hl, $c1e2
    ld [hl], a
    pop hl
    ld a, [hl]
    ld hl, $c1e3
    ld [hl], a
    ld a, $01
    ld [RENDER_REQUEST], a
    ret


    ld l, b
    jr nz, jr_005_5d4a

    jr nz, jr_005_5e34

    jr nc, jr_005_5d4e

    jr nc, @+$6a

    ld b, b
    add b
    ld b, b
    ld l, b
    ld d, b
    add b
    ld d, b

Call_005_5dd7:
    ld a, [$c688]
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
    ld [$c202], a
    ld a, [$c689]
    ld b, $00
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
    ld [$c203], a
    ld a, [$c68a]
    ld b, $08
    add b
    ld de, $c200
    call Call_005_5e18
    ret


Call_005_5e18:
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

jr_005_5e34:
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


Jump_005_5e54:
    ld e, $43
    ld b, $0c
    ld c, $0d
    call Call_000_0156
    ld h, $01
    ld l, $ac
    ld b, $08
    ld c, $04
    call Call_000_0153
    ld a, $05
    ld [SCREEN_SUBSTATE], a
    ret


Call_005_5e6e:
    ldh a, [$ff8d]
    and $04
    jr z, jr_005_5e81

    ld a, [$c68d]
    cp $7f
    jr nz, jr_005_5e7d

    ld a, $78

jr_005_5e7d:
    inc a
    ld [$c68d], a

jr_005_5e81:
    ld hl, $c220
    ld a, $11
    ld [hl], a
    ld a, [$c68b]
    ld hl, $c222
    ld [hl], a
    ld a, [$c68c]
    ld hl, $c223
    ld [hl], a
    ld a, [$c68d]
    ld hl, $c224
    ld [hl], a
    ldh a, [$ff8c]
    and $02
    jr z, jr_005_5ea5

    ld a, $6c
    ld [hl], a

jr_005_5ea5:
    ld a, $11
    ld [$c240], a
    ld a, [$c68b]
    sub $08
    ld [$c242], a
    ld a, [$c68c]
    sub $08
    ld [$c243], a
    ld a, $78
    ld [$c244], a
    ld a, $01
    ld [RENDER_REQUEST], a
    ret


Call_005_5ec5:
    ld de, $c7f2
    call Call_005_546c
    ld a, [$c695]
    ld [$c688], a
    ld a, [$c696]
    ld [$c689], a
    ld a, [$c697]
    ld [$c68a], a
    ld hl, $c200
    ld a, $11
    ld [hl], a
    ld hl, $c204
    ld [hl], $78
    call Call_005_5dd7
    call Call_005_5da7
    xor a
    ld [$c220], a
    ld [$c240], a
    xor a
    ld [$c6da], a
    ld [$c5ac], a
    ld a, $03
    ld [$c6c7], a
    ld a, [$c698]
    ld [$c6c6], a
    call Call_000_017d
    ld h, $00
    ld l, $01
    ld b, $0a
    ld c, $11
    call Call_000_0153
    ret


Call_005_5f16:
Jump_005_5f16:
    ldh a, [$ff8d]
    and $01
    jp z, Jump_005_5faf

    ld a, $04
    ldh [$ffa1], a
    ld a, [$c685]
    cp $00
    jp nz, Jump_005_5f36

    ld a, [$c686]
    or a
    jp z, Jump_005_5e54

    call Call_005_5ec5
    jp Jump_005_5e54


Jump_005_5f36:
    ld a, [$c685]
    cp $01
    jp nz, Jump_005_5f57

    ld a, [$c686]
    or a
    jp nz, Jump_005_5f51

    call Call_005_5ec5
    call Call_005_6016
    call Call_005_62c9
    jp Jump_005_5e54


Jump_005_5f51:
    call Call_005_5ec5
    jp Jump_005_5e54


Jump_005_5f57:
    ld a, [$c686]
    or a
    jp nz, Jump_005_5e54

    ld a, $00
    ld [$c688], a
    ld a, $0f
    ld [$c689], a
    ld a, $00
    ld [$c68a], a
    ld hl, $c200
    ld a, $11
    ld [hl], a
    ld hl, $c204
    ld [hl], $78
    ld a, $10
    ld [$c68b], a
    ld a, $90
    ld [$c68c], a
    ld a, $79
    ld [$c68d], a
    call Call_005_5dd7
    call Call_005_5da7
    xor a
    ld [$c220], a
    ld [$c240], a
    ld e, $2d
    call Call_000_015c
    xor a
    ld [$c6da], a
    ld [$c5ac], a
    ld a, $03
    ld [$c6c7], a
    xor a
    ld [$c6c6], a
    call Call_000_017d
    jp Jump_005_5e54


Jump_005_5faf:
    ldh a, [$ff8d]
    and $30
    jr z, jr_005_5fec

    ld b, $0c
    ld a, [$c686]
    cp $00
    jr z, jr_005_5fc0

    ld b, $10

jr_005_5fc0:
    ld e, $17
    ld c, $10
    call Call_000_0156
    ld h, $02
    ld l, $0c
    ld a, [$c686]
    cp $00
    jr z, jr_005_5fd6

    ld h, $02
    ld l, $10

jr_005_5fd6:
    ld b, $01
    ld c, $01
    call Call_000_0153
    ld a, [$c686]
    xor $01
    ld [$c686], a
    call Call_005_5fed
    ld a, $03
    ldh [$ffa1], a

jr_005_5fec:
    ret


Call_005_5fed:
    ld b, $0c
    ld a, [$c686]
    cp $00
    jr z, jr_005_5ff8

    ld b, $10

jr_005_5ff8:
    ld e, $1f
    ld c, $10
    call Call_000_0156
    ld h, $02
    ld l, $0c
    ld a, [$c686]
    cp $00
    jr z, jr_005_600e

    ld h, $02
    ld l, $10

jr_005_600e:
    ld b, $01
    ld c, $01
    call Call_000_0153
    ret


Call_005_6016:
    ld de, $c6dd
    call Call_005_5424
    ld hl, $a42e
    ld d, $00
    ld a, [$c687]
    ld e, a
    sla e
    rl d
    sla e
    rl d
    add hl, de
    ld a, [$c695]
    ld [hl+], a
    ld a, [$c696]
    ld [hl+], a
    ld a, [$c697]
    ld [hl+], a
    ld a, [$c698]
    ld [hl+], a
    ld hl, $60df
    ld d, $00
    ld a, [$c687]
    ld e, a
    sla e
    rl d
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld de, $c6dd
    ld bc, $004b

jr_005_6055:
    ld a, [de]
    ld [hl+], a
    inc de
    dec bc
    ld a, b
    or c
    jr nz, jr_005_6055

    jp Jump_005_61c4


Call_005_6060:
    ld hl, $a42e
    ld d, $00
    ld a, [$c687]
    ld e, a
    sla e
    rl d
    sla e
    rl d
    add hl, de
    ld a, [hl+]
    ld [$c688], a
    ld a, [hl+]
    ld [$c689], a
    ld a, [hl+]
    ld [$c68a], a
    ld a, [hl+]
    ld [$c6c6], a
    ld hl, $60df
    ld d, $00
    ld a, [$c687]
    ld e, a
    sla e
    rl d
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld de, $c6dd
    ld bc, $004b

jr_005_6099:
    ld a, [hl+]
    ld [de], a
    inc de
    dec bc
    ld a, b
    or c
    jr nz, jr_005_6099

    ld h, $00
    ld l, $01
    ld b, $0a
    ld c, $11
    call Call_000_0153
    ld de, $c6dd
    call Call_005_546c
    call Call_005_5dd7
    call Call_005_5da7
    xor a
    ld [$c220], a
    ld [$c240], a
    xor a
    ld [$c6da], a
    ld [$c5ac], a
    ld a, $03
    ld [$c6c7], a
    call Call_000_017d
    ret


    jr nz, jr_005_6125

    ld b, l
    ld d, h
    ld d, d
    ld c, c
    ld d, e
    jr nz, jr_005_6128

    ld c, h
    ld d, l
    ld d, e
    jr nz, jr_005_60fd

    jr nz, jr_005_60df

jr_005_60df:
    ld b, b
    and c
    adc e
    and c
    sub $a1
    ld hl, $6ca2
    and d
    or a
    and d
    ld [bc], a
    and e
    ld c, l
    and e
    sbc b
    and e
    db $e3
    and e

Jump_005_60f3:
    ld de, $60cf
    ld hl, $a000
    ld bc, $0010

jr_005_60fc:
    ld a, [de]

jr_005_60fd:
    ld [hl+], a
    inc de
    dec bc
    ld a, b
    or c
    jr nz, jr_005_60fc

    jp Jump_005_61c4


Call_005_6107:
    ld hl, $60cf
    ld de, $a000
    ld bc, $0010

jr_005_6110:
    push bc
    ld a, [hl+]
    ld b, a
    ld a, [de]
    cp b
    jr nz, jr_005_615e

    inc de
    pop bc
    dec bc
    ld a, b
    or c
    jr nz, jr_005_6110

    xor a
    ld [$c68e], a
    ld [$c68f], a

jr_005_6125:
    ld de, $a000

jr_005_6128:
    ld bc, $04fe

jr_005_612b:
    push bc
    ld hl, $c68e
    ld a, [de]
    ld b, a
    ld a, [hl]
    add b
    ld [hl], a
    inc de
    inc hl
    ld hl, $c68f
    ld a, [de]
    ld b, a
    ld a, [hl]
    adc b
    ld [hl], a
    pop bc
    dec bc
    ld a, b
    or c
    jr nz, jr_005_612b

    ld a, [$c68e]
    ld b, a
    ld a, [$a4fe]
    cp b
    jr nz, jr_005_615b

    ld a, [$c68f]
    ld b, a
    ld a, [$a4ff]
    cp b
    jr nz, jr_005_615b

    ld a, $00
    ret


jr_005_615b:
    ld a, $02
    ret


jr_005_615e:
    pop bc
    ld a, $01
    ret


Call_005_6162:
    ld de, $6174
    ld hl, $a0f0
    ld bc, $0050

jr_005_616b:
    ld a, [de]
    ld [hl+], a
    inc de
    dec bc
    ld a, b
    or c
    jr nz, jr_005_616b

    ret


    nop
    inc [hl]
    ld d, b
    sub e
    and c
    adc e
    ld bc, $0001
    nop
    nop
    inc hl
    ld b, b
    sub d
    sub e
    sbc h
    ld bc, $1000
    nop
    nop
    ld [de], a
    jr nc, @-$69

    sub e
    sbc [hl]
    ld bc, $0800
    nop
    nop
    ld [de], a
    jr nc, @-$71

    adc l
    adc l
    ld bc, $0800
    nop
    nop
    ld bc, $0025
    sub h
    adc e
    sub [hl]
    nop
    nop
    nop
    nop
    ld bc, $0024
    sbc l
    adc e
    sbc l
    nop
    nop
    nop
    nop
    ld bc, $0023
    sbc [hl]
    adc e
    sbc h
    nop
    nop
    nop
    nop
    ld bc, $0023
    sub c
    sub d
    sub e
    nop
    nop
    nop

Call_005_61c4:
Jump_005_61c4:
    xor a
    ld [$a4fe], a
    ld [$a4ff], a
    ld de, $a000
    ld bc, $04fe

jr_005_61d1:
    push bc
    ld hl, $a4fe
    ld a, [de]
    ld b, a
    ld a, [hl]
    add b
    ld [hl], a
    inc de
    inc hl
    ld hl, $a4ff
    ld a, [de]
    ld b, a
    ld a, [hl]
    adc b
    ld [hl], a
    pop bc
    dec bc
    ld a, b
    or c
    jr nz, jr_005_61d1

    ret


Call_005_61eb:
Jump_005_61eb:
    ld a, [$a0ef]
    ld hl, $6208
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    ld [$c691], a
    ld a, [$a0ee]
    ld hl, $6208
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    ld [$c690], a
    ret


    ld bc, $4002

Call_005_620b:
    ld hl, $a010
    ld bc, $00dc

jr_005_6211:
    ld a, $99
    ld [hl+], a
    dec bc
    ld a, b
    or c
    jr nz, jr_005_6211

    ret


Call_005_621a:
    xor a
    ld [$c5a7], a
    ld [$a0ed], a
    ld [$a0ee], a
    ld [$c683], a
    ld [$c682], a
    ld [$a45a], a
    inc a
    ld [$a0ef], a
    ld [$a0ec], a
    ld [$a456], a
    ld [$a457], a
    ld [$a458], a
    ld a, $ff
    ld [$a459], a
    ld [$c67e], a
    call Call_005_61eb
    call Call_005_620b
    call Call_005_6162
    call Call_005_6305
    jp Jump_005_60f3


    ld a, [$c6db]
    ld [$a456], a
    ld a, [$c6dc]
    ld [$a457], a
    ld a, [$c5c4]
    ld [$a458], a
    ld a, [$c67e]
    cp $ff
    jr nz, jr_005_626e

    xor a

jr_005_626e:
    ld [$a459], a
    ld [$c67e], a
    ld hl, $a010
    ld d, $00
    ld a, [$c5c4]
    ld e, a
    sla e
    rl d
    add hl, de
    ld de, $c601
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    jp Jump_005_61c4


Call_005_628d:
    ld a, [$c67e]
    cp $ff
    jr nz, jr_005_6295

    xor a

jr_005_6295:
    ld [$a459], a
    ld [$c67e], a
    ld a, [$c6db]
    ld [$a456], a
    ld a, [$c6dc]
    ld [$a457], a
    ld a, [$c5c4]
    ld [$a458], a
    jp Jump_005_61c4


Call_005_62b0:
    ld hl, $a0d8
    ld d, $00
    ld a, [$c5c4]
    ld e, a
    sla e
    rl d
    add hl, de
    ld de, $c601
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    jp Jump_005_61c4


Call_005_62c9:
    ld hl, $a0d8
    ld d, $00
    ld a, [$c687]
    ld e, a
    sla e
    rl d
    add hl, de
    ld a, $99
    ld [hl+], a
    ld [hl], a
    jp Jump_005_61c4


Call_005_62de:
    ld b, $64
    ld d, $00
    ld e, $00

jr_005_62e4:
    ld c, a
    sub b
    jr c, jr_005_62eb

    inc d
    jr jr_005_62e4

jr_005_62eb:
    ld a, c
    ld b, $0a

jr_005_62ee:
    ld c, a
    sub b
    jr c, jr_005_62fa

    push af
    ld a, e
    add $10
    ld e, a
    pop af
    jr jr_005_62ee

jr_005_62fa:
    ld a, c
    ld b, $01

jr_005_62fd:
    ld c, a
    sub b
    jr c, jr_005_6304

    inc e
    jr jr_005_62fd

jr_005_6304:
    ret


Call_005_6305:
    ld hl, $6328
    ld de, $a140
    ld bc, $02ee

jr_005_630e:
    ld a, [hl+]
    ld [de], a
    inc de
    dec bc
    ld a, b
    or c
    jr nz, jr_005_630e

    ld hl, $6616
    ld de, $a42e
    ld bc, $0028

jr_005_631f:
    ld a, [hl+]
    ld [de], a
    inc de
    dec bc
    ld a, b
    or c
    jr nz, jr_005_631f

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
    ld de, $0010
    nop
    ld bc, $1011
    nop
    nop
    ld bc, $1011
    nop
    nop
    nop
    ld de, $0010
    nop
    nop
    ld de, $0010
    nop
    nop
    ld de, $0010
    nop
    nop
    ld de, $0010
    nop
    nop
    nop
    nop
    nop
    ld de, $0011
    ld de, $0011
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    jr nz, jr_005_638f

    ld [hl+], a
    ld [hl+], a

jr_005_638f:
    ld [hl+], a
    ld [hl+], a
    ld [bc], a
    ld [hl+], a
    nop
    ld [bc], a
    ld [hl+], a
    ld [bc], a
    ld [hl+], a
    nop
    ld [bc], a
    ld [hl+], a
    nop
    nop
    nop
    ld [bc], a
    ld [hl+], a
    nop
    nop
    ld [bc], a
    ld [hl+], a
    ld [hl+], a
    nop
    ld [bc], a
    ld [hl+], a
    ld [hl+], a
    nop
    ld [bc], a
    ld [hl+], a
    ld [hl+], a
    nop
    nop
    ld [bc], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [bc], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc sp
    inc sp
    inc sp
    jr nc, jr_005_63e0

    inc sp
    inc sp
    inc sp

jr_005_63e0:
    inc sp
    inc bc
    inc sp
    nop
    inc bc
    inc sp
    nop
    nop
    nop
    inc bc
    inc sp
    nop
    nop
    nop
    inc sp
    jr nc, jr_005_63f1

jr_005_63f1:
    nop
    nop
    inc sp
    jr nc, jr_005_63f6

jr_005_63f6:
    nop
    nop
    inc bc
    inc sp
    inc bc
    inc sp
    nop
    inc bc
    inc sp
    inc bc
    inc sp
    inc sp
    inc sp
    inc sp
    nop
    inc sp
    inc sp
    inc sp
    jr nc, jr_005_640a

jr_005_640a:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld b, h
    ld b, h
    nop
    nop
    nop
    ld b, h
    ld b, h
    nop
    nop
    inc b
    ld b, b
    ld b, h
    nop
    nop
    inc b
    ld b, b
    ld b, h
    nop
    nop
    inc b
    ld b, b
    ld b, h
    nop
    nop
    ld b, h
    nop
    ld b, h
    nop
    nop
    ld b, h
    nop
    ld b, h
    nop
    nop
    ld b, h
    nop
    ld b, h
    nop
    inc b
    ld b, h
    ld b, h
    nop
    ld b, h
    inc b
    ld b, h
    ld b, h
    nop
    ld b, h
    nop
    nop
    nop
    ld b, h
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld d, l
    ld d, l
    ld d, l
    ld d, b
    dec b
    ld d, l
    ld d, l
    ld d, l
    ld d, b
    dec b
    ld d, b
    nop
    nop
    nop
    dec b
    ld d, l
    ld d, l
    ld d, l
    nop
    dec b
    ld d, l
    ld d, l
    ld d, l
    ld d, b
    dec b
    ld d, b
    nop
    dec b
    ld d, b
    nop
    nop
    nop
    dec b
    ld d, b
    nop
    nop
    nop
    dec b
    ld d, b
    dec b
    ld d, b
    nop
    dec b
    ld d, b
    dec b
    ld d, l
    ld d, l
    ld d, l
    ld d, b
    nop
    ld d, l
    ld d, l
    ld d, l
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld b, $66
    ld h, [hl]
    ld h, b
    nop
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    nop
    ld h, [hl]
    nop
    nop
    ld h, [hl]
    nop
    ld h, [hl]
    nop
    nop
    nop
    nop
    ld h, [hl]
    nop
    nop
    nop
    nop
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, b
    nop
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    nop
    ld h, [hl]
    nop
    nop
    ld h, [hl]
    nop
    ld h, [hl]
    nop
    nop
    ld h, [hl]
    nop
    ld h, [hl]
    nop
    nop
    ld h, [hl]
    nop
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    ld h, [hl]
    nop
    ld b, $66
    ld h, [hl]
    ld h, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rlca
    ld [hl], a
    ld [hl], a
    ld [hl], a
    ld [hl], b
    ld [hl], b
    nop
    nop
    nop
    rlca
    ld [hl], b
    nop
    nop
    nop
    rlca
    rlca
    ld [hl], a
    ld [hl], a
    ld [hl], b
    rlca
    nop
    nop
    rlca
    nop
    rlca
    nop
    nop
    ld [hl], b
    nop
    rlca
    nop
    rlca
    nop
    nop
    ld [hl], b
    nop
    ld [hl], b
    nop
    rlca
    nop
    nop
    ld [hl], b
    nop
    ld [hl], b
    nop
    nop
    ld [hl], b
    nop
    ld [hl], b
    nop
    nop
    rlca
    ld [hl], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $1111
    ld de, $1110
    stop
    ld bc, $1111
    stop
    ld bc, $1111
    stop
    ld bc, $1111
    stop
    ld bc, $0111
    ld de, $1111
    db $10
    ld de, $0010
    ld bc, $1111
    stop
    ld bc, $1111
    stop
    ld bc, $1111
    stop
    ld bc, $0111
    ld de, $1111
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
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    nop
    ld [bc], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    jr nz, jr_005_65a1

    jr nz, jr_005_65a1

jr_005_65a1:
    ld [bc], a
    jr nz, jr_005_65a6

    jr nz, jr_005_65a6

jr_005_65a6:
    ld [bc], a
    jr nz, jr_005_65ab

    jr nz, jr_005_65ab

jr_005_65ab:
    ld [bc], a
    jr nz, jr_005_65b0

    ld [hl+], a
    ld [hl+], a

jr_005_65b0:
    ld [hl+], a
    jr nz, jr_005_65b3

jr_005_65b3:
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    jr nz, jr_005_65b8

jr_005_65b8:
    nop
    nop
    ld [bc], a
    jr nz, jr_005_65bf

    jr nz, jr_005_65bf

jr_005_65bf:
    ld [bc], a
    jr nz, jr_005_65c4

    ld [hl+], a
    ld [hl+], a

jr_005_65c4:
    ld [hl+], a
    jr nz, jr_005_65c7

jr_005_65c7:
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    jr nc, jr_005_65ea

    inc sp
    jr nc, jr_005_661d

jr_005_65ea:
    jr nc, jr_005_661f

    inc sp
    inc sp
    inc sp
    jr nc, jr_005_6624

    nop
    inc sp
    inc bc
    jr nc, jr_005_6629

    nop
    inc sp
    inc bc
    jr nc, jr_005_662e

    nop
    inc sp
    inc bc
    jr nc, jr_005_6633

    nop
    inc sp
    inc bc
    jr nc, jr_005_6638

    nop
    inc sp
    inc bc
    jr nc, jr_005_663d

    nop
    inc sp
    inc bc
    jr nc, @+$35

    inc sp
    inc sp
    inc sp
    inc sp
    inc bc
    inc sp
    jr nc, jr_005_661b

    dec b
    nop
    nop
    dec b

jr_005_661b:
    add hl, bc
    nop

jr_005_661d:
    nop
    dec b

jr_005_661f:
    dec c
    nop
    nop
    ld b, $0e

jr_005_6624:
    nop
    nop
    inc b
    dec c
    nop

jr_005_6629:
    nop
    dec b
    ld [$0000], sp

jr_005_662e:
    ld bc, $0007
    nop
    inc b

jr_005_6633:
    add hl, bc
    nop
    nop
    inc b
    add hl, bc

jr_005_6638:
    nop
    nop
    ld b, $0d
    nop

jr_005_663d:
    nop
    ld a, [SCREEN_SUBSTATE]
    ld hl, $6651
    ld d, $00
    ld e, a
    sla e
    rl d
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


    ret


    ld l, e
    ld h, [hl]
    or a
    ld h, [hl]
    pop af
    ld h, [hl]
    or [hl]
    ld h, a
    ld l, $68
    ld e, a
    ld l, b
    add a
    ld l, b
    db $f4
    ld l, b
    dec b
    ld l, c
    ld l, e
    ld h, [hl]
    or a
    ld h, [hl]
    ld [hl], $67
    and c
    ld h, a
    ld a, [$c67f]
    or a
    jr z, jr_005_6674

    call Call_000_01d7

jr_005_6674:
    ld a, $09
    call Call_000_0159
    ld a, $02
    call Call_000_0159
    ld b, $00
    ld c, $00
    ld e, $28
    call Call_000_0156
    call Call_005_66a5
    call Call_000_019e
    call Call_000_01a1
    ld h, $00
    ld l, $00
    ld b, $14
    ld c, $20
    call Call_000_0153
    ld a, $12
    ldh [$ffa0], a
    call Call_000_0174
    jp Jump_000_0165


Call_005_66a5:
    ld hl, $a0f0
    ld de, $cc00
    ld bc, $0050

jr_005_66ae:
    ld a, [hl+]
    ld [de], a
    inc de
    dec bc
    ld a, b
    or c
    jr nz, jr_005_66ae

    ret


    ld hl, $c1e0
    ld a, $11
    ld [hl], a
    ld hl, $c1e2
    ld a, $38
    ld [hl], a
    ld hl, $c1e3
    ld a, $10
    ld [hl], a
    ld hl, $c1e4
    ld [hl], $a0
    ld a, $01
    ld [RENDER_REQUEST], a
    xor a
    ld [$c63c], a
    ld [$c63d], a
    ld [$c63e], a
    ld a, [$c5a8]
    cp $00
    jr z, jr_005_66e9

    ld a, $80
    ld [$c5ed], a

jr_005_66e9:
    ld a, $08
    call Call_000_0162
    jp Jump_000_0165


    ld a, $00
    call Call_000_0168
    or a
    jp nz, Jump_005_6700

    ld a, $01
    ld [RENDER_REQUEST], a
    ret


Jump_005_6700:
    ld a, [$c5a8]
    cp $00
    jr nz, jr_005_670f

    call Call_000_01a4
    or a
    jr nz, jr_005_6721

    jr jr_005_6715

jr_005_670f:
    call Call_000_01a7
    or a
    jr nz, jr_005_6721

jr_005_6715:
    ld h, $00
    ld l, $05
    ld b, $03
    ld c, $20
    call Call_000_0153
    ret


jr_005_6721:
    call Call_005_684d
    call Call_005_61c4
    ld a, [$c5a8]
    cp $00
    jr nz, jr_005_6733

    call Call_000_019e
    jr jr_005_6736

jr_005_6733:
    call Call_000_01a1

jr_005_6736:
    ld h, $00
    ld l, $05
    ld b, $03
    ld c, $20
    call Call_000_0153
    ld a, [$c5a8]
    cp $00
    jp z, Jump_005_674e

    ld a, $10
    jp Jump_005_6750


Jump_005_674e:
    ld a, $11

Jump_005_6750:
    ld hl, $c200
    ld [hl], a
    ld hl, $c202
    ld a, $50
    ld [hl], a
    ld hl, $c203
    ld a, $98
    ld [hl], a
    ld hl, $c204
    ld [hl], $a2
    ld a, [$c5a8]
    cp $00
    jp nz, Jump_005_6772

    ld a, $10
    jp Jump_005_6774


Jump_005_6772:
    ld a, $11

Jump_005_6774:
    ld hl, $c220
    ld [hl], a
    ld hl, $c222
    ld a, $50
    ld [hl], a
    ld hl, $c223
    ld a, $98
    ld [hl], a
    ld hl, $c224
    ld [hl], $a1
    ld a, $01
    ld [RENDER_REQUEST], a
    xor a
    ld [ANIM_FRAME], a
    ld a, [$c5a8]
    cp $00
    jr z, jr_005_679e

    ld a, $01
    ld [ANIM_FRAME], a

jr_005_679e:
    jp Jump_000_0165


    ld a, $00
    call Call_000_0168
    or a
    jp nz, Jump_005_67b0

    ld a, $01
    ld [RENDER_REQUEST], a
    ret


Jump_005_67b0:
    ld a, $03
    ld [SCREEN_SUBSTATE], a
    ret


    ld a, $01
    ld [RENDER_REQUEST], a
    ldh a, [$ff8d]
    and $0f
    jp nz, Jump_005_6820

    ld a, [ANIM_FRAME]
    cp $00
    jr nz, jr_005_67f5

    ld a, [$c5ed]
    cp $00
    jr z, jr_005_67e0

    sub $04
    ld [$c5ed], a
    ld hl, $c200
    ld [hl], $00
    ld hl, $c220
    ld [hl], $00
    ret


jr_005_67e0:
    ld hl, $c200
    ld [hl], $01
    ld hl, $c220
    ld [hl], $00
    ldh a, [$ff8d]
    and $80
    ret z

    ld a, $01
    ld [ANIM_FRAME], a
    ret


jr_005_67f5:
    ld a, [$c5ed]
    cp $80
    jr z, jr_005_680c

    add $04
    ld [$c5ed], a
    ld hl, $c200
    ld [hl], $00
    ld hl, $c220
    ld [hl], $00
    ret


jr_005_680c:
    ld hl, $c200
    ld [hl], $00
    ld hl, $c220
    ld [hl], $01
    ldh a, [$ff8d]
    and $40
    ret z

    xor a
    ld [ANIM_FRAME], a
    ret


Jump_005_6820:
    ld a, $08
    call Call_000_0162
    ld a, $02
    ld [SOUND_CONTROL], a
    call Call_000_0165
    ret


    ld a, $01
    call Call_000_0168
    or a
    ret z

    xor a
    ld [$c5ed], a
    ld a, [$c5a8]
    cp $00
    jr nz, jr_005_6843

    jp Jump_000_0165


jr_005_6843:
    ld a, $01
    ld [GAME_STATE], a
    xor a
    ld [SCREEN_SUBSTATE], a
    ret


Call_005_684d:
    ld hl, $cc00
    ld de, $a0f0
    ld bc, $0050

jr_005_6856:
    ld a, [hl+]
    ld [de], a
    inc de
    dec bc
    ld a, b
    or c
    jr nz, jr_005_6856

    ret


    ld a, [$c67f]
    or a
    jr z, jr_005_6868

    call Call_000_01ce

jr_005_6868:
    ld a, $3c
    ld [ANIM_FRAME], a
    ld a, $0a
    ld [$c5a5], a
    ld a, $07
    call Call_000_0159
    ld e, $45
    call Call_000_015c
    call Call_000_0174
    ld a, $08
    call Call_000_0162
    jp Jump_000_0165


    ld a, $01
    ld [RENDER_REQUEST], a
    ld a, $00
    call Call_000_0168
    or a
    ret z

    ldh a, [$ff8d]
    and $08
    jr z, jr_005_68a5

    ld a, $08
    call Call_000_0162
    call Call_000_0165
    call Call_000_0165
    ret


jr_005_68a5:
    ldh a, [$ff8d]
    and $01
    jr z, jr_005_68b0

    ld a, $3c
    ld [ANIM_FRAME], a

jr_005_68b0:
    ld a, [ANIM_FRAME]
    cp $3c
    jr z, jr_005_68bc

    inc a
    ld [ANIM_FRAME], a
    ret


jr_005_68bc:
    xor a
    ld [ANIM_FRAME], a
    ld a, [$c5a5]
    sub $01
    jr c, jr_005_68e4

    ld [$c5a5], a
    add $50
    ld b, $09
    ld c, $0a
    ld e, a
    call Call_000_0156
    ld h, $00
    ld l, $01
    ld b, $0a
    ld c, $12
    call Call_000_0153
    ld a, $17
    ldh [$ffa1], a
    ret


jr_005_68e4:
    xor a
    ld [ANIM_FRAME], a
    ld [$c5a5], a
    ld a, $08
    call Call_000_0162
    call Call_000_0165
    ret


    ld a, $01
    call Call_000_0168
    or a
    ret z

    xor a
    ld [SCREEN_SUBSTATE], a
    ld a, $01
    ld [GAME_STATE], a
    ret


    ld a, $01
    call Call_000_0168
    or a
    ret z

    ld e, $15
    call Call_000_015c
    ld a, $03
    ld [GAME_STATE], a
    ld a, $01
    ld [SCREEN_SUBSTATE], a
    ld a, [$c67f]
    or a
    jr z, jr_005_6924

    call Call_000_01c5

jr_005_6924:
    ld a, $09
    call Call_000_0159
    ld a, $02
    call Call_000_0159
    ld e, $22
    call Call_000_015c
    ld b, $03
    ld c, $04
    ld e, $8b
    call Call_000_0156
    call Call_000_01f2
    call Call_000_0174
    ld a, $08
    call Call_000_0162
    ld a, $04
    ldh [$ffa0], a
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

; ============================================================================
; GBC_NavQueueAndPump: called in place of Call_005_564a's final
; "call Call_000_0153" (iso-size 3-byte patch). Queues the 8x1 mode-label row
; as the original did, then pumps the CHR stream immediately: Call_000_1919
; (rewritten) stages the whole vignette in one call and arms the VBlank GDMA,
; so the label text and the vignette bitmaps swap on the same frame.
; ============================================================================
GBC_NavQueueAndPump:
    call Call_000_0153
    jp Call_000_017a

; ============================================================================
; Puzzle NEW GAME/CONTINUE menu, swapped so CONTINUE sits on top and is
; pre-selected when a save exists ($a459 != $ff). $c685 keeps its original
; meaning (0=NEW GAME, 1=CONTINUE); only the on-screen rows and the default
; are inverted (rows also swapped in Call_005_5d14/Call_005_5d31).
;
; GBC_PuzzleMenuReload: replaces the map $24 reload of Jump_005_450f
; (which bypasses the ss$00 init when backing out of the confirm screens).
; GBC_PuzzleMenuInit: replaces "xor a / ld [$c685],a / call Call_005_5d14"
; in the menu init. Both run right after the map was decompressed into the
; shadow map, so swapping the two text lines there is picked up by the
; GDMA flip.
; ============================================================================
GBC_PuzzleMenuReload:
    ld e, $24
    call Call_000_015c          ; decompress map $24 into shadow + queue redraw
GBC_PuzzleMenuInit:
    ld hl, $d146                ; shadow row 10 cols 6-13 ("NEW GAME")
    ld de, $d186                ; shadow row 12 cols 6-13 ("CONTINUE")
    ld b, $08
.swap:
    ld a, [de]
    ld c, a
    ld a, [hl]
    ld [de], a
    ld a, c
    ld [hl+], a
    inc de
    dec b
    jr nz, .swap
    ld a, $80                   ; blank, same tile the cursor-erase draws
    ld [$d145], a               ; cursor cell row 10 (map data embeds $f4 here)
    ld [$d185], a               ; cursor cell row 12
    ld a, [$a459]
    cp $ff
    ld a, $01                   ; save exists -> pre-select CONTINUE
    jr nz, .store
    xor a                       ; no save -> NEW GAME (CONTINUE would be a no-op)
.store:
    ld [$c685], a
    jp Call_005_5d14            ; draw cursor on the selected row

    ds $8000 - @, 0
