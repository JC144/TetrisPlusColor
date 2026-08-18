; ============================================================================
; bank05/01_gbc_menu_back.asm — $694c-$7f9c: "B = back" navigation island
; Part of SECTION "ROM Bank $005"; included in order by bank05_screens.asm.
; ============================================================================
; The original front end only lets B go back on the OPTIONS screen and on the
; puzzle CONTINUE-info page. This island adds a consistent "B = one screen
; back" everywhere else, using the game's own transition idiom: arm the DMG
; fade-out (InitPaletteFade $08), park the state machine on a "wait fade-out"
; substate, then reload the target screen and jump to its post-init substate.
;
; Two substate jump tables had to grow, so they are relocated here (the
; dispatchers' "ld hl,$5593" / "ld hl,$42c9" operands are patched):
;   GBC_SelectModeTable  = GAME_STATE $02 (SELECT MODE / OPTIONS), 12 + 2
;   GBC_PuzzleMenuTable  = GAME_STATE $05 (puzzle menus), 25 + 2
;
; Hooks replace each screen's A-button check iso-size ("call GBC_xxxB" over
; "ldh a,[$ff8d] / and $01 / jr z,X"). On B they perform the transition and
; return Z so the caller falls into its harmless "no A pressed" branch (cursor
; redraw + direction checks that see no bits). Otherwise they return the
; original test's flags. All hooks run with bank $05 mapped, so the ROM0
; thunks (Call_000_01xx, which restore bank $05) are usable.
; ============================================================================
ASSERT @ == $694c ; start of the bank05 menu-back island (pinned by 00_screens.asm)

; ----------------------------------------------------------------------------
; Relocated substate tables
; ----------------------------------------------------------------------------
; GAME_STATE $02 — original 12 entries of $5593, then the new back substates.
GBC_SelectModeTable:
    dw $55ab, $55d9, $5606, $569e, $56ab, $56d8, $5705, $57c6
    dw $57f2, $5a81, $580e, $5895
    dw GBC_SelectModeReturn     ; ss$0c: (fade-out done) reload SELECT MODE
    dw GBC_SelectModeToTitle    ; ss$0d: (fade-out done) back to TITLE

; GAME_STATE $05 — original 25 entries of $42c9, then the new back substates.
GBC_PuzzleMenuTable:
    dw $42fb, $5a81, $4330, $438b, $5a81, $447c, $44d1, $5a81
    dw $4526, $457a, $458d, $5a81, $46c2, $4792, $47bc, $4803
    dw $4812, $482c, $5a81, $4855, $4874, $4885, $5a81, $48a4
    dw $48f6
    dw GBC_WorldMapBack         ; ss$19: (fade-out done) world map -> difficulty
    dw GBC_DifficultyBack       ; ss$1a: (fade-out done) difficulty -> NEW GAME/CONTINUE

; ----------------------------------------------------------------------------
; New substates (all entered with a fade-out armed by the hook)
; ----------------------------------------------------------------------------
; GAME_STATE $02 ss$0c — re-enter SELECT MODE from a sub-menu (classic level
; select, puzzle NEW GAME/CONTINUE, EDIT menu). Same recipe as the EDIT-mode
; "EXIT" item ($49f0) and the OPTIONS return (ss$07), except the vignette CHR
; is looked up from the mode-select cursor $c5a8 (table $5694, bank $0e)
; instead of being hard-coded. Lands on ss$01, which redraws the label,
; re-arms the vignette stream and fades in.
GBC_SelectModeReturn:
    ld a, $01
    call Call_000_0168          ; StepPaletteFade(fade-out)
    or a
    ret z                       ; still fading
    call Call_000_0174          ; ClearSpriteBuffer
    ld a, $09
    call Call_000_0159          ; CHR set $09
    ld a, $01
    call Call_000_0159          ; CHR set $01 (mode select tileset)
    ld a, [$c5a8]               ; mode-select cursor 0-4
    ld hl, $5694                ; vignette source table (words, bank $0e)
    ld d, $00
    ld e, a
    add hl, de
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a                     ; hl = vignette CHR source
    ld de, $9000
    ld bc, $0550
    call Call_000_0177          ; blit vignette (bank $0e -> VRAM)
    ld e, $21
    call Call_000_015c          ; load map $21 (SELECT MODE)
    ld a, $04
    ldh [$ffa0], a              ; music 4
    ld a, $01
    ld [SCREEN_SUBSTATE], a     ; -> SELECT MODE ss$01
    ret

; GAME_STATE $02 ss$0d — SELECT MODE -> TITLE. Title ss$00 is a self-contained
; init (CHR 0, map $20, LCDC, ClearSpriteBuffer, fade-in; ss$01 restarts the
; title music), so just hand over to it.
GBC_SelectModeToTitle:
    ld a, $01
    call Call_000_0168
    or a
    ret z
    ld a, $01
    ld [GAME_STATE], a
    xor a
    ld [SCREEN_SUBSTATE], a
    ret

