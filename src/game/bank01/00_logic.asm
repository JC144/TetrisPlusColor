; ============================================================================
; bank01/00_logic.asm — $4000-$541a: game logic, entities, WRITE_TILE renderers
; Part of SECTION "ROM Bank $001"; included in order by bank01_game_logic.asm.
; ============================================================================
Call_001_4000:
    ds 8, 0 ; 8 x nop ($00)
    ld bc, $0101
    ld bc, $0101
    ld bc, $0201
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    ld b, $06
    ld b, $06
    ld b, $06
    ld b, $06
    ds 8, 0 ; 8 x nop ($00)
    ld bc, $0101
    ld bc, $0101
    ld bc, $0201
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    ld b, $06
    ld b, $06
    ld b, $06
    ld b, $06
    ds 8, 0 ; 8 x nop ($00)
    ld bc, $0101
    ld bc, $0101
    ld bc, $0201

Jump_001_4081:
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    ld b, $06
    ld b, $06
    ld b, $06
    ld b, $06
    ds 8, 0 ; 8 x nop ($00)
    ld bc, $0101
    ld bc, $0101
    ld bc, $0201
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld [bc], a
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    inc b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    dec b
    ld b, $06
    ld b, $06
    ld b, $06
    ld b, $06
    nop
    ld bc, $0302
    inc b
    dec b
    ld b, $00
    ld bc, $0302
    inc b
    dec b
    ld b, $00
    ld bc, $0302
    inc b
    dec b
    ld b, $00
    ld bc, $0302
    inc b
    dec b
    ld b, $00
    ld bc, $0302
    inc b
    ld b, c
    inc b
    ld b, d
    nop
    inc bc
    ld bc, $0405
    nop
    ld b, $02
    ld bc, $0505
    ld [bc], a
    inc b
    inc bc
    inc bc
    ld [bc], a
    dec b
    ld b, $03
    ld bc, $0000
    ld b, $06
    inc b
    inc b
    ld [bc], a
    ld [bc], a
    inc bc
    dec b
    inc bc
    ld b, $00
    ld bc, $0401
    ld [bc], a
    ld b, $01
    inc b
    inc bc
    nop
    ld b, $03
    inc bc
    dec b
    ld [bc], a
    nop
    ld b, $00
    ld bc, $0105
    dec b
    ld [bc], a
    inc b
    ld [bc], a
    ld bc, $0306
    ld [bc], a
    dec b
    ld bc, $0506
    nop
    nop
    ld b, $04
    inc b
    inc bc
    ld bc, $0100
    ld b, $05
    dec b
    ld [bc], a
    ld b, $06
    ld [bc], a
    inc b
    inc bc
    inc bc
    ld [bc], a
    inc b
    ld [bc], a
    inc bc
    dec b
    ld bc, $0006
    inc b
    inc b
    ld b, $05
    nop
    ld [bc], a
    dec b
    ld bc, $0601
    inc bc
    nop
    ld bc, $0403
    dec b
    ld bc, $0306
    ld [bc], a
    nop
    nop
    inc b
    ld b, $05
    ld bc, $0203
    ld b, $04
    nop
    dec b
    ld bc, $0600
    nop
    ld bc, $0204
    dec b
    ld b, $05
    inc b
    ld b, $01
    inc bc
    inc bc
    ld [bc], a
    dec b
    nop
    dec b
    inc b
    ld b, $00
    ld bc, $0103
    ld [bc], a
    inc bc
    inc b
    inc b
    inc b
    ld [bc], a
    dec b
    ld bc, $0504
    ld bc, $0301
    ld b, $00
    dec b
    ld [bc], a
    ld [bc], a
    inc bc
    inc b
    ld [bc], a
    inc bc
    nop
    dec b
    nop
    ld bc, $0106
    dec b
    ld [bc], a
    inc b
    ld [bc], a
    inc bc
    ld b, $05
    nop
    inc b
    ld [bc], a
    ld b, $00
    inc b
    ld bc, $0405
    dec b
    inc bc
    inc bc
    ld [bc], a
    inc b
    nop
    dec b
    ld bc, $0200
    dec b
    ld b, $02
    inc b
    inc b
    ld b, $00
    ld b, $03
    ld bc, $0200
    nop
    nop
    ld b, $03
    ld [bc], a
    inc b
    dec b
    ld bc, $0603
    ld [bc], a
    inc bc
    ld [bc], a
    inc b
    nop
    ld bc, $0403
    nop
    inc bc
    ld b, $01
    ld b, $05
    dec b
    nop
    inc b
    inc bc
    ld [bc], a
    inc b
    inc bc
    ld [bc], a
    dec b
    ld bc, $0601
    nop
    inc b
    inc bc
    nop
    ld bc, $0201
    ld bc, $0605
    inc bc
    ld bc, $0402
    ld [bc], a
    nop
    nop
    ld b, $06
    ld bc, $0305
    dec b
    ld b, $00
    ld bc, $0300
    ld [bc], a
    inc bc
    nop
    inc b
    ld [bc], a
    inc bc
    dec b
    dec b
    ld bc, $0300
    inc bc
    ld b, $05
    ld b, $01
    dec b
    nop
    ld bc, $0005
    ld b, $02
    dec b
    ld b, $01
    inc bc
    inc b
    inc b
    nop
    nop
    ld b, $02
    ld bc, $0603
    ld bc, $0005
    ld [bc], a
    ld [bc], a
    inc bc
    ld [bc], a
    nop
    inc b
    nop
    ld bc, $0601
    dec b
    inc bc
    ld b, $02
    dec b
    ld b, $05
    inc bc
    dec b
    ld [bc], a
    ld bc, $0102
    ld [bc], a
    nop
    ld b, $05
    inc bc
    ld bc, $0504
    inc b
    nop
    inc bc
    nop
    inc bc
    inc b
    ld b, $05
    inc bc
    inc b
    ld b, $02
    ld [bc], a
    ld bc, $0604
    ld bc, $0403
    inc bc
    ld b, $03
    inc b
    dec b
    ld bc, $0302
    nop
    ld [bc], a
    inc b
    dec b
    inc bc
    ld b, $06
    inc bc
    inc b
    dec b
    dec b
    ld bc, $0401
    nop
    inc b
    ld bc, $0600
    inc bc
    ld b, $03
    ld [bc], a
    nop
    ld [bc], a
    nop
    ld bc, $0206
    inc b
    ld [bc], a
    inc b
    dec b
    ld b, $01
    inc b
    dec b
    ld bc, $0103
    inc bc
    nop
    nop
    ld b, $05
    inc b
    ld [bc], a
    inc b
    ld [bc], a
    ld b, $03
    dec b
    inc b
    inc b
    nop
    ld bc, $0100
    inc b
    dec b
    ld b, $04
    inc bc
    inc bc
    ld [bc], a
    inc b
    nop
    inc b
    ld [bc], a
    ld bc, $0605
    nop
    inc b
    dec b
    dec b
    ld [bc], a
    ld b, $02
    inc b
    dec b
    ld bc, $0406
    nop
    ld [bc], a
    inc bc
    ld [bc], a
    ld bc, $0503
    ld [bc], a
    nop
    ld b, $00
    ld b, $05
    inc bc
    inc b
    dec b
    inc b
    ld bc, $0201
    ld b, $03
    inc b
    nop
    ld bc, $0003
    dec b
    nop
    ld [bc], a
    inc b
    ld bc, $0503
    dec b
    ld [bc], a
    ld [bc], a
    nop
    inc bc
    inc bc
    nop
    ld [bc], a
    inc b
    dec b
    ld bc, HeaderLogo
    inc b
    ld b, $00
    ld [bc], a
    nop
    ldh [$ffe1], a
    ldh [c], a
    db $e3
    db $e4
    push hl
    and $19
    ld b, e
    add hl, sp
    ld b, e
    ld e, c
    ld b, e
    ld a, c
    ld b, e
    sbc c
    ld b, e
    cp c
    ld b, e
    reti


    ld b, e
    cp $ff
    rst $38
    rst $38
    nop
    nop
    ld bc, $e000
    rst $38
    nop
    nop
    jr nz, jr_001_4327

