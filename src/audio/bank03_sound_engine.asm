; ============================================================================
; BANK $03 - Sound Engine
; ============================================================================
; Address: $4000-$7FFF (switchable)
;
; Complete sound and music playback engine: APU register manipulation,
; sound sequencing, music track data, and wave channel control.
;
; Key systems:
;   APU registers (rNR22, rNR42, rNR32)
;   Sound sequencing and playback
;   Music pattern data
;   Wave channel control ($caa0, $cb90-$cb97)
;
; ============================================================================
; Originally disassembled with mgbdis v3.0 by Matt Currie

SECTION "ROM Bank $003", ROMX[$4000], BANK[$3]

Jump_003_4000:
    push af
    push bc
    push de
    push hl
    ld a, [$a45a]
    or a
    jr z, jr_003_4019

    ldh a, [$ffa0]
    cp $02
    jr z, jr_003_4019

    cp $01
    jr z, jr_003_4019

    xor a
    ldh [$ffa0], a
    jr jr_003_402b

jr_003_4019:
    ldh a, [$ffa0]
    cp $01
    jp z, Jump_003_44cf

Jump_003_4020:
    or a
    jr z, jr_003_402b

    call Call_003_4ae8
    xor a
    ldh [$ffa0], a
    jr jr_003_4036

jr_003_402b:
    ldh a, [$ffa1]
    or a
    jr z, jr_003_4036

    call Call_003_4b05
    xor a
    ldh [$ffa1], a

jr_003_4036:
    ld a, [$cb90]
    or a
    jr z, jr_003_4060

    ld a, [$cb91]
    or a

Call_003_4040:
    jp nz, Jump_003_417f

    ld a, $ff
    ld [$cb91], a
    ld a, $08
    ldh [rNR22], a
    ldh [rNR42], a
    xor a
    ldh [rNR32], a
    ld a, $80
    ldh [rNR24], a
    ldh [rNR44], a
    ldh [rNR34], a
    ld a, $02
    ldh [$ffa1], a
    jp Jump_003_417f


jr_003_4060:
    ld a, [$cb91]
    or a
    jr z, jr_003_407d

    xor a
    ld [$cb91], a
    ld a, $8f
    ldh [rNR52], a
    ld [$cb94], a
    ld a, $08
    ldh [rNR12], a
    ld a, $80
    ldh [rNR14], a
    xor a
    ld [$caa0], a

jr_003_407d:
    ld a, [SOUND_CONTROL]
    or a
    jr z, jr_003_40e3

    ld a, [$cb97]
    or a
    jr z, jr_003_408f

    dec a
    ld [$cb97], a
    jr jr_003_40e3

jr_003_408f:
    ld a, [$cb98]
    sub $11
    jr c, jr_003_40a3

    ld [$cb98], a
    ldh [rNR50], a
    ld a, [SOUND_CONTROL]
    ld [$cb97], a
    jr jr_003_40e3

jr_003_40a3:
    xor a
    ld [SOUND_CONTROL], a
    ld [$cb97], a
    ldh [rNR51], a
    ld [$ca00], a
    ld [$ca28], a
    ld [$ca50], a
    ld [$ca78], a
    ld [$caa0], a
    ld [$cac8], a
    ldh [rNR11], a

Jump_003_40c0:
    ldh [rNR21], a
    ldh [rNR32], a
    ldh [rNR42], a
    ldh [rNR13], a
    ldh [rNR23], a
    ldh [rNR33], a
    ldh [rNR43], a
    ldh [rNR30], a
    ld a, $08
    ldh [rNR10], a
    ld a, $c0
    ldh [rNR14], a
    ldh [rNR24], a
    ldh [rNR34], a
    ldh [rNR44], a
    pop hl
    pop de
    pop bc
    pop af
    ret


jr_003_40e3:
    ld de, $ca00
    ld a, [de]
    or a
    jr z, jr_003_4134

    xor a
    ldh [$ffa2], a
    call Call_003_41bc

Call_003_40f0:
    jr z, jr_003_40f8

    ld a, [hl]
    and $7f
    ld [hl], a
    jr jr_003_4134

jr_003_40f8:
    ld a, [$cb94]
    or a
    jr z, jr_003_4131

    xor a
    ld [$cb94], a
    ld hl, $0005
    add hl, de
    ld a, [hl+]
    ldh [rNR10], a
    ld a, [hl+]
    ldh [rNR11], a
    inc hl
    ld a, [hl+]
    or $08
    ldh [rNR12], a
    inc hl
    ld a, [hl+]
    ldh [rNR13], a
    ld a, [hl]
    or $80
    ldh [rNR14], a
    ld hl, $0025
    add hl, de
    ld a, [hl]
    add a
    ld c, a
    ld b, $00
    ld hl, $41c4
    add hl, bc
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $4131
    push hl
    push bc
    ret


jr_003_4131:
    call Call_003_41ca

jr_003_4134:
    ld de, $ca28
    ld a, [de]
    or a
    jr z, jr_003_414d

    ld a, $01
    ldh [$ffa2], a
    call Call_003_41bc
    jr z, jr_003_414a

    ld a, [hl]
    and $7f
    ld [hl], a
    jr jr_003_414d

jr_003_414a:
    call Call_003_41ca

jr_003_414d:
    ld de, $ca50
    ld a, [de]
    or a
    jr z, jr_003_4166

    ld a, $02
    ldh [$ffa2], a
    call Call_003_41bc
    jr z, jr_003_4163

    ld a, [hl]
    and $7f
    ld [hl], a
    jr jr_003_4166

jr_003_4163:
    call Call_003_41ca

jr_003_4166:
    ld de, $ca78
    ld a, [de]
    or a
    jr z, jr_003_417f

    ld a, $03
    ldh [$ffa2], a

Jump_003_4171:
    call Call_003_41bc
    jr z, jr_003_417c

    ld a, [hl]
    and $7f
    ld [hl], a
    jr jr_003_417f

jr_003_417c:
    call Call_003_41ca

Jump_003_417f:
jr_003_417f:
    ld de, $caa0
    ld a, [de]
    or a
    jr z, jr_003_4198

    ld a, $04
    ldh [$ffa2], a
    call Call_003_41bc
    jr z, jr_003_4195

    ld a, [hl]
    and $7f
    ld [hl], a
    jr jr_003_4198

jr_003_4195:
    call Call_003_41ca

jr_003_4198:
    ld a, [$cb90]
    or a
    jr nz, jr_003_41b7

    ld de, $cac8
    ld a, [de]
    or a
    jr z, jr_003_41b7

    ld a, $05
    ldh [$ffa2], a
    call Call_003_41bc
    jr z, jr_003_41b4

    ld a, [hl]
    and $7f
    ld [hl], a
    jr jr_003_41b7

jr_003_41b4:
    call Call_003_41ca

Jump_003_41b7:
jr_003_41b7:
    pop hl
    pop de
    pop bc
    pop af
    ret


Call_003_41bc:
    ld hl, $0022
    add hl, de
    ld a, [hl]
    and $80
    ret


    ld b, $47
    ld hl, $3b47
    ld b, a

Call_003_41ca:
    ld hl, $0023
    add hl, de
    ld a, [hl]
    cp $02
    jp z, Jump_003_4379

    ld hl, $0004
    add hl, de
    dec [hl]
    jr z, jr_003_41fc

    ldh a, [$ffa2]
    cp $05
    jp z, Jump_003_47e2

    ld hl, $0023
    add hl, de
    ld a, [hl]
    cp $01
    jp z, Jump_003_47e2

    ld hl, $0022
    add hl, de
    ld a, [hl]
    and $40
    call nz, Call_003_48e1
    call Call_003_49cd
    jp Jump_003_44e5


jr_003_41fc:
    ld hl, $0001
    add hl, de

Jump_003_4200:
    ld c, [hl]
    inc hl

Jump_003_4202:
    ld b, [hl]

jr_003_4203:
    ld a, [de]
    or a
    ret z

    ld hl, $0023
    add hl, de
    ld a, [hl]
    cp $02
    jp z, Jump_003_4394

Jump_003_4210:
jr_003_4210:
    ld a, [bc]
    ldh [$ffa3], a
    inc bc
    cp $ef
    jr nz, jr_003_421e

    ld hl, $cb9b
    inc [hl]
    jr jr_003_4210

jr_003_421e:
    and $f0
    cp $f0
    jr nz, jr_003_4229

    call Call_003_45af
    jr jr_003_4203

jr_003_4229:
    cp $e0
    jr nz, jr_003_4232

    call Call_003_45b5
    jr jr_003_4203

jr_003_4232:
    cp $d0
    jr nz, jr_003_425d

    ldh a, [$ffa3]
    and $0f
    ld hl, $0009
    add hl, de
    ld [hl], a
    jr jr_003_4203

jr_003_4241:
    ld hl, $0008
    add hl, de
    xor a
    ld [hl], a
    call Call_003_4a35
    ld hl, $000c
    add hl, de
    ld bc, $425c
    ld [hl], c
    inc hl
    ld [hl], b
    ld a, $ff
    call Call_003_4a67
    jp Jump_003_4a71


    ret


jr_003_425d:
    call Call_003_4407
    ld hl, $0003
    add hl, de
    ldh a, [$ffa3]
    and $0f
    ld b, a
    inc b
    xor a

jr_003_426b:
    add [hl]
    dec b
    jr nz, jr_003_426b

    inc hl
    ld [hl], a
    ldh a, [$ffa2]
    cp $05
    jp z, Jump_003_47a9

    ld hl, $0023
    add hl, de
    ld a, [hl]
    cp $01
    jp z, Jump_003_47a9

    ldh a, [$ffa3]
    and $f0
    cp $c0
    jr z, jr_003_4241

    ldh a, [$ffa2]
    cp $02
    jr nz, jr_003_42af

    xor a
    ldh [rNR30], a
    ld a, [$cb99]
    add a
    ld hl, $4bfe
    ld c, a
    ld b, $00
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld b, $10
    ld c, $30

jr_003_42a5:
    ld a, [hl+]
    ldh [c], a
    inc c
    dec b
    jr nz, jr_003_42a5

    ld a, $80
    ldh [rNR30], a

jr_003_42af:
    ld hl, $0007
    add hl, de
    ld a, [hl+]
    ld [hl], a
    call Call_003_4a35
    ld hl, $0022
    add hl, de
    ld a, [hl]
    and $40
    call nz, Call_003_42d7
    jr jr_003_430c

Call_003_42c4:
    swap a
    ld hl, $000e
    add hl, de
    ld [hl+], a
    ldh a, [$ffa7]
    and $0f
    swap a
    ld [hl], a
    ld hl, $000c
    add hl, de
    ret


Call_003_42d7:
    ld hl, $0010
    add hl, de
    ld a, [hl]
    ldh [$ffa7], a
    and $f0
    jr z, jr_003_42ec

    call Call_003_42c4
    ld bc, $48e9
    ld [hl], c
    inc hl
    ld [hl], b
    ret


Jump_003_42ec:
jr_003_42ec:
    ld hl, $0011
    add hl, de
    ld a, [hl]
    ldh [$ffa7], a
    and $f0
    jr z, jr_003_4301

    call Call_003_42c4
    ld bc, $4918
    ld [hl], c
    inc hl
    ld [hl], b
    ret


Jump_003_4301:
jr_003_4301:
    ld hl, $000c
    add hl, de
    ld bc, $4947
    ld [hl], c
    inc hl
    ld [hl], b
    ret


jr_003_430c:
    ld hl, $0015
    add hl, de
    ld a, [hl-]
    or a
    jr z, jr_003_431d

    ld b, a
    ld a, [hl+]
    inc hl
    inc hl
    ld [hl+], a
    ld [hl], b
    inc hl
    ld [hl], $00

jr_003_431d:
    ldh a, [$ffa3]
    ld hl, $0009
    add hl, de
    ld b, [hl]
    sla b
    and $f0
    add b
    ldh [$ffa7], a
    ldh a, [$ffa2]
    or a
    jr z, jr_003_433e

    cp $01
    ldh a, [$ffa7]
    jr nz, jr_003_4347

    call Call_003_4530
    ld hl, $cbb5
    jr jr_003_4346

jr_003_433e:
    ldh a, [$ffa7]
    call Call_003_452b
    ld hl, $cbb4

jr_003_4346:
    ld [hl], a

Jump_003_4347:
jr_003_4347:
    ld hl, $440f
    ld c, a
    ld b, $00
    add hl, bc
    ld a, [hl+]
    ld c, a
    ldh [$ffa5], a
    ld a, [hl]
    ld b, a
    ldh [$ffa6], a
    ld hl, $0024
    add hl, de
    ld a, [hl]
    ld l, a
    ld h, $00
    add hl, bc
    ld a, l
    ldh [$ffa5], a
    ld a, h
    ldh [$ffa6], a
    ld hl, $000a
    add hl, de
    ldh a, [$ffa5]
    ld [hl+], a
    call Call_003_4a67
    ldh a, [$ffa6]
    and $0f
    ld [hl], a
    or $80
    jp Jump_003_4a71


Jump_003_4379:
    ld hl, $0004
    add hl, de
    dec [hl]
    jr z, jr_003_4381

    ret


jr_003_4381:
    ld hl, $0001
    add hl, de
    ld c, [hl]
    inc hl
    ld b, [hl]

jr_003_4388:
    ld a, [de]
    or a
    ret z

    ld hl, $0023
    add hl, de
    ld a, [hl]
    or a
    jp z, Jump_003_4210

Jump_003_4394:
    ld a, [bc]
    inc bc
    ldh [$ffa3], a
    cp $e0
    jp z, Jump_003_43f1

    and $f0
    cp $f0
    jr nz, jr_003_43a8

    call Call_003_45af
    jr jr_003_4388

jr_003_43a8:
    cp $e0
    jr nz, jr_003_43b1

    call Call_003_45b5
    jr jr_003_4388

jr_003_43b1:
    ld hl, $0003
    add hl, de
    ld a, [hl+]
    ld [hl], a
    ldh a, [$ffa3]
    and $f0
    jr z, jr_003_43dc

    add $20
    call Call_003_4a97
    ld hl, $0008
    add hl, de
    ld [hl+], a
    call Call_003_4a35
    ld a, [bc]
    inc bc
    ld [hl+], a
    call Call_003_4a67
    ldh a, [$ffa3]
    and $0f
    ld [hl], a
    or $80
    call Call_003_4a71
    jr jr_003_4407

jr_003_43dc:
    call Call_003_4407
    ldh a, [$ffa3]
    and $0f
    swap a
    call Call_003_4a97
    or $08
    ldh [rNR42], a
    ld a, $80
    ldh [rNR44], a
    ret


Jump_003_43f1:
    ld a, [bc]
    inc bc
    ld hl, $0004
    add hl, de
    ld [hl], a
    call Call_003_4407
    xor a
    call Call_003_4a35
    ld a, $ff
    call Call_003_4a67
    jp Jump_003_4a71


Call_003_4407:
jr_003_4407:
    ld hl, $0001
    add hl, de
    ld [hl], c
    inc hl
    ld [hl], b
    ret


    add e
    rlca
    ld b, $07
    dec bc
    ld b, $18
    inc b
    jr nc, jr_003_4419

jr_003_4419:
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    adc d
    rlca
    inc d
    rlca
    jr z, jr_003_442b

    ld d, b
    inc b
    and b
    nop
    rst $38
    rst $38

jr_003_442b:
    rst $38
    rst $38
    rst $38
    rst $38
    sub c
    rlca
    ld hl, $4207
    ld b, $84
    inc b
    ld [$ff01], sp
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    sub a
    rlca
    ld l, $07
    ld e, h
    ld b, $b8
    inc b
    ld [hl], b
    ld bc, $ffff
    rst $38
    rst $38
    rst $38
    rst $38
    sbc l
    rlca
    add hl, sp
    rlca
    ld [hl], d
    ld b, $e4
    inc b
    ret z

    ld bc, $ffff
    rst $38
    rst $38
    rst $38
    rst $38
    and d
    rlca
    ld b, l
    rlca
    adc d
    ld b, $14
    dec b
    jr z, jr_003_446b

    rst $38
    rst $38

jr_003_446b:
    rst $38
    rst $38
    rst $38
    rst $38
    and a
    rlca
    ld c, a
    rlca
    sbc [hl]
    ld b, $3c
    dec b
    ld a, b
    ld [bc], a
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    xor h
    rlca
    ld e, c
    rlca
    or d
    ld b, $64
    dec b
    ret z

    ld [bc], a
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    or c
    rlca
    ld h, d
    rlca
    call nz, $8806
    dec b
    db $10
    inc bc
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    or [hl]
    rlca
    ld l, e
    rlca
    sub $06
    xor b
    dec b
    ld d, b
    inc bc
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    cp d
    rlca
    ld [hl], h
    rlca
    add sp, $06
    ret nc

    dec b
    and b
    inc bc
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    cp [hl]
    rlca
    ld a, h
    rlca
    ld hl, sp+$06
    ldh a, [rTIMA]
    ldh [$ff03], a
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38

Jump_003_44cf:
    xor a
    ldh [rNR52], a
    ldh [rNR50], a
    call Call_003_4ae8
    xor a
    ldh [$ffa0], a
    ld a, $77
    ldh [rNR50], a
    ld a, $8f
    ldh [rNR52], a
    jp Jump_003_41b7


Jump_003_44e5:
    ldh a, [$ffa2]
    or a
    jr z, jr_003_450c

    cp $01
    ret nz

    ld a, [$cbb5]
    call Call_003_4530
    ld a, [$cbb1]
    or a
    ret z

    ld hl, $0008
    add hl, de
    ld a, [hl]
    or a
    ret nz

    ld a, $20
    ld [hl], a
    call Call_003_4a35
    call Call_003_4547
    ld a, [hl]
    jp Jump_003_4347


jr_003_450c:
    ld a, [$cbb4]
    call Call_003_452b
    ld a, [$cbb0]
    or a
    ret z

    ld hl, $0008
    add hl, de
    ld a, [hl]
    or a
    ret nz

    ld a, $20
    ld [hl], a
    call Call_003_4a35
    call Call_003_453f
    ld a, [hl]
    jp Jump_003_4347


Call_003_452b:
    ld hl, $cbb2
    jr jr_003_4533

Call_003_4530:
    ld hl, $cbb3

jr_003_4533:
    push af
    ld a, [hl]
    inc a
    and $3f
    ld [hl], a
    call Call_003_4555
    pop af
    ld [hl], a
    ret


Call_003_453f:
    ld hl, $cbb0
    ld a, [$cbb2]
    jr jr_003_454d

Call_003_4547:
    ld hl, $cbb1
    ld a, [$cbb3]

jr_003_454d:
    sub [hl]
    and $3f
    call Call_003_4555
    ld a, [hl]
    ret


Call_003_4555:
    push bc
    push af
    ld hl, $456b
    ldh a, [$ffa2]
    add a
    ld c, a
    ld b, $00
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    pop af
    ld c, a
    ld b, $00
    add hl, bc
    pop bc
    ret


    nop
    bit 0, b
    bit 7, a
    ld b, a
    adc $46
    call nc, $dd46
    ld b, [hl]
    pop af
    ld b, [hl]
    inc c
    ld b, a
    ld h, $47
    ld d, d
    ld b, a
    and $46
    ld a, a
    ld b, a
    ld e, b
    ld b, a
    ld h, d
    ld b, a
    halt
    ld b, a
    ld a, a
    ld b, a
    ld a, a
    ld b, a
    ld a, a
    ld b, a
    ret


    ld b, l
    adc $45
    db $d3
    ld b, l
    jp c, $e545

    ld b, l
    ldh a, [rLYC]
    nop
    ld b, [hl]
    ld [$1146], sp
    ld b, [hl]
    rla
    ld b, [hl]
    ld a, [hl+]
    ld b, [hl]
    ld b, [hl]
    ld b, [hl]
    ld e, c
    ld b, [hl]
    ld h, d
    ld b, [hl]
    ld l, b
    ld b, [hl]
    ld l, [hl]
    ld b, [hl]

Call_003_45af:
    ld hl, $458f
    jp Jump_003_45bb


Call_003_45b5:
    ld hl, $456f
    jp Jump_003_45bb


Jump_003_45bb:
    ldh a, [$ffa3]
    and $0f
    add a
    add l
    ld l, a
    jr nc, jr_003_45c5

    inc h

jr_003_45c5:
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


    ld hl, $001a
    jr jr_003_45dd

    ld hl, $001a
    jr jr_003_45e8

    ld a, [bc]
    ld l, a
    inc bc
    ld a, [bc]
    ld b, a
    ld c, l
    ret


    ld hl, $001d

jr_003_45dd:
    ld a, [bc]
    inc bc
    add hl, de
    ld [hl+], a
    ld [hl], c
    inc hl
    ld [hl], b
    ret


    ld hl, $001d

jr_003_45e8:
    add hl, de
    dec [hl]
    ret z

    inc hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ret


    ld a, [bc]
    inc bc
    push af
    ld a, [bc]
    inc bc
    ld hl, $0020
    add hl, de
    ld [hl], c
    inc hl
    ld [hl], b
    ld b, a
    pop af
    ld c, a
    ret


    ld hl, $0020
    add hl, de
    ld c, [hl]
    inc hl
    ld b, [hl]
    ret


    ld hl, $0005
    call Call_003_4780
    jp Jump_003_4a21


    ld hl, $0024
    jp Jump_003_4780


    ld a, [bc]
    inc bc
    ld hl, $0014
    add hl, de
    ld [hl+], a
    ld a, [bc]
    and $f0
    swap a
    ld [hl+], a
    ld a, [bc]
    inc bc
    and $0f
    ld [hl], a
    ret


    ld a, [bc]
    inc bc
    push af
    ld hl, $0006
    add hl, de
    and $c0
    ld [hl], a
    ldh a, [$ffa2]
    cp $02
    jr z, jr_003_463e

    ld a, [hl]
    call Call_003_4a2b

jr_003_463e:
    inc hl
    pop af
    and $0f
    swap a
    ld [hl], a
    ret


    ld hl, $0010
    add hl, de
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl], a
    jp Jump_003_4776


    ld hl, $0022
    add hl, de
    ld a, [hl]
    and $bf
    ld [hl], a
    ret


    ld hl, $0003
    jp Jump_003_4780


    ld hl, $0023
    jp Jump_003_4780


    ld hl, $0000
    add hl, de
    xor a
    ld [hl], a
    ldh a, [$ffa2]
    cp $05
    jr nz, jr_003_4683

    ld a, [$ca78]
    or a
    ret nz

    xor a
    ldh [rNR42], a
    ret


jr_003_4683:
    cp $04
    jr nz, jr_003_468c

    ld a, $ff
    ld [$cb94], a

jr_003_468c:
    ld hl, $4be0
    ldh a, [$ffa2]
    or a
    jr z, jr_003_46b8

    push bc
    ld b, $00
    cp $01
    jr nz, jr_003_469f

    ld c, $05
    jr jr_003_46b6

jr_003_469f:
    cp $02
    jr nz, jr_003_46a7

    ld c, $0a
    jr jr_003_46b6

jr_003_46a7:
    cp $03
    jr nz, jr_003_46b4

    ld c, $0f
    ld a, $ff
    ld [$cb9a], a
    jr jr_003_46b6

jr_003_46b4:
    ld c, $14

jr_003_46b6:
    add hl, bc
    pop bc

jr_003_46b8:
    ld a, [hl+]
    cp $ee
    call nz, Call_003_4a21
    ld a, [hl+]
    call Call_003_4a2b
    ld a, [hl+]
    call Call_003_4a35
    ld a, [hl+]
    call Call_003_4a67
    ld a, [hl]
    jp Jump_003_4a71


    ld hl, $0003
    jp Jump_003_4780


    ld hl, $000a
    call Call_003_4780
    ldh [rNR43], a
    ret


    ld hl, $0006
    call Call_003_4780
    jp Jump_003_4a2b


    ld hl, $cbb0
    ldh a, [$ffa2]
    add l
    ld l, a
    ld a, [bc]
    inc bc
    ld [hl], a
    ret


    ld hl, $0025
    add hl, de
    ld [hl], $00
    call Call_003_4a8b
    ret nz

    ldh a, [$ffa2]
    cp $05
    jr nz, jr_003_4706

    ld a, [$ca78]
    or a
    ret nz

jr_003_4706:
    ld hl, $4785
    jp Jump_003_473e


    ld hl, $0025
    add hl, de
    ld [hl], $01
    call Call_003_4a8b
    ret nz

    ldh a, [$ffa2]
    cp $05
    jr nz, jr_003_4721

    ld a, [$ca78]
    or a
    ret nz

jr_003_4721:
    ld hl, $4791
    jr jr_003_473e

Call_003_4726:
    ld hl, $0025
    add hl, de
    ld [hl], $02
    call Call_003_4a8b
    ret nz

    ldh a, [$ffa2]
    cp $05
    jr nz, jr_003_473b

    ld a, [$ca78]
    or a
    ret nz

jr_003_473b:
    ld hl, $479d

Jump_003_473e:
jr_003_473e:
    ldh a, [$ffa2]
    add a
    add l
    ld l, a
    jr nc, jr_003_4746

jr_003_4745:
    inc h

jr_003_4746:
    ld a, [$cb95]
    and [hl]
    inc hl
    or [hl]
    ldh [rNR51], a
    ld [$cb95], a
    ret


    ld a, [bc]
    inc bc
    ld [$cb99], a
    ret


    ld hl, $0022
    add hl, de
    ld a, [hl]
    and $bf
    ld [hl], a
    jr jr_003_476a

    ld hl, $0022
    add hl, de
    ld a, [hl]
    or $40
    ld [hl], a

jr_003_476a:
    ld hl, $0007
    add hl, de
    ld a, [bc]
    inc bc
    and $0f
    swap a
    ld [hl], a
    ret


Jump_003_4776:
    ld hl, $0022
    add hl, de
    ld a, [hl]
    or $40
    ld [hl], a
    ret


    ret


Call_003_4780:
Jump_003_4780:
    ld a, [bc]
    inc bc
    add hl, de
    ld [hl], a
    ret


    xor $10
    db $dd
    jr nz, jr_003_4745

    ld b, b
    ld [hl], a
    add b
    xor $10
    ld [hl], a
    add b
    xor $01
    db $dd
    ld [bc], a
    cp e
    inc b
    ld [hl], a
    ld [$01ee], sp
    ld [hl], a
    ld [$11ee], sp
    db $dd
    ld [hl+], a
    cp e
    ld b, h
    ld [hl], a
    adc b
    xor $11
    ld [hl], a
    adc b

Jump_003_47a9:
    ld a, [$ca78]
    or a
    jr z, jr_003_47b7

    ld hl, $0023
    add hl, de
    ld a, [hl]
    cp $01
    ret nz

jr_003_47b7:
    ld a, [$cb9a]
    or a
    jr z, jr_003_47cd

    xor a
    ld [$cb9a], a
    ld a, [$cb95]
    and $77
    or $88
    ldh [rNR51], a
    ld [$cb95], a

jr_003_47cd:
    ldh a, [$ffa3]
    and $f0
    swap a
    add a
    ld hl, $4853
    add l
    ld l, a
    jr nc, jr_003_47dc

    inc h

