; ============================================================================
; bank00/02_main.asm — $0204-$1944: main loop, screen handlers, rewritten Call_000_1919 (CHR staging)
; Part of SECTION "ROM Bank $000"; included in order by bank00_core_engine.asm.
; ============================================================================
ASSERT @ == $0204 ; main entry, jumped to from the boot stub
Jump_000_0204:
    call Call_000_1a1a
    di
    xor a
    ldh [rIF], a

Call_000_020b:
    ldh [rIE], a
    ld sp, $fffe
    ld a, $0a
    ld [$0000], a
    ld a, $01
    ld [$2000], a
    ld a, $00
    ld [$4000], a
    call Call_000_1a41
    call Call_000_1af4
    call Call_000_1b00
    ld hl, $fe00
    ld c, $00

jr_000_022d:
    ld [hl+], a
    dec c
    jr nz, jr_000_022d

    ld hl, $ff80
    ld c, $7f

jr_000_0236:
    ld [hl+], a
    dec c
    jr nz, jr_000_0236

    call Call_000_19a3
    call Call_000_0321
    ld a, $01
    ld [RENDER_REQUEST], a
    call BootInitColors
    ld a, $83
    ldh [rLCDC], a
    xor a
    ldh [rIF], a
    ld a, $0d
    ldh [rIE], a
    ei
    call Call_000_21d0
    ld a, $07
    rst $10
    ld a, $00
    ld [$c67f], a
    call $434e
    jp nc, Jump_000_026d

    ld a, $01
    ld [$c67f], a
    call Call_001_4000

Jump_000_026d:
    ld a, $01
    rst $18

Jump_000_0270:
    ld a, [$c5db]
    inc a
    ld [$c5db], a
    ldh a, [$ff8c]
    and $0f
    cp $0f
    jp nz, Jump_000_0298

    ld a, [GAME_STATE]
    cp $00
    jr z, jr_000_0298

    cp $01
    jr z, jr_000_0298

    cp $0a
    jr z, jr_000_0298

    ld a, $0a
    ld [GAME_STATE], a
    xor a
    ld [SCREEN_SUBSTATE], a

Jump_000_0298:
jr_000_0298:
    ld a, [$c5de]
    or a
    jr nz, jr_000_02c1

    call Call_000_22df
    call Call_000_2236
    call Call_000_221f
    call Call_000_1971
    call Call_000_0592
    call Call_000_20e3
    call Call_000_1e17
    call GBC_FrameHook          ; was: call Call_000_1a5c (hook calls it first)
    call $7690
    call $504d
    ld a, $01
    ld [$c5de], a

jr_000_02c1:
    call Call_000_0343

jr_000_02c4:
    ldh a, [$ff92]
    and a
    jr z, jr_000_02c4

    xor a
    ldh [$ff92], a

Call_000_02cc:
    xor a
    ld [$c5de], a
    jp Jump_000_0270


Call_000_02d3:
    ld a, [$c5ec]
    ldh [rSCX], a
    ld a, [$c5ed]
    ldh [rSCY], a
    ld a, [$c5f0]
    ldh [rBGP], a
    ld a, [$c5f1]
    ldh [rOBP0], a
    ld a, [$c5f2]
    ldh [rOBP1], a
    ret


Jump_000_02ed:
    push af
    push bc
    push de

Call_000_02f0:
Jump_000_02f0:
    push hl
    ldh a, [$ff92]
    or a
    jr z, jr_000_02f8

    ld a, $00

jr_000_02f8:
    call Call_000_02d3
    ldh a, [$ff92]
    or a
    jr nz, jr_000_030c

    ld a, [RENDER_REQUEST]
    or a
    call nz, $ff80
    ei
    xor a
    ld [RENDER_REQUEST], a

jr_000_030c:
    ld a, $01
    ldh [$ff92], a
    call Call_000_2105
    pop hl
    pop de
    pop bc
    pop af
    reti


Call_000_0318:
jr_000_0318:
    ld a, $00
    ld [hl+], a
    dec bc
    ld a, b
    or c
    jr nz, jr_000_0318

    ret


Call_000_0321:
    ld hl, $ca00
    ld bc, $0200
    call Call_000_0318
    ld a, $ff
    ldh [rNR51], a
    ld [$cb95], a
    ld a, $8f
    ldh [rNR52], a
    xor a
    ldh [rNR12], a
    ldh [rNR22], a
    ldh [rNR32], a
    ldh [rNR42], a
    ld a, $77
    ldh [rNR50], a
    ret


Call_000_0343:
    ld a, $03
    ld [$2000], a
    call Call_001_4000
    ld a, $01
    ld [$2000], a
    ret


Jump_000_0351:
    ld a, $01
    rst $10
    call QueueTextDraw
    ld a, $05

Jump_000_0359:
    rst $18
    ret


Jump_000_035b:
    push af
    ld a, $01
    rst $10
    pop af
    call RenderTilemapCell
    ld a, $05
    rst $18
    ret


Jump_000_0367:
    call DispatchBankRoutine
    ld a, $05
    rst $18
    ret


Jump_000_036e:
    call Call_000_1904
    ld a, $05
    rst $18
    ret


Jump_000_0375:
    push af
    ld a, $01
    rst $10
    pop af
    call Call_001_67f8
    ld a, $05
    rst $18
    ret


Jump_000_0381:
    push af
    ld a, $01
    rst $10
    pop af
    call $67f8
    ld a, $05
    rst $18
    ret


Jump_000_038d:
    push af
    ld a, $01
    rst $10
    pop af
    call InitPaletteFade
    ld a, $05
    rst $18
    ret


Jump_000_0399:
    ld a, $01
    rst $10
    call AdvanceScreenState
    ld a, $05
    rst $18
    ret


Jump_000_03a3:
    push af
    ld a, $01
    rst $10
    pop af
    call StepPaletteFade
    push af
    ld a, $05
    rst $18
    pop af
    ret


Jump_000_03b1:
    call Call_000_1af4
    ld a, $05
    rst $18
    ret


Jump_000_03b8:
    call Call_000_1b00
    ld a, $05
    rst $18
    ret


Jump_000_03bf:
    call ClearSpriteBuffer
    ld a, $05
    rst $18
    ret


Jump_000_03c6:
    ld a, $0e
    rst $10
    call Call_000_1a50
    ld a, $05
    rst $18
    ret


Jump_000_03d0:
    ld a, $01
    rst $10
    call Call_000_1919
    ld a, $05
    rst $18
    ret


Jump_000_03da:
    ld a, $01
    rst $10
    call Call_001_6fcd
    ld a, $05
    rst $18
    ret


Jump_000_03e4:
    ld a, $01
    rst $10
    call $6727
    ld a, $05
    rst $18
    ret


Jump_000_03ee:
    ld a, $01

Call_000_03f0:
    rst $10
    call Call_000_2321
    ld a, $05
    rst $18
    ret


Jump_000_03f8:
    ld a, $01
    rst $10
    call Call_001_70a4
    ld a, $05
    rst $18
    ret


Jump_000_0402:
    ld a, $01
    rst $10
    call Call_001_5ac2
    ld a, $05

Call_000_040a:
    rst $18
    ret


Jump_000_040c:
    ld a, $01
    rst $10
    call Call_001_5c08
    ld a, $05
    rst $18
    ret


Jump_000_0416:
    ld a, $01
    rst $10
    call Call_001_5ca1
    ld a, $05
    rst $18
    ret


Jump_000_0420:
    ld a, $01
    rst $10
    call Call_001_5ef2
    ld a, $05
    rst $18
    ret


Jump_000_042a:
    ld a, $01
    rst $10
    call Call_001_547f
    push af
    ld a, $05
    rst $18
    pop af
    ret


Jump_000_0436:
    ld a, $01
    rst $10
    call Call_001_5ac2
    ld a, $02
    rst $18
    ret


Jump_000_0440:
    ld a, $02
    rst $10
    call $4b72
    ld a, $05
    rst $18
    ret


Jump_000_044a:
    ld a, $02
    rst $10
    call $4bdf
    ld a, $05
    rst $18
    ret


Jump_000_0454:
    ld a, $02
    rst $10
    call $4f26
    push af
    ld a, $05
    rst $18
    pop af
    ret


Jump_000_0460:
    ld a, $02
    rst $10
    call $50a7
    push af
    ld a, $05
    rst $18
    pop af
    ret


Jump_000_046c:
    ld a, $07
    rst $10
    call $40b2
    ld a, $05
    rst $18
    ret


Jump_000_0476:
    ld a, $07
    rst $10
    call $4118
    ld a, $05
    rst $18
    ret