jr_001_4327:
    ld b, b
    nop
    cp $ff
    rst $38
    rst $38
    nop
    nop
    ld bc, $e000
    rst $38
    nop
    nop
    jr nz, jr_001_4337

jr_001_4337:
    ld b, b
    nop
    rst $38
    rst $38
    nop
    nop
    rra
    nop
    jr nz, jr_001_4341

jr_001_4341:
    rst $38
    rst $38
    nop
    nop
    rra
    nop
    jr nz, jr_001_4349

jr_001_4349:
    rst $38
    rst $38
    nop
    nop
    rra
    nop
    jr nz, jr_001_4351

jr_001_4351:
    rst $38
    rst $38
    nop
    nop
    rra
    nop
    jr nz, jr_001_4359

jr_001_4359:
    rst $38
    rst $38
    nop
    nop
    ld bc, $2000
    nop
    ldh [rIE], a
    nop
    nop
    ld bc, $2000
    nop
    nop
    nop
    rra
    nop
    jr nz, jr_001_436f

jr_001_436f:
    ld hl, $e000
    rst $38
    rst $38
    rst $38
    nop
    nop
    jr nz, jr_001_4379

jr_001_4379:
    rst $38
    rst $38
    nop
    nop
    ld bc, $2100
    nop
    ldh [rIE], a
    pop hl
    rst $38
    nop
    nop
    jr nz, jr_001_4389

jr_001_4389:
    rst $38
    rst $38
    rra
    nop
    jr nz, jr_001_438f

jr_001_438f:
    ld hl, $e000
    rst $38
    nop
    nop
    rra
    nop
    jr nz, jr_001_4399

jr_001_4399:
    rst $38
    rst $38
    nop
    nop
    ld bc, $1f00
    nop
    ldh [rIE], a
    nop
    nop
    jr nz, jr_001_43a7

jr_001_43a7:
    ld hl, $0100
    nop
    rra
    nop
    jr nz, jr_001_43af

jr_001_43af:
    ld hl, $df00
    rst $38
    ldh [rIE], a
    nop
    nop
    jr nz, jr_001_43b9

jr_001_43b9:
    rst $38
    rst $38
    nop
    nop
    jr nz, jr_001_43bf

jr_001_43bf:
    ld hl, $e100
    rst $38
    nop
    nop
    ld bc, $2000
    nop
    rst $38
    rst $38
    nop
    nop
    jr nz, jr_001_43cf

