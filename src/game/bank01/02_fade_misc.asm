; ============================================================================
; bank01/02_fade_misc.asm — $681e-$7cbf: palette fade sequencer + misc logic
; Part of SECTION "ROM Bank $001"; included in order by bank01_game_logic.asm.
; ============================================================================
ASSERT @ == $681e ; InitPaletteFade (DMG fade sequencer)
; Arm the DMG palette fade sequencer: A = frames between fade steps ($c66b),
; and reset the countdown ($c66a) and step index ($c66c).
InitPaletteFade:
    ld [$c66b], a
    ld a, $00
    ld [$c66a], a
    ld [$c66c], a
    ret


; Step the DMG palette fade armed by InitPaletteFade. A = fade command (index
; into the table at $6880; e.g. $00 fade-in, $01 fade-out). Every $c66b frames
; writes the next of 4 steps to the BGP/OBP0/OBP1 shadows ($c5f0-$c5f2).
; Returns A=0 while fading, A=1 once all 4 steps are done ($c66c == 4).
StepPaletteFade:
    ld [$c659], a
    ld a, [$c66a]
    or a
    jr z, jr_001_683a

    dec a
    ld [$c66a], a
    jp Jump_001_687a


jr_001_683a:
    ld a, [$c66c]
    cp $04
    jr z, jr_001_687d

    ld a, [$c66b]
    ld [$c66a], a
    ld a, [$c659]
    ld d, $00
    ld e, a
    sla e
    rl d
    sla e
    rl d
    ld hl, $6880
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [$c66c]
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    ld [$c5f0], a
    ld [$c5f1], a
    ld d, $00
    ld e, $05
    add hl, de
    ld a, [hl]
    ld [$c5f2], a
    ld a, [$c66c]
    inc a
    ld [$c66c], a

Jump_001_687a:
    ld a, $00
    ret


jr_001_687d:
    ld a, $01
    ret


    sub b
    ld l, b
    sub l
    ld l, b
    sbc d
    ld l, b
    sbc a
    ld l, b
    and h
    ld l, b
    xor c
    ld l, b
    xor [hl]
    ld l, b
    or e
    ld l, b
    nop
    ld b, b
    sub b
    db $e4
    rst $38
    nop
    ld b, b
    add c
    jp nc, $e4ff

    sub b
    ld b, b
    nop
    rst $38
    jp nc, Jump_001_4081

    nop
    rst $38
    rst $38
    cp $f9
    db $e4
    rst $38
    rst $38
    ei
    rst $20
    jp nc, $e4ff

    ld sp, hl
    cp $ff
    rst $38
    jp nc, $fbe7

    rst $38
    rst $38
    push de
    ld hl, $c5e1
    ld a, [hl+]
    ld l, [hl]
    ld h, a
    ld a, [$c5e9]
    ld [$c659], a

Jump_001_68c5:
jr_001_68c5:
    push hl
    ld b, $0a

jr_001_68c8:
    ld a, [hl+]
    or a
    jr z, jr_001_68d2

    and $f0
    cp $70
    jr nz, jr_001_68e7

jr_001_68d2:
    dec b
    jr nz, jr_001_68c8

    pop hl
    push hl
    call Call_001_68fa
    pop hl
    ld a, [$c659]
    dec a
    ld [$c659], a
    jr nz, jr_001_68c5

    jp Jump_001_68f8


jr_001_68e7:
    pop hl
    ld de, $ffe0
    add hl, de
    ld a, h
    cp $d0
    jp nz, Jump_001_68c5

    ld a, l
    cp $01
    jp nz, Jump_001_68c5

Jump_001_68f8:
    pop de
    ret


Call_001_68fa:
    push hl
    ld de, $ffe0
    add hl, de
    ld d, h
    ld e, l
    pop hl

Jump_001_6902:
    push hl
    push de
    ld b, $0a

jr_001_6906:
    ld a, [de]
    and $f0
    cp $70
    jr z, jr_001_6916

    ld a, [de]
    ld [hl+], a
    ld a, $00
    ld [de], a
    inc de
    jp Jump_001_691d


jr_001_6916:
    ld a, $00
    ld [hl+], a
    ld a, $00
    ld [de], a
    inc de

Jump_001_691d:
    dec b
    jr nz, jr_001_6906

    pop de
    pop hl
    ld bc, $ffe0
    add hl, bc
    push hl
    add hl, bc
    ld d, h
    ld e, l
    pop hl
    ld a, h
    cp $d0
    jp nz, Jump_001_6902

    ld a, l
    cp $01
    jp nz, Jump_001_6902

    ret


    ld a, [$c5e9]
    cp $01
    jr nz, jr_001_6943

    ld a, $05
    jr jr_001_6959

jr_001_6943:
    cp $02
    jr nz, jr_001_694b

    ld a, $0d
    jr jr_001_6959

jr_001_694b:
    cp $03
    jr nz, jr_001_6953

    ld a, $17
    jr jr_001_6959

jr_001_6953:
    cp $04
    jr nz, jr_001_6959

    ld a, $22

jr_001_6959:
    ld hl, $c0fe
    ld b, [hl]
    add b
    ld [hl], a
    ret


    ld a, [$c5e9]
    ld hl, $c60e
    ld [hl], $00
    inc hl
    ld [hl], a
    call Call_001_5d87
    ret


    ld hl, $4cff
    ld b, $00
    ld a, [$c0fd]
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld [$c5ae], a
    ld a, [hl]
    ld [$c5af], a
    ret


    ld a, [$c5e9]
    or a
    ret z

    ld hl, $4d65
    ld a, [$c0fd]
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld b, $00
    ld a, [$c5e9]
    dec a
    ld c, a
    sla c
    rl b
    sla c
    rl b
    add hl, bc
    ld bc, $c5f6
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl]
    ld [bc], a
    call Call_001_59c1
    ret


    ld hl, $c140
    ld [hl], $01
    ld hl, $c144
    ld a, [$c5e9]
    dec a
    ld b, $80
    add b
    ld [hl], a
    ld hl, $c145
    ld a, [$c5e9]
    ld b, $20
    add b
    ld [hl], a
    ld hl, $c5e1
    ld a, [hl+]
    and $0f
    ld b, a
    ld c, [hl]
    dec c
    srl b
    rr c
    srl b
    rr c
    ld h, $00
    ld l, $10
    add hl, bc
    ld a, l
    ld [$c143], a
    ld a, $10
    ld [$c142], a
    ld a, $01
    ld [RENDER_REQUEST], a
    ret


    ld hl, $c0fd
    ld a, [hl]
    ld hl, $4f93
    ld b, $00
    ld c, a
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [$c5e9]
    dec a
    ld b, $00
    ld c, a
    add hl, bc
    ld a, [hl]
    ld hl, $c160
    ld [hl], $01
    ld hl, $c164
    ld [hl], a
    ld hl, $c165
    ld a, $21
    ld [hl], a
    ld hl, $c5e1
    ld a, [hl+]
    and $0f
    ld b, a
    ld c, [hl]
    dec c
    srl b
    rr c
    srl b
    rr c
    ld h, $00
    ld l, $10
    add hl, bc
    ld a, l
    ld [$c163], a
    ld a, $10
    ld [$c162], a
    ld a, $01
    ld [RENDER_REQUEST], a
    ret


    ld a, [$c5e9]
    cp $01
    jr z, jr_001_6a59

    cp $02
    jr z, jr_001_6a68

    cp $03
    jr z, jr_001_6a77

    jr jr_001_6a86

