; ============================================================================
; Macros for Tetris Plus GBC
; ============================================================================

; Write a tile from [DE] through WriteTileWithPalette
; Used in tile rendering loops throughout bank 1
; Byte count: ld a,[de] (1) + call (3) + nop (1) = 5 bytes
MACRO WRITE_TILE
    ld a, [de]
    call WriteTileWithPalette
    nop ; load-bearing: keeps the macro at 5 bytes, same size as the
        ; original code it replaces — removing it shifts all of bank01
ENDM

; Switch to ROM bank (immediate value)
; Usage: SWITCH_BANK 5
MACRO SWITCH_BANK
    ld a, \1
    rst $10
ENDM