jr_001_43cf:
    ld hl, $e100
    rst $38
    nop
    nop
    ld bc, $2000
    nop
    nop
    nop
    ld bc, $1f00
    nop
    jr nz, jr_001_43e1

jr_001_43e1:
    rst $18
    rst $38
    rst $38
    rst $38
    nop
    nop
    jr nz, jr_001_43e9

jr_001_43e9:
    nop
    nop
    ld bc, $1f00
    nop
    jr nz, jr_001_43f1

jr_001_43f1:
    rst $18
    rst $38
    rst $38
    rst $38
    nop
    nop
    jr nz, jr_001_43f9

jr_001_43f9:
    rlca
    ld b, h
    ld b, a
    ld b, h
    add a
    ld b, h
    rst $00
    ld b, h
    rlca
    ld b, l
    ld b, a
    ld b, l
    add a
    ld b, l
    ld e, $00
    rra
    nop
    jr nz, jr_001_440d

jr_001_440d:
    ld hl, $1100
    ld de, $1111
    ld de, $1111
    ld de, $0060
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1e11
    nop
    rra
    nop
    jr nz, jr_001_442d

jr_001_442d:
    ld hl, $1100
    ld de, $1111
    ld de, $1111
    ld de, $0060
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $3f11
    nop
    ld b, b
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ccf
    nop
    ld b, b
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ccf
    nop
    ld b, b
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ccf
    nop
    ld b, b
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    rra
    nop
    ld b, b
    nop
    ld hl, $1100
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld b, b
    nop
    ld hl, $1100
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $3f11
    nop
    ld b, b
    nop
    ld b, c
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $001f
    ld b, b
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    rra
    nop
    jr nz, jr_001_44cb

jr_001_44cb:
    ld b, c
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $0040
    ld bc, $1100
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $3f11
    nop
    ld b, b
    nop
    ld b, c
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $003f
    ld b, b
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ccf
    nop
    jr nz, jr_001_450b

jr_001_450b:
    ld hl, $1100
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld b, b
    nop
    ld b, c
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ccf
    nop
    ld b, b
    nop
    ld b, c
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $ffff
    ld b, b
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    rra
    nop
    ld b, b
    nop
    ld b, c
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $0040
    ld hl, $1100
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1f11
    nop
    ld b, b
    nop
    ld b, c
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $0040
    ld hl, $1100
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $3f11
    nop
    ld b, b
    nop
    ld hl, $1100
    ld de, $1111
    ld de, $1111
    ld de, $1111
    rra
    nop
    ld b, b
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ccf
    nop
    ld b, b
    nop
    ld hl, $1100
    ld de, $1111
    ld de, $1111
    ld de, $1111
    rra
    nop
    ld b, b
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    push de
    ld b, l
    dec d
    ld b, [hl]
    ld d, l
    ld b, [hl]
    sub l
    ld b, [hl]
    push de
    ld b, [hl]
    dec d
    ld b, a
    ld d, l
    ld b, a
    db $fd
    rst $38
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $df11
    rst $38
    rst $38
    rst $38
    rra
    nop
    ccf
    nop
    ld de, $1111
    ld de, $1111
    ld de, $fd11
    rst $38
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $df11
    rst $38
    rst $38
    rst $38
    rra
    nop
    ccf
    nop
    ld de, $1111
    ld de, $1111
    ld de, $fe11
    rst $38
    ld e, $00
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    cp $ff
    ld e, $00
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    cp $ff
    ld e, $00
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    cp $ff
    ld e, $00
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    cp $ff
    rra
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    rst $18
    rst $38
    rst $38
    rst $38
    rra
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $ffff
    ld e, $00
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    rst $18
    rst $38
    cp $ff
    rra
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $fffe
    jr nz, jr_001_4699

jr_001_4699:
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    rst $18
    rst $38
    rst $38
    rst $38
    rra
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $fffe
    ld e, $00
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    rst $18
    rst $38
    rst $38
    rst $38
    ld e, $00
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $fffe
    ld e, $00
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    rst $18
    rst $38
    rst $38
    rst $38
    rra
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $0000
    ld e, $00
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    sbc $ff
    rst $38
    rst $38
    rra
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $fffe
    rra
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ldh [rIE], a
    rst $38
    rst $38
    rra
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $fffe
    rra
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ldh [rIE], a
    rst $38
    rst $38
    rra
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $ffff
    ld e, $00
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    sbc $ff
    cp $ff
    rra
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $ffff
    ld e, $00
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    sbc $ff
    cp $ff
    rra
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $47a3
    db $e3
    ld b, a
    inc hl
    ld c, b
    ld h, e
    ld c, b
    and e
    ld c, b
    db $e3
    ld c, b
    inc hl
    ld c, c
    ld [bc], a
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $e111
    rst $38
    ld bc, $2100
    nop
    ld b, c
    nop
    ld de, $1111
    ld de, $1111
    ld de, $0211
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $e111
    rst $38
    ld bc, $2100
    nop
    ld b, c
    nop
    ld de, $1111
    ld de, $1111
    ld de, $0111
    nop
    ld hl, $1100
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $0111
    nop
    ld hl, $1100
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $0111
    nop
    ld hl, $1100
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $0111
    nop
    ld hl, $1100
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $0211
    nop
    ld hl, $1100
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $e111
    rst $38
    ld [bc], a
    nop
    ld hl, $1100
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld bc, $2200
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    pop hl
    rst $38
    ld bc, $2100
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $0002
    ld [hl+], a
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ldh [c], a
    rst $38
    ld bc, $2100
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $0000
    ld [hl+], a
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    pop hl
    rst $38
    ld bc, $2100
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $0002
    jr nz, jr_001_48a7