Jump_000_0480:
    ld a, $07
    rst $10
    call $4131
    ld a, $05
    rst $18
    ret


Jump_000_048a:
    ld a, $07
    rst $10
    call $40ff
    ld a, $05
    rst $18
    ret


Jump_000_0494:
    ld a, $07
    rst $10
    call $40e6
    ld a, $05
    rst $18
    ret


Jump_000_049e:
    ld a, $07
    rst $10
    call $4163
    ld a, $05
    rst $18
    ret


Jump_000_04a8:
    ld a, $07
    rst $10
    call $417c
    ld a, $05
    rst $18
    ret


Jump_000_04b2:
    ld a, $07
    rst $10
    call $4195
    ld a, $05
    rst $18
    ret


Jump_000_04bc:
    ld a, $07
    rst $10
    call $41ae

Jump_000_04c2:
    ld a, $05
    rst $18
    ret


Jump_000_04c6:
    ld a, $07
    rst $10
    call $41c7
    ld a, $05
    rst $18
    ret


Jump_000_04d0:
    ld a, $07
    rst $10
    call $41e0
    ld a, $05
    rst $18
    ret


Jump_000_04da:
    ld a, $05
    rst $10
    call $61c4
    ld a, $02
    rst $18
    ret


Jump_000_04e4:
    ld a, $07
    rst $10
    call $414a
    ld a, $05
    rst $18
    ret


Jump_000_04ee:
    ld a, $07

Call_000_04f0:
Jump_000_04f0:
    rst $10
    call $41f9
    ld a, $05
    rst $18
    ret


Jump_000_04f8:
    ld a, $07
    rst $10
    call $4212
    ld a, $05
    rst $18
    ret


Jump_000_0502:
    ld a, $07
    rst $10
    call $422b
    ld a, $05
    rst $18
    ret


Jump_000_050c:
    ld a, $07
    rst $10
    call $4244
    ld a, $05
    rst $18
    ret


Jump_000_0516:
    ld a, $07
    rst $10
    call $425d
    ld a, $05
    rst $18
    ret


Jump_000_0520:
    ld a, $07
    rst $10
    call $4276
    ld a, $05
    rst $18
    ret


Jump_000_052a:
    ld a, $01
    rst $10
    call Call_000_205e
    ld a, $02
    rst $18
    ret


Jump_000_0534:
    ld a, $01
    rst $10
    call Call_001_5453
    ld a, $02
    rst $18
    ret


Jump_000_053e:
    ld a, $01
    rst $10
    call $6985
    ld a, $02
    rst $18
    ret


Jump_000_0548:
    ld a, $01
    rst $10
    call $5d3a
    ld a, $02
    rst $18
    ret


Jump_000_0552:
    ld a, $01
    rst $10
    call Call_001_7881
    ld a, $05
    rst $18
    ret


Jump_000_055c:
    ld a, $01
    rst $10
    call Call_000_06de
    ld a, $05
    rst $18
    ret


Jump_000_0566:
    call Call_000_1a41
    ld a, $05
    rst $18
    ret


Jump_000_056d:
    call Call_000_21d0
    ld a, $05
    rst $18
    ret


Jump_000_0574:
    ld a, $02
    rst $10
    call $5232
    ld a, $01
    rst $18
    ret


Jump_000_057e:
    ld a, $07
    rst $10
    call $428f
    ld a, $05
    rst $18
    ret


Jump_000_0588:
    ld a, $07
    rst $10
    call $42a8
    ld a, $05
    rst $18
    ret


Call_000_0592:
    ld a, [GAME_STATE]
    ld hl, $05a5
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


    cp e
    dec b
    push bc
    dec b
    rst $08
    dec b
    ld bc, $fa06
    jr @-$1b

    dec b
    sub e
    ld [$0f6d], sp
    reti


    dec b
    db $ed
    dec b
    rst $30
    dec b
    ld a, $05
    rst $10
    call Call_001_4000
    ld a, $01
    rst $18
    ret


    ld a, $05
    rst $10
    call $4154
    ld a, $01
    rst $18
    ret


    ld a, $05
    rst $10
    call $5580
    ld a, $01
    rst $18
    ret


    ld a, $05
    rst $10
    call $491f
    ld a, $01
    rst $18
    ret


    ld a, $05
    rst $10
    call $42b6
    ld a, $01
    rst $18
    ret


    ld a, $05
    rst $10
    call $58c6
    ld a, $01
    rst $18
    ret


    ld a, $05
    rst $10
    call jr_001_5a28
    ld a, $01
    rst $18

Jump_000_0600:
    ret


    ld a, [SCREEN_SUBSTATE]
    ld hl, $0614
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


    ld h, $06
    ld l, b
    ld b, $bb
    ld b, $f8
    ld b, $4e
    rlca
    adc l
    rlca
    ret c

    rlca
    ld [de], a
    ld [$085f], sp
    ld a, [$c67f]
    or a
    jr z, jr_000_062f

    call Call_000_01c5

jr_000_062f:
    ld a, $01
    ld [$c5a7], a
    ld a, $09
    call DispatchBankRoutine
    ld a, $02
    call DispatchBankRoutine
    ld a, $01
    rst $18
    ld e, $22
    call Call_000_1904
    ld b, $03
    ld c, $04
    ld e, $8b
    call RenderTilemapCell
    xor a
    ld [$c83d], a
    ld [$c83e], a
    call Call_000_06de
    call ClearSpriteBuffer
    ld a, $04
    ldh [$ffa0], a
    ld a, $08
    call InitPaletteFade
    jp AdvanceScreenState


    ld a, $00
    call StepPaletteFade
    or a
    ret z

    ldh a, [$ff8d]
    and $20
    jr z, jr_000_0688

    ld a, $03
    ldh [$ffa1], a
    ld a, [$c83e]
    sub $01
    jr nc, jr_000_0682

    ld a, $05

jr_000_0682:
    ld [$c83e], a
    jp Jump_000_069f


jr_000_0688:
    ldh a, [$ff8d]
    and $10
    jr z, jr_000_069f

    ld a, $03
    ldh [$ffa1], a
    ld a, [$c83e]
    add $01
    cp $06
    jr nz, jr_000_069c

    xor a

jr_000_069c:
    ld [$c83e], a

Jump_000_069f:
jr_000_069f:
    call Call_000_06de
    call GBC_LevelSelectB       ; was: ldh a,[$ff8d] / and $01 (B = back to SELECT MODE, iso-size)
    ret z
    nop

    call $781d
    ld a, $04
    ldh [$ffa1], a
    ld a, $04
    call InitPaletteFade
    ld a, $02
    ld [SOUND_CONTROL], a
    jp AdvanceScreenState


    ld a, $01
    call StepPaletteFade
    or a
    ret z

    ld b, $01
    ld c, $00
    ld e, $47
    call RenderTilemapCell
    ld h, $00
    ld l, $01
    ld b, $0a
    ld c, $11
    call QueueTextDraw
    ld a, $04
    call InitPaletteFade
    jp AdvanceScreenState


Call_000_06de:
    ld a, [$c83e]
    ld b, $a0
    add b
    ld b, $04
    ld c, $09
    ld e, a
    call RenderTilemapCell
    ld h, $01
    ld l, $24
    ld b, $04
    ld c, $02
    call QueueTextDraw
    ret


    ld a, $00
    call StepPaletteFade
    or a
    ret z

    xor a

Call_000_0700:
    ld [$c5ac], a
    ld hl, $c5f3
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    ld hl, $c60a
    ld [hl+], a
    ld [hl], a
    ld hl, $c60c
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    ld a, $ff
    ld hl, $c647
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    ld hl, $c610
    xor a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    ld [$c64a], a
    ld hl, $c1e0
    ld a, $11
    ld [hl], a
    ld hl, $c1e2
    ld a, $24
    ld [hl], a
    ld hl, $c1e3
    ld a, $38
    ld [hl], a
    ld hl, $c1e4
    ld a, $61
    ld [hl], a
    ld a, $02

Jump_000_0745:
    ld de, $c1e0
    call ClearObjectFields
    jp AdvanceScreenState


    ld hl, $c1ea
    ld a, [hl]
    cp $ff
    ret nz

    ld hl, $c1e0
    call Call_001_5453
    ld hl, $c0a5
    ld a, $01
    ld [hl], a
    ld hl, $c0e5
    ld a, $20
    ld [hl], a
    ld a, [$c83d]
    ld [$c0fd], a
    ld a, $ff
    ld [$c83f], a
    call Call_001_59c1

