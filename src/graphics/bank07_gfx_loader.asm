; ============================================================================
; BANK $07 - Graphics Loader
; ============================================================================
; Address: $4000-$7FFF (switchable)
;
; Graphics loading and tile management routines. Contains decompression
; and loading functions for tile data, plus raw tile data.
;
; Key functions:
;   Call_007_42c1 - Tile loading routine
;   Call_007_42d2 - Tile loading routine
;   Call_007_4308 - Tile loading routine
;
; ============================================================================
; Originally disassembled with mgbdis v3.0 by Matt Currie

SECTION "ROM Bank $007", ROMX[$4000], BANK[$7]

    ld bc, $0078
    call Call_007_42c1
    ld hl, $455f
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ld hl, $456f
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ld hl, $457f
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ld hl, $458f
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ld hl, $459f
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ld hl, $45af
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ld hl, $45bf
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ld hl, $45cf
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ld hl, $45df
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ld hl, $45ef
    ld de, $44ff
    call Call_007_4308
    ld hl, $470f
    ld de, $453f
    call Call_007_4308
    ld hl, $4aed
    ld de, $450f
    call Call_007_4308
    ld hl, $5aed
    ld de, $451f
    call Call_007_4308
    ld hl, $6aed
    ld de, $452f
    call Call_007_4308
    ld hl, $454f
    call Call_007_42d2
    ld bc, $0080
    call Call_007_42c1
    ld hl, $43cf
    call Call_007_42d2
    ret


    ld hl, $455f
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ld hl, $4aed
    ld de, $450f
    call Call_007_4308
    ld hl, $5aed
    ld de, $451f
    call Call_007_4308
    ld hl, $6aed
    ld de, $452f
    call Call_007_4308
    ld hl, $454f
    call Call_007_42d2
    ld bc, $0020
    call Call_007_42c1
    ret


    ld hl, $455f
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ld hl, $43cf
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ret


    ld hl, $455f
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ld hl, $43df
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ret


    ld hl, $455f
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ld hl, $43ef
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ret


    ld hl, $455f
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ld hl, $43ff
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ret


    ld hl, $455f
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ld hl, $449f
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ret


    ld hl, $455f
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ld hl, $440f
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ret


    ld hl, $455f
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ld hl, $441f
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ret


    ld hl, $455f
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ld hl, $442f
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ret


    ld hl, $455f
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ld hl, $443f
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ret


    ld hl, $455f
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ld hl, $444f
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ret


    ld hl, $455f
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ld hl, $445f
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ret


    ld hl, $455f
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ld hl, $446f
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ret


    ld hl, $455f
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ld hl, $447f
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ret


    ld hl, $455f
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ld hl, $448f
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ret


    ld hl, $455f
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ld hl, $44af
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ret


    ld hl, $455f
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ld hl, $44bf
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ret


    ld hl, $455f
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ld hl, $44cf
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ret


    ld hl, $455f
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ld hl, $44df
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ret


    ld hl, $455f
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ld hl, $44ef
    call Call_007_42d2
    ld bc, $0004
    call Call_007_42c1
    ret


Call_007_42c1:
jr_007_42c1:
    ld de, $06d6

jr_007_42c4:
    nop
    nop
    nop
    dec de
    ld a, d
    or e
    jr nz, jr_007_42c4

    dec bc
    ld a, b
    or c
    jr nz, jr_007_42c1

    ret


Call_007_42d2:
    ld a, [hl]
    and $07
    ret z

    ld b, a
    ld c, $00

jr_007_42d9:
    push bc
    ld a, $00
    ldh [c], a
    ld a, $30
    ldh [c], a
    ld b, $10

jr_007_42e2:
    ld e, $08
    ld a, [hl+]
    ld d, a

jr_007_42e6:
    bit 0, d
    ld a, $10
    jr nz, jr_007_42ee

    ld a, $20

jr_007_42ee:
    ldh [c], a
    ld a, $30
    ldh [c], a
    rr d
    dec e
    jr nz, jr_007_42e6

    dec b
    jr nz, jr_007_42e2

    ld a, $20
    ldh [c], a
    ld a, $30
    ldh [c], a
    pop bc
    dec b
    ret z

    call Call_007_43c3
    jr jr_007_42d9

Call_007_4308:
    di
    push de
    call Call_000_0198
    ld a, $e4
    ldh [rBGP], a
    ld de, $8800
    ld bc, $1000
    call Call_007_4345
    ld hl, $9800
    ld de, $000c
    ld a, $80
    ld c, $0d

jr_007_4324:
    ld b, $14

jr_007_4326:
    ld [hl+], a
    inc a
    dec b
    jr nz, jr_007_4326

    add hl, de
    dec c
    jr nz, jr_007_4324

    ld a, $81
    ldh [rLCDC], a
    ld bc, $0005
    call Call_007_42c1
    pop hl
    call Call_007_42d2
    ld bc, $0006
    call Call_007_42c1
    ei
    ret


Call_007_4345:
jr_007_4345:
    ld a, [hl+]
    ld [de], a
    inc de
    dec bc
    ld a, b
    or c
    jr nz, jr_007_4345

    ret


    ld hl, $43b3
    call Call_007_42d2
    call Call_007_43c3
    ldh a, [rP1]
    and $03
    cp $03
    jr nz, jr_007_4398

    ld a, $20
    ldh [rP1], a
    ldh a, [rP1]
    ldh a, [rP1]
    ld a, $30
    ldh [rP1], a
    ld a, $10
    ldh [rP1], a
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ld a, $30
    ldh [rP1], a
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    and $03
    cp $03
    jr nz, jr_007_4398

    ld hl, $43a3
    call Call_007_42d2
    call Call_007_43c3
    sub a
    ret


jr_007_4398:
    ld hl, $43a3
    call Call_007_42d2
    call Call_007_43c3
    scf
    ret


    adc c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    adc c
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

Call_007_43c3:
    ld de, $1b58

jr_007_43c6:
    nop
    nop
    nop
    dec de
    ld a, d
    or e
    jr nz, jr_007_43c6

    ret


    ld d, c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ret nz

    nop
    nop
    nop
    nop
    nop
    nop
    ld d, c
    ld bc, $0200
    nop
    nop
    nop
    nop
    nop
    pop bc
    nop
    nop
    nop
    nop
    nop
    nop
    ld d, c
    inc bc
    nop
    inc b
    nop
    dec b
    nop
    ld b, $00
    jp nz, RST_00

    nop
    nop
    nop
    nop
    ld d, c
    rlca
    nop
    ld [$0900], sp
    nop
    ld a, [bc]
    nop
    jp RST_00


    nop
    nop
    nop
    nop
    ld d, c
    dec c
    nop
    ld c, $00
    nop
    nop
    nop
    nop
    push bc
    nop
    nop
    nop
    nop
    nop
    nop
    ld d, c
    rrca
    nop
    stop
    nop
    nop
    nop
    nop
    add $00
    nop
    nop
    nop
    nop
    nop
    ld d, c
    inc de
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ret nz

    nop
    nop
    nop
    nop
    nop
    nop
    ld d, c
    dec d
    nop
    ld d, $00
    rla
    nop
    jr jr_007_4448

jr_007_4448:
    rst $00
    nop
    nop
    nop
    nop
    nop
    nop
    ld d, c
    inc d
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ret nz

    nop
    nop
    nop
    nop
    nop
    nop
    ld d, c
    inc e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ret nz

    nop
    nop
    nop
    nop
    nop
    nop
    ld d, c
    dec e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ret nz

    nop
    nop
    nop
    nop
    nop
    nop
    ld d, c
    ld e, $00
    rra
    nop
    jr nz, jr_007_4486

jr_007_4486:
    nop
    nop
    ret


    nop
    nop
    nop
    nop
    nop
    nop
    ld d, c
    ld hl, $0000
    nop
    nop
    nop
    nop
    nop
    ret nz

    nop
    nop
    nop
    nop
    nop
    nop
    ld d, c
    dec bc
    nop
    inc c
    nop
    nop
    nop
    nop
    nop
    call nz, RST_00
    nop
    nop
    nop
    nop
    ld d, c
    add hl, de
    nop
    ld a, [de]
    nop
    dec de
    nop
    nop
    nop
    ret z

    nop
    nop
    nop
    nop
    nop
    nop
    ld d, c
    ld [hl+], a
    nop
    inc hl
    nop
    nop
    nop
    nop
    nop
    jp z, RST_00

    nop
    nop
    nop
    nop
    ld d, c
    ld de, $1200
    nop
    nop
    nop
    nop
    nop
    add $00
    nop
    nop
    nop
    nop
    nop
    ld d, c
    ld [hl+], a
    nop
    inc hl
    nop
    nop
    nop
    nop
    nop
    jp z, RST_00

    nop
    nop
    nop
    nop
    ld d, c
    dec c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ret nz

    nop
    nop
    nop
    nop
    nop
    nop
    ld e, c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sbc c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    sbc c
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
    and c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    xor c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp c
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
    ld a, c
    ld e, l
    ld [$0b00], sp
    adc h
    ret nc

    db $f4
    ld h, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, c
    ld d, d
    ld [$0b00], sp
    xor c
    rst $20
    sbc a
    ld bc, $7ec0
    add sp, -$18
    add sp, -$18
    ldh [$ff79], a
    ld b, a
    ld [$0b00], sp
    call nz, Call_000_16d0
    and l
    set 1, c
    dec b
    ret nc

    db $10
    and d
    jr z, jr_007_4619

    inc a
    ld [$0b00], sp
    ldh a, [rNR12]
    and l
    ret


    ret


    ret z

    ret nc

    inc e
    and l
    jp z, Jump_007_79c9

    ld sp, $0008
    dec bc
    inc c
    and l
    jp z, Jump_007_7ec9

    ret nc

    ld b, $a5
    set 1, c
    ld a, [hl]
    ld a, c
    ld h, $08
    nop
    dec bc
    add hl, sp
    call $0c48
    ret nc

    inc [hl]
    and l
    ret


    ret


    add b
    ret nc

    ld a, c
    dec de
    ld [$0b00], sp
    ld [$eaea], a
    ld [$a9ea], a
    ld bc, $4fcd
    inc c
    ret nc

    ld a, c
    db $10
    ld [$0b00], sp
    ld c, h
    jr nz, @+$0a

    ld [$eaea], a
    ld [$60ea], a
    ld [$ffea], a
    ld a, a
    sub h
    ld d, d
    ld c, d
    add hl, hl
    nop
    nop
    rst $38
    ld a, a
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    ld a, a
    nop
    inc a
    nop
    ld e, b
    nop
    ld [hl], b
    rst $38
    ld a, a
    ld a, a
    ld bc, $0000
    sbc a
    inc bc
    rst $38
    ld a, a
    jr nz, @+$81

    add hl, de
    stop
    nop
    rst $38
    ld a, a

jr_007_4619:
    ld a, a
    ld e, d
    ld e, a
    dec [hl]
    nop
    nop
    rst $38
    ld a, a
    ldh [$ff7e], a
    and b
    ld d, b
    nop
    nop
    rst $38
    ld a, a
    ld e, a
    ld d, d
    rra
    add hl, hl
    nop
    nop
    rst $38
    ld a, a
    ld a, a
    cpl
    rst $38
    ld bc, $0000
    rst $38
    ld a, a
    db $ed
    inc bc
    add b
    ld [bc], a
    nop
    nop
    rst $38
    ld a, a
    add b
    ld a, a
    jr nz, @+$7f

    nop
    nop
    rst $38
    ld a, a
    add b
    ld a, a
    jr nz, jr_007_46ca

    nop
    nop
    rst $38
    ld a, a
    sbc a
    inc bc
    ld a, a
    ld bc, $0000
    rst $38
    ld a, a
    ccf
    rla
    cp a
    ld bc, $0000
    rst $38
    ld a, a
    ret nc

    ld a, [hl]
    rra
    inc bc
    nop
    nop
    rst $38
    ld a, a
    nop
    ld a, e
    ldh [$ff78], a
    nop
    nop
    rst $38
    ld a, a
    cp a
    ld b, e
    ccf
    ld [bc], a
    nop
    nop
    rst $38
    ld a, a
    nop
    ld a, e
    ldh [$ff78], a
    nop
    nop
    rst $38
    ld a, a
    ld a, a
    ld e, d
    ld e, a
    dec [hl]
    nop
    nop
    rst $38
    ld a, a
    ld a, a
    ld e, d
    ld e, a
    dec [hl]
    nop
    nop
    rst $38
    ld a, a
    ldh [$ff5b], a
    ldh [$ff2e], a
    nop
    nop
    rst $38
    ld a, a
    ld e, a
    ld d, d
    rra
    add hl, hl
    nop
    nop
    rst $38
    ld a, a
    ld a, a
    cpl
    rst $38
    ld bc, $0000
    rst $38
    ld a, a
    db $ed
    inc bc
    add b
    ld [bc], a
    nop
    nop
    rst $38
    ld a, a
    add b
    ld a, a
    jr nz, jr_007_4732

    nop
    nop
    rst $38
    ld a, a
    ld a, a
    ld bc, $0000
    sbc a
    inc bc
    rst $38
    ld a, a
    jr nz, jr_007_4742

    add hl, de
    stop
    nop
    rst $38
    ld a, a
    ld a, a