; GAME_STATE $05 ss$19 — world map -> difficulty select. Kill the world-icon
; entities (same ClearSpriteBuffer the forward exit ss$0d does), make sure the
; difficulty screen's A returns to the world map ($c686 = 0, "not a CONTINUE")
; and preselect the saved difficulty like ss$09 does, then run the difficulty
; init substate ss$15 (CHR $03, map $5c, music 4, fade-in).
GBC_WorldMapBack:
    ld a, $01
    call Call_000_0168
    or a
    ret z
    call Call_000_0174          ; ClearSpriteBuffer (world icons are entities)
    xor a
    ld [$c686], a
    ld a, [$a0ec]
    ld [$c685], a               ; difficulty cursor = saved difficulty
    ld a, $15
    ld [SCREEN_SUBSTATE], a     ; -> difficulty init
    ret

; GAME_STATE $05 ss$1a — difficulty select -> NEW GAME/CONTINUE menu. Reuses
; the confirm-screen "NO" path: Jump_005_450f arms the fade-in, reloads map
; $24 through GBC_PuzzleMenuReload (row swap + cursor default) and lands on
; ss$01. Both screens use CHR $03 and music 4, so nothing else to reload.
GBC_DifficultyBack:
    ld a, $01
    call Call_000_0168
    or a
    ret z
    jp Jump_005_450f

; ----------------------------------------------------------------------------
; Hooks (iso-size replacements of the A-button checks)
; ----------------------------------------------------------------------------
; SELECT MODE ss$02 ($5617): replaces "ldh a,[$ff8d] / and $09 / jp nz,Jump_005_568d".
; B -> fade out, music fade, park on ss$0d (-> TITLE). Returns Z on B; else
; the original A|Start test result (NZ = validate).
GBC_SelectModeB:
    ldh a, [$ff8d]
    and $02
    jr z, .orig
    ld a, $08
    call Call_000_0162          ; InitPaletteFade($08) = fade out
    ld a, $02
    ld [SOUND_CONTROL], a       ; music fade out
    ld a, $0d
    ld [SCREEN_SUBSTATE], a
    xor a
    ret
.orig:
    ldh a, [$ff8d]
    and $09                     ; A or Start
    ret

; Puzzle NEW GAME/CONTINUE ss$02 ($4330) and EDIT menu ss$02 ($4981): replaces
; "ldh a,[$ff8d] / and $01 / jr z,X". B -> fade out, music fade, hand over to
; GAME_STATE $02 ss$0c (GBC_SelectModeReturn). Returns Z on B; else the A test.
GBC_MenuToSelectMode:
    ldh a, [$ff8d]
    and $02
    jr z, .orig
    ld a, $08
    call Call_000_0162
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

; Puzzle difficulty select ss$17 ($48a4): B -> fade out (music keeps playing,
; the menu shares it) and park on ss$1a (GBC_DifficultyBack).
GBC_DifficultyB:
    ldh a, [$ff8d]
    and $02
    jr z, .orig
    ld a, $08
    call Call_000_0162
    ld a, $1a
    ld [SCREEN_SUBSTATE], a
    xor a
    ret
.orig:
    ldh a, [$ff8d]
    and $01
    ret

; Puzzle world map ss$0c ($46c2): B -> fade out, music fade, park on ss$19
; (GBC_WorldMapBack).
GBC_WorldMapB:
    ldh a, [$ff8d]
    and $02
    jr z, .orig
    ld a, $08
    call Call_000_0162
    ld a, $02
    ld [SOUND_CONTROL], a
    ld a, $19
    ld [SCREEN_SUBSTATE], a
    xor a
    ret
.orig:
    ldh a, [$ff8d]
    and $01
    ret

; Puzzle NEW GAME confirm YES/NO ss$05 ($447c): replaces
; "ldh a,[$ff8d] / and $02 / jr nz,jr_005_4488". Originally B was an alias of
; A (B on YES wiped the save). Now B forces the cursor to NO (erase + redraw)
; and returns NZ so the caller takes its normal accept path, which with
; $c685 == 1 is the "NO" branch: fade out -> ss$06 -> Jump_005_450f (menu).
GBC_ConfirmB:
    ldh a, [$ff8d]
    and $02
    ret z                       ; no B -> Z, caller goes on to test A
    call Call_005_5d69          ; erase cursor at current column
    ld a, $01
    ld [$c685], a               ; NO
    call Call_005_5d43          ; draw cursor on NO
    ld a, $01
    or a                        ; NZ -> caller: accept (NO path)
    ret

; EDIT tool grid ss$05 ($4ac3): B -> same as the grid's EXIT cell (item 7 + A):
; fade out, music fade, ss$06 (reload the EDIT menu).
GBC_EditGridB:
    ldh a, [$ff8d]
    and $02
    jr z, .orig
    ld a, $08
    call Call_000_0162
    ld a, $02
    ld [SOUND_CONTROL], a
    ld a, $06
    ld [SCREEN_SUBSTATE], a
    xor a
    ret
.orig:
    ldh a, [$ff8d]
    and $01
    ret

; OPTIONS erase-save confirm (GAME_STATE $02 ss$0a, $580e): B -> same as A on
; NO: fade out, music fade, ss$0b (reload OPTIONS). The save is untouched.
GBC_EraseConfirmB:
    ldh a, [$ff8d]
    and $02
    jr z, .orig
    ld a, $08
    call Call_000_0162
    ld a, $02
    ld [SOUND_CONTROL], a
    ld a, $0b
    ld [SCREEN_SUBSTATE], a
    xor a
    ret
.orig:
    ldh a, [$ff8d]
    and $01
    ret

    ds $7f9c - @, 0             ; padding up to the GBC hook island