Jump_000_0775:
    call $7828
    call $5d3a
    call Call_001_5d87
    call Call_001_5ef2
    xor a
    ld [$c73d], a
    ld a, $ff
    ld [$c840], a
    jp AdvanceScreenState


    call Call_001_547f
    or a
    ret nz

    call Call_000_2321
    call $783d
    ld hl, $c0bc
    ld a, [hl]
    or a
    ret z

    xor a
    ld [ANIM_FRAME], a
    ld hl, $d02d
    xor a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    ld hl, $d04d
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    ld hl, $d06d
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    ld hl, $d08d
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    ld h, $00
    ld l, $2d

Jump_000_07c7:
    ld b, $06
    ld c, $04
    call Call_001_5e20
    ld a, $15
    ldh [$ffa0], a
    call ClearSpriteBuffer
    jp AdvanceScreenState


    ld a, [ANIM_FRAME]
    cp $b4
    jr z, jr_000_07f7

    inc a
    ld [ANIM_FRAME], a
    ld b, $04
    ld c, $06
    ld e, $03
    call RenderTilemapCell
    ld h, $00
    ld l, $01

Call_000_07f0:
    ld b, $0a
    ld c, $12
    jp QueueTextDraw


jr_000_07f7:
    xor a
    ld [ANIM_FRAME], a
    ld b, $01
    ld c, $00
    ld e, $44
    call RenderTilemapCell
    ld h, $00
    ld l, $01
    ld b, $0a
    ld c, $12
    call QueueTextDraw
    jp AdvanceScreenState


    ldh a, [$ff8d]
    and $0f
    jr nz, jr_000_0852

    ld a, [ANIM_FRAME]
    cp $b4
    jr z, jr_000_0852

    inc a
    ld [ANIM_FRAME], a
    ld hl, $c610
    ld de, $d067
    call Call_001_599c
    ld hl, $c611
    ld de, $d0c7
    call Call_001_599c
    ld hl, $c612
    ld de, $d127
    call Call_001_599c
    ld hl, $c613
    ld de, $d187
    call Call_001_599c
    ld h, $00
    ld l, $01
    ld b, $0a
    ld c, $12
    jp QueueTextDraw


jr_000_0852:
    ld a, $02
    ld [SOUND_CONTROL], a
    ld a, $08
    call InitPaletteFade
    jp AdvanceScreenState


    ld a, $01
    call StepPaletteFade
    or a
    ret z

    ld a, $02
    rst $10
    call $49f0
    push af
    ld a, $01
    rst $18
    pop af
    or a
    jr nz, jr_000_0884

    ld e, $15
    call Call_000_1904
    ld a, $04
    ld [GAME_STATE], a
    ld a, $09
    ld [SCREEN_SUBSTATE], a
    ret


jr_000_0884:
    ld e, $15
    call Call_000_1904
    ld a, $04
    ld [GAME_STATE], a
    xor a
    ld [SCREEN_SUBSTATE], a
    ret


    ld a, [SCREEN_SUBSTATE]
    ld hl, $08a6
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


    db $ec
    ld [$0921], sp
    ld c, b
    add hl, bc
    ld c, h
    ld a, [bc]
    adc d
    ld a, [bc]
    push de
    ld a, [bc]
    or $0a
    ld [hl], b
    dec bc
    and b
    dec bc
    ld [$200c], sp
    inc c
    ld h, c
    inc c
    add d

Call_000_08bf:
    inc c
    and $0e

Jump_000_08c2:
    and $0e
    and $0e
    or h
    inc c
    pop bc
    inc c
    dec a
    dec c
    and l
    dec c
    or h
    dec c
    pop de
    dec c
    ld a, [bc]
    ld c, $19
    ld c, $2b
    ld c, $3f
    ld c, $4e
    ld c, $65
    ld c, $e6
    ld c, $e6
    ld c, $e6
    ld c, $e6
    ld c, $76
    ld c, $bd
    ld c, $d6
    ld c, $fa
    ld a, a
    add $b7

Call_000_08f0:
    jr z, jr_000_08f5

    call Call_000_01bf

jr_000_08f5:
    ld a, $01
    ld [$c5a7], a
    ld a, $09
    call DispatchBankRoutine
    ld a, $03
    call DispatchBankRoutine
    ld a, $01
    rst $18
    ld b, $00
    ld c, $00
    ld e, $23
    call RenderTilemapCell
    ld h, $00
    ld l, $00
    ld b, $14
    ld c, $20
    call QueueTextDraw
    call ClearSpriteBuffer
    jp AdvanceScreenState


    xor a
    ld hl, $c736
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    ld [$c72d], a
    ld hl, $a010
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
    jp AdvanceScreenState


    ld hl, $a010
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
    ld a, [$c72d]
    or a
    jr nz, jr_000_0969

    ld a, $08
    call InitPaletteFade

jr_000_0969:
    ld a, [$c6db]
    add $0a
    ldh [$ffa0], a
    ld [$c840], a
    call $6727
    call ClearSpriteBuffer
    call Call_001_5ac2
    call Call_001_5c08
    call Call_001_5ca1
    call Call_001_5ef2
    call AdvanceScreenState
    xor a
    ld [ANIM_FRAME], a
    ld b, $01
    ld c, $00
    ld e, $47
    call RenderTilemapCell
    ld h, $00
    ld l, $01
    ld b, $10
    ld c, $11
    call QueueTextDraw
    ld a, [$a459]
    cp $1f
    jp z, Jump_000_09f4

    ld a, [$c6dc]
    add $01
    ld c, $00

jr_000_09af:
    ld b, a
    sub $0a
    jr c, jr_000_09b7

    inc c
    jr jr_000_09af

jr_000_09b7:
    ld a, c
    or a
    jr nz, jr_000_09d1

    push bc
    ld b, $03
    ld c, $07
    ld e, $80
    call RenderTilemapCell
    pop bc
    ld a, b
    add $81
    ld b, $09

Jump_000_09cb:
    ld c, $07
    ld e, a
    jp RenderTilemapCell


jr_000_09d1:
    push bc
    ld b, $02
    ld c, $07
    ld e, $80
    call RenderTilemapCell
    pop bc
    push bc
    ld a, c
    add $81
    ld b, $08
    ld c, $07
    ld e, a
    call RenderTilemapCell
    pop bc
    ld a, b
    add $81
    ld b, $09
    ld c, $07
    ld e, a
    jp RenderTilemapCell


Jump_000_09f4:
    ld b, $02
    ld c, $07
    ld e, $80
    call RenderTilemapCell
    ld a, [$c5c4]
    inc a
    ld b, $64
    ld c, $00

jr_000_0a05:
    ld d, a
    sub b
    jr c, jr_000_0a0c

    inc c
    jr jr_000_0a05

jr_000_0a0c:
    ld a, c
    or a
    jr z, jr_000_0a1c

    add $81
    push de
    ld b, $07

Jump_000_0a15:
    ld c, $07
    ld e, a
    call RenderTilemapCell
    pop de

jr_000_0a1c:
    ld a, d
    ld b, $0a
    ld c, $00

jr_000_0a21:
    ld d, a
    sub b
    jr c, jr_000_0a28

    inc c
    jr jr_000_0a21

jr_000_0a28:
    ld a, c
    add $81
    push de
    ld b, $08
    ld c, $07
    ld e, a
    call RenderTilemapCell
    pop de
    ld a, d
    ld b, $01
    ld c, $00

jr_000_0a3a:
    ld d, a
    sub b
    jr c, jr_000_0a41

    inc c
    jr jr_000_0a3a

jr_000_0a41:
    ld a, c
    add $81
    ld b, $09
    ld c, $07
    ld e, a
    jp RenderTilemapCell


    ld a, $01
    ld [RENDER_REQUEST], a
    ld a, [$c72d]
    or a
    jr nz, jr_000_0a5e

    ld a, $00
    call StepPaletteFade
    or a
    ret z

jr_000_0a5e:
    ld a, [ANIM_FRAME]
    cp $78

Jump_000_0a63:
    jr z, jr_000_0a6a

    inc a
    ld [ANIM_FRAME], a
    ret


jr_000_0a6a:
    call Call_000_0ee7
    ld hl, $c0e5
    ld a, $51
    ld [hl], a
    ld hl, $c1a5
    ld a, $54
    ld [hl], a
    ld a, $00
    ld [$c1b4], a
    xor a
    ld [$c72d], a
    ld a, $01
    ld [$c73d], a
    jp AdvanceScreenState


    call Call_001_547f
    or a
    ret nz

    call Call_000_2321
    ld a, [$c116]
    or a
    call z, $6fcd
    call Call_001_70a4
    call Call_001_7881
    ld a, [$c69a]
    or a
    jr z, jr_000_0ab2

    ldh a, [$ff8c]
    and $44
    cp $44
    jr nz, jr_000_0ab2

    ld a, $02
    ld [$c0bc], a

