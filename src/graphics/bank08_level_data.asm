; ============================================================================
; BANK $08 - Level Data
; ============================================================================
; Address: $4000-$7FFF (switchable)
;
; Level layout data, graphics assets, and associated jump tables.
; Primarily binary data with pointer tables at the start.
;
; ============================================================================
; Originally disassembled with mgbdis v3.0 by Matt Currie

SECTION "ROM Bank $008", ROMX[$4000], BANK[$8]

    ld d, b
    ld b, c
    ld d, b
    ld b, c
    ld e, l
    ld b, c
    ld h, c
    ld b, c
    ld l, l
    ld b, c
    ld [hl], b
    ld b, c
    ld [hl], h
    ld b, c
    ld a, b
    ld b, c
    ld a, b
    ld b, c
    add e
    ld b, c
    adc [hl]
    ld b, c
    sbc c
    ld b, c
    and h
    ld b, c
    pop bc
    ld b, c
    adc $41
    sub h
    ld b, d
    push hl
    ld b, d
    rst $28
    ld b, d
    ld sp, hl
    ld b, d
    inc bc
    ld b, e
    dec c
    ld b, e
    rla
    ld b, e
    ld c, [hl]
    ld b, e
    ld d, c
    ld b, e
    ld d, h
    ld b, e
    ld d, a
    ld b, e
    ld e, d
    ld b, e
    ld e, l
    ld b, e
    ld h, b
    ld b, e
    ld h, e
    ld b, e
    ld h, [hl]
    ld b, e
    ld l, c
    ld b, e
    ld l, h
    ld b, e
    ld de, $2444
    ld b, l
    rrca
    ld b, [hl]
    ld l, b
    ld b, a
    adc h
    ld c, b
    or e
    ld c, c
    cp a
    ld c, d
    inc de
    ld c, h
    bit 1, h
    pop de
    ld c, l
    ld d, b
    ld c, [hl]
    adc b
    ld c, [hl]
    ld b, a
    ld c, a
    rlca
    ld d, b
    jr nc, @+$53

    sub h
    ld d, c
    nop
    ld d, d
    adc [hl]
    ld d, d
    add hl, de
    ld d, e
    sub b
    ld d, e
    ld l, e
    ld d, h
    ldh a, [rHDMA4]
    ld [hl], e
    ld d, l
    add e
    ld d, [hl]
    ld c, $57
    adc c
    ld d, a
    rlca
    ld e, b
    add e
    ld e, b
    or $58
    ld [hl], b
    ld e, c
    push bc
    ld e, d
    db $db
    ld e, d
    ld hl, sp+$5a
    dec d
    ld e, e
    ld [hl-], a
    ld e, e
    ccf
    ld e, e
    rlca
    ld e, h
    xor c
    ld e, h
    ldh [$ff5c], a
    inc d
    ld e, l
    jr nz, jr_008_40f1

    inc l
    ld e, l
    jr c, jr_008_40f5

    ld b, h
    ld e, l
    ld d, b
    ld e, l
    halt
    ld e, l
    db $dd
    ld e, l
    or $5e
    cp $5e
    ld b, $5f
    ld c, $5f
    ld d, $5f
    ld e, $5f
    ld h, $5f
    ld l, $5f
    ld [hl], $5f
    ld a, $5f
    ld b, [hl]
    ld e, a
    ld c, e
    ld e, a
    ld d, b
    ld e, a
    sub c
    ld h, b
    cp c
    ld h, b
    cp c
    ld h, b
    cp c
    ld h, b
    rst $08
    ld h, b
    call nc, $d960
    ld h, b
    sbc $60
    db $e3
    ld h, b
    add sp, $60
    db $ed
    ld h, b
    ldh a, [c]
    ld h, b
    rst $30
    ld h, b
    db $fc
    ld h, b
    ld bc, $0161
    ld h, c
    ld bc, $0161
    ld h, c
    ld bc, $0161
    ld h, c
    ld b, l
    ld h, c
    ld l, b
    ld h, c
    ld l, a
    ld h, c
    halt
    ld h, c
    ld a, l
    ld h, c
    add h
    ld h, c
    sbc l
    ld h, c
    xor b

jr_008_40f1:
    ld h, c
    xor a
    ld h, c
    cp c

jr_008_40f5:
    ld h, c
    add $61
    db $e3
    ld h, c
    ldh a, [$ff61]
    ldh a, [$ff61]
    ldh a, [$ff61]
    ldh a, [$ff61]
    db $fd
    ld h, c
    ld [bc], a
    ld h, d
    rlca
    ld h, d
    inc c
    ld h, d
    ld de, $1662
    ld h, d
    dec de
    ld h, d
    jr nz, jr_008_4174

    dec h
    ld h, d
    ld a, [hl+]
    ld h, d
    cpl
    ld h, d
    ld a, $62
    ld a, $62
    ld a, $62
    ld a, $62
    ld a, $62
    rst $10
    ld h, d
    ld [hl], b
    ld h, e
    ld de, $aa64
    ld h, h
    ld b, e
    ld h, l
    call c, Call_008_7565
    ld h, [hl]
    ld c, $67
    and a
    ld h, a
    ld b, b
    ld l, b
    reti


    ld l, b
    db $db
    ld l, b
    db $db
    ld l, b
    db $db
    ld l, b
    db $db
    ld l, b
    db $db
    ld l, b
    rst $20
    ld l, b
    di
    ld l, b
    rst $38
    ld l, b
    dec bc
    ld l, c
    rla
    ld l, c
    inc hl
    ld l, c
    inc hl
    ld l, c
    nop
    sbc d
    sbc h
    adc a
    sbc l
    sbc l
    nop
    sbc l
    sbc [hl]
    adc e
    sbc h
    sbc [hl]
    rst $38
    ld [bc], a
    dec bc
    nop
    rst $38
    nop
    sub c
    adc e
    sub a
    adc a
    cp $99
    and b
    adc a
    sbc h
    cp $ff
    nop
    db $f4
    rst $38
    ld [bc], a
    inc d
    nop
    rst $38

jr_008_4174:
    inc bc
    ld [$ff00], sp
    nop
    add b
    add b
    adc a
    adc e
    sbc l
    and e
    add b
    add b
    add b
    rst $38
    nop
    add b
    sbc b
    sbc c
    sbc h
    sub a
    adc e
    sub [hl]
    add b
    add b
    rst $38
    nop
    add b
    add b
    sub d
    adc e
    sbc h
    adc [hl]
    add b
    add b
    add b
    rst $38
    nop
    and b
    adc a
    sbc h
    and e
    add b
    sub d
    adc e
    sbc h
    adc [hl]
    rst $38
    nop
    cp h
    cp l
    cp l
    cp l
    cp l
    cp [hl]
    cp $bf
    sbc [hl]
    adc a
    sbc l
    sbc [hl]
    ret nz

    cp $bf
    sbc d
    sub [hl]
    adc e
    and e
    ret nz

    cp $c1
    jp nz, $c2c2

    jp nz, $ffc3

    ld [bc], a
    inc b
    nop
    cp $04
    nop
    cp $04
    nop
    cp $04
    nop
    rst $38
    ld bc, $b180
    ld c, a
    or d
    nop
    or e
    ld c, d
    nop
    nop
    or h
    ld d, b
    add b
    nop
    cp e
    ld c, d
    nop
    nop
    or h
    ld d, b
    add b
    nop
    cp e
    ld c, d
    nop
    nop
    or h
    ld d, b
    add b
    nop
    cp e
    ld c, d
    nop
    nop
    or h
    ld d, b
    add b
    nop
    cp e
    ld c, d
    nop
    nop
    or h
    ld d, b
    add b
    nop
    cp e
    ld c, d
    nop
    ld bc, $80b4
    add b
    or l
    ld c, e
    or [hl]
    ld [bc], a
    ld hl, sp-$80
    cp e
    ld c, d
    nop
    ld [bc], a
    or h
    add b
    cp h
    ld c, h
    add b
    ld [bc], a
    rst $10
    add b
    cp e
    ld c, d
    nop
    ld c, $b4
    add b
    cp h
    add b
    adc a
    sbc h
    adc e
    sbc l
    adc a
    add b
    adc [hl]
    adc e
    sbc [hl]
    adc e
    rst $30
    ld b, b
    add b
    ld [bc], a
    rst $10
    add b
    cp e
    ld c, d
    nop
    ld [bc], a
    or h
    add b
    cp h
    ld c, h
    add b
    ld [bc], a
    rst $10
    add b
    cp e
    ld c, d
    nop
    ld [bc], a
    or h
    add b
    cp h
    ld b, c
    add b
    ld [bc], a
    and e
    adc a
    sbc l
    ld b, c
    add b
    add b
    sbc b
    ld b, c
    add b
    ld [bc], a
    rst $10
    add b
    cp e
    ld c, d
    nop
    ld [bc], a
    or h
    add b
    cp h
    ld c, h
    add b
    ld [bc], a
    rst $10
    add b
    cp e
    ld c, d
    nop
    ld bc, $80b4
    add b
    adc $4b
    rst $08
    ld [bc], a
    ld sp, hl
    add b
    cp e
    ld c, d
    nop
    nop
    or h
    ld d, b
    add b
    nop
    cp e
    ld c, d
    nop
    nop
    or h
    ld d, b
    add b
    nop
    cp e
    ld c, d
    nop
    nop
    or h
    ld d, b
    add b
    nop
    cp e
    ld c, d
    nop
    nop
    or h
    ld d, b
    add b
    nop
    cp e
    ld c, d
    nop
    add b
    add sp, $4f
    jp hl


    nop
    ld [$004a], a
    rst $38
    ld bc, $007f
    ld a, a
    nop
    ld a, l
    nop
    add b
    ld b, b
    ld c, l
    ld b, c
    nop
    ld b, d
    ld c, h
    nop
    inc c
    ld b, e
    adc [hl]
    adc e
    sbc [hl]
    adc e
    nop
    sbc a
    sbc b
    adc e
    and b
    adc e
    sub e
    sub [hl]
    add b
    adc e
    ld [bc], a
    sub [hl]
    adc a
    ld b, h
    ld c, h
    nop
    nop
    ld b, e
    ld c, [hl]
    nop
    nop
    ld b, h
    ld c, h
    nop
    dec c
    ld b, e
    adc l
    sub [hl]
    adc a
    adc e
    sbc h
    sub e
    sbc b
    sub c
    nop
    adc [hl]
    adc e
    sbc [hl]
    adc e
    ld b, c
    nop
    nop
    ld b, h
    ld c, h
    nop
    add b
    ld h, a
    ld c, l
    ld l, b
    nop
    ld l, c
    ld a, a
    nop
    ld a, a
    nop
    ld a, a
    nop
    ld l, b
    nop
    rst $38
    nop
    and l
    and [hl]
    and a
    xor b
    xor c
    xor d
    xor e
    xor h
    rst $38
    nop
    xor a
    sbc d
    sbc a
    and h
    and h
    sub [hl]
    adc a
    xor a
    rst $38
    nop
    xor a
    xor a

