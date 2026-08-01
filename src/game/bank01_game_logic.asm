; ============================================================================
; BANK $01 - Game Logic & Extensions
; ============================================================================
; Address: $4000-$7FFF (switchable)
;
; Primary game logic bank: piece movement, collision detection, line clearing,
; text rendering, sound function wrappers, and GBC colorization extensions.
; Frequently switched in during active gameplay.
;
; Key functions:
;   QueueTextDraw ($541a)          - Queue text for rendering (29 calls)
;   ClearObjectSubfield ($61a7)   - Zero single byte at DE+$14 (42 calls)
;   InitPaletteFade ($681e)       - Arm DMG palette fade sequencer (24 calls)
;   StepPaletteFade ($682a)       - Step DMG palette fade, ret 1 done (24 calls)
;   WriteTileWithPalette           - GBC tile rendering with color
;   LoadPalettesForScreen          - Auto-detect screen and load palettes
;
; Status: ~373 bytes free (NOP area after $7E8A)
; ============================================================================
; Originally disassembled with mgbdis v3.0 by Matt Currie

SECTION "ROM Bank $001", ROMX[$4000], BANK[$1]

INCLUDE "game/bank01/00_logic.asm"  ; $4000-$541a
INCLUDE "game/bank01/01_text_queue.asm"  ; $541a-$681e
INCLUDE "game/bank01/02_fade_misc.asm"  ; $681e-$7cbf
INCLUDE "game/bank01/03_gbc_hooks.asm"  ; $7cbf-$8000