jr_000_0ab2:
    ld hl, $c0bc
    ld a, [hl]
    or a
    ret z

    cp $02
    jr z, jr_000_0acf

    xor a
    ld [ANIM_FRAME], a
    ld a, $01
    ld [$c72d], a
    call ClearSpriteBuffer
    ld a, $13
    ldh [$ffa0], a
    jp AdvanceScreenState


jr_000_0acf:
    ld a, $10
    ld [SCREEN_SUBSTATE], a
    ret


    ld a, $3c
    ld [ANIM_FRAME], a
    ld a, $0a
    ld [$c5a5], a
    ld b, $01
    ld c, $04
    ld e, $60
    call RenderTilemapCell
    ld h, $00
    ld l, $00
    ld b, $14
    ld c, $12
    call QueueTextDraw
    jp AdvanceScreenState


    ld a, $01
    ld [RENDER_REQUEST], a
    ldh a, [$ff8d]
    and $09
    jr z, jr_000_0b20

    ld b, $01
    ld c, $00
    ld e, $47
    call RenderTilemapCell
    ld h, $00
    ld l, $01
    ld b, $0a
    ld c, $11
    call GBC_ContinuePreviewErase ; was: call QueueTextDraw
    ld a, $01
    ldh [$ffa0], a
    xor a
    ld [ANIM_FRAME], a
    jp AdvanceScreenState


jr_000_0b20:
    ldh a, [$ff8d]
    and $02
    jr z, jr_000_0b2b

    ld a, $3c
    ld [ANIM_FRAME], a

jr_000_0b2b:
    ld a, [ANIM_FRAME]
    cp $3c
    jr z, jr_000_0b37

    inc a
    ld [ANIM_FRAME], a
    ret


jr_000_0b37:
    xor a
    ld [ANIM_FRAME], a
    ld a, [$c5a5]
    sub $01
    jr c, jr_000_0b5f

    ld [$c5a5], a
    add $61
    ld b, $0a
    ld c, $04
    ld e, a
    call RenderTilemapCell
    ld h, $00
    ld l, $01
    ld b, $0a
    ld c, $12
    call QueueTextDraw
    ld a, $17
    ldh [$ffa1], a
    ret


jr_000_0b5f:
    xor a
    ld [ANIM_FRAME], a
    ld [$c5a5], a
    ld a, $01
    ldh [$ffa0], a
    call AdvanceScreenState
    jp AdvanceScreenState


    ld a, [ANIM_FRAME]
    inc a
    ld [ANIM_FRAME], a
    cp $05
    ret nz

    ld a, $09
    call DispatchBankRoutine
    ld a, $03
    call DispatchBankRoutine
    ld a, $01
    rst $18
    ld a, [$c5fc]
    cp $99
    jr z, jr_000_0b9a

    ld hl, $c5fd
    xor a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl], $01
    call Call_001_5ac2

jr_000_0b9a:
    ld a, $02
    ld [SCREEN_SUBSTATE], a
    ret


    ld de, $c0a0
    ld hl, $0014
    add hl, de
    ld a, [hl]
    cp $2d
    jp z, Jump_000_0be3

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

Jump_000_0bbf:
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
    jp Call_001_5e20


Jump_000_0be3:
    ld a, $15
    ldh [$ffa0], a
    ld hl, $c0a0
    call Call_001_5453
    ld b, $04
    ld c, $06
    ld e, $03
    call RenderTilemapCell
    ld h, $00
    ld l, $01
    ld b, $0a
    ld c, $12
    call QueueTextDraw
    xor a
    ld [ANIM_FRAME], a
    jp AdvanceScreenState


    ld a, [ANIM_FRAME]
    cp $b4
    jr z, jr_000_0c14

    inc a
    ld [ANIM_FRAME], a
    ret


jr_000_0c14:
    xor a
    ld [ANIM_FRAME], a
    ld a, $08
    call InitPaletteFade
    jp AdvanceScreenState


    ld a, $01
    call StepPaletteFade
    or a
    ret z

    ld a, [$c67f]
    or a
    jr z, jr_000_0c30

    call Call_000_01c2

jr_000_0c30:
    ld b, $00
    ld c, $00
    ld e, $27
    call RenderTilemapCell
    ld h, $00
    ld l, $00
    ld b, $14
    ld c, $12
    call QueueTextDraw
    call ClearSpriteBuffer
    ld a, $02
    rst $10
    call $46fd
    ld a, $01
    rst $18
    ld a, $08
    call InitPaletteFade
    ld a, $05

Call_000_0c57:
    rst $10
    call $6254
    ld a, $01
    rst $18
    jp AdvanceScreenState


    ld a, [$a459]
    cp $1f
    jp z, AdvanceScreenState

    ld a, $00
    call StepPaletteFade
    or a
    ret z

    ldh a, [$ff8d]
    and $0f
    ret z

    ld a, $08
    call InitPaletteFade
    ld a, $02
    ld [SOUND_CONTROL], a
    jp AdvanceScreenState


    ld a, [$a459]
    cp $1f
    jp z, Jump_000_0c91

    ld a, $01
    call StepPaletteFade
    or a
    ret z

Jump_000_0c91:
    ld a, $02
    rst $10
    call $4a84
    push af
    ld a, $01
    rst $18
    pop af
    or a
    jr nz, jr_000_0caa

    ld a, $04
    ld [GAME_STATE], a
    ld a, $09
    ld [SCREEN_SUBSTATE], a
    ret


jr_000_0caa:
    ld a, $04
    ld [GAME_STATE], a
    xor a
    ld [SCREEN_SUBSTATE], a
    ret


    ld a, $08
    call InitPaletteFade
    ld a, $02
    ld [SOUND_CONTROL], a
    jp AdvanceScreenState


    ld a, $01
    call StepPaletteFade
    or a
    ret z

    ld hl, $a010

Call_000_0ccb:
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
    ld a, $05
    rst $10
    call $61c4
    ld a, $01
    rst $18
    ld a, [$c6dc]
    inc a
    ld [$c6dc], a
    ld a, [$c5c4]
    inc a
    ld [$c5c4], a
    ld a, [$c6dc]
    cp $14
    jr z, jr_000_0d0b

    ld a, $05
    rst $10

Jump_000_0cff:
    call $628d
    ld a, $01
    rst $18
    ld a, $02
    ld [SCREEN_SUBSTATE], a
    ret


jr_000_0d0b:
    ld a, [$a459]
    cp $1f
    jp z, Jump_000_0d19

    ld a, $20
    ld [SCREEN_SUBSTATE], a
    ret


Jump_000_0d19:
    ld a, [$c5c4]
    cp $64
    jr z, jr_000_0d3a

    ld a, [$c6db]
    inc a
    ld [$c6db], a
    xor a
    ld [$c6dc], a
    ld a, $05
    rst $10
    call $628d
    ld a, $01
    rst $18
    ld a, $02
    ld [SCREEN_SUBSTATE], a
    ret


jr_000_0d3a:
    jp AdvanceScreenState


    ld a, [$c6db]
    cp $04
    jr z, jr_000_0d79

    ld a, [$c67f]
    or a
    jr z, jr_000_0d4d

    call Call_000_01bc

jr_000_0d4d:
    ld a, $0a
    call DispatchBankRoutine
    ld a, [$c6db]
    add $0b
    call DispatchBankRoutine
    ld a, $01
    rst $18
    ld a, [$c6db]
    add $30
    ld e, a
    call Call_000_1904
    call ClearSpriteBuffer
    ld a, $17
    ldh [$ffa0], a
    ld a, $08
    call InitPaletteFade
    xor a
    ld [$c5ed], a
    jp AdvanceScreenState


jr_000_0d79:
    ld a, [$c67f]
    or a
    jr z, jr_000_0d82

    call Call_000_01e0

jr_000_0d82:
    ld a, $10
    call DispatchBankRoutine
    ld a, $01
    rst $18
    ld e, $35
    call Call_000_1904
    call ClearSpriteBuffer
    ld a, $18
    ldh [$ffa0], a
    ld a, $08
    call InitPaletteFade
    xor a
    ld [$c5ed], a
    ld a, $16
    ld [SCREEN_SUBSTATE], a
    ret


    ld a, $00
    call StepPaletteFade
    or a
    ret z

    ld a, $90
    ld [$c5ab], a
    jp AdvanceScreenState


    ldh a, [$ff8d]
    and $01
    jr nz, jr_000_0dc4

    ld a, [$c5ab]
    dec a
    ld [$c5ab], a
    cp $00
    ret nz

