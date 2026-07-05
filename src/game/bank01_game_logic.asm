; ============================================================================
; BANK $01 - Game Logic & Extensions
; ============================================================================
; Address: $4000-$7FFF (switchable)
;
; Primary game logic bank: piece movement, collision detection, line clearing,
; text rendering, sound function wrappers, and GBC colorization extensions.
; Frequently switched in during active gameplay.
;
; Key functions:
;   QueueTextDraw ($541a)          - Queue text for rendering (29 calls)
;   ClearObjectSubfield ($61a7)   - Zero single byte at DE+$14 (42 calls)
;   InitializeMusic ($681e)       - Set music track (24 calls)
;   UpdateSoundSequencer ($682a)  - Advance sound playback (24 calls)
;   WriteTileWithPalette           - GBC tile rendering with color
;   LoadPalettesForScreen          - Auto-detect screen and load palettes
;
; Status: ~373 bytes free (NOP area after $7E8A)
; ============================================================================
; Originally disassembled with mgbdis v3.0 by Matt Currie

SECTION "ROM Bank $001", ROMX[$4000], BANK[$1]

Call_001_4000:
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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

    ldh a, [$ff8d]
    and $08
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
    ldh a, [$ff8d]
    and $08
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
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


InitializeMusic:
    ld [$c66b], a
    ld a, $00
    ld [$c66a], a
    ld [$c66c], a
    ret


UpdateSoundSequencer:
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

; ============================================================================
; GBC COLORIZATION - bank 1 entry points (engine lives in bank $10)
; ============================================================================

; Write tile + palette attribute during HBlank (replaces the original
; "call Call_001_544a / ld [hl+],a" pattern, invoked via the WRITE_TILE
; macro from all six shadow-map renderers).
; The attribute comes from wBGAttrLUT (installed per screen by the bank10
; engine), looked up BEFORE the HBlank wait so the in-window work is only
; ~14 M-cycles (attr write on VRAM bank 1 + tile write on bank 0).
; Input: A = tile, HL = VRAM destination. Advances HL. Preserves BC, DE.
WriteTileWithPalette::
    push bc
    ld c, a
    ld b, HIGH(wBGAttrLUT)
    ld a, [bc]                  ; attribute for this tile id
    ld b, a
.wait:
    ldh a, [rSTAT]
    and $03
    jr nz, .wait
    ld a, $01                   ; --- inside mode-0 window ---
    ldh [rVBK], a
    ld [hl], b                  ; attribute -> VRAM bank 1
    xor a
    ldh [rVBK], a
    ld a, c
    ld [hl+], a                 ; tile -> VRAM bank 0
    pop bc
    ret


; Boot-time GBC init, called once from bank0 boot ($02xx) with LCD off.
; Clears the BG attribute maps (VRAM bank 1), boots the bank10 color engine
; (descriptor 0 + black CRAM), then performs the original Call_001_67f8
; behavior ($c5f0-$c5f2 = $FF, the DMG blackout the game expects at boot).
BootInitColors::
    ld a, $01
    ldh [rVBK], a
    ld hl, $9800
    ld bc, $0800
.clear:
    xor a
    ld [hl+], a
    dec bc
    ld a, b
    or c
    jr nz, .clear
    xor a
    ldh [rVBK], a

    call GBC_BootBridge         ; ROM0 bridge -> Bank10_BootInit

    ; Original Call_001_67f8 behavior
    ld a, $ff
    ld [BGP_SHADOW], a
    ld [OBP0_SHADOW], a
    ld [OBP1_SHADOW], a
    ret


; End-of-round piece cleanup (GBC fix). During the professor victory
; ($39f1) and death ($3910) sequences the piece engine keeps running:
; the active piece keeps falling and the spawner ($c0e0, states $50-$52)
; keeps dropping new pieces through the chain/gear cells at the top of
; the board while the press redraw is frozen -> visible artifacts.
; Called in place of their `ld [$c73d], a` (iso-size 3-byte patch,
; bank01 mapped at both sites): erases the active piece from the board
; buffer, kills the piece entity and stops the spawner. The next stage /
; retry re-initializes both entities.
GBC_RoundEndPieceErase::
    ld [$c73d], a               ; original instruction
    push af
    push bc
    push de
    push hl
    ld de, $c0c0                ; falling-piece entity slot
    ld hl, $0005
    add hl, de
    ld a, [hl]
    and $f8
    cp $40                      ; handler $40/$41/$42 = piece on the board
    jr nz, .no_piece
    ld [hl], $00                ; kill the piece entity
    call Call_001_6bea          ; zero its 4 cells in the board buffer
    ld a, $01
    ld [RENDER_REQUEST], a