jr_007_46ca:
    ld e, d
    ld e, a
    dec [hl]
    nop
    nop
    rst $38
    ld a, a
    ld sp, hl
    inc bc
    add b
    ld [bc], a
    nop
    nop
    rst $38
    ld a, a
    ld a, a
    inc de
    rra
    ld [bc], a
    nop
    nop
    rst $38
    ld a, a
    ld a, a
    inc de
    rra
    ld [bc], a
    nop
    nop
    rst $38
    ld a, a
    add b
    ld a, a
    jr nz, jr_007_476a

    nop
    nop
    rst $38
    ld a, a
    ld e, a
    ld d, d
    rra
    add hl, hl
    nop
    nop
    rst $38
    ld a, a
    ld e, a
    ld d, d
    rra
    add hl, hl
    nop
    nop
    rst $38
    ld a, a
    ld e, a
    ld d, d
    rra
    add hl, hl
    nop
    nop
    rst $38
    ld a, a
    add b
    ld a, a
    jr nz, jr_007_478a

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_007_4732:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_007_4742:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_007_476a:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_007_478a:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld d, l
    ld b, b
    nop
    nop
    nop
    ld d, l
    ld b, b
    nop
    nop
    nop
    ld d, l
    ld b, b
    nop
    nop
    nop
    ld d, l
    ld b, b
    nop
    nop
    nop
    ld d, l
    ld b, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    ld [$aaaa], a
    xor d
    xor e
    ld [$aaaa], a
    xor d
    xor e
    ld [$aaaa], a
    xor d
    xor e
    ld [$aaaa], a
    xor d
    xor e
    ld [$aaaa], a
    xor d
    xor e
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    ret nz

    nop
    nop
    nop
    inc bc
    ret nz

    nop
    nop
    nop
    inc bc
    ret nz

    nop
    nop
    nop
    inc bc
    ret nz

    nop
    nop
    nop
    inc bc
    ret nz

    nop
    nop
    nop
    inc bc
    ret nz

    ld d, l
    ld d, l
    ld d, l
    inc bc
    ret nz

    ld d, l
    ld d, l
    ld d, l
    inc bc
    ret z

    ld d, l
    ld d, l
    ld d, l
    inc hl
    ret z

    ld d, l
    ld d, l
    ld d, l
    inc hl
    ret z

    ld d, l
    ld d, l
    ld d, l
    inc hl
    ret nz

    ld d, l
    ld d, l
    ld d, l
    inc bc
    ret nz

    ld d, l
    ld d, l
    ld d, l
    inc bc
    ret nz

    nop
    nop
    nop
    inc bc
    push de
    nop
    nop
    nop
    inc bc
    push de
    nop
    nop
    nop
    inc bc
    push de
    nop
    nop
    nop
    inc bc
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    dec d
    ld d, l
    ld d, l
    ld d, l
    ld d, h
    dec d
    ld d, l
    ld d, l
    ld d, l
    ld d, h
    dec d
    ld d, l
    ld d, l
    ld d, l
    ld d, h
    dec d
    ld d, l
    ld d, l
    ld d, l
    ld d, h
    dec d
    ld d, l
    ld d, l
    ld d, l
    ld d, h
    dec d
    ld d, l
    ld d, l
    ld d, l
    ld d, h
    dec d
    ld d, l
    ld d, l
    ld d, l
    ld d, h
    dec d
    ld d, l
    ld d, l
    ld d, l
    ld d, h
    dec d
    ld d, l
    ld d, l
    ld d, l
    ld d, h
    dec d
    ld d, l
    ld d, l
    ld d, l
    ld d, h
    dec d
    ld d, l
    ld d, l
    ld d, l
    ld d, h
    dec d
    ld d, l
    ld d, l
    ld d, l
    ld d, h
    dec d
    ld d, l
    ld d, l
    ld d, l
    ld d, h
    dec d
    ld d, l
    ld d, l
    ld d, l
    ld d, h
    dec d
    ld d, l
    ld d, l
    ld d, l
    ld d, h
    dec d
    ld d, l
    ld d, l
    ld d, l
    ld d, h
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec d
    ld d, l
    ld d, h
    nop
    nop
    dec d
    ld d, l
    ld d, h
    nop
    nop
    dec d
    ld d, l
    ld d, h
    nop
    nop
    dec d
    ld d, l
    ld d, h
    nop
    nop
    dec d
    ld d, l
    ld d, h
    nop
    nop
    dec d
    ld d, l
    ld d, h
    nop
    nop
    dec d
    ld d, l
    ld d, h
    nop
    nop
    dec d
    ld d, l
    ld d, h
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    rst $38
    rst $38
    rst $38
    rst $38
    ret nz

    nop
    nop
    nop
    inc bc
    ret nz

    dec b
    ld d, l
    ld d, b
    inc bc
    ret nz

    dec b
    ld d, l
    ld d, b
    inc bc
    ret nz

    nop
    nop
    nop
    inc bc
    jp z, $aaaa

    xor d
    and e
    ret


    ld l, c
    ld l, c
    ld l, c
    ld h, e
    ret


    ld l, c
    ld l, c
    ld l, c
    ld h, e
    jp z, $aaaa

    xor d
    and e
    jp z, $aaaa

    and b
    inc bc
    ret


    ld l, c
    ld l, c
    ld h, b
    inc bc
    ret


    ld l, c
    ld l, c
    ld h, b
    inc bc
    jp z, $aaaa

    and b
    inc bc
    ret nz

    nop
    nop
    nop
    inc bc
    ret nz

    nop
    nop
    nop
    inc bc
    ret nz

    nop
    nop
    nop
    inc bc
    ret nz

    nop
    nop
    nop
    inc bc
    rst $38
    rst $38
    rst $38
    rst $38
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
    nop
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    xor d
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld d, b
    nop
    nop
    ld b, $aa
    sub b
    nop
    nop
    ld b, $aa
    sub b
    nop
    nop
    ld b, $aa
    sub b
    nop
    nop
    ld b, $aa
    sub b
    nop
    nop
    ld b, $aa
    sub b
    nop
    nop
    dec b
    ld d, l
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld b, b
    nop
    nop
    nop
    ld bc, $0040
    nop
    nop
    ld bc, $0040
    nop
    nop
    ld bc, $0040
    nop
    nop
    ld bc, $0040
    nop
    nop
    ld bc, $0040
    nop
    nop
    ld bc, $0040
    nop
    nop
    ld bc, $0040
    nop
    nop
    ld bc, $0040
    nop
    nop
    ld bc, $0040
    nop
    nop
    ld bc, $0040
    nop
    nop
    ld bc, $0040
    nop
    nop
    ld bc, $0040
    nop
    nop
    ld bc, $0040
    nop
    nop
    ld bc, $0040
    nop
    nop
    ld bc, $0040
    nop
    nop
    ld bc, $5555
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    inc a
    cp [hl]
    nop
    add $3b
    cp a
    dec l
    rst $38
    rla
    cp a
    scf
    rst $28
    ld a, h
    db $e3
    rst $38
    nop
    pop bc
    nop
    cp c
    nop
    rst $00
    nop
    sbc a
    inc bc
    rst $38
    rrca
    ld a, a
    rra
    rst $38
    rra
    inc bc
    db $fc
    ld c, $01
    inc bc
    nop
    rst $08
    rst $08
    ldh a, [rIE]
    rst $30
    rst $38
    ld sp, hl
    rst $30
    cp $ff
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    rst $08
    rst $38
    rst $28
    rst $38
    rst $28
    rst $38
    add c
    ldh [$ff1f], a
    sub h
    ld h, b
    ccf
    ccf
    rst $38
    ret nz

    ccf
    db $fc
    jp $fcff


    rst $38
    ld a, a
    rst $38
    rst $38
    nop
    rst $38
    nop
    ret nz

    nop
    ret nz

    ccf
    db $fc
    jp $fcff


    rst $38
    rst $38
    rst $38
    rst $38
    ld de, $e8ee
    ld de, $81c2
    db $fc
    db $fd
    ld [de], a
    inc de
    add b
    add c
    ld [hl], b
    pop af
    sbc h
    db $fd
    rst $38
    nop
    rst $38
    nop
    ld a, a
    nop
    inc bc
    nop
    db $ed
    nop
    rst $38
    nop
    rst $28
    add b
    ei
    ldh [$ff82], a
    ld a, l
    jr @-$7c

    inc e
    adc h
    inc l
    cp a
    ld h, l
    rst $30
    dec de
    sbc e
    adc a
    ld c, a
    ccf
    cp a
    rst $38
    nop
    rst $38
    nop
    di
    nop
    ret nz

    nop
    adc b
    nop
    db $e4
    nop
    ldh a, [rP1]
    ret nz

    nop
    inc bc
    db $fc
    ld c, $01
    inc bc
    nop
    xor d
    ld hl, sp+$27
    rst $28
    add hl, bc
    ret z

    ret z

    rst $00
    and b
    sbc e
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rlca
    nop
    stop
    scf
    nop
    ccf
    nop
    ld a, l
    nop
    ldh [$ff1f], a
    sub h
    ld h, b
    ccf
    ccf
    ld a, [hl-]
    ccf
    inc c
    inc c
    sbc [hl]
    ld l, [hl]
    ld l, e
    or e
    add e
    ld l, l
    rst $38
    nop
    rst $38
    nop
    ret nz

    nop
    ret nz

    nop
    di
    nop
    pop af
    nop
    sbc h
    nop
    cp $00
    ld de, $e8ee
    ld de, $81c2
    db $fc
    db $fd
    ld [de], a
    inc de
    nop
    ld bc, $9190
    call nc, $ffd5
    nop
    rst $38
    nop
    ld a, a
    nop
    inc bc
    nop
    db $ed
    nop
    rst $38
    nop
    ld l, a
    nop
    dec hl
    nop
    rst $38
    sbc a
    sbc c
    ld l, a
    inc de
    rst $38
    inc sp
    rst $28
    inc hl
    rst $38
    ld h, a
    rst $18
    ld h, a
    rst $18
    ld h, a
    rst $18
    rst $38
    ld h, b
    rst $38
    rst $30
    rst $38
    rst $28
    rst $38
    rst $18
    rst $38
    rst $18
    rst $38
    cp a
    rst $38
    cp a
    rst $38
    cp a
    sub c
    rst $38
    cp $ff
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    ld a, [hl]
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    sbc a
    rst $38
    ld l, a
    rst $38
    sub e
    rst $38
    db $ed
    rst $38
    ld a, [$fdff]
    rst $38
    cp $ff
    rst $38
    rst $38
    rst $38
    ld a, a
    rst $38
    sbc a
    rst $38
    rst $28
    rst $38
    di
    rst $38
    db $fd
    rst $38
    cp $ff
    rst $38
    rst $38
    rst $38
    rst $20
    db $fc
    ei
    rst $38
    db $fc
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    ld a, a
    rst $38
    cp a
    rst $38
    ld e, a
    rst $38
    db $fc
    ei
    rst $38
    db $fc
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    ld a, a
    rst $38
    cp a
    ld c, $9e
    ld a, $be
    sbc h
    cp h
    ld [hl], b
    rst $30
    and b
    rst $38
    and c
    rst $38
    sub $ff
    ret c

    rst $38
    pop hl
    nop
    pop bc
    nop
    jp $cf00


    add b
    rst $38
    ret nz

    rst $38
    ret nz

    rst $38
    pop hl
    rst $38
    rst $20
    ld c, e
    inc l
    dec d
    ld e, d
    adc a
    ld d, c
    ld a, [hl]
    add c
    rrca
    rst $38
    ldh a, [rIE]
    inc bc
    rst $38
    ld a, [hl]
    rst $38
    pop af
    nop
    pop hl

jr_007_4cc0:
    nop
    ldh [c], a
    nop
    ldh a, [c]
    nop
    rst $38
    nop
    rst $38
    rrca
    rst $38
    rst $38

jr_007_4ccb:
    rst $38

jr_007_4ccc:
    rst $38
    dec b
    jp z, Jump_007_6582

    jp nc, $c135

    ld [hl-], a
    ld c, c

jr_007_4cd6:
    ld a, [hl-]
    sub c
    adc [hl]
    or b
    rst $08
    sbc e
    add h
    ccf
    nop
    rra
    nop
    rrca
    nop
    rrca

jr_007_4ce4:
    nop
    add a
    nop
    rst $38
    nop
    add e
    nop
    db $fc
    nop
    add [hl]
    add a
    ld b, $07
    and $67
    inc b
    add l
    nop
    add c
    ld b, b
    add c
    jr jr_007_4ce4

    and h
    ld [hl], l
    ld a, c
    nop
    ld sp, hl
    nop
    sbc c
    nop
    ei
    nop
    rst $38
    nop
    rst $38
    nop
    rst $30
    nop
    dec de
    nop
    ld c, $9e
    ld a, $be
    inc e
    cp h
    jr nc, jr_007_4ccc

    dec h
    xor [hl]
    jr nz, jr_007_4cc0

    jr nc, jr_007_4ccb

    jr c, jr_007_4cd6

    pop hl
    nop
    pop bc
    nop
    jp $cf00


    nop
    ret c

    nop
    rst $18
    nop
    rst $08
    nop
    rst $00
    nop
    ld c, e
    inc l
    dec d
    ld e, d
    adc a
    ld d, c
    ld a, [hl]
    add c
    ret z

    jr nc, jr_007_4d6f

    ret z

    ld e, b
    or b
    ld l, h
    sub a
    pop af
    nop
    pop hl
    nop
    ldh [c], a
    nop
    ldh a, [c]
    nop
    rrca
    nop
    ldh a, [rP1]
    rst $08
    nop
    ld [$0500], sp
    jp z, Jump_007_6582

    jp nc, $c135

    ld [hl-], a
    ld c, c
    ld a, [hl-]
    ld de, $308e
    ld c, a
    sbc e
    add h
    ccf
    nop
    rra
    nop
    rrca
    nop
    rrca
    nop
    add a
    nop
    ld a, a
    nop
    add e
    nop
    ld a, h
    nop
    ld b, a
    rst $38