jr_001_6a59:
    ld a, $0b
    ldh [$ffa1], a
    ld a, [$c610]
    cp $ff
    ret z

    inc a
    ld [$c610], a
    ret


jr_001_6a68:
    ld a, $0c
    ldh [$ffa1], a
    ld a, [$c611]
    cp $ff
    ret z

    inc a
    ld [$c611], a
    ret


jr_001_6a77:
    ld a, $0d
    ldh [$ffa1], a
    ld a, [$c612]
    cp $ff
    ret z

    inc a
    ld [$c612], a
    ret


jr_001_6a86:
    ld a, $0e
    ldh [$ffa1], a
    ld a, [$c613]
    cp $ff
    ret z

    inc a
    ld [$c613], a
    ret


    ld hl, $d201
    ld b, $0a

jr_001_6a9a:
    ld a, [hl+]
    or a
    ret nz

    dec b
    jr nz, jr_001_6a9a

    ld a, $00
    ld hl, $0005
    add hl, de
    ld [hl], a
    ld hl, $c180
    ld a, $01
    ld [hl], a
    ld hl, $c182
    ld a, $18
    ld [hl], a
    ld hl, $c183
    ld a, $88
    ld [hl], a
    ld hl, $c184
    ld a, $a4
    ld [hl], a
    ld hl, $c185
    ld a, $25
    ld [hl], a
    ld a, $01
    ld [RENDER_REQUEST], a
    ret


    ld hl, $0011
    add hl, de
    ld [hl], $d0
    inc hl
    ld [hl], $26
    ld a, [$c647]
    ld hl, $0013
    add hl, de
    ld [hl], a
    ld hl, $0002
    add hl, de
    ld [hl], $05
    ld hl, $0003
    add hl, de
    ld [hl], $01
    ret


Call_001_6ae9:
    call Call_001_6cde
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
    push af
    ld hl, $4304
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    ld hl, $c65b
    ld [hl], a
    pop af
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
    push de
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
    ld a, [$c65b]
    ld [hl], a
    pop hl
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    push hl
    ld h, b
    ld l, c
    add hl, de
    ld a, [$c65b]
    ld [hl], a
    pop hl
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    push hl
    ld h, b
    ld l, c
    add hl, de
    ld a, [$c65b]
    ld [hl], a
    pop hl
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    push hl
    ld h, b
    ld l, c
    add hl, de
    ld a, [$c65b]
    ld [hl], a
    pop hl
    pop de
    ret


    ld a, $00
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
    push de
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
    ld a, [hl]
    or a
    jr z, jr_001_6bae

    pop hl
    ld a, $01
    jp Jump_001_6be8


jr_001_6bae:
    pop hl
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    push hl
    ld h, b
    ld l, c
    add hl, de
    ld a, [hl]
    or a
    jr z, jr_001_6bc1

    pop hl
    ld a, $01
    jp Jump_001_6be8


jr_001_6bc1:
    pop hl
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    push hl
    ld h, b
    ld l, c
    add hl, de
    ld a, [hl]
    or a
    jr z, jr_001_6bd4

    pop hl
    ld a, $01
    jp Jump_001_6be8


jr_001_6bd4:
    pop hl
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    push hl
    ld h, b
    ld l, c
    add hl, de
    ld a, [hl]
    or a
    jr z, jr_001_6be7

    pop hl
    ld a, $01
    jp Jump_001_6be8


jr_001_6be7:
    pop hl

Jump_001_6be8:
    pop de
    ret


Call_001_6bea:
    call Call_001_6cde
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
    push de
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
    ld a, $00
    ld [hl], a
    pop hl
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    push hl
    ld h, b
    ld l, c
    add hl, de
    ld a, $00
    ld [hl], a
    pop hl
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    push hl
    ld h, b
    ld l, c
    add hl, de
    ld a, $00
    ld [hl], a
    pop hl
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    push hl
    ld h, b
    ld l, c
    add hl, de
    ld a, $00
    ld [hl], a
    pop hl
    pop de
    ret


Call_001_6c54:
    cp $00
    jr z, jr_001_6c69

    cp $01
    jr z, jr_001_6c6e

    cp $02
    jr z, jr_001_6c73

    cp $03
    jr z, jr_001_6c78

    ld hl, $4b31
    jr jr_001_6c7b

jr_001_6c69:
    ld hl, $43f9
    jr jr_001_6c7b

jr_001_6c6e:
    ld hl, $45c7
    jr jr_001_6c7b

jr_001_6c73:
    ld hl, $4795
    jr jr_001_6c7b

jr_001_6c78:
    ld hl, $4963

jr_001_6c7b:
    push hl
    ld hl, $0011
    add hl, de
    ld a, [hl+]
    ld b, a
    ld a, [hl]
    ld c, a
    ld hl, $0013
    add hl, de
    ld a, [hl]
    pop hl
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
    push hl
    ld hl, $0004
    add hl, de
    ld a, [hl]
    pop hl
    push de
    ld d, $00
    ld e, a
    sla e
    rl d
    sla e
    rl d
    sla e
    rl d
    sla e
    rl d
    add hl, de

Jump_001_6cb3:
    ld a, [hl+]
    ld e, a
    cp $11
    jr z, jr_001_6cbd

    ld a, [hl+]
    ld d, a
    jr jr_001_6cc4

jr_001_6cbd:
    ld a, [hl+]
    ld d, a
    cp $11
    jp z, Jump_001_6cda

jr_001_6cc4:
    push hl
    ld h, b
    ld l, c
    add hl, de
    ld a, [hl]
    pop hl
    or a
    jp z, Jump_001_6cb3

    and $f0
    cp $70
    jp z, Jump_001_6cb3

    ld a, $01
    jp Jump_001_6cdc


Jump_001_6cda:
    ld a, $00

Jump_001_6cdc:
    pop de
    ret


Call_001_6cde:
    ld a, [$c5c8]
    or $02
    ld [$c5c8], a
    ret


Call_001_6ce7:
    ld hl, $0011
    add hl, de
    push hl
    ld a, [hl+]
    ld l, [hl]
    ld h, a
    add hl, bc
    ld b, h
    ld c, l
    pop hl
    ld [hl], b
    inc hl
    ld [hl], c
    ret


    ld hl, $0015
    add hl, de
    ld a, [hl]
    or a
    jp z, Jump_001_6d03

    dec a
    ld [hl], a
    ret


Jump_001_6d03:
    ld hl, $0016
    add hl, de
    ld a, [hl]
    ld hl, $0015
    add hl, de
    ld [hl], a
    ldh a, [$ff8c]
    swap a
    bit 1, a
    jp z, Jump_001_6d2f

    ld a, $01
    call Call_001_6c54
    or a
    ret nz

    call Call_001_6bea
    ld bc, $ffff
    call Call_001_6ce7
    ld a, $01
    call Call_001_6ee9
    call Call_001_6ae9
    ret


Jump_001_6d2f:
    ld a, $02
    call Call_001_6c54
    or a
    ret nz

    call Call_001_6bea
    ld bc, $0001
    call Call_001_6ce7
    ld a, $02
    call Call_001_6ee9
    call Call_001_6ae9
    ret


    ld hl, $0015
    add hl, de
    ld [hl], $0a
    ld a, [$c5a8]
    cp $00
    jr z, jr_001_6d57

    ld [hl], $14