jr_003_47dc:
    ld a, [hl+]
    ld b, [hl]
    ld c, a
    jp Jump_003_4800


Jump_003_47e2:
    ld a, [$ca78]
    or a
    jr z, jr_003_47f0

    ld hl, $0023
    add hl, de
    ld a, [hl]
    cp $01
    ret nz

jr_003_47f0:
    ld hl, $0011
    add hl, de
    dec [hl]
    ret nz

    ld hl, $000c
    add hl, de
    ld a, [hl]
    or a
    ret z

    ld c, a
    inc hl
    ld b, [hl]

Jump_003_4800:
    ld a, [bc]
    inc bc
    ldh [$ffa4], a
    cp $ff
    jr nz, jr_003_4816

    xor a
    ldh [rNR41], a
    ldh [rNR42], a
    ldh [rNR43], a
    ld hl, $000c
    add hl, de
    ld [hl+], a
    ld [hl], a
    ret


jr_003_4816:
    ldh a, [$ffa4]
    and $f0
    jr nz, jr_003_4837

    ld hl, $0010
    add hl, de
    ld a, [hl+]
    ld [hl], a
    ldh a, [$ffa4]
    swap a
    ldh [rNR42], a
    call Call_003_4a97
    ld a, $80
    ldh [rNR44], a
    ld hl, $000c
    add hl, de
    ld [hl], c
    inc hl
    ld [hl], b
    ret


jr_003_4837:
    cp $e0
    jr nz, jr_003_4847

    ldh a, [$ffa4]
    and $0f
    ld hl, $0010
    add hl, de
    ld [hl], a
    jp Jump_003_4800


jr_003_4847:
    ld a, [bc]
    inc bc
    ld hl, $000a
    add hl, de
    ld [hl], a
    ldh [rNR43], a
    jp Jump_003_4800


    ld l, l
    ld c, b
    ld a, c
    ld c, b
    add c
    ld c, b
    adc c
    ld c, b
    sub h
    ld c, b
    and c
    ld c, b
    xor l
    ld c, b
    cp c
    ld c, b
    add $48
    db $d3
    ld c, b
    ldh [rOBP0], a
    ldh [rOBP0], a
    ldh [rOBP0], a
    pop hl
    ret nc

    ld [hl], $0f
    ret nc

    scf
    rrca
    ret nc

    dec [hl]
    inc bc
    ld [bc], a
    rst $38
    pop hl
    ret nc

    ld bc, $d009
    nop
    inc b
    rst $38
    pop hl
    ret nc

    ld bc, $d00c
    nop
    ld b, $ff
    pop hl
    ret nc

    ld bc, $e60b
    dec b
    inc b
    inc bc
    ld [bc], a
    ld bc, $e1ff
    ret nc

    ld bc, $e60e
    rlca
    ld b, $05
    inc b
    inc bc
    ld [bc], a
    ld bc, $e1ff
    ret nc

    dec d
    dec bc
    ret nc

    rlca
    db $e3
    dec b
    inc b
    inc bc
    ld [bc], a
    rst $38
    pop hl
    ret nc

    dec d
    inc c
    ret nc

    rlca
    db $e3
    dec b
    inc b
    inc bc
    ld [bc], a
    rst $38
    pop hl
    ret nc

    dec d
    dec c
    ret nc

    rlca
    db $e3
    dec b
    inc b
    inc bc
    ld [bc], a
    ld bc, $e1ff
    ret nc

    dec d
    ld c, $d0
    rlca
    db $e3
    dec b
    inc b
    inc bc
    ld [bc], a
    ld bc, $e1ff
    ret nc

    ld d, $0f
    ret nc

    rlca
    push hl
    dec b
    inc b
    inc bc
    ld [bc], a
    ld bc, $ffff

Call_003_48e1:
    ld hl, $000c
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


    call Call_003_49a5
    jp nc, Jump_003_494b

    ld hl, $0008
    add hl, de
    ld a, [hl]
    ld hl, $000f
    add hl, de
    add [hl]
    jr nc, jr_003_48fd

    ld a, $f0

jr_003_48fd:
    ld hl, $0008
    add hl, de
    ld [hl], a
    call Call_003_4a35
    ld hl, $000b
    add hl, de
    ld a, [hl]
    or $80
    call Call_003_4a71
    ld hl, $000e
    add hl, de
    dec [hl]
    jp z, Jump_003_42ec

    ret


    call Call_003_49a5
    jp nc, Jump_003_494b

    ld hl, $0008
    add hl, de
    ld a, [hl]
    ld hl, $000f
    add hl, de
    sub [hl]
    jr nc, jr_003_492c

    ld a, $10

jr_003_492c:
    ld hl, $0008
    add hl, de
    ld [hl], a
    call Call_003_4a35
    ld hl, $000b
    add hl, de
    ld a, [hl]
    or $80
    call Call_003_4a71
    ld hl, $000e
    add hl, de
    dec [hl]
    jp z, Jump_003_4301

    ret


    call Call_003_49a5
    ret c

Jump_003_494b:
    call Call_003_49b0
    ld hl, $0013
    add hl, de
    ld a, [hl]
    ldh [$ffa7], a
    and $f0
    call Call_003_42c4
    ld bc, $4961
    ld [hl], c
    inc hl
    ld [hl], b
    ret


    ld hl, $000f
    add hl, de
    ld a, [hl]
    sub $10
    ld [hl], a
    ret nz

    ld hl, $000e
    add hl, de
    ld a, [hl]
    dec a
    jr z, jr_003_4985

    ld [hl], a
    call Call_003_49b0
    ld hl, $0013
    add hl, de
    ld a, [hl]
    and $0f
    swap a
    ld hl, $000f
    add hl, de
    ld [hl], a
    ret


jr_003_4985:
    ld hl, $0008
    add hl, de
    ld [hl], $00
    call Call_003_4a35
    push bc
    ld bc, $49a4
    ld hl, $000c
    add hl, de
    ld [hl], c
    inc hl
    ld [hl], b
    pop bc
    ldh a, [$ffa2]
    cp $02
    ret z

    ld a, $80
    jp Jump_003_4a71


    ret


Call_003_49a5:
    ld hl, $0012
    add hl, de
    ld a, [hl]
    ld hl, $0004
    add hl, de
    cp [hl]
    ret


Call_003_49b0:
    ld hl, $0008
    add hl, de
    ld a, [hl]
    or a
    jp z, Jump_003_49bf

    sub $10
    jr nz, jr_003_49bf

    ld a, $10

Jump_003_49bf:
jr_003_49bf:
    ld [hl], a
    call Call_003_4a35
    ld hl, $000b
    add hl, de
    ld a, [hl]
    or $80
    jp Jump_003_4a71


Call_003_49cd:
    ld hl, $0016
    add hl, de
    ld a, [hl+]
    or a
    ret z

    ld a, [hl]
    or a
    jr z, jr_003_49da

    dec [hl]
    ret


jr_003_49da:
    inc hl
    dec [hl]
    jr z, jr_003_49df

    ret


jr_003_49df:
    ld hl, $0015
    add hl, de
    ld a, [hl+]
    inc hl
    inc hl
    ld [hl], a
    ld hl, $0019
    add hl, de
    ld a, [hl]
    xor $01
    ld [hl], a
    ld hl, $0016
    add hl, de
    ld a, [hl]
    jr z, jr_003_4a14

    ld hl, $000a
    add hl, de
    ld c, [hl]
    inc hl
    ld b, [hl]
    add c
    ld c, a
    jr nc, jr_003_4a02

    inc b

jr_003_4a02:
    ld hl, $000a
    add hl, de
    ld a, c
    ld [hl+], a
    call Call_003_4a67
    ld a, b
    cp [hl]
    ret z

    ld [hl], a
    and $0f
    jp Jump_003_4a71


jr_003_4a14:
    ld hl, $000a
    add hl, de
    ld c, [hl]
    inc hl
    ld b, [hl]

jr_003_4a1b:
    dec bc
    dec a
    jr nz, jr_003_4a1b

    jr jr_003_4a02

Call_003_4a21:
Jump_003_4a21:
    call Call_003_4a89
    ret nz

    push hl
    ld hl, $4aa4
    jr jr_003_4a79

Call_003_4a2b:
Jump_003_4a2b:
    call Call_003_4a89
    ret nz

    push hl
    ld hl, $4ab0
    jr jr_003_4a79

Call_003_4a35:
    call Call_003_4a89
    ret nz

    push hl
    ldh a, [$ffa2]
    cp $02
    jr nz, jr_003_4a59

    ldh a, [$ffa7]
    call Call_003_4a97
    swap a
    and $0f
    ld hl, $4ae0
    add l
    ld l, a
    jr nc, jr_003_4a51

    inc h

jr_003_4a51:
    ld a, [hl]
    ldh [$ffa7], a
    ld hl, $4abc
    jr jr_003_4a79

jr_003_4a59:
    ldh a, [$ffa7]
    and $f0
    or $08
    call Call_003_4a97
    ld hl, $4abc
    jr jr_003_4a79

Call_003_4a67:
    call Call_003_4a89
    ret nz

    push hl
    ld hl, $4ac8
    jr jr_003_4a79

Call_003_4a71:
Jump_003_4a71:
    call Call_003_4a89
    ret nz

    push hl
    ld hl, $4ad4

jr_003_4a79:
    ldh a, [$ffa2]
    add a
    add l
    ld l, a
    jr nc, jr_003_4a81

    inc h

jr_003_4a81:
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ldh a, [$ffa7]
    ld [hl], a
    pop hl
    ret


Call_003_4a89:
    ldh [$ffa7], a

Call_003_4a8b:
    ldh a, [$ffa2]
    or a
    jr nz, jr_003_4a95

    ld a, [$caa0]
    or a
    ret


jr_003_4a95:
    xor a
    ret


Call_003_4a97:
    ldh [$ffa7], a
    ldh a, [$ffa2]
    add $f0
    ld l, a
    ld h, $cb
    ldh a, [$ffa7]
    ld [hl], a
    ret


    db $10
    rst $38
    dec d
    rst $38
    ld a, [de]
    rst $38
    rra
    rst $38
    db $10
    rst $38
    rra
    rst $38
    ld de, $16ff
    rst $38
    dec de
    rst $38
    jr nz, @+$01

    ld de, $20ff
    rst $38
    ld [de], a
    rst $38
    rla
    rst $38
    inc e
    rst $38
    ld hl, $12ff
    rst $38
    ld hl, $13ff
    rst $38
    jr @+$01

    dec e
    rst $38
    ld [hl+], a
    rst $38
    inc de
    rst $38
    ld [hl+], a
    rst $38
    inc d
    rst $38
    add hl, de
    rst $38
    ld e, $ff
    inc hl
    rst $38
    inc d
    rst $38
    inc hl
    rst $38
    nop
    ld h, b
    ld b, b
    jr nz, jr_003_4ae5

jr_003_4ae5:
    nop
    nop
    nop

Call_003_4ae8:
    xor a
    ld [SOUND_CONTROL], a
    ld [$cb97], a
    ld [$cb9b], a
    ld [$cbb0], a
    ld [$cbb1], a
    ld [$cbb4], a
    ld [$cbb5], a
    ld hl, $4c40
    ldh a, [$ffa0]
    jr jr_003_4b2b

Call_003_4b05:
    ld hl, $7bbc
    ldh a, [$ffa1]
    jr jr_003_4b2b

jr_003_4b0c:
    inc bc
    inc bc

Jump_003_4b0e:
jr_003_4b0e:
    ldh a, [$ffa2]
    inc a
    ldh [$ffa2], a
    cp $06
    jr nz, jr_003_4b23

    ld a, $77
    ld [$cb98], a
    ldh [rNR50], a
    ld a, $ff
    ldh [rNR51], a
    ret


jr_003_4b23:
    ld hl, $0028
    add hl, de
    ld e, l
    ld d, h
    jr jr_003_4b44

jr_003_4b2b:
    dec a
    add a
    ld e, a
    ld d, $00
    add hl, de
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld a, [bc]
    ld [$cb92], a
    inc bc
    ld a, [bc]
    ld [$cb93], a
    inc bc
    ld de, $ca00
    xor a
    ldh [$ffa2], a

jr_003_4b44:
    ld a, [$cb92]
    add a
    ld [$cb92], a
    jr nc, jr_003_4b0e

    ld hl, $0000
    add hl, de
    ld a, [$cb93]
    cp [hl]
    jr c, jr_003_4b0c

    push de
    ld l, $28
    xor a

jr_003_4b5b:
    ld [de], a
    inc de
    dec l
    jr nz, jr_003_4b5b

    pop de
    ld hl, $0004
    add hl, de
    ld [hl], $01
    ld hl, $000b
    add hl, de
    ld [hl], $ff
    call Call_003_4726
    ldh a, [$ffa2]
    cp $05
    jr nz, jr_003_4b8b

    ld a, [$ca78]
    or a
    jp nz, Jump_003_4bc8

    xor a
    ldh [rNR41], a
    ldh [rNR42], a
    ldh [rNR43], a
    ld a, $80
    ldh [rNR44], a
    jp Jump_003_4bc8


jr_003_4b8b:
    push bc
    ld hl, $4be0
    ldh a, [$ffa2]
    or a
    jr z, jr_003_4bb1

    ld b, $00
    cp $01
    jr nz, jr_003_4b9e

    ld c, $05
    jr jr_003_4bb0

jr_003_4b9e:
    cp $02
    jr nz, jr_003_4ba6

    ld c, $0a
    jr jr_003_4bb0

jr_003_4ba6:
    cp $03
    jr nz, jr_003_4bae

    ld c, $0f
    jr jr_003_4bb0

jr_003_4bae:
    ld c, $14

jr_003_4bb0:
    add hl, bc

jr_003_4bb1:
    pop bc
    ld a, [hl+]
    cp $ee
    call nz, Call_003_4a21
    ld a, [hl+]
    call Call_003_4a2b
    ld a, [hl+]
    call Call_003_4a35
    ld a, [hl+]
    call Call_003_4a67
    ld a, [hl]
    call Call_003_4a71

Jump_003_4bc8:
    ld hl, $0000
    add hl, de
    ld a, [$cb93]
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl+], a
    ld a, [bc]
    inc bc
    ld [hl], a
    ld hl, $0022
    add hl, de
    ld a, $80
    ld [hl], a
    jp Jump_003_4b0e


    ld [$0800], sp
    nop
    ret nz

    xor $00
    ld [$c000], sp
    add b
    nop
    nop
    nop
    ret nz

    xor $00
    ld [$c000], sp
    ld [$0800], sp
    nop
    ret nz

    xor $00
    ld [$c000], sp
    jr nz, jr_003_4c4c

    jr nz, jr_003_4c4e

    jr nz, jr_003_4c50

    jr nz, jr_003_4c52

    jr nz, jr_003_4c54

    jr nz, @+$4e

    jr nz, jr_003_4c58

    jr nc, jr_003_4c5a

    jr nc, jr_003_4c5c

    jr nc, jr_003_4c5e

    jr nc, jr_003_4c60

    jr nc, jr_003_4c62

    jr nc, jr_003_4c64

    jr nc, jr_003_4c66

    jr nc, jr_003_4c68

    jr nc, jr_003_4c6a

    jr nc, jr_003_4c6c

    cp a
    rst $38
    jp c, Jump_003_7688

    ld sp, $3701
    cp h
    rst $28
    db $ec
    sbc b
    ld [hl], a
    ld d, d
    nop
    inc b
    cp [hl]
    sbc $96
    halt
    sbc b
    sub l
    ld [de], a
    inc d
    cp [hl]
    sbc $96
    halt
    sbc b
    sub l
    ld [de], a
    inc d
    ld [hl], d
    ld c, h
    add b
    ld c, h
    adc d
    ld c, h
    sub h
    ld c, h
    sbc [hl]
    ld c, h
    xor b
    ld c, h

jr_003_4c4c:
    or d
    ld c, h

jr_003_4c4e:
    cp h
    ld c, h

jr_003_4c50:
    add $4c

jr_003_4c52:
    ret nc

    ld c, h

jr_003_4c54:
    jp c, $e44c

    ld c, h

jr_003_4c58:
    xor $4c

jr_003_4c5a:
    ld hl, sp+$4c

jr_003_4c5c:
    ld [bc], a
    ld c, l

jr_003_4c5e:
    inc c
    ld c, l

jr_003_4c60:
    ld d, $4d

jr_003_4c62:
    jr nz, @+$4f

jr_003_4c64:
    ld a, [hl+]
    ld c, l

jr_003_4c66:
    inc [hl]
    ld c, l

jr_003_4c68:
    ld a, $4d

jr_003_4c6a:
    ld c, b
    ld c, l

jr_003_4c6c:
    ld d, d
    ld c, l
    ld e, h
    ld c, l
    ld h, [hl]
    ld c, l
    db $fc
    ldh a, [rSVBK]
    ld c, l
    ld [hl], b
    ld c, l
    ld [hl], b
    ld c, l
    ld [hl], b
    ld c, l
    ld [hl], b
    ld c, l
    ld [hl], b
    ld c, l
    db $e4
    ldh a, [rSVBK]
    ld c, l
    ld [hl], b
    ld c, l
    ld [hl], b
    ld c, l
    ld [hl], b
    ld c, l
    db $e4
    add b
    ld [hl], c
    ld c, l
    ld e, $4e
    jp z, Jump_003_7f4e

    ld c, a
    db $e4
    add b
    rst $08
    ld c, a
    ld l, [hl]
    ld d, b
    ret nz

    ld d, b
    scf
    ld d, c
    db $e4
    add b
    ld e, [hl]
    ld d, c
    di
    ld d, c
    ld e, [hl]
    ld d, d
    ret nc

    ld d, d
    db $e4
    add b
    db $ed
    ld d, d
    ld hl, sp+$53
    jr nc, @+$57

    ld a, $56
    db $e4
    add b
    ret


    ld d, [hl]
    call nc, Call_000_0c57
    ld e, c
    inc hl
    ld e, c
    db $e4
    add b
    jr z, jr_003_4d19

    inc sp
    ld e, d
    ld l, e
    ld e, e
    add d
    ld e, e
    db $e4
    add b
    add a
    ld e, e
    sub d
    ld e, h
    jp z, $e15d

    ld e, l
    db $e4
    add b
    and $5d
    ldh [c], a
    ld e, [hl]
    and d
    ld e, a
    ld e, b
    ld h, b
    db $e4
    add b
    rst $18
    ld h, l
    ld h, d
    ld h, [hl]
    sub $66
    ld l, h
    ld h, a
    db $e4
    add b
    adc [hl]
    ld h, b
    ld [$8c61], sp
    ld h, c
    call nc, $e462
    add b
    ld h, $63
    push de
    ld h, e
    sbc [hl]
    ld h, h
    ld l, e
    ld h, l
    db $e4
    add b
    jp $8467


    ld l, b
    inc [hl]
    ld l, c
    ld [hl], h
    ld l, d
    db $e4
    add b
    ldh [rOCPS], a
    jr c, jr_003_4d73

    sbc l
    ld l, e
    ld [$e46c], sp
    add b
    inc hl
    ld l, h
    sbc e
    ld l, h
    ld [hl], $6d
    dec hl
    ld l, [hl]
    db $e4
    add b
    ld a, h

jr_003_4d19:
    ld l, [hl]
    ld c, b
    ld l, a
    cpl
    ld [hl], b
    dec e
    ld [hl], c
    db $e4
    add b
    ld [hl], h
    ld [hl], c
    inc b
    ld [hl], d
    ld [hl], e
    ld [hl], d
    db $ec
    ld [hl], d
    db $e4
    add b
    jr nz, jr_003_4da1

    adc l
    ld [hl], e
    cp b
    ld [hl], e
    di
    ld [hl], e
    db $e4
    add b
    inc de
    ld [hl], h
    dec [hl]
    ld [hl], h
    ld l, l
    ld [hl], h
    adc c
    ld [hl], h
    db $e4
    add b
    and l
    ld [hl], h
    ret nz

    ld [hl], h
    db $dd
    ld [hl], h
    ldh a, [c]
    ld [hl], h
    db $e4
    add b
    inc bc
    ld [hl], l
    jr nz, jr_003_4dc3

    ccf
    ld [hl], l
    ld d, h
    ld [hl], l
    db $e4
    add b
    ld l, d
    ld [hl], l
    adc a
    ld [hl], l
    or h
    ld [hl], l
    sub $75
    db $e4
    add b
    rst $28
    ld [hl], l
    ld e, c
    halt
    jp nc, Jump_000_0f76

    ld [hl], a
    db $e4
    add b
    ld d, b
    ld [hl], a
    ld c, c
    ld a, b
    add hl, sp
    ld a, c
    ld a, [hl+]
    ld a, e
    rst $38
    db $fd
    dec b

jr_003_4d73:
    ld a, [$fb38]
    ld de, $0313
    ld hl, $0ee8
    ld sp, hl
    add hl, bc
    ld d, d
    db $d3
    ld [hl], c
    or c
    jp nc, Jump_003_7321

    ld h, c
    ld b, c
    ld hl, $2141
    ld b, c
    ld [hl], a
    pop de
    jr nc, @+$52

    ld [hl], c
    ld sp, $a1d2
    ld [hl], a
    sub b
    ld [hl], b
    ld h, c
    sub c
    pop de
    ld hl, $d369
    ld [hl], c
    or c
    jp nc, Jump_003_7321

jr_003_4da1:
    ld h, c
    ld b, c
    ld hl, $2141
    ld b, c
    ld [hl], a
    pop de
    ld [hl], b
    sub b
    and l
    ld d, b
    jr nc, @+$03

    jp nc, $91a1

    ld [hl], c
    ld h, c
    sub c
    pop de
    ld hl, $7163
    sub c
    or c
    pop de
    and c
    ret nc

    ld bc, $a1d1
    and e
    and c

jr_003_4dc3:
    sub c
    and c
    ret nc

    inc bc
    pop de
    sub e
    ld d, e
    ret nc

    inc bc
    pop de
    and c
    ret nc

    ld bc, $a1d1
    and e
    and c
    sub c
    and c
    sbc a
    ld a, [$d276]
    sub c
    pop bc
    sub c
    jp $c191


    sub c
    pop de
    ld bc, $01c1
    jp $c101


    ld bc, $38fa
    pop de
    ld hl, $d021
    inc hl
    inc hl
    inc hl
    ld bc, $0121
    rlca
    pop de
    or b
    sub b
    or a
    sub c
    ld [hl], c
    ld hl, $fcd2
    or c
    db $ec
    cp a
    jp nc, $5151

    pop de
    ld d, e
    ld d, e
    ld d, e
    jp nc, $a1a1

    pop de
    sub c
    ld [hl], e
    sub c
    ld [hl], e
    ld d, c
    ld [hl], c
    sub c
    ret nc

    add hl, bc
    pop de
    ld bc, $7161
    sbc c
    ldh a, [c]
    ld a, a
    ld c, l
    db $fd
    dec b
    ld a, [$fb79]
    ld de, $0313
    ld hl, $0ee8
    ld sp, hl
    add hl, bc
    ld d, d
    jp nc, $b171

    pop de
    ld hl, $6173
    ld b, c
    ld hl, $2141
    ld b, c
    ld [hl], l
    pop bc
    ld [hl], b
    sub b
    and c
    ld [hl], c
    ld sp, $a5d2
    pop bc
    pop de
    nop
    jp nc, $91a0

    pop de
    ld hl, $9961
    jp nc, $b171

    pop de
    ld hl, $6173
    ld b, c
    ld hl, $2141
    ld b, c
    ld [hl], l
    pop bc
    or b
    ret nc

    nop
    dec [hl]
    pop de
    and b
    ld [hl], b
    ld sp, $0121
    jp nc, $91a1

    pop de
    ld hl, $9361
    or c
    ret nc

    ld bc, $3121
    ld d, c
    ld sp, $3133
    ld hl, $5331
    inc bc
    pop de
    sub e
    ret nc

    ld d, e
    ld sp, $3151
    inc sp
    ld sp, $3121
    ld e, a
    ld a, [$d136]
    ld bc, $01c1
    jp $c101


    ld bc, $c131
    ld sp, $31c3
    pop bc
    ld sp, $79fa
    ld d, c
    ld d, c
    ret nc

    ld d, e
    ld d, e
    ld d, e
    ld d, c
    ld [hl], c
    ld d, c
    ld d, a
    jr nz, jr_003_4ea2

jr_003_4ea2:
    daa
    ld bc, $b1d1
    ld [hl], c
    db $fc
    ld hl, $2fec
    ld bc, $d001
    inc bc
    inc bc
    inc bc
    pop de
    ld sp, $d031
    ld bc, $a3d1
    ret nc

    ld bc, $a3d1
    sub c
    and c
    ret nc

    ld bc, $d159
    sub c
    ret nc

    ld bc, $6921
    ldh a, [c]
    inc l
    ld c, [hl]
    db $fd
    dec b
    ld a, [$fb03]
    nop
    nop
    ld [bc], a
    ld de, $06e7
    di
    ld [bc], a
    call nc, Call_000_02f0
    ld [hl], c
    ld [hl], c
    ld [hl], c
    ld [hl], c
    ld [hl], c
    ld [hl], c
    ld [hl], c
    ld [hl], b
    ld [hl], b
    pop af
    db $d3
    ld sp, $3131
    ld sp, $3131
    ld sp, $3030
    ld hl, $2121
    ld hl, $2121
    ld hl, $2020
    db $f4
    ld sp, $3131
    ld sp, $3131
    ld sp, $3030
    ld d, c
    ld d, c
    ld d, c
    ld d, c
    ld d, c
    ld d, c
    ld d, c
    ld d, b
    ld d, b
    ld h, c
    ld h, c
    ld h, c
    ld h, c
    ld h, c
    ld h, c
    ld h, c
    ld h, b
    ld h, b
    call nc, $5151
    ld [hl], c
    ld [hl], c
    sub c
    sub c
    db $d3
    ld bc, $0000
    call nc, Call_003_7171
    sub c
    sub c
    and c
    and c
    db $d3
    ld bc, $d401
    sub c
    sub c
    and c
    and c
    db $d3
    ld bc, $5101
    ld d, c
    call nc, $a1a1
    and c
    and c
    and c
    and c
    and c
    and b
    and b
    sub c
    sub c
    sub c
    sub c
    sub c
    sub c
    sub c
    sub b
    sub b
    ld [hl], c
    ld [hl], c
    ld [hl], c
    ld [hl], c
    ld [hl], c
    ld [hl], c
    ld [hl], c
    ld [hl], b
    ld [hl], b
    ld [hl], c
    ld [hl], c
    ld hl, $5121
    ld d, c
    ld [hl], c
    ld [hl], b
    ld [hl], b
    ld d, c
    ld d, c
    ld d, c
    ld d, c
    ld d, c
    ld d, c
    ld d, c
    ld d, b
    ld d, b
    ld sp, $3131
    ld sp, $3131
    ld sp, $3030
    ld d, c
    ld d, c
    ld d, c
    ld d, c
    ld d, c
    ld d, c
    ld d, c
    ld d, b
    ld d, b
    db $d3
    ld hl, $2121
    ld hl, $2121
    ld hl, $2020
    ldh a, [c]
    push de
    ld c, [hl]
    db $fd
    dec b
    ldh a, [rTAC]
    ld bc, $1010
    ld h, c
    db $10
    db $10
    pop af
    ld bc, $6161
    ld h, c
    ldh a, [rTAC]
    ld bc, $1010
    ld h, c
    db $10
    db $10
    pop af
    ld bc, $6161
    ld h, c
    ldh a, [rTMA]
    ld bc, $1010
    ld h, c
    db $10
    db $10
    pop af
    ldh a, [$ff03]
    ld bc, $1010
    ld h, c
    db $10
    db $10
    ld bc, $0161
    ld h, c
    pop af
    di
    ld [bc], a
    ldh a, [$ff03]
    ld bc, $1010
    ld h, c
    db $10
    db $10
    ld bc, $0161
    ld h, c
    pop af
    ld bc, $1010
    ld h, c
    db $10
    db $10
    ld bc, $6161
    ld h, b
    ld h, b
    db $f4
    ldh a, [c]
    add c
    ld c, a
    db $fd
    ld b, $fa
    add hl, sp
    ei
    ld de, $0515
    ld [hl+], a
    add sp, $12
    db $d3
    ldh a, [rSC]
    ld h, c
    ld h, c
    ld h, c
    ld h, b
    ld h, b
    pop af
    ldh a, [rSC]
    sub c
    sub c
    sub c
    sub b
    sub b
    pop af
    ldh a, [rSC]
    ld bc, $0101
    nop
    nop
    pop af
    ldh a, [rSC]
    ld [hl], c
    ld [hl], c
    ld [hl], c
    ld [hl], b
    ld [hl], b
    pop af
    ldh a, [rSC]
    sub c
    sub c
    sub c
    sub b
    sub b
    pop af
    ldh a, [rSC]
    ld bc, $0101
    nop
    nop
    pop af
    ldh a, [rSC]
    ld hl, $2121
    jr nz, jr_003_5032

    pop af
    ld h, c
    or c
    or c
    jp nc, Jump_000_1111

    ld hl, $1121
    ei
    ld de, $0a14
    inc sp
    ld sp, hl
    inc c
    ld d, e
    jp nc, $d167

    daa
    rla
    ld b, a
    rlca
    jp nc, $2777

    ld [hl], a
    sub a
    pop de
    inc de