jr_007_4d6f:
    rst $00
    cp a
    add a
    rst $38
    add a
    rst $38
    add a
    ld a, a
    add a
    ld a, a
    add e
    ld a, a
    add e
    ld a, a
    rst $38
    cp a
    rst $38
    ld a, a
    rst $38
    ld a, a
    rst $38
    ld a, a
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    xor a
    rst $38
    xor a
    rst $38
    rst $10
    rst $38
    rst $10
    rst $38
    rst $28
    rst $38
    ld [$cbff], a
    db $fd
    adc [hl]
    rst $30
    rst $38
    rst $18
    rst $38
    rst $18
    rst $38
    rst $28
    rst $38
    rst $28
    rst $38
    rst $30
    rst $38
    rst $30
    rst $38
    or $ff
    ld sp, hl
    jp hl


    rst $38
    push af
    rst $38
    jp hl


    rst $38
    db $d3
    rst $38
    and a
    rst $38
    sbc $7f
    cp e
    db $fd
    rst $28
    or $ff
    rst $30
    rst $38
    ei
    rst $38
    rst $30
    rst $38
    rst $28
    rst $38
    rst $18
    rst $38
    cp a
    rst $38

jr_007_4dea:
    ld a, [hl]
    rst $38
    ld hl, sp-$04
    rst $38
    ld sp, hl
    rst $38
    di
    cp $e7
    db $fc
    sbc h

jr_007_4df6:
    ld hl, sp+$7f
    ldh [rIE], a
    sub b
    ccf
    jr nc, @+$01

    rst $38
    rst $38
    cp $ff
    db $fc
    cp $f9
    rst $38
    ldh [$fff8], a
    add a
    ldh [rIF], a
    ret nz

    rrca
    ret z

    cp a
    ld hl, sp+$0f
    ldh a, [$ff2f]
    adc h
    ld a, d
    ld h, b
    inc e
    add sp, $16
    and [hl]
    ld e, c
    ldh [$ff1f], a
    add a
    nop
    rlca
    nop
    rra
    nop
    rlca
    nop
    rst $38
    nop
    rrca
    nop
    adc e
    nop
    ld l, c
    nop
    jr @-$15

    ret z

    add hl, bc
    nop
    ld bc, $4162
    ld b, b
    ld bc, $6564
    ld h, [hl]
    ld h, l
    ld [hl-], a
    ld sp, $00f7
    rst $30
    nop
    rst $38
    nop
    cp a
    nop
    rst $38
    nop
    sbc e
    nop
    sbc e
    nop
    rst $08
    nop
    jr jr_007_4dea

    sbc b
    ld e, e
    cp h
    ld a, h
    ld e, $8e
    inc a
    cp h
    jr c, @-$45

    jr jr_007_4df6

    add hl, de
    sbc d
    rst $20
    nop
    rst $20
    nop
    jp $f100


    nop
    jp $c700


    nop
    and $00
    and $00
    ld d, a
    cp b
    rlca
    ld hl, sp+$07
    ld hl, sp+$3f
    ld b, b
    ld [$11f0], sp
    add sp, -$69
    ld l, b
    ld c, a
    or b
    ld [$fc00], sp
    nop
    adc h
    nop
    ret nz

    nop
    rst $38
    nop
    ld b, a
    nop
    ld h, $00
    ld h, b
    nop
    ret z

    ccf
    ld hl, sp+$0f
    ldh a, [$ff2f]
    adc h
    ld a, d
    ld h, b
    inc e
    add sp, $16
    and [hl]
    ld e, c
    ldh [$ff1f], a
    rlca
    nop
    rlca
    nop
    rra
    nop
    rlca
    nop
    rst $38
    nop
    rrca
    nop
    adc e
    nop
    ld l, c
    nop
    add e
    ld a, a
    add e
    ld a, a
    add e
    ld a, a
    pop bc
    ccf
    ret nz

    ccf
    ret nz

    cp a
    ldh [$ff9f], a
    ldh [$ff9f], a
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    ld a, a
    rst $38
    ld a, a
    rst $38
    ld a, a
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    db $fc
    rst $38
    nop
    rst $38
    inc bc
    db $fd
    ld b, $ff
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    cp $ff
    ld sp, hl
    cp $ff
    db $fc
    rst $38
    db $e3
    db $fd
    adc [hl]
    rst $30
    dec sp
    rst $18
    rst $28
    ld a, a
    cp l
    rst $38
    halt
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    cp $ff
    ld sp, hl
    rst $38
    rst $20
    rst $38
    sbc a
    rst $38
    ld a, [hl]
    cp $f9
    dec sp
    rst $18
    db $ed
    ld a, a
    or [hl]
    rst $38
    db $eb
    db $fc
    rst $10
    ld hl, sp+$6f
    ldh a, [$ff9f]
    ldh [$ff3f], a
    ret nz

    rst $38
    rst $20
    rst $38
    sbc [hl]
    cp $79
    ld hl, sp-$09
    ldh a, [$ffef]
    ldh [$ff9f], a
    add b
    ld a, a
    nop

jr_007_4f2c:
    rst $38
    ccf
    cp $dd
    db $e3
    rst $38
    nop
    rst $38
    inc c
    rst $38
    ld e, $ff
    ld e, $ff
    ld c, $ff
    nop
    rst $38
    ret nz

    pop bc
    ld a, $00
    rst $38
    inc c
    rst $38
    ld e, $ff
    ld e, $ff
    ld c, $ff
    nop
    rst $38
    cp [hl]
    inc a
    push bc
    add h
    ld h, a
    ret nz

    ld a, $e1
    cp c
    ld h, [hl]
    sbc b
    ld [hl], b
    rst $18
    jr nc, jr_007_4f2c

    ccf
    jp $fa00


    nop
    ld a, a
    add b
    ccf
    ret nz

    ccf
    ret nz

    rra
    ldh [$ff1f], a
    ldh [$ff1f], a
    ldh [$ff84], a
    ld a, e
    ret nz

    ld a, $9e
    ld [hl], l
    adc $31
    ld a, $20
    ld h, b
    ld [hl], b
    rst $18
    nop
    nop
    rst $38
    db $fd
    nop
    ccf
    nop
    db $e3
    nop
    rst $38
    nop
    rst $18
    nop
    adc a
    nop
    rst $38
    nop
    rst $38
    nop
    nop
    inc bc
    nop
    ld bc, $11f2
    jp nc, $1611

    ld de, $6166
    ld e, $01
    ld bc, $fffe
    nop
    rst $38
    nop
    rst $28
    nop
    rst $28
    nop
    rst $28
    nop
    sbc a
    nop
    rst $38
    nop
    rst $38
    nop
    add b
    ld b, c
    ld [$1b88], sp
    sub e
    sub a
    ld d, e
    rra
    sub a
    rra
    add [hl]
    ld e, b
    add b
    sub b
    ld l, a
    rst $38
    nop
    rst $30
    nop
    db $ec
    nop
    db $ec
    nop
    add sp, $00
    ld sp, hl
    nop
    rst $38
    nop
    rst $38
    nop
    ld [bc], a
    db $fc
    ld bc, $3f3c
    ld l, b
    ld c, $41
    ld bc, $003e
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    nop
    cp $00
    rst $00
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ldh a, [$ff8f]
    rst $38
    ld b, b
    rst $38
    ld b, a
    rst $38
    ld a, b
    rst $38
    ld b, b
    rst $38
    rlca
    ld hl, sp+$7f
    ei
    db $fc
    rst $38
    ld a, a
    rst $38
    cp a
    rst $38
    cp b
    rst $38
    add a
    rst $38
    cp a
    rst $38
    ld hl, sp-$08
    add a
    ld hl, sp+$07
    ld a, e
    sbc a
    rst $28
    rst $38
    pop hl
    rra
    cp $0f
    ldh a, [$ff7f]
    add e
    db $fc
    rra
    ldh [$ff3f], a
    ret nz

    rst $38
    rst $20
    rst $38
    rra
    rst $38
    cp $fe
    pop af
    ldh a, [$ff8f]
    add b
    ld a, a
    nop
    rst $38
    nop
    rst $38
    ret c

    rst $38
    ld h, c
    cp $87
    ld hl, sp+$1e
    pop hl
    ld a, [hl]
    add c
    db $fc
    inc bc
    db $fd
    inc bc
    ld sp, hl
    rlca
    ld hl, sp-$19
    ldh [$ff9f], a
    add b
    ld a, a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld bc, $01fe
    cp $1f
    ldh [$ff1f], a
    ldh [rIF], a
    ldh a, [rTAC]
    ld hl, sp+$01
    cp $f8
    rst $38
    db $fc
    rst $38
    cp $ff
    nop
    rst $38
    nop
    rst $38

jr_007_5061:
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld hl, sp+$07
    db $fc
    inc bc
    cp $01
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    cp $01
    db $fc
    inc bc
    ld h, c
    sbc a
    ld b, $ff
    ld [$00fb], sp
    rst $38
    nop
    rst $38
    nop

jr_007_5082:
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld bc, $07fe
    ld hl, sp+$0f
    ldh a, [$ff9f]
    ld a, a
    cp a
    ld a, a
    inc l
    rst $38
    ld e, a
    ldh a, [c]
    rst $18
    ldh a, [c]
    call z, $ffff
    rst $38
    rst $38
    rst $38
    db $10
    rst $28
    jr nz, jr_007_5061

    jr nz, jr_007_5082

    ld b, b
    cp a
    add b
    ccf
    nop
    cp a
    nop
    add b
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    nop
    rst $38
    rst $38
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    rst $38
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
    rst $38
    nop
    nop
    nop
    rst $38
    rst $38
    ld bc, $fdff
    inc bc
    db $fd
    inc bc
    ld bc, $ffff
    rst $38
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
    rst $38
    nop
    nop
    nop
    ld a, [hl]
    ld a, [hl]
    ld b, d
    ld a, [hl]
    ld b, d
    ld h, [hl]
    ld e, d
    ld e, d
    ld e, d
    ld e, d
    ld b, d
    ld h, [hl]
    ld e, d
    ld h, [hl]
    rst $38
    nop
    add c
    nop
    add c
    nop
    sbc c
    nop
    and l
    nop
    and l

jr_007_5108:
    nop
    sbc c
    nop
    add c
    nop
    ld a, b
    rst $38
    jr @+$01

    ld [$00ff], sp
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld a, b
    add a
    jr jr_007_5108

    ld [$00f7], sp
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld a, a
    add b
    ld a, a
    add b
    ld a, a
    add b
    ccf
    ret nz

    ccf
    ret nz

    rra
    ldh [rTAC], a
    ld hl, sp+$00
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    di
    rrca
    rst $30
    rrca
    rst $30
    rrca
    ei
    rlca
    ei
    rlca
    ei
    rlca
    db $fd
    inc bc
    ld a, [hl]
    add c
    inc bc
    db $fc
    rlca
    ld hl, sp+$07
    ld hl, sp+$03
    db $fc
    inc bc
    db $fc
    inc bc
    db $fc
    ld bc, $00fe
    rst $38
    cp $ff
    cp $ff
    db $fc
    rst $38
    db $fd
    cp $f3
    db $fc
    rst $28
    ldh a, [$ffde]
    pop hl
    cp b
    rst $00
    cp $01
    cp $01
    db $fc
    inc bc
    db $fc
    inc bc
    ldh a, [rIF]
    ldh [$ff1f], a
    ret nz

    ccf
    add b
    ld a, a
    ld [$08f9], sp
    ld sp, hl
    ld d, b
    or c
    call nc, $ae35
    ld a, a
    xor [hl]
    ld a, a
    ld c, d
    rst $18
    and d
    cp a
    rrca
    ldh a, [rIF]
    ldh a, [$ff1f]
    ldh [rNR31], a
    ldh [rNR42], a
    ret nz

    ld hl, $61c0
    add b
    pop bc
    nop
    ld a, [hl]
    ld a, [hl]
    ld b, d
    ld a, [hl]
    ld e, d
    ld h, [hl]
    ld e, d
    ld h, [hl]
    ld e, d
    ld h, [hl]
    ld e, d
    ld h, [hl]
    ld e, d
    ld h, [hl]
    ld e, d
    ld h, [hl]
    add c
    nop
    add c
    nop
    add c
    nop
    add c
    nop
    add c
    nop
    add c
    nop
    add c
    nop
    add c
    nop
    ld e, d
    ld h, [hl]
    ld e, d
    ld h, [hl]
    ld e, d
    ld h, [hl]
    ld e, d
    ld h, [hl]
    ld e, d
    ld h, [hl]
    ld e, d
    ld h, [hl]
    ld e, d
    ld h, [hl]
    ld e, d
    ld h, [hl]
    add c
    nop
    add c
    nop
    add c
    nop
    add c
    nop
    add c
    nop
    add c
    nop
    add c
    nop
    add c
    nop
    ldh [rIE], a
    db $10
    rst $38
    inc c
    rst $28
    inc bc
    ld [hl], a
    ld bc, $0103
    ld h, e
    ld [bc], a
    ld b, a
    inc b
    rlca
    ldh [$ff1f], a
    ld [hl], b
    rrca
    inc a
    inc bc
    adc a
    nop
    rst $38
    nop
    sbc a
    nop
    cp a
    ld bc, $03ff
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    rst $38
    rst $38
    cp $03
    ld b, $fb
    ld b, $fb
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    rst $38
    nop
    rst $38
    db $fd
    rst $38
    db $fd
    rst $38
    db $fd
    rlca
    rst $38
    jr @+$01

    jr nz, @+$01

    ret nz

    rst $38
    ld [hl], b
    rst $38
    inc c
    rst $38
    inc bc
    rst $38
    nop
    rst $38
    rlca
    ld hl, sp+$1f
    rst $20
    ccf
    rst $18
    rst $38
    ccf
    rst $38
    adc a
    rst $38
    di
    rst $38
    db $fc
    rst $38
    rst $38
    jp Jump_000_3eff


    db $fd
    ld [hl], $fd
    ld [hl], $fd
    ld a, [hl]
    db $fd
    ld a, a
    rst $38
    ld a, l
    rst $38
    db $dd
    rst $38
    jp $ff3c


    jp $fbff


    rst $38

