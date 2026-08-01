; ============================================================================
; bank00/03_gbc_island_1944.asm — $1944-$1971: GBC island in the Call_000_1919 rewrite padding (GBC_WhiteoutBG, GBC_MapRemapRet)
; Part of SECTION "ROM Bank $000"; included in order by bank00_core_engine.asm.
; ============================================================================
ASSERT @ == $1944 ; pinned: callers use the original address
Call_000_1944:
    xor a
    ld [$c66d], a
    ld [$c672], a
    ld a, [wGDMARequest]
    or $02
    ld [wGDMARequest], a
    ret

; Fills all 8 BG palettes with pure white, straight to CRAM. Called from the
; VBlank trampoline the moment the DMG fade hits BGP=$00, one VBlank before
; the bank10 resnap lands -- the game starts drawing the next screen on that
; exact frame. (Lives in the padding left by the Call_000_1919 rewrite.)
GBC_WhiteoutBG::
    ld a, $80
    ldh [rBCPS], a
    ld b, 32
.color:
    ld a, $ff
    ldh [rBCPD], a
    ld a, $7f
    ldh [rBCPD], a
    dec b
    jr nz, .color
    ret

; RenderTilemapCell's single exit stub ($1c52) is rerouted here. Runs right
; after a map finished decompressing into the $d000 shadow: applies the
; studio's per-cell tile-id remaps (bank10 MapRemapTable, keyed by wCurMapId
; which GBC_MapHook refreshed on entry), then performs the original exit
; (restore bank 1, return to the caller). Bank10_ApplyMapRemaps saves the
; registers itself; A is clobbered exactly like the original exit did.
GBC_MapRemapRet:
    ld a, $10
    rst $10
    call Bank10_ApplyMapRemaps
    ld a, $01                   ; original replaced bytes
    rst $18
    ret

    ASSERT @ <= $1971, "GBC island ($1944 padding) overflowed into Call_000_1971"
    ds $1971 - @, 0