jr_001_6d57:
    ldh a, [$ff8d]
    swap a
    bit 1, a
    jp z, Jump_001_6d79

    ld a, $01
    call Call_001_6c54
    or a
    ret nz

    call Call_001_6bea
    ld bc, $ffff
    call Call_001_6ce7
    ld a, $01
    call Call_001_6ee9
    call Call_001_6ae9
    ret


Jump_001_6d79:
    ld a, $02
    call Call_001_6c54
    or a
    ret nz

    call Call_001_6bea
    ld bc, $0001
    call Call_001_6ce7
    ld a, $02
    call Call_001_6ee9
    call Call_001_6ae9
    ret


    ld hl, $0017
    add hl, de
    ld a, [hl]
    or a
    jp z, Jump_001_6d9e

    dec a
    ld [hl], a
    ret


Jump_001_6d9e:
    ld hl, $0018
    add hl, de
    ld a, [hl]
    ld hl, $0017
    add hl, de
    ld [hl], a
    ld a, $00
    call Call_001_6c54
    or a
    jp nz, Jump_001_6de0

    ld hl, $001a
    add hl, de
    ld [hl], $00
    call Call_001_6bea
    ld bc, $0020
    call Call_001_6ce7
    ld a, $00
    call Call_001_6ee9
    call Call_001_6ae9
    ld a, [$c5a8]
    cp $00
    ret nz

    ld a, $00
    ld hl, $c5f6
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    ld a, $01
    ld hl, $c5f8
    ld [hl], a
    call Call_001_59c1
    ret


Jump_001_6de0:
    ld hl, $001a
    add hl, de
    ld a, [hl]
    or a
    jr nz, jr_001_6df9

    ld [hl], $01
    ld hl, $0017
    add hl, de
    ld [hl], $08
    ld a, [$c5a8]
    cp $00
    ret z

    ld [hl], $08
    ret


jr_001_6df9:
    ld a, $07
    ldh [$ffa1], a
    call Call_001_6f0b
    ld hl, $c0a5
    ld a, [$c5a8]
    cp $00
    jr nz, jr_001_6e0d

    ld [hl], $03
    ret


jr_001_6e0d:
    ld [hl], $33
    ret


    ld hl, $0018
    add hl, de
    ld a, [hl]
    add $00
    ld hl, $0017
    add hl, de
    ld [hl], a
    ld a, $00
    call Call_001_6c54
    or a
    jp nz, Jump_001_6e4e

    call Call_001_6bea
    ld bc, $0020
    call Call_001_6ce7
    ld a, $00
    call Call_001_6ee9
    call Call_001_6ae9
    ld a, [$c5a8]
    cp $00
    ret nz

    ld a, $00
    ld hl, $c5f6
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    ld a, $01
    ld hl, $c5f8
    ld [hl], a
    call Call_001_59c1
    ret


Jump_001_6e4e:
    ld a, $07
    ldh [$ffa1], a
    call Call_001_6f0b
    ld hl, $c0a5
    ld a, [$c5a8]
    cp $00
    jr nz, jr_001_6e62

    ld [hl], $03
    ret


jr_001_6e62:
    ld [hl], $33
    ret


    ld a, [$c691]
    ld b, a
    ldh a, [$ff8d]
    and b
    jp z, Jump_001_6e9e

    ld hl, $0004
    add hl, de
    ld a, [hl]
    inc a
    and $03
    ld [hl], a
    ld a, $03
    call Call_001_6c54
    or a
    jp nz, Jump_001_6ed5

    ld hl, $0004
    add hl, de
    ld a, [hl]
    dec a
    and $03
    ld [hl], a
    call Call_001_6bea
    ld a, $08
    ldh [$ffa1], a
    ld hl, $0004
    add hl, de
    ld a, [hl]
    inc a
    and $03
    ld [hl], a
    call Call_001_6ae9
    ret


Jump_001_6e9e:
    ld a, [$c690]
    ld b, a
    ldh a, [$ff8d]
    and b
    ret z

    ld hl, $0004
    add hl, de
    ld a, [hl]
    dec a
    and $03
    ld [hl], a
    ld a, $04
    call Call_001_6c54
    or a
    jp nz, Jump_001_6edf

    ld a, $08
    ldh [$ffa1], a
    ld hl, $0004
    add hl, de
    ld a, [hl]
    inc a
    and $03
    ld [hl], a
    call Call_001_6bea
    ld hl, $0004
    add hl, de
    ld a, [hl]
    dec a
    and $03
    ld [hl], a
    call Call_001_6ae9
    ret


Jump_001_6ed5:
    ld hl, $0004
    add hl, de
    ld a, [hl]
    dec a
    and $03
    ld [hl], a
    ret


Jump_001_6edf:
    ld hl, $0004
    add hl, de
    ld a, [hl]
    inc a
    and $03
    ld [hl], a
    ret


Call_001_6ee9:
    cp $00
    jr z, jr_001_6ef3

    cp $01
    jr z, jr_001_6efb

    jr jr_001_6f03

jr_001_6ef3:
    ld hl, $0003
    add hl, de
    ld a, [hl]
    inc a
    ld [hl], a
    ret


jr_001_6efb:
    ld hl, $0002
    add hl, de
    ld a, [hl]
    dec a
    ld [hl], a
    ret


jr_001_6f03:
    ld hl, $0002
    add hl, de
    ld a, [hl]
    inc a
    ld [hl], a
    ret


Call_001_6f0b:
    ld hl, $0005
    add hl, de
    ld [hl], $00
    ret


    ld a, [$c5e9]
    or a
    ret z

    ld hl, $4d65
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld b, $00
    ld a, [$c5e9]
    dec a
    ld c, a
    sla c
    rl b
    sla c
    rl b
    add hl, bc
    ld bc, $c5fd
    ld a, $00
    ld [bc], a
    inc bc
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl]
    ld [bc], a
    call Call_001_5ac2
    ret


    ld hl, $c140
    ld [hl], $01
    ld hl, $c144
    ld a, [$c5e9]
    sub $03
    ret c

    ld a, [$c5e9]
    dec a
    ld b, $80
    add b
    ld [hl], a
    ld hl, $c145
    ld a, $50
    ld [hl], a
    ld a, $58
    ld [$c143], a
    ld a, $10
    ld [$c142], a
    ld a, $01
    ld [RENDER_REQUEST], a
    push de
    ld a, [$c5e9]
    sub $02
    ld d, a
    ld a, [$c6c6]
    ld e, a
    sub d
    jr nc, jr_001_6f7a

    xor a

jr_001_6f7a:
    cp e
    jp z, Jump_001_6fcb

    ld [$c6c6], a
    ld d, a
    ld a, e
    sub d
    ld d, a
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
    xor a
    ld c, d
    push hl

jr_001_6fa7:
    push hl
    ld b, $0a

jr_001_6faa:
    ld [hl+], a
    dec b
    jr nz, jr_001_6faa

    pop hl
    ld de, $0020
    add hl, de
    dec c
    jr nz, jr_001_6fa7

    pop hl
    ld a, h
    and $0f
    ld h, a
    ld a, l
    and $f0
    inc a
    ld l, a
    ld b, $0a
    ld c, $02
    call Call_001_5e20
    ld a, $13
    ldh [$ffa1], a