jr_001_48a7:
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    pop hl
    rst $38
    ld bc, $2200
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $0002
    ld [hl+], a
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    pop hl
    rst $38
    ld bc, $2100
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $0001
    ld [hl+], a
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ldh [c], a
    rst $38
    ld [bc], a
    nop
    ld hl, $1100
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld bc, $2200
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ldh [c], a
    rst $38
    ld [bc], a
    nop
    ld hl, $1100
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld [bc], a
    nop
    ld hl, $1100
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $e011
    rst $38
    ld bc, $2100
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $0002
    ld hl, $1100
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $e011
    rst $38
    ld bc, $2100
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $4971
    or c
    ld c, c
    pop af
    ld c, c
    ld sp, $714a
    ld c, d
    or c
    ld c, d
    pop af
    ld c, d
    cp $ff
    rst $38
    rst $38
    ld bc, $1100
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ldh [rIE], a
    jr nz, jr_001_4985

jr_001_4985:
    ld b, b
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $fffe
    rst $38
    rst $38
    ld bc, $1100
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ldh [rIE], a
    jr nz, jr_001_49a5

jr_001_49a5:
    ld b, b
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $0111
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $e011
    rst $38
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1f11
    nop
    ld hl, $1100
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $e011
    rst $38
    rst $38
    rst $38
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    rst $38
    rst $38
    ld bc, $2100
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $ffe0
    pop hl
    rst $38
    jr nz, jr_001_4a47

jr_001_4a47:
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $ffff
    rra
    nop
    ld hl, $1100
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ldh [rIE], a
    nop
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    rst $38
    rst $38
    ld bc, $1f00
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $ffe0
    jr nz, jr_001_4a85

jr_001_4a85:
    ld hl, $1100
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld bc, $1f00
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    rst $18
    rst $38
    ldh [rIE], a
    nop
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $ffff
    ld hl, $1100
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $e111
    rst $38
    ld bc, $1100
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $ff11
    rst $38
    ld hl, $1100
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $e111
    rst $38
    ld bc, $1100
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $0111
    nop
    rra
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    rst $18
    rst $38
    rst $38
    rst $38
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld bc, $1f00
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    rst $18
    rst $38
    rst $38
    rst $38
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ccf
    ld c, e
    ld a, a
    ld c, e
    cp a
    ld c, e
    rst $38
    ld c, e
    ccf
    ld c, h
    ld a, a
    ld c, h
    cp a
    ld c, h
    cp $ff
    rst $38
    rst $38
    ld bc, $1100
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ldh [rIE], a
    jr nz, jr_001_4b53

jr_001_4b53:
    ld b, b
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $fffe
    rst $38
    rst $38
    ld bc, $1100
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ldh [rIE], a
    jr nz, jr_001_4b73

jr_001_4b73:
    ld b, b
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $ff11
    rst $38
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $e011
    rst $38
    ld bc, $1100
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1f11
    nop
    ld hl, $1100
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $e011
    rst $38
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $ff11
    rst $38
    ld bc, $2100
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $ffe0
    pop hl
    rst $38
    nop
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $ffff
    ld hl, $1100
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $e011
    rst $38
    rra
    nop
    jr nz, jr_001_4c35

jr_001_4c35:
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $ffff
    ld bc, $1f00
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $ffe0
    nop
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld bc, $1f00
    nop
    ld hl, $1100
    ld de, $1111
    ld de, $1111
    ld de, $1111
    rst $18
    rst $38
    ldh [rIE], a
    jr nz, jr_001_4c75

