; ============================================================================
; Label Definitions for Tetris Plus GBC
; ============================================================================
; This file defines symbolic constants for RAM addresses and ROM data tables
; to replace hardcoded addresses throughout the codebase.
;
; Created: 2026-02-09
; Purpose: Make codebase maintainable and size-independent
; ============================================================================


; ============================================================================
; RAM Address Labels
; ============================================================================

; System flags
DEF INIT_COMPLETE_FLAG   EQU $c5fe  ; Initialization complete flag

; Game state machine
DEF GAME_STATE           EQU $c5a1  ; Main game state ($01=Title, $02=ModeSelect, $04=Gameplay, etc.)
DEF SCREEN_SUBSTATE      EQU $c5a2  ; Sub-state index into screen handler jump table (0-16)
DEF ANIM_FRAME           EQU $c5a3  ; Animation frame counter (0-180, incremented per frame)
DEF GAME_MODE            EQU $c7af  ; Game mode/difficulty flags

; Rendering
DEF RENDER_FLAGS         EQU $c5c8  ; Rendering dispatch flags
DEF RENDER_REQUEST       EQU $c5c9  ; Screen redraw request flag (1=redraw needed)
DEF RENDER_STATE         EQU $c5db  ; Render state flags

; Puzzle-mode state block ($c6c6-$c6d7) — NOT falling-piece state
; (the falling piece lives in entity 1 at $c0c0; verified at runtime 2026-07-03)
DEF PRESS_DEPTH          EQU $c6c6  ; Press descent depth (puzzle modes)
; Professor action queue: 4 slots, dispatcher at $30ad (entity f5=$53) runs the
; first non-zero code via jump table $30e2 ($0b=fall/death, $0c=exit/victory)
DEF PROF_ACTION1         EQU $c6c9
DEF PROF_ACTION2         EQU $c6ca
DEF PROF_ACTION3         EQU $c6cb
DEF PROF_ACTION4         EQU $c6cc

; Collision/movement
DEF MOVE_RESULT          EQU $c65d  ; Move validation result (0=fail, 1-2=success)

; Sound
DEF SOUND_CONTROL        EQU $cb96  ; Sound engine control register

; Score system
DEF SCORE_BCD_BUFFER     EQU $c731  ; BCD score buffer start

; Display memory
DEF OAM_BUFFER           EQU $fe00  ; Sprite attribute table (OAM)
DEF HRAM_START           EQU $ff80  ; High RAM start
DEF SHADOW_OAM           EQU $c000  ; Shadow OAM buffer (40 x 4 bytes), DMA'd in VBlank

; DMG palette shadows (game's original fade/flash mechanism, applied each
; VBlank by Call_000_02d3; on CGB they drive the palette remap in bank10)
DEF BGP_SHADOW           EQU $c5f0
DEF OBP0_SHADOW          EQU $c5f1
DEF OBP1_SHADOW          EQU $c5f2

; ============================================================================
; GBC colorization engine state (pages $cd00-$cfff, verified unused by game)
; ============================================================================
DEF wPalStagingBG        EQU $cd00  ; 64 bytes: fade-mapped BG palettes (VBlank uploads)
DEF wPalStagingOBJ       EQU $cd40  ; 64 bytes: fade-mapped OBJ palettes
DEF wCurDescId           EQU $cd80  ; current screen color descriptor ($FF = none)
DEF wCurDescPtr          EQU $cd81  ; 2 bytes: bank10 pointer to current descriptor
DEF wLastBGP             EQU $cd83  ; last seen DMG shadow values (change detect)
DEF wLastOBP0            EQU $cd84
DEF wLastOBP1            EQU $cd85
DEF wPalDirty            EQU $cd86  ; 1 = staging palettes need CRAM upload (VBlank)
DEF wFadeReq             EQU $cd87  ; 1 = recompute staging from base + DMG shadows
DEF wChrEntry            EQU $cd88  ; CHR dispatch entry id being loaded (tile patches)
DEF wFading              EQU $cd89  ; 1 = per-frame RGB555 fade stepping active
DEF wSnapReq             EQU $cd8a  ; 1 = next palette recompute is instant (no lerp)
DEF wFadePhase           EQU $cd8b  ; 0-3: which palette quarter steps this frame
DEF wFadeMoved           EQU $cd8c  ; 1 = something moved in current stepping cycle
DEF wFadeScratch         EQU $cd8d  ; 3 bytes: StepPalettes target color + moved flag
DEF wGDMARequest         EQU $cd90  ; VBlank GDMA request bits: bit0 = tilemap+attrs
                                    ; full-screen flip, bit1 = vignette CHR upload
                                    ; (one request served per VBlank, bit0 first)
DEF wGDMARowCnt          EQU $cd91  ; row counter for GBC_PrepareGDMAFlip
DEF wCurMapId            EQU $cd92  ; RLE map id of the last RenderTilemapCell call
                                    ; (set by Bank10_OnMapLoad, read by map remaps)
DEF wCloudTimer          EQU $cd93  ; 16-bit LE: title-screen cloud drift counter
DEF wCloudsOn            EQU $cd95  ; 1 = cloud sprites occupy shadow-OAM slots 31-39
DEF wAttrRowTemp         EQU $cda0  ; 32 bytes ($cda0-$cdbf): one tilemap row, ids then attrs
; WRAM bank 2 (SVBK=2) staging. The original DMG game never touches rSVBK,
; so banks 2-7 are entirely free.
;   $d000-$d23f  full-screen attribute mirror (same layout as the $d000
;                tilemap shadow in bank 1)
;   $d300-$d83f  CHR staging for the mode-select vignette ($540 bytes,
;                GDMA'd to $9000 by GBC_GDMADispatch)
DEF wChrStaging          EQU $d300
DEF wBGAttrLUT           EQU $ce00  ; 256 bytes page-aligned: tile-ID -> BG attribute
DEF wOBJPalLUT           EQU $cf00  ; 256 bytes page-aligned: tile-ID -> OBJ palette (0-3)


; ============================================================================
; ROM Data Table Labels (to be added incrementally)
; ============================================================================

; Jump tables in bank_002
; These are used for indirect jumps via computed addresses
DEF JumpTable_002_4032   EQU $4032  ; Primary dispatch table
DEF JumpTable_002_408a   EQU $408a  ; Secondary dispatch table
DEF JumpTable_002_410d   EQU $410d  ; Tertiary dispatch table
DEF JumpTable_002_4136   EQU $4136  ; Quaternary dispatch table
DEF JumpTable_002_41be   EQU $41be  ; Quinary dispatch table

; Data table in bank_000
DEF DataTable_000_05a5   EQU $05a5  ; State dispatch table