Jump_001_6fcb:
    pop de
    ret


Call_001_6fcd:
    push hl
    push de
    push bc
    push af
    ld a, [$c6da]
    or a
    jr nz, jr_001_6fe7

    ld a, [$c5ac]
    and $07
    jr nz, jr_001_6fe7

    ld a, [$c6c7]
    inc a
    and $03
    ld [$c6c7], a

jr_001_6fe7:
    ld a, [$c6c6]
    ld b, a
    inc b
    ld hl, $d005

jr_001_6fef:
    ld a, [hl]
    or a
    jr z, jr_001_6ff9

    and $f0
    cp $70
    jr nz, jr_001_6ffb

jr_001_6ff9:
    ld [hl], $77

jr_001_6ffb:
    inc hl
    ld a, [hl]
    or a
    jr z, jr_001_7006

    and $f0
    cp $70
    jr nz, jr_001_7008

jr_001_7006:
    ld [hl], $78

jr_001_7008:
    ld de, $001f
    add hl, de
    dec b
    jr nz, jr_001_6fef

    ld a, [hl]
    or a
    jr z, jr_001_7019

    and $f0
    cp $70
    jr nz, jr_001_701b

jr_001_7019:
    ld [hl], $75

jr_001_701b:
    inc hl
    ld a, [hl]
    or a
    jr z, jr_001_7026

    and $f0
    cp $70
    jr nz, jr_001_7028

jr_001_7026:
    ld [hl], $76

jr_001_7028:
    ld a, [$c6c6]
    ld hl, $d021

jr_001_702e:
    cp $00
    jr z, jr_001_7039

    ld de, $0020
    add hl, de
    dec a
    jr jr_001_702e

jr_001_7039:
    ld b, $04
    ld c, $02

jr_001_703d:
    ld a, [hl]
    or a
    jr z, jr_001_7049

    and $f0
    cp $70
    jr nz, jr_001_7049

    ld [hl], $00

jr_001_7049:
    inc hl
    dec b
    jr nz, jr_001_703d

    inc hl
    inc hl
    ld b, $04
    dec c
    jr nz, jr_001_703d

    ld a, [$c6c6]
    ld hl, $d041

jr_001_705a:
    cp $00
    jr z, jr_001_7065

    ld de, $0020
    add hl, de
    dec a
    jr jr_001_705a

jr_001_7065:
    ld b, $0a
    push hl

jr_001_7068:
    ld a, [hl]
    or a
    jr z, jr_001_7072

    and $f0
    cp $70
    jr nz, jr_001_7074

jr_001_7072:
    ld [hl], $74

jr_001_7074:
    inc hl
    dec b
    jr nz, jr_001_7068

    pop hl
    ld a, [$c6c7]
    and $03
    ld b, $70
    add b
    ld b, a
    ld c, $0a
    ld de, $0020
    add hl, de

jr_001_7088:
    ld a, [hl]
    or a
    jr z, jr_001_7092

    and $f0
    cp $70
    jr nz, jr_001_7093

jr_001_7092:
    ld [hl], b

jr_001_7093:
    inc hl
    dec c
    jr nz, jr_001_7088

    ld a, [$c5c8]
    or $20
    ld [$c5c8], a
    pop af
    pop bc
    pop de
    pop hl
    ret


Call_001_70a4:
    push hl
    push de
    push bc
    push af
    ld a, [$c6da]
    or a
    jr z, jr_001_70b3

    pop af
    pop bc
    pop de
    pop hl
    ret


jr_001_70b3:
    ld a, [$c6c6]
    ld hl, $d061
    ld d, $00
    ld e, a
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
    add hl, de

Jump_001_70d1:
    push hl
    ld b, $0a
    ld c, $00

Jump_001_70d6:
    ld a, [hl]
    and $f0
    cp $00
    jr z, jr_001_70f5

    cp $70
    jr z, jr_001_70f5

    call Call_001_7194
    or a
    jr nz, jr_001_70f5

    call Call_001_7116
    ld a, [$c6c8]
    inc a
    ld [$c6c8], a
    ld c, $01
    ld [hl], $00

jr_001_70f5:
    inc hl
    dec b
    jp nz, Jump_001_70d6

    ld a, c
    or a
    jr z, jr_001_7110

    ld a, h
    cp $d0
    jr nz, jr_001_7108

    ld a, l
    cp $0b
    jr z, jr_001_7110

jr_001_7108:
    pop hl
    ld de, $ffe0
    add hl, de
    jp Jump_001_70d1


jr_001_7110:
    pop hl
    pop af
    pop bc
    pop de
    pop hl
    ret


Call_001_7116:
    push hl
    push de
    push bc
    push af
    ld a, h
    ld [$c64b], a
    ld a, l
    ld [$c64c], a
    ld de, $c1e0
    call Call_001_5461
    ld a, $00
    ld [de], a
    ld hl, $c64b
    ld a, [hl+]
    ld l, [hl]
    ld h, a
    ld a, [hl]
    sub $e0
    add $e0
    ld hl, $0004
    add hl, de
    ld [hl], a
    ld hl, $c64c
    ld a, [hl]
    and $0f
    sla a
    sla a
    sla a
    add $08
    ld hl, $0002
    add hl, de
    ld [hl], a
    ld hl, $c64b
    ld a, [hl]
    and $0f
    ld b, a
    inc hl
    ld a, [hl]
    ld c, a
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    srl b
    rr c
    ld a, c
    sla a
    sla a
    sla a
    add $10
    ld hl, $0003
    add hl, de
    ld [hl], a
    ld hl, $0005
    add hl, de
    ld [hl], $52
    ld hl, $0016
    add hl, de
    ld a, [$c6c8]
    and $03
    ld [hl], a
    ld a, $01
    ld [RENDER_REQUEST], a
    pop af
    pop bc
    pop de
    pop hl
    ret


Call_001_7194:
    push hl
    push de
    push bc
    ld a, $00
    ld a, h
    ld [$c64b], a
    ld a, l
    ld [$c64c], a
    ld de, $c0c0
    ld hl, $0005
    add hl, de
    ld a, [hl]
    or a
    jp z, Jump_001_724f

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
    ld a, [$c64b]
    cp h
    jr nz, jr_001_71fb

    ld a, [$c64c]
    cp l
    jr nz, jr_001_71fb

    pop hl
    ld a, $01
    jp Jump_001_724f


jr_001_71fb:
    pop hl
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    push hl
    ld h, b
    ld l, c
    add hl, de
    ld a, [$c64b]
    cp h
    jr nz, jr_001_7216

    ld a, [$c64c]
    cp l
    jr nz, jr_001_7216

    pop hl
    ld a, $01
    jp Jump_001_724f


jr_001_7216:
    pop hl
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    push hl
    ld h, b
    ld l, c
    add hl, de
    ld a, [$c64b]
    cp h
    jr nz, jr_001_7231

    ld a, [$c64c]
    cp l
    jr nz, jr_001_7231

    pop hl
    ld a, $01
    jp Jump_001_724f


jr_001_7231:
    pop hl
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    push hl
    ld h, b
    ld l, c
    add hl, de
    ld a, [$c64b]
    cp h
    jr nz, jr_001_724c

    ld a, [$c64c]
    cp l
    jr nz, jr_001_724c

    pop hl
    ld a, $01
    jp Jump_001_724f


