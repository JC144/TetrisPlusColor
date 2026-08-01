; ============================================================================
; bank00/07_gbc_vblank.asm — $3ee8-$4000: GBC VBlank machinery (GDMADispatch, trampoline $3f24, hooks, GDMA flip)
; Part of SECTION "ROM Bank $000"; included in order by bank00_core_engine.asm.
; ============================================================================
; ============================================================================
; GBC_GDMADispatch: serves one wGDMARequest bit per VBlank (called from the
; trampoline head with A = request bits, nonzero). Bit 0 (full tilemap+attr
; flip) has priority; bit 1 (vignette CHR from wChrStaging to $9000) runs the
; following VBlank if both are armed. rVBK is forced to 0 for the CHR upload;
; this is safe: the only main-thread VBK=1 window (WriteTileWithPalette)
; runs under di/ei, so the interrupt can never land inside it.
; (Occupies the former nop island $3ee8-$3f23; the old Call_000_3efc /
; Jump_000_3eff / Jump_000_3f00 labels here were only referenced as data
; bytes from banks 07/0a, now literals at those sites.)
; ============================================================================
ASSERT @ == $3ee8 ; start of the former nop island $3ee8-$3f23
GBC_GDMADispatch:
    rra                         ; bit 0 -> carry
    jr nc, .chr
    ld a, [wGDMARequest]
    and $02                     ; keep a pending CHR upload for next VBlank
    ld [wGDMARequest], a
    jp GBC_DoGDMAFlip
.chr:
    xor a
    ld [wGDMARequest], a
    ld a, $02
    ldh [rSVBK], a              ; source lives in WRAM bank 2
    xor a
    ldh [rVBK], a
    ld a, HIGH(wChrStaging)
    ldh [rHDMA1], a
    xor a
    ldh [rHDMA2], a
    ld a, $90
    ldh [rHDMA3], a             ; dest $9000 (vignette tile data)
    xor a
    ldh [rHDMA4], a
    ld a, $53
    ldh [rHDMA5], a             ; GDMA, 84 blocks = $540 bytes
    ld a, $01
    ldh [rSVBK], a
    ret

; ============================================================================
; GBC_BootBridge: ROM0 bridge so BootInitColors (bank 1 code) can run the
; bank10 boot init without remapping itself out from under PC. (Lives in the
; tail of the $3ee8 island to leave room for the unrolled palette upload.)
; ============================================================================
GBC_BootBridge::
    ld a, $10
    rst $10
    call Bank10_BootInit
    ld a, $01
    rst $10
    ret

    ds $3f24 - @, 0

ASSERT @ == $3f24 ; VBlank trampoline pinned at $3f24 (called from RAM stub)
Call_000_3f24:
; ============================================================================
; GBC VBlank trampoline. Order matters: detect DMG shadow changes FIRST --
; when the game's fade hits an endpoint ($00/$ff) the staging is stale, so
; any pending GDMA is held until bank10 has resnapped (pure white/black) and
; the upload has landed; full-screen flips then happen behind a blank screen.
; One transfer per VBlank: palettes when dirty (priority), else GDMA.
; (Call_000_3f24 label kept: referenced as data bytes from bank0e.)
; ============================================================================
VBlankTrampoline_Bank0:
    push af
    push bc
    push hl
    ld hl, wLastBGP
    ld a, [BGP_SHADOW]
    cp [hl]
    jr nz, .changed
    inc hl
    ld a, [OBP0_SHADOW]
    cp [hl]
    jr nz, .changed
    inc hl
    ld a, [OBP1_SHADOW]
    cp [hl]
    jr z, .serve
.changed:
    ld a, $01
    ld [wFadeReq], a
    ld a, [BGP_SHADOW]
    or a                        ; fade just hit the white endpoint?
    call z, GBC_WhiteoutBG      ; blank BG CRAM this very VBlank
    jr .done                    ; staging stale: no other uploads this VBlank
.serve:
    ld a, [wPalDirty]
    or a
    jr nz, .pal
    ld a, [wGDMARequest]
    or a
    jr z, .done
    call GBC_GDMADispatch
    jr .done
.pal:
    ; 128 CRAM bytes, 2x unrolled via [c] = 6 M-cycles/byte (~768 M total).
    ; The whole ISR (~850 M) plus the original handler's OAM DMA + scroll
    ; (~230 M) must stay inside the 1140 M-cycle VBlank window: CRAM writes
    ; are dropped in mode 3 on real hardware (the old 9 M/byte loop overran).
    xor a
    ld [wPalDirty], a
    ld a, $80
    ldh [rBCPS], a
    ld hl, wPalStagingBG
    ld c, LOW(rBCPD)
    ld b, 32