jr_007_5264:
    ei
    rst $38
    ei
    rst $38
    ld hl, sp-$01
    cp $ff
    ld a, $8a
    rst $38
    cp b
    and l
    ld e, b
    pop bc
    ld e, b
    pop de
    inc l
    db $e3
    jr z, jr_007_5264

    and [hl]
    ld h, c
    sub b
    ld [hl], e
    add c
    nop
    jp $e700


    add b
    rst $20
    add b
    di
    ret nz

    rst $30

jr_007_5288:
    ret nz

    ld sp, hl

jr_007_528a:
    ret nz

    db $fd
    ldh [rDIV], a
    adc a
    ld [$08df], sp
    cp a
    db $10
    cp a
    db $10
    cp a
    jr nc, jr_007_5288

    jr nc, jr_007_528a

    ld [hl], b
    rst $28
    rst $38
    inc bc
    cp a
    rlca
    rst $38
    rlca
    rst $38
    rrca
    rst $38
    rrca
    rst $38
    rra
    rst $38
    rra
    rst $38
    rra
    inc c
    rst $30
    inc e
    rst $28
    ld de, $12ff
    rst $38
    inc c
    rst $38
    dec c
    or $0d
    or $0d
    or $ff
    ei
    rst $38
    di
    rst $38
    xor $fe
    db $ed
    db $fc
    di
    db $fc
    ei
    db $fc
    ei
    db $fc
    ei
    rrca
    rst $38
    rlca
    rst $38
    jp $31ff


    rst $38
    db $ec
    rra
    ldh a, [c]
    rrca
    db $fd
    inc bc
    db $fd
    inc bc
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    ccf
    ccf
    rst $08
    rrca
    di
    inc bc
    db $fd
    ld bc, $01fe
    cp $af
    rst $38
    sub $ff
    rst $28
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rra
    rst $38
    ld sp, $e6ff
    rst $38
    rst $38
    sbc $ff
    rst $28
    rst $38
    rst $30
    rst $38
    rst $30
    rst $38
    rst $30
    rst $38
    rst $30
    rst $38
    adc $ff
    add hl, de
    sub h
    ld [hl], e
    db $f4
    di
    ld [hl], b
    sub a
    ret nc

    pop af
    cp h
    db $fd
    ld b, e
    rst $38
    cp b
    rst $38
    ld a, a
    rst $38
    ei
    ldh [$fff9], a
    nop
    ld sp, hl
    ldh [rIE], a
    ldh [rIE], a
    ret nz

    rst $38
    cp h
    rst $38
    ld a, a
    rst $38
    rst $38
    db $db
    rst $20
    db $db
    rst $20
    db $db
    rst $20
    db $db
    rst $20
    db $db
    rst $20
    db $db
    rst $20
    db $db
    rst $20
    dec sp
    rst $20
    nop
    cp l
    nop
    cp l
    nop
    cp l
    nop
    cp l
    nop
    cp l
    nop
    cp l
    ret nz

    dec a
    ldh [$ffdd], a
    ld hl, sp-$61
    adc [hl]
    ld [hl], a
    inc bc
    db $fd
    ld bc, $00fe
    rst $38
    nop
    rst $38
    nop
    rst $38
    ret nz

    ccf
    rst $38
    ld h, a
    rst $38
    ld sp, hl
    rst $38
    cp $ff
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    inc c
    rst $30
    inc c
    rst $30
    cp $ff
    rst $38
    ld bc, $ff01
    ld bc, $02ff
    rst $38
    ld [bc], a
    rst $38
    db $fc
    ei
    db $fc
    ei
    cp $01
    rst $38
    cp $ff
    cp $ff
    cp $fe
    db $fd
    cp $fd
    cp $03
    db $fc
    inc bc
    ld a, a
    add b
    ld a, a
    add b
    ld a, l
    add e
    ld a, l
    add e
    ld a, [hl]
    add c
    db $ec
    cp a
    ld [bc], a
    db $fd
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld bc, $01fe
    cp $00
    rst $38
    xor h
    ld d, e
    add hl, de
    rst $38
    rst $10
    ccf
    rst $18
    ccf
    ld l, a
    rst $38
    add a
    rst $38
    rlca
    rst $38
    add c
    rst $38
    add b
    rst $38
    rra
    rst $20
    rra
    rst $28
    rra
    rst $28
    ld a, a
    sbc a
    rst $38
    ld a, a
    rst $38
    rst $38
    rst $38
    ld a, a
    rst $38
    ld a, a
    rst $38
    rst $38
    rst $38
    rst $38
    cp $ff
    db $fd
    rst $38
    ldh a, [c]
    cp $ed
    db $fd
    or a
    rst $30
    ld e, a
    rst $18
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    cp $ff
    db $fd
    cp $f3
    ld hl, sp-$31
    ldh [$ffbf], a
    cp e
    rst $20
    ld a, e
    rst $30
    xor e
    xor a
    ld [hl], a
    ld [hl], a
    ei
    ei
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    ldh [$ffdd], a
    ldh a, [$ff8d]

jr_007_5401:
    ret c

    ld [hl], l
    adc h
    ld sp, hl
    ld h, $fd
    ld [de], a
    db $fd
    ld [de], a
    db $fd
    ld [bc], a
    db $fd
    ldh a, [$ffcf]
    ccf
    jr nc, jr_007_5401

    rst $28
    ld hl, sp-$08
    cp $fe
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    ccf
    rst $38
    rst $08
    rra
    ldh a, [rTAC]
    rst $38
    add c
    rst $38
    ldh [rIE], a
    nop
    rst $38
    nop
    rst $38
    ld [bc], a
    rst $38
    ld bc, $f8ff
    rlca
    rst $38
    rst $38
    nop
    nop
    ret nz

    ret nz

    db $fc
    db $fc
    db $e3
    db $e3
    cp $fd
    rst $38

jr_007_5440:
    cp $ff
    rst $38
    rst $38
    nop
    rst $38
    rst $38
    ccf
    rst $38
    inc bc
    rst $38

jr_007_544b:
    rra
    db $fc
    and e
    rst $38
    sub d
    rst $38
    ld a, a
    rst $38
    and c
    or d
    add hl, hl

jr_007_5456:
    ld a, [hl-]
    ld d, c
    ld c, [hl]
    ldh a, [$ff8f]
    db $db
    inc b
    and e
    ld e, h
    sub e
    ld l, l
    rst $38
    add b
    rst $28

jr_007_5464:
    ld b, b
    rst $20
    ret nz

    rst $38
    add b

jr_007_5469:
    add e
    ld b, b
    inc a
    ret nz

    add a
    rst $38
    jr c, jr_007_5469

    add $c6
    dec b
    add l
    nop

jr_007_5476:
    add c
    ld b, b
    add c
    jr jr_007_5464

    and h
    ld [hl], l
    rst $38
    ld a, b
    rst $38
    rst $00
    rst $38
    ld bc, $00fb
    rst $38
    nop
    rst $38
    nop
    rst $30
    nop
    dec de
    nop
    cp a
    cp a
    ccf
    ccf
    rra

jr_007_5492:
    rra
    add b
    add b
    ld a, a
    rst $38
    jr nz, jr_007_5440

    jr nc, jr_007_544b

    jr c, jr_007_5456

    ret nz

    ld a, a
    ret nz

    rst $38
    ldh [rIE], a
    rst $38
    ld a, a
    rst $38
    nop
    rst $18
    nop
    rst $08
    nop
    rst $00
    nop
    ei
    ei
    rst $30
    rst $30
    db $eb
    rst $28
    dec sp
    scf
    db $db
    rst $20
    db $db

jr_007_54b8:
    rst $20
    db $db
    rst $20
    db $db
    rst $20
    ld b, $fd
    inc c
    ld sp, hl
    jr jr_007_54b8

    ldh a, [$ffcd]
    ret nz

    dec a
    nop
    cp l
    nop
    cp l
    nop
    cp l
    db $fc
    db $fc
    nop
    nop
    rlca
    rlca
    cp $f8
    inc a
    cp h
    jr c, jr_007_5492

    jr jr_007_5476

    add hl, de
    sbc d
    inc bc
    rst $38
    rst $38
    rst $38
    rst $38
    ld hl, sp-$07
    ld b, $c3
    nop
    rst $00
    nop
    and $00
    and $00
    rrca
    inc c
    ld a, a
    ld [hl], b
    rst $38
    add b
    ccf
    ld b, b
    ld [$11f0], sp
    add sp, -$69
    ld l, b
    ld c, a
    or b
    db $fc
    di
    ldh a, [$ff8f]
    add b
    ld a, a
    ret nz

    nop
    rst $38
    nop
    ld b, a
    nop
    ld h, $00
    ld h, b
    nop
    ld [bc], a
    db $fc
    ld bc, $3f3c
    ld l, b
    ld c, $41
    ld bc, $003e
    nop
    rst $38
    nop
    inc bc
    rst $38
    rst $38
    nop
    cp $00
    rst $00
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    add h
    ld a, e
    ret nz

    ld a, $9e
    ld [hl], l
    adc $31
    ccf
    daa
    ld a, e
    ld a, h
    rst $18
    ldh [$ff7f], a
    add b
    db $fd
    nop

jr_007_553f:
    ccf
    nop
    db $e3
    nop
    rst $38
    nop
    rst $18
    rlca
    cp b
    ccf
    ret nz

    rst $38
    nop
    rst $38
    nop
    inc bc
    nop
    ld bc, $11f2
    rst $38
    rst $38
    nop
    rst $38
    di
    rrca
    call z, Call_000_333f
    db $fc
    rst $38
    nop
    rst $38
    nop
    rst $28
    nop
    rst $38
    rst $38
    nop
    rst $38
    inc bc
    rst $38
    inc c
    rst $38
    jr nc, @+$01

    add b
    ld b, c
    ld [$1b88], sp
    sub e
    rst $38
    ei
    add a
    cp $f9
    add a
    ld e, b
    rst $20
    jr nc, @+$01

    rst $38
    nop
    rst $30
    nop
    db $ec
    nop
    db $fc
    ld hl, sp-$79
    cp $81
    rst $38
    ld b, b
    rst $38
    jr nc, @+$01

    ld [bc], a
    db $fc
    ld bc, $3f3c
    ld l, b
    ld c, $41
    ld bc, $003e
    nop
    cp a
    add b
    ret nz

    rst $38
    rst $38
    nop
    cp $00
    rst $00
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld e, d
    ld h, [hl]
    ld e, d
    ld h, [hl]
    ld e, d
    ld h, [hl]
    ld e, e
    ld h, a
    sbc $e6
    ld a, b
    ld hl, sp-$78
    ld a, b
    ret z

    jr c, jr_007_553f

    nop
    add c
    nop
    add c
    nop
    add b
    ld bc, $8701
    add a
    ld a, a

jr_007_55c9:
    rst $30
    rrca
    rst $30
    rrca
    dec c
    cp $37
    jr c, jr_007_5631

    ld h, b
    cp a
    ret nz

    ld a, a
    ret nz

    ccf
    ldh [rNR22], a
    ld hl, sp+$0c
    rst $38
    db $fc
    inc bc
    ldh a, [rIF]
    ret nz

    ccf
    add b
    ld a, a
    ret nz

    cp a
    ldh [$ffdf], a
    ldh a, [$ffef]
    db $fc
    di
    db $fc
    inc bc
    ei
    rlca
    db $f4
    rrca
    jp hl


    ld e, $d3
    inc a
    and a
    ld a, b
    ld c, a
    ldh a, [$ff9f]
    ldh [rIE], a
    nop
    db $fc
    inc bc
    ei
    inc b
    rst $30
    ld [$10ef], sp
    rst $18
    jr nz, jr_007_55c9

    ld b, b
    ld a, a
    add b
    rst $18
    ldh [$ff7f], a
    add b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ccf
    ret nz

    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    adc a
    ld a, a
    pop hl
    rra