jr_003_5032:
    jp nc, $7793

    ld b, a
    sbc a
    ei
    ld de, $0514
    ld [hl+], a
    pop bc
    jp nc, Jump_000_2121

    ld b, c
    ld b, c
    ld h, c
    ld h, c
    ld b, c
    or a
    ld [hl], c
    sub c
    or e
    ld h, a
    sub a
    pop de
    rlca
    jp nc, $d191

    ld bc, $d201
    sub c
    or l
    ld [hl], c
    or a
    pop de
    rla
    jp nc, $d197

    scf
    jp nc, $d1b7

    db $fc
    ld e, l
    db $ec
    ld e, a
    db $d3
    ld d, c
    jp nc, Jump_000_1ffc

    db $ec
    rra
    ldh a, [c]
    jp c, $fd4f

    ld b, $f9
    inc c
    ld d, e
    add sp, $12
    ld a, [$f5b9]
    jr jr_003_50cb

    db $d3
    sub c
    jp nc, Jump_000_2121

    ld b, c
    ld b, c
    ld h, c
    ld h, c
    ld b, c
    push af
    jr jr_003_50d8

    ei
    ld de, $0514
    ld [hl+], a
    jp nc, Jump_003_71c1

    ld [hl], c
    sub c
    sub c
    or c
    or c
    sub c
    ei
    ld de, $0414
    inc de
    pop de
    ld [hl], a
    ld [hl], c
    ld h, c
    ld b, c
    ld hl, $6797
    sub a
    sub c
    ld [hl], c
    ld d, c
    sub c
    or e
    ld [hl], e
    inc hl
    or e
    ret nc

    rla
    pop de
    sub a
    or a
    ld h, a
    db $fc
    adc l
    db $ec
    adc a
    ld a, [$d279]
    ld de, $5ffc
    db $ec
    ld e, a
    ldh a, [c]
    ld [hl], l
    ld d, b
    db $fd
    ld b, $fa
    inc bc
    ei
    nop
    nop
    inc b
    ld de, $06e7

jr_003_50cb:
    di
    ld [bc], a
    db $d3
    ldh a, [$ff08]
    ld hl, $f0f1

Jump_003_50d3:
    ld [$f111], sp
    ldh a, [$ff08]

jr_003_50d8:
    ld bc, $d4f1
    ldh a, [$ff08]
    or c
    pop af
    ldh a, [$ff08]
    sub c
    pop af
    db $d3
    ldh a, [$ff08]
    ld bc, $f0f1
    ld [$f121], sp
    ld hl, $71d4
    ld [hl], c
    sub c
    sub c
    or c
    or c
    sub c
    db $f4
    db $d3
    ldh a, [$ff08]
    ld [hl], c
    pop af
    ldh a, [$ff08]
    ld h, c
    pop af
    ldh a, [$ff08]
    ld d, c
    pop af
    ldh a, [$ff08]
    ld [hl], c
    pop af
    call nc, Call_000_08f0
    sub c
    pop af
    ldh a, [$ff08]
    or c
    pop af
    db $d3
    ldh a, [rNR41]
    ld de, $f2f1
    bit 2, b
    ei
    ld de, $0a13
    inc sp
    pop de
    daa
    ld h, a
    ld b, a
    sub e
    ld [hl], e
    ld [hl], a
    ld b, a
    inc hl
    ld [hl], e
    inc hl
    ld [hl], e
    ld b, a
    sub e
    ld b, e
    ld [hl], e
    ld h, e
    ld b, e
    inc hl
    ld l, a
    ei
    ld de, $0514
    ld [hl+], a
    or $fd
    ld b, $f3
    ld [bc], a
    ldh a, [$ff0e]

jr_003_513d:
    ld bc, $7101
    jr nz, jr_003_5162

jr_003_5142:
    pop af
    ld bc, $7171
    ld [hl], c
    ld [hl], c
    sub b
    sub b
    nop
    ld [hl], b
    ld b, c
    db $f4
    ldh a, [rNR13]
    ld bc, $6101
    jr nz, jr_003_5175

    pop af
    ld bc, $6061
    ld h, b
    ld h, c
    ldh a, [c]
    add hl, sp
    ld d, c
    db $fd
    ld [$77fa], sp

jr_003_5162:
    ei
    ld de, $0314
    ld de, $07e8
    jp nc, $c020

    ld d, b
    ret nz

    add sp, $17
    ld d, b
    jr nz, @-$3e

    sub b
    ret nz

jr_003_5175:
    sub b
    ld d, b
    ret nz

    jr nz, jr_003_51ba

    ld d, c
    jr nz, jr_003_513d

    ld [hl], b
    ret nz

    ld [hl], b
    jr nz, jr_003_5142

    or b
    ret nz

    or b

jr_003_5185:
    ld [hl], b
    ret nz

    jr nz, jr_003_51f9

    or c
    ld b, b
    ret nz

    ld [hl], b
    ret nz

    ld [hl], b
    ld b, b
    ret nz

    or b
    ret nz

Jump_003_5193:
    or b
    ld [hl], b
    ret nz

    ld b, b
    ld d, b
    ld [hl], c

jr_003_5199:
    ld d, b
    ret nz

    sub b
    ret nz

    sub b
    ld d, b
    ret nz

    pop de

jr_003_51a1:
    nop
    ret nz

    nop
    jp nc, $c090

    ld d, b
    ld [hl], b
    sub c
    ld d, b
    ret nz

    add b
    ret nz

    add b
    ld d, b
    ret nz

    pop de
    nop
    ret nz

    nop
    jp nc, $c080

    ld d, b
    ld [hl], b

jr_003_51ba:
    add c
    ld d, b
    ret nz

    and b
    ret nz

    and b
    ld d, b

jr_003_51c1:
    ret nz

    pop de
    jr nz, jr_003_5185

    jr nz, jr_003_5199

    and b
    ret nz

    jr nz, jr_003_521b

    and b
    pop de
    jr nz, jr_003_51a1

    ld b, b
    ret nz

    ld [hl], b
    ret nz

    ld [hl], b
    ld b, b
    ret nz

    or b
    ret nz

    or b
    ld [hl], b
    jr nz, jr_003_521c

    ld [hl], b
    or b
    pop de
    jr nz, jr_003_5221

    ret nz

    ld [hl], b
    ret nz

    ld [hl], b
    ld b, b
    ret nz

    or b
    ret nz

    or b
    ld [hl], b
    ret nz

    ld b, b
    jr nz, jr_003_51c1

    or c
    ldh a, [c]
    ld l, d
    ld d, c
    ld a, [$fbb8]
    ld de, $0314

jr_003_51f9:
    ld de, $10f9
    ld b, d
    db $fc
    db $fd
    inc bc
    pop de
    jr nz, jr_003_5253

    db $fd
    ld [bc], a
    sub b
    db $fd
    ld [$d0ec], sp
    ld c, $fd
    inc bc
    db $fc
    pop de
    jr nz, @+$52

    db $fd
    ld [bc], a
    ld [hl], b
    db $ec
    db $fd
    ld [$fdbe], sp
    inc bc
    db $fc

jr_003_521b:
    nop

jr_003_521c:
    ld b, b
    db $fd
    ld [bc], a
    ld [hl], b
    db $fd

jr_003_5221:
    ld [$beec], sp
    db $fd
    inc bc
    db $fc
    jr nz, jr_003_5279

    db $fd
    ld [bc], a
    sub b
    db $fd
    ld [$d0ec], sp
    ld c, $fd
    inc bc
    db $fc
    pop de
    ld d, b
    add b
    db $fd
    ld [bc], a
    ret nc

    nop
    db $fd
    ld [$3eec], sp
    db $fd
    inc bc
    db $fc
    pop de
    ld d, b
    add b
    db $fd
    ld [bc], a
    and b
    db $fd
    ld [$d0ec], sp
    ld l, $fd
    inc bc
    db $fc
    pop de
    ld [hl], b

Call_003_5252:
    sub b

jr_003_5253:
    db $fd
    ld [bc], a
    ret nc

    nop
    db $fd
    ld hl, sp-$14
    ld b, b
    ldh a, [c]
    db $fd
    ld d, c
    db $fd
    ld [$03fa], sp
    ei
    nop
    nop
    inc bc
    ld de, $06e7
    db $d3
    inc hl
    jp nz, Jump_000_2020

    nop
    inc hl
    ret nz

    call nc, Call_003_7290
    db $d3
    ld [hl], b
    jp nz, Jump_003_70d4

jr_003_5279:
    ld [hl], b
    db $d3
    ld [hl], b
    call nc, $d372
    ld [hl], c
    ld [hl], b
    inc bc
    jp nz, RST_00

    call nc, $d3b0
    ld [bc], a
    call nc, Call_003_6071
    ld d, d
    db $d3
    ld d, b
    jp nz, $50d4

    ld d, b
    db $d3
    ld d, b
    call nc, Call_003_5252
    ld d, d
    db $d3
    ld d, b
    jp nz, $50d4

    db $d3
    ld d, b
    ld b, b
    ld d, e
    ret nz

    ld d, b
    call nc, $d3a2
    and b
    jp nz, $a0d4

    and b
    db $d3
    and b
    call nc, $d3a2
    and c
    and b
    db $d3
    inc bc
    jp nz, RST_00

    call nc, $d3b0
    inc bc
    ret nz

    call nc, $d370
    ld [bc], a
    nop
    jp nz, Jump_003_70d4

    db $d3
    nop
    jp nc, $d300

    ld bc, $0200
    ldh a, [c]
    ld l, c
    ld d, d
    db $fd
    ld [$07f0], sp
    ld bc, $5121
    jr nz, jr_003_52d9

jr_003_52d9:
    nop
    jr nz, jr_003_52fd

    ld h, c
    jr nz, @+$22

    pop af
    ld bc, $5151
    ld d, b
    nop
    ld d, b
    ld d, c
    ld d, c
    ld d, b
    ld d, c
    ldh a, [c]
    jp nc, $fd52

    rlca
    ld a, [$e837]
    dec de
    ei
    ld de, $0514
    ld [hl+], a
    push af
    db $eb
    ld d, l
    ld [hl], c
    ld d, c

jr_003_52fd:
    ld hl, $a1d3
    ei
    ld de, $0715
    ld [hl+], a
    jp nc, $c121

    ld hl, $c101
    ld bc, $01c3
    pop bc
    ld bc, $21c3
    ld hl, $21c1
    pop bc
    ld hl, $c151
    ld bc, $c101
    ld bc, $01c3
    ei
    ld de, $0514
    ld [hl+], a
    push af
    db $eb
    ld d, l
    and c
    sub c
    ld [hl], c
    ld hl, $a1c1
    pop bc
    sub e
    pop de
    rlca
    pop bc
    ld d, c
    pop bc
    inc hl
    ei
    ld de, $0715
    ld [hl+], a
    jp nc, $c121

    ld hl, $fbc3
    ld de, $0514
    ld [hl+], a
    pop de
    inc hl
    ld bc, $d3c5
    ld hl, $5131
    ld [hl], c
    sub b
    and b
    jp nc, $d301

    and c
    jp nc, RST_20

    ret nz

    db $d3
    and b
    sub c
    ld d, c
    pop bc
    jp nc, $d305

    and c
    pop bc
    jr nz, jr_003_53b3

    ld [hl], b
    and b
    ei
    ld de, $0715
    ld [hl+], a
    pop bc

jr_003_536b:
    jp nc, Jump_000_2121

    pop bc
    ld hl, $21c1
    ld d, c

Jump_003_5373:
    pop bc
    ld bc, $c101
    ei
    ld de, $0514
    ld [hl+], a
    jp nc, Jump_003_5373

    ld [hl], c
    and b
    ret nz

    ld a, [$7135]
    and b
    ret nz

    ld a, [$7134]
    and b
    ret nz

    ld a, [$9138]
    pop de
    nop
    ret nz

    ld a, [$d235]
    sub c
    pop de
    nop
    ret nz

    ld a, [$d234]
    sub c
    pop de
    nop
    ret nz

    ld a, [$d238]
    ld [hl], c
    sub b
    and b
    sub c
    ld [hl], c
    ld d, b
    jr nz, jr_003_536b

    inc h
    jr nz, jr_003_53ae

jr_003_53ae:
    jr nz, jr_003_53f0

    ld d, b
    ld [hl], b
    sbc a

jr_003_53b3:
    pop bc
    ld hl, $21c1
    pop bc
    ld a, [$2135]
    pop bc
    ld a, [$2038]
    jr nz, @-$09

    add hl, bc
    ld d, [hl]
    ld bc, $01c1
    pop bc
    ld a, [$0135]
    pop bc
    ld a, [$0038]
    ld d, b
    push af
    add hl, bc
    ld d, [hl]
    db $d3
    ldh a, [rSC]
    push af
    rla
    ld d, [hl]
    ld d, b
    ret nz

    ld d, b
    ret nz

    ld d, b
    ret nz

    ld d, c
    pop bc
    ld d, b
    ret nz

    ld d, c
    pop bc
    pop af
    push af
    rla
    ld d, [hl]
    pop bc
    jp nc, $c000

    nop
    ret nz

    nop
    ret nz

jr_003_53f0:
    ld bc, $d3c1
    ld bc, $f2c1
    ld hl, sp+$52
    db $fd
    rlca
    add sp, $1b
    ld sp, hl
    db $10
    ld d, d
    push af
    add b
    ld d, l
    push af
    adc b
    ld d, l
    jp nc, $a173

    sub c
    push af
    sub c
    ld d, l
    jp nc, $91a1

    ld d, c
    ld hl, $acf5
    ld d, l
    ld [hl], c
    pop bc
    ld [hl], c
    ld d, c
    pop bc
    ld d, c
    jp $c151


    ld d, c
    jp Jump_003_7171


    pop bc
    ld [hl], c
    pop bc
    ld [hl], c
    sub c
    pop bc
    ld d, c
    ld d, c
    pop bc
    ld d, c
    jp $f551


    add b
    ld d, l
    push af
    adc b
    ld d, l
    pop bc
    jp nc, $9171

    pop de
    ld bc, $91f5
    ld d, l
    ld hl, $d201
    and c
    ld [hl], c
    pop bc
    pop de
    ld hl, $03c1
    ld d, a
    pop bc
    sub c
    pop bc
    ld [hl], e
    ld a, [$fb39]
    ld de, $0715
    ld [hl+], a
    jp nc, $c171

    ld [hl], c
    jp $79fa


    ei
    ld de, $0714
    inc hl

jr_003_545e:
    pop de
    ld [hl], e
    ld d, c
    push bc
    jp nc, Jump_000_3121

jr_003_5465:
    ld d, c
    ld [hl], c
    sub b
    and b
    pop de
    ld bc, $a1d2
    pop de
    jr nz, jr_003_5470

jr_003_5470:
    ret nz

    jp nc, $91a0

    ld d, c
    pop bc
    pop de
    dec b
    jp nc, $c1a1

    jr nz, jr_003_54cd

    ld [hl], b
    and b
    pop bc
    push af
    xor h
    ld d, l
    ld [hl], c
    ld [hl], c
    pop bc
    ld [hl], c
    pop bc
    ld [hl], c
    sub c
    pop bc
    ld d, c
    ld d, c
    pop bc
    push af
    add b
    ld d, l
    and e
    sub e
    and c
    pop de
    jr nz, @-$3e

    ld a, [$d275]
    and c
    pop de
    jr nz, jr_003_545e

    ld a, [$d274]
    and c
    pop de
    jr nz, jr_003_5465

    ld a, [$0179]
    ld d, b
    ret nz

    ld a, [$0175]
    ld d, b
    ret nz

    ld a, [$0174]
    ld d, b
    ret nz

    ld a, [$d279]
    and c
    pop de
    nop
    jr nz, @+$03

    jp nc, $90a1

    ld [hl], b
    ret nz

    ld [hl], h
    ld [hl], b
    ld d, b
    ld [hl], b
    sub b
    and b
    pop de
    nop
    ld e, a
    pop bc
    push af
    xor h

jr_003_54cd:
    ld d, l
    jp nc, $c171

    ld [hl], c
    pop bc
    ld a, [$7135]
    pop bc
    ld a, [$7039]
    ld [hl], b
    push af
    or h
    ld d, l
    ld d, c
    pop bc
    ld d, c
    pop bc
    ld a, [$5135]
    pop bc
    ld a, [$5039]
    sub b
    push af
    or h
    ld d, l
    ld a, [$fb77]
    ld sp, $0714
    ld [hl-], a
    push af
    jp nz, $f555

    db $d3
    ld d, l
    and c
    ld [hl], c
    and e
    sub c
    and c
    pop bc
    pop de
    ld bc, $d2c1
    sub c
    ld d, c
    pop bc
    ld d, c
    sub c
    push af
    db $d3
    ld d, l
    push af
    jp nz, $d255

    ld d, e
    ld d, e
    sub c
    ld d, c
    pop de
    ld bc, $51d2
    sub c
    ld d, c
    pop bc
    ld a, [$fb39]
    ld de, $0715
    ld [hl+], a
    ld d, b
    ret nz

    ld d, b
    ret nz

    ld d, b
    ret nz

    ld d, b
    jp nz, Jump_003_50d3

    jp nz, $fff2

    ld d, e
    db $fd
    rlca
    ld a, [$fb03]
    nop
    nop
    inc bc
    ld de, $06e7
    call nc, $0bf0
    ld [hl], e
    pop bc
    ld [hl], c
    push bc
    ld d, c
    pop bc
    ld d, c
    ret


    ld d, c
    pop af
    ld [hl], e
    pop bc
    ld [hl], c
    push bc
    ld d, c
    pop bc
    ld d, c
    push bc
    ld d, c
    ld d, c
    ld d, c
    ldh a, [$ff03]
    ld [hl], c
    ld [hl], c
    ld [hl], c
    ld [hl], c
    push bc
    and c
    pop bc
    and c
    and c
    and c
    rst $00
    sub c
    sub c
    sub c
    sub c
    ret


    ld d, c
    ld d, c
    ld d, c
    jp Jump_003_6151


    pop af
    ld [hl], c
    ld [hl], c
    ld [hl], c
    ld [hl], c
    push bc
    and c
    pop bc
    and c
    and c
    and c
    rst $00
    sub c
    sub c
    sub c
    sub c
    rst $00
    rst $08
    ldh a, [c]
    inc a
    ld d, l
    ld a, [$fb79]
    ld de, $0314
    ld [de], a
    or $d1
    ld hl, $a0d2
    pop de
    nop
    ld d, c
    ld hl, $c1f6
    pop de
    nop
    jr nz, @+$03

    jp nc, Jump_003_5193

    pop bc
    pop de
    ld bc, $a3d2
    pop bc
    pop de
    ld d, c
    jp Jump_000_2341


    dec b
    pop bc
    jp nc, $91a1

    pop de
    ld bc, $faf6
    add hl, sp
    ei
    ld de, $0715
    ld [hl+], a
    or $51
    ld d, b
    ret nz

    ld d, b
    ret nz

    ld d, b
    ret nz

    ld d, c
    pop bc
    ld d, b
    ret nz

    ld d, c
    pop bc
    or $d2
    ld [hl], e
    and e
    sub c
    pop de
    ld bc, $01c1
    jp nc, $9151

    ld d, c
    pop de
    ld bc, $01c1
    or $d2
    ld d, e
    ld d, e
    sub c
    ld d, c
    pop de
    ld bc, $51d2
    sub c
    ld d, c
    pop de
    ld bc, $51d2
    pop bc
    ld d, c
    sub c
    ld d, c
    pop de
    ld bc, $51d2
    or $d2
    ld hl, $a0d3
    jp nc, $5100

    dec h
    pop bc
    ld bc, $00c1
    jr nz, @+$09

    pop bc
    ld bc, $a3d3
    pop bc
    jp nc, $c351

    ld b, c
    inc hl
    dec b
    pop bc
    ld [hl], c
    ld d, c
    sub c
    or $01
    nop
    ret nz

    nop
    ret nz

    nop
    ret nz

    ld bc, $00c1
    ret nz

    ld bc, $f6c1
    ld [hl], c
    pop bc
    ld [hl], c
    pop bc
    ld a, [$7136]
    pop bc
    ld a, [$7039]
    ld [hl], b
    ld d, c
    ld d, b
    ret nz

    ld d, b
    ret nz

    ld d, b
    ret nz

    ld d, c
    pop bc
    ld d, b
    ret nz

    ld d, c
    pop bc
    ld d, c
    pop bc
    ld d, c
    pop bc
    ld a, [$5136]
    pop bc
    ld a, [$5039]
    sub b
    ld d, c
    or $fd
    rlca
    ldh a, [rTAC]
    ld bc, $2020
    ld b, c
    ld bc, $0181
    ld hl, $2001
    jr nz, @+$22

    jr nz, @+$05

    jr nz, @+$22

    ld bc, $2081
    jr nz, @-$0d

    ld bc, $2020
    ld b, c
    ld bc, $0181
    ld hl, $2001
    jr nz, @+$22

    jr nz, jr_003_5668

    jr nz, @+$22

    ld b, c

jr_003_5668:
    add c
    add b
    add b
    ldh a, [$ff03]
    ld bc, $2020
    ld b, c
    ld bc, $0181
    ld hl, $2001
    jr nz, @+$22

    jr nz, @+$05

    jr nz, jr_003_569d

    ld bc, $2081
    jr nz, @-$0d

    ld bc, $2020
    ld b, c
    ld bc, $0181
    jr nz, @+$22

    ld b, c
    ld bc, $2020
    ld b, c
    ld bc, $8080
    ld bc, $8080
    add b
    add b
    ldh a, [rTAC]
    ld bc, $2020

jr_003_569d:
    ld b, c
    ld bc, $0181
    ld hl, $2001
    jr nz, jr_003_56c6

    jr nz, @+$05

    jr nz, jr_003_56ca

    ld bc, $2081
    jr nz, @-$0d

    ld bc, $2020
    ld b, c
    ld bc, $0181

jr_003_56b6:
    add b
    add b
    ld bc, $2001
    jr nz, @+$43

    jr nz, jr_003_56bf

jr_003_56bf:
    add b
    add b
    ld bc, $0080
    add b
    add b

jr_003_56c6:
    ldh a, [c]
    ld b, b
    ld d, [hl]
    db $fd

jr_003_56ca:
    ld b, $fa
    jr c, jr_003_56b6

    rla
    ei
    ld de, $0314
    ld hl, $ebf5
    ld d, l
    ld [hl], c
    ld d, c
    ld hl, $a1d3
    ei
    ld de, $0715
    ld [hl+], a
    jp nc, $c121

    ld hl, $c101
    ld bc, $01c3
    pop bc
    ld bc, $21c3
    ld hl, $21c1
    pop bc
    ld hl, $c151
    ld bc, $c101
    ld bc, $01c3
    ei
    ld de, $0314
    ld hl, $ebf5
    ld d, l
    and c
    sub c
    ld [hl], c
    ld hl, $a1c1
    pop bc
    sub e
    pop de
    rlca
    pop bc
    ld d, c
    pop bc
    inc hl
    ei
    ld de, $0715
    ld [hl+], a
    jp nc, $c121

    ld hl, $fbc3
    ld de, $0314
    ld hl, $23d1
    ld bc, $d3c5
    ld hl, $5131
    ld [hl], c
    sub b
    and b
    jp nc, $d301

    and c
    jp nc, RST_20

    ret nz

    db $d3
    and b
    sub c
    ld d, c
    pop bc
    jp nc, $d305

    and c
    pop bc
    jr nz, jr_003_578f

    ld [hl], b
    and b
    ei
    ld de, $0715
    ld [hl+], a
    pop bc

jr_003_5747:
    jp nc, Jump_000_2121

    pop bc
    ld hl, $21c1
    ld d, c
    pop bc
    ld bc, $c101
    ei
    ld de, $0314
    ld hl, $73d2
    ld d, e
    ld [hl], c
    and b
    ret nz

    ld a, [$7136]
    and b
    ret nz

    ld a, [$7134]
    and b
    ret nz

    ld a, [$9139]
    pop de
    nop
    ret nz

    ld a, [$d236]
    sub c
    pop de
    nop
    ret nz

    ld a, [$d234]
    sub c
    pop de
    nop
    ret nz

    ld a, [$d239]
    ld [hl], c
    sub b
    and b
    sub c
    ld [hl], c
    ld d, b
    jr nz, jr_003_5747

    inc h
    jr nz, jr_003_578a

jr_003_578a:
    jr nz, jr_003_57cc

    ld d, b
    ld [hl], b
    sbc a