jr_008_42fc:
    xor a
    and b
    sbc l
    xor a
    xor a
    xor a
    rst $38
    nop
    xor a
    xor a
    adc a
    adc [hl]
    sub e
    sbc [hl]
    xor a
    xor a
    rst $38
    nop
    xor a
    sbc c
    sbc d
    sbc [hl]
    sub e
    sbc c
    sbc b
    xor a
    rst $38
    ld [bc], a
    inc d
    nop
    cp $14
    nop
    cp $14
    nop
    cp $14
    nop
    cp $14
    nop
    cp $14
    nop
    cp $14
    nop
    cp $14
    nop
    cp $14
    nop
    cp $14
    nop
    cp $14
    nop
    cp $14
    nop
    cp $14
    nop
    cp $14
    nop
    cp $14
    nop
    cp $14
    nop
    cp $14
    nop
    cp $14
    nop
    rst $38
    nop
    db $eb
    rst $38
    nop
    add b
    rst $38
    nop
    add d
    rst $38
    nop
    add h
    rst $38
    nop
    add [hl]
    rst $38
    nop
    adc b
    rst $38
    nop
    adc e
    rst $38
    nop
    adc h
    rst $38
    nop
    xor [hl]
    rst $38
    nop
    call c, $01ff
    ld h, c
    nop
    adc d
    ld bc, $0052
    adc d
    dec c
    ld d, d
    nop
    add a
    add hl, de
    nop
    jr nz, jr_008_42fc

    ld [hl+], a
    ld c, a
    nop
    add b
    inc h
    ld b, e
    dec h
    add e
    ld h, $00
    nop
    add e
    dec hl
    ld bc, $3024
    ld c, d
    nop
    add b
    ld sp, $3243
    adc e
    inc sp
    ld e, e
    nop
    add b
    ldh a, [c]
    ld c, e
    nop
    add b
    ld b, b
    ld c, a
    ld b, c
    nop
    ld b, d
    ld c, d
    nop
    nop
    ld b, e
    ld c, b
    nop
    add e
    ld b, l
    ld b, c
    nop
    nop
    ld b, h
    ld c, d
    nop
    nop
    ld b, e
    ld b, d
    nop
    add c
    ld c, d
    ld b, c
    nop
    add d
    ld c, l
    ld b, d
    nop
    nop
    ld b, h
    ld c, d
    nop
    nop
    ld b, e
    ld b, d
    nop
    add d
    ld d, c
    ld b, c
    nop
    add c
    ld d, l
    ld b, d
    nop
    nop
    ld b, h
    ld c, d
    nop
    nop
    ld b, e
    ld b, d
    nop
    add d
    ld e, b
    ld b, c
    nop
    add c
    ld e, h
    ld b, d
    nop
    nop
    ld b, h
    ld c, d
    nop
    nop
    ld b, e
    ld b, d
    ld e, a
    add d
    ld h, b
    ld b, c
    ld e, a
    add c
    ld h, h
    ld b, d
    ld e, a
    nop
    ld b, h
    ld c, d
    nop
    add b
    ld h, a
    ld c, a
    ld l, b
    nop
    ld l, c
    ld a, a
    nop
    ld c, c
    nop
    dec b
    sub [hl]
    sub e
    adc l
    adc a
    sbc b
    sbc l
    ret nz

    adc a
    dec bc
    nop
    sbc [hl]
    sbc c
    nop
    sbc b
    sub e
    sbc b
    sbc [hl]
    adc a
    sbc b
    adc [hl]
    sbc c
    ld l, d
    nop
    rst $38
    ld bc, $b180
    ld c, a
    or d
    nop
    or e
    ld c, d
    or b
    nop
    or h
    ld b, c
    or b
    add b
    or l
    ld b, a
    or [hl]
    add e
    or a
    ld c, d
    or b
    nop
    or h
    ld b, c
    or b
    add d
    cp h
    nop
    cp [hl]
    add b
    ret nz

    ld b, d
    or b
    add d
    jp nz, $bb00

    ld c, d
    or b
    nop
    or h
    ld b, c
    or b
    nop
    cp h
    add b
    add $40
    rst $00
    add b
    ret z

    ld bc, $9997
    add b
    adc [hl]
    add d
    jp z, $bb00

    ld c, d
    or b
    nop
    or h
    ld b, c
    or b
    add b
    adc $47
    rst $08
    add d
    ret nc

    nop
    cp e
    ld c, d
    or b
    nop
    or h
    ld b, b
    or b
    add b
    or l
    ld c, b
    or [hl]
    add c
    call nc, $b001
    cp e
    ld c, d
    or b
    nop
    or h
    ld b, b
    or b
    nop
    cp h
    adc d
    nop
    nop
    rst $10
    ld b, b
    or b
    nop
    cp e
    ld c, d
    or b
    nop
    or h
    ld b, b
    or b
    nop
    cp h
    adc d
    inc c
    nop
    rst $10
    ld b, b
    or b
    nop
    cp e
    ld c, d
    or b
    inc bc
    or h
    or b
    ret c

    cp h
    adc d
    jr jr_008_4497

    rst $10
    reti


    or b

jr_008_4497:
    cp e
    ld c, d
    or b
    inc bc
    or h
    or b
    jp c, $8abc

    inc h
    inc bc
    rst $10
    db $db
    or b
    cp e
    ld c, d
    or b
    inc bc
    or h
    or b
    call c, $8abc
    jr nc, jr_008_44b3

    rst $10
    db $dd
    or b