jr_007_5631:
    ldh [$ff1f], a
    ldh a, [rIF]
    ldh a, [rIF]
    ldh a, [rIF]
    ldh a, [rIF]
    ldh a, [rIF]
    ldh a, [rIF]
    cp $01
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    or c
    cp $08
    ld sp, hl
    add [hl]
    db $fd
    add d
    rst $38
    add c
    rst $38
    ld b, c
    rst $38
    ld b, b
    rst $38
    ld b, b
    rst $38
    cp a
    ldh a, [rIF]
    ld hl, sp-$79
    db $fc
    add e
    cp $81
    rst $38
    ld b, c
    rst $38
    ld b, b
    rst $38
    ld b, b
    rst $38
    db $e4
    inc e
    ldh a, [c]
    ld c, $f9
    rlca
    db $fc
    inc bc
    rst $38
    nop
    ccf
    ret nz

    rst $28
    ldh a, [rNR33]
    ld e, $fb
    rlca
    db $fd
    inc bc
    cp $01
    rst $38
    nop
    rst $38
    nop

jr_007_5687:
    rst $38
    nop
    rra
    ldh [$ff03], a
    db $fc
    inc bc
    inc bc
    nop
    nop
    nop
    nop
    ret nz

    ret nz

    jr nc, jr_007_5687

    call z, $f33c
    rrca
    db $fc
    inc bc
    db $fc
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    ccf
    rst $38
    rst $08
    ccf
    di
    rrca
    db $fc
    inc bc
    rst $38
    nop
    rra
    ldh [$ffcf], a
    ldh a, [$ff33]
    inc a
    inc c
    rrca
    inc bc
    inc bc
    nop
    nop
    nop
    nop
    ret nz

    ret nz

    rst $38
    nop
    ccf
    ret nz

    rst $08
    ldh a, [$fff3]
    db $fc
    db $fc
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    ccf
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld a, a
    add b
    sbc a
    ldh [$ff63], a
    ld a, h
    inc e
    rra
    rlca
    rlca
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld a, a
    add b
    sbc a
    ldh [$ffe3], a
    db $fc
    ld hl, sp-$01
    ldh a, [rIF]
    ldh a, [rIF]

jr_007_56f1:
    ldh a, [rIF]
    ldh a, [rIF]
    ldh a, [rIF]
    ldh a, [rIF]
    ldh [$ff1f], a
    nop
    rst $38
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop

jr_007_5703:
    rst $38
    nop

jr_007_5705:
    rst $38
    nop

jr_007_5707:
    rst $38
    nop

jr_007_5709:
    rst $38
    nop

jr_007_570b:
    rst $38
    nop
    ld b, b
    rst $38
    ld b, b
    rst $38
    jr nz, @+$01

    jr nz, @+$01

    jr nz, @+$01

    jr nz, @+$01

    jr nz, @+$01

    jr nz, @+$01

    cp a
    ld b, b
    cp a
    ld b, b
    rst $18
    jr nz, jr_007_5703

    jr nz, jr_007_5705

    jr nz, jr_007_5707

    jr nz, jr_007_5709

    jr nz, jr_007_570b

    jr nz, jr_007_56f1

    jp $f8f8


    cp $fe
    ld hl, sp-$08
    pop af
    pop af
    ldh [c], a
    db $e3
    call z, $94cf
    sub a
    ret nz

    ccf
    ld hl, sp+$07
    cp $01
    ld hl, sp+$07
    ldh a, [rIF]
    ldh [rNR34], a
    ret nz

    inc a
    add b
    ld a, h
    cp a
    ret nz

    ld l, a
    ld [hl], b
    add hl, de
    ld e, $66
    ld a, a
    pop bc
    rst $38
    ld bc, $6cff
    sbc a
    sbc $3f
    ld a, a
    add b
    rra
    ldh [rTAC], a
    ld hl, sp+$01
    and $00
    pop bc
    nop
    ld bc, $0c00
    nop
    ld e, $30
    ldh a, [$ffcc]
    inc a
    di
    rrca
    ld a, [hl]
    add c
    rst $08
    ldh a, [$ff79]
    cp $46
    rst $00
    ld [hl], c
    pop af
    rst $08
    ccf
    di
    rrca
    db $fc
    inc bc
    rst $38
    nop
    ccf
    ret nz

    rlca
    ld a, b
    ld bc, $307e
    ld c, a
    ld bc, $0001
    nop
    add b
    add b
    ld [hl], b
    ldh a, [$ff8f]
    ld a, a
    add c
    ld a, a
    nop
    rst $38
    ret nz

    rst $38
    cp $ff
    rst $38
    rst $38
    ld a, a
    rst $38
    adc a
    ld a, a
    ldh a, [rIF]
    cp $01
    rst $38
    nop
    ccf
    ret nz

    ldh [rIE], a
    ld a, [hl]
    ld a, a
    ld a, a
    ld a, a
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    ccf
    rst $38
    rlca
    rst $38
    rra
    ldh [$ff81], a
    cp $80
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ret nz

    ccf
    ld hl, sp+$07
    jr nz, @+$01

    jr nz, @+$01

    pop hl
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $18
    jr nz, @-$1f

    jr nz, jr_007_5800

    pop hl
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    ld h, $27
    ld e, d
    ld e, e
    cp d
    cp e
    rst $38
    db $fd
    cp $fd
    cp $fd
    db $fc
    rst $38
    ld e, e
    ld a, e
    nop
    cp $18

jr_007_5800:
    and $38
    add $78
    add l
    ld a, b
    add h
    ld a, b
    add h
    ld c, b
    or h
    adc b
    ld d, a
    cp $33
    cp $0f
    ld a, e
    cp [hl]
    ld [hl], e
    cp [hl]
    rst $30
    sbc [hl]
    rst $30
    sbc h
    di
    sbc h
    ld a, l
    sbc [hl]
    inc c
    ld a, $3c
    ld a, $3c
    ld a, $3c
    ld a, $18
    sbc [hl]
    ld a, [de]
    sbc [hl]
    ld e, $9e
    ld e, $1e
    ld a, h
    db $fc
    ccf
    rst $38
    ld a, $fe
    inc a
    db $fc
    cp c
    ld a, c
    sub e
    ld [hl], e
    call nc, $e837
    rra
    inc a
    ld b, e
    rra
    jr nz, jr_007_5860

    ld hl, $231c
    jr jr_007_586e

    nop
    rra
    nop
    inc e
    nop
    ld [$3f3c], sp
    adc e
    adc a
    ldh a, [rIE]
    db $e4
    rst $38
    adc $ff
    rst $10
    db $ed
    cp l
    add $3c
    rst $00
    inc bc
    db $fc
    add b

jr_007_5860:
    ld a, e
    ldh [rNR10], a
    ret nz

    inc h
    add b
    ld c, [hl]
    adc d
    ld c, a
    inc bc
    add a
    inc bc
    rlca
    nop

jr_007_586e:
    rst $38
    add b
    rst $38
    ld [hl], b
    rst $38
    rra
    rst $38
    ld [de], a
    cp $0b
    rst $38
    adc e
    rst $38
    bit 7, a
    rst $38
    nop
    ld a, a
    add b
    rrca
    ld [hl], b
    nop
    rra
    nop
    inc de
    ld bc, $010a
    adc d
    add c
    jp z, $ff7f

    rlca
    rst $38
    nop
    rst $38
    nop
    rst $38
    ldh [rIE], a
    ld e, $1f
    pop hl
    pop hl
    ld hl, sp-$08
    add b
    ld a, a
    ld hl, sp+$07
    rst $38
    nop
    rst $38
    nop
    rra
    ldh [rSB], a
    cp $e0
    rra
    ld hl, sp+$07
    ld e, d
    ld a, e
    ld a, h
    ld a, a
    ld a, l
    ld a, [hl]
    ld a, h
    ld a, a
    ld a, [hl]
    ld a, a
    ld b, e
    ld a, a
    ld e, d
    ld h, a
    cp e
    add $88
    ld d, $98
    inc h
    sbc b
    inc h
    sbc b
    inc h
    add b
    ld a, $bc
    ld b, e
    cp h
    ld b, d
    ld a, h
    add d
    ld a, c
    adc [hl]
    rst $38
    ld [$01ff], sp
    cp $03
    ld a, [hl]
    add e
    cp [hl]
    pop bc
    ld e, a
    ldh [$ff3f], a
    ldh [rNR34], a
    ld e, $04
    inc c
    nop
    ld bc, $0200
    nop
    ld [bc], a
    nop
    add b
    nop
    ld b, b
    nop
    jr nz, @-$1b

    inc e
    rst $30
    ld [$40bf], sp
    sbc a
    ld h, b
    rra
    ldh [$ff3f], a
    ret nz

    rst $38
    nop
    rst $38
    ret nz

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ret nz

    ld [hl], l
    adc a
    db $fd
    rlca
    db $fd
    rrca
    rst $38
    add hl, bc
    rst $30
    dec bc
    rst $38
    rlca
    rst $30
    inc c
    ld hl, sp+$07
    dec bc
    rrca
    dec bc
    rrca
    inc bc
    rrca
    rlca
    rrca
    rrca
    rrca
    rlca
    rlca
    ld [bc], a
    ld b, $00
    nop
    ld b, e
    rst $38
    jp $c3ff


    rst $38
    jp $83ff


    rst $38
    add e
    rst $38
    nop
    rst $38
    nop
    rst $38
    add c
    jp nz, $c281

    pop bc
    jp nz, $c2c1

    add c
    add d
    add b
    add e
    nop
    nop
    nop
    nop
    db $fc
    db $fc
    cp $fe
    cp $fe
    cp $fe
    adc a
    rst $38
    rlca
    rst $38
    rlca
    rst $38
    rlca
    rst $38
    db $fc
    inc bc
    cp $01
    cp $01
    adc [hl]
    ld [hl], c
    rlca
    adc b
    inc bc
    inc b
    inc bc
    inc b
    inc bc
    inc b
    cp l
    add $7d
    add [hl]
    ld a, l
    add [hl]
    ld [hl], a
    adc h
    ld a, e
    adc h
    ld a, e
    adc h
    cp e
    call z, $f98e
    ld a, b
    add h
    ld hl, sp+$04

jr_007_5981:
    ld hl, sp+$04
    ld hl, sp+$04
    ldh a, [$ff08]
    ldh a, [$ff08]
    ld [hl], b
    adc b
    ld [hl], b
    adc b
    xor a
    ld [hl], b
    and a
    ld a, b
    inc sp
    db $fc
    add hl, hl
    cp $24
    rst $38
    ld b, a
    rst $38
    ld c, b
    rst $38
    ld e, a
    cp $00
    jr nz, jr_007_59a0

jr_007_59a0:
    jr nz, jr_007_59a2

jr_007_59a2:
    jr nc, jr_007_59b4

    jr z, jr_007_59be

    inc h
    jr c, jr_007_59f0

    jr nc, jr_007_59f3

    jr nz, jr_007_5a0b

    cp a
    ldh [$ffdf], a
    jr nc, jr_007_5981

    jr nc, @-$0f

jr_007_59b4:
    db $10
    rst $38
    nop
    ld a, a
    add b
    sbc a
    ldh [rBGP], a
    ld hl, sp+$40

jr_007_59be:
    and b
    ld h, b
    db $10
    ld [hl], b
    nop
    jr nc, jr_007_59c5

jr_007_59c5:
    jr nz, jr_007_59c7

jr_007_59c7:
    nop
    nop
    nop
    add b
    nop
    ld b, b
    cp $01
    cp $01
    db $fc
    inc bc
    db $fc
    inc bc
    ld hl, sp+$07
    ldh [$ff1f], a
    add e
    ld a, a
    inc a
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
    inc bc
    inc bc
    inc a
    nop
    rst $38
    nop

jr_007_59f0:
    rst $38
    inc c
    rst $38

jr_007_59f3:
    inc de
    rst $38
    jr nz, @+$01

    rst $18
    ldh [$ffbf], a
    ret nz

    ld e, a
    ldh [rP1], a
    nop
    nop
    nop
    nop
    inc c
    inc c
    inc de
    rra
    jr nz, jr_007_5a47

    ret nz

    ld a, a
    add b

jr_007_5a0b:
    cp a
    ld b, b
    dec bc
    ei
    add hl, bc
    ld sp, hl
    inc a
    db $fc
    jp $18ff


    rst $20
    db $fc
    inc bc
    cp $01
    cp $01
    inc bc
    inc c
    ld bc, $000e
    ccf
    inc a
    jp Jump_000_00ff


    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld a, [hl]
    ld sp, hl
    sub l
    sbc e
    or a
    cp b
    ld [hl], a
    ld a, b
    ld [hl], a
    ld a, b
    xor e
    cp h
    db $eb
    db $fc
    cp e
    cp h
    add b
    ld a, b
    ld h, b
    sub c
    ld b, b
    sub b
    add b
    db $10
    add b
    db $10