jr_000_0dc4:
    ld a, $08
    call InitPaletteFade
    ld a, $02
    ld [SOUND_CONTROL], a
    jp AdvanceScreenState


    ld a, $01
    call StepPaletteFade
    or a
    ret z

    ld hl, $0e02
    ld a, [$c6db]
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, [$c67e]
    or b
    ld [$c67e], a
    ld [$a459], a
    ld a, $05
    rst $10
    call $61c4
    ld a, $01
    rst $18
    ld a, $05
    ld [GAME_STATE], a
    ld a, $0a
    ld [SCREEN_SUBSTATE], a
    ret


    ld bc, $0402
    ld [$2010], sp
    ld b, b
    add b
    ld a, $00
    call StepPaletteFade
    or a
    ret z

    ld a, $d8
    ld [$c5ab], a
    jp AdvanceScreenState


    ld a, [$c5ab]
    dec a
    ld [$c5ab], a
    cp $00
    ret nz

    ld a, $08
    call InitPaletteFade
    jp AdvanceScreenState


    ld a, $01
    call StepPaletteFade
    or a
    ret z

    ld e, $36
    call Call_000_1904
    ld a, $08
    call InitPaletteFade
    jp AdvanceScreenState


    ld a, $00
    call StepPaletteFade
    or a
    ret z

    ld a, $d8
    ld [$c5ab], a
    jp AdvanceScreenState


    ld a, [$c5ab]
    dec a
    ld [$c5ab], a
    cp $00
    ret nz

    ld a, $08
    call InitPaletteFade
    ld a, $02
    ld [SOUND_CONTROL], a
    jp AdvanceScreenState


    ld a, $01
    call StepPaletteFade
    or a
    ret z

    ld a, $09
    ld [GAME_STATE], a
    xor a
    ld [SCREEN_SUBSTATE], a
    ret


    ld a, [$c67f]
    or a
    jr z, jr_000_0e7f

    call Call_000_01c2

jr_000_0e7f:
    xor a
    ld [$c5ed], a
    ld b, $00
    ld c, $00
    ld e, $27
    call RenderTilemapCell
    ld b, $07
    ld c, $0d
    ld e, $0d
    call RenderTilemapCell
    ld b, $0a
    ld c, $0d
    ld e, $0d
    call RenderTilemapCell
    ld h, $00
    ld l, $00
    ld b, $14
    ld c, $12
    call QueueTextDraw
    call ClearSpriteBuffer
    ld a, $02
    rst $10
    call $46fd
    ld a, $01
    rst $18
    ld a, $08
    call InitPaletteFade
    jp AdvanceScreenState


    ld a, $00
    call StepPaletteFade
    or a
    ret z

    ldh a, [$ff8d]
    and $0f
    ret z

    ld a, $08
    call InitPaletteFade
    ld a, $02
    ld [SOUND_CONTROL], a

Call_000_0ed3:
    jp AdvanceScreenState


    ld a, $01
    call StepPaletteFade
    or a
    ret z

    call ClearSpriteBuffer
    ld a, $12
    ld [SCREEN_SUBSTATE], a
    ret


    ret


Call_000_0ee7:
    ld b, $01
    ld c, $00
    ld e, $47
    call RenderTilemapCell
    ld a, $09

Call_000_0ef2:
    rst $10
    ld a, [$c6db]
    ld d, $00
    ld e, a
    sla e
    rl d
    ld hl, $4000
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [$c6dc]
    ld d, $00
    ld e, a
    sla e

Jump_000_0f0c:
    rl d
    add hl, de

Call_000_0f0f:
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld d, h
    ld e, l
    ld hl, $d041
    ld c, $0f

jr_000_0f19:
    push hl
    ld b, $05

jr_000_0f1c:
    ld a, [de]

Jump_000_0f1d:
    and $f0
    jr z, jr_000_0f32

    push hl
    push de
    swap a
    dec a
    and $07
    ld d, $00
    ld e, a
    ld hl, $0f65
    add hl, de
    ld a, [hl]
    pop de
    pop hl

jr_000_0f32:
    ld [hl+], a
    ld a, [de]
    and $0f
    jr z, jr_000_0f47

    push hl
    push de
    dec a
    and $07
    ld d, $00
    ld e, a
    ld hl, $0f65
    add hl, de
    ld a, [hl]
    pop de
    pop hl

jr_000_0f47:
    ld [hl+], a
    inc de
    dec b
    jr nz, jr_000_0f1c

    pop hl
    push bc
    ld bc, $0020
    add hl, bc
    pop bc
    dec c
    jr nz, jr_000_0f19

    ld a, $01
    rst $18
    ld h, $00
    ld l, $01
    ld b, $0a
    ld c, $12
    call QueueTextDraw
    ret


    ldh [$ffe1], a
    ldh [c], a
    db $e3
    db $e4
    push hl
    and $e0
    call $73bc
    call $73c2
    ld a, [SCREEN_SUBSTATE]

Jump_000_0f76:
    ld hl, $0f86
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


    jp z, $d00f

    rrca
    db $e4
    rrca
    rst $28
    rrca
    ld a, [de]
    db $10
    ld b, c
    db $10
    sbc l
    db $10
    jp $fc10


    db $10
    ld e, $11
    ld l, b
    ld de, $11ae
    ret


    ld de, $11fe
    inc d
    ld [de], a
    ld a, [hl-]
    ld [de], a
    or l
    ld [de], a
    rst $30
    ld [de], a
    ld l, l
    inc de
    and e
    inc de
    push bc
    inc de
    rrca
    inc d
    ld a, h
    inc d
    sub c
    inc d
    rst $30
    inc d
    ld a, [de]
    dec d
    ld d, c
    dec d
    ld l, d
    dec d
    ld a, a
    dec d
    and a
    dec d
    cp a
    ld d, $fb
    ld d, $31

Call_000_0fc7:
    rla
    ld l, c
    rla
    call Call_000_2216
    jp AdvanceScreenState


    ld a, [$d605]
    or a
    jr nz, jr_000_0fd9

    jp AdvanceScreenState


jr_000_0fd9:
    ld a, $fe
    ld [$d62d], a
    call AdvanceScreenState
    jp AdvanceScreenState


    ld a, $02
    ld [GAME_STATE], a
    ld a, $01
    ld [SCREEN_SUBSTATE], a
    ret


    call IncrementAttractCounter
    or a
    ret nz

    call $67f8
    ld a, $15
    call DispatchBankRoutine
    ld a, $16
    call DispatchBankRoutine

Jump_000_1001:
    ld a, $01
    rst $18
    xor a
    ld [$c5ed], a
    ld [ANIM_FRAME], a
    call ClearSpriteBuffer
    ld a, [$c67f]
    or a
    jr z, jr_000_1017

    call Call_000_01fe

jr_000_1017:
    jp AdvanceScreenState


    call IncrementAttractCounter
    or a
    ret nz

    ld a, [ANIM_FRAME]
    inc a
    ld [ANIM_FRAME], a
    cp $0a
    ret nz

    ld a, $04
    call DispatchBankRoutine
    ld a, $01
    rst $18
    ld a, $05
    rst $10
    call $61eb
    ld a, $01
    rst $18
    xor a
    ld [$cb90], a
    jp AdvanceScreenState


    call IncrementAttractCounter
    or a
    ret nz

    ld a, $00
    ld [$c7a1], a
    ld [$c7a2], a
    ld [$c7a5], a
    ld [$c7a6], a
    ld b, $00
    ld c, $00
    ld e, $4f
    call RenderTilemapCell
    ld h, $00
    ld l, $00
    ld b, $14
    ld c, $12
    call QueueTextDraw
    ld a, $03
    call InitPaletteFade
    xor a
    ld [$c7d3], a
    ld a, $01
    ld [$c7d2], a
    ld hl, $c240
    ld a, $01
    ld [hl], a
    ld hl, $c242
    ld a, $30
    ld [hl], a
    ld hl, $c243
    ld a, $58
    ld [hl], a
    ld hl, $c244
    ld a, $c0
    ld [hl], a
    ld a, $01
    ld de, $c240
    call ClearObjectFields
    ld a, $04
    ldh [$ffa0], a
    jp AdvanceScreenState


    call IncrementAttractCounter
    or a
    ret nz

    ld a, $01
    ld [RENDER_REQUEST], a
    ld a, $00
    call StepPaletteFade
    or a
    ret z

    call $76e0
    or a
    ret z

    ld a, $04
    ldh [$ffa1], a
    ld a, $03
    call InitPaletteFade
    xor a
    ld [ANIM_FRAME], a
    jp AdvanceScreenState


    call IncrementAttractCounter
    or a
    ret nz

    ld a, [ANIM_FRAME]
    inc a
    cp $5a
    jp z, Jump_000_10f4

    ld [ANIM_FRAME], a
    ld a, [$d601]
    or a
    jr z, jr_000_10e6

    ld a, [$c7d3]
    or $80
    ld [$d62d], a
    call $773e
    ret