jr_003_578f:
    pop bc
    ld hl, $21c1
    pop bc
    ld a, [$2136]
    pop bc
    ld a, [$2039]
    jr nz, @-$09

    add hl, bc
    ld d, [hl]
    ld bc, $01c1
    pop bc
    ld a, [$0136]
    pop bc
    ld a, [$0039]
    ld d, b
    push af
    add hl, bc
    ld d, [hl]
    db $d3
    ldh a, [rSC]
    push af
    rla
    ld d, [hl]
    ld d, b
    ret nz

    ld d, b
    ret nz

    ld d, b
    ret nz

    ld d, c
    pop bc
    ld d, b
    ret nz

    ld d, c
    pop bc
    pop af
    push af
    rla
    ld d, [hl]
    pop bc
    jp nc, $c000

    nop
    ret nz

    nop
    ret nz

jr_003_57cc:
    ld bc, $d3c1
    ld bc, $f2c1
    call nc, $fd56
    ld b, $e8
    rla
    ld sp, hl
    db $10
    ld d, d
    push af
    dec de
    ld e, c
    push af
    adc b
    ld d, l
    jp nc, $a173

    sub c
    push af
    sub c
    ld d, l
    jp nc, $91a1

    ld d, c
    ld hl, $acf5
    ld d, l
    ld [hl], c
    pop bc
    ld [hl], c
    ld d, c
    pop bc
    ld d, c
    jp $c151


    ld d, c
    jp Jump_003_7171


    pop bc
    ld [hl], c
    pop bc
    ld [hl], c
    sub c
    pop bc
    ld d, c
    ld d, c
    pop bc
    ld d, c
    jp $f551


    dec de
    ld e, c
    push af
    adc b
    ld d, l
    pop bc
    jp nc, $9171

    pop de
    ld bc, $91f5
    ld d, l
    ld hl, $d201
    and c
    ld [hl], c
    pop bc
    pop de
    ld hl, $03c1
    ld d, a
    pop bc
    sub c
    pop bc
    ld [hl], e
    ld a, [$fb3a]
    ld de, $0715
    ld [hl+], a
    jp nc, $c171

    ld [hl], c
    jp $7afa


    ei
    ld de, $0714
    inc hl

jr_003_583a:
    pop de
    ld [hl], e
    ld d, c
    push bc
    jp nc, Jump_000_3121

jr_003_5841:
    ld d, c
    ld [hl], c
    sub b
    and b
    pop de
    ld bc, $a1d2
    pop de
    jr nz, jr_003_584c

jr_003_584c:
    ret nz

    jp nc, $91a0

    ld d, c
    pop bc
    pop de
    dec b
    jp nc, $c1a1

    jr nz, jr_003_58a9

    ld [hl], b
    and b
    pop bc
    push af
    xor h
    ld d, l
    ld [hl], c
    ld [hl], c
    pop bc
    ld [hl], c
    pop bc
    ld [hl], c
    sub c
    pop bc
    ld d, c
    ld d, c
    pop bc
    push af
    dec de
    ld e, c
    and e
    sub e
    and c
    pop de
    jr nz, @-$3e

    ld a, [$d276]
    and c
    pop de
    jr nz, jr_003_583a

    ld a, [$d274]
    and c
    pop de
    jr nz, jr_003_5841

    ld a, [$017a]
    ld d, b
    ret nz

    ld a, [$0176]
    ld d, b
    ret nz

    ld a, [$0174]
    ld d, b
    ret nz

    ld a, [$d27a]
    and c
    pop de
    nop
    jr nz, @+$03

    jp nc, $90a1

    ld [hl], b
    ret nz

    ld [hl], h
    ld [hl], b
    ld d, b
    ld [hl], b
    sub b
    and b
    pop de
    nop
    ld e, a
    pop bc
    push af
    xor h

jr_003_58a9:
    ld d, l
    jp nc, $c171

    ld [hl], c
    pop bc
    ld a, [$7136]
    pop bc
    ld a, [$703a]
    ld [hl], b
    push af
    or h
    ld d, l
    ld d, c
    pop bc
    ld d, c
    pop bc
    ld a, [$5136]
    pop bc
    ld a, [$503a]
    sub b
    push af
    or h
    ld d, l
    ld a, [$fb78]
    ld sp, $0714
    ld [hl-], a
    push af
    jp nz, $f555

    db $d3
    ld d, l
    and c
    ld [hl], c
    and e
    sub c
    and c
    pop bc
    pop de
    ld bc, $d2c1
    sub c
    ld d, c
    pop bc
    ld d, c
    sub c
    push af
    db $d3
    ld d, l
    push af
    jp nz, $d255

    ld d, e
    ld d, e
    sub c
    ld d, c
    pop de
    ld bc, $51d2
    sub c
    ld d, c
    pop bc
    ld a, [$fb3a]
    ld de, $0715
    ld [hl+], a
    ld d, b
    ret nz

    ld d, b
    ret nz

    ld d, b
    ret nz

    ld d, b
    jp nz, Jump_003_50d3

    jp nz, $dbf2

    ld d, a
    db $fd
    ld b, $fa
    inc bc
    ei
    nop
    nop
    ld [bc], a
    ld de, $06e7
    call nc, Call_000_3cf2
    ld d, l
    ld a, [$fb7a]
    ld de, $0314
    ld hl, $fdf6
    ld b, $f2
    ld b, b
    ld d, [hl]
    db $fd
    dec b
    ld a, [$e838]
    inc de
    ei
    ld de, $0314
    ld hl, $ebf5
    ld d, l
    ld [hl], c
    ld d, c
    ld hl, $a1d3
    ei
    ld de, $0715
    ld [hl+], a
    jp nc, $c121

    ld hl, $c101
    ld bc, $01c3
    pop bc
    ld bc, $21c3
    ld hl, $21c1
    pop bc
    ld hl, $c151
    ld bc, $c101
    ld bc, $01c3
    ei
    ld de, $0314
    ld hl, $ebf5
    ld d, l
    and c
    sub c
    ld [hl], c
    ld hl, $a1c1
    pop bc
    sub e
    pop de
    rlca
    pop bc
    ld d, c
    pop bc
    inc hl
    ei
    ld de, $0715
    ld [hl+], a
    jp nc, $c121

    ld hl, $fbc3
    ld de, $0314
    ld hl, $23d1
    ld bc, $d3c5
    ld hl, $5131
    ld [hl], c
    sub b
    and b
    jp nc, $d301

    and c
    jp nc, RST_20

    ret nz

    db $d3
    and b
    sub c
    ld d, c
    pop bc
    jp nc, $d305

    and c
    pop bc
    jr nz, jr_003_59ee

    ld [hl], b
    and b
    ei
    ld de, $0715
    ld [hl+], a
    pop bc

jr_003_59a6:
    jp nc, Jump_000_2121

    pop bc
    ld hl, $21c1
    ld d, c
    pop bc
    ld bc, $c101
    ei
    ld de, $0314
    ld hl, $73d2
    ld d, e
    ld [hl], c
    and b
    ret nz

    ld a, [$7136]
    and b
    ret nz

    ld a, [$7134]
    and b
    ret nz

    ld a, [$9139]
    pop de
    nop
    ret nz

    ld a, [$d236]
    sub c
    pop de
    nop
    ret nz

    ld a, [$d234]
    sub c
    pop de
    nop
    ret nz

    ld a, [$d239]
    ld [hl], c
    sub b
    and b
    sub c
    ld [hl], c
    ld d, b
    jr nz, jr_003_59a6

    inc h
    jr nz, jr_003_59e9

jr_003_59e9:
    jr nz, jr_003_5a2b

    ld d, b
    ld [hl], b
    sbc a

jr_003_59ee:
    pop bc
    ld hl, $21c1
    pop bc
    ld a, [$2136]
    pop bc
    ld a, [$2039]
    jr nz, @-$09

    add hl, bc
    ld d, [hl]
    ld bc, $01c1
    pop bc
    ld a, [$0136]
    pop bc
    ld a, [$0039]
    ld d, b
    push af
    add hl, bc
    ld d, [hl]
    db $d3
    ldh a, [rSC]
    push af
    rla
    ld d, [hl]
    ld d, b
    ret nz

    ld d, b
    ret nz

    ld d, b
    ret nz

    ld d, c
    pop bc
    ld d, b
    ret nz

    ld d, c
    pop bc
    pop af
    push af
    rla
    ld d, [hl]
    pop bc
    jp nc, $c000

    nop
    ret nz

    nop
    ret nz

jr_003_5a2b:
    ld bc, $d3c1
    ld bc, $f2c1
    inc sp
    ld e, c
    db $fd
    dec b
    add sp, $13
    ld sp, hl
    db $10
    ld d, d
    push af
    ld a, d
    ld e, e
    push af
    adc b
    ld d, l
    jp nc, $a173

    sub c
    push af
    sub c
    ld d, l
    jp nc, $91a1

    ld d, c
    ld hl, $acf5
    ld d, l
    ld [hl], c
    pop bc
    ld [hl], c
    ld d, c
    pop bc
    ld d, c
    jp $c151


    ld d, c
    jp Jump_003_7171


    pop bc
    ld [hl], c
    pop bc
    ld [hl], c
    sub c
    pop bc
    ld d, c
    ld d, c
    pop bc
    ld d, c
    jp $f551


    ld a, d
    ld e, e
    push af
    adc b
    ld d, l
    pop bc
    jp nc, $9171

    pop de
    ld bc, $91f5
    ld d, l
    ld hl, $d201
    and c
    ld [hl], c
    pop bc
    pop de
    ld hl, $03c1
    ld d, a
    pop bc
    sub c
    pop bc
    ld [hl], e
    ld a, [$fb3a]
    ld de, $0715
    ld [hl+], a
    jp nc, $c171

    ld [hl], c
    jp $7afa


    ei
    ld de, $0514
    ld [hl+], a

jr_003_5a99:
    pop de
    ld [hl], e
    ld d, c
    push bc
    jp nc, Jump_000_3121

jr_003_5aa0:
    ld d, c
    ld [hl], c
    sub b
    and b
    pop de
    ld bc, $a1d2
    pop de
    jr nz, jr_003_5aab

jr_003_5aab:
    ret nz

    jp nc, $91a0

    ld d, c
    pop bc
    pop de
    dec b
    jp nc, $c1a1

    jr nz, jr_003_5b08

    ld [hl], b
    and b
    pop bc
    push af
    xor h
    ld d, l
    ld [hl], c
    ld [hl], c
    pop bc
    ld [hl], c
    pop bc
    ld [hl], c
    sub c
    pop bc
    ld d, c
    ld d, c
    pop bc
    push af
    ld a, d
    ld e, e
    and e
    sub e
    and c
    pop de
    jr nz, @-$3e

    ld a, [$d276]
    and c
    pop de
    jr nz, jr_003_5a99

    ld a, [$d274]
    and c
    pop de
    jr nz, jr_003_5aa0

    ld a, [$017a]
    ld d, b
    ret nz

    ld a, [$0176]
    ld d, b
    ret nz

    ld a, [$0174]
    ld d, b
    ret nz

    ld a, [$d27a]
    and c
    pop de
    nop
    jr nz, @+$03

    jp nc, $90a1

    ld [hl], b
    ret nz

    ld [hl], h
    ld [hl], b
    ld d, b
    ld [hl], b
    sub b
    and b
    pop de
    nop
    ld e, a
    pop bc
    push af
    xor h

jr_003_5b08:
    ld d, l
    jp nc, $c171

    ld [hl], c
    pop bc
    ld a, [$7136]
    pop bc
    ld a, [$703a]
    ld [hl], b
    push af
    or h
    ld d, l
    ld d, c
    pop bc
    ld d, c
    pop bc
    ld a, [$5136]
    pop bc
    ld a, [$503a]
    sub b
    push af
    or h
    ld d, l
    ld a, [$fb78]
    ld sp, $0714
    ld [hl-], a
    push af
    jp nz, $f555

    db $d3
    ld d, l
    and c
    ld [hl], c
    and e
    sub c
    and c
    pop bc
    pop de
    ld bc, $d2c1
    sub c
    ld d, c
    pop bc
    ld d, c
    sub c
    push af
    db $d3
    ld d, l
    push af
    jp nz, $d255

    ld d, e
    ld d, e
    sub c
    ld d, c
    pop de
    ld bc, $51d2
    sub c
    ld d, c
    pop bc
    ld a, [$fb3a]
    ld de, $0715
    ld [hl+], a
    ld d, b
    ret nz

    ld d, b
    ret nz

    ld d, b
    ret nz

    ld d, b
    jp nz, Jump_003_50d3

    jp nz, Jump_000_3af2

    ld e, d
    db $fd
    dec b
    ld a, [$fb03]
    nop
    nop
    ld [bc], a
    ld de, $06e7
    call nc, Call_000_3cf2
    ld d, l
    ld a, [$fb7a]
    ld de, $0214
    ld de, $fdf6
    dec b
    ldh a, [c]
    ld b, b
    ld d, [hl]
    db $fd
    inc b
    ld a, [$e838]
    rrca
    ei
    ld de, $0314
    ld hl, $ebf5
    ld d, l
    ld [hl], c
    ld d, c
    ld hl, $a1d3
    ei
    ld de, $0715
    ld [hl+], a
    jp nc, $c121

    ld hl, $c101
    ld bc, $01c3
    pop bc
    ld bc, $21c3
    ld hl, $21c1
    pop bc
    ld hl, $c151
    ld bc, $c101
    ld bc, $01c3
    ei
    ld de, $0314
    ld hl, $ebf5
    ld d, l
    and c
    sub c
    ld [hl], c
    ld hl, $a1c1
    pop bc
    sub e
    pop de
    rlca
    pop bc
    ld d, c
    pop bc
    inc hl
    ei
    ld de, $0715
    ld [hl+], a
    jp nc, $c121

    ld hl, $fbc3
    ld de, $0314
    ld hl, $23d1
    ld bc, $d3c5
    ld hl, $5131
    ld [hl], c
    sub b
    and b
    jp nc, $d301

    and c
    jp nc, RST_20

    ret nz

    db $d3
    and b
    sub c
    ld d, c
    pop bc
    jp nc, $d305

    and c
    pop bc
    jr nz, jr_003_5c4d

    ld [hl], b
    and b
    ei
    ld de, $0715
    ld [hl+], a
    pop bc

jr_003_5c05:
    jp nc, Jump_000_2121

    pop bc
    ld hl, $21c1
    ld d, c
    pop bc
    ld bc, $c101
    ei
    ld de, $0314
    ld hl, $73d2
    ld d, e
    ld [hl], c
    and b
    ret nz

    ld a, [$7136]
    and b
    ret nz

    ld a, [$7134]
    and b
    ret nz

    ld a, [$9139]
    pop de
    nop
    ret nz

    ld a, [$d236]
    sub c
    pop de
    nop
    ret nz

    ld a, [$d234]
    sub c
    pop de
    nop
    ret nz

    ld a, [$d239]
    ld [hl], c
    sub b
    and b
    sub c
    ld [hl], c
    ld d, b
    jr nz, jr_003_5c05

    inc h
    jr nz, jr_003_5c48

jr_003_5c48:
    jr nz, jr_003_5c8a

    ld d, b
    ld [hl], b
    sbc a

jr_003_5c4d:
    pop bc
    ld hl, $21c1
    pop bc
    ld a, [$2136]
    pop bc
    ld a, [$2039]
    jr nz, @-$09

    add hl, bc
    ld d, [hl]
    ld bc, $01c1
    pop bc
    ld a, [$0136]
    pop bc
    ld a, [$0039]
    ld d, b
    push af
    add hl, bc
    ld d, [hl]
    db $d3
    ldh a, [rSC]
    push af
    rla
    ld d, [hl]
    ld d, b
    ret nz

    ld d, b
    ret nz

    ld d, b
    ret nz

    ld d, c
    pop bc
    ld d, b
    ret nz

    ld d, c
    pop bc
    pop af
    push af
    rla
    ld d, [hl]
    pop bc
    jp nc, $c000

    nop
    ret nz

    nop
    ret nz

jr_003_5c8a:
    ld bc, $d3c1
    ld bc, $f2c1
    sub d
    ld e, e
    db $fd
    inc b
    add sp, $0f
    ld sp, hl
    db $10
    ld d, d
    push af
    reti


    ld e, l
    push af
    adc b
    ld d, l
    jp nc, $a173

    sub c
    push af
    sub c
    ld d, l
    jp nc, $91a1

    ld d, c
    ld hl, $acf5
    ld d, l
    ld [hl], c
    pop bc
    ld [hl], c
    ld d, c
    pop bc
    ld d, c
    jp $c151


    ld d, c
    jp Jump_003_7171


    pop bc
    ld [hl], c
    pop bc
    ld [hl], c
    sub c
    pop bc
    ld d, c
    ld d, c
    pop bc
    ld d, c
    jp $f551


    reti


    ld e, l
    push af
    adc b
    ld d, l
    pop bc
    jp nc, $9171

    pop de
    ld bc, $91f5
    ld d, l
    ld hl, $d201
    and c
    ld [hl], c
    pop bc
    pop de
    ld hl, $03c1
    ld d, a
    pop bc
    sub c
    pop bc
    ld [hl], e
    ld a, [$fb3a]
    ld de, $0715
    ld [hl+], a
    jp nc, $c171

    ld [hl], c
    jp $7afa


    ei
    ld de, $0514
    ld [hl+], a

jr_003_5cf8:
    pop de
    ld [hl], e
    ld d, c
    push bc
    jp nc, Jump_000_3121

jr_003_5cff:
    ld d, c
    ld [hl], c
    sub b
    and b
    pop de
    ld bc, $a1d2
    pop de
    jr nz, jr_003_5d0a

jr_003_5d0a:
    ret nz

    jp nc, $91a0

    ld d, c
    pop bc
    pop de
    dec b
    jp nc, $c1a1

    jr nz, jr_003_5d67

    ld [hl], b
    and b
    pop bc
    push af
    xor h
    ld d, l
    ld [hl], c
    ld [hl], c
    pop bc
    ld [hl], c
    pop bc
    ld [hl], c
    sub c
    pop bc
    ld d, c
    ld d, c
    pop bc
    push af
    reti


    ld e, l
    and e
    sub e
    and c
    pop de
    jr nz, @-$3e

    ld a, [$d276]
    and c
    pop de
    jr nz, jr_003_5cf8

    ld a, [$d274]
    and c
    pop de
    jr nz, jr_003_5cff

    ld a, [$017a]
    ld d, b
    ret nz

    ld a, [$0176]
    ld d, b
    ret nz

    ld a, [$0174]
    ld d, b
    ret nz

    ld a, [$d27a]
    and c
    pop de
    nop
    jr nz, @+$03

    jp nc, $90a1

    ld [hl], b
    ret nz

    ld [hl], h
    ld [hl], b
    ld d, b
    ld [hl], b
    sub b
    and b
    pop de
    nop
    ld e, a
    pop bc
    push af
    xor h

jr_003_5d67:
    ld d, l
    jp nc, $c171

    ld [hl], c
    pop bc
    ld a, [$7136]
    pop bc
    ld a, [$703a]
    ld [hl], b
    push af
    or h
    ld d, l
    ld d, c
    pop bc
    ld d, c
    pop bc
    ld a, [$5136]
    pop bc
    ld a, [$503a]
    sub b
    push af
    or h
    ld d, l
    ld a, [$fb78]
    ld sp, $0714
    ld [hl-], a
    push af
    jp nz, $f555

    db $d3
    ld d, l
    and c
    ld [hl], c
    and e
    sub c
    and c
    pop bc
    pop de
    ld bc, $d2c1
    sub c
    ld d, c
    pop bc
    ld d, c
    sub c
    push af
    db $d3
    ld d, l
    push af
    jp nz, $d255

    ld d, e
    ld d, e
    sub c
    ld d, c
    pop de
    ld bc, $51d2
    sub c
    ld d, c
    pop bc
    ld a, [$fb3a]
    ld de, $0715
    ld [hl+], a
    ld d, b
    ret nz

    ld d, b
    ret nz

    ld d, b
    ret nz

    ld d, b
    jp nz, Jump_003_50d3

    jp nz, $99f2

    ld e, h
    db $fd
    inc b

jr_003_5dcc:
    ld a, [$fb03]
    nop

jr_003_5dd0:
    nop
    ld [bc], a
    ld de, $06e7
    call nc, Call_000_3cf2
    ld d, l
    ld a, [$fb7a]
    ld de, $0214
    ld de, $fdf6
    inc b
    ldh a, [c]
    ld b, b
    ld d, [hl]
    db $fd
    ld b, $fa
    add hl, sp
    ei
    ld de, $0415
    ld sp, $11e8
    ldh a, [rSC]
    jp nc, $c041

    ld b, c
    ret nz

    ld b, c
    pop bc
    db $d3
    ld b, b
    ret nz

    ld b, b
    ld b, b
    ld b, b
    ret nz

    pop af
    jp nc, $c021

    ld hl, $21c0
    pop bc
    db $d3
    jr nz, jr_003_5dcc

    jr nz, jr_003_5e2e

    jr nz, jr_003_5dd0

    jp nc, $c021

    ld hl, $21c0
    pop de
    ld sp, hl
    inc c
    ld d, e
    ld h, e
    ld b, e
    rlca
    pop bc
    db $d3
    ld b, b
    ret nz

    ld b, b
    ld b, b
    ld b, b
    ret nz

    jp nc, $c071

    ld [hl], c
    ret nz

    ld [hl], c
    pop bc
    db $d3
    ld b, b

jr_003_5e2e:
    ret nz

    ld b, b
    ld b, b
    ld b, b
    ret nz

    jp nc, $c061

    ld h, c

jr_003_5e37:
    ret nz

    ld h, c
    pop bc
    db $d3
    ld h, b
    ret nz

    ld h, b
    ld h, b
    ld h, b
    ret nz

    jp nc, $c061

    ld h, c
    ret nz

    ld h, c
    pop bc
    db $d3
    sub c
    ld [hl], c
    ld h, c
    add sp, $17
    ld a, [$f337]
    ld [bc], a
    ldh a, [rSC]
    db $d3
    ld b, b
    jp nc, $c040

    jr nz, jr_003_5e9b

    ret nz

    db $d3
    or b
    jp nc, $c000

    db $d3
    ld h, b
    ld [hl], b
    ret nz

    ld b, b
    ld h, b
    ld [hl], b
    sub b
    pop af
    ldh a, [rSC]
    db $d3
    ld h, b
    jp nc, $c060

    ld b, b
    ld h, b
    ret nz

    db $10
    jr nz, jr_003_5e37

    db $d3
    sub b
    or b
    ret nz

    ld h, b
    ld [hl], b
    sub b
    or b
    pop af
    db $f4
    ld a, [$d139]
    db $fc
    inc bc
    db $ec
    rrca
    jp nc, $4070

    nop
    db $d3
    ld [hl], h
    jp nc, Jump_000_2f03

    inc hl
    pop de
    ld h, e
    ld [hl], d
    ld h, d
    ld hl, $4707
    rlca
    ld [hl], a

jr_003_5e9b:
    ld l, a
    jp nc, $c061

    ld h, c
    ret nz

    ld h, c
    pop bc
    ld h, b
    ret nz

    ld h, b
    ld b, b
    ld h, b
    ret nz

    ldh a, [rSC]
    ld [hl], c
    ld [hl], c
    ld h, c
    ld [hl], c
    pop bc
    ld [hl], c
    pop bc
    ld [hl], c
    pop af
    ld d, c
    ld d, c
    ld b, c
    ld d, c
    pop bc
    ld d, c
    pop bc
    ld d, c
    ld [hl], c
    ld [hl], c
    ld d, c
    ld [hl], c
    pop bc
    ld [hl], c
    pop bc
    ld [hl], c
    ld d, c
    ld d, c
    ld b, c
    ld d, c
    pop bc
    ld d, c
    pop bc
    ld d, c
    ld [hl], c
    ld [hl], c
    ld d, c
    ld [hl], c
    pop bc
    ld [hl], c
    pop bc
    ld [hl], c
    ldh a, [rSC]
    sub c
    sub c
    ld [hl], c
    sub c
    pop bc
    sub c
    pop bc
    sub c
    pop af
    ldh a, [c]
    pop af
    ld e, l
    db $fd
    ld b, $fb
    ld de, $0514
    ld [hl+], a
    add sp, $11
    ld a, [$f039]
    ld [bc], a
    jp nc, $c071

    ld [hl], c
    ret nz

    ld [hl], c
    pop bc
    db $d3
    ld [hl], b
    ret nz

    ld [hl], b
    ld [hl], b
    ld [hl], b
    ret nz

    pop af
    ld sp, hl
    inc c
    ld d, d
    jp nc, $c061

    ld h, c
    ret nz

    ld h, c
    pop bc
    db $d3
    ld h, b
    ret nz

    ld h, b
    ld h, b
    ld h, b
    ret nz

    jp nc, $c061

    ld h, c
    ret nz

    ld h, c
    ld a, [$d179]
    sub e
    ld [hl], e
    ld b, a
    pop bc
    ld a, [$d339]
    ld [hl], b
    ret nz

    ld [hl], b
    ld [hl], b
    ld [hl], b
    ret nz

    pop de
    ld bc, $01c0
    ret nz

    ld bc, $d3c1
    ld [hl], b
    ret nz

    ld [hl], b
    ld [hl], b
    ld [hl], b
    ret nz

    jp nc, $c091

    sub c
    ret nz

    sub c
    pop bc
    db $d3
    sub b
    ret nz

    sub b
    sub b
    sub b
    ret nz

    push af
    inc l
    ld h, b
    daa
    ld b, c
    ld l, l
    push af
    inc l
    ld h, b
    or a
    sbc a
    ld a, [$d239]
    sub c
    ret nz

    sub c
    ret nz

    sub c
    pop bc
    sub b
    ret nz

    sub b
    ld [hl], b
    sub b
    ret nz

    ld a, [$d279]
    or l
    pop bc
    pop de
    or b
    sub b
    or b
    ret nz

    or c
    or c
    jp nc, $c1a5

    ret nc

    stop
    db $10
    ret nz

    ld de, $5011
    ld b, b
    dec b
    pop de
    sub b
    ld d, b
    dec h
    jp nc, $d1b0

    jr nz, jr_003_5f7d

jr_003_5f7d:
    ld [hl], b
    jp nc, $d1b0

    jr nz, jr_003_5f83

jr_003_5f83:
    ld [hl], b
    ld d, b
    ld b, b
    ld d, b
    ld [hl], b
    sub b
    ld [hl], b
    sub b
    or b
    ret nc

    rlca
    ld [hl+], a
    ld [bc], a
    pop de
    or c
    ret nc

    daa
    ld b, d
    ld [hl+], a
    ld b, l
    inc de

jr_003_5f98:
    pop de
    sub e

jr_003_5f9a:
    ld [hl], e
    ld h, e
    ld b, e
    ld h, e
    ld [hl], e
    ldh a, [c]
    db $eb
    ld e, [hl]
    db $fd

jr_003_5fa3:
    ld b, $fa