jr_001_724c:
    ld a, $00
    pop hl

Jump_001_724f:
    pop bc
    pop de
    pop hl
    ret


    ld a, $00
    ld [$c7ab], a
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
    ld [$c7ad], a
    ld [$c7ae], a
    ld [$c7b2], a
    ld [$c7b3], a
    ld [$c7b4], a
    ld [$c7b5], a
    ld [$c7b6], a
    ld [$c7b7], a
    ld [$c7b8], a
    ld [$c7b9], a
    ld [$c7ba], a
    ld [$c7bb], a
    ld [$c7bc], a
    ld [$c7bd], a
    ld [$c7be], a
    ld [$c7bf], a
    ld [$c7c0], a
    ld [$c7c1], a
    ld [$c7c2], a
    ld [$c7c3], a
    ld [$c7c4], a
    ld [$c7c5], a
    ld [$c7c6], a
    ld [$c7c7], a
    ld [$c7c8], a
    ld [$c7c9], a
    ld [$c734], a
    ld [$c735], a
    ld [$c7d6], a
    ret


Call_001_7343:
    push hl
    push de
    push bc
    ld hl, $c7a2
    ld de, $c7a4
    ld a, [hl]
    ld b, a
    ld a, [de]
    add b
    daa
    ld [hl], a
    ld hl, $c7a1
    ld de, $c7a3
    ld a, [hl]
    ld b, a
    ld a, [de]
    adc b
    daa
    ld [hl], a
    and $f0
    jr z, jr_001_736b

    ld hl, $c7a1
    ld a, $09
    ld [hl+], a
    ld a, $99
    ld [hl], a

jr_001_736b:
    ld hl, $c7a1
    ld de, $d0ed
    ld c, $00
    ld a, [hl+]
    and $0f
    or a
    jr z, jr_001_7380

    ld c, $01
    add $81
    ld [de], a
    jr jr_001_7383

jr_001_7380:
    ld a, $00
    ld [de], a

jr_001_7383:
    inc de
    ld a, [hl]
    and $f0
    swap a
    or a
    jr z, jr_001_7393

    ld c, $01
    add $81
    ld [de], a
    jr jr_001_739f

jr_001_7393:
    ld a, c
    or a
    jr nz, jr_001_739c

    ld a, $00
    ld [de], a
    jr jr_001_739f

jr_001_739c:
    ld a, $81
    ld [de], a

jr_001_739f:
    inc de
    ld a, [hl]
    and $0f
    or a
    jr z, jr_001_73ad

    ld c, $01
    add $81
    ld [de], a
    jr jr_001_73b0

jr_001_73ad:
    ld a, $81
    ld [de], a

jr_001_73b0:
    ld a, [$c5c8]
    or $08
    ld [$c5c8], a
    pop bc
    pop de
    pop hl
    ret


    ld hl, $d62d
    xor a
    ld [hl+], a
    ret


    ld hl, $d627
    ld de, $c7af
    ld a, [hl+]
    ld [de], a
    ret


    ld a, [$c7ac]
    dec a
    sla a
    ld [$c6c6], a
    ret


    ld a, [GAME_MODE]
    and $c0
    cp $c0
    jr nz, jr_001_7427

    ld a, [GAME_MODE]
    and $03
    jr z, jr_001_7427

    ld b, a
    ld a, [$c7ab]
    ld [$c659], a
    add b
    ld b, a
    sub $09
    jr c, jr_001_73f4

    ld b, $08

jr_001_73f4:
    ld a, b
    ld [$c65b], a
    ld [$c7ab], a
    call Call_001_5e0c
    ld a, [$c5c5]
    and $1f
    ld hl, $7434
    ld c, a
    ld b, $00
    add hl, bc
    ld a, [hl]
    ld [MOVE_RESULT], a
    ld a, [$c659]
    ld hl, $c7b2
    ld c, a
    ld b, $00
    add hl, bc
    ld b, a
    ld a, [$c65b]
    sub b
    jr z, jr_001_7427

    ld b, a
    ld a, [MOVE_RESULT]

jr_001_7423:
    ld [hl+], a
    dec b
    jr nz, jr_001_7423

jr_001_7427:
    ld a, [$c7ab]
    ld b, a
    ld a, [$c7c4]
    xor b
    ret z

    call Call_001_7544
    ret


    nop
    ld bc, $0302
    inc b
    dec b
    ld b, $07
    ld [$0009], sp
    ld bc, $0302
    inc b
    dec b
    ld b, $07
    ld [$0009], sp
    ld bc, $0302
    inc b
    dec b
    ld b, $07
    ld [$0009], sp

Call_001_7454:
    add hl, bc
    push hl
    push de
    push bc
    ld hl, $c7a6
    ld de, $c7a8
    ld a, [hl]
    ld b, a
    ld a, [de]
    add b
    daa
    ld [hl], a
    ld hl, $c7a5
    ld de, $c7a7
    ld a, [hl]
    ld b, a
    ld a, [de]
    adc b
    daa
    ld [hl], a
    and $f0
    jr z, jr_001_747c

    ld hl, $c7a5
    ld a, $09
    ld [hl+], a
    ld a, $99
    ld [hl], a

jr_001_747c:
    ld hl, $c7a5
    ld de, $d0f1
    ld c, $00
    ld a, [hl+]
    and $0f
    or a
    jr z, jr_001_7491

    ld c, $01
    add $81
    ld [de], a
    jr jr_001_7494

jr_001_7491:
    ld a, $00
    ld [de], a

jr_001_7494:
    inc de
    ld a, [hl]
    and $f0
    swap a
    or a
    jr z, jr_001_74a4

    ld c, $01
    add $81
    ld [de], a
    jr jr_001_74b0

jr_001_74a4:
    ld a, c
    or a
    jr nz, jr_001_74ad

    ld a, $00
    ld [de], a
    jr jr_001_74b0

jr_001_74ad:
    ld a, $81
    ld [de], a

jr_001_74b0:
    inc de
    ld a, [hl]
    and $0f
    or a
    jr z, jr_001_74be

    ld c, $01
    add $81
    ld [de], a
    jr jr_001_74c1

jr_001_74be:
    ld a, $81
    ld [de], a

jr_001_74c1:
    ld a, [$c5c8]
    or $08
    ld [$c5c8], a
    pop bc
    pop de
    pop hl
    ret


Call_001_74cd:
    push hl
    push de
    push bc
    ld a, [$c7ca]
    or a
    jr z, jr_001_74d9

    ld b, $c4
    add b

jr_001_74d9:
    ld hl, $d1ef
    ld [hl], a
    ld a, [$c7cb]
    or a
    jr z, jr_001_74e6

    ld b, $c4
    add b

jr_001_74e6:
    ld hl, $d1ee
    ld [hl], a
    ld a, [$c7cc]
    or a
    jr z, jr_001_74f3

    ld b, $c4
    add b

jr_001_74f3:
    ld hl, $d1ed
    ld [hl], a
    ld a, [$c7cd]
    or a
    jr z, jr_001_7500

    ld b, $c4
    add b

jr_001_7500:
    ld hl, $d1ec
    ld [hl], a
    ld a, [$c7ce]
    or a
    jr z, jr_001_750d

    ld b, $c4
    add b