jr_000_10e6:
    ld a, [GAME_MODE]
    or a
    ret z

    and $0f
    ld [$c7d3], a
    call $773e
    ret


Jump_000_10f4:
    ld a, $02
    ld [SOUND_CONTROL], a
    jp AdvanceScreenState


    call IncrementAttractCounter
    or a
    ret nz

    ld a, $01
    ld [RENDER_REQUEST], a
    ld a, $01
    call StepPaletteFade

Jump_000_110b:
    or a
    ret z

    xor a
    ld [ANIM_FRAME], a

Jump_000_1111:
    ld hl, $c240
    call Call_001_5453
    xor a
    ld [$c5c4], a
    jp AdvanceScreenState


    call IncrementAttractCounter
    or a
    ret nz

    ld a, [$c67f]
    or a
    jr z, jr_000_112c

    call Call_000_0201

jr_000_112c:
    ld b, $00
    ld c, $00
    ld e, $29
    call RenderTilemapCell
    xor a
    ld [$c7a9], a
    ld [$c7aa], a
    ld [$c7ca], a
    ld [$c7cb], a
    ld [$c7cc], a
    ld [$c7cd], a
    ld [$c7ce], a
    ld [$c7cf], a
    ld [$c7d0], a
    ld [$c7d1], a
    ld [$c7a3], a
    ld [$c7a4], a
    ld [$c7a7], a
    ld [$c7a8], a
    ld a, $01
    ld [$c7a0], a
    jp AdvanceScreenState


    call IncrementAttractCounter
    or a
    ret nz

    ld a, [GAME_MODE]
    cp $11
    jr jr_000_117a

    ld a, $11
    ld [$d62d], a
    ret


jr_000_117a:
    ld a, $03
    call InitPaletteFade
    call $7253
    call ClearSpriteBuffer
    call Call_001_7343
    call $7454
    call Call_001_74cd
    ld a, $00
    ld [ANIM_FRAME], a
    ld b, $01
    ld c, $00
    ld e, $71
    call RenderTilemapCell
    ld h, $00
    ld l, $00
    ld b, $0a
    ld c, $18
    call QueueTextDraw
    ld a, $04
    ldh [$ffa0], a
    jp AdvanceScreenState


    call IncrementAttractCounter
    or a
    ret nz

    ld h, $00
    ld l, $0a
    ld b, $0a
    ld c, $18
    call QueueTextDraw
    ld a, $01
    ld [$d62d], a
    ld [$c7ac], a
    jp AdvanceScreenState


    call IncrementAttractCounter
    or a
    ret nz

    ld a, $02
    rst $10
    call $54c5
    ld a, $01
    rst $18
    ld hl, $c1e0
    ld a, $01
    ld [hl], a
    ld hl, $c1e2
    ld a, $28
    ld [hl], a
    ld hl, $c1e3
    ld a, $18
    ld [hl], a
    ld hl, $c1e4
    ld a, $c0
    ld [hl], a
    ld a, $01
    ld de, $c1e0
    call ClearObjectFields
    xor a
    ld [ANIM_FRAME], a
    jp AdvanceScreenState


    call IncrementAttractCounter
    or a

Jump_000_1202:
    ret nz

    ld a, [ANIM_FRAME]
    inc a
    ld [ANIM_FRAME], a
    cp $14
    ret nz

    xor a
    ld [ANIM_FRAME], a
    jp AdvanceScreenState


    call IncrementAttractCounter
    or a
    ret nz

    ld a, [ANIM_FRAME]
    cp $0a
    jr z, jr_000_1230

    inc a
    ld [ANIM_FRAME], a
    ld a, $01
    ld [$d62d], a
    call Call_000_1787
    call $17dc
    ret


jr_000_1230:
    xor a
    ld [$c7d4], a
    ld [$c7d5], a
    jp AdvanceScreenState


    call IncrementAttractCounter
    or a
    ret nz

    ld a, $01
    ld [RENDER_REQUEST], a
    ld a, $00
    call StepPaletteFade
    or a
    jp z, Jump_000_12b1

    ldh a, [$ff8d]
    and $01
    jr z, jr_000_1264

    ld a, $04
    ldh [$ffa1], a
    ld a, $04
    ld [$d62d], a
    ld a, $00
    ld [ANIM_FRAME], a
    jp AdvanceScreenState


jr_000_1264:
    ldh a, [$ff8d]
    and $40
    jr z, jr_000_1288

    ld a, $13
    ldh [$ffa1], a
    ld a, [$c7ac]
    cp $01
    jr z, jr_000_127e

    dec a
    ld [$c7ac], a
    ld [$d62d], a
    jr jr_000_12aa

jr_000_127e:
    ld a, $03
    ld [$c7ac], a
    ld [$d62d], a
    jr jr_000_12aa

jr_000_1288:
    ldh a, [$ff8d]
    and $80
    jr z, jr_000_12b1

    ld a, $13
    ldh [$ffa1], a
    ld a, [$c7ac]
    cp $03
    jr z, jr_000_12a2

    inc a
    ld [$c7ac], a
    ld [$d62d], a
    jr jr_000_12aa

jr_000_12a2:
    ld a, $01
    ld [$c7ac], a
    ld [$d62d], a

jr_000_12aa:
    call Call_000_1787
    call $17dc
    ret


Jump_000_12b1:
jr_000_12b1:
    call $17dc
    ret


    call IncrementAttractCounter
    or a
    ret nz

    ld a, $01
    ld [RENDER_REQUEST], a
    call $17dc
    ld a, $04
    ld [$d62d], a
    ld a, [GAME_MODE]
    cp $04
    jr z, jr_000_12e5

    ld a, [ANIM_FRAME]

Jump_000_12d1:
    inc a
    ld [ANIM_FRAME], a
    and $08
    jr z, jr_000_12df

    ld hl, $c1e0

Call_000_12dc:
    ld [hl], $00
    ret


jr_000_12df:
    ld hl, $c1e0
    ld [hl], $01
    ret


jr_000_12e5:
    ld a, $03
    call InitPaletteFade
    ld a, $00
    ld [ANIM_FRAME], a
    ld a, $02
    ld [SOUND_CONTROL], a
    jp AdvanceScreenState


    call IncrementAttractCounter
    or a
    ret nz

    ld a, $01
    call StepPaletteFade
    or a
    ret z

    ld a, [$d601]
    or a
    jr z, jr_000_1320

    call Call_001_5e0c
    ld a, [$c5c5]
    and $01
    ld [$d62d], a
    ld [$c7ad], a
    call Call_001_5e0c
    ld a, [$c5c5]
    ld [$c7ae], a

jr_000_1320:
    call ClearSpriteBuffer
    ld a, $03
    call InitPaletteFade
    call AdvanceScreenState
    ld b, $01
    ld c, $00
    ld e, $47
    call RenderTilemapCell
    ld a, $02
    rst $10
    call $47c4
    ld a, $01
    rst $18
    ld a, [$c7d2]
    add $81
    ld hl, $d0c1
    ld [hl], a

Jump_000_1346:
    ld b, $02
    ld c, $06
    ld e, $77
    call RenderTilemapCell
    ld b, $03
    ld c, $08
    ld e, $78
    call RenderTilemapCell
    ld a, [$c7a0]
    add $81

Jump_000_135d:
    ld hl, $d109
    ld [hl], a
    ld h, $00
    ld l, $01
    ld b, $0a
    ld c, $11
    call QueueTextDraw
    ret


    call IncrementAttractCounter
    or a
    ret nz

    ld a, [$d601]
    or a
    jr nz, jr_000_1383

    ld a, [GAME_MODE]
    or a
    jr z, jr_000_1389

    ld [$c7ad], a
    jr jr_000_1389

jr_000_1383:
    ld a, [$c7ad]
    ld [$d62d], a

jr_000_1389:
    ld a, $00
    call StepPaletteFade
    or a
    ret z

    ld a, [ANIM_FRAME]
    cp $78
    jr z, jr_000_139c

    inc a
    ld [ANIM_FRAME], a
    ret


jr_000_139c:
    xor a
    ld [ANIM_FRAME], a
    jp AdvanceScreenState


    call IncrementAttractCounter
    or a
    ret nz

    ld a, [ANIM_FRAME]
    inc a
    ld [ANIM_FRAME], a
    cp $05
    ret nz

    ld a, [$d601]
    or a
    jr z, jr_000_13be

    ld a, [$c7ae]
    ld [$d62d], a