jr_003_5fa5:
    inc bc
    ei
    nop
    nop
    ld [bc], a
    ld de, $06e7
    db $d3
    ldh a, [$ff0c]
    push af
    ld a, [de]
    ld h, b
    pop af
    ldh a, [rDIV]
    push af
    inc hl
    ld h, b
    pop af
    di
    inc b
    ldh a, [rDIV]
    push af
    ld a, [de]
    ld h, b
    pop af
    ldh a, [rDIV]
    push af
    inc hl
    ld h, b
    pop af
    db $f4
    ldh a, [rSC]
    ld b, b
    ret nz

    ld b, b
    ret nz

    ld b, b

jr_003_5fd0:
    ld b, b
    ret nz

    ld b, b
    pop af
    ldh a, [rSC]
    jr nc, jr_003_5f98

    jr nc, jr_003_5f9a

    jr nc, @+$32

    ret nz

    jr nc, jr_003_5fd0

    ldh a, [rSC]
    jr nz, jr_003_5fa3

    jr nz, jr_003_5fa5

    jr nz, jr_003_6007

jr_003_5fe7:
    ret nz

    jr nz, @-$0d

    ldh a, [rSC]
    ld [hl], b
    ret nz

    ld [hl], b
    ret nz

    ld [hl], b
    ld [hl], b
    ret nz

    ld [hl], b
    pop af
    ldh a, [rSC]
    ld d, b
    ret nz

    ld d, b
    ret nz

    ld d, b
    ld d, b
    ret nz

    ld d, b
    pop af
    ldh a, [rSC]
    ld [hl], b
    ret nz

    ld [hl], b
    ret nz

    ld [hl], b

jr_003_6007:
    ld [hl], b
    ret nz

    ld [hl], b
    pop af
    call nc, Call_000_04f0
    sub b
    ret nz

    sub b
    ret nz

    sub b
    sub b
    ret nz

    sub b
    pop af
    ldh a, [c]
    xor l
    ld e, a
    nop
    ret nz

    nop
    ret nz

    nop
    nop
    ret nz

    nop

jr_003_6022:
    or $20
    ret nz

    jr nz, jr_003_5fe7

    jr nz, jr_003_6049

    ret nz

    jr nz, jr_003_6022

    ld a, [$d239]
    sub c
    ret nz

    sub c
    ret nz

    sub c
    pop bc
    ld a, [$d279]
    sub c
    pop de
    ld [hl], c
    ld h, c
    ld b, a
    ld [hl+], a
    ld [hl], d
    ld hl, $c149
    jp nc, $d1b0

    nop
    jr nz, jr_003_6088

    ld h, a

jr_003_6049:
    ld [hl], d
    ld h, d
    ld hl, $c10b
    jp nc, $d1b0

    nop
    jp nc, $d197

    ld [hl], a
    ld b, a
    or $fd
    ld b, $f0
    rrca
    ld bc, $2020
    ld h, b
    nop
    jr nz, @+$22

    pop af
    ld bc, $2020
    ld h, b
    ld h, b
    ld h, c
    ldh a, [$ff1f]
    ld bc, $2020
    ld h, b

Jump_003_6070:
    nop

Call_003_6071:
    jr nz, @+$22

    pop af
    ld b, c
    jr nz, @+$22

    ld h, b
    ld h, b
    ld h, b
    ld h, b
    ldh a, [rIF]
    ld bc, $2020
    ld h, b
    nop
    jr nz, jr_003_60a4

    pop af
    nop
    jr nz, jr_003_60c9

jr_003_6088:
    ld h, b
    ld h, b
    ld h, c
    ldh a, [c]
    ld e, d
    ld h, b
    db $fd
    ld b, $e8
    ld de, $11fb
    dec d
    inc bc
    ld hl, $77fa
    jp nc, Jump_000_02f0

    push af
    jr c, @+$64

    ld hl, $8141
    pop bc
    sub c

jr_003_60a4:
    add c
    ld b, c
    add c
    push af
    jr c, @+$64

    push af
    ld b, l
    ld h, d
    pop af
    ldh a, [rDIV]
    push af
    ld d, h
    ld h, d
    ld hl, $8141
    pop bc
    sub c
    add c
    ld b, c
    sub c
    push af
    ld d, h
    ld h, d
    push af
    ld b, l
    ld h, d
    pop af
    ld sp, hl
    inc c
    ld d, h
    ld a, [$f5b7]
    ld h, b

jr_003_60c9:
    ld h, d
    push af
    ld l, a
    ld h, d
    push af
    ld h, b
    ld h, d
    pop de
    ld hl, $c121
    jp nc, Jump_000_2121

    pop bc
    ld a, [$d1b5]
    ld hl, $c121
    jp nc, Jump_000_2121

    pop bc
    ld a, [$91b7]
    ld [hl], c
    ld h, e
    push af
    ld h, b
    ld h, d
    push af
    ld l, a
    ld h, d
    jp nc, Jump_003_4171

    ld h, c
    ld [hl], c
    pop bc
    ld h, c
    ld [hl], e
    ld b, c
    ld b, c
    ld h, e
    or e
    pop de
    inc bc
    jp nc, Jump_003_7131

    and c
    pop de
    ld sp, $71c1
    ld l, a
    jp $97f2


    ld h, b
    db $fd
    ld b, $fb
    ld de, $0414
    ld sp, $11e8
    ld sp, hl
    inc c
    ld d, e
    ld a, [$d1b9]
    ldh a, [rSC]
    sub c
    add c
    ld b, c
    ld hl, $21c1
    jp nc, $d1b1

    ld hl, $21c1
    jp nc, $d1b1

    ld hl, $21c1
    ld b, c
    add c
    sub c
    add c
    ld b, c
    ld hl, $21c1
    jp nc, $d1b1

    ld hl, $21c1
    jp nc, $d1b1

    ld c, c
    pop af
    ldh a, [rSC]
    push af
    inc e
    ld h, d
    ld hl, $6141
    add c
    pop bc
    ld hl, $2df5
    ld h, d
    push af
    inc e
    ld h, d
    sub c
    add c

Jump_003_6151:
    ld b, c
    ld hl, $61c1
    push af
    dec l
    ld h, d
    pop af
    push af
    rst $30
    ld h, c
    ld c, e
    or a
    sub c
    sub c
    pop bc
    jp nc, $9191

    pop bc
    ld a, [$d176]
    sub c
    sub c
    pop bc
    jp nc, $9191

    pop bc
    ld a, [$d0b8]
    jr nz, jr_003_6194

    jr nz, @+$22

    ld hl, $f5c1
    rst $30
    ld h, c
    or a
    sub e
    ld [hl], e
    sub e
    ld sp, hl
    inc c
    ld d, d
    ret nc

    inc hl
    pop bc
    inc hl
    pop bc
    cpl
    jp $11f2


    ld h, c
    db $fd
    ld b, $fa
    inc bc
    ei
    nop
    nop
    inc bc

jr_003_6194:
    ld de, $06e7
    ldh a, [rTMA]
    push af
    ld a, a
    ld h, d
    ld b, c
    call nc, $d3b1
    ld b, c
    call nc, $b0b1
    or b
    db $d3
    ld hl, $b1d4
    push af
    ld a, a
    ld h, d
    call nc, $b0b0
    db $d3
    ld hl, $2141
    call nc, $91b1
    add c
    pop af
    push af
    adc [hl]
    ld h, d
    push af
    and [hl]
    ld h, d
    push af
    adc [hl]
    ld h, d
    ldh a, [rSC]
    call nc, Call_003_7171
    pop bc
    db $d3
    ld [hl], c
    ld [hl], c
    pop bc
    pop af
    rst $00
    push af
    adc [hl]
    ld h, d
    push af
    and [hl]
    ld h, d
    db $d3
    ld bc, $71c1
    pop bc
    ld bc, $7101
    inc bc
    nop
    nop
    ld [hl], c
    ld bc, $2101
    ld b, c
    ld d, c
    inc sp
    call nc, $d3a1
    ld sp, $31c1
    inc hl
    pop bc
    ld hl, $2121
    ld hl, $2121
    ld hl, $97f2
    ld h, c
    ld a, [$d179]
    ld b, e
    ld h, c
    ld [hl], c
    pop bc
    sub c
    ld c, e

Jump_003_6200:
    ld [hl], a
    ld h, c
    ld hl, $b1d2
    pop de
    ld hl, $41c1
    dec hl
    ld a, [$d0b8]
    jr nz, @+$22

    jr nz, jr_003_6231

    ld hl, $fac1
    ld a, c
    pop de
    ld b, e
    ld h, c
    ld [hl], c
    pop bc
    sub c
    or $fa
    ld a, c
    pop de
    ld b, c
    ld hl, $b1d2
    sub c
    pop bc
    sub c
    add c
    sub c
    pop bc
    sub c
    cp e
    pop de
    or $4b
    ld a, [$d0b8]

jr_003_6231:
    ld b, b
    ld b, b
    ld b, b
    ld b, b
    ld b, c
    pop bc
    or $d2
    or c
    or b
    or b
    sub c
    add c
    sub c
    add c
    ld b, c
    db $d3
    or c
    jp nc, $20f6

    db $d3
    or b
    sub b
    add b
    sub c
    or c
    jp nc, Jump_003_4020

    add b
    sub b
    add c
    ld b, c
    or $81
    add b
    add b
    ld h, c
    ld b, c
    ld h, c
    ld h, c
    ld b, c
    db $d3
    or c
    jp nc, $d2f6

    ld [hl], c
    ld b, c
    ld h, c
    ld [hl], c
    pop bc
    ld h, c
    ld a, c
    pop bc
    ld b, b
    ld h, b
    ld [hl], b
    sub b
    or e
    or $61
    ld hl, $6141
    pop bc
    ld b, c
    ld l, c
    pop bc
    jr nz, @+$42

    ld h, b
    ld [hl], b
    sub c
    pop de
    ld hl, $d3f6
    ld b, c
    ld b, c
    call nc, $c1b1
    db $d3
    ld b, c
    ld b, c
    call nc, $d3b1
    ld b, c
    pop bc
    or $d4
    sub c
    pop bc
    db $d3
    sub c
    pop bc
    call nc, $9191
    db $d3
    sub c
    call nc, $9093
    sub b
    db $d3
    sub c
    call nc, $9191
    sub c
    db $d3
    sub e
    or $d4
    ld [hl], c
    pop bc
    db $d3
    ld [hl], c
    pop bc
    call nc, Call_003_7171
    db $d3
    ld [hl], c
    call nc, Call_003_7073
    ld [hl], b
    db $d3
    ld [hl], c
    call nc, Call_003_7171
    ld [hl], c
    db $d3
    ld [hl], e
    or $f0
    inc bc
    ld bc, $6121
    ld hl, $0101
    ld h, c
    ld bc, $2020
    nop
    nop
    ld h, c
    ld bc, $2101
    ld h, c
    ld de, $f6f1
    db $fd
    ld b, $f0
    dec bc
    ld bc, $6121
    ld de, $0101
    ld h, c
    ld bc, $0121
    ld h, c
    ld hl, $0001
    nop
    ld h, c
    ld hl, $01f1
    ld hl, $1161
    ld bc, $6101
    ld bc, $0121
    ld h, c
    ld hl, $6060
    ld bc, $6061
    ld h, b
    push af
    cp [hl]
    ld h, d
    ld h, c
    ld h, c
    ld hl, $2101
    ld bc, $6161
    ld bc, $6301
    ld bc, $6061
    ld h, b
    ld h, c
    push af
    cp [hl]
    ld h, d
    ld h, c
    ld de, $6101
    ld de, $6361
    ld bc, $6161
    ld h, c
    ld h, c
    nop
    nop
    ld h, b
    ld h, b
    ld h, c
    ldh a, [c]
    sub $62
    db $fd
    ld b, $fb
    ld de, $0414
    ld sp, $11e8
    ld sp, hl
    inc c
    ld d, l
    ld a, [$d278]
    ld h, l
    ld a, c
    dec h
    ld b, l
    db $d3
    or e
    jp nc, Jump_003_7965

    dec h
    ld b, l
    inc bc
    ld h, l
    ld a, c
    dec h
    ld b, e
    db $d3
    or c
    jp nc, Jump_003_7141

    sbc a
    pop bc
    ld a, [$d437]
    sub c
    sub c
    sub c
    sub c
    sub c
    sub c
    sub c
    push af
    ld d, b
    ld h, l
    db $d3
    or b
    ret nz

    jp nc, $c160

    ld h, b
    pop bc
    ld h, b
    ret nz

    db $d3
    ld [hl], b
    pop bc
    ld [hl], b
    pop bc
    ld b, b
    ret nz

    push af
    ld d, b
    ld h, l
    nop
    ret nz

    push af
    ld e, l
    ld h, l
    push af
    ld d, b
    ld h, l
    db $d3
    or b
    ret nz

    push af
    ld e, l
    ld h, l
    db $d3
    sub b
    pop bc
    sub b
    pop bc
    sub b
    ret nz

    ld [hl], b
    pop bc
    ld [hl], b
    pop bc
    ld b, b
    ret nz

    jp nc, Jump_000_02f0

    nop
    ret nz

    nop
    nop
    jp $b7f1


    ld [hl], a
    ld b, a
    ld [hl], a
    pop de
    ld b, a
    jp nc, $9373

    ldh a, [rSC]
    nop
    ret nz

    nop
    nop
    jp $b7f1


    ld [hl], e
    ld h, e
    ld [hl], a
    or a
    pop de
    rlca
    ld b, a
    cpl
    ld a, [$d2b7]
    ld e, a
    cpl
    and a
    ld [hl], a
    ld a, [$d337]
    ldh a, [rSC]
    ld [hl], b
    ret nz

    ld [hl], b
    ld [hl], b
    jp $faf1


    or a
    jp nc, $9f5f

    and a
    ld [hl], a
    ld b, a
    pop de
    rlca
    jp nc, $fa6f

    ld a, b
    pop bc
    ld h, c
    ld h, c
    pop bc
    ld h, c
    ld h, c
    jp $34f2


    ld h, e
    db $fd
    ld b, $fb
    ld de, $0414
    ld sp, $11e8
    ld sp, hl
    inc c
    ld d, e
    ld a, [$d2b9]
    ldh a, [rSC]
    sub l
    cp c
    ld h, l
    ld [hl], l
    ld b, e
    pop af
    sub l
    cp c
    ld h, l
    ld [hl], e
    ld b, c
    ld [hl], c
    or c
    pop de
    cpl
    pop bc
    ld a, [$d477]
    ld hl, $2121
    ld hl, $2121
    push af
    inc sp
    ld h, l
    pop de
    ld b, b
    jr nz, jr_003_6447

    jp nc, $fa73

    scf
    ld [hl], b
    pop bc
    ld [hl], b
    pop bc
    ld b, b
    ret nz

    sub b
    pop bc
    sub b
    pop bc
    sub b
    ret nz

    ld [hl], b
    pop bc
    ld [hl], b
    pop bc
    push af
    inc sp
    ld h, l
    pop de
    ld b, l
    jr nz, jr_003_6461

    jp nc, $fa77

    scf
    ldh a, [rSC]
    ld b, b
    ret nz

    ld b, b
    ld b, b
    jp $faf1


    ld a, c
    pop de
    ld hl, $6141
    ld [hl], c
    pop bc
    ld h, c
    sbc c
    ld [hl], b
    ld h, b
    ld b, e
    ld h, e
    ld [hl], l
    ld h, b

jr_003_643d:
    ld b, b
    rlca
    ld a, [$d237]
    ldh a, [rSC]
    ld b, b
    ret nz

    ld b, b

jr_003_6447:
    ld b, b
    jp $faf1


    ld a, c
    pop de
    ld hl, $6141
    ld [hl], c
    pop bc
    ld b, c
    sbc c
    ld [hl], b
    ld h, b
    ld b, e
    ld [hl], e
    cp l
    sub b
    ld [hl], b

jr_003_645b:
    ld l, a
    sub e
    ld d, e
    inc bc
    sub e
    ld h, e

jr_003_6461:
    pop bc
    ld h, b
    ld [hl], b
    sub d
    ld [hl], d
    ld h, c
    ld [hl], l
    ld d, b
    jr nc, jr_003_643d

    and a
    ld a, [$d337]
    ldh a, [rSC]
    and b
    ret nz

    and b
    and b
    jp $faf1


    ld a, c
    pop de
    sub e
    ld d, e
    inc bc
    sub e
    ld h, e
    pop bc
    ld h, b
    ld [hl], b
    sub d
    ld h, d
    sub c
    ld [hl], l
    ld d, b
    jr nc, jr_003_645b

    and e
    pop de
    inc sp
    dec b
    ld b, b
    ld d, b
    ld [hl], e
    ret nc

    inc bc
    pop de
    sbc a
    pop bc
    ld hl, $c121
    ld hl, $c321
    ldh a, [c]
    pop hl
    ld h, e
    db $fd
    ld b, $fa
    inc bc
    ei
    nop
    nop
    inc bc
    ld de, $06e7
    db $d3
    ldh a, [$ff0c]
    ld b, c
    pop af
    ld b, b
    ld b, b
    ld b, c
    ld b, c
    ld b, c
    ldh a, [$ff0c]
    ld bc, $00f1
    nop
    ld bc, $2121
    ldh a, [$ff0c]
    ld b, c
    pop af
    ld b, b
    ld b, b
    ld b, c
    ld b, c
    ld b, c
    ldh a, [rTAC]
    ld bc, $23f1
    ld hl, $2121
    jr nz, jr_003_64ef

    ld hl, $2020
    ld hl, $03f3
    ldh a, [$ff0c]
    ld b, c
    pop af
    ld b, b
    ld b, b
    ld b, c
    ld b, c
    ld b, c
    ldh a, [$ff0c]
    ld bc, $00f1
    nop
    ld bc, $0101
    db $f4
    ldh a, [$ff0c]
    ld b, c
    pop af
    ld b, b
    ld b, b
    ld b, c

jr_003_64ef:
    ld b, c
    ld b, c
    ldh a, [$ff08]
    ld bc, $21f1
    ld hl, $2121
    jr nz, jr_003_651b

    ld hl, $2121
    ldh a, [$ff08]
    ld d, c
    pop af
    ldh a, [$ff08]
    ld hl, $f0f1
    inc c
    ld sp, $30f1
    jr nc, @+$33

    ld sp, $f031
    ld [$f151], sp
    ldh a, [$ff08]
    ld hl, $f0f1
    ld [$f131], sp

jr_003_651b:
    ldh a, [$ff08]
    ld bc, $21f1
    ld hl, $2121
    jr nz, jr_003_6545

    ld hl, $2020
    ld hl, $21c1
    ld hl, $21c1
    ld hl, $f2c3
    xor d
    ld h, h
    ld a, [$d179]
    ld b, b
    ld h, b
    ld [hl], c
    ld h, c
    ld hl, $91d2
    ld a, [$7037]
    pop bc
    ld [hl], b
    pop bc
    ld b, b
    ret nz

jr_003_6545:
    sub b
    pop bc
    sub b
    pop bc
    ld a, [$b079]
    sub b
    ld [hl], e
    or e
    or $d3
    sub b
    pop bc
    sub b
    pop bc
    sub b
    ret nz

    jp nc, $c140

    ld b, b
    pop bc
    or $d2
    ld h, b
    pop bc
    ld h, b
    pop bc
    ld h, b
    ret nz

    ld b, b
    pop bc
    ld b, b
    pop bc
    ld b, b
    ret nz

    or $fd
    ld b, $f0
    inc bc
    ld bc, $6121
    ld de, $0101
    ld h, c
    ld hl, $2101
    ld h, c
    ld de, $0000
    ld hl, $1161
    pop af
    ld bc, $6121
    ld hl, $0101
    ld h, c
    ld b, e
    ld bc, $6060
    ld bc, $6060
    ld bc, $6060
    ld h, b
    ld h, b
    ldh a, [rTAC]
    ld bc, $6121
    ld hl, $2001
    jr nz, @+$63

    ld hl, $2001
    nop
    ld h, c
    ld hl, $2001
    jr nz, @+$62

    ld h, b
    ld hl, $01f1
    ld hl, $2161
    ld bc, $2020
    ld h, c
    ld hl, $2001
    nop
    ld h, b
    ld h, b
    nop
    ld h, b
    ld h, b
    nop
    ld h, b
    ld h, b
    ld h, b
    ld h, b
    ld h, b
    ld h, b
    ldh a, [rNR11]
    ld bc, $2020
    ld h, c
    jr nz, jr_003_65eb

    pop af
    ld bc, $2020
    ld h, b
    ld h, b
    ld h, b
    ld h, b

jr_003_65d3:
    ld bc, $6361
    ld h, c
    ld h, c
    sub b
    sub b
    sub b
    sub b
    ldh a, [c]
    ld l, l
    ld h, l
    db $fd
    ld b, $fb
    ld de, $0416
    ld hl, $17e8
    ld sp, hl
    inc c
    ld d, e

jr_003_65eb:
    ld a, [$f038]
    ld a, [bc]
    db $d3
    sub c
    jp nc, $d310

    sub b
    jp nc, Jump_000_3041

    db $d3
    or b
    jp nc, Jump_000_3041

    ld h, c
    jr nc, jr_003_65d3

    or c
    sub c
    jp nc, $d310

    sub b
    jp nc, Jump_000_3041

    db $d3
    or b
    jp nc, Jump_000_3041

    ld h, c
    jr nc, jr_003_6671

    jr nc, @-$0d

    ld a, [$f377]
    ld [bc], a
    ldh a, [rSC]
    jp nc, Jump_003_6070

    ld [hl], b
    sub b
    pop bc
    pop de
    nop
    jp nc, Jump_003_7090

    ld h, b
    pop bc
    ld [hl], b
    ld h, b
    sub c
    ld [hl], b
    ld h, b
    ld [hl], b
    sub b
    pop bc
    pop de
    nop
    jp nc, Jump_003_7090

    ld h, b
    pop bc
    ld [hl], b
    ld h, b
    ld hl, $f0f1
    ld [bc], a
    and b
    sub b
    and b
    pop de
    nop
    pop bc
    jr nc, jr_003_6643

jr_003_6643:
    jp nc, $90a0

    pop bc
    and b
    sub b
    pop de
    ld bc, $a0d2
    sub b
    and b
    pop de
    nop
    pop bc
    jr nc, jr_003_6654

jr_003_6654:
    jp nc, $90a0

    pop bc
    and b
    sub b
    ld d, c
    pop af
    db $f4
    ld [hl], d
    sbc h
    ldh a, [c]
    db $ed
    ld h, l
    db $fd
    ld b, $fb
    ld de, $0514
    ld [hl+], a
    add sp, $17
    ld sp, hl
    inc c
    ld d, e
    ld a, [$d2b9]

jr_003_6671:
    sub c
    pop de
    ld de, $3141
    jp nc, $c1b1

    or c
    ld h, c
    sub c
    pop bc
    sub c
    ld h, c
    sub c
    or e
    pop bc
    sub c
    pop de
    ld de, $3141
    jp nc, $c1b1

    or c
    ld h, c
    sub c
    pop bc
    cp c
    pop bc
    ld a, [$d179]
    ldh a, [rSC]
    ld [de], a
    ld b, d
    ld sp, $b9d2
    pop bc
    ld h, b
    ld h, b
    add b
    ret nz

    sub c
    ret nz

    sub c
    sub b
    pop de
    ld de, $b3d2
    ld h, c
    ld b, c
    pop bc
    add c
    ld l, a
    jp Jump_000_12d1


    ld b, d
    ld sp, $b9d2
    pop bc
    ld h, b
    ld h, b
    add b
    ret nz

    sub c
    ret nz

    sub c
    sub b
    or c
    pop de
    inc de
    ld sp, $b3d2
    pop bc
    pop de
    cp a
    jp $faf1


    add hl, sp
    pop de
    push af
    ld c, c
    ld h, a
    push af
    ld c, c
    ld h, a
    pop de
    ld [hl+], a
    ld c, h
    ldh a, [c]
    ld l, [hl]
    ld h, [hl]
    db $fd
    ld b, $fa
    inc bc
    ei
    nop
    nop
    ld [bc], a
    ld de, $06e7
    call nc, Call_000_03f0
    or c
    or c
    ld h, e
    sub c
    ret nz

    sub c
    ld h, b
    sub c
    pop af
    or c
    or c
    ld h, e
    sub c
    ret nz

    sub c
    ld h, b
    or b
    ld h, b
    di
    ld [bc], a
    call nc, Call_000_07f0
    or c
    or c
    ld h, e
    sub c
    ret nz

    sub c
    ld h, b
    sub c
    pop af
    or c
    or c
    ld h, e
    or b
    db $d3
    db $10
    jr nc, @+$42

    ld h, b
    call nc, $d3b0
    or c
    db $f4
    di
    ld [bc], a
    ldh a, [rSC]
    db $d3
    ld hl, $d421
    sub e
    db $d3
    ld [bc], a
    ld bc, $70d4
    sub c
    db $d3
    ld hl, $d421
    sub e
    db $d3
    ld [bc], a
    ld bc, $90d4
    ld [hl], c
    pop af
    ldh a, [rSC]
    db $d3
    ld d, c
    ld d, c
    inc bc
    ld [hl-], a
    ld sp, $a0d4
    db $d3
    ld bc, $5151
    inc bc
    ld [hl-], a
    ld sp, $d400
    and c
    pop af
    db $f4
    db $d3
    and d
    cp h
    ldh a, [c]
    pop hl
    ld h, [hl]
    di
    ld [bc], a
    ldh a, [rDIV]

jr_003_674d:
    ld [hl], b
    ld h, b
    ld bc, $f101
    ld [hl], b
    ld h, b
    ld bc, $6091
    jr nz, jr_003_674d

    di
    ld [bc], a
    ldh a, [rDIV]
    and b
    sub b
    ld sp, $f131
    and b
    sub b
    ld sp, $01d0
    pop de
    sub b
    ld d, b
    db $f4
    or $fd
    ld b, $f0
    inc bc
    ld bc, $2020
    ld h, c
    jr nz, @+$22

    ld bc, $2020
    ld h, c
    jr nz, jr_003_67bc

    pop af
    ld bc, $2020
    ld h, c
    jr nz, jr_003_6783

jr_003_6783:
    ldh a, [$ff08]
    ld h, b
    pop af
    di
    ld [bc], a
    ldh a, [rTAC]
    ld bc, $2020
    ld h, c
    jr nz, jr_003_67b1

    ld bc, $2020
    ld h, c
    jr nz, @+$42

    pop af
    ld h, b
    ld h, b
    ld h, b
    ld h, b
    nop
    nop
    nop
    nop
    ldh a, [$ff08]
    ld h, b
    pop af
    db $f4
    di
    ld [bc], a
    ldh a, [rIF]
    nop
    jr nz, @+$43

    ld h, c
    jr nz, jr_003_67af

jr_003_67af:
    pop af
    nop

jr_003_67b1:
    jr nz, jr_003_67f4

    ld h, b
    ld h, b
    ld h, b
    ld h, b
    db $f4
    ld [bc], a
    ld [bc], a
    jr nz, @+$22

jr_003_67bc:
    ldh a, [$ff08]
    sub b
    pop af
    ldh a, [c]
    ld l, [hl]
    ld h, a
    db $fd
    ld b, $fb
    ld de, $0415
    ld sp, $0be8
    ld a, [$d239]
    ld bc, $e8c1
    rla
    ld b, c
    ret nz