jr_001_4c75:
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $ffff
    ld hl, $1100
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $e111
    rst $38
    ld bc, $1100
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $ff11
    rst $38
    ld hl, $1100
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $e111
    rst $38
    ld bc, $1100
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $0111
    nop
    rra
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    rst $18
    rst $38
    rst $38
    rst $38
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld bc, $1f00
    nop
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    rst $18
    rst $38
    rst $38
    rst $38
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld de, $1111
    ld e, d
    ld a, [bc]
    ld d, l
    ld a, [bc]
    ld b, [hl]
    ld a, [bc]
    inc a
    ld a, [bc]
    ld c, e
    ld a, [bc]
    ld b, c
    ld a, [bc]
    ld [hl-], a
    ld a, [bc]
    inc hl
    ld a, [bc]
    ld [hl-], a
    ld a, [bc]
    add hl, de
    ld a, [bc]
    inc d
    ld a, [bc]
    db $10
    rrca
    inc d
    ld a, [bc]
    ld c, $0f
    ld [$060f], sp
    inc d
    db $10
    rrca
    ld a, [bc]
    inc d
    ld [$0419], sp
    add hl, de
    inc c
    rrca
    ld [$060f], sp
    rrca
    inc bc
    inc d
    ld b, $14
    dec b
    inc d
    inc b
    add hl, de
    inc bc
    add hl, de
    inc bc
    inc d
    inc bc
    inc d
    inc bc
    rrca
    inc bc
    rrca
    inc bc
    rrca
    ld [bc], a
    ld e, $02
    add hl, de
    ld [bc], a
    rla
    ld [bc], a
    inc d
    ld [bc], a
    ld [de], a
    ld [bc], a
    rrca
    ld bc, $011e
    add hl, de
    ld bc, $0119
    inc d
    ld bc, $010f
    rrca
    ld bc, $010a
    ld a, [bc]
    ld bc, $010a
    ld a, [bc]
    ld bc, $010a
    ld a, [bc]
    and e
    ld c, l
    or e
    ld c, l
    jp $d34d


    ld c, l
    db $e3
    ld c, l
    di
    ld c, l
    inc bc
    ld c, [hl]
    inc de
    ld c, [hl]
    inc hl
    ld c, [hl]
    inc sp
    ld c, [hl]
    ld b, e
    ld c, [hl]
    ld d, e
    ld c, [hl]
    ld h, e
    ld c, [hl]
    ld [hl], e
    ld c, [hl]
    add e
    ld c, [hl]
    sub e
    ld c, [hl]
    and e
    ld c, [hl]
    or e
    ld c, [hl]
    jp $d34e


    ld c, [hl]
    db $e3
    ld c, [hl]
    di
    ld c, [hl]
    inc bc
    ld c, a
    inc de
    ld c, a
    inc hl
    ld c, a
    inc sp
    ld c, a
    ld b, e
    ld c, a
    ld d, e
    ld c, a
    ld h, e
    ld c, a
    ld [hl], e
    ld c, a
    add e
    ld c, a
    nop
    ld bc, $0000
    nop
    inc b
    nop
    nop
    nop
    ld [$0000], sp
    nop
    ld d, $00
    nop
    nop
    ld bc, $0000
    nop
    inc b
    nop
    nop
    nop
    ld [$0000], sp
    nop
    ld d, $00
    nop
    nop
    ld [bc], a
    nop
    nop
    nop
    ld [$0000], sp
    nop
    ld d, $00
    nop
    nop
    ld [hl-], a
    nop
    nop
    nop
    inc bc
    nop
    nop
    nop
    ld [de], a
    nop
    nop
    nop
    inc h
    nop
    nop
    nop
    ld c, b
    nop
    nop
    nop
    inc b
    nop
    nop
    nop
    ld d, $00
    nop
    nop
    ld [hl-], a
    nop
    nop
    nop
    ld h, h
    nop
    nop
    nop
    dec b
    nop
    nop
    nop
    jr nz, jr_001_4dfa

jr_001_4dfa:
    nop
    nop
    ld b, b
    nop
    nop
    nop
    add b
    nop
    nop
    nop
    ld b, $00
    nop
    nop
    inc h
    nop
    nop
    nop
    ld c, b
    nop
    nop
    nop
    sub [hl]
    nop
    nop
    nop
    rlca
    nop
    nop
    nop
    jr z, jr_001_4e1a