jr_001_750d:
    ld hl, $d1f0
    ld [hl], a
    ld a, [$c7cf]
    or a
    jr z, jr_001_751a

    ld b, $c4
    add b

jr_001_751a:
    ld hl, $d1f1
    ld [hl], a
    ld a, [$c7d0]
    or a
    jr z, jr_001_7527

    ld b, $c4
    add b

jr_001_7527:
    ld hl, $d1f2
    ld [hl], a
    ld a, [$c7d1]
    or a
    jr z, jr_001_7534

    ld b, $c4
    add b

jr_001_7534:
    ld hl, $d1f3
    ld [hl], a
    ld a, [$c5c8]
    or $08
    ld [$c5c8], a
    pop bc
    pop de
    pop hl
    ret


Call_001_7544:
    push hl
    push de
    push bc
    ld a, [$c7ab]
    sub $09
    jr c, jr_001_7553

    ld a, $08
    ld [$c7ab], a

jr_001_7553:
    ld a, [$c7ab]
    ld b, $00
    ld c, a
    sla c
    rl b
    ld hl, $758a
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld d, h
    ld e, l
    ld hl, $d12c
    ld c, $04

jr_001_756b:
    push hl
    ld b, $02

jr_001_756e:
    ld a, [de]
    ld [hl+], a
    inc de
    dec b
    jr nz, jr_001_756e

    pop hl
    push de
    ld de, $0020
    add hl, de
    pop de
    dec c
    jr nz, jr_001_756b

    ld a, [$c5c8]
    or $08
    ld [$c5c8], a
    pop bc
    pop de
    pop hl
    ret


    sbc h
    ld [hl], l
    and h
    ld [hl], l
    xor h
    ld [hl], l
    or h
    ld [hl], l
    cp h
    ld [hl], l
    call nz, $cc75
    ld [hl], l
    call nc, $dc75
    ld [hl], l
    ret c

    ret c

    ret c

    ret c

    ret c

    ret c

    ret c

    ret c

    ret c

    ret c

    ret c

    ret c

    ret c

    ret c

    xor c
    ret c

    ret c

    ret c

    ret c

    ret c

    xor c
    ret c

    xor c
    ret c

    ret c

    ret c

    xor d
    ret c

    xor c
    ret c

    xor c
    ret c

    xor d
    ret c

    xor d
    ret c

    xor c
    ret c

    xor c
    ret c

    xor d
    ret c

    xor d
    ret c

    xor c
    ret c

    xor c
    xor e
    xor d
    ret c

    xor d
    ret c

    xor c
    xor e
    xor c
    xor e
    xor d
    ret c

    xor d
    xor h
    xor c
    xor e
    xor c
    xor e
    xor d
    xor h
    xor d
    xor h
    xor c
    xor e
    xor c
    xor e
    push hl
    push de
    push bc
    ld hl, $d001
    ld de, $d021
    ld c, $10

jr_001_75ef:
    push de
    push hl
    ld b, $0a

jr_001_75f3:
    ld a, [de]
    ld [hl+], a
    inc de
    dec b
    jr nz, jr_001_75f3

    pop hl
    ld de, $0020
    add hl, de
    pop de
    push hl
    ld hl, $0020
    add hl, de
    ld d, h
    ld e, l
    pop hl
    dec c
    jr nz, jr_001_75ef

    pop bc
    pop de
    pop hl
    ret


    ld a, [GAME_MODE]
    and $c0
    cp $c0
    ret nz

    ld a, [GAME_MODE]
    and $0c
    ret z

    sla a
    sla a
    ld b, a
    ld a, [$c6da]
    or b
    ld [$c6da], a
    ret


    ld hl, $c100
    ld de, $c3e0
    ld b, $20

jr_001_7631:
    ld a, [hl+]
    ld [de], a
    inc de
    dec b
    jr nz, jr_001_7631

    ld de, $0320
    ld hl, $c0a0

jr_001_763d:
    ld a, $00
    ld [hl+], a
    dec de
    ld a, e
    or d
    jr nz, jr_001_763d

    ld hl, $c3e0
    ld de, $c100
    ld b, $20

jr_001_764d:
    ld a, [hl+]
    ld [de], a
    inc de
    dec b
    jr nz, jr_001_764d

    ret


Call_001_7654:
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


    ld de, $c1e0
    ld a, $0f
    ld [$c5a0], a
    ld bc, $c050

jr_001_769b:
    ld hl, $0005
    add hl, de
    ld a, [hl]
    cp $52
    call z, Call_001_76bc
    ld hl, $0020
    add hl, de
    ld d, h
    ld e, l
    ld h, $00
    ld l, $04
    add hl, bc
    ld b, h
    ld c, l
    ld a, [$c5a0]
    dec a
    ld [$c5a0], a
    jr nz, jr_001_769b

    ret


Call_001_76bc:
    ld a, $01
    ld [RENDER_REQUEST], a
    ld a, [$c64a]
    or a
    ret nz

    push bc
    ld hl, $0003
    add hl, de
    ld a, [hl]
    ld [bc], a
    inc bc
    ld hl, $0002
    add hl, de
    ld a, [hl]
    ld [bc], a
    inc bc
    ld hl, $0004
    add hl, de
    ld a, [hl]
    ld [bc], a
    inc bc
    xor a
    ld [bc], a
    pop bc
    ret


    ld a, [GAME_MODE]
    or a
    jr z, jr_001_76ee

    and $0f
    ld [$c7d3], a
    ld a, $01
    ret


jr_001_76ee:
    ldh a, [$ff8d]
    and $20
    jr z, jr_001_7707

    ld a, $03
    ldh [$ffa1], a
    ld a, [$c7d3]
    sub $01
    jr nc, jr_001_7701

    ld a, $03

jr_001_7701:
    ld [$c7d3], a
    jp Jump_001_771e


jr_001_7707:
    ldh a, [$ff8d]
    and $10
    jr z, jr_001_771e

    ld a, $03
    ldh [$ffa1], a
    ld a, [$c7d3]
    add $01
    cp $04
    jr nz, jr_001_771b

    xor a

jr_001_771b:
    ld [$c7d3], a

Jump_001_771e:
jr_001_771e:
    ld a, [$c7d3]
    sla a
    sla a
    sla a
    sla a
    add $30
    ld [$c242], a
    ldh a, [$ff8d]
    and $01
    ret z

    ld a, [$c7d3]
    or $80
    ld [$d62d], a
    ld a, $01
    ret


    ld a, $01
    ld [RENDER_REQUEST], a
    ld a, [$c7d3]
    sla a
    sla a
    sla a
    sla a
    add $30
    ld [$c242], a
    xor a
    ld [$c240], a
    ld a, [$c5db]
    and $08
    ret z

    ld a, $01
    ld [$c240], a
    ret


    ld a, [$c6da]
    or a
    jr z, jr_001_7776

    ld hl, $c1e0
    call Call_001_5453
    ld hl, $c200
    call Call_001_5453
    ret


jr_001_7776:
    ld a, [GAME_MODE]
    and $40
    cp $40
    jp nz, Jump_001_77b5

    ld a, $52
    ld [$c1e5], a
    ld a, $02
    ld [$c1f4], a
    ld a, $c5
    ld [$c1e4], a
    ld a, $60
    ld [$c1e2], a
    ld a, [GAME_MODE]
    and $3f
    sla a
    sla a
    sla a
    ld b, $10
    add b
    add $18
    ld [$c1e3], a
    ld a, [$c1e3]
    ld b, a
    ld a, [$c203]
    sub b
    ret nc

    ld a, b
    ld [$c203], a
    ret