jr_003_67d5:
    ld hl, $d3c0
    or b
    ret nz

jr_003_67da:
    jp nc, $c001

    ld bc, $40c0
    ret nz

    ld hl, $d3c0
    or c
    ret nz

    jp nc, $c101

    ld a, [$fbb7]
    ld de, $0815
    inc h
    ld sp, hl
    jr jr_003_6846

    push af

jr_003_67f4:
    jr c, jr_003_6860

    jp nc, $f56d

    jr c, jr_003_6865

    jp nc, $fa9f

    ld a, c
    ei
    ld de, $0515
    ld [hl+], a
    pop de
    ld h, c
    ret nz

    ld b, c
    ret nz

    nop
    ret nz

    ld b, c
    ret nz

    nop
    call nc, VBlankInterrupt
    jr nz, jr_003_67d5

    pop de
    jr nz, @-$3e

jr_003_6816:
    ld b, c
    pop bc
    jr nz, jr_003_67da

    jr nz, @+$43

    ret nz

    ld a, [$fbb7]
    ld de, $0614
    ld [hl-], a
    push af
    jr nz, jr_003_6891

    daa
    push af
    jr nz, jr_003_6895

    add hl, hl
    ld a, [$fb77]
    ld de, $0415
    ld sp, $02f3
    ldh a, [rSC]
    db $d3
    sub c
    sub c

jr_003_683a:
    ld b, b
    ld [hl], b

jr_003_683c:
    ret nz

    sub b
    ret nz

    sub b
    jp nc, $c000

    jp nc, $c020

jr_003_6846:
    nop
    ret nz

    db $d3
    sub c
    sub c
    ld b, b
    ld [hl], b
    ret nz

    sub b
    ret nz

    sub b
    jp nc, $c000

    jr nz, jr_003_6816

    ld b, b
    ret nz

    pop af
    ldh a, [rSC]
    jp nc, Jump_000_0101

    db $d3
    ld [hl], b

jr_003_6860:
    and b
    ret nz

    jp nc, $c000

jr_003_6865:
    nop
    db $d3
    and b
    ret nz

    ld [hl], b
    ret nz

    and b
    ret nz

    jp nc, Jump_000_0101

    db $d3
    ld [hl], b
    and b
    ret nz

    jp nc, $c000

    nop
    jr nc, jr_003_683a

    jr nz, jr_003_683c

    db $d3
    and b
    ret nz

    pop af
    db $f4
    ldh a, [c]
    call z, $fd67
    ld b, $fb
    ld de, $0415
    ld sp, $0be8
    ld a, [$d239]
    sub c

jr_003_6891:
    pop bc
    add sp, $17
    pop de

jr_003_6895:
    ld bc, $d2c0
    or c
    ret nz

    ld [hl], b
    ret nz

    sub c
    ret nz

    sub c
    ret nz

    pop de
    nop
    ret nz

    jp nc, $c0b1

    ld [hl], c
    ret nz

    sub c
    pop bc
    ld sp, hl
    inc c
    ld b, e
    push af
    rst $18
    ld l, c
    ld c, b
    push af
    ld c, $6a
    ld a, [$d039]
    ld hl, $01c0
    ret nz

    pop de
    sub b
    ret nz

    ret nc

    ld bc, $d1c0
    sub c
    ret nz

    call nc, $4090
    ld [hl], b
    ret nz

    pop de

jr_003_68ca:
    ld [hl], b
    ret nz

    sub c
    pop bc
    ld [hl], b
    ret nz

    ld [hl], b
    sub c
    ret nz

    push af
    rst $18
    ld l, c
    ld b, c
    ret nz

    jp nc, $7060

    ld h, b
    ld b, c
    ret nz

    push af
    ld c, $6a
    ld a, [$fb79]
    ld de, $0415
    ld sp, $02f3
    jp nc, Jump_000_02f0

    sub c
    pop bc

jr_003_68ef:
    pop de
    ld bc, $d2c0
    or b
    ret nz

    or b
    ld [hl], b
    ret nz

    ld b, b
    ret nz

    ld [hl], b
    ret nz

    sub c
    pop bc
    pop de
    ld bc, $d2c0
    or b
    ret nz

    or b
    pop de
    ld b, b
    ret nz

    jr nz, jr_003_68ca

    jp nc, $c0b0

    pop af
    ldh a, [rSC]
    pop de
    ld bc, $71c1
    ret nz

    ld d, b
    ret nz

    ld d, b
    jr nz, @-$3e

    jp nc, $c0a0

    ld [hl], b
    ret nz

    pop de
    ld bc, $31c1
    ret nz

    ld d, b
    ret nz

    ld d, b
    jr nz, @-$3e

    jp nc, $c0a0

    pop de
    jr nz, jr_003_68ef

    pop af
    db $f4
    ldh a, [c]
    adc l
    ld l, b
    db $fd
    ld b, $fa
    inc bc
    ei
    nop
    nop
    inc bc
    ld de, $06e7
    call nc, $c191
    db $d3
    ld bc, $d4c0
    or c
    ret nz

    ld [hl], b
    ret nz

    sub c
    ret nz

    sub c
    ret nz

    db $d3
    nop
    ret nz

    call nc, $c0b1
    ld [hl], c
    ret nz

    sub c
    pop bc
    ld b, b
    ld [hl], b
    push af
    ld c, e
    ld l, d
    ld b, d
    ld [hl], d
    ld b, c
    sub b
    db $d3
    sub b
    ld [hl], b
    ld b, b
    jr nz, jr_003_6967

jr_003_6967:
    call nc, $d391
    ld hl, $01c0
    ret nz

    call nc, $d391
    ld bc, $d4c0
    sub d
    jp $c070


    sub c
    pop bc
    ld [hl], b
    ret nz

    ld [hl], b
    sub d
    ld b, b
    ld [hl], b
    push af
    ld c, e
    ld l, d
    sub d
    sub d
    db $d3
    nop
    call nc, $d390
    ld [hl+], a
    ld b, d
    call nc, $f041
    ld [bc], a
    sub c
    sub c
    ret


    ld [hl], c
    sub c
    sub c
    ret


    ld b, c
    pop af
    ldh a, [rSC]
    db $d3
    ld bc, $c901
    call nc, $d3a1
    ld bc, $c901
    call nc, $f171
    ldh a, [rSC]
    call nc, $9191
    ld b, b
    ld [hl], c
    sub c
    sub b
    db $d3
    ld bc, $4121
    call nc, $9191
    ld b, b
    ld [hl], c
    sub c
    sub b
    db $d3
    ld bc, $d421
    ld [hl], c
    pop af
    jp nc, Jump_000_02f0

    ld bc, $d401
    ld [hl], b
    and c
    db $d3
    ld bc, $3100
    ld d, c
    ld [hl], c
    ld bc, $d401
    ld [hl], b
    and c
    db $d3
    ld bc, $3100
    ld d, c
    ld hl, $f2f1
    ccf
    ld l, c
    ld a, [$d279]
    ld b, b
    ld [hl], b
    sub c
    pop bc
    or c
    pop bc
    pop de
    ld [bc], a
    ld b, d
    ld [hl], c
    ld h, c
    ld b, b
    ld c, b
    pop bc
    jp nc, Jump_003_7040

    sub c
    pop bc
    or c
    pop bc
    pop de
    ld [bc], a
    ld b, d
    ld [hl], c
    ld h, c
    sub b
    sbc b
    pop bc
    jp nc, Jump_003_7040

    sub c
    pop bc
    or c
    pop bc
    pop de
    ld [bc], a
    ld b, d
    ld [hl], c
    ld h, b
    ld [hl], b
    ld h, b
    or $d2
    or b
    sub b
    ld [hl], b
    ld b, b
    sub c
    pop bc
    or c
    pop bc
    pop de
    ld [bc], a
    ld b, d
    ld [hl], c
    ld h, c
    sub b
    sbc d
    pop bc
    or $d3
    ld b, b
    ld [hl], b
    jp nc, Jump_000_0745

    db $d3

jr_003_6a27:
    ld b, b
    ld [hl], b
    jp nc, $0765

    db $d3
    ld b, b
    ld [hl], b
    jp nc, Jump_000_0775

    db $d3
    ld b, b
    ld [hl], b
    jp nc, $f665

    db $d3
    ld b, b
    ld [hl], b
    jp nc, $d34d

    ld b, b
    ld [hl], b
    jp nc, $d36d

    ld h, b
    sub b
    jp nc, $d37d

    ld [hl], b
    or b
    or $f0
    rlca
    sub d
    sub d
    db $d3
    nop
    jr nz, jr_003_6a27

    sub d
    ld b, d
    ld [hl], c
    pop af
    or $f0
    rlca
    ld bc, $2020
    ld h, c
    jr nz, @+$22

    ld bc, $0020
    ld h, c
    jr nz, jr_003_6aa6

    pop af
    ld bc, $2020
    ld h, c
    jr nz, jr_003_6a6d

jr_003_6a6d:
    nop
    ld h, b
    ld h, c
    ld h, c
    ld h, b
    ld h, b
    or $fd
    ld b, $61
    jr nz, jr_003_6a99

    ld h, c
    jr nz, jr_003_6add

    jr nz, jr_003_6adf

    ld h, b
    jr nz, @+$22

    ld h, b
    jr nz, jr_003_6aa4

    ld h, c
    ld h, c
    jr nz, @+$63

    jr nz, jr_003_6aeb

    ld h, c
    ld h, b
    ld h, b
    push af
    ld e, b
    ld l, d
    sub c
    nop
    sub c
    nop
    ld h, b
    nop
    sub c
    nop
    ld h, c

jr_003_6a99:
    ld h, b
    jr nz, @+$22

    nop
    jr nz, @-$6d

    ld h, c
    jr nz, jr_003_6aa2

jr_003_6aa2:
    ld h, b
    ld h, b

jr_003_6aa4:
    nop
    ld h, c

jr_003_6aa6:
    nop
    ld h, b
    ld h, b
    push af
    ld e, b
    ld l, d
    ldh a, [rTAC]
    ld bc, $4101
    jr nz, jr_003_6ac3

    ld b, c
    jr nz, jr_003_6ac6

    ld b, c
    nop
    db $10
    pop af
    ld bc, $4101
    jr nz, @+$12

    ld b, c
    jr nz, jr_003_6ac2

jr_003_6ac2:
    ld h, b

jr_003_6ac3:
    ld h, b
    ld h, b
    ld h, b

jr_003_6ac6:
    ldh a, [rTAC]
    ld bc, $6101
    jr nz, jr_003_6ace

    nop

jr_003_6ace:
    jr nz, jr_003_6ae0

    ld h, c
    jr nz, @+$12

    pop af
    ld bc, $7101
    jr nz, jr_003_6ad9

jr_003_6ad9:
    ldh a, [$ff08]
    ld h, b
    pop af

jr_003_6add:
    ldh a, [c]
    halt

jr_003_6adf:
    ld l, d

jr_003_6ae0:
    db $fd
    dec b
    ld a, [$fb78]
    ld de, $0214
    ld de, $09e8

jr_003_6aeb:
    di
    ld [bc], a
    ldh a, [$ff08]
    call nc, $d271
    ld d, b
    ret nz

    pop af
    ldh a, [$ff08]
    call nc, $d281
    jr nc, @-$3e

    pop af
    db $f4
    ldh a, [rSC]
    call nc, $d291
    sub b
    ret nz

    pop af
    ldh a, [rSC]
    call nc, $d2a1
    and b
    ret nz

    pop af
    ldh a, [rSC]
    call nc, $d2b1
    or b
    ret nz

    pop af
    ldh a, [rSC]
    call nc, $d101
    nop
    ret nz

    pop af
    ldh a, [rDIV]
    call nc, $d211
    ld d, b
    ret nz

    call nc, $d201
    ld b, b
    ret nz

    push de
    or c
    jp nc, $c030

    push de
    and c
    jp nc, $c020

    pop af
    ldh a, [c]
    db $eb
    ld l, d
    db $fd
    dec b
    ld a, [$fb79]
    ld de, $0214
    ld [de], a
    di
    ld [bc], a
    jp nc, Jump_000_04f0

    and b
    or b
    and b
    ld [hl], b
    pop de

jr_003_6b4b:
    jr nz, jr_003_6b9d

    nop
    jp nc, $f1b0

    ldh a, [rDIV]
    jp nc, $d1b0

    nop
    jp nc, $80b0

    pop de
    jr nc, @+$62

    stop
    pop af
    db $f4
    nop
    stop
    jp nc, $d190

    ld b, b
    ld [hl], b
    jr nz, jr_003_6b7b

    db $10
    jr nz, jr_003_6b7e

    jp nc, $d1a0

    ld d, b
    add b
    jr nc, @+$22

    jr nz, @+$32

    jr nz, jr_003_6b4b

    or b
    pop de

jr_003_6b7b:
    ld d, b
    sub b
    ld b, b

jr_003_6b7e:
    jr nc, jr_003_6bb0

    ld b, b
    jr nc, jr_003_6b83

jr_003_6b83:
    ld [hl], b
    and b
    ld d, b
    ld b, b
    ldh a, [rDIV]
    add b
    or b
    ld h, b
    ld d, b
    ld [hl], b
    and b

jr_003_6b8f:
    ld d, b
    ld b, b
    ld h, b
    sub b
    ld b, b
    jr nc, jr_003_6be6

    add b
    jr nc, @+$22

    pop af
    ldh a, [c]
    ld b, c
    ld l, e

jr_003_6b9d:
    db $fd
    dec b
    ld a, [$fb03]
    nop
    nop
    ld [bc], a
    ld de, $06e7
    call nc, $c177
    and b
    ret nz

    or b
    ret nz

    db $d3

jr_003_6bb0:
    dec h
    call nc, Call_003_73b3
    ld d, e
    add a
    db $d3
    scf
    call nc, $d387
    inc sp
    call nc, Call_003_7783
    pop bc
    and b
    ret nz

    or b
    ret nz

    db $d3
    dec h
    call nc, $d373
    ld [hl], e
    ld d, e
    add b
    ret nz

    jr nc, jr_003_6b8f

    call nc, $c183
    add e
    add l
    db $d3
    inc sp
    add e
    inc sp
    call nc, $a797
    or a
    db $d3
    rlca
    inc de
    inc bc
    call nc, $a3b3
    db $d3
    inc de
    inc bc

jr_003_6be6:
    call nc, $a3b3
    db $d3
    pop bc
    ld de, $01c1
    pop bc
    call nc, $c1b1
    and c
    db $d3
    db $10
    db $10
    db $10
    stop
    nop
    nop
    nop
    call nc, $b0b0
    or b
    or b
    and b
    and b
    and b
    and b
    ldh a, [c]
    xor c
    ld l, e
    db $fd
    dec b
    ldh a, [rNR23]
    ld bc, $1010
    ld [hl], c
    db $10
    db $10
    pop af
    ldh a, [rTMA]
    ld h, c
    ld bc, $60f1
    ld h, b
    ld h, b
    ld h, b
    ld h, b
    ld h, b
    ld h, b
    ld h, b
    ldh a, [c]
    ld a, [bc]
    ld l, h
    db $fd
    ld b, $fa
    scf
    add sp, $11
    ei
    ld de, $0415
    ld hl, $f3f5
    ld l, l
    di
    rlca
    ldh a, [rSC]
    push af
    add hl, bc
    ld l, [hl]
    pop af
    ldh a, [rSC]
    push af
    di
    ld l, l
    pop af
    db $f4
    ld sp, hl
    inc c
    ld d, d
    ldh a, [rSC]
    push af
    add hl, bc
    ld l, [hl]
    pop af
    push af
    di
    ld l, l
    ldh a, [$ff03]
    call nc, Call_003_7070
    db $d3
    ld d, b
    ld [hl], b
    ret nz

    and b
    ret nz

    ld [hl], b
    and b
    ld [hl], b
    ret nz

    ld [hl], b
    and b
    jp nc, $d522

    nop
    nop
    db $d3
    ld [hl], b
    and b
    jp nc, RST_00

    ret nz

    db $d3
    ld [hl], b
    jp nc, $d300

    ld [hl], b
    ret nz

    ld [hl], b
    jp nc, Jump_003_4200

    pop af
    pop de
    sub b
    ret nz

    sub d
    ret nz

    ld d, d
    ret nz

    sub d
    ret nz

    ld d, c
    ld [hl], b
    ret nz

    ld [hl], d
    ret nz

    ld b, a
    pop bc
    ld h, b
    ret nz

    ld h, b
    jp nz, $c070

    sub b
    jp nz, $c260

    or d
    ret nc

    nop
    pop bc
    add hl, hl
    jp nc, $d327

    or a
    ldh a, [c]
    ld l, $6c
    db $fd
    ld b, $fb
    ld de, $0514
    ld [hl+], a
    ld sp, hl
    inc c
    ld d, d
    ld a, [$f079]
    ld [bc], a
    call nc, $c002
    add sp, $12
    pop de
    ld b, e
    ld d, b
    ret nz

    ld [hl], b
    jp nz, $dbf5

    ld l, l
    ld [hl], b
    ld c, a
    ret nz

    call nc, $c002
    pop de
    ld b, e
    ld d, b
    ret nz

    ld [hl], b
    ret nz

    ret nc

    nop
    ret nz

    push af
    db $db
    ld l, l
    sub b
    ld a, h
    push af
    cp c
    ld l, l
    ld hl, $c040
    ld d, b
    ret nz

    ld [hl], c
    pop bc
    ld b, l
    pop bc
    dec b
    push af
    cp c
    ld l, l
    pop de

jr_003_6cdc:
    and c
    sub b
    ret nz

    and b

jr_003_6ce0:
    ret nz

    ret nc

    inc hl
    ld d, b
    ret nz

    ld b, e
    pop bc
    add hl, bc
    pop af
    push af
    ld [$256d], a
    inc bc
    pop bc
    pop de
    ld a, c
    push af
    ld [$236d], a
    ld d, b
    ret nz

    ld b, e
    pop bc
    add hl, bc
    call nc, $c072
    pop de
    and b
    ret nz

    sub b
    ret nz

    and b
    ret nz

    ret nc

    inc hl
    ld d, b
    ret nz

    ld b, e
    pop bc
    ld a, c
    ld d, b
    ret nz

    ld d, d
    ret nz

    ld [bc], a
    ret nz

    ld d, d
    ret nz

    ld bc, $c040
    ld b, d
    ret nz

    rlca
    pop bc
    jr nz, jr_003_6cdc

    jr nz, jr_003_6ce0

    ld b, b

jr_003_6d1f:
    ret nz

    ld h, b
    jp nz, $c220

    ld [hl], d
    sub b
    pop bc
    cp c
    ld a, [$d239]
    ld [hl], d
    or d
    pop de
    ld hl, $0cf9
    ld d, l
    ld d, a
    ldh a, [c]
    and d
    ld l, h
    db $fd
    ld b, $fa
    inc bc
    ei
    nop
    nop
    inc bc
    ld de, $06e7
    push af
    and c
    ld l, l
    di
    rlca
    ldh a, [rSC]
    push af
    xor a
    ld l, l
    pop af
    ldh a, [rSC]
    push af
    and c
    ld l, l
    pop af
    db $f4
    ldh a, [rSC]
    push af
    xor a
    ld l, l
    pop af
    push af
    and c
    ld l, l
    ldh a, [$ff03]
    db $d3
    ld [hl], d
    ld [hl], b
    ld hl, $2175
    ld [hl], c
    ld [bc], a
    nop
    call nc, $d371
    dec b
    call nc, $d371
    ld bc, $fbf1
    nop
    nop
    ld b, $00
    call nc, $0151
    ld d, c
    ld bc, $0151
    ld d, c
    ld bc, $0141
    ld b, c
    ld bc, $0141
    ld b, c
    ld bc, $00fb
    nop
    ld [bc], a
    nop
    ld [hl+], a
    jr nz, jr_003_6d1f

    db $d3
    inc hl
    call nc, Call_000_2391
    ld [hl], d
    sub b
    pop bc
    cp c
    ld sp, hl
    jr jr_003_6df0

    ld a, a
    ld sp, hl
    nop
    nop
    ldh a, [c]
    ld b, c
    ld l, l
    db $d3
    ld [bc], a
    nop
    call nc, $d371
    inc bc
    call nc, Call_003_7071
    sub b
    db $d3
    ld bc, $d4f6
    and d
    and b
    ld d, c
    and e
    ld d, c
    ld d, b
    ld [hl], b
    and c
    or $fd
    inc bc
    db $fc
    pop de
    sub b
    and b
    or b
    ret nc

    nop
    db $10
    jr nz, jr_003_6df5

    ld b, b
    db $fd
    ld b, $ec
    ld d, b
    pop bc
    ld b, b
    pop bc
    ld bc, $53c1
    ld b, c
    ld d, b
    pop bc
    ld b, b
    pop bc
    add hl, bc
    push de
    and d
    ret nc

    ret nz

    or $d1
    xor a
    pop bc
    push de
    and d
    ret nz

    pop de
    and e
    sub b
    ret nz

    ld [hl], b
    ret nz

    ld d, b
    ret nz

    or $d4
    ld [hl], d
    ret nz

    pop de
    ld [hl], e
    and b

jr_003_6df0:
    ret nz

    ret nc

    or $d5
    nop

jr_003_6df5:
    nop
    db $d3
    and b
    ret nz

    jp nc, Jump_003_4000

    ret nz

    nop
    db $d3
    and b
    jp nc, $c000

    nop
    pop bc
    db $d3
    ld d, b
    ld [hl], b
    or $d6
    and b
    and b
    db $d3
    and b
    ret nz

    and b
    jp nc, $c020

    db $d3
    ld d, b
    and b
    jp nc, $c000

    nop
    pop bc
    db $d3
    ld d, b
    ld [hl], b
    or $01
    jr nz, jr_003_6e22

jr_003_6e22:
    ld h, c
    ld bc, $2020
    ld bc, $2061
    jr nz, @-$08

    db $fd
    ld b, $f3
    ld [bc], a
    ldh a, [rTAC]
    push af
    rra
    ld l, [hl]
    pop af
    ld bc, $0020
    ld h, c
    ld bc, $6060
    ld bc, $6061
    ld h, b
    ldh a, [rTAC]
    push af
    rra
    ld l, [hl]
    pop af
    ld h, b
    ld h, b
    ld h, b
    ld h, b
    ld bc, $6060
    ld h, b
    ld h, b
    ld bc, $6060
    ld bc, $f0f4
    ld b, $f5
    rra
    ld l, [hl]
    pop af
    ldh a, [$ff08]
    ld h, c
    ld bc, $f5f1
    rra
    ld l, [hl]
    ld h, c
    nop
    ld h, c
    nop
    ld h, b
    ld h, b
    ld bc, $6061
    ld h, b
    ld bc, $6060
    nop
    ld b, c
    nop
    ld h, b
    nop
    ld h, b
    ld h, c
    ld h, c
    ld h, b
    ld h, c
    ldh a, [c]
    dec l
    ld l, [hl]
    db $fd
    rlca
    ld a, [$fb39]
    ld de, $0415
    ld [hl+], a
    add sp, $14
    ld sp, hl
    ld [$d442], sp
    jr nz, jr_003_6ead

    jr nz, @+$22

    ret nz

    jr nc, @+$32

    jr nc, jr_003_6ed4

    ld b, b
    ld b, b
    ld b, b
    ld d, b
    ld d, b
    ld d, b
    ld d, b
    push af
    adc $70
    pop de
    nop
    jr nz, jr_003_6ef2

    jr nc, jr_003_6ec4

    jp nc, $50a0

    push af
    adc $70
    ld d, b
    pop de
    nop

jr_003_6ead:
    jp nc, $d150

    jr nz, jr_003_6ee2

    ld d, b
    ld [hl], b
    jp nc, $7397

    ret nz

    and d
    push af
    ld a, [$f570]
    db $e3
    ld [hl], b
    and c
    and b
    jp nc, $d1a1

jr_003_6ec4:
    and c
    add c
    ld d, c
    jp nc, $f5a7

    db $e3
    ld [hl], b
    ld hl, $d320
    and c
    ret nc

    ld hl, $0111

jr_003_6ed4:
    pop de
    and e
    jp nc, $97a3

    ld [hl], e
    ret nz

    ld [hl-], a
    push af
    ld a, [$d170]
    nop
    nop

jr_003_6ee2:
    jp nc, $d170

    ld bc, $70d2
    pop de
    ld bc, $0000
    jp nc, $d190

    ld bc, $90d2

jr_003_6ef2:
    pop de
    ld bc, $96d2
    ld d, c
    ld bc, $91d3
    ld d, d
    jp nc, $5777

    add a
    ld b, a
    ldh a, [rDIV]
    jp nc, $d1b0

    nop
    pop af
    push de
    or c
    push bc
    db $d3
    ldh a, [$ff03]
    push af
    db $ed
    ld [hl], b
    pop af
    ld b, b
    ret nz

    ld b, b
    ld b, b
    ret nz

    ld b, b
    ld b, b
    ret nz

    ldh a, [rSC]
    push af
    db $ed
    ld [hl], b
    pop af
    db $d3
    add d
    jp nc, $d342

    or c
    jp nc, $d342

    add d
    or c
    ldh a, [$ff03]
    db $d3
    sub b
    jp nc, Jump_003_4200

    sub d
    db $d3
    sub b
    jp nc, Jump_003_6200

    sub d
    pop af
    db $d3
    ld d, b
    and b
    jp nc, Jump_003_7232

    db $d3
    and b
    jp nc, $7230

    and d
    ldh a, [c]

jr_003_6f46:
    sbc e
    ld l, [hl]
    db $fd
    rlca
    ld a, [$fb79]
    ld de, $0414

jr_003_6f50:
    ld [hl+], a
    add sp, $15
    ld sp, hl
    ld [$d242], sp
    jr nz, @+$22

    jr nz, jr_003_6f7b

    ret nz

    jr nc, jr_003_6f8e

    jr nc, jr_003_6fa0

    ld b, b
    ld b, b
    ld b, b
    ld d, b
    ld d, b
    ld d, b
    ld d, b
    ldh a, [rSC]
    push af
    xor [hl]
    ld [hl], b
    jr nz, jr_003_6f9e

    ld d, b
    add b
    ld [hl], b
    ld d, b
    jr nz, jr_003_6f46

    and b
    push af
    xor [hl]
    ld [hl], b
    jr nz, @-$2c

    and b

jr_003_6f7b:
    pop de
    jr nc, jr_003_6f50

    and b
    pop de
    ld d, b
    ld [hl], b
    add b
    and b
    sub c
    ld d, c
    nop
    sub b
    ret nz

    and c
    sub b
    ld [hl], b
    ld d, b
    ret nz

jr_003_6f8e:
    ld [hl-], a
    jr nz, @+$08

    ld a, [$d137]
    jr nz, jr_003_6fd6

    jr nz, @+$42

    ret nz

    ld b, b
    ld b, c
    ld a, [$9179]

jr_003_6f9e:
    ld d, c
    nop