jr_001_4e1a:
    nop
    nop
    ld d, [hl]
    nop
    nop
    ld bc, $0012
    nop
    nop
    ld [$0000], sp
    nop
    ld [hl-], a
    nop
    nop
    nop
    ld h, h
    nop
    nop
    ld bc, $0028
    nop
    nop
    add hl, bc
    nop
    nop
    nop
    ld [hl], $00
    nop
    nop
    ld [hl], d
    nop
    nop
    ld bc, $0044
    nop
    nop
    stop
    nop
    nop
    ld b, b
    nop
    nop
    nop
    add b
    nop
    nop
    ld bc, $0060
    nop
    nop
    stop
    nop
    nop
    ld b, b
    nop
    nop
    nop
    add b
    nop
    nop
    ld bc, $0060
    nop
    nop
    stop
    nop
    nop
    ld b, b
    nop
    nop
    nop
    add b
    nop
    nop
    ld bc, $0060
    nop
    nop
    stop
    nop
    nop
    ld b, b
    nop
    nop
    nop
    add b
    nop
    nop
    ld bc, $0060
    nop
    nop
    stop
    nop
    nop
    ld b, b
    nop
    nop
    nop
    add b
    nop
    nop
    ld bc, $0060
    nop
    nop
    stop
    nop
    nop
    ld b, b
    nop
    nop
    nop
    add b
    nop
    nop
    ld bc, $0060
    nop
    nop
    stop
    nop
    nop
    ld b, b
    nop
    nop
    nop
    add b
    nop
    nop
    ld bc, $0060
    nop
    nop
    stop
    nop
    nop
    ld b, b
    nop
    nop
    nop
    add b
    nop
    nop
    ld bc, $0060
    nop
    nop
    stop
    nop
    nop
    ld b, b
    nop
    nop
    nop
    add b
    nop
    nop
    ld bc, $0060
    nop
    nop
    stop
    nop
    nop
    ld b, b
    nop
    nop
    nop
    add b
    nop
    nop
    ld bc, $0060
    nop
    nop
    stop
    nop
    nop
    ld b, b
    nop
    nop
    nop
    add b
    nop
    nop
    ld bc, $0060
    nop
    nop
    stop
    nop
    nop
    ld b, b
    nop
    nop
    nop
    add b
    nop
    nop
    ld bc, $0060
    nop
    nop
    stop
    nop
    nop
    ld b, b
    nop
    nop
    nop
    add b
    nop
    nop
    ld bc, $0060
    nop
    nop
    stop
    nop
    nop
    ld b, b
    nop
    nop
    nop
    add b
    nop
    nop
    ld bc, $0060
    nop
    nop
    stop
    nop
    nop
    ld b, b
    nop
    nop
    nop
    add b
    nop
    nop
    ld bc, $0060
    nop
    nop
    stop
    nop
    nop
    ld b, b
    nop
    nop
    nop
    add b
    nop
    nop
    ld bc, $0060
    nop
    nop
    stop
    nop
    nop
    ld b, b
    nop
    nop
    nop
    add b
    nop
    nop
    ld bc, $0060
    nop
    nop
    stop
    nop
    nop
    ld b, b
    nop
    nop
    nop
    add b
    nop
    nop
    ld bc, $0060
    nop
    nop
    stop
    nop
    nop
    ld b, b
    nop
    nop
    nop
    add b
    nop
    nop
    ld bc, $0060
    nop
    nop
    stop
    nop
    nop
    ld b, b
    nop
    nop
    nop
    add b
    nop
    nop
    ld bc, $0060
    nop
    nop
    stop
    nop
    nop
    ld b, b
    nop
    nop
    nop
    add b
    nop
    nop
    ld bc, $0060
    nop
    pop de
    ld c, a
    push de
    ld c, a
    reti


    ld c, a
    db $dd
    ld c, a
    pop hl
    ld c, a
    push hl
    ld c, a
    jp hl


    ld c, a
    db $ed
    ld c, a
    pop af
    ld c, a
    push af
    ld c, a
    ld sp, hl
    ld c, a
    db $fd
    ld c, a
    ld bc, $0550
    ld d, b
    add hl, bc
    ld d, b
    dec c
    ld d, b
    ld de, $1550
    ld d, b
    add hl, de
    ld d, b
    dec e
    ld d, b
    ld hl, $2550
    ld d, b
    add hl, hl
    ld d, b
    dec l
    ld d, b
    ld sp, $3550
    ld d, b
    add hl, sp
    ld d, b
    dec a
    ld d, b
    ld b, c
    ld d, b
    ld b, l
    ld d, b
    ld c, c
    ld d, b
    add h
    add a
    adc e
    adc a
    add h
    add a
    adc e
    adc a
    add l
    adc e
    adc a
    sub e
    add [hl]
    adc [hl]
    sub c
    sub [hl]
    add a
    adc a
    sub e
    sbc b
    adc b
    sub b
    sub l
    sbc d
    adc c
    sub c
    sub [hl]
    sbc e
    adc d
    sub d
    sub a
    sbc h
    adc e
    sub e
    sbc b
    sbc l
    adc h
    sub h
    sbc c
    sbc [hl]
    adc l
    sub l
    sbc d
    sbc a
    adc l
    sub l
    sbc d
    sbc a
    adc l
    sub l
    sbc d
    sbc a
    adc l
    sub l
    sbc d
    sbc a
    adc l
    sub l
    sbc d
    sbc a
    adc l
    sub l
    sbc d
    sbc a
    adc l
    sub l
    sbc d
    sbc a
    adc l
    sub l
    sbc d
    sbc a
    adc l
    sub l
    sbc d
    sbc a
    adc l
    sub l
    sbc d
    sbc a
    adc l
    sub l
    sbc d
    sbc a
    adc l
    sub l
    sbc d
    sbc a
    adc l
    sub l
    sbc d
    sbc a
    adc l
    sub l
    sbc d
    sbc a
    adc l
    sub l
    sbc d
    sbc a
    adc l
    sub l
    sbc d
    sbc a
    adc l
    sub l
    sbc d
    sbc a
    adc l
    sub l
    sbc d
    sbc a
    adc l
    sub l
    sbc d
    sbc a
    adc l
    sub l
    sbc d
    sbc a
    adc l
    sub l
    sbc d
    sbc a
    ld a, [$c5c8]
    bit 0, a
    call nz, Call_001_507e
    ld a, [$c5c8]
    bit 1, a
    call nz, Call_001_50cb
    ld a, [$c5c8]
    bit 2, a
    call nz, Call_001_51d9
    ld a, [$c5c8]
    bit 3, a
    call nz, Call_001_5249
    ld a, [$c5c8]
    bit 4, a
    call nz, Call_001_534b
    ld a, [$c5c8]
    bit 5, a
    call nz, Call_001_537b
    ret


Call_001_507e:
    ld hl, $c5ea
    ld a, [hl+]
    ld e, [hl]
    ld d, a
    cp $ff
    ret z

    ld hl, $3000
    add hl, de
    ld b, $98
    ld c, $00
    add hl, bc
    ld b, $0a
    push de

jr_001_5093:
    WRITE_TILE
    inc de
    dec b
    jr nz, jr_001_5093

    pop de
    ld h, d
    ld l, e
    ld bc, $ffe0
    add hl, bc
    ld a, h
    cp $cf
    jr z, jr_001_50b8

    ld [$c5ea], a
    ld a, l
    ld [$c5eb], a
    ld a, [$c5c8]
    and $fe
    ld [$c5c8], a
    ret


