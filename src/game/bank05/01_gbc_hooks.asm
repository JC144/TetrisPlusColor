; ============================================================================
; bank05/01_gbc_hooks.asm — $7f9c-$8000: GBC hook island (NavQueueAndPump, puzzle menu, continue-preview)
; Part of SECTION "ROM Bank $005"; included in order by bank05_screens.asm.
; ============================================================================
; ============================================================================
; GBC_NavQueueAndPump: called in place of Call_005_564a's final
; "call Call_000_0153" (iso-size 3-byte patch). Queues the 8x1 mode-label row
; as the original did, then pumps the CHR stream immediately: Call_000_1919
; (rewritten) stages the whole vignette in one call and arms the VBlank GDMA,
; so the label text and the vignette bitmaps swap on the same frame.
; ============================================================================
ASSERT @ == $7f9c ; start of the bank05 GBC hook island (pinned by the ds above)
GBC_NavQueueAndPump:
    call Call_000_0153
    jp Call_000_017a

; ============================================================================
; Puzzle NEW GAME/CONTINUE menu, swapped so CONTINUE sits on top and is
; pre-selected when a save exists ($a459 != $ff). $c685 keeps its original
; meaning (0=NEW GAME, 1=CONTINUE); only the on-screen rows and the default
; are inverted (rows also swapped in Call_005_5d14/Call_005_5d31).
;
; GBC_PuzzleMenuReload: replaces the map $24 reload of Jump_005_450f
; (which bypasses the ss$00 init when backing out of the confirm screens).
; GBC_PuzzleMenuInit: replaces "xor a / ld [$c685],a / call Call_005_5d14"
; in the menu init. Both run right after the map was decompressed into the
; shadow map, so swapping the two text lines there is picked up by the
; GDMA flip.
; ============================================================================
GBC_PuzzleMenuReload:
    ld e, $24
    call Call_000_015c          ; decompress map $24 into shadow + queue redraw
GBC_PuzzleMenuInit:
    ld hl, $d146                ; shadow row 10 cols 6-13 ("NEW GAME")
    ld de, $d186                ; shadow row 12 cols 6-13 ("CONTINUE")
    ld b, $08
.swap:
    ld a, [de]
    ld c, a
    ld a, [hl]
    ld [de], a
    ld a, c
    ld [hl+], a
    inc de
    dec b
    jr nz, .swap
    ld a, $80                   ; blank, same tile the cursor-erase draws
    ld [$d145], a               ; cursor cell row 10 (map data embeds $f4 here)
    ld [$d185], a               ; cursor cell row 12
    ld a, [$a459]
    cp $ff
    ld a, $01                   ; save exists -> pre-select CONTINUE
    jr nz, .store
    xor a                       ; no save -> NEW GAME (CONTINUE would be a no-op)
.store:
    ld [$c685], a
    jp Call_005_5d14            ; draw cursor on the selected row

; ============================================================================
; GBC_ContinuePreviewEraseAlt: same fix as bank01's GBC_ContinuePreviewErase
; but for the $c692-machine copy of the CONTINUE flow in this bank; called in
; place of its accept branch's "call Call_000_0153" (iso-size 3-byte patch).
; That branch reloads only the well (map $47, cols 1-10), so the next-piece
; preview boxes kept showing the previous game's pieces until the spawner
; re-armed ~2s later. Queue the well redraw as the original did, then blank
; the preview cells in the shadow map (same cells/tile as the erase at
; Jump_000_07c7's caller) and queue a 6x4 redraw of the preview area.
; ============================================================================
GBC_ContinuePreviewEraseAlt:
    call Call_000_0153          ; queue the 10x17 well redraw
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
    jp Call_000_0153

    ds $8000 - @, 0