jr_003_6fa0:
    sub b
    ret nz

    and c
    and b
    add b
    add b
    ld [hl], b
    ld [hl], b
    ld d, b
    ld d, b
    jr nc, jr_003_6fdc

    jr nz, jr_003_6fce

    nop
    nop
    jp nc, $a0a0

    add b
    add b
    ld [hl], b
    ld [hl], b
    ld d, b
    ld d, b
    jr nc, jr_003_6feb

    pop af
    ld a, [$d139]
    ld b, b
    ld b, b
    nop
    ld b, c
    nop
    ld b, c
    ld d, b
    ld d, b
    nop
    ld d, c
    nop
    ld d, c
    ld d, b
    ld [hl], b
    ld d, b

jr_003_6fce:
    ld b, c
    ld bc, $91d2
    ld d, c
    ld bc, $92d3

jr_003_6fd6:
    jp nc, $b422

    sub d
    pop de
    ld [bc], a

jr_003_6fdc:
    ld hl, $08f0
    jp nc, $d1b0

    nop
    pop af
    ld b, b
    ld d, b
    ld b, b
    ld d, b
    ld b, b
    ld d, b
    ld b, b

jr_003_6feb:
    ld d, b
    call nc, $c541
    ld a, [$d179]
    ld b, d
    ld [bc], a
    ld b, c
    ld h, d
    ld b, d
    ld hl, $4620
    ld a, [$d338]
    sub b
    ret nz

    sub b
    sub b
    ret nz

    sub b
    sub b
    ret nz

    ld a, [$d179]
    ld b, d
    ld [bc], a
    ld b, c
    ld h, d
    ld b, d
    ld hl, $428f
    ld [bc], a
    ld b, c
    ld h, d
    ld b, d
    ld hl, $4620
    ld a, [$d338]
    sub b
    ret nz

    sub b
    sub b
    ret nz

    sub b
    sub b
    ret nz

    ld a, [$d179]
    ld b, d
    ld [bc], a
    ld b, c
    ld h, d
    ld b, d
    ld hl, $f27f
    ld h, a
    ld l, a
    db $fd
    rlca
    ld a, [$fb03]
    nop
    nop
    ld [bc], a
    ld de, $06e7
    db $d3
    jr nz, @+$22

    jr nz, jr_003_705f

    ret nz

Jump_003_7040:
    jr nc, jr_003_7072

    jr nc, jr_003_7084

    ld b, b
    ld b, b
    ld b, b
    ld d, b
    ld d, b
    ld d, b
    ld d, b
    di
    ld [bc], a
    call nc, Call_003_40f0
    and b
    pop af
    db $d3
    ldh a, [$ff08]
    ld d, b
    pop af
    jr nc, jr_003_7089

    jr nc, @+$32

    ret nz

jr_003_705c:
    ld sp, $f030

jr_003_705f:
    stop
    pop af
    ldh a, [rTAC]
    ld d, b
    pop af
    ld sp, $10f0

jr_003_7069:
    jr nc, jr_003_705c

    jr nz, jr_003_706d

jr_003_706d:
    call nc, $80a0

Call_003_7070:
Jump_003_7070:
    and b

Call_003_7071:
jr_003_7071:
    db $d3

jr_003_7072:
    nop

Call_003_7073:
    jr nz, jr_003_7069

    ldh a, [$ff08]
    nop
    pop af
    call nc, Call_000_08f0
    and b
    pop af
    ldh a, [rNR10]
    sub b
    pop af
    ldh a, [$ff08]

jr_003_7084:
    ld [hl], b
    pop af
    ldh a, [$ff08]
    ld d, b

jr_003_7089:
    pop af

jr_003_708a:
    ldh a, [rNR23]
    ld b, b
    pop af
    ld b, c
    push bc

Jump_003_7090:
    ldh a, [$ff28]
    sub b
    pop af
    db $d3
    ldh a, [$ff08]
    jr nz, jr_003_708a

    ldh a, [rNR10]
    ld b, b
    pop af
    call nc, Call_000_28f0
    sub b
    pop af
    db $d3
    ldh a, [$ff08]
    jr nz, @-$0d

    ldh a, [rNR10]
    ld d, b
    pop af
    ldh a, [c]
    ld c, e
    ld [hl], b
    db $d3
    and b

Jump_003_70b0:
    and b
    jp nc, $80a0

    ld d, b
    pop de
    jr nc, jr_003_70d8

    jp nc, $d1a0

    ld d, b
    jr nc, @+$22

    jr nc, @+$22

    jp nc, $80a0

    ld [hl], b
    ld d, b
    ld [hl], b
    ld d, b
    add b
    ld d, b
    and b
    ld d, b
    pop de
    nop
    or $d2
    ld hl, $c021
    db $d3
    ld d, d

Jump_003_70d4:
    and d
    ld d, d
    add b
    ld [hl], b

jr_003_70d8:
    jp nc, $3020

    jr nz, jr_003_712d

    jr nz, jr_003_714f

    jr nz, jr_003_7071

    and b
    or $d2
    ld hl, $c021
    pop de
    add c
    and h
    ret nz

    jp nc, $90f6

    ret nz

    sub b
    ld b, b
    call nc, $d390
    sub b
    call nc, $d390
    sub b
    or $d1
    jr nz, jr_003_713d

    jr nz, jr_003_713f

    ret nz

    ld b, b
    jr nz, jr_003_7143

    jp nc, $d1b0

    nop
    jp nc, $d1b0

    nop
    ret nz

    nop
    ld bc, $96d2
    xor b
    ld [hl], a
    scf

jr_003_7113:
    or $00
    jr nz, @+$62

    jr nz, jr_003_7119

jr_003_7119:
    nop
    ld h, b
    jr nz, jr_003_7113

    db $fd
    rlca
    ld h, b
    ld h, b
    ld h, b
    ld h, b
    db $10
    ldh a, [$ff0b]
    ld h, b
    pop af
    di
    ld [bc], a
    ldh a, [rTAC]
    push af

jr_003_712d:
    inc d
    ld [hl], c
    pop af
    nop

Jump_003_7131:
    jr nz, jr_003_7193

    jr nz, jr_003_7135

jr_003_7135:
    ld h, b
    ld h, b
    ld h, b
    ldh a, [$ff03]
    push af
    inc d
    ld [hl], c

jr_003_713d:
    pop af
    nop

jr_003_713f:
    jr nz, jr_003_71a1

Jump_003_7141:
    jr nz, jr_003_7143

jr_003_7143:
    ld h, b
    ld h, b
    nop
    ldh a, [$ff03]
    push af
    inc d
    ld [hl], c
    pop af
    ldh a, [$ff08]
    ld h, b

jr_003_714f:
    pop af
    db $f4
    ldh a, [$ff08]
    push af
    inc d
    ld [hl], c
    pop af
    ldh a, [$ff08]
    ld h, b
    pop af
    nop
    jr nz, jr_003_71be

    ld h, b
    jr nz, jr_003_71c1

    ld h, b
    nop
    ldh a, [rIF]
    push af
    inc d
    ld [hl], c
    pop af
    nop
    ld h, b
    ld h, b
    nop
    ld h, b
    ld h, b
    ld h, b
    ld h, b

Call_003_7171:
Jump_003_7171:
    ldh a, [c]
    jr z, @+$73

    db $fd
    rlca
    ld a, [$fb78]
    ld de, $0714
    ld [hl-], a
    add sp, $14
    ld sp, hl
    ld c, $56
    db $d3
    inc bc
    jp nc, $c101

    db $d3
    ld [hl], c
    jp nc, $c101

    ld bc, $c101
    ld bc, $0103
    inc bc

jr_003_7193:
    db $d3
    inc bc
    jp nc, $c101

    db $d3
    ld [hl], c
    jp nc, $c101

    ld bc, $03c1
    add hl, bc

jr_003_71a1:
    db $d3
    inc bc
    jp nc, $c101

    db $d3
    ld [hl], c
    jp nc, $c101

    ld bc, $c101
    ld bc, $0103
    inc bc
    daa
    pop bc
    db $d3
    ld [hl], c
    or c
    jp nc, $c129

    db $d3
    or c
    or c
    pop bc

jr_003_71be:
    ld a, [$f938]

Jump_003_71c1:
jr_003_71c1:
    ld c, $54
    push de
    sub e
    jp nc, $c141

    db $d3
    ld b, c
    jp nc, $c141

    db $d3
    ld [hl], c
    jp nc, $c141

    ld b, c
    inc hl
    ld b, c
    inc hl
    push de
    sub e
    jp nc, $c141

    db $d3
    ld b, c
    jp nc, $c141

    ld l, a
    pop bc
    push de
    sub e
    jp nc, $c141

    db $d3
    ld b, c
    jp nc, $c141

    db $d3
    ld [hl], c
    jp nc, $c141

    ld b, c
    inc hl
    ld b, c
    inc hl
    ld h, a
    pop bc
    ld [hl], c
    or c
    pop de
    add hl, hl
    pop bc
    db $d3
    add c
    add c
    call nc, $f241
    ret nz

    ld [hl], c
    db $fd
    rlca
    ld a, [$fb79]
    ld de, $0714
    ld [hl-], a
    add sp, $14
    ld sp, hl
    ld c, $54
    db $d3
    ld b, e
    jp nc, $c141

    ld bc, $c141
    ld b, c
    ld b, c
    pop bc
    ld b, c
    inc hl
    ld b, c
    inc hl
    db $d3
    ld b, e
    jp nc, $c141

    ld bc, $c141
    ld hl, $23c1
    add hl, hl
    db $d3
    ld b, e
    jp nc, $c141

Jump_003_7232:
    ld bc, $c141
    ld b, c
    ld b, c
    pop bc
    ld b, c
    inc hl
    ld b, c
    inc hl
    ld h, a
    pop bc
    db $d3
    or c
    jp nc, $6921

    pop bc
    ld h, c
    ld h, c
    pop bc
    ld sp, hl
    ld c, $52
    pop de
    pop bc
    inc bc
    ld bc, $0171
    ld bc, $9dd2
    or e
    pop de
    inc bc
    ld b, e
    pop bc
    ld [hl], c
    pop bc
    ld c, a
    jp $0103


    ld [hl], c
    ld bc, $d201
    sbc l
    pop de
    ld bc, $b3d2
    or c
    pop de
    inc hl
    pop bc
    ld l, l
    pop bc
    ld h, c
    ld h, c
    pop bc
    ldh a, [c]
    ld c, e
    ld [hl], d
    db $fd
    rlca
    ld a, [$fb03]
    nop
    nop
    inc bc
    ld de, $06e7
    call nc, $d393
    ld [hl], c
    pop bc
    ld b, c
    ld [hl], c
    pop bc
    ld [hl], c
    ld h, c
    pop bc
    ld h, c
    ld h, e
    ld h, c
    ld h, e
    call nc, $d393

Call_003_7290:
    ld [hl], c
    pop bc
    ld b, c
    ld [hl], c
    pop bc
    ld h, c
    pop bc
    ld h, e
    ld l, c
    call nc, $d393
    ld [hl], c
    pop bc
    ld b, c
    ld [hl], c
    pop bc
    ld [hl], c
    ld h, c
    pop bc
    ld h, c
    ld h, e
    ld h, c
    ld h, e
    call nc, $d37f
    pop bc
    ld [hl], c
    pop bc
    ld [hl], c
    pop bc
    ld b, c
    ld b, c
    call nc, $9581
    db $d3
    ld b, c
    ld b, l
    call nc, $d391
    dec h
    call nc, $9591
    db $d3
    ld hl, $95d4
    db $d3
    ld b, c
    ld b, l
    inc hl
    ld bc, $93d4
    ld hl, $23d3
    call nc, $9521
    db $d3
    ld b, c
    ld b, l
    call nc, $d391
    dec h
    call nc, $9591
    db $d3
    ld hl, $75d4
    db $d3
    ld hl, $d425
    ld [hl], c
    db $d3
    ld [hl], l
    ld hl, $4121
    ld b, c
    ldh a, [c]
    or d
    ld [hl], d
    db $fd
    rlca
    ldh a, [rTMA]
    inc bc
    ld hl, $f101
    inc bc
    ld hl, $2143
    ld h, c
    ld h, c
    ldh a, [rTMA]
    inc bc
    ld hl, $f101
    ld bc, $1161
    ld h, c
    ld bc, $6161
    jr nz, @+$22

    ldh a, [rTAC]
    ld bc, $5121
    ld bc, $2101

jr_003_7311:
    ld d, c
    ld hl, $01f1
    ld b, c
    ld de, $1141

jr_003_7319:
    ld bc, $9001
    sub b

jr_003_731d:
    ldh a, [c]
    add hl, bc
    ld [hl], e
    db $fd

Jump_003_7321:
    rlca
    ld a, [$e878]
    inc d
    ei

jr_003_7327:
    ld de, $0315
    ld hl, $40d2
    sub b
    pop de
    jr nz, @+$12

    jp nc, Jump_003_40c0

    pop de
    db $10
    jp nc, $d190

    ret nz

    db $10
    jp nc, $d190

    db $10
    jp nc, Jump_003_40c0

    sub b
    pop de
    db $10
    jr nz, jr_003_7319

    or b
    pop de
    jr nz, jr_003_731d

    or b
    ret nz

    or b
    ld [hl], b
    jr nz, jr_003_7311

    or b
    pop de
    jr nz, jr_003_7327

    or b
    ld [hl], b
    or b
    ld [hl], b
    jr nz, jr_003_739b

    sub b
    pop de
    jr nz, @+$12

    ret nz

    jp nc, $d140

    db $10
    jp nc, $c090

    pop de
    db $10
    jp nc, $d190

    db $10
    jp nc, $4090

    sub b
    pop de
    db $10
    ld b, b
    jp nc, Jump_003_70b0

    pop de
    ld b, b
    ret nz

    jp nc, $d1b0

    ld b, b
    jp nc, $c0b0

    ld [hl], b
    ld b, b
    ld [hl], b
    ret nz

    or b
    pop de
    ld b, b
    jp nc, $f2b0

    dec hl
    ld [hl], e
    db $fd
    rlca
    ld a, [$fb7a]
    ld de, $0515
    ld [hl+], a
    add sp, $14
    ld sp, hl
    ld c, $52

jr_003_739b:
    ret nc

    ld [hl+], a
    db $10
    pop bc
    ld [hl+], a
    ret nz

    db $10
    ret nz

    ld [de], a
    pop de
    cp a
    ret nz

    ret nc

    ld [hl+], a
    db $10
    pop bc
    ld [hl+], a
    ret nz

    db $10
    ret nz

    ld [de], a
    ld b, [hl]
    jr nz, @+$12

Call_003_73b3:
    pop de
    or a
    ldh a, [c]
    sbc e
    ld [hl], e
    db $fd
    rlca
    ld a, [$e703]
    ld b, $fb
    nop
    nop
    inc bc
    ld de, $e4f5
    ld [hl], e
    call nc, Call_000_02f0
    sub c
    sub b
    sub c
    sub b
    ld [hl], b
    sub b
    pop af
    push af
    db $e4
    ld [hl], e
    call nc, Call_003_7071
    ld [hl], c
    ld [hl], b
    sub b
    ld [hl], b
    ld [hl], c
    ld [hl], b
    ld [hl], b
    db $d3
    ld b, b
    ld b, c
    jr nz, @-$0c

    jp $d473


    sub c
    sub b
    sub c
    sub b

jr_003_73e9:
    ld [hl], b
    sub b
    sub c
    sub b
    sub b
    db $d3
    ld b, b
    ld b, c
    jr nz, jr_003_73e9

    db $fd
    rlca
    ldh a, [rTAC]
    ld bc, $2020
    ld h, c
    jr nz, jr_003_73fe

    nop

jr_003_73fe:
    ld bc, $2061
    nop
    pop af
    ld bc, $2020
    ld h, c
    jr nz, jr_003_7409

jr_003_7409:
    ld h, b
    ld h, c
    nop
    ld h, b
    ld h, b
    ld h, b
    ld h, b
    ldh a, [c]
    push af
    ld [hl], e
    db $fd
    rlca
    ld a, [$fb79]
    ld de, $0415
    ld sp, $13e8
    jp nc, $a0a0

    ret nz

    sub b
    ret nz

    ld [hl], b
    ld [hl], c
    ld d, l
    ret nz

    ld d, b
    ret nz

    nop
    and b
    ld d, b
    sub b
    pop de
    nop
    jp nc, $9850

    ret nz

    rst $38
    db $fd
    rlca
    ld a, [$fbba]
    ld de, $0415
    ld sp, $14e8
    pop de
    and b
    and b
    ret nz

    sub b
    ret nz

    ld [hl], b
    ld [hl], c
    ld a, [$a07a]
    ret nz

    and b
    ret nz

    sub b
    ld d, b
    nop
    and c
    ret nc

    nop
    pop de
    and b
    ld d, b
    sub b
    ret nc

    nop
    pop de
    sub b
    ret nc

    nop
    ret nz

    ld a, [$d2ba]
    sub b
    and b
    pop de
    nop
    ret nz

    jp nc, $c050

    ld d, b
    ret nz

    rst $38
    db $fd
    rlca
    ld a, [$e703]
    ld b, $fb
    nop
    nop
    inc bc
    ld de, $07d3
    and b
    ret nz

    and b
    ret nz

    sub b
    ld d, b
    nop
    and b
    dec b
    call nc, $d370
    ld [$ffc0], sp
    db $fd
    rlca
    ld h, b
    ld h, b
    db $10
    ld h, b
    nop
    ld h, b
    ld h, c
    ld bc, $2020
    ld h, c
    jr nz, jr_003_74b8

    nop
    ld h, c
    nop
    ld h, c
    ld h, b
    ld h, b
    nop
    ld h, b
    ld h, b
    ld h, c
    ld h, c
    ld h, c
    rst $38
    db $fd
    dec b
    ld a, [$fb79]
    ld de, $0515
    ld [hl+], a
    add sp, $13
    ld sp, hl
    dec b
    ld b, e
    jp nc, $c1a3

    pop de
    ld h, c

jr_003_74b8:
    ld de, $5361
    pop bc
    ret nc

    inc hl
    pop bc
    rst $38
    db $fd
    dec b
    ld a, [$fbba]
    ld de, $0515
    ld [hl+], a
    add sp, $13
    ld sp, hl
    dec b
    ld b, d
    pop de
    and c
    ld [hl], c
    and c
    ret nc

    ld de, $01c1
    pop de
    and e
    pop bc
    ret nc

    and e
    pop bc
    rst $38
    db $fd
    dec b
    ld a, [$e703]
    ld b, $fb
    nop
    nop
    inc bc
    ld de, $a3d4
    pop bc
    ld h, e
    pop bc
    and e
    pop bc
    and e
    pop bc
    rst $38
    db $fd
    dec b
    ld bc, $1121
    ld h, c
    ld h, c
    jr nz, jr_003_751b

    ld bc, $2121
    ld h, b
    ld d, b
    jr nz, jr_003_7512

    rst $38
    db $fd
    ld [$39fa], sp
    ei
    ld de, $0514
    ld [hl+], a
    add sp, $04
    db $d3
    sub b
    ret nz

    sub b

jr_003_7512:
    add sp, $17
    jp nc, Jump_003_4202

    ld d, d
    sub b
    ret nz

    nop

jr_003_751b:
    ld sp, hl
    db $10
    ld b, h
    adc b
    rst $38
    db $fd
    ld [$79fa], sp
    ei
    ld de, $0514
    ld [hl+], a
    add sp, $04
    jp nc, $c000

    nop
    add sp, $17
    ld d, d
    ld [hl], d
    sub d
    pop de
    nop
    ret nz

    jp nc, $f950

    db $10
    ld b, h
    pop de
    ld e, b
    rst $38
    db $fd
    ld [$03fa], sp
    rst $20
    ld b, $fb
    nop
    nop
    inc bc
    ld de, $52d3
    ld b, d
    ld [hl+], a
    ld [bc], a
    call nc, $d392
    jr @+$01

    db $fd
    inc b
    ldh a, [rSC]
    ld bc, $2020
    ld bc, $2161
    ld bc, $01f1
    jr nz, jr_003_7583

    ld bc, $f062
    inc c
    db $10
    pop af
    rst $38
    db $fd
    ld [$78fa], sp
    ei
    ld de, $0514
    ld [hl+], a
    add sp, $17
    ld sp, hl
    ld b, $42
    pop de
    ld [de], a
    jp nc, $d1b0

    db $10
    jp nc, $82b0

    ld [hl], b
    ld h, b

jr_003_7583:
    ld d, b
    ld b, b
    ld b, b
    ld b, b
    ld b, b
    ret nz

    db $10
    ld b, b
    pop bc
    ret nc

    ld [hl-], a
    rst $38
    db $fd
    ld [$39fa], sp
    ei
    ld de, $0514
    ld [hl+], a
    add sp, $17
    ld sp, hl
    ld b, $42
    ret nc

    ld [de], a
    pop de
    or b
    ret nc

    db $10
    pop de
    or b
    add d
    ld [hl], b
    ld h, b
    ld d, b
    ld b, b
    ld b, b
    ld b, b
    ld b, b
    ret nz

    db $10
    ld b, b
    pop bc
    ret nc

    ld b, d
    rst $38
    db $fd
    ld [$03fa], sp
    rst $20
    ld b, $fb
    nop
    nop
    inc bc
    ld de, $f0d3
    ld [bc], a
    ld b, b
    ret nz

    ld b, b
    ld b, b
    call nc, $d3b0
    db $10
    pop af
    ld b, b
    ld b, b
    ld b, b
    ld b, b
    ret nz

    db $10
    ld b, c
    ret nz

    pop de

jr_003_75d4:
    ld b, d
    rst $38
    db $fd
    ld [$2000], sp
    nop
    ld h, b
    jr nz, jr_003_75de

jr_003_75de:
    nop
    jr nz, jr_003_75e1

jr_003_75e1:
    ld h, b
    jr nz, jr_003_7604

    ld h, b
    ld h, b
    ld h, b
    ld h, b
    jr nz, jr_003_764a

    ld h, c
    ret nz

    ld h, c
    ret nz

    rst $38
    db $fd
    ld [$11fb], sp
    inc d
    dec b
    ld [hl+], a
    ld sp, hl

jr_003_75f7:
    inc c
    ld b, e
    add sp, $07
    ld a, [$d278]
    ldh a, [rSC]
    nop
    ret nz

    pop de
    nop

jr_003_7604:
    add sp, $16
    jp nc, $c040

    halt
    nop
    ret nz

    pop de
    nop
    jp nc, $c040

    sub [hl]
    jr nz, jr_003_75d4

    pop de
    jr nz, @-$2c

    ld d, b
    ret nz

    sub e
    ld d, d
    jr nz, @-$3e

    pop de
    jr nz, jr_003_75e1

    jp nc, $4052

    ld [hl+], a
    pop af
    pop bc
    ld d, b
    pop bc
    nop
    db $d3
    or d
    jp nc, $d302

    or c
    jp nc, $c100

    ld h, $c1
    jr nc, jr_003_75f7

    nop
    db $d3
    or d
    jp nc, $a202

    jp nz, $c2a2

    pop de
    dec hl
    ret nz

    jp nc, $34fa

    ld d, b
    ld d, b
    ld a, [$5035]

jr_003_764a:
    ld d, b
    ld d, b
    ld a, [$5036]
    ld d, b
    ld d, b
    ld a, [$5037]
    ld d, b
    ld d, b
    ldh a, [c]
    ei
    ld [hl], l
    db $fd
    ld [$11fb], sp
    inc d
    dec b
    ld [hl+], a
    add sp, $07
    ld sp, hl
    inc c
    ld b, e
    ld a, [$d2b9]
    ld [hl], b
    ret nz

    sub b
    add sp, $17
    pop de
    nop
    ret nz

    ld b, [hl]
    jp nc, $c060

    sub b
    pop de
    nop
    ret nz

    ld b, [hl]
    ld d, d
    pop bc
    ld d, e
    jp nc, $b192

    sub b
    pop bc
    halt
    ld [hl], b
    ret nz

    sub b
    pop de
    nop
    ret nz

Jump_003_7688:
    ld b, [hl]
    jp nc, $c060

    sub b
    pop de
    nop
    ret nz

    ld b, [hl]
    ld d, d
    pop bc
    ld d, e
    jp nc, $b192

    sub b
    pop bc
    halt
    pop bc
    pop de
    nop
    pop bc
    nop
    jp nc, $c0b1

    pop de
    ld bc, $d2c0
    or c
    pop de
    nop
    pop bc
    ld h, $c1
    nop
    pop bc
    nop
    jp nc, $c0b1

    pop de
    ld bc, $22c0
    jp nz, $c242

    ld e, e
    ret nz

    jp nc, $74fa

    or b
    or b
    ld a, [$b075]
    or b
    or b
    ld a, [$b076]
    or b
    or b
    ld a, [$b077]
    or b
    or b
    ldh a, [c]
    ld h, l
    halt
    db $fd
    ld [$03fa], sp
    rst $20
    ld b, $fb
    nop
    nop
    inc bc
    ld de, $02f3
    db $d3
    ldh a, [rDIV]
    ld bc, $f1c0
    call nc, Call_000_04f0
    ld h, c
    ret nz

    pop af
    db $d3
    ldh a, [rDIV]
    ld hl, $f1c0
    call nc, Call_000_04f0
    ld [hl], c
    ret nz

    pop af
    db $f4
    ld d, d
    push bc
    ld d, d
    ld [hl], d
    push bc
    ld [hl], d
    add d
    push bc
    add d
    and l
    and l
    and d
    and d
    and d
    and d
    ret nz

    ldh a, [$ff0b]
    ld [hl], b
    pop af
    ldh a, [c]
    db $dd
    halt
    db $fd

jr_003_7710:
    ld [$02f3], sp
    ldh a, [$ff03]
    ld bc, $6120
    jr nz, jr_003_771a

jr_003_771a:
    jr nz, jr_003_773c

    ld h, c
    jr nz, jr_003_7710

    ld bc, $0120
    ld h, c
    ld h, b
    ld h, b

jr_003_7725:
    nop
    jr nz, jr_003_7788

    db $f4
    di
    inc bc

jr_003_772b:
    ld [bc], a
    ldh a, [$ff03]
    jr nz, jr_003_7740

    db $10
    pop af

jr_003_7732:
    db $f4
    ld bc, $f010
    inc bc
    jr nz, jr_003_7749

    db $10
    pop af
    ld [bc], a

jr_003_773c:
    ld h, c
    nop
    nop
    ld h, c

jr_003_7740:
    ld h, c

jr_003_7741:
    ld h, b
    ld bc, $1000
    db $10

jr_003_7746:
    db $10
    jr nz, jr_003_7769

jr_003_7749:
    jr nz, jr_003_779b

    ld h, b
    ld h, b
    ldh a, [c]
    ld de, $fd77
    rlca
    ld a, [$fb37]
    ld de, $0314
    ld [de], a
    add sp, $06
    ldh a, [$ff03]
    jp nc, $c070

    add sp, $14
    pop de
    jr nz, jr_003_7725

jr_003_7765:
    ld [hl], b
    ret nz

    ld [hl], b
    pop de