jr_001_50b8:
    ld a, $ff
    ld [$c5ea], a
    ld a, $ff
    ld [$c5eb], a
    ld a, [$c5c8]
    and $fe
    ld [$c5c8], a
    ret


Call_001_50cb:
    ld a, [$c5db]
    and $01
    ret z

    ld hl, $c0c3
    ld a, [hl]
    ld c, a
    ld hl, $5169
    ld b, $00
    sla c
    rl b
    sla c
    rl b
    add hl, bc
    ld b, $00
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl]
    ld [$c659], a
    ld h, $d0
    ld l, $01
    add hl, de
    ld bc, $c64b
    ld a, h
    ld [bc], a
    inc bc
    ld a, l
    ld [bc], a
    ld h, $98
    ld l, $01
    add hl, de
    ld bc, $c64d
    ld a, h
    ld [bc], a
    inc bc
    ld a, l
    ld [bc], a
    ld hl, $c0c2
    ld a, [hl]
    ld c, a
    ld b, $00
    ld hl, $51b1
    sla c
    rl b
    sla c
    rl b
    add hl, bc
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    ld a, [hl]
    ld [$c65b], a
    ld a, [$c64b]
    ld h, a
    ld a, [$c64c]
    ld l, a
    add hl, bc
    ld d, h
    ld e, l
    ld a, [$c64d]
    ld h, a
    ld a, [$c64e]
    ld l, a
    add hl, bc
    ld a, [$c65b]
    ld b, a
    ld a, [$c659]
    ld c, a

jr_001_513f:
    push de
    push hl

jr_001_5141:
    WRITE_TILE
    inc de
    dec b
    jr nz, jr_001_5141

    pop hl
    pop de
    push bc
    ld bc, $0020
    add hl, bc
    push hl
    ld h, d
    ld l, e
    add hl, bc
    ld d, h
    ld e, l
    pop hl
    pop bc
    dec c
    ld a, [$c65b]
    ld b, a
    jr nz, jr_001_513f

    ld a, [$c5c8]
    and $fd
    ld [$c5c8], a
    ret


    nop
    nop
    inc b
    nop
    nop
    nop
    dec b
    nop
    nop
    nop
    ld b, $00
    nop
    nop
    rlca
    nop
    jr nz, jr_001_517b

jr_001_517b:
    rlca
    nop
    ld b, b
    nop
    rlca
    nop
    ld h, b
    nop
    rlca
    nop
    add b
    nop
    rlca
    nop
    and b
    nop
    rlca
    nop
    ret nz

    nop
    rlca
    nop
    ldh [rP1], a
    rlca
    nop
    nop
    ld bc, $0007
    jr nz, jr_001_519c

    rlca

jr_001_519c:
    nop
    ld b, b
    ld bc, $0007
    ld h, b
    ld bc, $0007
    add b
    ld bc, $0006
    and b
    ld bc, $0005
    ret nz

    ld bc, $0004
    nop
    nop
    inc b
    nop
    nop
    nop
    dec b
    nop
    nop
    nop
    ld b, $00
    nop
    nop
    rlca
    nop
    ld bc, $0700
    nop
    ld [bc], a
    nop
    rlca
    nop
    inc bc
    nop
    rlca
    nop
    inc b
    nop
    ld b, $00
    dec b
    nop
    dec b
    nop
    ld b, $00
    inc b
    nop

Call_001_51d9:
    ld hl, $c5ca

Jump_001_51dc:
    call GBC_QueueEntryHook     ; was: push hl / push hl / ld de,$d000 (iso-size)
    nop
    nop
    ld a, [hl+]
    ld l, [hl]
    ld h, a
    add hl, de
    ld d, h
    ld e, l
    pop hl
    push de
    push hl
    ld bc, $9800
    ld a, [hl+]
    ld l, [hl]
    ld h, a
    add hl, bc
    ld a, h
    ld [$c64b], a
    ld a, l
    ld [$c64c], a
    pop hl
    ld de, $0002
    add hl, de
    ld b, [hl]
    ld a, b
    ld [$c659], a
    inc hl
    ld c, [hl]
    pop de
    push hl
    ld a, [$c64b]
    ld h, a
    ld a, [$c64c]
    ld l, a

jr_001_520f:
    push de
    push hl

jr_001_5211:
    WRITE_TILE
    inc de
    dec b
    jr nz, jr_001_5211

    pop hl
    pop de
    push bc
    ld bc, $0020
    add hl, bc
    push hl
    ld h, d
    ld l, e
    add hl, bc
    ld d, h
    ld e, l
    pop hl
    pop bc
    dec c
    ld a, [$c659]
    ld b, a
    jr nz, jr_001_520f

    pop hl
    pop hl
    ld de, $0004
    add hl, de
    ld a, [$c5da]
    dec a
    ld [$c5da], a
    jp nz, Jump_001_51dc

    ld a, [$c5c8]
    and $fb
    ld [$c5c8], a
    ret