.bg:
    ld a, [hl+]
    ldh [c], a
    ld a, [hl+]
    ldh [c], a
    dec b
    jr nz, .bg
    ld a, $80
    ldh [rOCPS], a
    inc c                       ; rBCPD -> rOCPD
    inc c
    ld b, 32
.obj:
    ld a, [hl+]
    ldh [c], a
    ld a, [hl+]
    ldh [c], a
    dec b
    jr nz, .obj
.done:
    pop hl
    pop bc
    pop af
    jp Jump_000_02ed

; ============================================================================
; GBC_MapHook: patched over the first 3 bytes of RenderTilemapCell
; ("ld a,$08 / rst $10"). E = RLE map ID. Lets bank10 install the screen's
; color descriptor before the map is decompressed and streamed.
; ============================================================================
GBC_MapHook:
    push bc
    push de
    push hl
    ld a, $10
    rst $10
    call Bank10_OnMapLoad
    pop hl
    pop de
    pop bc
    ld a, $08                   ; original replaced bytes (map data bank)
    rst $10
    ret

; ============================================================================
; GBC_FrameHook: replaces "call Call_000_1a5c" in the main loop. After the
; shadow OAM rebuild, runs the bank10 per-frame pass (palette fade recompute
; + OBJ palette assignment). Returns with bank 1 mapped, as the original did.
; ============================================================================
GBC_FrameHook:
    call Call_000_1a5c
    ld a, $10
    rst $10
    call Bank10_Frame
    ld a, $01
    rst $10
    ret

; ============================================================================
; GBC_ChrHook: patched over the first 3 bytes of DispatchBankRoutine
; ("ld hl,$1c73"). Records the CHR entry id and splices GBC_ChrPatchRet into
; the return chain, so it runs right AFTER the tile data is decompressed.
; A (entry id) is preserved for the dispatch body; HL/DE are set/clobbered
; by the body immediately after.
; ============================================================================
GBC_ChrHook:
    ld [wChrEntry], a
    pop hl                      ; HL = $1c59 (dispatch body continuation)
    ld de, GBC_ChrPatchRet
    push de                     ; dispatch's final ret lands on the post-hook
    push hl
    ld hl, $1c73                ; original replaced bytes
    ret                         ; -> continue dispatch body

; Runs after the CHR load completes. Applies bank10 tile patches for this
; entry, then restores the CHR bank the dispatch left mapped (callers may
; still rely on it) and returns to the original caller. Preserves registers.
GBC_ChrPatchRet:
    push af
    push bc
    push de
    push hl
    ld a, $10
    rst $10
    call Bank10_ApplyChrPatches
    ; remap the entry's CHR bank: [$1c73 + id*2] -> struct, struct[0] = bank
    ld a, [wChrEntry]
    ld hl, $1c73
    ld d, $00
    ld e, a
    sla e
    rl d
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [hl]
    rst $10
    pop hl
    pop de
    pop bc
    pop af
    ret

; ============================================================================
; GBC_DoGDMAFlip: full-screen tilemap flip, two general-purpose DMAs during
; VBlank. Attributes first (WRAM bank 2 mirror -> VRAM bank 1), then tile ids
; (tilemap shadow $d000 -> VRAM bank 0). 2 x 36 blocks ~ 576 M-cycles: fits
; in the VBlank window because the palette upload is deferred that frame.
; Ends with SVBK=1 / VBK=0 restored (set before the second transfer).
; ============================================================================
GBC_DoGDMAFlip:
    ld a, $02
    ldh [rSVBK], a
    ld a, $01
    ldh [rVBK], a
    call .transfer
    ld a, $01
    ldh [rSVBK], a
    xor a
    ldh [rVBK], a
.transfer:
    ld a, $d0
    ldh [rHDMA1], a             ; source $d000
    xor a
    ldh [rHDMA2], a
    ld a, $98
    ldh [rHDMA3], a             ; dest $9800 (upper bits masked by hardware)
    xor a
    ldh [rHDMA4], a
    ld a, $23
    ldh [rHDMA5], a             ; GDMA, 36 blocks = 576 bytes = 18 rows
    ret

    ASSERT @ <= $3ff9, "ROM0 hook area overflow (7 bytes of margin before $4000)"
    ds $4000 - @, 0
