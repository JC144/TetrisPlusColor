; ============================================================================
; TETRIS PLUS - Game Boy Color
; ============================================================================
; Main assembly file - includes all banks and shared definitions.
; Build with: cd tools && build.bat
;
; Originally disassembled with mgbdis v3.0 by Matt Currie
; ============================================================================

; Shared definitions
INCLUDE "include/hardware.inc"
INCLUDE "include/labels.inc"
INCLUDE "include/macros.inc"

; Core engine (fixed bank)
INCLUDE "core/bank00_core_engine.asm"

; Game logic & entities
INCLUDE "game/bank01_game_logic.asm"
INCLUDE "game/bank02_entities.asm"

; Audio engine
INCLUDE "audio/bank03_sound_engine.asm"

; Data / padding
INCLUDE "data/bank04_padding.asm"

; Screen handlers
INCLUDE "game/bank05_screens.asm"

; Data / padding
INCLUDE "data/bank06_padding.asm"

; Graphics
INCLUDE "graphics/bank07_gfx_loader.asm"
INCLUDE "graphics/bank08_level_data.asm"
INCLUDE "graphics/bank09_level_data.asm"
INCLUDE "graphics/bank0a_level_data.asm"
INCLUDE "graphics/bank0b_level_data.asm"
INCLUDE "graphics/bank0c_tiles.asm"
INCLUDE "graphics/bank0d_tiles.asm"
INCLUDE "graphics/bank0e_tiles.asm"

; Data / padding
INCLUDE "data/bank0f_padding.asm"

; GBC colorization extensions
INCLUDE "extensions/bank10_gbc_colorization.asm"