Call_001_5249:
    ld a, [$c5db]
    and $01
    ret z

    ld a, [$c5a8]
    cp $01
    jp z, Jump_001_52ac

    ld a, [$c5a8]
    cp $02
    jp z, Jump_001_52f1

    ld a, [$c5a8]
    cp $03
    jp z, Jump_001_52ac

    ld hl, $d0ed
    ld d, h
    ld e, l
    ld h, $98
    ld l, $ed
    ld b, $06

jr_001_5272:
    WRITE_TILE
    inc de
    dec b
    jr nz, jr_001_5272

    ld hl, $d151
    ld d, h
    ld e, l
    ld h, $99
    ld l, $51
    ld b, $02

jr_001_5286:
    WRITE_TILE
    inc de
    dec b
    jr nz, jr_001_5286

    ld hl, $d1b0
    ld d, h
    ld e, l
    ld h, $99
    ld l, $b0
    ld b, $03

jr_001_529a:
    WRITE_TILE
    inc de
    dec b
    jr nz, jr_001_529a

    ld a, [$c5c8]
    and $f7
    ld [$c5c8], a
    ret


Jump_001_52ac:
    ld hl, $d10c
    ld d, h
    ld e, l
    ld h, $99
    ld l, $0c
    ld b, $07

jr_001_52b7:
    WRITE_TILE
    inc de
    dec b
    jr nz, jr_001_52b7

    ld hl, $d1ae
    ld d, h
    ld e, l
    ld h, $99
    ld l, $ae
    ld b, $05

jr_001_52cb:
    WRITE_TILE
    inc de
    dec b
    jr nz, jr_001_52cb

    ld hl, $d20e
    ld d, h
    ld e, l
    ld h, $9a
    ld l, $0e
    ld b, $05

jr_001_52df:
    WRITE_TILE
    inc de
    dec b
    jr nz, jr_001_52df

    ld a, [$c5c8]
    and $f7
    ld [$c5c8], a
    ret


Jump_001_52f1:
    ld hl, $d0ed
    ld d, h
    ld e, l
    ld h, $98
    ld l, $ed
    ld b, $07

jr_001_52fc:
    WRITE_TILE
    inc de
    dec b
    jr nz, jr_001_52fc

    ld hl, $d12c
    ld d, h
    ld e, l
    ld h, $99
    ld l, $2c
    ld c, $04

jr_001_5310:
    ld b, $02
    push de
    push hl

jr_001_5314:
    WRITE_TILE
    inc de
    dec b
    jr nz, jr_001_5314

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
    jr nz, jr_001_5310

    ld hl, $d1ec
    ld d, h
    ld e, l
    ld h, $99
    ld l, $ec
    ld b, $08

jr_001_5339:
    WRITE_TILE
    inc de
    dec b
    jr nz, jr_001_5339

    ld a, [$c5c8]
    and $f7
    ld [$c5c8], a
    ret


Call_001_534b:
    ld hl, $c5e1
    ld c, $04

Jump_001_5350:
    ld a, [hl+]
    or a
    ret z

    ld d, a
    ld e, [hl]
    push bc
    push hl
    ld hl, $3000
    add hl, de
    ld b, $98
    ld c, $00
    add hl, bc
    ld b, $0a

jr_001_5362:
    WRITE_TILE
    inc de
    dec b
    jr nz, jr_001_5362

    pop hl
    pop bc
    dec c
    inc hl
    jp nz, Jump_001_5350

    ld a, [$c5c8]
    and $ef
    ld [$c5c8], a
    ret


Call_001_537b:
    ld a, [$c5db]
    and $03
    ret nz

    ld hl, $d005
    ld d, h
    ld e, l
    ld hl, $9805
    ld b, $02
    ld a, [$c6c6]
    or a
    jp z, Jump_001_53b2

    ld c, a

jr_001_5393:
    push de
    push hl

jr_001_5395:
    WRITE_TILE                         ; Padding: preserves original byte count
    inc de
    dec b
    jr nz, jr_001_5395

    pop hl
    pop de
    push bc
    ld bc, $0020
    add hl, bc
    push hl
    ld h, d
    ld l, e
    add hl, bc
    ld d, h
    ld e, l
    pop hl
    pop bc
    dec c
    ld b, $02
    jr nz, jr_001_5393

Jump_001_53b2:
    ld b, $00
    ld a, [$c6c6]
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
    ld a, [$c6c6]
    or a
    jr nz, jr_001_53de

    ld hl, $d001
    add hl, bc
    ld d, h
    ld e, l
    ld hl, $9801
    add hl, bc
    jr jr_001_53ef

jr_001_53de:
    ld h, $ff
    ld l, $e0
    add hl, bc
    ld b, h
    ld c, l
    ld hl, $d001
    add hl, bc
    ld d, h
    ld e, l
    ld hl, $9801
    add hl, bc

jr_001_53ef:
    ld c, $05

Jump_001_53f1:
    ld b, $0a
    push de
    push hl

jr_001_53f5:
    WRITE_TILE                         ; Padding: preserves original byte count
    inc de
    dec b
    jr nz, jr_001_53f5

    pop hl
    pop de
    push bc
    ld bc, $0020
    add hl, bc
    push hl
    ld h, d
    ld l, e
    add hl, bc
    ld d, h
    ld e, l
    pop hl
    pop bc
    dec c
    jp nz, Jump_001_53f1

    ld a, [$c5c8]
    and $df
    ld [$c5c8], a
    ret


