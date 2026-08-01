; ============================================================================
; bank00/04_render.asm — $1971-$1c56: render helpers, ClearSpriteBuffer ($1b0f), RenderTilemapCell ($1b27)
; Part of SECTION "ROM Bank $000"; included in order by bank00_core_engine.asm.
; ============================================================================
ASSERT @ == $1971 ; pinned: callers use the original address
Call_000_1971:
    ld c, $00
    ld a, $20
    ldh [c], a
    ldh a, [c]
    ldh a, [c]
    ldh a, [c]
    ld b, a
    ld a, $10
    ldh [c], a
    ld a, b
    and $0f
    swap a
    ld b, a
    ldh a, [c]
    ldh a, [c]
    ldh a, [c]
    ldh a, [c]
    ldh a, [c]
    ldh a, [c]
    ldh a, [c]
    ldh a, [c]
    ldh a, [c]
    ldh a, [c]
    ldh a, [c]
    ldh a, [c]
    ldh a, [c]
    ldh a, [c]
    and $0f
    or b
    cpl
    ld b, a
    ld a, $30
    ldh [c], a
    ldh a, [$ff8c]
    xor b
    and b
    ldh [$ff8d], a
    ld a, b
    ldh [$ff8c], a
    ret


Call_000_19a3:
    ld c, $80
    ld b, $0a
    ld hl, $19b1

jr_000_19aa:
    ld a, [hl+]
    ldh [c], a
    inc c
    dec b
    jr nz, jr_000_19aa

    ret


    ld a, $c0
    ldh [rDMA], a
    ld a, $28

jr_000_19b7:
    dec a
    jr nz, jr_000_19b7

    ret


Call_000_19bb:
    ldh a, [$ff8e]
    sub $10
    srl a
    srl a
    srl a
    ld de, $0000
    ld e, a
    ld hl, $9800
    ld b, $20

jr_000_19ce:
    add hl, de
    dec b
    jr nz, jr_000_19ce

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


    ldh a, [$ff90]
    ld d, a
    ldh a, [$ff91]
    ld e, a
    ld b, $04

jr_000_19f0:
    rr d
    rr e
    dec b
    jr nz, jr_000_19f0

    ld a, e
    sub $84
    and $fe
    rlca
    rlca
    add $08
    ldh [$ff8e], a
    ldh a, [$ff91]
    and $1f
    rla
    rla
    rla
    add $08
    ldh [$ff8f], a
    ret


    add a
    pop hl
    ld e, a
    ld d, $00
    add hl, de
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    pop hl
    jp hl


Call_000_1a1a:
Jump_000_1a1a:
    ldh a, [rIE]
    ldh [$ff93], a
    res 0, a

jr_000_1a20:
    ldh a, [rLY]
    cp $91
    jr nz, jr_000_1a20

    ldh a, [rLCDC]
    and $7f
    ldh [rLCDC], a
    ldh a, [$ff93]
    ldh [rIE], a
    ret


    ldh a, [rLCDC]
    or $80
    ldh [rLCDC], a
    ret


jr_000_1a38:
    ld a, $00
    ld [hl+], a
    dec bc
    ld a, c
    or b
    jr nz, jr_000_1a38

    ret


Call_000_1a41:
    ld hl, $9bff
    ld bc, $0400

jr_000_1a47:
    ld a, $00
    ld [hl-], a
    dec bc
    ld a, b
    or c
    jr nz, jr_000_1a47

    ret


Call_000_1a50:
jr_000_1a50:
    ld a, [hl+]
    call Call_000_20da
    ld [de], a
    inc de
    dec bc
    ld a, b
    or c
    jr nz, jr_000_1a50

    ret


Call_000_1a5c:
    ld a, [RENDER_REQUEST]
    or a
    ret z

    ld a, $0b
    rst $10
    ld a, $19
    ld [$c5a0], a
    ld hl, $c0a0
    ld bc, $c000

jr_000_1a6f:
    ld a, [hl]
    and $01
    call nz, Call_000_1a91
    ld d, $00
    ld e, $20
    add hl, de
    ld a, [$c5a0]
    dec a
    ld [$c5a0], a
    jr nz, jr_000_1a6f

jr_000_1a83:
    ld a, c
    cp $a0
    jr z, jr_000_1a8d

    xor a
    ld [bc], a
    inc bc
    jr jr_000_1a83

jr_000_1a8d:
    ld a, $01
    rst $18
    ret


Call_000_1a91:
    push hl
    ld de, $0004

Jump_000_1a95:
    add hl, de
    ld a, [hl]
    ld d, $00
    ld e, a
    sla e
    rl d
    ld hl, $4000
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [hl+]
    ld d, h
    ld e, l
    pop hl

Jump_000_1aa9:
    push af
    push hl
    push de
    ld de, $0003
    add hl, de
    ld a, [hl]
    pop de
    push bc
    ld b, a
    ld a, [de]
    add b
    pop bc
    ld [bc], a
    inc bc
    inc de
    pop hl
    push hl
    push de
    ld de, $0002
    add hl, de
    ld a, [hl]
    pop de
    push bc
    ld b, a
    ld a, [de]
    add b
    pop bc
    ld [bc], a
    inc bc
    inc de
    pop hl
    ld a, [de]
    ld [bc], a
    inc bc
    inc de
    ld a, [de]
    or a
    jr nz, jr_000_1ae5

    push hl
    push de
    ld de, $0000
    add hl, de
    ld a, [hl]
    and $f0
    ld [bc], a
    pop de
    inc bc
    inc de
    inc de
    pop hl
    jr jr_000_1aee