jr_008_44b3:
    cp e
    ld c, d
    or b
    nop
    or h
    ld b, b
    or b
    nop
    cp h
    adc d
    inc a
    nop
    rst $10
    ld b, b
    or b
    nop
    cp e
    ld c, d
    or b
    nop
    or h
    ld b, b
    or b
    nop
    cp h
    adc d
    ld c, b
    nop
    rst $10
    ld b, b
    or b
    nop
    cp e
    ld c, d
    or b
    nop
    or h
    ld b, b
    or b
    add b
    adc $49
    rst $08
    nop
    ret nc

    ld b, b
    or b
    nop
    cp e
    ld c, d
    or b
    nop
    or h
    add c
    sbc $00
    or b
    add b
    or l
    ld b, l
    or [hl]
    nop
    pop hl
    ld b, d
    or b
    nop
    cp e
    ld c, d
    or b
    nop
    or h
    add c
    ldh [c], a
    ld bc, $bcb0
    ld b, [hl]
    or b
    nop
    rst $10
    ld b, d
    or b
    nop
    cp e
    ld c, d
    or b
    nop
    or h
    add c
    push hl
    nop
    or b
    add b
    adc $45
    rst $08
    nop
    ret nc

    ld b, d
    or b
    nop
    cp e
    ld c, d
    or b
    add b
    add sp, $4f
    jp hl


    nop
    ld [$b04a], a
    rst $38
    ld bc, $01c0
    ld b, a
    nop
    add c
    ld bc, $0341
    nop
    inc b
    ld c, h
    nop
    ret nz

    ld bc, $0047
    ld bc, $0501
    ld b, d
    nop
    nop
    ld b, $4c
    nop
    ret nz

    ld bc, $0047
    ld bc, $0501
    ld b, d
    nop
    nop
    rlca
    add b
    inc bc
    ld c, d
    nop
    ret nz

    ld bc, $0047
    ld bc, $0501
    ld b, h
    nop
    nop
    ld b, $4a
    nop
    ret nz

    ld bc, $0047
    ld bc, $0501
    ld b, h
    nop
    nop
    ld b, $4a
    nop
    ret nz

    ld bc, $0047
    nop
    ld bc, $0880
    ld b, e
    add hl, bc
    nop
    ld a, [bc]
    ld c, d
    nop
    ret nz

    ld bc, $0047
    add b
    ld bc, $9d04
    adc l
    sbc c
    sbc h
    adc a
    add b
    inc bc
    ld c, d
    nop
    ret nz

    ld bc, $0047
    ld bc, $0501
    ld b, h
    nop
    nop
    ld b, $4a
    nop
    ret nz

    ld bc, $0047
    nop
    ld bc, $0880
    ld b, e
    add hl, bc
    nop
    ld a, [bc]
    ld c, d
    nop
    ret nz

    ld bc, $0047
    add b
    ld bc, $9604
    adc a
    and b
    adc a
    sub [hl]
    add b
    inc bc
    ld c, d
    nop
    ret nz

    ld bc, $0047
    ld bc, $0501
    ld b, h
    nop
    nop
    ld b, $4a
    nop
    ret nz

    ld bc, $0047
    nop
    ld bc, $0880
    ld b, e
    add hl, bc
    nop
    ld a, [bc]
    ld c, d
    nop
    ret nz

    ld bc, $0047
    add b
    ld bc, $9604
    sub e
    sbc b
    adc a
    sbc l
    add b
    inc bc
    ld c, d
    nop
    ret nz

    ld bc, $0047
    ld bc, $0501
    ld b, h
    nop
    nop
    ld b, $4a
    nop
    ret nz

    ld bc, $0047
    nop
    ld bc, $0880
    ld b, e
    add hl, bc
    nop
    ld a, [bc]
    ld c, d
    nop
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $0051
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $0051
    nop
    ld bc, $0b48
    ret nz

    ld bc, $0051
    rst $38
    ld bc, $01c0
    ld b, a
    nop
    add c
    ld bc, $0341
    nop
    inc b
    ld c, h
    nop
    ret nz

    ld bc, $0047
    ld bc, $0501
    ld b, d
    nop
    nop
    ld b, $4c
    nop
    ret nz

    ld bc, $0047
    ld bc, $0501
    ld b, d
    nop
    nop
    rlca
    add b
    inc bc
    ld c, d
    nop
    ret nz

    ld bc, $0047
    ld bc, $0501
    ld b, h
    nop
    nop
    ld b, $4a
    nop
    ret nz

    ld bc, $0047
    ld bc, $0501
    ld b, h
    nop
    nop
    ld b, $4a
    nop
    ret nz

    ld bc, $0047
    nop
    ld bc, $0880
    ld b, e
    add hl, bc
    nop
    ld a, [bc]
    ld c, d
    nop
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $0051
    ret nz

    ld bc, $0047
    ld b, $01
    inc bc
    sbc l
    adc l
    sbc c
    sbc h
    adc a
    ld b, b
    inc bc
    ld c, d
    nop
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $0051
    ret nz

    ld bc, $0047
    nop
    ld bc, $0946
    ld c, d
    nop
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $0051
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $8c01
    adc a
    add b
    sbc l
    ld c, l
    nop
    ret nz

    ld bc, $0047
    add c
    ld bc, $9e03
    sub e
    sub a
    adc a
    add b
    inc bc
    ld c, d
    nop
    ret nz

    ld bc, $0047
    ld bc, $0501
    ld b, h
    nop
    nop
    ld b, $4a
    nop
    ret nz

    ld bc, $0047
    nop
    ld bc, $0880
    ld b, e
    add hl, bc
    nop
    ld a, [bc]
    ld c, d
    nop
    ret nz

    ld bc, $0047
    add c
    ld bc, $9e03
    sub e
    sub a
    adc a
    add b
    inc bc
    ld c, d
    nop
    ret nz

    ld bc, $0047
    ld bc, $0501
    ld b, h
    nop
    nop
    ld b, $4a
    nop
    nop
    ld bc, $0b41
    add d
    inc c
    ld b, c
    dec bc
    nop
    ld bc, $0880
    ld b, e
    add hl, bc
    nop
    ld a, [bc]
    ld c, d
    nop
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $0051
    ret nz

    ld bc, $0040
    add b
    ld [bc], a
    ld bc, $1003
    ld b, c
    nop
    add c
    ld bc, $0343
    nop
    inc b
    ld c, d
    nop
    ret nz

    ld bc, $0040
    nop
    dec b
    add c
    ld de, $0041
    ld bc, $0501
    add b
    sbc l
    inc b
    adc e
    sub c
    adc a
    nop
    ld b, $4a
    nop
    ret nz

    ld bc, $0040
    nop
    dec b
    add b
    inc d
    nop
    inc de
    ld b, c
    nop
    ld [$0501], sp
    nop
    adc l
    sub [hl]
    adc a
    adc e
    sbc h
    ld b, $4a
    nop
    ret nz

    ld bc, $0040
    nop
    dec b
    add b
    inc d
    nop
    inc de
    ld b, c
    nop
    nop
    ld bc, $0880
    ld b, e
    add hl, bc
    nop
    ld a, [bc]
    ld c, d
    nop
    nop
    ld bc, $0b48
    ret nz

    ld bc, $007f
    ld a, a
    nop
    ld a, a
    nop
    ld a, a
    nop
    ld c, l
    nop
    rst $38
    ld bc, $0280
    ld c, a
    inc bc
    nop
    inc b
    ld c, d
    nop
    nop
    dec b
    ld b, c
    nop
    add b
    ld [bc], a
    ld b, a
    inc bc
    nop
    inc b
    ld b, c
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, c
    nop
    ld [bc], a
    dec b
    xor c
    xor e
    ld b, b
    xor l
    ld bc, $b1af
    ld b, d
    nop
    nop
    ld b, $41
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, c
    nop
    ld [bc], a
    dec b
    xor d
    xor h
    ld b, b
    xor [hl]
    inc bc
    or b
    or d
    sub a
    sbc c
    add b
    adc [hl]
    nop
    ld b, $41
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, c
    nop
    add b
    ld [$0947], sp
    nop
    ld a, [bc]
    ld b, c
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, e
    nop
    add b
    ld [bc], a
    ld b, e
    inc bc
    nop
    inc b
    ld b, e
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, e
    nop
    rlca
    dec b
    sbc l
    adc a
    sub [hl]
    adc a
    adc l
    sbc [hl]
    ld b, $43
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, e
    nop
    add b
    ld [$0943], sp
    nop
    ld a, [bc]
    ld b, e
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, c
    nop
    add b
    ld [bc], a
    ld b, a
    inc bc
    nop
    inc b
    ld b, c
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, c
    nop
    nop
    dec b
    ld c, b
    nop
    nop
    ld b, $41
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, c
    nop
    dec bc
    dec b
    nop
    sbc b
    adc a
    and c
    nop
    sub c
    adc e
    sub a
    adc a
    nop
    ld b, $41
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, c
    nop
    nop
    dec b
    ld c, b
    nop
    nop
    ld b, $41
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, c
    nop
    ld [bc], a
    dec b
    nop
    adc l
    ret nz

    sbc c
    ld b, $9e
    sub e
    sbc b
    sbc a
    adc a
    nop
    ld b, $41
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, c
    nop
    nop
    dec b
    ld c, b
    nop
    nop
    ld b, $41
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, c
    nop
    add b
    ld [$0947], sp
    nop
    ld a, [bc]
    ld b, c
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld d, b
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld d, b
    nop
    nop
    ld b, $4a
    nop
    add b
    ld [$094f], sp
    nop
    ld a, [bc]
    ld c, d
    nop
    rst $38
    ld bc, $0280
    ld c, a
    inc bc
    nop
    inc b
    ld c, d
    nop
    nop
    dec b
    ld b, c
    nop
    add b
    ld [bc], a
    ld b, a
    inc bc
    nop
    inc b
    ld b, c
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, c
    nop
    ld [bc], a
    dec b
    xor c
    xor e
    ld b, b
    xor l
    ld bc, $b1af
    ld b, d
    nop
    nop
    ld b, $41
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, c
    nop
    ld [bc], a
    dec b
    xor d
    xor h
    ld b, b
    xor [hl]
    inc bc
    or b
    or d
    sub a
    sbc c
    add b
    adc [hl]
    nop
    ld b, $41
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, c
    nop
    add b
    ld [$0947], sp
    nop
    ld a, [bc]
    ld b, c
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, d
    nop
    add b
    ld [bc], a
    ld b, l
    inc bc
    nop
    inc b
    ld b, d
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, d
    nop
    add hl, bc
    dec b
    sbc b
    adc a
    and c
    nop
    sub c
    adc e
    sub a
    adc a
    ld b, $42
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, d
    nop
    add b
    ld [$0945], sp
    nop
    ld a, [bc]
    ld b, d
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, b
    nop
    add b
    ld [bc], a
    ld c, c
    inc bc
    nop
    inc b
    ld b, b
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, b
    nop
    nop
    dec b
    ld c, d
    nop
    nop
    ld b, $40
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, b
    nop
    nop
    dec b
    ld c, d
    nop
    nop
    ld b, $40
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, b
    nop
    nop
    dec b
    ld b, c
    nop
    add b
    sbc l
    ld [bc], a
    adc e
    sub c
    adc a
    ld b, d
    nop
    nop
    ld b, $40
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, b
    nop
    add b
    ld [$0949], sp
    nop
    ld a, [bc]
    ld b, b
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, c
    nop
    ld a, [bc]
    adc a
    sbc h
    adc e
    sbc l
    adc a
    nop
    adc [hl]
    adc e
    sbc [hl]
    adc e
    and [hl]
    ld b, d
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld d, b
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, h
    nop
    ld [bc], a
    and e
    adc a
    sbc l
    ld b, d
    nop
    add b
    sbc b
    ld b, c
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld d, b
    nop
    nop
    ld b, $4a
    nop
    add b
    ld [$094f], sp
    nop
    ld a, [bc]
    ld c, d
    nop
    rst $38
    ld bc, $b180
    ld c, a
    or d
    nop
    or e
    ld c, d
    add b
    nop
    or h
    ld b, c
    add b
    adc d
    ld d, l
    ld b, c
    add b
    nop
    cp e
    ld c, d
    add b
    nop
    or h
    ld b, c
    add b
    adc d
    ld h, c
    ld b, c
    add b
    nop
    cp e
    ld c, d
    add b
    nop
    or h
    ld b, c
    add b
    adc d
    ld l, l
    ld b, c
    add b
    nop
    cp e
    ld c, d
    add b
    nop
    or h
    ld b, b
    add b
    inc bc
    adc h
    sub c
    sub a
    xor l
    ld c, d
    add b
    nop
    cp e
    ld c, d
    add b
    nop
    or h
    ld d, b
    add b
    nop
    cp e
    ld c, d
    add b
    nop
    or h
    ld b, b
    add b
    nop
    adc h
    ret nz

    sbc a
    nop
    sbc [hl]
    ret nz

    sbc c
    ld bc, $8d80
    ret nz

    sbc c
    ld [bc], a
    sub b
    sub e
    sub c
    ld b, c
    add b
    nop
    cp e
    ld c, d
    add b
    nop
    or h
    ld b, c
    add b
    ld bc, $939c
    add b
    sub c
    ld bc, $809e
    add b
    sbc [hl]
    ld [bc], a
    sbc h
    sbc b
    xor l
    ld b, d
    add b
    nop
    cp e
    ld c, d
    add b
    nop
    or h
    ld b, c
    add b
    nop
    sub [hl]
    add b
    adc a
    ld bc, $809e
    add b
    sbc [hl]
    inc bc
    sbc h
    sbc b
    add b
    xor l
    ld b, d
    add b
    nop
    cp e
    ld c, d
    add b
    nop
    or h
    ld d, b
    add b
    nop
    cp e
    ld c, d
    add b
    nop
    or h
    ld b, b
    add b
    rlca
    sbc l
    sbc c
    sbc a
    sbc b
    adc [hl]
    add b
    sbc [hl]
    adc a
    add b
    sbc l
    ld b, h
    add b
    nop
    cp e
    ld c, d
    add b
    nop
    or h
    ld b, [hl]
    add b
    inc bc
    adc h
    sub c
    sub a
    xor l
    ld b, h
    add b
    nop
    cp e
    ld c, d
    add b
    nop
    or h
    ld b, [hl]
    add b
    inc bc
    sbc l
    adc a
    add b
    xor l
    ld b, h
    add b
    nop
    cp e
    ld c, d
    add b
    nop
    or h
    ld d, b
    add b
    nop
    cp e
    ld c, d
    add b
    nop
    or h
    ld b, b
    add b
    ld b, $8d
    sub [hl]
    adc a
    adc e
    sbc h
    add b
    adc e
    ld b, b
    sub [hl]
    inc b
    add b
    adc [hl]
    adc e
    sbc [hl]
    adc e
    ld b, b
    add b
    nop
    cp e
    ld c, d
    add b
    nop
    or h
    ld d, b
    add b
    nop
    cp e
    ld c, d
    add b
    nop
    or h
    ld b, b
    add b
    inc bc
    adc a
    and d
    sub e
    sbc [hl]
    ld c, d
    add b
    nop
    cp e
    ld c, d
    add b
    add b
    add sp, $4f
    jp hl


    nop
    ld [$804a], a
    rst $38
    ld bc, $0280
    ld c, a
    inc bc
    nop
    inc b
    ld c, d
    nop
    nop
    dec b
    ld b, d
    nop
    add b
    ld [bc], a
    ld b, l
    inc bc
    nop
    inc b
    ld b, d
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, d
    nop
    add hl, bc
    dec b
    or e
    or l
    or c
    or a
    cp c
    xor e
    or l
    or c
    ld b, $42
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, d
    nop
    add hl, bc
    dec b
    or h
    or [hl]
    or d
    cp b
    cp d
    xor h
    or [hl]
    or d
    ld b, $42
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, d
    nop
    add b
    ld [$0945], sp
    nop
    ld a, [bc]
    ld b, d
    nop
    nop
    ld b, $4a
    nop
    ld bc, $0005
    add b
    ld [bc], a
    add b
    inc bc
    add b
    ld [bc], a
    add b
    inc bc
    add b
    ld [bc], a
    add b
    inc bc
    add b
    ld [bc], a
    add b
    inc bc
    ld bc, $0600
    ld c, d
    nop
    ld [bc], a
    dec b
    nop
    dec b
    ld b, b
    nop
    ret nz

    ld b, $40
    nop
    ret nz

    ld b, $40
    nop
    ret nz

    ld b, $40
    nop
    ld [bc], a
    ld b, $00
    ld b, $4a
    nop
    ld [bc], a
    dec b
    nop
    dec b
    ld b, b
    nop
    ret nz

    ld b, $40
    nop
    ret nz

    ld b, $40
    nop
    ret nz

    ld b, $40
    nop
    ld [bc], a
    ld b, $00
    ld b, $4a
    nop
    ld bc, $0005
    add b
    ld [$0980], sp
    add b
    ld [$0980], sp
    add b
    ld [$0980], sp
    add b
    ld [$0980], sp
    ld bc, $0600
    ld c, d
    nop
    ld bc, $0005
    add b
    ld [bc], a
    add b
    inc bc
    add b
    ld [bc], a
    add b
    inc bc
    add b
    ld [bc], a
    add b
    inc bc
    ld b, e
    nop
    nop
    ld b, $4a
    nop
    ld [bc], a
    dec b
    nop
    dec b
    ld b, b
    nop
    ret nz

    ld b, $40
    nop
    ret nz

    ld b, $40
    nop
    nop
    ld b, $43
    nop
    nop
    ld b, $4a
    nop
    ld [bc], a
    dec b
    nop
    dec b
    ld b, b
    nop
    ret nz

    ld b, $40
    nop
    ret nz

    ld b, $40
    nop
    nop
    ld b, $43
    nop
    nop
    ld b, $4a
    nop
    ld bc, $0005
    add b
    ld [$0980], sp
    add b
    ld [$0980], sp
    add b
    ld [$0980], sp
    ld b, e
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, h
    nop
    add b
    ld [bc], a
    ld b, c
    inc bc
    nop
    inc b
    ld b, h
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, h
    nop
    dec b
    dec b
    sub c
    adc e
    sub a
    adc a
    ld b, $44
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, h
    nop
    dec b
    dec b
    sbc c
    and b
    adc a
    sbc h
    ld b, $44
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, h
    nop
    add b
    ld [$0941], sp
    nop
    ld a, [bc]
    ld b, h
    nop
    nop
    ld b, $4a
    nop
    add b
    ld [$094f], sp
    nop
    ld a, [bc]
    ld c, d
    nop
    rst $38
    ld bc, $007f
    ld a, l
    nop
    add b
    ld [bc], a
    ld b, h
    inc bc
    nop
    inc b
    ld d, l
    nop
    inc bc
    dec b
    adc l
    sub [hl]
    adc e
    ld b, b
    sbc l
    ld [bc], a
    sub e
    adc l
    ld b, $55
    nop
    add b
    ld [$0944], sp
    nop
    ld a, [bc]
    ld d, [hl]
    nop
    nop
    add d
    ld c, h
    nop
    nop
    sbc d
    ret nz

    sbc [hl]
    ld c, l
    nop
    inc b
    sub [hl]
    adc a
    and b
    adc a
    sub [hl]
    ld b, e
    nop
    inc bc
    sub [hl]
    sub e
    sbc b
    adc a
    ld l, a
    nop
    nop
    add e
    ld c, h
    nop
    nop
    sbc d
    ret nz

    sbc [hl]
    ld c, l
    nop
    inc b
    sub [hl]
    adc a
    and b
    adc a
    sub [hl]
    ld b, e
    nop
    inc bc
    sub [hl]
    sub e
    sbc b
    adc a
    ld l, a
    nop
    nop
    add h
    ld c, h
    nop
    nop
    sbc d
    ret nz

    sbc [hl]
    ld c, l
    nop
    inc b
    sub [hl]
    adc a
    and b
    adc a
    sub [hl]
    ld b, e
    nop
    inc bc
    sub [hl]
    sub e
    sbc b
    adc a
    ld a, a
    nop
    ld a, a
    nop
    ld l, h
    nop
    add b
    ld [bc], a
    ld b, e
    inc bc
    nop
    inc b
    ld d, [hl]
    nop
    ld [bc], a
    dec b
    sbc d
    sbc a
    ld b, b
    and h
    ld [bc], a
    sub [hl]
    adc a
    ld b, $56
    nop
    add b
    ld [$0943], sp
    nop
    ld a, [bc]
    ld d, a
    nop
    nop
    add d
    ld c, h
    nop
    nop
    sbc d
    ret nz

    sbc [hl]
    ld e, c
    nop
    add b
    sbc l
    ld l, a
    nop
    nop
    add e
    ld c, h
    nop
    nop
    sbc d
    ret nz

    sbc [hl]
    ld e, c
    nop
    add b
    sbc l
    ld l, a
    nop
    nop
    add h
    ld c, h
    nop
    nop
    sbc d
    ret nz

    sbc [hl]
    ld e, c
    nop
    add b
    sbc l
    ld l, [hl]
    nop
    rst $38
    ld bc, $01c0
    ld b, a
    nop
    add c
    ld bc, $0341
    nop
    inc b
    ld c, h
    nop
    ret nz

    ld bc, $0047
    ld bc, $0501
    ld b, d
    nop
    nop
    ld b, $4c
    nop
    ret nz

    ld bc, $0047
    ld bc, $0501
    ld b, d
    nop
    nop
    rlca
    add b
    inc bc
    ld c, d
    nop
    ret nz

    ld bc, $0047
    ld bc, $0501
    ld b, h
    nop
    nop
    ld b, $4a
    nop
    ret nz

    ld bc, $0047
    ld bc, $0501
    ld b, h
    nop
    nop
    ld b, $4a
    nop
    ret nz

    ld bc, $0047
    nop
    ld bc, $0880
    ld b, e
    add hl, bc
    nop
    ld a, [bc]
    ld c, d
    nop
    ret nz

    ld bc, $0047
    ld [$a101], sp
    sub e
    sbc b
    nop
    sub [hl]
    sbc c
    sbc l
    adc a
    ld c, d
    nop
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $0051
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $0051
    ret nz

    ld bc, $0047
    nop
    ld bc, $d840
    ld d, b
    nop
    ret nz

    ld bc, $0047
    nop
    ld bc, $d840
    ld d, b
    nop
    ret nz

    ld bc, $0047
    nop
    ld bc, $d840
    ld d, b
    nop
    ret nz

    ld bc, $0047
    nop
    ld bc, $d840
    ld d, b
    nop
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $0051
    ret nz

    ld bc, $0047
    ld [$a101], sp
    sub e
    sbc b
    nop
    sub [hl]
    sbc c
    sbc l
    adc a
    ld c, d
    nop
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $0051
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $0051
    nop
    ld bc, $0e48
    ret nz

    ld bc, $0051
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $0051
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $0051
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $0051
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $0051
    nop
    ld bc, $1082
    ld b, b
    nop
    add d
    inc d
    ret nz

    ld bc, $0051
    nop
    ld bc, $0e48
    ret nz

    ld bc, $007f
    ld a, a
    nop
    ld a, a
    nop
    ld a, a
    nop
    ld c, l
    nop
    rst $38
    ld bc, $0061
    adc d
    ld bc, $0052
    adc d
    dec c
    ld d, d
    nop
    add a
    add hl, de
    nop
    jr nz, @-$7e

    ld [hl+], a
    ld c, a
    nop
    add b
    inc h
    ld b, e
    dec h
    add e
    ld h, $00
    nop
    add e
    dec hl
    ld bc, $3024
    ld c, d
    nop
    add b
    ld sp, $3243
    adc e
    inc sp
    ld e, e
    nop
    add b
    ldh a, [c]
    ld l, e
    nop
    add b
    ld b, b
    ld c, a
    ld b, c
    nop
    ld b, d
    ld c, d
    nop
    nop
    ld b, e
    ld d, b
    nop
    nop
    ld b, h
    ld c, d
    nop
    nop
    ld b, e
    ld d, b
    nop
    nop
    ld b, h
    ld c, d
    nop
    nop
    ld b, e
    ld d, b
    nop
    nop
    ld b, h
    ld c, d
    nop
    nop
    ld b, e
    ld d, b
    nop
    nop
    ld b, h
    ld c, d
    nop
    nop
    ld b, e
    ld d, b
    nop
    nop
    ld b, h
    ld c, d
    nop
    nop
    ld b, e
    ld d, b
    nop
    nop
    ld b, h
    ld c, d
    nop
    nop
    ld b, e
    ld d, b
    nop
    nop
    ld b, h
    ld c, d
    nop
    nop
    ld b, e
    ld d, b
    nop
    nop
    ld b, h
    ld c, d
    nop
    add b
    ld h, a
    ld c, a
    ld l, b
    nop
    ld l, c
    ld c, d
    nop
    rst $38
    ld bc, $b07f
    ld a, a
    or b
    ld a, a
    or b
    add e
    or b
    nop
    or e
    add b
    or l
    ld [bc], a
    or e
    or a
    or b
    add b
    cp b
    ld [hl], e
    or b
    add c
    cp d
    ld e, d
    or b
    adc e
    cp l
    ld d, c
    or b
    nop
    jp z, $bf40

    adc b
    bit 2, c
    or b
    nop
    push de
    add b
    cp [hl]
    add a
    sub $00
    rst $10
    ld d, d
    or b
    add c
    rst $18
    ld a, a
    or b
    ld a, a
    or b
    ld [hl], h
    or b
    rst $38
    ld bc, $0180
    ld b, [hl]
    ld [bc], a
    nop
    inc bc
    ld d, e
    nop
    add h
    inc b
    nop
    nop
    add b
    ld a, [bc]
    ld bc, $0c07
    ld d, e
    nop
    nop
    inc b
    add e
    dec c
    nop
    nop
    add c
    ld [de], a
    nop
    inc c
    ld d, e
    nop
    add b
    dec d
    ld b, [hl]
    ld d, $00
    rla
    ld d, l
    nop
    add b
    jr @+$4d

    add hl, de
    nop
    ld a, [de]
    ld c, [hl]
    nop
    add l
    dec de
    ld b, [hl]
    ld hl, $2200
    ld c, [hl]
    nop
    add h
    inc hl
    nop
    ld hl, $2987
    ld c, [hl]
    nop
    add e
    ld [hl-], a
    nop
    ld hl, $3781
    ld b, d
    inc sp
    add c
    ld a, [hl-]
    ld c, [hl]
    nop
    add d
    dec a
    ld b, b
    ld hl, $4187
    nop
    ld [hl+], a
    ld c, [hl]
    nop
    nop
    dec de
    add d
    ld c, d
    nop
    ld hl, $4e86
    add b
    ld hl, $004e
    ld bc, $211b
    adc e
    ld d, [hl]
    nop
    ld [hl+], a
    ld c, [hl]
    nop
    ld bc, $211b
    add d
    ld h, e
    nop
    ld hl, $6781
    ld b, b
    ld hl, $6a81
    nop
    ld [hl+], a
    ld c, [hl]
    nop
    nop
    dec de
    ld b, b
    ld hl, $6d80
    ld b, b
    ld hl, $6f80
    nop
    ld hl, $7183
    nop
    ld [hl+], a
    ld c, [hl]
    nop
    nop
    dec de
    ld b, b
    ld hl, $7600
    ld b, h
    ld hl, $7780
    ld b, c
    ld hl, $2200
    ld c, [hl]
    nop
    add b
    ld a, c
    ld c, e
    ld a, d
    nop
    ld a, e
    ld d, b
    nop
    add b
    ld bc, $0247
    nop
    inc bc
    ld d, d
    nop
    nop
    inc b
    ld c, b
    nop
    nop
    inc c
    ld d, d
    nop
    add b
    dec d
    ld b, a
    ld d, $00
    rla
    ld c, [hl]
    nop
    rst $38
    ld bc, $01c0
    ld b, a
    nop
    ret nz

    ld bc, $0280
    ld b, c
    inc bc
    nop
    inc b
    ld c, e
    nop
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $0500
    ret nz

    adc a
    ld [bc], a
    sub e
    sbc [hl]
    ld b, $4b
    nop
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $0780
    ld b, c
    ld [$0900], sp
    ld c, e
    nop
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $0a84
    ld c, e
    nop
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $1084
    ld c, e
    nop
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $1684
    ld c, e
    nop
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $1c84
    ld c, e
    nop
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $2284
    ld c, e
    nop
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $2884
    ld c, e
    nop
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $2e84
    ld c, e
    nop
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $3483
    nop
    ld [hl], $4b
    nop
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $0051
    ret nz

    ld bc, $0047
    nop
    ld bc, $0346
    ld c, d
    nop
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $0051
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $0051
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $0051
    ret nz

    ld bc, $0047
    ret nz

    ld bc, $0051
    nop
    ld bc, $3941
    add d
    ld a, [hl-]
    ld b, c
    add hl, sp
    nop
    ld bc, $0846
    ld c, d
    nop
    rst $38
    ld bc, $d480
    ld c, a
    push de
    nop
    sub $4a
    nop
    nop
    rst $10
    ld b, c
    nop
    add b
    ld [bc], a
    ld b, a
    inc bc
    nop
    inc b
    ld b, c
    nop
    nop
    ret c

    ld c, d
    nop
    nop
    rst $10
    ld b, c
    nop
    ld bc, $0005
    add d
    db $f4
    ld b, e
    nop
    nop
    ld b, $41
    nop
    nop
    ret c

    ld c, d
    nop
    nop
    rst $10
    ld b, c
    nop
    ld bc, $0005
    add d
    ld hl, sp+$01
    sub a
    sbc c
    add b
    adc [hl]
    ld bc, $0600
    ld b, c
    nop
    nop
    ret c

    ld c, d
    nop
    nop
    rst $10
    ld b, c
    nop
    add b
    rlca
    ld b, a
    ld [$0900], sp
    ld b, c
    nop
    nop
    ret c

    ld c, d
    nop
    nop
    rst $10
    ld b, e
    nop
    add b
    ld [bc], a
    ld b, e
    inc bc
    nop
    inc b
    ld b, e
    nop
    nop
    ret c

    ld c, d
    nop
    nop
    rst $10
    ld b, e
    nop
    rlca
    dec b
    sbc l
    adc a
    sub [hl]
    adc a
    adc l
    sbc [hl]
    ld b, $43
    nop
    nop
    ret c

    ld c, d
    nop
    nop
    rst $10
    ld b, e
    nop
    add b
    rlca
    ld b, e
    ld [$0900], sp
    ld b, e
    nop
    nop
    ret c

    ld c, d
    nop
    nop
    rst $10
    ld b, e
    nop
    add b
    ld [bc], a
    ld b, e
    inc bc
    nop
    inc b
    ld b, e
    nop
    nop
    ret c

    ld c, d
    nop
    nop
    rst $10
    ld b, e
    nop
    nop
    dec b
    ld b, h
    nop
    nop
    ld b, $43
    nop
    nop
    ret c

    ld c, d
    nop
    nop
    rst $10
    ld b, e
    nop
    ld bc, $0005
    ret nz

    adc a
    inc bc
    sub e
    sbc [hl]
    nop
    ld b, $43
    nop
    nop
    ret c

    ld c, d
    nop
    nop
    rst $10
    ld b, e
    nop
    nop
    dec b
    ld b, h
    nop
    nop
    ld b, $43
    nop
    nop
    ret c

    ld c, d
    nop
    nop
    rst $10
    ld b, e
    nop
    rlca
    dec b
    nop
    sbc d
    sub [hl]
    adc e
    and e
    nop
    ld b, $43
    nop
    nop
    ret c

    ld c, d
    nop
    nop
    rst $10
    ld b, e
    nop
    nop
    dec b
    ld b, h
    nop
    nop
    ld b, $43
    nop
    nop
    ret c

    ld c, d
    nop
    nop
    rst $10
    ld b, e
    nop
    rlca
    dec b
    nop
    adc a
    and d
    sub e
    sbc [hl]
    nop
    ld b, $43
    nop
    nop
    ret c

    ld c, d
    nop
    nop
    rst $10
    ld b, e
    nop
    nop
    dec b
    ld b, h
    nop
    nop
    ld b, $43
    nop
    nop
    ret c

    ld c, d
    nop
    nop
    rst $10
    ld b, e
    nop
    add b
    rlca
    ld b, e
    ld [$0900], sp
    ld b, e
    nop
    nop
    ret c

    ld c, d
    nop
    add b
    reti


    ld c, a
    jp c, $db00

    ld c, d
    nop
    rst $38
    ld bc, $807f
    ld h, c
    add b
    add b
    ldh [rBGP], a
    pop hl
    nop
    ldh [c], a
    ld d, d
    add b
    nop
    db $e3
    adc b
    add c
    nop
    db $e4
    ld d, d
    add b
    nop
    db $e3
    adc b
    adc e
    nop
    db $e4
    ld d, d
    add b
    nop
    db $e3
    adc b
    sub l
    nop
    db $e4
    ld d, d
    add b
    nop
    db $e3
    adc b
    sbc a
    nop
    db $e4
    ld d, d
    add b
    nop
    db $e3
    adc b
    xor c
    nop
    db $e4
    ld d, d
    add b
    nop
    db $e3
    adc b
    or e
    nop
    db $e4
    ld d, d
    add b
    nop
    db $e3
    adc b
    cp l
    nop
    db $e4
    ld d, d
    add b
    nop
    db $e3
    adc b
    rst $00
    nop
    db $e4
    ld d, d
    add b
    add b
    push hl
    ld b, a
    and $00
    rst $20
    ld [hl], e
    add b
    ld [$d5dc], sp
    db $ec
    or $eb
    add b
    rst $10
    rst $18
    push af
    ld a, a
    add b
    ld l, a
    add b
    rst $38
    ld bc, $007f
    ld h, c
    nop
    add b
    ldh [rBGP], a
    pop hl
    nop
    ldh [c], a
    ld d, d
    nop
    nop
    db $e3
    adc b
    ld bc, $e400
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec bc
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec d
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    rra
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    add hl, hl
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    inc sp
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec a
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    ld b, a
    nop
    db $e4
    ld d, d
    nop
    add b
    push hl
    ld b, a
    and $00
    rst $20
    ld d, h
    nop
    inc bc
    pop de
    nop
    db $dd
    db $ed
    ld b, b
    db $dd
    ld bc, $f5f1
    halt
    nop
    nop
    pop de
    ld b, d
    ret c

    nop
    push af
    ld a, a
    nop
    ld d, c
    nop
    rst $38
    ld bc, $007f
    ld h, c
    nop
    add b
    ldh [rBGP], a
    pop hl
    nop
    ldh [c], a
    ld d, d
    nop
    nop
    db $e3
    adc b
    ld bc, $e400
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec bc
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec d
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    rra
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    add hl, hl
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    inc sp
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec a
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    ld b, a
    nop
    db $e4
    ld d, d
    nop
    add b
    push hl
    ld b, a
    and $00
    rst $20
    ld c, a
    nop
    ld c, $ef
    rst $18
    rst $28
    rst $30
    nop
    reti


    db $ec
    or $eb
    nop
    ret c

    db $ed
    rst $10
    push de
    push af
    ld l, a
    nop
    ld [bc], a
    reti


    nop
    rst $28
    ret nz

    rst $18
    add b
    call nc, $ea09
    nop
    reti


    sub $00
    reti


    nop
    db $d3
    pop de
    sbc $4d
    nop
    dec bc
    db $ec
    pop de
    db $db
    push de
    nop
    reti


    db $ec
    nop
    ret c

    rst $18
    db $dd
    push de
    ld b, c
    di
    ld l, [hl]
    nop
    rst $38
    ld bc, $007f
    ld h, c
    nop
    add b
    ldh [rBGP], a
    pop hl
    nop
    ldh [c], a
    ld d, d
    nop
    nop
    db $e3
    adc b
    ld bc, $e400
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec bc
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec d
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    rra
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    add hl, hl
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    inc sp
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec a
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    ld b, a
    nop
    db $e4
    ld d, d
    nop
    add b
    push hl
    ld b, a
    and $00
    rst $20
    ld c, a
    nop
    ld de, $d8ec
    push de
    nop
    db $ec
    ld [$d1d5], a
    db $eb
    db $ed
    ld [$00d5], a
    rst $28
    push de
    or $ee
    push de
    ld c, h
    nop
    nop
    jp nc, $d540

    ld [bc], a
    sbc $00
    call c, $df40
    ld [$d9db], sp
    sbc $d7
    nop
    sub $df
    ld [$6df5], a
    nop
    ld [bc], a
    pop af
    pop de
    ret c

    ld b, b
    rst $18
    nop
    push af
    ld [hl], a
    nop
    rst $38
    ld bc, $007f
    ld h, c
    nop
    add b
    ldh [rBGP], a
    pop hl
    nop
    ldh [c], a
    ld d, d
    nop
    nop
    db $e3
    adc b
    ld bc, $e400
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec bc
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec d
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    rra
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    add hl, hl
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    inc sp
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec a
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    ld b, a
    nop
    db $e4
    ld d, d
    nop
    add b
    push hl
    ld b, a
    and $00
    rst $20
    ld d, b
    nop
    ld b, $d9
    db $ec
    or $eb
    nop
    db $d3
    rst $18
    ld b, b
    call c, $d106
    add sp, -$15
    reti


    sbc $d7
    push af
    ld l, [hl]
    nop
    inc bc
    rst $18
    ret c

    rst $30
    nop
    add b
    sbc $00
    push af
    ld a, a
    nop
    ld d, h
    nop
    rst $38
    ld bc, $0280
    ld c, a
    inc bc
    nop
    inc b
    ld c, d
    nop
    nop
    dec b
    ld d, b
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    add b
    ld [bc], a
    ld c, l
    inc bc
    ld bc, $0604
    ld c, d
    nop
    ld b, b
    dec b
    ld c, [hl]
    nop
    ld b, b
    ld b, $4a
    nop
    ld b, b
    dec b
    add b
    sbc b
    add hl, bc
    and c
    nop
    and e
    sbc c
    sbc a
    nop
    adc a
    adc e
    sbc h
    sbc b
    ret nz

    adc a
    ld b, b
    nop
    ld b, b
    ld b, $4a
    nop
    ld b, b
    dec b
    ld c, [hl]
    nop
    ld b, b
    ld b, $4a
    nop
    ld b, b
    dec b
    rrca
    adc e
    nop
    adc l
    sub d
    adc e
    sbc b
    adc l
    adc a
    nop
    sbc [hl]
    sbc c
    nop
    sbc d
    sub [hl]
    adc e
    and e
    ld b, b
    ld b, $4a
    nop
    ld b, b
    dec b
    ld c, [hl]
    nop
    ld b, b
    ld b, $4a
    nop
    ld b, b
    dec b
    inc c
    and e
    sbc c
    sbc a
    sbc h
    nop
    sub b
    adc e
    and b
    sbc c
    sbc h
    sub e
    sbc [hl]
    adc a
    ld b, c
    nop
    ld b, b
    ld b, $4a
    nop
    ld b, b
    dec b
    ld c, [hl]
    nop
    ld b, b
    ld b, $4a
    nop
    ld b, b
    dec b
    add b
    sbc l
    ld [$918b], sp
    adc a
    nop
    sbc c
    sub b
    nop
    sbc d
    sbc a
    ld b, b
    and h
    ld [bc], a
    sub [hl]
    adc a
    nop
    ld b, b
    ld b, $4a
    nop
    ld b, b
    dec b
    ld c, [hl]
    nop
    ld b, b
    ld b, $4a
    nop
    ld b, b
    dec b
    ld bc, $9997
    add b
    adc [hl]
    nop
    and a
    ld c, c
    nop
    ld b, b
    ld b, $4a
    nop
    ld b, b
    dec b
    ld c, [hl]
    nop
    ld b, b
    ld b, $4a
    nop
    nop
    dec b
    add b
    ld [$094d], sp
    ld bc, $060a
    ld c, d
    nop
    nop
    dec b
    ld d, b
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld d, b
    nop
    nop
    ld b, $4a
    nop
    add b
    ld [$094f], sp
    nop
    ld a, [bc]
    ld c, d
    nop
    rst $38
    ld bc, $807f
    ld h, c
    add b
    add b
    ldh [rBGP], a
    pop hl
    nop
    ldh [c], a
    ld d, d
    add b
    nop
    db $e3
    adc b
    add c
    nop
    db $e4
    ld d, d
    add b
    nop
    db $e3
    adc b
    adc e
    nop
    db $e4
    ld d, d
    add b
    nop
    db $e3
    adc b
    sub l
    nop
    db $e4
    ld d, d
    add b
    nop
    db $e3
    adc b
    sbc a
    nop
    db $e4
    ld d, d
    add b
    nop
    db $e3
    adc b
    xor c
    nop
    db $e4
    ld d, d
    add b
    nop
    db $e3
    adc b
    or e
    nop
    db $e4
    ld d, d
    add b
    nop
    db $e3
    adc b
    cp l
    nop
    db $e4
    ld d, d
    add b
    nop
    db $e3
    adc b
    rst $00
    nop
    db $e4
    ld d, d
    add b
    add b
    push hl
    ld b, a
    and $00
    rst $20
    ld c, a
    add b
    rlca
    rst $28
    ret c

    pop de
    db $ec
    or $eb
    add b
    db $ec
    add b
    ret c

    rlca
    db $eb
    add b
    db $eb
    rst $28
    reti


    db $ec
    db $d3
    ret c

    ld c, h
    add b
    inc bc
    sub $df
    ld [$7bf4], a
    add b
    dec b
    ld [$dded], a
    jp nc, $d5dc

    ld b, c
    di
    dec b
    ld [$dded], a
    jp nc, $d5dc

    ld l, l
    add b
    rst $38
    ld bc, $007f
    ld h, c
    nop
    add b
    ldh [rBGP], a
    pop hl
    nop
    ldh [c], a
    ld d, d
    nop
    nop
    db $e3
    adc b
    ld bc, $e400
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec bc
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec d
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    rra
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    add hl, hl
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    inc sp
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec a
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    ld b, a
    nop
    db $e4
    ld d, d
    nop
    add b
    push hl
    ld b, a
    and $00
    rst $20
    ld c, a
    nop
    ld de, $ecd9
    or $eb
    nop
    pop de
    nop
    db $eb
    add sp, -$2f
    db $d3
    push de
    db $d3
    ld [$d6d1], a
    db $ec
    push af
    ld l, h
    nop
    add hl, bc
    db $eb
    rst $18
    db $dd
    push de
    jp nc, $d4df

    pop af
    rst $30
    nop
    add b
    db $eb
    dec b
    rst $18
    add sp, $00
    reti


    db $ec
    push af
    ld a, a
    nop
    ld c, d
    nop
    rst $38
    ld bc, $0280
    ld c, a
    inc bc
    nop
    inc b
    ld c, d
    nop
    nop
    dec b
    ld b, c
    nop
    add b
    ld [bc], a
    ld b, a
    inc bc
    nop
    inc b
    ld b, c
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, c
    nop
    ld [bc], a
    dec b
    xor c
    xor e
    ld b, b
    xor l
    ld bc, $b1af
    ld b, d
    nop
    nop
    ld b, $41
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, c
    nop
    ld [bc], a
    dec b
    xor d
    xor h
    ld b, b
    xor [hl]
    inc bc
    or b
    or d
    sub a
    sbc c
    add b
    adc [hl]
    nop
    ld b, $41
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, c
    nop
    add b
    ld [$0947], sp
    nop
    ld a, [bc]
    ld b, c
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, d
    nop
    add b
    ld [bc], a
    ld b, l
    inc bc
    nop
    inc b
    ld b, d
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, d
    nop
    ld bc, $8d05
    ret nz

    sbc c
    dec b
    sbc [hl]
    sub e
    sbc b
    xor h
    adc a
    ld b, $42
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, d
    nop
    add b
    ld [$0945], sp
    nop
    ld a, [bc]
    ld b, d
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, b
    nop
    add b
    ld [bc], a
    ld c, c
    inc bc
    nop
    inc b
    ld b, b
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, b
    nop
    nop
    dec b
    ld c, d
    nop
    nop
    ld b, $40
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, b
    nop
    nop
    dec b
    ld c, d
    nop
    nop
    ld b, $40
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, b
    nop
    nop
    dec b
    ld b, c
    nop
    add b
    sbc l
    ld [bc], a
    adc e
    sub c
    adc a
    ld b, d
    nop
    nop
    ld b, $40
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, b
    nop
    add b
    ld [$0949], sp
    nop
    ld a, [bc]
    ld b, b
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld d, b
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld d, b
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld d, b
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld d, b
    nop
    nop
    ld b, $4a
    nop
    add b
    ld [$094f], sp
    nop
    ld a, [bc]
    ld c, d
    nop
    rst $38
    ld bc, $007f
    ld h, c
    nop
    add b
    ldh [rBGP], a
    pop hl
    nop
    ldh [c], a
    ld d, d
    nop
    nop
    db $e3
    adc b
    ld bc, $e400
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec bc
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec d
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    rra
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    add hl, hl
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    inc sp
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec a
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    ld b, a
    nop
    db $e4
    ld d, d
    nop
    add b
    push hl
    ld b, a
    and $00
    rst $20
    ld c, a
    nop
    ld [bc], a
    add sp, -$16
    rst $18
    ret nz

    sub $40
    db $eb
    add hl, bc
    rst $18
    ld [$00f7], a
    pop af
    rst $18
    db $ed
    or $ea
    push de
    ld c, l
    nop
    inc bc
    pop de
    nop
    db $dd
    db $ed
    ld b, b
    db $dd
    nop
    pop af
    ld b, c
    di
    ld [hl], h
    nop
    nop
    db $d3
    ld b, b
    rst $18
    dec bc
    call c, Call_000_00f7
    reti


    db $eb
    sbc $f6
    db $ec
    nop
    reti


    db $ec
    db $f4
    ld l, [hl]
    nop
    rst $38
    ld bc, $007f
    ld h, c
    nop
    add b
    ldh [rBGP], a
    pop hl
    nop
    ldh [c], a
    ld d, d
    nop
    nop
    db $e3
    adc b
    ld bc, $e400
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec bc
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec d
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    rra
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    add hl, hl
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    inc sp
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec a
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    ld b, a
    nop
    db $e4
    ld d, d
    nop
    add b
    push hl
    ld b, a
    and $00
    rst $20
    ld d, b
    nop
    rlca
    db $eb
    rst $18
    nop
    db $dd
    pop de
    sbc $f1
    nop
    add b
    db $eb
    nop
    pop de
    add b
    db $ec
    ld [bc], a
    push de
    db $eb
    push af
    ld l, [hl]
    nop
    ld a, [bc]
    reti


    sbc $ec
    ld [$d7d9], a
    db $ed
    reti


    sbc $d7
    push af
    ld a, a
    nop
    ld d, b
    nop
    rst $38
    ld bc, $007f
    ld h, c
    nop
    add b
    ldh [rBGP], a
    pop hl
    nop
    ldh [c], a
    ld d, d
    nop
    nop
    db $e3
    adc b
    ld bc, $e400
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec bc
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec d
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    rra
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    add hl, hl
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    inc sp
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec a
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    ld b, a
    nop
    db $e4
    ld d, d
    nop
    add b
    push hl
    ld b, a
    and $00
    rst $20
    ld d, b
    nop
    rrca
    reti


    nop
    sub $df
    db $ed
    sbc $d4
    nop
    pop de
    nop
    db $eb
    push de
    db $d3
    ld [$ecd5], a
    ld c, [hl]
    nop
    inc b
    add sp, -$2f
    db $ec
    ret c

    push af
    ld a, c
    nop
    nop
    rst $10
    ld b, b
    rst $18
    dec b
    call nc, $da00
    rst $18
    jp nc, Jump_008_73f5

    nop
    rst $38
    ld bc, $007f
    ld h, c
    nop
    add b
    ldh [rBGP], a
    pop hl
    nop
    ldh [c], a
    ld d, d
    nop
    nop
    db $e3
    adc b
    ld bc, $e400
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec bc
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec d
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    rra
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    add hl, hl
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    inc sp
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec a
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    ld b, a
    nop
    db $e4
    ld d, d
    nop
    add b
    push hl
    ld b, a
    and $00
    rst $20
    ld d, e
    nop
    inc b
    ret c

    pop de
    nop
    ret c

    pop de
    ld b, c
    di
    ld bc, $f1dd
    ld d, h
    nop
    rlca
    db $ec
    ld [$d1d5], a
    db $eb
    db $ed
    ld [$41d5], a
    di
    ld [hl], e
    nop
    nop
    rst $28
    ld b, c
    di
    inc b
    rst $28
    pop de
    reti


    db $ec
    push af
    ld [hl], b
    nop
    rst $38
    ld bc, $807f
    ld h, c
    add b
    add b
    ldh [rBGP], a
    pop hl
    nop
    ldh [c], a
    ld d, d
    add b
    nop
    db $e3
    adc b
    add c
    nop
    db $e4
    ld d, d
    add b
    nop
    db $e3
    adc b
    adc e
    nop
    db $e4
    ld d, d
    add b
    nop
    db $e3
    adc b
    sub l
    nop
    db $e4
    ld d, d
    add b
    nop
    db $e3
    adc b
    sbc a
    nop
    db $e4
    ld d, d
    add b
    nop
    db $e3
    adc b
    xor c
    nop
    db $e4
    ld d, d
    add b
    nop
    db $e3
    adc b
    or e
    nop
    db $e4
    ld d, d
    add b
    nop
    db $e3
    adc b
    cp l
    nop
    db $e4
    ld d, d
    add b
    nop
    db $e3
    adc b
    rst $00
    nop
    db $e4
    ld d, d
    add b
    add b
    push hl
    ld b, a
    and $00
    rst $20
    ld d, c
    add b
    inc c
    reti


    db $ec
    or $eb
    add b
    rst $10
    call c, $efdf
    reti


    sbc $d7
    push af
    ld [hl], h
    add b
    nop
    db $db
    add b
    pop de
    ld b, b
    rst $18
    ld bc, $f5dd
    ld a, a
    add b
    ld d, b
    add b
    rst $38
    ld bc, $007f
    ld h, c
    nop
    add b
    ldh [rBGP], a
    pop hl
    nop
    ldh [c], a
    ld d, d
    nop
    nop
    db $e3
    adc b
    ld bc, $e400
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec bc
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec d
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    rra
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    add hl, hl
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    inc sp
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    dec a
    nop
    db $e4
    ld d, d
    nop
    nop
    db $e3
    adc b
    ld b, a
    nop
    db $e4
    ld d, d
    nop
    add b
    push hl
    ld b, a
    and $00
    rst $20
    ld d, b
    nop
    inc c
    rst $28
    ret c

    push de
    ld [$00d5], a
    pop de
    ld [$00d5], a
    rst $28
    push de
    db $f4
    ld [hl], c
    nop
    ld c, $d9
    db $ec
    or $eb
    nop
    pop de
    sbc $00
    reti


    db $eb
    call c, $ded1
    call nc, Call_008_7ff4
    nop
    ld c, h
    nop
    rst $38
    ld bc, $007f
    ld [$8f9e], sp
    sbc [hl]
    sbc h
    sub e
    sbc l
    xor [hl]
    nop
    add d
    pop bc
    adc d
    ld b, $00
    adc a
    sub [hl]
    sbc c
    sbc h
    sub c
    and l
    ld c, e
    nop
    add hl, bc
    sbc c
    sbc h
    sub e
    sub c
    sub e
    sbc b
    adc e
    sub [hl]
    nop
    adc l
    ret nz

    sbc c
    dec b
    adc l
    adc a
    sbc d
    sbc [hl]
    nop
    xor l
    ld c, h
    nop
    add b
    adc [hl]
    ld b, $9d
    sub e
    sub c
    sbc b
    nop
    adc h
    and e
    ld d, a
    nop
    ld [$968b], sp
    adc a
    and d
    adc a
    and e
    nop
    sbc d
    adc e
    ret nz

    sub h
    nop
    sbc [hl]
    add b
    sbc b
    ld bc, $a5a0
    ld c, h
    nop
    inc c
    sbc [hl]
    adc a
    sbc [hl]
    sbc h
    sub e
    sbc l
    nop
    sub [hl]
    sub e
    adc l
    adc a
    sbc b
    sbc l
    ret nz

    adc a
    ld [bc], a
    nop
    sbc [hl]
    sbc c
    ld c, h
    nop
    ld de, $929e
    adc a
    nop
    sbc [hl]
    adc a
    sbc [hl]
    sbc h
    sub e
    sbc l
    nop
    adc l
    sbc c
    sub a
    sbc d
    adc e
    sbc b
    and e
    ld c, h
    nop
    ld c, $8b
    sbc b
    adc [hl]
    nop
    sbc [hl]
    adc a
    sbc [hl]
    sbc h
    sub e
    sbc l
    nop
    sbc d
    sub [hl]
    sbc a
    sbc l
    ld c, a
    nop
    ld [$9f9d], sp
    adc h
    sub [hl]
    sub e
    adc l
    adc a
    sbc b
    sbc l
    ret nz

    adc a
    ld [bc], a
    nop
    sbc [hl]
    sbc c
    ld d, a
    nop
    ld a, [bc]
    sub h
    adc e
    sub [hl]
    adc a
    adc l
    sbc c
    nop
    sub [hl]
    sbc [hl]
    adc [hl]
    and l
    ld c, h
    nop
    dec c
    sbc [hl]
    adc a
    sbc [hl]
    sbc h
    sub e
    sbc l
    nop
    sbc d
    sub [hl]
    sbc a
    sbc l
    xor [hl]
    nop
    add d
    ld b, b
    adc d
    nop
    add a
    ld c, l
    nop
    ld [de], a
    sbc [hl]
    sub d
    adc a
    nop
    sbc [hl]
    adc a
    sbc [hl]
    sbc h
    sub e
    sbc l
    nop
    adc l
    sbc c
    sub a
    sbc d
    adc e
    sbc b
    and e
    and l
    ld a, a
    nop
    ld a, a
    nop
    ld a, a
    nop
    ld c, b
    nop
    ld [$8f9e], sp
    sbc [hl]
    sbc h
    sub e
    sbc l
    xor a
    nop
    xor l
    ld e, e
    nop
    ld a, [bc]
    sbc [hl]
    adc a
    sbc [hl]
    sbc h
    sub e
    sbc l
    nop
    sbc d
    sub [hl]
    sbc a
    sbc l
    add b
    ldh a, [c]
    ld c, e
    nop
    ld [$9f9d], sp
    adc h
    sub [hl]
    sub e
    adc l
    adc a
    sbc b
    sbc l
    ret nz

    adc a
    ld [bc], a
    nop
    sbc [hl]
    sbc c
    ld e, b
    nop
    ld a, [bc]
    sub h
    adc e
    sub [hl]
    adc a
    adc l
    sbc c
    nop
    sub [hl]
    sbc [hl]
    adc [hl]
    and l
    ld c, e
    nop
    ld bc, $a38c
    ld e, h
    nop
    ld [de], a
    sbc [hl]
    sub d
    adc a
    nop
    sbc [hl]
    adc a
    sbc [hl]
    sbc h
    sub e
    sbc l
    nop
    adc l
    sbc c
    sub a
    sbc d
    adc e
    sbc b
    and e
    and l
    ld c, e
    nop
    nop
    adc e
    ld b, b
    sub [hl]
    ld [bc], a
    nop
    sbc h
    sub e
    add b
    sub c
    ret nz

    sbc [hl]
    ld e, l
    nop
    dec b
    sbc h
    adc a
    sbc l
    adc a
    sbc h
    and b
    ret nz

    adc a
    nop
    and l
    ld a, a
    nop
    ld a, a
    nop
    ld l, c
    nop
    rst $38
    nop
    nop
    sbc c
    sub l
    and [hl]
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    cp $a3
    adc a
    sbc l
    nop
    sbc b
    sbc c
    rst $38
    nop
    nop
    cp h
    cp l
    cp l
    cp [hl]
    nop
    cp $c7
    cp a
    nop
    nop
    ret nz

    call nz, $c6fe
    cp a
    nop
    nop
    ret nz

    push bc
    cp $00
    pop bc
    jp nz, $c3c2

    nop
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    sbc c
    sub l
    and [hl]
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    cp $a3
    adc a
    sbc l
    nop
    sbc b
    sbc c
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    sbc c
    sub l
    and [hl]
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    nop
    cp $a3
    adc a
    sbc l
    nop
    sbc b
    sbc c
    rst $38
    ld [bc], a
    ld [$fe00], sp
    ld [$fe00], sp
    ld [$fe00], sp
    ld [$ff00], sp
    nop
    nop
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
    cp $9d
    sub e
    sbc b
    sub c
    sub [hl]
    adc a
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    xor b
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
    cp $8e
    sbc c
    sbc a
    adc h
    sub [hl]
    adc a
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    xor b
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
    cp $9e
    sbc h
    sub e
    sbc d
    sub [hl]
    adc a
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    xor b
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
    cp $9e
    adc a
    sbc [hl]
    sbc h
    sub e
    sbc l
    nop
    nop
    nop
    nop
    cp $00
    nop
    nop
    nop
    nop
    xor b
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
    cp $ff
    ld bc, $8180
    ld c, a
    add d
    nop
    add e
    ld c, d
    add b
    nop
    add h
    ld d, b
    add b
    nop
    add l
    ld c, d
    add b
    nop
    add h
    ld d, b
    add b
    nop
    add l
    ld c, d
    add b
    nop
    add h
    ld d, b
    add b
    nop
    add l
    ld c, d
    add b
    nop
    add h
    ld d, b
    add b
    nop
    add l
    ld c, d
    add b
    nop
    add h
    ld d, b
    add b
    nop
    add l
    ld c, d
    add b
    nop
    add h
    ld b, d
    add b
    add c
    adc c
    nop
    add b
    add h
    adc h
    ld b, d
    add b
    nop
    add l
    ld c, d
    add b
    nop
    add h
    ld b, d
    add b
    add c
    sub d
    nop
    add b
    add h
    sub l
    ld b, d
    add b
    nop
    add l
    ld c, d
    add b
    nop
    add h
    ld d, b
    add b
    nop
    add l
    ld c, d
    add b
    nop
    add h
    ld d, b
    add b
    nop
    add l
    ld c, d
    add b
    nop
    add h
    ld d, b
    add b
    nop
    add l
    ld c, d
    add b
    nop
    add h
    ld d, b
    add b
    nop
    add l
    ld c, d
    add b
    nop
    add h
    ld d, b
    add b
    nop
    add l
    ld c, d
    add b
    nop
    add h
    ld d, b
    add b
    nop
    add l
    ld c, d
    add b
    nop
    add h
    ld d, b
    add b
    nop
    add l
    ld c, d
    add b
    nop
    add h
    ld d, b
    add b
    nop
    add l
    ld c, d
    add b
    nop
    add h
    ld d, b
    add b
    nop
    add l
    ld c, d
    add b
    add b
    add [hl]
    ld c, a
    add a
    nop
    adc b
    ld c, d
    add b
    rst $38
    ld [bc], a
    ld a, [bc]
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    rst $38
    ld [bc], a
    ld a, [bc]
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    rst $38
    nop
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
    rst $38
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
    rst $38
    nop
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
    rst $38
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
    rst $38
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
    rst $38
    nop
    ld [bc], a
    inc bc
    inc bc
    inc bc
    inc bc
    inc b
    cp $05
    sub c
    adc e
    sub a
    adc a
    ld b, $fe
    dec b
    sbc c
    and b
    adc a
    sbc h
    ld b, $fe
    ld [$0909], sp
    add hl, bc
    add hl, bc
    ld a, [bc]
    cp $fe
    sbc d
    sbc h
    adc a
    sbc l
    sbc l
    nop
    adc e
    rst $38
    nop
    nop
    ld [bc], a
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    inc bc
    inc b
    nop
    cp $00
    dec b
    nop
    call z, $cecd
    rst $08
    call c, Call_000_0006
    cp $00
    dec b
    db $dd
    sbc $df
    push af
    or $f7
    ld b, $00
    cp $00
    dec b
    ld hl, sp-$07
    ld a, [$fcfb]
    ld c, [hl]
    ld b, $00
    cp $00
    dec b
    ld c, a
    ld l, h
    ld l, l
    ld l, [hl]
    ld l, a
    ld a, c
    ld b, $00
    cp $00
    dec b
    ld a, d
    ld a, e
    ld a, h
    ld a, l
    ld a, [hl]
    ld a, a
    ld b, $00
    cp $00
    ld [$0909], sp
    add hl, bc
    add hl, bc
    add hl, bc
    add hl, bc
    ld a, [bc]
    nop
    cp $fe
    add d
    add c
    nop
    sbc l
    sbc [hl]
    adc e
    sub c
    adc a
    sbc l
    nop
    cp $fe
    nop
    nop
    adc l
    sub [hl]
    adc a
    adc e
    sbc h
    adc a
    adc [hl]
    and a
    cp $ff
    ld bc, $0280
    ld c, a
    inc bc
    nop
    inc b
    ld c, d
    nop
    nop
    dec b
    ld b, c
    nop
    add b
    ld [bc], a
    ld b, a
    inc bc
    nop
    inc b
    ld b, c
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, c
    nop
    nop
    dec b
    add e
    jr nz, jr_008_5dff