jr_000_13be:
    xor a
    ld [ANIM_FRAME], a
    jp AdvanceScreenState


    call IncrementAttractCounter
    or a
    ret nz

    ld a, [$d601]
    or a
    jr nz, jr_000_13de

    ld a, [GAME_MODE]
    or a
    jr z, jr_000_13e4

    ld a, [GAME_MODE]
    ld [$c7ae], a
    jr jr_000_13e4

jr_000_13de:
    ld a, [$c7ae]
    ld [$d62d], a

jr_000_13e4:
    ld a, [ANIM_FRAME]
    cp $0a
    jr z, jr_000_13f0

    inc a
    ld [ANIM_FRAME], a
    ret


jr_000_13f0:
    ld hl, $c1e0
    ld a, $01
    ld [hl], a
    ld hl, $c1e2
    ld a, $24
    ld [hl], a
    ld hl, $c1e3
    ld a, $98
    ld [hl], a
    ld hl, $c1e4
    ld a, $c4
    ld [hl], a
    xor a
    ld [ANIM_FRAME], a
    jp AdvanceScreenState


    call IncrementAttractCounter
    or a
    ret nz

    ld a, $01
    ld [RENDER_REQUEST], a
    ld de, $c1e0
    ld hl, $0003
    add hl, de
    ld a, [hl]
    cp $48
    jr z, jr_000_1430

    sub $04
    ld [hl], a
    cp $48
    ret nz

    ld a, $18
    ldh [$ffa1], a
    ret


jr_000_1430:
    ld b, $01
    ld c, $06
    ld e, $79
    call RenderTilemapCell
    ld h, $00
    ld l, $c1
    ld b, $0a
    ld c, $03
    call QueueTextDraw
    ld a, [ANIM_FRAME]
    cp $78
    jr z, jr_000_1450

    inc a
    ld [ANIM_FRAME], a
    ret


jr_000_1450:
    xor a
    ld [ANIM_FRAME], a
    ld hl, $c1e0
    call Call_001_5453
    ld hl, $c0e5
    ld a, $51
    ld [hl], a
    ld hl, $c1a5
    ld a, $54
    ld [hl], a
    ld a, $00
    ld [$c1b4], a
    call $73cb
    ld a, $11
    ldh [$ffa0], a
    ld [$c840], a
    xor a
    ld [ANIM_FRAME], a
    jp AdvanceScreenState


    call IncrementAttractCounter
    or a
    ret nz

    ld a, [ANIM_FRAME]
    inc a
    ld [ANIM_FRAME], a
    cp $0a
    ret nz

    call Call_000_188a
    jp AdvanceScreenState


    call IncrementAttractCounter
    or a
    ret nz

    call $77f2
    call $7763
    call $73d5
    call Call_000_180a
    ld a, [$c7ab]
    ld [$c7c4], a
    call $760e
    ld a, [$c6da]
    or a
    jp nz, Jump_000_14c7

    call $58c2
    ld a, [$c64a]
    or a
    ret nz

    call Call_000_2321
    call Call_001_6fcd
    call Call_001_70a4
    call Call_001_7881
    ret


Jump_000_14c7:
    ld a, [$c64a]
    or a
    jr z, jr_000_14d8

    ld a, [GAME_MODE]
    or $d0
    ld [GAME_MODE], a
    call $58c2

jr_000_14d8:
    ld hl, $c1e0
    call Call_001_5453
    ld hl, $c200
    call Call_001_5453
    call Call_001_6663
    call Call_001_6fcd
    call AdvanceScreenState
    ld a, $0a
    ld [ANIM_FRAME], a
    xor a
    ld [$c5a5], a
    ret


    call IncrementAttractCounter
    or a
    ret nz

    ld a, [$c5db]
    and $03
    jr z, jr_000_1509

    ld a, [$c7d6]
    ld [$d62d], a

jr_000_1509:
    call $760e
    ld a, [ANIM_FRAME]
    dec a
    ld [ANIM_FRAME], a
    ret nz

    call $7629
    jp AdvanceScreenState


    call IncrementAttractCounter
    or a
    ret nz

    ld a, $14
    ldh [$ffa0], a
    ld de, $c100
    ld hl, $0005
    add hl, de
    ld [hl], $01
    xor a
    ld [$c7d4], a
    ld [$c7d5], a
    xor a
    ld [$c7ab], a
    call Call_001_7544
    ld b, $0e
    ld c, $09
    ld e, $7a
    call RenderTilemapCell
    ld h, $01
    ld l, $2e
    ld b, $06
    ld c, $04
    call QueueTextDraw
    jp AdvanceScreenState


    call IncrementAttractCounter
    or a
    ret nz

    ld a, $01
    ld [RENDER_REQUEST], a
    call $7927
    ld a, [$c7c8]
    or a
    ret z

    xor a
    ld [RENDER_REQUEST], a
    jp AdvanceScreenState


    call IncrementAttractCounter
    or a
    ret nz

    ld a, $40
    ld [$d62d], a
    ld a, [GAME_MODE]
    and $40
    cp $40
    ret nz

    jp AdvanceScreenState


    call IncrementAttractCounter
    or a
    ret nz

    ld a, [GAME_MODE]
    and $80
    cp $80
    jr z, jr_000_1597

    ldh a, [$ff8d]
    and $01
    ret z

    ld a, $80
    ld [$d62d], a

jr_000_1597:
    call ClearSpriteBuffer
    xor a
    ld [$c5ed], a
    ld [ANIM_FRAME], a
    ld [$c5a5], a
    jp AdvanceScreenState


    call IncrementAttractCounter
    or a
    ret nz

    ld a, $01
    ld [RENDER_REQUEST], a
    ld a, [ANIM_FRAME]
    or a
    jp nz, Jump_000_1614

    ld a, [$c5db]
    and $03
    jr z, jr_000_15c4

    ld a, $f0
    ld [$d62d], a

jr_000_15c4:
    ld de, $c0a0
    ld hl, $0014
    add hl, de
    ld a, [hl]
    cp $2d
    jp z, Jump_000_1608

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
    ld [hl], $d3
    inc hl
    ld [hl], $d4
    pop hl
    ld b, $00
    ld c, $20
    add hl, bc
    ld [hl], $d5
    inc hl
    ld [hl], $d6
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
    ret


Jump_000_1608:
    ld hl, $c0a0
    call Call_001_5453
    ld a, $01
    ld [ANIM_FRAME], a
    ret


Jump_000_1614:
    ld a, [$c5a5]
    inc a
    ld [$c5a5], a
    cp $78
    ret nz

    ld a, [$c7c7]
    cp $02
    jp z, Jump_000_16ad

    or a
    jr nz, jr_000_1654

    ld hl, $c7a9
    inc [hl]
    ld a, [hl]
    ld b, a
    ld a, $04
    sub b
    ld b, $00
    ld c, a
    ld hl, $c7ca
    add hl, bc
    ld a, [$c7c9]
    ld [hl], a
    ld a, [$c7d2]
    srl a
    inc a
    ld b, a
    ld a, [$c7a9]
    cp b
    jr nz, jr_000_16ad

    ld hl, $c7a3
    ld [hl], $00
    inc hl
    ld [hl], $01
    jr jr_000_167d

jr_000_1654:
    ld hl, $c7aa
    inc [hl]
    ld a, [hl]
    ld b, a
    ld a, $04
    sub b
    ld b, $00
    ld c, a
    ld hl, $c7ce
    add hl, bc
    ld a, [$c7c9]
    ld [hl], a
    ld a, [$c7d2]
    srl a
    inc a
    ld b, a
    ld a, [$c7aa]
    cp b
    jr nz, jr_000_16ad

    ld hl, $c7a7
    ld [hl], $00
    inc hl
    ld [hl], $01

jr_000_167d:
    ld b, $01
    ld c, $00
    ld e, $46
    call RenderTilemapCell
    ld b, $03
    ld c, $05
    ld e, $4d
    call RenderTilemapCell
    ld h, $00
    ld l, $01
    ld b, $0a
    ld c, $12
    call QueueTextDraw
    call Call_001_7343
    call $7454
    call Call_001_74cd
    xor a
    ld [ANIM_FRAME], a
    ld [$c5a5], a
    jp AdvanceScreenState


Jump_000_16ad:
jr_000_16ad:
    xor a
    ld [ANIM_FRAME], a
    ld [$c5a5], a
    ld a, $03
    call InitPaletteFade
    call AdvanceScreenState
    jp AdvanceScreenState


    call IncrementAttractCounter
    or a
    ret nz

    ld a, $01
    ld [RENDER_REQUEST], a
    ld a, [GAME_MODE]
    and $20
    jr nz, jr_000_16da

