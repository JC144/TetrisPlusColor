; ============================================================================
; bank01/03_gbc_hooks.asm — $7cbf-$8000: GBC hook island (WriteTileWithPalette, boot init, menu/pause/continue hooks)
; Part of SECTION "ROM Bank $001"; included in order by bank01_game_logic.asm.
; ============================================================================
; ============================================================================
; GBC COLORIZATION - bank 1 entry points (engine lives in bank $10)
; ============================================================================

; Write tile + palette attribute during HBlank (replaces the original
; "call Call_001_544a / ld [hl+],a" pattern, invoked via the WRITE_TILE
; macro from all six shadow-map renderers).
; The attribute comes from wBGAttrLUT (installed per screen by the bank10
; engine), looked up BEFORE the STAT wait so the in-window work is only
; ~14 M-cycles (attr write on VRAM bank 1 + tile write on bank 0).
; The window runs under di/ei: an IRQ between the STAT test and the writes
; would leave a stale mode, and the ISR's GDMA paths force rVBK back to 0
; (the attribute would land in VRAM bank 0 and be lost). Mode 1 is accepted
; alongside mode 0 so the wait never spins across VBlank with IRQs masked
; (worst-case IRQ latency: one mode 2+3 span, ~100 M-cycles).
; Input: A = tile, HL = VRAM destination. Advances HL. Preserves BC, DE.
ASSERT @ == $7cbf ; start of the bank01 GBC hook island
WriteTileWithPalette::
    push bc
    ld c, a
    ld b, HIGH(wBGAttrLUT)
    ld a, [bc]                  ; attribute for this tile id
    ld b, a
    di
.wait:
    ldh a, [rSTAT]
    and $02                     ; mode 0 or 1: VRAM writable
    jr nz, .wait
    ld a, $01                   ; --- inside write window ---
    ldh [rVBK], a
    ld [hl], b                  ; attribute -> VRAM bank 1
    xor a
    ldh [rVBK], a
    ld a, c
    ld [hl+], a                 ; tile -> VRAM bank 0
    ei
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

; ============================================================================
; GBC_PauseMenuValidate: pause-menu validation, replaces the bare
; "ldh a,[$ff8d] / and $08" Start checks in Call_001_5566.
; A validates the current CONTINUE/RETIRE selection; Start always resumes
; (forces selection to CONTINUE first). Consumes the button edge so the
; press doesn't leak into gameplay (A would rotate the piece) on the
; resume frame, which runs with this frame's edges still in $ff8d.
; Returns NZ (a=1) to proceed with validation, Z (a=0) to stay paused.
; ============================================================================
GBC_PauseMenuValidate:
    ldh a, [$ff8d]
    and $09              ; Start ($08) or A ($01) newly pressed?
    ret z                ; neither -> stay paused (Z, a=0)
    and $08
    jr z, .consume       ; A alone -> validate current selection
    xor a
    ld [$c73e], a        ; Start -> force selection to CONTINUE
.consume:
    xor a
    ldh [$ff8d], a       ; eat the edges for this frame
    or $01               ; a=1, NZ -> caller proceeds to validate
    ret

; ============================================================================
; GBC_ContinuePreviewErase: called in place of the puzzle CONTINUE-accept
; branch's "call QueueTextDraw" (iso-size 3-byte patch, bank00 $0b02 area,
; bank01 mapped there). The accept branch reloads only the well (map $47,
; cols 1-10), so the two next-piece preview boxes kept showing the previous
; game's pieces until the spawner re-armed ~2s later. Queue the well redraw
; as the original did, then blank the preview cells in the shadow map (same
; cells/tile as the game-over erase before Jump_000_07c7) and queue a 6x4
; redraw of the preview area.
; ============================================================================
GBC_ContinuePreviewErase::
    call QueueTextDraw          ; original: queue the 10x17 well redraw
    xor a
    ld hl, $d02d                ; big preview box, row 1 (cols 13-16)
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    ld hl, $d04d                ; row 2
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    ld hl, $d06d                ; row 3 (cols 13-18, incl. small box)
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    ld hl, $d08d                ; row 4
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    ld h, $00                   ; queue 6x4 preview-area redraw at $d02d
    ld l, $2d
    ld b, $06
    ld c, $04
    jp QueueTextDraw

; ============================================================================
; GBC_LevelSelectB: classic SELECT LEVEL (GAME_STATE $03 ss$01, ROM0 handler
; at $0668, bank01 mapped). Replaces its "ldh a,[$ff8d] / and $01" A check
; (iso-size, "call GBC_LevelSelectB / ret z / nop"). B = back to SELECT MODE:
; arm the fade-out, fade the music and hand over to GAME_STATE $02 ss$0c
; (GBC_SelectModeReturn in bank05, which waits for the fade-out and reloads
; map $21 with the CLASSIC vignette since $c5a8 is still 0). Returns Z on B
; (caller returns), else the original A test result.
; ============================================================================
GBC_LevelSelectB::
    ldh a, [$ff8d]
    and $02
    jr z, .orig
    ld a, $08
    call InitPaletteFade
    ld a, $02
    ld [SOUND_CONTROL], a
    ld a, $02
    ld [GAME_STATE], a
    ld a, $0c
    ld [SCREEN_SUBSTATE], a
    xor a
    ret
.orig:
    ldh a, [$ff8d]
    and $01
    ret

    ds $8000 - @, 0