jr_008_5dff:
    nop
    add d
    ld l, h
    nop
    ld b, $41
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, c
    nop
    nop
    dec b

jr_008_5e10:
    add e
    dec h
    nop
    nop
    add d
    ld a, c
    nop
    ld b, $41
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, c
    nop
    add b
    ld [$0947], sp
    nop
    ld a, [bc]
    ld b, c
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, e
    nop
    add b
    ld [bc], a
    ld b, e
    inc bc
    nop
    inc b
    ld b, e
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, e
    nop
    rlca
    dec b
    sbc l
    adc a
    sub [hl]
    adc a
    adc l
    sbc [hl]
    ld b, $43
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, e
    nop
    add b
    ld [$0943], sp
    nop
    ld a, [bc]
    ld b, e
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, b
    nop
    add b
    ld [bc], a
    ld c, c
    inc bc
    nop
    inc b
    ld b, b
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, b
    nop
    nop
    dec b
    ld c, d
    nop
    nop
    ld b, $40
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, b
    nop
    nop
    dec b
    ld b, b
    nop
    add b
    rst $00
    add b
    rst $08
    add b
    jr jr_008_5e10

    inc e
    ld b, b
    nop
    nop
    ld b, $40
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, b
    nop
    nop
    dec b
    ld b, b
    nop
    add b
    ret


    add b
    pop de
    add b
    ld a, [de]
    add b
    ld e, $40
    nop
    nop
    ld b, $40
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, b
    nop
    nop
    dec b
    ld c, d
    nop
    nop
    ld b, $40
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, b
    nop
    add b
    ld [$0949], sp
    nop
    ld a, [bc]
    ld b, b
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld d, b
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld d, b
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld d, b
    nop
    nop
    ld b, $4a
    nop
    add b
    ld [$094f], sp
    nop
    ld a, [bc]
    ld c, d
    nop
    rst $38
    nop
    sbc e
    sbc h
    cp $9d
    sbc [hl]
    cp $ff
    nop
    sbc a
    and b
    cp $a1
    and d
    cp $ff
    nop
    and e
    and h
    cp $a5
    and [hl]
    cp $ff
    nop
    and a
    xor b
    cp $a9
    xor d
    cp $ff
    nop
    xor e
    xor h
    cp $ad
    xor [hl]
    cp $ff
    nop
    xor a
    or b
    cp $b1
    or d
    cp $ff
    nop
    or e
    or h
    cp $b5
    or [hl]
    cp $ff
    nop
    or a
    cp b
    cp $b9
    cp d
    cp $ff
    nop
    cp e
    cp h
    cp $bd
    cp [hl]
    cp $ff
    nop
    cp a
    ret nz

    cp $c1
    jp nz, $fffe

    nop
    add b
    sbc c
    sbc b
    rst $38
    nop
    sbc c
    sub b
    sub b
    rst $38
    ld bc, $0280
    ld c, a
    inc bc
    nop
    inc b
    ld c, d
    nop
    nop
    dec b
    ld b, c
    nop
    add b
    ld [bc], a
    ld b, a
    inc bc
    nop
    inc b
    ld b, c
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, c
    nop
    ld [bc], a
    dec b
    xor c
    xor e
    ld b, b
    xor l
    ld bc, $b1af
    ld b, d
    nop
    nop
    ld b, $41
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, c
    nop
    ld [bc], a
    dec b
    xor d
    xor h
    ld b, b
    xor [hl]
    inc bc
    or b
    or d
    sub a
    sbc c
    add b
    adc [hl]
    nop
    ld b, $41
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, c
    nop
    add b
    ld [$0947], sp
    nop
    ld a, [bc]
    ld b, c
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, e
    nop
    add b
    ld [bc], a
    ld b, e
    inc bc
    nop
    inc b
    ld b, e
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, e
    nop
    rlca
    dec b
    sbc l
    adc a
    sub [hl]
    adc a
    adc l
    sbc [hl]
    ld b, $43
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, e
    nop
    add b
    ld [$0943], sp
    nop
    ld a, [bc]
    ld b, e
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, b
    nop
    add b
    ld [bc], a
    ld c, c
    inc bc
    nop
    inc b
    ld b, b
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, b
    nop
    dec b
    dec b
    nop
    adc a
    adc e
    sbc l
    and e
    ld b, l
    nop
    nop
    ld b, $40
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, b
    nop
    nop
    dec b
    ld c, d
    nop
    nop
    ld b, $40
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, b
    nop
    ld bc, $0005
    add b
    sbc b
    inc bc
    sbc h
    sub a
    adc e
    sub [hl]
    ld b, e
    nop
    nop
    ld b, $40
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, b
    nop
    nop
    dec b
    ld c, d
    nop
    nop
    ld b, $40
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, b
    nop
    dec b
    dec b
    nop
    sub d
    adc e
    sbc h
    adc [hl]
    ld b, l
    nop
    nop
    ld b, $40
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, b
    nop
    nop
    dec b
    ld c, d
    nop
    nop
    ld b, $40
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, b
    nop
    ld a, [bc]
    dec b
    nop
    and b
    adc a
    sbc h
    and e
    nop
    sub d
    adc e
    sbc h
    adc [hl]
    ld b, b
    nop
    nop
    ld b, $40
    nop
    nop
    ld b, $4a
    nop
    nop
    dec b
    ld b, b
    nop
    add b
    ld [$0949], sp
    nop
    ld a, [bc]
    ld b, b
    nop
    nop
    ld b, $4a
    nop
    add b
    ld [$094f], sp
    nop
    ld a, [bc]
    ld c, d
    nop
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $9d
    sbc [hl]
    adc e
    sub c
    adc a
    nop
    adc l
    sub [hl]
    adc a
    adc e
    sbc h
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
    nop
    nop
    rst $38
    nop
    ld a, [hl+]
    dec hl
    inc l
    dec l
    ld l, $2f
    jr nc, jr_008_60f3

    nop
    cp $32
    inc sp
    inc [hl]
    dec [hl]
    ld [hl], $37
    jr c, jr_008_6105

    nop
    cp $ff
    nop
    ld a, [hl-]
    cp $3b
    rst $38
    nop
    inc a
    cp $3d
    rst $38
    nop
    ld a, $fe
    ccf
    rst $38
    nop
    ld b, b
    cp $41
    rst $38
    nop
    ld b, d
    cp $43
    rst $38
    nop
    ld b, h
    cp $45
    rst $38
    nop
    ld b, [hl]
    cp $47
    rst $38
    nop