jr_003_7769:
    jr nz, jr_003_772b

    ld [hl], b

jr_003_776c:
    ret nz

    jp nc, $d170

    jr nz, jr_003_7732

    ld [hl], b

jr_003_7773:
    ret nz

    pop af
    jp nc, $fab3

    dec [hl]
    db $d3
    jr nz, jr_003_779c

    ret nz

    jr nz, @+$22

    jr nz, jr_003_7741

    jr nz, jr_003_77a3

Call_003_7783:
    ret nz

    jr nz, jr_003_7746

    push af
    ld a, [hl]

jr_003_7788:
    ld a, d
    jp nc, Jump_003_7070

    ret nz

    pop de
    jr nz, @+$75

    pop bc
    ld a, [$d335]
    jr nz, @-$3e

    jr nz, @+$22

    jr nz, @-$3e

    push af

jr_003_779b:
    ld a, [hl]

jr_003_779c:
    ld a, d
    jp nc, $c070

    or b
    ret nz

    pop de

jr_003_77a3:
    jr nz, jr_003_7765

    jp nc, $b070

    ret nz

    pop de
    jr nz, jr_003_776c

    jp nc, $b070

    ret nz

    pop de
    jr nz, jr_003_7773

    ld a, [$d235]
    push af
    ld d, $7b

jr_003_77b9:
    ldh a, [rDIV]
    and b
    and b
    ret nz

    and b
    and b

jr_003_77c0:
    ret nz

    and b
    and b
    ret nz

    and b
    and b
    ret nz

jr_003_77c7:
    and b
    ret nz

    and b
    ret nz

    pop af
    push af
    ld d, $7b
    ldh a, [rDIV]
    ld a, l
    ld [hl], b
    ld [hl], b
    pop af
    ldh a, [rDIV]
    adc l
    add b
    add b
    pop af
    ld a, [$d237]
    ld d, b
    ret nz

    add b
    ret nz

    pop de
    db $10
    ret nz

    jp nc, $8050

    ret nz

    pop de
    db $10
    ret nz

    jp nc, $8050

    ret nz

    pop de
    db $10
    ret nz

    jp nc, $c0b0

    pop de
    jr nc, jr_003_77b9

    add b
    ret nz

    jp nc, $d1b0

    jr nc, jr_003_77c0

    add b
    ret nz

    jp nc, $d180

    jr nc, jr_003_77c7

    add b
    ret nz

    jp nc, $c050

    and b
    ret nz

    pop de
    db $10
    ret nz

    jp nc, $a050

    ret nz

    pop de
    db $10
    ret nz

    jp nc, $a050

    ret nz

    pop de
    db $10
    ret nz

    jp nc, $c060

    sub b
    ret nz

    pop de
    db $10
    ret nz

    jp nc, $9060

    ret nz

    pop de
    db $10
    ret nz

    jp nc, $9060

    ret nz

    pop de
    db $10
    ret nz

    jp nc, $303d

    jr nc, jr_003_77c7

    add b
    add b
    pop de
    dec c
    nop
    nop
    ret nz

    jp nc, Jump_000_1202

    ld [hl+], a
    dec [hl]
    ldh a, [c]
    add [hl]
    ld [hl], a
    db $fd
    rlca
    ld a, [$fb79]
    ld de, $0414
    inc de
    add sp, $14
    ld sp, hl
    ld c, $43
    jp nc, $9092

    pop bc
    sbc c
    or d
    or b
    pop bc
    cp c
    pop de
    ld [bc], a
    nop
    pop bc
    add hl, bc
    inc hl
    ld a, [$d336]
    ld [hl], b
    ld [hl], b
    ret nz

    ld [hl], b
    ld [hl], b
    ld [hl], b
    ret nz

    ld [hl], b
    ld [hl], b
    ret nz

    ld [hl], b
    ret nz

    ld a, [$d179]
    rlca
    pop bc
    jp nc, $c0b0

    sub b
    or d
    ld [hl], a
    pop bc
    ld b, b
    ret nz

    ld d, b
    ld [hl], d
    ld [hl], h
    ret nz

    dec b
    pop bc
    ld [hl], c
    ld d, e
    ld b, c
    ld bc, $25c1
    rlca
    pop bc
    inc hl
    ld b, c
    dec c
    jr nz, @+$42

    ld d, a
    pop bc
    ld [hl], e
    sub c
    pop de
    nop
    jp nc, $c0b0

    sub b
    ld [hl], e
    db $d3
    pop bc
    ld a, [$7036]
    ret nz

    ld [hl], b
    ld [hl], b
    ld [hl], b
    ret nz

    ld a, [$d179]
    rlca
    pop bc
    jp nc, $c0b0

    pop de
    nop
    ld [hl+], a
    jp nc, $c173

    pop de
    ld b, e
    inc hl
    ld bc, $9bd2
    pop bc
    pop de
    ld bc, $0123
    jp nc, $c1b1

    pop de
    inc bc
    ld hl, $c157
    ld b, b
    ret nz

    nop
    jp nc, $d192

    inc hl
    ld b, c
    jp nc, $c191

    pop de
    dec b
    jp nc, $c183

    pop de
    inc bc
    ld d, b
    ret nz

    ld b, b
    ld d, d
    ld d, e
    pop bc
    ld [hl], a
    pop bc
    push af
    ldh a, [c]
    ld a, c
    ld b, a
    pop bc
    ld d, c
    pop bc
    jp nc, $c39f

    pop de
    sbc e
    ld [hl], b
    ld d, b
    ld b, a
    ld b, d
    ld [hl+], a
    ld bc, $f2f5
    ld a, c
    rrca
    jp nc, $d1bf

    rrca
    cpl
    rra
    rrca
    rra
    add hl, sp
    pop bc
    db $fc
    db $fd
    inc b
    ld a, [$d276]
    jr nc, jr_003_795e

    ld h, b
    add b
    and b
    pop de
    nop
    db $10
    db $fd
    rlca
    db $ec
    ld a, [$3779]
    pop bc
    ld d, c
    pop bc
    jp nc, $c189

    ld d, b
    ret nz

    add b
    pop de
    ld [de], a
    scf
    pop bc
    ld d, c
    pop bc
    ld l, a
    pop bc
    jp nc, $d18f

    rrca
    ccf
    ret nz

    jp nc, $9282

    and d
    or l
    ldh a, [c]
    ld [hl], a
    ld a, b
    db $fd
    rlca
    ld a, [$e703]
    ld b, $fb
    nop
    nop
    inc bc
    ld de, $f0d4
    inc bc
    ld [hl], d
    ld [hl], b
    pop bc
    ld a, c
    pop af
    ld [hl], e
    set 6, l
    add hl, bc
    ld a, d
    push af
    inc a
    ld a, d
    push af
    ld c, l
    ld a, d
    push af
    inc a
    ld a, d
    push af
    add hl, bc
    ld a, d
    push af

jr_003_795e:
    inc a
    ld a, d
    push af
    ld c, l
    ld a, d
    push af
    inc a

Jump_003_7965:
    ld a, d
    ldh a, [rSC]
    ld d, e
    ret


    ld d, c
    ld d, e
    ret


    ld d, b
    ld d, b
    pop af
    ldh a, [rSC]
    and e
    ret


    and c
    and e
    ret


    and b
    and b
    pop af
    ldh a, [rSC]
    ld d, e
    ret


    ld d, c
    ld d, e
    ret


    ld d, b
    ld d, b
    pop af
    ldh a, [rDIV]
    push af
    inc a
    ld a, d
    pop af
    ldh a, [rDIV]
    add b
    add b
    ret nz

    add b
    add b
    ret nz

    add b
    add b
    ret nz

    add b
    add b
    ret nz

    add b
    ret nz

    add b
    ret nz

    pop af
    db $d3
    db $10
    db $10
    ret nz

    db $10
    db $10
    ret nz

    db $10
    db $10
    ret nz

    db $10
    db $10
    ret nz

    db $10
    ret nz

    db $10
    ret nz

    call nc, $b0b0
    ret nz

    or b
    or b
    ret nz

    or b
    or b
    ret nz

    or b
    or b
    ret nz

    or b
    ret nz

    or b
    ret nz

    and b
    and b
    ret nz

    and b
    and b
    ret nz

    and b
    and b
    ret nz

    and b
    and b
    ret nz

    and b
    ret nz

    and b
    ret nz

    sub b
    sub b
    ret nz

    sub b
    sub b
    ret nz

    sub b
    sub b
    ret nz

    sub b
    sub b
    ret nz

    sub b
    ret nz

    sub b
    ret nz

    add a
    push bc
    add b
    add b
    add a
    push bc
    add c
    add a
    push bc
    add b
    add b
    ret nz

    add d
    sub d
    and d
    or l
    ldh a, [c]
    ld c, [hl]
    ld a, c
    jp nc, $90bd

    or b
    pop de
    rrca
    jp nc, $b2b2

    or c
    or d
    sub d
    or c
    pop de
    ld [bc], a
    jp nc, $d1b2

    ld bc, $0222
    ld hl, $d3f6
    nop
    nop
    ret nz

    nop
    nop
    ret nz

    nop
    nop
    ret nz

    nop
    nop
    ret nz

    nop
    ret nz

    nop
    ret nz

    call nc, Call_003_4040
    ret nz

    ld b, b
    ld b, b
    ret nz

    ld b, b
    ld b, b
    ret nz

    ld b, b
    ld b, b
    ret nz

    ld b, b
    ret nz

    ld b, b
    ret nz

    ld d, b
    ld d, b
    ret nz

    ld d, b
    ld d, b
    ret nz

    ld d, b
    ld d, b
    ret nz

    ld d, b
    ld d, b
    ret nz

    ld d, b
    ret nz

    ld d, b
    ret nz

    or $70
    ld [hl], b
    ret nz

    ld [hl], b
    ld [hl], b
    ret nz

    ld [hl], b
    ld [hl], b
    ret nz

    ld [hl], b
    ld [hl], b
    ret nz

    ld [hl], b
    ret nz

    ld [hl], b
    ret nz

    or $a0
    and b
    ret nz

    and b
    and b
    ret nz

    and b
    and b
    ret nz

    and b
    and b
    ret nz

    and b
    ret nz

    and b
    ret nz

    sub b
    sub b
    ret nz

    sub b
    sub b
    ret nz

    sub b
    sub b
    ret nz

    sub b
    sub b
    ret nz

    sub b
    ret nz

    sub b
    ret nz

    add b
    add b
    ret nz

    add b
    add b
    ret nz

    add b
    add b
    ret nz

    add b
    add b
    ret nz

    add b
    ret nz

    add b
    ret nz

    or $fa
    scf
    jp nc, $c000

    ld b, b

jr_003_7a84:
    ret nz

    ld [hl], b
    ret nz

    nop
    ld b, b
    ret nz

    ld [hl], b

jr_003_7a8b:
    ret nz

    ld b, b
    ld [hl], b
    ret nz

    pop de
    nop
    ret nz

jr_003_7a92:
    jp nc, $c040

    or b
    ret nz

    pop de
    ld b, b
    ret nz

    jp nc, $b040

    ret nz

    pop de
    ld b, b
    ret nz

    jp nc, $b040

    ret nz

    pop de
    ld b, b
    ret nz

    jp nc, $c050

    pop de
    nop
    ret nz

    ld d, b
    ret nz

    jp nc, $d150

    nop
    ret nz

    ld d, b
    ret nz

    jp nc, $d190

    nop
    ret nz

    ld d, b
    ret nz

    jp nc, $c0b0

    pop de
    jr nz, jr_003_7a84

    ld [hl], b
    ret nz

    jp nc, $d1b0

    jr nz, jr_003_7a8b

    ld [hl], b
    ret nz

    jp nc, $d1b0

    jr nz, jr_003_7a92

    ld [hl], b
    ret nz

    jp nc, $c050

    and b
    ret nz

    pop de
    ld d, b
    ret nz

    jp nc, $a050

    ret nz

    pop de
    ld d, b
    ret nz

    jp nc, $a050

    ret nz

    pop de
    ld d, b
    ret nz

    jp nc, $c040

    sub b
    ret nz

    pop de
    ld b, b
    ret nz

    jp nc, $9040

    ret nz

    pop de
    ld b, b
    ret nz

    jp nc, $9040

    ret nz

    pop de
    ld b, b
    ret nz

    jp nc, $c080

    pop de
    nop
    ret nz

    ld d, b
    ret nz

    jp nc, $d180

    nop
    ret nz

    ld d, b
    ret nz

    nop
    ld d, b
    ret nz

    ret nc

    nop
    ret nz

    or $f0
    inc b
    ld d, b
    ld d, b
    ret nz

    ld d, b
    ld d, b
    ret nz

    ld d, b
    ld d, b
    ret nz

    ld d, b
    ld d, b
    ret nz

    ld d, b
    ret nz

    ld d, b
    ret nz

    pop af
    or $fd
    rlca
    ldh a, [$ff03]
    ld bc, $0120
    jr nz, @+$03

    jr nz, jr_003_7b55

    ld bc, $6060
    db $10
    db $10
    pop af
    inc bc
    ld h, b
    ld h, c
    ld h, b
    ld h, b
    ld h, c
    ld h, b
    ld h, c
    ld h, c
    di
    ld [bc], a
    ldh a, [rTAC]
    ld bc, $2020
    ld h, c
    jr nz, jr_003_7b4f

    nop

jr_003_7b4f:
    jr nz, jr_003_7b71

    ld h, c
    jr nz, jr_003_7b74

    pop af

jr_003_7b55:
    ld bc, $2020
    ld h, c
    jr nz, jr_003_7b5c

    nop

jr_003_7b5c:
    jr nz, jr_003_7b7e

    ld h, b
    ld h, b
    ld h, c
    db $f4
    ldh a, [$ff0c]
    inc bc
    ld b, c
    jr nz, jr_003_7b88

    ld b, c
    jr nz, @+$22

    jr nz, @+$22

    ld bc, $f0f1
    rlca

jr_003_7b71:
    ld bc, $2020

jr_003_7b74:
    ld h, c
    jr nz, jr_003_7b78

    nop

jr_003_7b78:
    jr nz, @+$22

    ld h, c
    jr nz, @+$12

    pop af

jr_003_7b7e:
    nop
    ld h, c
    ld h, b
    ld h, b
    ld h, c
    ld h, b
    ld h, b
    ld h, c
    ld h, b
    ld h, b

jr_003_7b88:
    ld h, b
    ld h, c
    ldh a, [$ff03]
    ld bc, $2020
    ld h, c
    jr nz, jr_003_7b93

    nop

jr_003_7b93:
    ld b, c
    ld h, c
    jr nz, jr_003_7ba7

    pop af
    ld bc, $2020
    ld h, c
    jr nz, jr_003_7b9f

    nop

jr_003_7b9f:
    ld b, c
    ld h, b
    ld h, b
    ld h, b
    ld h, b
    ldh a, [$ff03]
    inc bc

jr_003_7ba7:
    ld b, c
    jr nz, jr_003_7bca

    ld b, c
    jr nz, jr_003_7bcd

    ld b, c
    nop
    nop
    pop af
    db $10
    ld [bc], a
    ld [bc], a
    ld [bc], a
    ld h, c
    ld h, c
    ld h, b
    ld h, b
    ldh a, [c]
    ld b, h
    ld a, e
    ldh a, [$ff7b]
    or $7b
    ld a, [$fe7b]
    ld a, e
    ld [bc], a
    ld a, h
    ld b, $7c
    ld a, [bc]
    ld a, h

jr_003_7bca:
    ld c, $7c
    ld [de], a

jr_003_7bcd:
    ld a, h
    ld d, $7c
    ld a, [de]
    ld a, h
    ld e, $7c
    ld [hl+], a
    ld a, h
    ld h, $7c
    ld a, [hl+]

jr_003_7bd9:
    ld a, h
    ld l, $7c
    ld [hl-], a
    ld a, h
    ld [hl], $7c
    ld a, [hl-]
    ld a, h

jr_003_7be2:
    ld a, $7c
    ld b, d
    ld a, h
    ld b, [hl]
    ld a, h
    ld c, d
    ld a, h
    ld c, [hl]
    ld a, h
    ld d, d
    ld a, h
    ld d, [hl]
    ld a, h
    jr jr_003_7be2

    ld e, d
    ld a, h
    ld e, d
    ld a, h
    ld [$5be0], sp
    ld a, h
    ld [$7210], sp
    ld a, h
    ld [$8120], sp
    ld a, h
    ld [$a210], sp
    ld a, h

jr_003_7c06:
    ld [$bb10], sp
    ld a, h
    db $10
    jr c, jr_003_7bd9

    ld a, h
    ld [$dd40], sp
    ld a, h
    ld [$ee40], sp
    ld a, h
    ld [$0360], sp
    ld a, l
    ld [$2c50], sp
    ld a, l
    ld [$4d50], sp
    ld a, l
    ld [$6c50], sp
    ld a, l
    ld [$8350], sp
    ld a, l
    ld [$bc90], sp
    ld a, l
    db $10
    jr nc, jr_003_7c06

jr_003_7c31:
    ld a, l
    db $10
    inc a
    db $f4
    ld a, l
    db $10
    ld [hl], b
    ld de, $107e
    ld [hl], b
    ld hl, $087e
    ld d, b
    ld a, [hl-]
    ld a, [hl]
    ld [$5980], sp
    ld a, [hl]
    ld [$b030], sp
    ld a, [hl]
    ld [$cb30], sp
    ld a, [hl]
    db $10
    jr nc, jr_003_7c31

    ld a, [hl]
    ld [$f93c], sp
    ld a, [hl]
    ld [$223c], sp
    ld a, a
    rst $38
    cp $02
    pop hl
    inc b
    db $e3
    or b
    rst $10
    ld h, a
    rst $10
    ld a, e
    rst $10
    adc d
    rst $10
    adc a
    rst $10
    sbc h
    rla
    adc d
    rla
    adc a
    rla
    sbc h
    rst $38
    cp $02
    pop hl
    inc bc
    db $e3
    or b
    sub $f4
    sub $9c
    ld h, $f4
    ld h, $9c
    rst $38
    cp $02
    pop hl
    inc bc
    db $e3
    or b
    call nc, $d5bc
    ld e, [hl]
    rst $10
    cpl
    rst $10
    sbc c
    sub [hl]
    ld e, [hl]
    sub a
    cpl
    sub a
    sbc c
    ld b, [hl]
    ld e, [hl]
    ld b, a

jr_003_7c98:
    cpl
    ld b, a
    sbc c
    ld d, $5e
    rla
    cpl
    rla
    sbc c
    rst $38
    cp $02
    pop hl
    inc b
    db $e3
    ld [hl], b
    rst $30
    ld l, $d6
    nop
    sub $80
    sub $d0
    rst $10
    jr nc, jr_003_7cd9

    nop
    ld h, $80
    ld h, $d0
    daa
    jr nc, @+$01

    cp $02
    pop hl
    inc bc
    db $e3
    jr nc, jr_003_7c98

    ret nc

    pop hl
    db $10
    db $d3
    inc a
    pop hl
    inc b
    inc de
    inc a
    rst $38
    cp $02
    pop hl
    ld bc, $42e2
    rrca
    nop
    rrca
    nop
    pop hl
    ld [bc], a
    rrca

jr_003_7cd9:
    dec c
    ld [$ff02], sp
    cp $02
    pop hl
    ld bc, $b0e3
    sub $80
    rst $10
    ld h, h
    pop hl
    ld [bc], a
    sub $30
    ld h, $30
    rst $38
    cp $02
    pop hl
    ld [bc], a
    rst $30
    ld a, [de]
    db $e3
    or b
    sub $00
    ld d, $00
    ld d, $00
    halt
    nop
    ld d, $00
    ld d, $00
    rst $38
    cp $02
    pop hl
    inc bc
    db $e3
    ld [hl], b
    rst $30
    dec e
    push de
    nop
    push de
    ld b, b
    push de
    add b
    push de
    ret nz

    sub $00
    sub $40
    sub $80
    sub $c0
    rst $10
    nop
    rst $10
    ld b, b
    rst $10
    add b
    and a
    add b
    add a
    add b
    ld d, a
    add b
    scf
    add b
    rla
    add b
    rst $38
    cp $02
    pop hl
    ld [bc], a
    db $e3
    or b
    rst $30
    ld d, $d7
    ld b, b
    pop hl
    ld [$70e3], sp
    rst $30
    ld e, $d7
    ld [hl], b
    pop hl
    inc b
    sub $d0
    sub $a0
    sub $70
    ld h, $d0
    ld h, $a0
    ld d, $70
    rst $38
    cp $02
    pop hl
    dec b
    db $e3
    ld [hl], b
    rst $30
    rla
    sub $d0
    ldh [rSB], a
    rst $30
    rra
    sub $c0
    sub $a0
    sub $80
    sub $60
    ld h, $c0
    ld h, $a0
    ld d, $e0
    ld d, $b0
    rst $38
    cp $02
    pop hl
    dec b
    db $e3
    jr nc, @-$07

    dec d
    push de
    ret nc

jr_003_7d76:
    dec [hl]
    ret nc

    db $e3
    ld [hl], b
    pop hl
    inc c
    rst $30
    ld c, l
    sub $d0
    ld h, $d0
    rst $38

jr_003_7d83:
    cp $02
    pop hl
    ld bc, $b0e3
    or [hl]
    add b
    add $80
    db $e3
    ld [hl], b
    sub $e0
    rst $10
    db $10
    rst $10
    jr nc, jr_003_7d76

    ld [bc], a
    rst $10
    nop
    db $e3
    or b
    sub $e0
    sub $b0
    pop hl
    inc bc
    rst $30
    ld e, $d6
    ld h, b
    ldh [rSB], a
    pop hl
    inc b
    rst $30
    ld a, $d6
    jr nc, jr_003_7d83

    ldh a, [$ffd5]
    ret nz

    push de
    and b
    ld h, $30
    dec h
    ldh a, [$ff15]
    ret nz

    dec d
    and b
    rst $38
    cp $02
    pop hl
    ld b, $e3
    ld [hl], b
    rst $30
    inc e
    rst $10
    ret nz

    rst $00
    ret nz

    or a
    ret nz

    sub a
    ret nz

    ld [hl], a
    ret nz

    ld d, a
    ret nz

    scf
    ret nz

    rla
    ret nz

    rst $38
    cp $02
    pop hl
    ld bc, $27e2
    inc c
    ldh [c], a
    ld h, $0d
    ldh [c], a
    dec h
    rrca
    nop
    nop
    ldh [c], a
    ld hl, $e20f
    ld [hl-], a
    rrca
    ldh [c], a
    inc [hl]
    rrca
    ldh [c], a
    ld b, [hl]
    rrca
    ld a, [bc]
    inc b
    ld [bc], a
    rst $38
    cp $02
    ldh [c], a
    daa
    pop hl
    ld [bc], a
    ld c, $00
    ld [bc], a
    ld bc, $0ae1
    nop
    pop hl
    ld [bc], a
    ld [$0200], sp
    ld bc, $0ae1
    nop
    pop hl
    ld [bc], a
    inc b
    nop

jr_003_7e0e:
    ld [bc], a
    ld bc, $feff
    ld [bc], a
    pop hl
    ld [$45e2], sp
    rrca
    rrca
    rrca

jr_003_7e1a:
    rrca
    rrca
    rrca
    ld a, [bc]
    ld b, $03
    rst $38
    cp $02
    pop hl
    inc b
    ldh [c], a
    ld [hl], $0f
    ldh [rSC], a
    ldh [c], a
    scf
    pop hl
    rlca
    rrca
    pop hl
    inc b
    ld a, [bc]
    add hl, bc
    ld [$0607], sp
    inc b
    inc bc
    ld bc, $feff
    ld [bc], a
    pop hl
    inc bc
    db $e3
    or b
    rst $10
    jr nc, jr_003_7e1a

    ld [hl], a
    rst $10
    call z, Call_000_3087
    add a
    ld [hl], a
    ld [hl], a
    call z, Call_000_3047
    scf
    ld [hl], a
    scf
    call z, Call_000_3017
    rla
    ld [hl], a
    rla
    call z, $feff
    ld [bc], a
    pop hl
    inc b
    db $e3
    ld [hl], b
    rst $30
    inc e
    rst $10
    ld [hl], b
    pop hl
    ld [$14f7], sp
    call nc, Call_000_2400
    nop
    pop hl
    ld a, [bc]
    db $e3
    or b
    rst $30
    cpl
    rst $10
    add b
    rst $00
    ld d, b
    or a
    jr nz, jr_003_7e0e

    ldh a, [rRP]
    ret nz

    ld h, $f0
    ld d, $f0
    rst $30
    nop
    pop hl
    ld bc, $b0e3
    rst $10
    ld h, h
    rst $10
    ld h, b
    rst $10
    ld e, a
    rst $10
    ld e, [hl]
    rst $10
    ld e, l
    rst $10
    ld e, h
    rst $10
    ld e, d
    ld b, a
    ld h, h
    ld b, a
    ld h, b
    ld b, a
    ld e, a
    ld b, a
    ld e, [hl]
    ld b, a
    ld e, l
    ld b, a
    ld e, h
    ld b, a
    ld e, d
    rla
    ld h, h
    rla
    ld h, b
    rla
    ld e, a
    rla
    ld e, [hl]
    rla
    ld e, l
    rla
    ld e, h
    rla
    ld e, d
    rst $38
    cp $02
    pop hl
    ld bc, $30e3
    rst $10
    inc [hl]
    db $e3
    ld [hl], b
    rst $10
    inc [hl]
    pop hl
    inc bc
    db $e3
    or b
    rst $10
    inc [hl]
    and a
    inc [hl]
    ld [hl], a
    inc [hl]
    ld b, a
    inc [hl]
    rla
    inc [hl]
    rst $38
    cp $02
    pop hl
    inc bc
    db $e3
    ld [hl], b
    sub $cf
    rst $10
    ld l, b
    sub $cf
    ld h, a
    ld l, b
    ld h, [hl]
    rst $08
    rla
    ld l, b
    ld d, $cf
    rst $38
    cp $02
    pop hl
    ld bc, $33e2
    rrca
    ldh [c], a
    inc [hl]
    rrca
    ldh [c], a
    dec [hl]
    rrca
    nop
    pop hl
    dec b
    ldh [c], a
    scf
    rrca
    inc c
    add hl, bc
    ld b, $03
    ld bc, $feff
    ld [bc], a
    pop hl
    ld [bc], a
    db $e3
    or b
    rst $10
    or h
    rst $10
    or e
    rst $10
    or d
    rst $10
    or c
    rst $10
    or b
    rst $10
    xor a
    rst $10
    xor [hl]
    rst $10
    xor l
    rst $10
    xor h
    rst $00
    xor e
    or a
    xor d
    sub a
    xor c
    ld [hl], a
    xor b
    ld d, a
    and a
    scf
    and [hl]
    daa
    and l
    rla
    and h
    rst $38
    cp $02
    pop hl
    ld b, $e3
    or b
    rst $30
    dec d
    db $d3
    nop
    add e
    nop
    inc sp
    nop
    inc de
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Jump_003_7f4e:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
