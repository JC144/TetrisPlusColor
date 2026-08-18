; ============================================================================
; BANK $05 - Screen State Handlers
; ============================================================================
; Address: $4000-$7FFF (switchable)
;
; Screen state machine handlers for all game screens: title, mode select,
; gameplay, results, and VS modes. Manages UI transitions, menu logic,
; and screen initialization via SCREEN_SUBSTATE jump tables.
;
; Key structures:
;   SCREEN_SUBSTATE jump table at $4013
;   Screen initialization routines
;   Menu/UI state management
;   Tilemap data tables
;
; ============================================================================
; Originally disassembled with mgbdis v3.0 by Matt Currie

SECTION "ROM Bank $005", ROMX[$4000], BANK[$5]

INCLUDE "game/bank05/00_screens.asm"  ; $4000-$694c
INCLUDE "game/bank05/01_gbc_menu_back.asm"  ; $694c-$7f9c (B = back navigation, then padding)
INCLUDE "game/bank05/02_gbc_hooks.asm"  ; $7f9c-$8000
