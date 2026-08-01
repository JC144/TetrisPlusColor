; ============================================================================
; BANK $00 - Core Engine (Fixed Bank)
; ============================================================================
; Address: $0000-$3FFF (always mapped, no bank switching needed)
;
; Core Game Boy engine: RST vectors, interrupt handlers, main game loop,
; rendering dispatch, and fundamental utility functions. This bank is always
; accessible from any other bank without switching.
;
; Key functions:
;   RenderTilemapCell ($1b27)      - Tilemap cell render pipeline (46 calls)
;   ClearObjectFields ($1ddb)     - Zero object field initialization (33 calls)
;   IncrementAttractCounter ($1868) - Attract mode timeout (31 calls)
;   ClearSpriteBuffer ($1b0f)     - Clear sprite shadow buffer (16 calls)
;   DispatchBankRoutine ($1c56)   - Cross-bank routine dispatcher (13 calls)
;   AdvanceScreenState ($2041)    - State machine progression (73 calls)
;
; Status: FULL (16384/16384 bytes) - No room for new code
; ============================================================================
; Originally disassembled with mgbdis v3.0 by Matt Currie

SECTION "ROM Bank $000", ROM0[$0]

INCLUDE "core/bank00/00_vectors_header.asm"  ; $0000-$0150
INCLUDE "core/bank00/01_boot_stubs.asm"  ; $0150-$0204
INCLUDE "core/bank00/02_main.asm"  ; $0204-$1944
INCLUDE "core/bank00/03_gbc_island_1944.asm"  ; $1944-$1971
INCLUDE "core/bank00/04_render.asm"  ; $1971-$1c56
INCLUDE "core/bank00/05_dispatch.asm"  ; $1c56-$2041
INCLUDE "core/bank00/06_screens.asm"  ; $2041-$3ee8
INCLUDE "core/bank00/07_gbc_vblank.asm"  ; $3ee8-$4000