Jump_001_77b5:
    ld a, [GAME_MODE]
    and $80
    cp $80
    ret nz

    ld a, $52
    ld [$c205], a
    ld a, $02
    ld [$c214], a
    ld a, $d7
    ld [$c204], a
    ld a, $60
    ld [$c202], a
    ld a, [GAME_MODE]
    and $3f
    sla a
    sla a
    sla a
    ld b, $10
    add b
    sub $10
    ld [$c203], a
    ld a, [$c1e3]
    ld b, a
    ld a, [$c203]
    sub b
    ret nc

    ld a, b
    ld [$c203], a
    ret


    ld a, [$c5db]
    and $03
    cp $00
    ret z

    cp $0b
    ret z

    cp $01
    jr nz, jr_001_780b

    ld a, [$c6c6]
    ld b, $40
    or b
    ld [$d62d], a
    ret


jr_001_780b:
    ld a, [$c103]
    sub $10
    srl a
    srl a
    srl a
    ld b, $80
    or b
    ld [$d62d], a
    ret


    ld a, [$c83e]
    sla a
    sla a
    ld [$c83d], a
    ret


    ld a, [$c83e]
    ld b, $00
    ld c, a
    ld hl, $7837
    add hl, bc
    ld a, [hl]
    ld [$c60b], a
    ret


    nop

jr_001_7838:
    inc b
    ld [$1612], sp
    jr nz, jr_001_7838

    ccf
    ret z

    ld b, a
    ld a, [$c0fd]
    cp b
    ret z

    ld [$c83f], a
    ld b, $00
    ld c, a
    ld hl, $7861
    add hl, bc
    ld a, [hl]
    ld b, a
    ld a, [$c840]
    cp b
    ret z

    ld a, b
    ld [$c680], a
    ldh [$ffa0], a
    ld [$c840], a
    ret


    ld b, $06
    ld b, $06
    ld b, $06
    ld b, $06
    ld b, $06
    rlca
    ld [$0707], sp
    ld [$0709], sp
    rlca
    ld [$0709], sp
    rlca
    ld [$0909], sp
    add hl, bc
    add hl, bc
    add hl, bc
    add hl, bc
    add hl, bc
    add hl, bc
    add hl, bc

Call_001_7881:
    ld a, [$c105]
    or a
    ret z

    ld a, [$c6da]
    or a
    ret nz

    ld a, [$c6c6]
    ld b, a
    ld a, [$c103]
    sub $10
    srl a
    srl a
    srl a
    sub b
    sub $08
    jr nc, jr_001_78a3

    ld b, $0f
    jr jr_001_78c5

jr_001_78a3:
    ld a, [$c5a8]
    cp $01
    jr nz, jr_001_78b2

    ld a, [$c6db]
    add $0a
    ld b, a
    jr jr_001_78c5

jr_001_78b2:
    ld a, [$c5a8]
    cp $02
    jr nz, jr_001_78bd

    ld b, $11
    jr jr_001_78c5

jr_001_78bd:
    ld a, [$c5a8]
    cp $03
    ret nz

    ld b, $10

jr_001_78c5:
    ld a, [$c840]
    cp b
    ret z

    ld a, b
    ldh [$ffa0], a
    ld [$c840], a
    ret


    ld a, [PROF_ACTION1]
    or a
    ret nz

    ld a, [PROF_ACTION2]
    or a
    ret nz

    ld a, [PROF_ACTION3]
    cp $08
    ret nz

    push de
    ld hl, $c5e1
    ld d, $00
    ld e, $04

Jump_001_78e9:
    ld a, [hl]
    or a
    jp z, Jump_001_7911

    ld a, [$c6cd]
    ld b, a
    ld a, [hl+]
    sub b
    jp c, Jump_001_7911

    jp z, Jump_001_78fd

    inc hl
    jr jr_001_790c

Jump_001_78fd:
    ld a, [$c6ce]
    and $f0
    inc a
    ld b, a
    ld a, [hl+]
    sub b
    jp c, Jump_001_7911

    jp z, Jump_001_7911

jr_001_790c:
    inc d
    dec e
    jp nz, Jump_001_78e9

Jump_001_7911:
    ld a, d
    sla a
    sla a
    sla a
    ld b, a
    ld a, [$c103]
    add b
    ld [$c103], a
    ld a, $01
    ld [RENDER_REQUEST], a
    pop de
    ret


    ld de, $c0a0
    ld b, $19

jr_001_792c:
    ld hl, $0005
    add hl, de
    ld a, [hl]
    cp $52
    jr nz, jr_001_7936

    xor a

jr_001_7936:
    ld hl, $795e
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


Jump_001_7949:
    pop bc
    pop de
    ld h, d
    ld l, e
    ld de, $0020
    add hl, de
    ld d, h
    ld e, l
    dec b
    jr nz, jr_001_792c

    ld a, [$c5ac]
    inc a
    ld [$c5ac], a
    ret


    xor [hl]
    ld a, c
    or d
    ld a, c
    xor [hl]
    ld a, c
    xor [hl]
    ld a, c
    xor [hl]
    ld a, c
    xor [hl]
    ld a, c
    xor [hl]
    ld a, c
    xor [hl]
    ld a, c
    ld c, [hl]
    ld a, d
    ld l, [hl]
    ld a, d
    sbc l
    ld a, d
    jp nc, $ec7a

    ld a, d
    xor [hl]
    ld a, c
    xor [hl]
    ld a, c
    xor [hl]
    ld a, c
    inc bc
    ld a, e
    cpl
    ld a, e
    ld d, a
    ld a, e
    ld [hl], a
    ld a, e
    cp d
    ld a, e
    push af
    ld a, e
    dec sp
    ld a, h
    ld c, [hl]
    ld a, h
    ld h, [hl]
    ld a, h
    ld a, e
    ld a, h
    xor [hl]
    ld a, c
    xor [hl]
    ld a, c
    xor [hl]
    ld a, c
    xor [hl]
    ld a, c
    xor [hl]
    ld a, c
    xor [hl]
    ld a, c
    sub d
    ld a, h
    xor b
    ld a, h
    xor [hl]
    ld a, c
    xor [hl]
    ld a, c
    xor [hl]
    ld a, c
    xor [hl]
    ld a, c
    xor [hl]
    ld a, c
    xor [hl]
    ld a, c
    jp Jump_001_7949


    ret


    ld a, [$c6da]
    and $0f
    jr z, jr_001_7a13

    cp $01
    jr nz, jr_001_79e7

    ld hl, $0005
    add hl, de
    ld [hl], $08
    ld b, a
    ld a, [$c6da]
    swap a
    and $0f
    xor b
    jr z, jr_001_79dc

    ld a, $01
    ld [$c7c7], a
    ld [$c7c9], a
    call Call_001_7cbb
    jp Jump_001_7949


jr_001_79dc:
    ld a, $02
    ld [$c7c7], a
    call Call_001_7cbb
    jp Jump_001_7949


jr_001_79e7:
    ld hl, $0005
    add hl, de
    ld [hl], $10
    ld b, a
    ld a, [$c6da]
    swap a
    and $0f
    xor b
    jr z, jr_001_7a08

    ld a, $00
    ld [$c7c7], a
    ld a, $02
    ld [$c7c9], a
    call Call_001_7cbb
    jp Jump_001_7949


