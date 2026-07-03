; ============================================================================
; Macros for Tetris Plus GBC
; ============================================================================

; Write a tile from [DE] through WriteTileWithPalette
; Used in tile rendering loops throughout bank 1
; Byte count: 4 bytes (ld a,[de] = 1, call = 3, nop = 1... wait)
; Actually: ld a,[de] (1) + call (3) + nop (1) = 5 bytes
MACRO WRITE_TILE
    ld a, [de]
    call WriteTileWithPalette
    nop
ENDM

; Switch to ROM bank (immediate value)
; Usage: SWITCH_BANK 5
MACRO SWITCH_BANK
    ld a, \1
    rst $10
ENDM