jr_008_60f3:
    ld c, b
    cp $49
    rst $38
    nop
    ld c, d
    cp $4b
    rst $38
    nop
    ld c, h
    cp $4d
    rst $38
    nop
    sbc b
    adc a
    and c

jr_008_6105:
    nop
    sbc h
    adc a
    adc l
    sbc c
    sbc h
    adc [hl]
    cp $9e
    sub e
    sub a
    adc a
    nop
    adc h
    sbc c
    sbc b
    sbc a
    sbc l
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
    sbc l
    adc a
    adc l
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
    sbc d
    sbc [hl]
    sbc l
    cp $ff
    nop
    nop
    and e
    sbc c
    sbc a
    ld [hl], l
    halt
    nop
    nop
    nop
    nop
    cp $74
    ld [hl], h
    ld [hl], h
    ld [hl], h
    ld [hl], h
    ld [hl], h
    ld [hl], h
    ld [hl], h
    ld [hl], h
    ld [hl], h
    cp $70
    ld [hl], b
    ld [hl], b
    ld [hl], b
    ld [hl], b
    ld [hl], b
    ld [hl], b
    ld [hl], b
    ld [hl], b
    ld [hl], b
    cp $ff
    nop
    sbc h
    sub e
    and b
    adc e
    sub [hl]
    rst $38
    nop
    rst $00
    ret z

    cp $c9
    jp z, Jump_000_00ff

    set 1, h
    cp $cd
    adc $ff
    nop
    rst $08
    ret nc

    cp $d1
    jp nc, $02ff

    ld a, [bc]
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    cp $0a
    nop
    rst $38
    nop
    sbc l
    adc a
    sbc [hl]
    nop
    sub a
    adc e
    sbc [hl]
    adc l
    sub d
    rst $38
    nop
    sbc h
    sbc c
    sbc a
    sbc b
    adc [hl]
    rst $38
    ld [bc], a
    ld a, [bc]
    nop
    cp $0a
    nop
    cp $0a
    nop
    rst $38
    ld [bc], a
    ld b, $00
    cp $06
    nop
    cp $06
    nop
    cp $06
    nop
    rst $38
    nop
    xor l
    xor [hl]
    xor a
    or b
    or c
    or d
    cp $b3
    or h
    or l
    or [hl]
    or a
    cp b
    cp $b9
    cp d
    cp e
    cp h
    cp l
    cp [hl]
    cp $bf
    ret nz

    pop bc
    jp nz, $c4c3

    rst $38
    ld [bc], a
    inc b
    nop
    cp $04
    nop
    cp $04
    nop
    cp $04
    nop
    rst $38
    nop
    cp c
    or e
    or a
    cp e
    or c
    cp $ba
    or h
    cp b
    cp h
    or d
    rst $38
    nop
    ld d, $fe
    rla
    rst $38
    nop

