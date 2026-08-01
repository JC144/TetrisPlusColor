; ============================================================================
; bank00/01_boot_stubs.asm — $0150-$0204: boot entry + cross-bank stub table (Call_000_0153..0201)
; Part of SECTION "ROM Bank $000"; included in order by bank00_core_engine.asm.
; ============================================================================
ASSERT @ == $0150 ; post-header boot entry, jumped to from GBC_BootHardwareCheck
Jump_000_0150:
    jp Jump_000_0204


Call_000_0153:
Jump_000_0153:
    jp Jump_000_0351


Call_000_0156:
Jump_000_0156:
    jp Jump_000_035b


Call_000_0159:
    jp Jump_000_0367


Call_000_015c:
    jp Jump_000_036e


    jp Jump_000_0375


Call_000_0162:
    jp Jump_000_038d


Call_000_0165:
Jump_000_0165:
    jp Jump_000_0399


Call_000_0168:
    jp Jump_000_03a3


Call_000_016b:
    jp Jump_000_0381


Call_000_016e:
    jp Jump_000_03b1


Call_000_0171:
    jp Jump_000_03b8


Call_000_0174:
    jp Jump_000_03bf


Call_000_0177:
    jp Jump_000_03c6


Call_000_017a:
    jp Jump_000_03d0


Call_000_017d:
    jp Jump_000_03da


Call_000_0180:
    jp Jump_000_03e4


Call_000_0183:
    jp Jump_000_03ee


Call_000_0186:
    jp Jump_000_03f8


Call_000_0189:
    jp Jump_000_0402


Call_000_018c:
    jp Jump_000_040c


Call_000_018f:
    jp Jump_000_0416


Call_000_0192:
    jp Jump_000_0420


Call_000_0195:
    jp Jump_000_042a


Call_000_0198:
    jp Jump_000_1a1a


Call_000_019b:
    jp Jump_000_0436


Call_000_019e:
    jp Jump_000_0440


Call_000_01a1:
Jump_000_01a1:
    jp Jump_000_044a


Call_000_01a4:
    jp Jump_000_0454


Call_000_01a7:
    jp Jump_000_0460


    jp Jump_000_046c


Call_000_01ad:
    jp Jump_000_0476


Call_000_01b0:
    jp Jump_000_0480


Call_000_01b3:
    jp Jump_000_048a


Call_000_01b6:
    jp Jump_000_0494


Call_000_01b9:
    jp Jump_000_049e


Call_000_01bc:
    jp Jump_000_04a8


Call_000_01bf:
    jp Jump_000_04b2


Call_000_01c2:
    jp Jump_000_04bc


Call_000_01c5:
    jp Jump_000_04c6


Call_000_01c8:
    jp Jump_000_04d0


Call_000_01cb:
    jp Jump_000_04da


Call_000_01ce:
    jp Jump_000_04e4


Call_000_01d1:
    jp Jump_000_04ee


Call_000_01d4:
    jp Jump_000_04f8


Call_000_01d7:
    jp Jump_000_0502


Call_000_01da:
    jp Jump_000_050c


Call_000_01dd:
    jp Jump_000_0516


Call_000_01e0:
    jp Jump_000_0520


Call_000_01e3:
    jp Jump_000_052a


Call_000_01e6:
    jp Jump_000_0534


Call_000_01e9:
    jp Jump_000_053e


Call_000_01ec:
    jp Jump_000_0548


Call_000_01ef:
    jp Jump_000_0552


Call_000_01f2:
    jp Jump_000_055c


Call_000_01f5:
    jp Jump_000_0566


Call_000_01f8:
    jp Jump_000_056d


Call_000_01fb:
    jp Jump_000_0574


Call_000_01fe:
    jp Jump_000_057e


Call_000_0201:
    jp Jump_000_0588