jr_000_1ae5:
    push hl
    inc de
    ld a, [de]
    and $f0
    ld [bc], a
    inc bc
    inc de
    pop hl

jr_000_1aee:
    pop af
    dec a
    jp nz, Jump_000_1aa9

    ret


Call_000_1af4:
    ld b, $a0
    ld a, $00
    ld hl, $c000

jr_000_1afb:
    ld [hl+], a
    dec b
    jr nz, jr_000_1afb

    ret


Call_000_1b00:
    ld bc, $1f60
    ld hl, $c0a0

jr_000_1b06:
    ld a, $00
    ld [hl+], a
    dec bc
    ld a, b
    or c
    jr nz, jr_000_1b06

    ret


ClearSpriteBuffer:
    ld a, $01
    ld [RENDER_REQUEST], a
    ld bc, $0320
    ld hl, $c0a0

jr_000_1b1a:
    xor a
    ld [hl+], a
    dec bc
    ld a, b
    or c
    jr nz, jr_000_1b1a

    ld a, $01
    ld [RENDER_REQUEST], a
    ret


RenderTilemapCell:
    call GBC_MapHook            ; was: ld a,$08 / rst $10 (3 bytes; hook redoes it)
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
    ld hl, $4000
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
    jp z, Jump_000_1c52

    and $03
    jr z, jr_000_1b78

    dec a
    jr z, jr_000_1b99

    dec a
    jp z, Jump_000_1bf9

    jp Jump_000_1c25


jr_000_1b78:
    inc de
    ld a, [de]
    cp $ff
    jp z, Jump_000_1c52

    cp $fe
    jr z, jr_000_1b8a

    cp $fd
    jr z, jr_000_1b96

    ld [hl+], a
    jr jr_000_1b78

jr_000_1b8a:
    push de
    ld de, $0020
    ld h, b
    ld l, c
    add hl, de
    ld b, h
    ld c, l
    pop de
    jr jr_000_1b78

jr_000_1b96:
    inc hl
    jr jr_000_1b78

Jump_000_1b99:
jr_000_1b99:
    inc de
    ld a, [de]
    cp $ff
    jp z, Jump_000_1c52

    ld a, [de]
    and $c0
    cp $c0
    jp z, Jump_000_1be6

    cp $80
    jp z, Jump_000_1bd3

    cp $40
    jp z, Jump_000_1bc1

    push bc
    ld a, [de]
    inc a
    ld b, a

Jump_000_1bb6:
    inc de
    ld a, [de]
    ld [hl+], a
    dec b
    jp nz, Jump_000_1bb6

    pop bc
    jp Jump_000_1b99


Jump_000_1bc1:
    push bc
    ld a, [de]
    and $3f
    add $02
    ld b, a
    inc de
    ld a, [de]

Jump_000_1bca:
    ld [hl+], a
    dec b
    jp nz, Jump_000_1bca

    pop bc
    jp Jump_000_1b99


Jump_000_1bd3:
    push bc
    ld a, [de]
    and $3f
    add $02
    ld b, a
    inc de
    ld a, [de]

Jump_000_1bdc:
    ld [hl+], a
    inc a
    dec b
    jp nz, Jump_000_1bdc

    pop bc
    jp Jump_000_1b99


Jump_000_1be6:
    push bc
    ld a, [de]
    and $3f
    add $02
    ld b, a
    inc de
    ld a, [de]

Jump_000_1bef:
    ld [hl+], a
    dec a
    dec b
    jp nz, Jump_000_1bef

    pop bc
    jp Jump_000_1b99


Jump_000_1bf9:
    inc de
    ld a, [de]
    cp $ff
    jp z, Jump_000_1c52

    cp $fe
    jr z, jr_000_1c14

    cp $fd
    jr z, jr_000_1c21

    push bc
    ld b, a
    inc de
    ld a, [de]

jr_000_1c0c:
    ld [hl+], a
    dec b
    jr nz, jr_000_1c0c

    pop bc
    jp Jump_000_1bf9


jr_000_1c14:
    push de
    ld de, $0020
    ld h, b
    ld l, c
    add hl, de
    ld b, h

Call_000_1c1c:
    ld c, l
    pop de
    jp Jump_000_1bf9


jr_000_1c21:
    inc hl
    jp Jump_000_1bf9


Jump_000_1c25:
jr_000_1c25:
    inc de
    ld a, [de]
    cp $ff
    jp z, Jump_000_1c52

    cp $fe
    jr z, jr_000_1c45

    cp $fd
    jr z, jr_000_1c4a

    push bc
    ld b, a
    inc de
    ld a, [de]

jr_000_1c38:
    ld [hl], a
    push de
    ld de, $0020
    add hl, de
    pop de
    dec b
    jr nz, jr_000_1c38

    pop bc
    jr jr_000_1c25

jr_000_1c45:
    inc bc
    ld h, b
    ld l, c
    jr jr_000_1c25

jr_000_1c4a:
    push de
    ld de, $0020
    add hl, de
    pop de
    jr jr_000_1c25

Jump_000_1c52:
    jp GBC_MapRemapRet          ; was: ld a,$01 / rst $18 / ret (4 bytes; the
    db $00                      ; hook applies map remaps then redoes them)