jr_008_6203:
    jr jr_008_6203

    add hl, de
    rst $38
    nop
    ld a, [de]
    cp $1b
    rst $38
    nop
    inc e
    cp $1d
    rst $38
    nop
    ld e, $fe
    rra
    rst $38
    nop

jr_008_6217:
    jr nz, jr_008_6217

    ld hl, $00ff
    ld [hl+], a
    cp $23
    rst $38
    nop
    inc h
    cp $25
    rst $38
    nop
    ld h, $fe
    daa
    rst $38
    nop

jr_008_622b:
    jr z, jr_008_622b

    add hl, hl
    rst $38
    nop
    sbc l
    adc a
    sub [hl]
    adc a
    adc l
    sbc [hl]
    cp $fe
    sub [hl]
    adc a
    and b
    adc a
    sub [hl]
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    sub c
    adc e
    sub a
    adc a
    nop
    adc h
    sbc c
    and e
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
    sbc l
    sbc [hl]
    adc e
    sub b
    sub b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    sbc d
    sbc h
    sbc c
    adc [hl]
    sbc a
    adc l
    adc a
    sbc h
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    sbc [hl]
    sbc c
    sbc l
    sub d
    sub e
    sub l
    adc e
    and h
    sbc a
    nop
    sub e
    and c
    adc e
    sbc l
    adc e
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    adc [hl]
    sub e
    sbc h
    adc a
    adc l
    sbc [hl]
    sbc c
    sbc h
    nop
    nop
    nop
    nop
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
    sub l
    adc e
    sbc b
    adc e
    nop
    sub d
    sub e
    sbc h
    adc e
    sbc b
    sbc c
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $ff
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    sbc d
    sbc h
    sbc c
    sub c
    sbc h
    adc e
    sub a
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    and c
    adc e
    sbc [hl]
    adc e
    sbc h
    sbc a
    nop
    sub l
    sub e
    sbc [hl]
    adc e
    sub a
    sbc a
    sbc h
    adc e
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    sbc [hl]
    sbc c
    sbc l
    sub d
    sub e
    sub l
    adc e
    and h
    sbc a
    nop
    sub e
    and c
    adc e
    sbc l
    adc e
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    sub c
    sbc h
    adc e
    sbc d
    sub d
    sub e
    adc l
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
    sub l
    adc e
    sbc b
    adc e
    nop
    sub d
    sub e
    sbc h
    adc e
    sbc b
    sbc c
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
    adc e
    sbc [hl]
    sbc l
    sbc a
    sub a
    sub e
    nop
    sbc [hl]
    adc e
    sub l
    sub e
    sbc b
    sbc c
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    sbc l
    sbc c
    sbc a
    sbc b
    adc [hl]
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
    sub e
    sub l
    sbc a
    nop
    sub a
    sub e
    and h
    sbc a
    sbc [hl]
    adc e
    sbc b
    sub e
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    adc e
    sbc h
    adc l
    adc e
    adc [hl]
    adc a
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
    sbc l
    sbc [hl]
    adc e
    sub b
    sub b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    sub c
    adc e
    sub a
    adc a
    nop
    adc [hl]
    adc a
    sbc l
    sub e
    sub c
    sbc b
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
    sbc [hl]
    adc e
    sbc h
    sbc c
    nop
    sbc l
    adc e
    sbc l
    adc e
    sub d
    adc e
    sbc h
    adc e
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    sbc d
    sbc h
    sbc c
    sub c
    sbc h
    adc e
    sub a
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
    sbc h
    adc a
    sbc h
    sbc c
    sbc h
    adc a
    sbc h
    sbc c
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
    and a
    sub a
    and a
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
    sub c
    sbc h
    adc e
    sbc d
    sub d
    sub e
    adc l
    nop
    adc [hl]
    adc a
    sbc l
    sub e
    sub c
    sbc b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    sbc l
    sbc a
    and h
    sbc a
    sub l
    sub e
    nop
    sbc [hl]
    adc e
    sbc [hl]
    sbc l
    sbc a
    sub d
    sub e
    sbc h
    sbc c
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
    sbc d
    and e
    sbc c
    sbc b
    sub l
    adc a
    and e
    nop
    sub a
    adc e
    sbc [hl]
    sbc l
    sbc a
    sbc c
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp $00
    sbc l
    sub d
    sub e
    sub c
    adc a
    sbc l
    adc e
    and c
    adc e
    nop
    sub d
    sub e
    sbc h
    sbc c
    sbc l
    sub d
    sub e
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    sbc l
    sbc c
    sbc a
    sbc b
    adc [hl]
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
    sbc b
    nop
    sub e
    nop
    sbc l
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
    sub l
    adc e
    and h
    sbc a
    sbc c
    nop
    sbc l
    adc e
    and c
    adc e
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
    rst $38
    nop
    daa
    inc c
    dec c
    inc h
    cp $26
    ld c, $0f
    dec h
    cp $ff
    nop
    daa
    db $10
    ld de, $fe24
    ld h, $12
    inc de
    dec h
    cp $ff
    nop
    daa
    inc d
    dec d
    inc h
    cp $26
    ld d, $17
    dec h
    cp $ff
    nop
    daa
    jr jr_008_691c

    inc h
    cp $26
    ld a, [de]
    dec de
    dec h
    cp $ff
    nop
    daa
    inc e
    dec e
    inc h
    cp $26
    ld e, $1f
    dec h
    cp $ff
    nop
    daa
    jr nz, jr_008_693c

    inc h

jr_008_691c:
    cp $26
    ld [hl+], a
    inc hl
    dec h
    cp $ff
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_008_693c:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Jump_008_73f5:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Call_008_7565:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Call_008_7ff4:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