Call_000_16d0:
    ldh a, [$ff8d]
    and $01
    ret z

    ld a, $20
    ld [$d62d], a

jr_000_16da:
    ld a, $04
    ldh [$ffa1], a
    call $67f8
    ld a, [$c5c4]
    inc a
    cp $0a
    jr nz, jr_000_16ea

    xor a

jr_000_16ea:
    ld [$c5c4], a
    xor a
    ld [ANIM_FRAME], a
    call AdvanceScreenState
    call AdvanceScreenState
    call AdvanceScreenState
    ret


    call IncrementAttractCounter
    or a
    ret nz

    ld a, $01
    call StepPaletteFade
    or a
    ret z

    ld b, $00
    ld c, $00
    ld e, $29
    call RenderTilemapCell
    xor a
    ld [ANIM_FRAME], a
    call AdvanceScreenState
    ld a, [$c7c7]
    cp $02
    ret z

    ld a, [$c7a0]
    inc a
    ld [$c7a0], a
    ld a, [$c5c4]
    inc a
    cp $0a
    jr nz, jr_000_172d

    xor a

jr_000_172d:
    ld [$c5c4], a
    ret


    call IncrementAttractCounter
    or a
    ret nz

    ld a, [ANIM_FRAME]
    inc a
    ld [ANIM_FRAME], a
    cp $0a
    ret nz

    ld b, $00
    ld c, $00
    ld e, $29
    call RenderTilemapCell
    ld h, $00
    ld l, $01
    ld b, $0a
    ld c, $12
    call QueueTextDraw
    call $7253
    call ClearSpriteBuffer
    call Call_001_7343
    call $7454
    call Call_001_74cd
    ld a, $11
    ld [SCREEN_SUBSTATE], a
    ret


    call IncrementAttractCounter
    or a
    ret nz

    ld a, $20
    ld [$d62d], a
    ld a, [ANIM_FRAME]
    inc a
    ld [ANIM_FRAME], a
    cp $0a
    ret nz

    xor a
    ld [ANIM_FRAME], a
    ld a, $09
    ld [SCREEN_SUBSTATE], a
    ret


Call_000_1787:
    ld b, $01
    ld c, $00
    ld e, $76
    call RenderTilemapCell
    ld h, $00
    ld l, $01
    ld b, $0a
    ld c, $08
    call QueueTextDraw
    ld a, [$c7ac]
    dec a
    ld b, $00
    ld c, a
    sla c
    rl b
    ld hl, $17d4
    add hl, bc
    ld a, [hl]
    ld b, $01
    ld c, a
    ld e, $71
    call RenderTilemapCell
    ld hl, $c1e0
    ld a, $01
    ld [hl], a
    ld hl, $c1e2
    ld a, $28
    ld [hl], a
    ld a, [$c7ac]
    dec a
    ld b, $00
    ld c, a
    sla c
    rl b
    ld hl, $17d4
    add hl, bc
    inc hl
    ld a, [hl]
    ld [$c1e3], a
    ret


    ld bc, $0318

jr_000_17d7:
    jr z, jr_000_17de

    jr c, jr_000_17e0

    jr c, jr_000_17d7

Call_000_17dc:
    xor a

jr_000_17de:
    rst $00
    or a

jr_000_17e0:
    ret z

    cp $04
    ret z

    ld b, $02
    ld c, $0c
    ld e, $72
    call RenderTilemapCell
    ld a, [GAME_MODE]
    and $07
    dec a
    ld b, $73
    add b
    ld b, $05
    ld c, $0e
    ld e, a
    call RenderTilemapCell
    ld h, $01
    ld l, $80
    ld b, $0a
    ld c, $04
    call QueueTextDraw
    ret


Call_000_180a:
    ld a, [$c7ab]
    or a
    jr nz, jr_000_182e

    ld a, [$c7ab]
    ld b, a
    ld a, [$c7c4]
    xor b
    ret z

    ld b, $0e
    ld c, $09
    ld e, $7a
    call RenderTilemapCell
    ld h, $01
    ld l, $2e
    ld b, $06
    ld c, $04
    call QueueTextDraw
    ret


jr_000_182e:
    ld a, [$c5ac]
    and $07
    ret nz

    ld a, [$c7c5]
    xor $01
    ld [$c7c5], a
    jr nz, jr_000_1853

    ld b, $0e
    ld c, $09
    ld e, $7b
    call RenderTilemapCell
    ld h, $01
    ld l, $2e
    ld b, $06
    ld c, $04
    call QueueTextDraw
    ret


jr_000_1853:
    ld b, $0e
    ld c, $09
    ld e, $7a
    call RenderTilemapCell
    ld h, $01
    ld l, $2e
    ld b, $06
    ld c, $04
    call QueueTextDraw
    ret


IncrementAttractCounter:
    ld a, [GAME_MODE]
    cp $ff
    jp z, Jump_000_187e

    ld a, [$d607]
    cp $0f
    jp z, Jump_000_187e

    inc a
    ld [$d607], a
    xor a
    ret


Jump_000_187e:
    ld a, $0a
    ld [GAME_STATE], a
    xor a
    ld [SCREEN_SUBSTATE], a
    ld a, $01
    ret


Call_000_188a:
    ld b, $01
    ld c, $00
    ld e, $47
    call RenderTilemapCell
    ld a, $09
    rst $10
    ld a, [$c5c4]
    ld d, $00
    ld e, a
    sla e
    rl d
    ld hl, $5f5f
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld d, h
    ld e, l
    ld hl, $d041
    ld c, $0f

jr_000_18ae:
    push hl
    ld b, $05

jr_000_18b1:
    ld a, [de]
    and $f0
    jr z, jr_000_18c7

    push hl
    push de
    swap a
    dec a
    and $07
    ld d, $00
    ld e, a
    ld hl, $0f65
    add hl, de
    ld a, [hl]
    pop de
    pop hl

jr_000_18c7:
    ld [hl+], a
    ld a, [de]
    and $0f
    jr z, jr_000_18dc

    push hl
    push de
    dec a
    and $07
    ld d, $00
    ld e, a
    ld hl, $0f65
    add hl, de
    ld a, [hl]
    pop de
    pop hl

jr_000_18dc:
    ld [hl+], a
    inc de
    dec b
    jr nz, jr_000_18b1

    pop hl
    push bc
    ld bc, $0020
    add hl, bc
    pop bc
    dec c
    jr nz, jr_000_18ae

    ld a, $01
    rst $18
    ld h, $00
    ld l, $01
    ld b, $0a
    ld c, $11
    call QueueTextDraw
    ret


    ld a, $05

Call_000_18fc:
    rst $10
    call $663e
    ld a, $01
    rst $18
    ret


Call_000_1904:
    ld a, $01
    rst $18
    ld b, $00
    ld c, $00
    call RenderTilemapCell
    ld h, $00
    ld l, $00
    ld b, $14
    ld c, $12
    jp QueueTextDraw


; ============================================================================
; Call_000_1919: rewritten in place (GBC). Originally streamed the mode-select
; vignette CHR ($c66e -> $c670, 7 frames x $c0 bytes) with the LCD on -- the
; visible top-to-bottom fill. Now stages the whole $540 bytes from ROM bank
; $0e into WRAM bank 2 (wChrStaging) in one call and arms bit 1 of
; wGDMARequest; the next VBlank uploads it to $9000 in a single GDMA.
; SVBK is only ever != 1 inside di/ei windows (the VBlank ISR must always see
; bank 1). Padded to keep Call_000_1971 in place; Call_000_1944 kept as an
; address-only label (referenced as data bytes from bank0d).
; ============================================================================
Call_000_1919:
    ld a, [$c66d]
    or a
    ret z

    ld a, $0e                   ; map CHR data bank (as the original did)
    rst $10
    ld hl, $c66e
    ld a, [hl+]
    ld l, [hl]
    ld h, a                     ; HL = ROM source
    ld de, wChrStaging
    ld c, $2a                   ; 42 chunks of 32 bytes = $540
.chunk:
    di
    ld a, $02
    ldh [rSVBK], a
    ld b, $20
.byte:
    ld a, [hl+]
    ld [de], a
    inc de
    dec b
    jr nz, .byte

    ld a, $01
    ldh [rSVBK], a
    ei
    dec c
    jr nz, .chunk

    ld a, $01
    rst $18

    ASSERT @ <= $1944, "code overflowed into the pinned Call_000_1944 slot"
    ds $1944 - @, 0
