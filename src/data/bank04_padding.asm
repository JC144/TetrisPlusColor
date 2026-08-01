; ============================================================================
; BANK $04 - Padding (Empty)
; ============================================================================
; Address: $4000-$7FFF (switchable)
;
; Empty padding bank ($00 bytes only). Not referenced by any game code.
; Can be repurposed for future extensions.
;
; Status: 16384/16384 bytes available (100% empty)
; ============================================================================
; Originally disassembled with mgbdis v3.0 by Matt Currie

SECTION "ROM Bank $004", ROMX[$4000], BANK[$4]

    ds $4000, 0 ; entire bank empty ($00), reusable for future extensions