jr_007_5a47:
    ld b, b
    adc b

jr_007_5a49:
    nop
    ret z

    ld b, b
    adc b
    db $ed
    di
    pop af
    rrca
    adc a
    ld a, a
    or e
    ld a, h
    db $fc
    inc bc
    db $e3
    rra
    db $ec
    rra
    rst $38
    nop
    nop
    pop hl
    nop
    ld bc, $0f00
    nop
    jr nc, jr_007_5a66

jr_007_5a66:
    nop
    nop
    inc bc
    nop
    inc c
    nop
    nop
    ccf
    rst $38
    jr nz, @+$01

    ld e, h
    db $e3
    sbc $e1
    ldh [rIE], a
    rst $38
    sbc a
    ld a, a
    pop bc
    ld a, [hl]
    jp Jump_000_3f00


    nop
    jr nz, jr_007_5a82

jr_007_5a82:
    ld b, b
    nop
    ret nz

    nop
    ldh [rP1], a
    rst $38
    nop
    ld a, a
    ld bc, $d17e
    cp $17
    ld hl, sp+$2f
    ldh a, [$ff5d]
    db $e3
    cp [hl]
    rst $00
    cp h
    rst $00
    ld [hl], l
    adc a

jr_007_5a9b:
    push af
    rrca
    rrca
    ret nc

    rrca
    db $10
    rra
    jr nz, jr_007_5ae2

    ld b, c
    ld a, c
    add [hl]
    ld a, e

jr_007_5aa8:
    add h
    ld a, [$fa05]
    dec b
    xor a
    ld [hl], b
    and a
    ld a, h
    ccf
    db $fc
    rst $10
    ld hl, sp+$2f
    ldh a, [$ff7e]
    rst $38
    cp c
    cp c
    ld a, a
    ld a, a
    rst $18
    jr nz, jr_007_5a9b

    inc h
    jp Jump_000_2f3c


    ret nc

    rst $18
    jr nz, jr_007_5a49

    ld a, [hl]
    ld b, [hl]
    add c
    add b
    nop
    rst $38
    nop
    rst $38
    nop
    cp $01
    db $fc
    inc bc
    ld hl, sp+$07
    jr nc, jr_007_5aa8

    ret nz

    rst $38
    jr nz, jr_007_5b1c

    rst $38
    nop
    rst $38
    nop
    rst $38

jr_007_5ae2:
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ccf
    ret nz

    rst $18
    jr nz, jr_007_5b48

    ld h, [hl]
    ld b, d
    ld h, [hl]
    ld e, d
    ld e, d
    ld e, d
    ld e, d
    ld b, d
    ld h, [hl]
    ld b, d
    ld a, [hl]
    ld a, [hl]
    ld a, [hl]
    nop
    nop
    add c
    nop
    sbc c
    nop
    and l
    nop
    and l
    nop
    sbc c
    nop
    add c
    nop
    add c
    nop
    rst $38
    nop
    nop
    nop
    rst $38
    rst $38
    add b
    rst $38
    cp a
    ret nz

    cp a
    ret nz

    add b
    rst $38
    rst $38
    rst $38
    nop

jr_007_5b1c:
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
    rst $38
    nop
    ei
    db $fc
    rst $30
    db $f4
    sub a
    sub h
    rst $00
    ld b, h
    ei
    inc a
    inc de
    db $fc
    di
    db $fc
    daa
    jr c, jr_007_5b3e

jr_007_5b3e:
    adc b
    ld [$6884], sp
    add h
    jr c, @+$46

    nop
    jr c, jr_007_5b48

jr_007_5b48:
    stop
    db $10
    ret nz

jr_007_5b4c:
    jr nz, jr_007_5b4c

    ld bc, $07f8
    pop af
    rrca
    or $0f
    ldh a, [c]
    rrca
    ldh a, [c]
    rrca
    pop af
    rrca
    pop af
    rrca
    nop
    nop
    nop
    nop
    nop
    ld bc, $0601
    ld bc, $0102
    ld [bc], a
    nop
    ld bc, $0100
    ld a, [hl]
    jp $c7fc


    ld a, c
    rst $08
    ld a, $ff
    nop
    rst $38
    dec a
    cp $42
    rst $38
    ld b, c
    rst $38
    ld bc, $037e
    db $fc
    add [hl]
    ld a, c
    pop bc
    ld a, $ff
    nop
    jp $813c


    ld a, [hl]
    add b
    ld a, l
    db $ed
    rra
    ld sp, $c1ff
    rst $38
    ld a, [de]
    and $f5
    dec c
    ei
    dec bc
    cp $0e
    ld a, b
    adc b
    ldh a, [c]
    dec c
    adc $31
    ld a, $c1
    db $fd
    ld [bc], a
    ld a, [$f404]
    ld [$08f1], sp
    rst $30
    ld [$ffff], sp
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    ld b, $06
    ldh a, [$fff0]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld sp, hl
    nop
    rrca
    ldh a, [$ff91]
    sbc a
    adc [hl]
    adc a
    add h
    add a
    add d
    add e
    add d
    add e
    inc b
    rlca
    ld [$080f], sp
    rrca
    ld l, [hl]
    ld de, $0e71
    ld a, e
    inc b
    ld a, l
    ld [bc], a
    ld a, l
    ld [bc], a
    ei
    inc b
    rst $30
    ld [$08f7], sp
    adc b
    ld [hl], a
    rla
    adc b
    ld b, e
    add c
    ccf
    cp a
    ld c, b
    ret z

    nop
    add b
    add hl, bc
    adc c
    dec hl
    xor e
    rst $38
    nop
    rst $38
    nop
    cp $00
    ret nz

    nop
    or a
    nop
    rst $38
    nop
    or $00
    call nc, Call_000_0700
    ld hl, sp+$29
    ld b, $fc
    db $fc
    ld e, h
    db $fc
    jr nc, @+$32

jr_007_5c17:
    ld a, c
    halt
    sub $cd
    pop bc
    or [hl]
    rst $38
    nop

jr_007_5c1f:
    rst $38
    nop
    inc bc
    nop
    inc bc
    nop
    rst $08
    nop
    adc a
    nop
    add hl, sp
    nop
    ld a, a
    nop
    ret nz

    ccf
    ld [hl], b
    add b
    ret nz

    nop
    ld d, l
    rra
    db $e4
    rst $30
    sub b
    inc de
    inc de
    db $e3
    dec b
    reti


    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ldh [rP1], a
    ld [$ec00], sp
    nop
    db $fc
    nop
    cp [hl]
    nop
    ld b, c
    cp [hl]
    jr jr_007_5c92

    jr c, @+$33

    inc [hl]
    db $fd
    and [hl]
    rst $28
    ret c

    reti


    pop af
    ldh a, [c]
    db $fc
    db $fd
    rst $38
    nop
    rst $38
    nop
    rst $08
    nop
    inc bc
    nop
    ld de, $2700
    nop
    rrca
    nop
    inc bc
    nop
    rst $28
    jr nc, jr_007_5c1f

    ld [hl], b
    ccf
    jr nz, jr_007_5cb3

    jr nz, jr_007_5cb5

    jr nz, jr_007_5c17

    ld [hl], b
    ld a, a
    or b
    adc a
    ld l, h
    ldh [rP1], a
    ldh [rP1], a
    ldh [rP1], a
    ldh [rP1], a
    ldh a, [rNR10]
    ld sp, hl
    add hl, bc
    sbc a
    rrca
    rst $38
    inc bc
    rst $38
    ld bc, $01ff
    rst $38

jr_007_5c92:
    ld bc, $01ff
    cp $03
    cp $03
    db $fc
    dec b
    cp $1f
    rra
    ld e, $1f
    ld e, $3f
    ld a, $3f
    ld a, $7f
    ld a, h
    rst $38
    db $fc
    rst $38
    ld hl, sp-$07
    ldh [$ff3f], a
    pop hl
    ld e, $ff
    nop
    rst $38

jr_007_5cb3:
    ret nz

    rst $38

jr_007_5cb5:
    ld a, $bf
    ccf
    cp a
    inc hl
    cp a
    ld h, b
    rst $38
    ccf
    sbc $1e
    pop hl
    nop
    rst $38
    ret nz

    ccf
    cp $01
    rst $38
    nop
    db $e3
    inc e
    ldh [$ff1f], a
    ld [hl], l
    adc l
    ld [hl], d
    adc a
    ldh a, [c]

jr_007_5cd2:
    rrca
    push af
    ld c, $05
    cp $fb
    db $fc
    ei
    db $fc
    rla
    ld hl, sp-$06
    dec b
    db $fc
    ld [bc], a
    db $fc
    ld [bc], a
    ld hl, sp+$04
    ld hl, sp+$04
    nop
    ld hl, sp+$00
    ld hl, sp-$20
    db $10
    ld c, $fe
    ld bc, $f0ff
    rrca
    ldh a, [rIF]
    ldh [$ff1f], a
    pop hl
    rra
    pop bc
    ccf
    jp nz, $013f

    ld c, $00
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    ld bc, $0100
    ld bc, $0802
    rrca
    ld [$880f], sp
    adc a
    ret z

    rst $08
    sub c
    sbc [hl]
    db $e3
    db $fc
    rlca
    ld hl, sp+$0f
    ldh a, [$fff7]
    ld [$08f7], sp
    ld [hl], a
    adc b
    scf
    ret z

    ld l, a
    sub b
    rra
    ldh [rIE], a
    nop
    rst $38
    nop
    ld h, c
    pop hl
    ld h, b
    ldh [$ff67], a
    and $20
    and c
    nop
    add c
    ld [bc], a
    add c
    jr jr_007_5cd2

    dec h
    xor [hl]
    sbc [hl]
    nop
    sbc a
    nop
    sbc c
    nop
    rst $18
    nop
    rst $38
    nop
    rst $38
    nop
    rst $28
    nop
    ret c

    nop
    and b
    ld d, e
    ld b, c
    and [hl]
    ld c, e
    xor h
    add e
    ld c, h
    sub d
    ld e, h
    adc b
    ld [hl], c
    inc c
    ldh a, [c]
    reti


    ld hl, $00fc
    ld hl, sp+$00
    ldh a, [rP1]
    ldh a, [rP1]
    pop hl
    nop
    cp $00
    pop bc
    nop
    ld a, $00
    jp nc, $a834

    ld e, d
    pop af
    adc d
    ld a, [hl]
    add c
    inc de
    inc c
    db $ec
    inc de
    ld a, [de]
    dec c
    ld [hl], $e9
    adc a
    nop
    add a
    nop
    ld b, a
    nop
    ld c, a
    nop
    ldh a, [rP1]
    rrca
    nop
    di
    nop
    stop
    ld [hl], b
    ld a, c
    ld a, h
    ld a, l
    jr c, @+$3f

    inc c
    db $ed
    and h
    ld [hl], l
    inc b
    push hl
    inc c
    dec c
    inc e
    sbc l
    add a
    nop
    add e
    nop
    jp $f300


    nop
    dec de
    nop
    ei
    nop
    di
    nop
    db $e3
    nop
    ld c, a
    jr z, jr_007_5dc5

    ld c, d
    rst $38
    ld bc, $817e
    ret z

    jr nc, jr_007_5def

    ret z

    ld e, b
    or b
    ld l, h
    sub a
    ldh a, [rP1]
    pop hl
    nop
    add d
    nop
    ldh a, [c]

jr_007_5dc4:
    nop

jr_007_5dc5:
    rrca
    nop
    ldh a, [rP1]
    rst $08
    nop
    ld [$7f00], sp
    add e
    jp nc, $d225

    dec [hl]
    pop bc
    ld [hl-], a
    ld c, c
    ld a, [hl-]
    ld de, $308e
    ld c, a
    sbc e
    add h
    rlca
    nop
    rrca
    nop
    rrca
    nop
    rrca
    nop
    add a
    nop
    ld a, a
    nop
    add e
    nop
    ld a, h
    nop
    and $e7

jr_007_5def:
    rlca
    rlca
    rst $20
    ld h, a
    dec b
    add l
    nop
    add c
    ld b, b
    add c
    add hl, de
    jp hl


    and l
    ld [hl], l
    ld sp, hl
    nop
    ld sp, hl
    nop
    sbc c

jr_007_5e02:
    nop
    ei
    nop
    rst $38
    nop
    rst $38
    nop
    rst $30
    nop
    dec de
    nop
    xor a
    or b
    ld l, a
    ld [hl], b
    rst $10
    ret c

    ld l, b
    ld l, a
    rst $30
    rst $30
    ldh a, [$fff0]
    ld a, b
    ld a, b
    ld sp, hl
    ld sp, hl
    ld e, a
    and b
    sbc a
    jr nz, jr_007_5e51

    db $10
    sub a
    ld [$8708], sp
    rrca
    add b
    add a
    nop
    ld b, $01
    sub a
    ld a, b
    xor a
    ld [hl], b
    xor a
    ld [hl], b
    ld e, a
    ldh [$ffde], a
    pop hl
    cp [hl]
    pop bc
    cp h
    jp $837c


    ldh [rNR10], a
    ret nz

    jr nz, jr_007_5e02

    jr nz, jr_007_5dc4

    ld b, b
    nop
    ret nz

    nop
    add b
    nop
    add b
    nop
    nop
    add d
    ld a, a
    add h
    ld a, a