jr_001_7a08:
    ld a, $02
    ld [$c7c7], a
    call Call_001_7cbb
    jp Jump_001_7949


jr_001_7a13:
    ld a, [$c6da]
    swap a
    and $0f
    jp z, Jump_001_7949

    cp $01
    jr nz, jr_001_7a37

    ld hl, $0005
    add hl, de
    ld [hl], $20
    ld a, $00
    ld [$c7c7], a
    ld a, $01
    ld [$c7c9], a
    call Call_001_7cbb
    jp Jump_001_7949


jr_001_7a37:
    ld hl, $0005
    add hl, de
    ld [hl], $18
    ld a, $01
    ld [$c7c7], a
    ld a, $02
    ld [$c7c9], a
    call Call_001_7cbb
    jp Jump_001_7949


    ret


    ld a, $05
    ldh [$ffa1], a
    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $3e
    add b
    call Call_001_7654
    ld hl, $0012
    add hl, de
    ld [hl], $00
    ld hl, $0005
    add hl, de
    ld [hl], $09
    jp Jump_001_7949


    ret


    ld a, $01
    ld [RENDER_REQUEST], a
    ld hl, $0012
    add hl, de
    ld a, [hl]
    cp $08
    jr z, jr_001_7a89

    inc a
    ld [hl], a
    ld hl, $0003
    add hl, de
    ld a, [hl]
    sub $02
    ld [hl], a
    jp Jump_001_7949


jr_001_7a89:
    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jp nz, Jump_001_7949

    ld hl, $0005
    add hl, de
    ld [hl], $0a
    jp Jump_001_7949


    ret


    ld a, $01
    ld [RENDER_REQUEST], a
    ld hl, $0012
    add hl, de
    ld a, [hl]
    cp $00
    jr z, jr_001_7ab8

    dec a
    ld [hl], a
    ld hl, $0003
    add hl, de
    ld a, [hl]
    add $02
    ld [hl], a
    jp Jump_001_7949


jr_001_7ab8:
    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $40
    add b
    call Call_001_7654
    ld hl, $0005
    add hl, de
    ld [hl], $0b
    ld a, $15
    ldh [$ffa1], a
    jp Jump_001_7949


    ret


    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jp nz, Jump_001_7949

    ld hl, $001b
    add hl, de
    ld [hl], $00
    ld hl, $0005
    add hl, de
    ld [hl], $0c
    jp Jump_001_7949


    ret


    ld hl, $001b
    add hl, de
    ld a, [hl]
    cp $3c
    jr z, jr_001_7afa

    inc a
    ld [hl], a
    jp Jump_001_7949


jr_001_7afa:
    ld a, $01
    ld [$c7c8], a
    jp Jump_001_7949


    ret


    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $48
    add b
    call Call_001_7654
    ld a, [$c7c7]
    cp $02
    jr z, jr_001_7b1f

    ld hl, $0005
    add hl, de
    ld [hl], $11
    jp Jump_001_7949


jr_001_7b1f:
    ld hl, $001b
    add hl, de
    ld [hl], $00
    ld hl, $0005
    add hl, de
    ld [hl], $17
    jp Jump_001_7949


    ret


    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jp nz, Jump_001_7949

    ld a, [$c5ed]
    add $08
    ld [$c5ed], a
    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $44
    add b
    call Call_001_7654
    ld hl, $0005
    add hl, de
    ld [hl], $12
    jp Jump_001_7949


    ret


    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jp nz, Jump_001_7949

    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $46
    add b
    call Call_001_7654
    ld hl, $0005
    add hl, de
    ld [hl], $13
    jp Jump_001_7949


    ret


    ld a, [$c5ac]
    and $01
    jp nz, Jump_001_7949

    ld a, $01
    ld [RENDER_REQUEST], a
    ld a, [$c5ed]
    add $01
    ld [$c5ed], a
    cp $18
    jr nz, jr_001_7b9f

    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $55
    add b
    call Call_001_7654
    jp Jump_001_7949


jr_001_7b9f:
    cp $30
    jp nz, Jump_001_7949

    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $57
    add b
    call Call_001_7654
    ld hl, $0005
    add hl, de
    ld [hl], $14
    jp Jump_001_7949


    ret


    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jp nz, Jump_001_7949

    ld hl, $0012
    add hl, de
    ld [hl], $00
    ld hl, $0002
    add hl, de
    ld a, [hl]
    sub $30
    jr c, jr_001_7be0

    ld hl, $0011
    add hl, de
    ld [hl], $00
    ld a, $59
    call Call_001_7654
    jr jr_001_7beb

jr_001_7be0:
    ld hl, $0011
    add hl, de
    ld [hl], $01
    ld a, $52
    call Call_001_7654

jr_001_7beb:
    ld hl, $0005
    add hl, de
    ld [hl], $15
    jp Jump_001_7949


    ret


    ld hl, $0002
    add hl, de
    ld a, [hl]
    sub $30
    jp z, Jump_001_7c2c

    ld hl, $0012
    add hl, de
    ld a, [hl]
    sub $01
    jr nc, jr_001_7c0e

    ld a, [hl]
    inc a
    ld [hl], a
    jp Jump_001_7949


jr_001_7c0e:
    ld [hl], $00
    ld a, $01
    ld [RENDER_REQUEST], a
    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, $01
    or a
    jp nz, Jump_001_7c22

    ld b, $ff

Jump_001_7c22:
    ld hl, $0002
    add hl, de
    ld a, [hl]
    add b
    ld [hl], a
    jp Jump_001_7949


Jump_001_7c2c:
    ld a, $54
    call Call_001_7654
    ld hl, $0005
    add hl, de
    ld [hl], $16
    jp Jump_001_7949


    ret


    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jp nz, Jump_001_7949

    ld a, $01
    ld [$c7c8], a
    jp Jump_001_7949


    ret


    ld hl, $001b
    add hl, de
    ld a, [hl]
    cp $78
    jp nz, Jump_001_7c5d

    inc a
    ld [hl], a
    jp Jump_001_7949


Jump_001_7c5d:
    ld a, $01
    ld [$c7c8], a
    jp Jump_001_7949


    ret


    ld a, $53
    call Call_001_7654
    ld hl, $001b
    add hl, de
    ld [hl], $00
    ld hl, $0005
    add hl, de
    ld [hl], $19
    jp Jump_001_7949


    ret


    ld hl, $001b
    add hl, de
    ld a, [hl]
    cp $78
    jr z, jr_001_7c89

    inc a
    ld [hl], a
    jp Jump_001_7949


jr_001_7c89:
    ld a, $01
    ld [$c7c8], a
    jp Jump_001_7949


    ret


    ld hl, $0011
    add hl, de
    ld a, [hl]
    ld b, a
    ld a, $42
    add b
    call Call_001_7654
    ld hl, $0005
    add hl, de
    ld [hl], $21
    jp Jump_001_7949


    ret


    ld hl, $000a
    add hl, de
    ld a, [hl]
    cp $ff
    jp nz, Jump_001_7949

    ld a, $01
    ld [$c7c8], a
    jp Jump_001_7949


    ret


Call_001_7cbb:
    call Call_000_01fb
    ret