.no_piece:
    ld hl, $c0e5                ; spawner entity ($c0e0) handler state
    ld a, [hl]
    cp $50
    jr z, .stop_spawner
    cp $51
    jr z, .stop_spawner
    cp $52
    jr nz, .done
.stop_spawner:
    ld [hl], $00
.done:
    pop hl
    pop de
    pop bc
    pop af
    ret


; ============================================================================
; GBC_QueueEntryHook: patched over the first 5 bytes of the text-queue entry
; loop at Jump_001_51dc ("push hl / push hl / ld de,$d000"). HL = queue entry
; (offset hi, offset lo, width, height). A full-screen 20x18 draw with the
; LCD on is diverted to the one-VBlank GDMA flip instead of the per-tile
; HBlank-chasing copy (the visible top-to-bottom sweep). Small text/cursor
; draws and LCD-off init draws keep the original path.
; ============================================================================
GBC_QueueEntryHook:
    ldh a, [rLCDC]
    add a                       ; LCD enable (bit 7) -> carry
    jr nc, .passthrough
    push hl
    ld a, [hl+]
    or [hl]                     ; tilemap offset must be $0000
    inc hl
    jr nz, .notfull
    ld a, [hl+]
    cp $14                      ; width 20
    jr nz, .notfull
    ld a, [hl]
    cp $12                      ; height 18
    jr nz, .notfull
    pop hl
    pop de                      ; drop the return into the copy loop
    push hl
    call GBC_PrepareGDMAFlip
    pop hl
    ld de, $0004                ; queue bookkeeping, mirrors the loop tail
    add hl, de
    ld a, [$c5da]
    dec a
    ld [$c5da], a
    jp nz, Jump_001_51dc
    ld a, [$c5c8]
    and $fb
    ld [$c5c8], a
    ret
.notfull:
    pop hl
.passthrough:
    pop de                      ; return address into the copy loop
    push hl                     ; the two replaced "push hl"
    push hl
    push de
    ld de, $d000                ; the replaced "ld de,$d000"
    ret


; ============================================================================
; GBC_PrepareGDMAFlip: builds the BG attribute mirror for the 18 visible
; tilemap rows in WRAM bank 2 (same $d000 layout as the tilemap shadow, tile
; ids translated through wBGAttrLUT), then arms wGDMARequest so the next
; VBlank flips the whole screen (tiles + attributes) in one shot.
; Interrupts are masked while SVBK=2: the VBlank ISR must always see bank 1.
; ============================================================================
GBC_PrepareGDMAFlip:
    ld hl, $d000
    ld a, 18
    ld [wGDMARowCnt], a
.row:
    ld de, wAttrRowTemp         ; snapshot one row of tile ids (bank 1)
.copy:
    ld a, [hl+]
    ld [de], a
    inc e
    ld a, e
    cp LOW(wAttrRowTemp) + 32
    jr nz, .copy
    push hl
    ld de, $ffe0
    add hl, de                  ; back to the row start (bank 2 target)
    ld de, wAttrRowTemp
    ld b, HIGH(wBGAttrLUT)
    di
    ld a, $02
    ldh [rSVBK], a
.xlat:
    ld a, [de]
    ld c, a
    ld a, [bc]                  ; tile id -> attribute
    ld [hl+], a
    inc e
    ld a, e
    cp LOW(wAttrRowTemp) + 32
    jr nz, .xlat
    ld a, $01
    ldh [rSVBK], a
    ei
    pop hl
    ld a, [wGDMARowCnt]
    dec a
    ld [wGDMARowCnt], a
    jr nz, .row
    ld a, [wGDMARequest]
    or $01
    ld [wGDMARequest], a
    ret

    ds $8000 - @, 0