jr_007_5e51:
    inc b
    rst $38
    ld [$08ff], sp
    rst $38
    db $10
    rst $38
    jr @+$01

    daa
    rst $20
    ld bc, $0302
    inc b
    inc bc
    inc b
    rlca
    ld [$0807], sp
    rrca
    db $10
    rlca
    jr jr_007_5e84

    daa
    ccf
    ret nz

    ld a, a
    add b
    ld a, a
    add b
    rst $38
    nop
    cp $01
    ld hl, sp+$07
    inc bc
    rst $38
    db $fc
    db $fc
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38

jr_007_5e84:
    nop
    rst $38
    nop
    rst $38
    nop
    db $fc
    inc bc
    inc bc
    db $fc
    jr @-$67

    inc de
    sub b
    nop
    add b
    ld b, [hl]
    add d
    ld [bc], a
    add b
    ld h, $a6
    ld h, [hl]
    and [hl]
    ld c, h
    adc h
    rst $28
    nop
    rst $28
    nop
    rst $38
    nop
    db $fd
    nop
    rst $38
    nop
    reti


    nop
    reti


    nop
    di
    nop
    inc de
    db $fc
    rra
    ldh a, [rIF]
    db $f4
    ld sp, $065e
    jr c, @+$19

    ld l, b
    ld h, l
    sbc d
    rlca
    ld hl, sp-$20
    nop
    ldh [rP1], a
    ld hl, sp+$00
    ldh [rP1], a
    rst $38
    nop
    ldh a, [rP1]
    pop de
    nop
    sub [hl]
    nop
    ld [$e01d], a
    rra
    ldh [$ff1f], a
    db $fd
    ld [bc], a
    ld de, $880e
    rla
    add sp, $16
    ldh a, [$ff0c]
    stop
    ccf
    nop
    ld sp, $0200
    nop
    db $fc
    nop
    push hl
    nop
    ld h, a
    nop
    rlca
    nop
    jr @-$25

    add hl, de
    sbc d
    dec e
    sbc $98
    ld d, c
    inc a
    db $fd
    inc e
    sbc l
    jr jr_007_5f14

    jr jr_007_5f16

    rst $20
    nop
    rst $20
    nop
    db $e3
    nop
    ld l, a
    nop
    ld b, e
    nop
    db $e3
    nop
    rst $20
    nop
    rst $20
    nop
    add hl, de
    jp hl


    ret


    add hl, bc
    ld bc, $6201

jr_007_5f14:
    ld b, c
    ld b, b

jr_007_5f16:
    ld bc, $6564
    ld h, [hl]
    ld h, l
    ld [hl-], a
    ld sp, $00f7
    rst $30
    nop
    rst $38
    nop
    cp a
    nop
    rst $38
    nop
    sbc e
    nop
    sbc e
    nop
    rst $08
    nop
    rst $38
    rst $38
    rst $38
    cp $ff
    cp $ff
    db $fc
    ld a, a
    ld a, h
    rst $38
    adc b
    rst $38
    adc b
    rst $38
    sub b
    ld bc, $0306
    dec b
    inc bc
    sbc l
    add d
    ld a, [hl]
    cp $02
    db $fc
    ld [hl], h
    db $fc
    ld [hl], h
    ret c

    ld c, b
    ld a, b
    add a

jr_007_5f4f:
    ld hl, sp+$07
    ldh a, [rIF]
    ldh a, [rIF]
    ldh [$ff1f], a
    pop hl
    rra
    pop bc
    ccf
    jp nz, Jump_000_003f

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $0100
    nop
    ld [bc], a
    jr nz, jr_007_5f4f

    ld b, a
    rst $00
    ld c, a
    rst $08
    sbc a
    sbc a
    sbc a
    sbc a
    ccf
    ccf
    ccf
    ccf
    sbc a
    sbc a
    rra
    jr nz, jr_007_5fb8

    ld b, b
    jr nc, jr_007_5fc3

    ld h, b
    add b
    ld h, b
    add b
    ret nz

    nop
    ret nz

    nop
    ld h, b
    add b
    ld bc, $ff01
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
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
    ret nz

    nop
    add b
    ld c, a
    adc b
    ld c, e
    adc b
    ld l, b
    adc b
    ld h, [hl]

jr_007_5fb8:
    add [hl]
    ld a, b
    add b
    add b
    ld a, a
    rst $38
    nop
    rst $38
    nop
    rst $30
    nop

jr_007_5fc3:
    rst $30
    nop
    rst $30
    nop
    ld sp, hl
    nop
    rst $38
    nop
    rst $38
    nop
    ld hl, $03de
    ld a, h
    ld a, c
    xor [hl]
    ld [hl], e
    adc h
    ld a, h
    inc b
    ld b, $0e
    ei
    nop
    nop
    rst $38
    cp a
    nop
    db $fc
    nop
    rst $00
    nop
    rst $38
    nop
    ei
    nop
    pop af
    nop
    rst $38
    nop
    rst $38
    nop
    ld b, b
    ld a, $80
    inc a
    db $fc
    ld d, $70
    add d
    add b
    ld a, h
    nop
    nop
    rst $38
    nop
    nop
    rst $38
    rst $38
    nop
    ld a, a
    nop
    db $e3
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld bc, $1002
    ld de, $c9d8
    jp hl


    jp z, $e9f8

    ld hl, sp+$61
    ld a, [de]
    ld bc, $f609
    rst $38
    nop
    rst $28
    nop
    scf
    nop
    scf
    nop
    rla
    nop
    sbc a
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    sub b
    rst $38
    sub b
    rst $38
    and b
    rst $38
    and b
    ld a, a
    ld b, b
    ld a, a
    ld b, b
    rst $38
    add b
    rst $38
    add b
    ret c

    ld c, b
    ldh a, [$ff60]
    ldh a, [$ff50]
    ldh [rLCDC], a
    pop hl
    ld hl, $21e1
    jp $c343


    ld b, e
    add d
    ld a, a
    add h
    ld a, a
    inc b
    rst $38
    ld [$08ff], sp
    rst $38
    db $10
    rst $38
    ld de, $23fe
    db $fc
    nop
    ld [bc], a
    nop
    inc b
    nop
    inc b
    nop
    ld [$0800], sp
    nop
    stop
    stop
    jr nz, jr_007_60cf

    pop hl
    rra
    rst $38
    nop
    rst $38
    ccf
    ret nz

    ld a, a
    add b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    ld e, $60
    nop
    rra
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ldh a, [$fff0]
    rst $38
    rst $38
    nop
    rst $38
    ld hl, sp+$07
    ld hl, sp+$07
    ld hl, sp+$07
    ldh a, [rIF]
    ldh a, [rIF]
    rrca
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
    inc bc
    db $fc
    rrca
    ld bc, $0103
    xor e
    ld a, [$ee27]
    rrca
    call z, $c4cf
    and a
    sbc h
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rlca
    ld bc, $0113
    ld [hl], $02
    ld a, $02
    ld a, [hl]
    ld [bc], a
    cp b
    rst $00

jr_007_60cf:
    ld a, b
    add a
    ld a, b
    add a
    ld hl, sp+$07
    ldh a, [rIF]
    ldh a, [rIF]
    pop af
    rrca
    pop af
    rrca
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
    ld bc, $0100
    daa
    ld hl, sp+$47
    ld hl, sp+$4f
    ldh a, [$ff8f]
    ldh a, [$ff9f]
    ldh [$ff9f], a
    ldh [$ff3f], a
    ret nz

    ccf
    ret nz

    nop
    jr nz, jr_007_6100

jr_007_6100:
    ld b, b
    nop
    ld b, b
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    nop
    nop
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
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
    ldh [$ff1f], a
    ldh [$ff1f], a
    pop bc
    ccf
    pop bc
    ccf
    jp nz, $c33e

    ccf
    add l
    ld a, l
    adc e
    ld a, e
    nop
    nop
    nop
    nop
    nop
    ld bc, $0100
    ld bc, $0002
    ld [bc], a
    ld [bc], a
    inc b
    inc b
    ld [$284f], sp
    rra
    ld e, b
    adc a
    ld e, b
    ld a, a
    adc b
    rst $18
    jr nc, @+$41

    ret nc

    ld e, a
    or b
    ld a, a
    sub b
    db $fc
    inc b
    db $ec
    inc b
    db $ec
    inc b
    db $fc
    inc b
    inc e
    inc c
    db $fc
    inc c
    ret c

    ld [$0818], sp
    pop af
    rrca
    ldh a, [rIF]
    ldh a, [rIF]
    ldh a, [rIF]
    ldh a, [rIF]
    ldh a, [rIF]
    ld hl, sp+$07
    ld hl, sp+$07
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
    ccf
    ret nz

    sbc a
    ldh [$ff9f], a
    ldh [$ff9f], a
    ldh [$ff5f], a
    ldh [$ff5f], a
    ldh [$ff5f], a
    ldh [rVBK], a
    ldh a, [rP1]
    nop
    nop
    add b
    nop
    add b
    nop
    add b
    nop
    ld b, b
    nop
    ld b, b
    nop
    ld b, b
    nop
    ld b, b
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    rst $38
    nop
    db $fc
    inc bc
    db $fc
    inc bc
    db $fc
    inc bc
    ld sp, hl
    rlca
    nop
    nop
    nop
    nop
    nop

jr_007_61c2:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld bc, $ff0c
    inc d
    rst $30
    jr z, jr_007_61c2

    ccf
    rst $38
    ld d, e
    rst $18
    cp a
    cp a
    rst $38
    rst $38
    ld a, a
    ld a, a
    nop
    ld [$1008], sp
    db $10
    jr nz, jr_007_61e4

jr_007_61e4:
    jr nz, jr_007_6206

    ld b, b
    ld b, b
    add b
    nop
    add b
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_007_6206:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Jump_007_6582:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
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
    ld [$0510], sp
    db $10
    ld b, $10
    rlca
    db $10
    ld [$0510], sp
    db $10
    ld b, $10
    rlca
    db $10
    ld [$0510], sp
    db $10
    ld b, $10
    rlca
    db $10
    ld [$0510], sp
    db $10
    ld b, $10
    rlca
    db $10
    ld [$0510], sp
    db $10
    ld b, $10
    rlca
    db $10
    ld [$0510], sp
    db $10
    ld b, $10
    rlca
    db $10
    ld [$0910], sp
    db $10
    ld a, [bc]
    db $10
    dec bc
    db $10
    inc c
    db $10
    dec c
    db $10
    ld c, $10
    rrca
    db $10
    db $10
    db $10
    ld de, $1210
    db $10
    inc de
    db $10
    db $10
    db $10
    ld de, $1210
    db $10
    inc de
    db $10
    db $10
    db $10
    ld de, $1210
    db $10
    inc de
    db $10
    db $10
    db $10
    ld de, $1210
    db $10
    inc de
    db $10
    db $10
    db $10
    ld de, $1210
    db $10
    inc de
    db $10
    db $10
    db $10
    ld de, $1210
    db $10
    inc de
    db $10
    db $10
    db $10
    inc d
    db $10
    dec d
    db $10
    dec d
    db $10
    ld d, $10
    rla
    db $10
    jr jr_007_6b89

    add hl, de
    db $10
    ld a, [de]
    db $10
    dec de
    db $10
    inc e
    db $10
    dec e
    db $10
    ld a, [de]
    db $10
    dec de
    db $10
    inc e
    db $10

jr_007_6b89:
    dec e
    db $10
    ld a, [de]
    db $10
    dec de
    db $10
    inc e
    db $10
    dec e
    db $10
    ld a, [de]
    db $10
    dec de
    db $10
    inc e
    db $10
    dec e
    db $10
    ld a, [de]
    db $10
    dec de
    db $10
    inc e
    db $10
    dec e
    db $10
    ld a, [de]
    db $10
    dec de
    db $10
    inc e
    db $10
    dec e
    db $10
    ld a, [de]
    db $10
    ld e, $10
    rra
    db $10
    jr nz, jr_007_6bc3

    ld hl, $2210
    db $10
    inc hl
    db $10
    inc h
    db $10
    dec h
    db $10
    ld h, $10
    daa
    db $10
    inc h
    db $10

jr_007_6bc3:
    dec h
    db $10
    ld h, $10
    daa
    db $10
    inc h
    db $10
    dec h
    db $10
    ld h, $10
    daa
    db $10
    inc h
    db $10
    dec h
    db $10
    ld h, $10
    daa
    db $10
    inc h
    db $10
    dec h
    db $10
    ld h, $10
    daa
    db $10
    inc h
    db $10
    dec h
    db $10
    ld h, $10
    daa
    db $10
    inc h
    db $10
    dec h
    db $10
    jr z, jr_007_6bff

    add hl, hl
    db $10
    ld a, [hl+]
    db $10
    dec hl
    db $10
    inc l
    db $10
    dec l
    db $10
    ld l, $14
    ld l, $14
    ld l, $14

jr_007_6bff:
    ld l, $14
    ld l, $14
    ld l, $14
    ld l, $14
    ld l, $14
    ld l, $14
    ld l, $14
    ld l, $14
    ld l, $14
    ld l, $14
    ld l, $14
    ld l, $14
    ld l, $14
    ld l, $14
    ld l, $14
    ld l, $14
    cpl
    inc d
    jr nc, jr_007_6c37

    ld b, $10
    rlca
    db $10
    ld [$0510], sp
    db $10
    ld b, $10
    ld sp, $3210
    db $10
    inc sp
    db $10
    inc [hl]
    db $10
    dec [hl]
    db $10

jr_007_6c37:
    ld [hl], $14
    nop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db $10
    scf
    inc d
    ld [de], a
    db $10
    inc de
    db $10
    db $10
    db $10
    ld de, $1210
    db $10
    jr c, @+$12

    add hl, sp
    db $10
    ld a, [hl-]
    db $10
    dec sp
    db $10
    inc a
    db $10
    scf
    inc d
    nop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db $10
    scf
    inc d
    inc e
    db $10
    dec e
    db $10
    ld a, [de]
    db $10
    dec de
    db $10
    inc e
    db $10
    dec a
    db $10
    ld a, $10
    ccf
    db $10
    ld b, b
    db $10
    ld b, c
    db $10
    ld b, d
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db $10
    scf
    inc d
    daa
    db $10
    inc h
    db $10
    dec h
    db $10
    ld h, $10
    daa
    db $10
    ld b, e
    db $10
    ld b, h
    db $10
    ld b, l
    db $10
    ld b, [hl]
    db $10
    ld b, a
    db $10
    ld c, b
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db $10
    scf
    inc d
    ld [$0510], sp
    db $10
    ld b, $10
    rlca
    db $10
    ld [$4910], sp
    db $10
    ld c, d
    db $10
    ld c, e
    db $10
    ld c, h
    db $10
    ld c, l
    db $10
    ld c, [hl]
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db $10
    scf
    inc d
    db $10
    db $10
    ld de, $1210
    db $10
    inc de
    db $10
    db $10
    db $10
    ld c, a
    db $10
    ld d, b
    db $10
    dec e
    db $10
    ld a, [de]
    db $10
    dec de
    db $10
    scf
    inc d
    nop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db $10
    scf
    inc d
    ld a, [de]
    db $10
    dec de
    db $10
    inc e
    db $10
    dec e
    db $10
    ld a, [de]
    db $10
    ld h, $10
    daa
    db $10
    inc h
    db $10
    dec h
    db $10
    ld h, $10
    scf
    inc d
    nop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db $10
    scf
    inc d
    dec h
    db $10
    ld h, $10
    daa
    db $10
    inc h
    db $10
    dec h
    db $10
    rlca
    db $10
    ld [$0510], sp
    db $10
    ld b, $10
    rlca
    db $10
    scf
    inc d
    nop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db $10
    scf
    inc d
    ld b, $10
    rlca
    db $10
    ld [$0510], sp
    db $10
    ld b, $10
    inc de
    db $10
    db $10
    db $10
    ld de, $1210
    db $10
    inc de
    db $10
    scf
    inc d
    nop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db $10
    scf
    inc d
    ld [de], a
    db $10
    inc de
    db $10
    db $10
    db $10
    ld de, $1210
    db $10
    dec e
    db $10
    ld a, [de]
    db $10
    dec de
    db $10
    inc e
    db $10
    dec e
    db $10
    scf
    inc d
    nop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db $10
    scf
    inc d
    inc e
    db $10
    dec e
    db $10
    ld a, [de]
    db $10
    dec de
    db $10
    inc e
    db $10
    inc h
    db $10
    dec h
    db $10
    ld h, $10
    daa
    db $10
    inc h
    db $10
    scf
    inc d
    nop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db $10
    scf
    inc d
    ld d, c
    db $10
    ld d, d
    jr @+$55

    jr jr_007_6f3e

    jr @+$57

    db $10
    dec b
    db $10
    ld b, $10
    rlca
    db $10
    ld [$0510], sp
    db $10
    scf
    inc d
    nop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db $10
    ld d, [hl]
    inc d
    ld d, a
    jr jr_007_6f7e

    inc d
    ld e, c
    inc d
    ld e, d
    inc d
    ld e, e
    jr @+$13

    db $10
    ld [de], a
    db $10
    inc de
    db $10
    db $10
    db $10
    ld de, $3710
    inc d
    nop
    stop
    stop

jr_007_6f3e:
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db $10
    ld e, h
    inc d
    ld e, l
    inc d
    ld e, [hl]
    inc d
    ld e, a
    inc d
    ld h, b
    inc d
    ld h, c
    inc d
    dec de
    db $10
    inc e
    db $10
    dec e
    db $10
    ld a, [de]
    db $10
    dec de
    db $10
    scf
    inc d
    nop
    stop
    stop

jr_007_6f7e:
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db $10
    ld h, d
    inc d
    ld h, e
    inc d
    ld h, h
    inc d
    ld h, l
    inc d
    ld h, [hl]
    inc d
    ld h, a
    inc d
    ld h, $10
    daa
    db $10
    inc h
    db $10
    dec h
    db $10
    ld h, $10
    scf
    inc d
    nop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db $10
    ld l, b
    inc d
    ld l, c
    inc d
    ld l, d
    inc d
    ld l, e
    inc d
    ld l, h
    inc d
    ld l, l
    inc d
    rlca
    db $10
    ld [$0510], sp
    db $10
    ld b, $10
    rlca
    db $10
    scf
    inc d
    nop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db $10
    ld l, [hl]
    inc d
    ld l, a
    inc d
    ld [hl], b
    inc d
    ld [hl], c
    inc d
    ld [hl], d
    inc d
    ld [hl], e
    inc d
    inc de
    db $10
    db $10
    db $10
    ld de, $1210
    db $10
    inc de
    db $10
    scf
    inc d
    nop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db $10
    ld [hl], h
    inc d
    ld [hl], l
    inc d
    halt
    inc d
    ld [hl], a
    inc d
    ld a, b
    inc d
    ld a, c
    inc d
    dec e
    db $10
    ld a, [de]
    db $10
    dec de
    db $10
    inc e
    db $10
    dec e
    db $10
    scf
    inc d
    nop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    db $10
    ld a, d
    inc d
    ld a, e
    inc d
    ld a, h
    inc d
    ld a, l
    inc d
    ld a, [hl]
    inc d
    ld a, a
    inc d
    inc h
    db $10
    dec h
    db $10

jr_007_70b1:
    ld h, $10
    daa

jr_007_70b4:
    db $10
    inc h
    db $10

jr_007_70b7:
    add b
    inc d
    add c
    inc d
    ld l, $14
    ld l, $14
    ld l, $14
    ld l, $14
    ld l, $14
    ld l, $14
    ld l, $14
    ld l, $14
    ld l, $14
    ld l, $14
    ld l, $14
    ld l, $14
    ld l, $14
    ld l, $14
    ld l, $14
    ld l, $14
    ld l, $14
    ld l, $14
    ld l, $14
    add d
    inc d
    add e
    inc d
    add h
    inc d
    add l
    inc d
    add [hl]
    inc d
    add a
    inc d
    dec b
    db $10
    ld b, $10
    rlca
    db $10
    ld [$0510], sp
    db $10
    ld b, $10
    rlca
    db $10
    ld [$8810], sp
    db $10
    adc c
    db $10
    adc d
    db $10
    adc e
    db $10
    dec b
    db $10
    ld b, $10
    rlca
    db $10
    ld [$0510], sp
    db $10
    ld b, $10
    rlca
    db $10
    ld [$0510], sp
    db $10
    ld b, $10
    rlca
    db $10
    ld [$0510], sp
    db $10
    ld b, $10
    adc h
    jr jr_007_70b1

    jr jr_007_70b4

    jr jr_007_70b7

    inc d
    sub b
    inc d
    sub c
    inc d
    ld de, $1210
    db $10
    inc de
    db $10
    db $10
    db $10
    ld de, $1210
    db $10
    inc de
    db $10
    db $10
    db $10
    sub d
    db $10
    sub e
    db $10
    sub h
    db $10
    sub l
    db $10
    ld de, $1210
    db $10
    inc de
    db $10

jr_007_714b:
    db $10
    db $10
    ld de, $1210
    db $10
    inc de
    db $10
    db $10
    db $10
    ld de, $1210
    db $10
    inc de
    db $10
    db $10
    db $10
    ld de, $9610
    db $10
    sub a
    db $10
    sbc b
    db $10
    sbc c
    inc d
    sbc d
    inc d
    sbc e
    inc d
    sbc h
    inc d
    dec de
    db $10
    inc e
    db $10
    dec e
    db $10
    ld a, [de]
    db $10
    dec de
    db $10
    inc e
    db $10
    dec e
    db $10
    ld a, [de]
    db $10
    sbc l
    db $10
    sbc [hl]
    db $10
    sbc a
    db $10
    and b
    db $10
    dec de
    db $10
    inc e
    db $10
    dec e
    db $10
    ld a, [de]
    db $10
    dec de
    db $10
    inc e
    db $10
    dec e
    db $10

jr_007_7193:
    ld a, [de]
    db $10
    dec de
    db $10
    inc e
    db $10
    dec e
    db $10
    ld a, [de]
    db $10
    dec de
    db $10
    inc e
    db $10
    dec e
    db $10
    and c
    db $10
    and d
    jr jr_007_714b

    inc d
    and h
    inc d
    and l
    inc d
    ld h, $10
    daa
    db $10
    inc h
    db $10
    dec h
    db $10
    ld h, $10
    daa
    db $10
    inc h
    db $10
    dec h
    db $10
    and [hl]
    db $10
    and a
    db $10
    xor b
    db $10
    xor c
    db $10
    ld h, $10
    daa
    db $10
    inc h
    db $10
    dec h
    db $10
    ld h, $10
    daa
    db $10
    inc h
    db $10
    dec h
    db $10

jr_007_71d5:
    ld h, $10
    daa
    db $10
    inc h
    db $10
    dec h
    db $10
    ld h, $10
    daa
    db $10
    inc h
    db $10
    dec h
    db $10
    xor d
    jr jr_007_7193

    inc d
    xor h
    inc d
    xor l
    inc d
    rlca
    db $10
    ld [$0510], sp
    db $10
    ld b, $10
    rlca
    db $10
    ld [$0510], sp
    db $10
    ld b, $10
    rlca
    db $10
    ld [$0510], sp
    db $10
    ld b, $10
    rlca
    db $10
    ld [$0510], sp
    db $10
    ld b, $10
    rlca
    db $10
    ld [$0510], sp
    db $10
    ld b, $10
    rlca
    db $10
    ld [$0510], sp

jr_007_721a:
    db $10
    ld b, $10
    rlca
    db $10
    ld [$0510], sp
    db $10
    xor [hl]
    jr jr_007_71d5

    inc d
    or b
    inc d
    or c
    inc d
    or d
    inc d
    inc de
    db $10
    db $10
    db $10
    ld de, $1210
    db $10
    inc de
    db $10
    db $10
    db $10
    ld de, $1210
    db $10
    inc de
    db $10
    db $10
    db $10
    ld de, $1210
    db $10
    inc de
    db $10
    db $10
    db $10
    ld de, $1210
    db $10
    inc de
    db $10
    db $10
    db $10
    ld de, $1210
    db $10
    inc de
    db $10
    db $10
    db $10
    ld de, $1210
    db $10
    inc de
    db $10
    db $10
    db $10
    ld de, $b310
    jr jr_007_721a

    inc d
    or l
    inc d
    or [hl]
    inc d
    or a
    inc d
    nop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    stop
    nop
    sbc a
    ld d, a
    dec a
    ld b, e
    ei
    ld [hl-], a
    sbc c
    ld [hl+], a
    ld d, a
    ld [de], a
    ld d, $02
    nop
    nop
    nop
    nop
    sbc a
    ld d, e
    rra
    ccf
    rst $10
    ld bc, $00f2
    ld d, d
    ld c, d
    ld e, d
    ld l, e
    rst $38
    ld a, a
    nop
    nop
    sbc a
    ld d, a
    rra
    ccf
    ei
    ld [hl-], a
    rst $10
    ld bc, $6abf
    rst $38
    ld c, c
    ld b, b
    ld e, e
    jr nz, jr_007_7339

    rra
    nop
    rst $38
    inc bc
    nop
    nop
    add hl, hl
    dec h
    ld [hl], e
    ld c, [hl]
    ld a, e
    ld l, a
    rst $38
    ld a, a
    nop
    nop
    sbc a
    ld d, a
    dec a
    ld b, e
    ei
    ld [hl-], a
    sbc c
    ld [hl+], a
    ld d, a
    ld [de], a

jr_007_7339:
    ld d, $02
    nop
    nop
    nop
    nop
    cp a
    ld l, d
    rst $38
    ld c, c
    rst $10
    ld bc, $00f2
    rra
    ccf
    add hl, hl
    dec h
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Jump_007_79c9:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Jump_007_7ec9:
; Original routine: turn LCD on (BG @ $9800, tiles @ $8800, OBJ on).
    ld a, $81
    ldh [rLCDC], a
    ret

    ds $8000 - @, 0
