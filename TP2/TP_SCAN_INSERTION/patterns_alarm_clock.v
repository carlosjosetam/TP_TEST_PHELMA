STIL 1.0 { Design 2005; }
Header {
   Title "  TetraMAX (TM)  H-2013.03-SP5-i131018_232903 STIL output";
   Date "Sun Nov 16 16:23:26 2014";
   Source "Minimal STIL for design `CORE'";
   History {
      Ann {*  Sun Nov 16 16:14:12 2014  *}
      Ann {*  DFT Compiler H-2013.03-SP4  *}
      Ann {*   Uncollapsed Transition Fault Summary Report *}
      Ann {* ----------------------------------------------- *}
      Ann {* fault class                     code   #faults *}
      Ann {* ------------------------------  ----  --------- *}
      Ann {* Detected                         DT       2747 *}
      Ann {* Possibly detected                PT         38 *}
      Ann {* Undetectable                     UD          2 *}
      Ann {* ATPG untestable                  AU         81 *}
      Ann {* Not detected                     ND          0 *}
      Ann {* ----------------------------------------------- *}
      Ann {* total faults                              2868 *}
      Ann {* test coverage                            96.51% *}
      Ann {* ----------------------------------------------- *}
      Ann {*  *}
      Ann {*            Pattern Summary Report *}
      Ann {* ----------------------------------------------- *}
      Ann {* #internal patterns                         240 *}
      Ann {*     #full_sequential patterns              240 *}
      Ann {* ----------------------------------------------- *}
      Ann {*  *}
      Ann {* rule  severity  #fails  description *}
      Ann {* ----  --------  ------  --------------------------------- *}
      Ann {* N16   warning        1  overspecified UDP *}
      Ann {* B7    warning        2  undriven module output pin *}
      Ann {* B10   warning        6  unconnected module internal net *}
      Ann {* Z2    warning       11  bus capable of holding Z state *}
      Ann {*  *}
      Ann {* clock_name        off  usage *}
      Ann {* ----------------  ---  -------------------------- *}
      Ann {* CLOCK              0   master shift  *}
      Ann {* RESETN             1   master set reset  *}
      Ann {*  *}
      Ann {* port_name         constraint_value *}
      Ann {* ----------------  --------------- *}
      Ann {* TEST_MODE           1 *}
      Ann {*  *}
      Ann {* There are no equivalent pins *}
      Ann {* There are no net connections *}
      Ann {* Unified STIL Flow *}
      Ann {* serial_flag = 0 *}
   }
}
Signals {
   "SET_TIME" In; "ALARM" In; "HOURS" In; "MINUTES" In; "TOGGLE" In; "CLOCK" In; "RESETN" In;
   "TEST_MODE" In; "TEST_SE" In; "TEST_SI" In { ScanIn; } "SPEAKER" Out { ScanOut;
   } "HR[13]" Out; "HR[12]" Out; "HR[11]" Out; "HR[10]" Out; "HR[9]" Out; "HR[8]" Out;
   "HR[7]" Out; "HR[6]" Out; "HR[5]" Out; "HR[4]" Out; "HR[3]" Out; "HR[2]" Out; "HR[1]" Out;
   "HR[0]" Out; "MIN[13]" Out; "MIN[12]" Out; "MIN[11]" Out; "MIN[10]" Out; "MIN[9]" Out;
   "MIN[8]" Out; "MIN[7]" Out; "MIN[6]" Out; "MIN[5]" Out; "MIN[4]" Out; "MIN[3]" Out;
   "MIN[2]" Out; "MIN[1]" Out; "MIN[0]" Out; "AM_PM" Out;
}
SignalGroups {
   "_pi" = '"ALARM" + "CLOCK" + "HOURS" + "MINUTES" + "RESETN" + "SET_TIME" +
   "TEST_MODE" + "TEST_SE" + "TEST_SI" + "TOGGLE"'; // #signals=10
   "_in" = '"SET_TIME" + "ALARM" + "HOURS" + "MINUTES" + "TOGGLE" + "CLOCK" +
   "RESETN" + "TEST_MODE" + "TEST_SE" + "TEST_SI"'; // #signals=10
   "all_inputs" = '"ALARM" + "CLOCK" + "HOURS" + "MINUTES" + "RESETN" +
   "SET_TIME" + "TEST_MODE" + "TEST_SE" + "TEST_SI" + "TOGGLE"'; // #signals=10
   "_po" = '"AM_PM" + "HR[0]" + "HR[10]" + "HR[11]" + "HR[12]" + "HR[13]" +
   "HR[1]" + "HR[2]" + "HR[3]" + "HR[4]" + "HR[5]" + "HR[6]" + "HR[7]" + "HR[8]" +
   "HR[9]" + "MIN[0]" + "MIN[10]" + "MIN[11]" + "MIN[12]" + "MIN[13]" + "MIN[1]" +
   "MIN[2]" + "MIN[3]" + "MIN[4]" + "MIN[5]" + "MIN[6]" + "MIN[7]" + "MIN[8]" +
   "MIN[9]" + "SPEAKER"'; // #signals=30
   "_si" = '"TEST_SI"' { ScanIn; } // #signals=1
   "all_outputs" = '"AM_PM" + "HR[0]" + "HR[10]" + "HR[11]" + "HR[12]" +
   "HR[13]" + "HR[1]" + "HR[2]" + "HR[3]" + "HR[4]" + "HR[5]" + "HR[6]" +
   "HR[7]" + "HR[8]" + "HR[9]" + "MIN[0]" + "MIN[10]" + "MIN[11]" + "MIN[12]" +
   "MIN[13]" + "MIN[1]" + "MIN[2]" + "MIN[3]" + "MIN[4]" + "MIN[5]" + "MIN[6]" +
   "MIN[7]" + "MIN[8]" + "MIN[9]" + "SPEAKER"'; // #signals=30
   "all_ports" = '"all_inputs" + "all_outputs"'; // #signals=40
   "_clk" = '"CLOCK" + "RESETN"'; // #signals=2
   "_so" = '"SPEAKER"' { ScanOut; } // #signals=1
   "_out" = '"SPEAKER" + "HR[13]" + "HR[12]" + "HR[11]" + "HR[10]" + "HR[9]" +
   "HR[8]" + "HR[7]" + "HR[6]" + "HR[5]" + "HR[4]" + "HR[3]" + "HR[2]" + "HR[1]" +
   "HR[0]" + "MIN[13]" + "MIN[12]" + "MIN[11]" + "MIN[10]" + "MIN[9]" + "MIN[8]" +
   "MIN[7]" + "MIN[6]" + "MIN[5]" + "MIN[4]" + "MIN[3]" + "MIN[2]" + "MIN[1]" +
   "MIN[0]" + "AM_PM"'; // #signals=30
}
Timing {
   WaveformTable "_allclock_launch_capture_WFT_" {
      Period '100ns';
      Waveforms {
         "all_inputs" { 0 { '0ns' D; } }
         "all_inputs" { 1 { '0ns' U; } }
         "all_inputs" { Z { '0ns' Z; } }
         "all_inputs" { N { '0ns' N; } }
         "all_outputs" { X { '0ns' X; '40ns' X; } }
         "all_outputs" { H { '0ns' X; '40ns' H; } }
         "all_outputs" { L { '0ns' X; '40ns' L; } }
         "all_outputs" { T { '0ns' X; '40ns' T; } }
         "CLOCK" { P { '0ns' D; '45ns' U; '55ns' D; } }
         "RESETN" { P { '0ns' U; '45ns' D; '55ns' U; } }
      }
   }
   WaveformTable "_multiclock_capture_WFT_" {
      Period '100ns';
      Waveforms {
         "all_inputs" { 0 { '0ns' D; } }
         "all_inputs" { 1 { '0ns' U; } }
         "all_inputs" { Z { '0ns' Z; } }
         "all_inputs" { N { '0ns' N; } }
         "all_outputs" { X { '0ns' X; '40ns' X; } }
         "all_outputs" { H { '0ns' X; '40ns' H; } }
         "all_outputs" { L { '0ns' X; '40ns' L; } }
         "all_outputs" { T { '0ns' X; '40ns' T; } }
         "CLOCK" { P { '0ns' D; '45ns' U; '55ns' D; } }
         "RESETN" { P { '0ns' U; '45ns' D; '55ns' U; } }
      }
   }
   WaveformTable "_allclock_launch_WFT_" {
      Period '100ns';
      Waveforms {
         "all_inputs" { 0 { '0ns' D; } }
         "all_inputs" { 1 { '0ns' U; } }
         "all_inputs" { Z { '0ns' Z; } }
         "all_inputs" { N { '0ns' N; } }
         "all_outputs" { X { '0ns' X; '40ns' X; } }
         "all_outputs" { H { '0ns' X; '40ns' H; } }
         "all_outputs" { L { '0ns' X; '40ns' L; } }
         "all_outputs" { T { '0ns' X; '40ns' T; } }
         "CLOCK" { P { '0ns' D; '45ns' U; '55ns' D; } }
         "RESETN" { P { '0ns' U; '45ns' D; '55ns' U; } }
      }
   }
   WaveformTable "_allclock_capture_WFT_" {
      Period '100ns';
      Waveforms {
         "all_inputs" { 0 { '0ns' D; } }
         "all_inputs" { 1 { '0ns' U; } }
         "all_inputs" { Z { '0ns' Z; } }
         "all_inputs" { N { '0ns' N; } }
         "all_outputs" { X { '0ns' X; '40ns' X; } }
         "all_outputs" { H { '0ns' X; '40ns' H; } }
         "all_outputs" { L { '0ns' X; '40ns' L; } }
         "all_outputs" { T { '0ns' X; '40ns' T; } }
         "CLOCK" { P { '0ns' D; '45ns' U; '55ns' D; } }
         "RESETN" { P { '0ns' U; '45ns' D; '55ns' U; } }
      }
   }
   WaveformTable "_default_WFT_" {
      Period '100ns';
      Waveforms {
         "all_inputs" { 0 { '0ns' D; } }
         "all_inputs" { 1 { '0ns' U; } }
         "all_inputs" { Z { '0ns' Z; } }
         "all_inputs" { N { '0ns' N; } }
         "all_outputs" { X { '0ns' X; '40ns' X; } }
         "all_outputs" { H { '0ns' X; '40ns' H; } }
         "all_outputs" { L { '0ns' X; '40ns' L; } }
         "all_outputs" { T { '0ns' X; '40ns' T; } }
         "CLOCK" { P { '0ns' D; '45ns' U; '55ns' D; } }
         "RESETN" { P { '0ns' U; '45ns' D; '55ns' U; } }
      }
   }
}
ScanStructures {
   ScanChain "1" {
      ScanLength 40;
      ScanIn "TEST_SI";
      ScanOut "SPEAKER";
      ScanInversion 1;
      ScanCells "CORE.U1.U1.U1.CURRENT_STATE_reg_0_.SD" ! "CORE.U1.U1.U1.CURRENT_STATE_reg_1_.SD" !
      "CORE.U1.U1.U1.HOURS_reg.SD" ! "CORE.U1.U1.U1.MINS_reg.SD" ! "CORE.U1.U1.U1.SECS_reg.SD" !
      "CORE.U1.U1.U2.AM_PM_OUT_reg.SD" ! "CORE.U1.U1.U2.CURRENT_SECS_reg_0_.SD" 
      "CORE.U1.U1.U2.CURRENT_SECS_reg_1_.SD" "CORE.U1.U1.U2.CURRENT_SECS_reg_2_.SD" !
      "CORE.U1.U1.U2.CURRENT_SECS_reg_3_.SD" ! "CORE.U1.U1.U2.CURRENT_SECS_reg_4_.SD" !
      "CORE.U1.U1.U2.CURRENT_SECS_reg_5_.SD" ! "CORE.U1.U1.U2.HOURS_OUT_reg_0_.SD" 
      "CORE.U1.U1.U2.HOURS_OUT_reg_1_.SD" "CORE.U1.U1.U2.HOURS_OUT_reg_2_.SD" ! 
      "CORE.U1.U1.U2.HOURS_OUT_reg_3_.SD" ! "CORE.U1.U1.U2.MINUTES_OUT_reg_0_.SD" !
      "CORE.U1.U1.U2.MINUTES_OUT_reg_1_.SD" "CORE.U1.U1.U2.MINUTES_OUT_reg_2_.SD" !
      "CORE.U1.U1.U2.MINUTES_OUT_reg_3_.SD" ! "CORE.U1.U1.U2.MINUTES_OUT_reg_4_.SD" !
      "CORE.U1.U1.U2.MINUTES_OUT_reg_5_.SD" ! "CORE.U1.U2.U0.CURRENT_STATE_reg_0_.SD" !
      "CORE.U1.U2.U0.CURRENT_STATE_reg_1_.SD" ! "CORE.U1.U2.U0.HOURS_reg.SD" ! 
      "CORE.U1.U2.U0.MINS_reg.SD" ! "CORE.U1.U2.U3.AM_PM_OUT_reg.SD" ! 
      "CORE.U1.U2.U3.HRS_OUT_reg_0_.SD" ! "CORE.U1.U2.U3.HRS_OUT_reg_1_.SD" ! 
      "CORE.U1.U2.U3.HRS_OUT_reg_2_.SD" "CORE.U1.U2.U3.HRS_OUT_reg_3_.SD" 
      "CORE.U1.U2.U3.MINUTES_OUT_reg_0_.SD" ! "CORE.U1.U2.U3.MINUTES_OUT_reg_1_.SD" !
      "CORE.U1.U2.U3.MINUTES_OUT_reg_2_.SD" "CORE.U1.U2.U3.MINUTES_OUT_reg_3_.SD" !
      "CORE.U1.U2.U3.MINUTES_OUT_reg_4_.SD" ! "CORE.U1.U2.U3.MINUTES_OUT_reg_5_.SD" !
      "CORE.U1.U7.COUNT_reg.SD" "CORE.U1.U7.INT_CLK_reg.SD" "CORE.U1.U5.CURRENT_STATE_reg.SD" ;
      ScanMasterClock "CLOCK" ;
   }
}
PatternBurst "_burst_" {
   PatList { "_pattern_" {
   }
}}
PatternExec {
   PatternBurst "_burst_";
}
Procedures {
   "multiclock_capture" {
      W "_multiclock_capture_WFT_";
      C { "all_inputs"=N0NN1N1NNN; "all_outputs"=\r30 X ; }
      F { "TEST_MODE"=1; }
      V { "_pi"=\r10 # ; "_po"=\r30 # ; }
   }
   "allclock_capture" {
      W "_allclock_capture_WFT_";
      C { "all_inputs"=N0NN1N1NNN; "all_outputs"=\r30 X ; }
      F { "TEST_MODE"=1; }
      V { "_pi"=\r10 # ; "_po"=\r30 # ; }
   }
   "allclock_launch" {
      W "_allclock_launch_WFT_";
      C { "all_inputs"=N0NN1N1NNN; "all_outputs"=\r30 X ; }
      F { "TEST_MODE"=1; }
      V { "_pi"=\r10 # ; "_po"=\r30 # ; }
   }
   "allclock_launch_capture" {
      W "_allclock_launch_capture_WFT_";
      C { "all_inputs"=N0NN1N1NNN; "all_outputs"=\r30 X ; }
      F { "TEST_MODE"=1; }
      V { "_pi"=\r10 # ; "_po"=\r30 # ; }
   }
   "load_unload" {
      W "_default_WFT_";
      C { "all_inputs"=N0NN1N1NNN; "all_outputs"=\r30 X ; }
      "Internal_scan_pre_shift": V { "TEST_SE"=1; }
      Shift {          W "_default_WFT_";
         V { "_clk"=P1; "_si"=#; "_so"=#; }
      }
   }
}
MacroDefs {
   "test_setup" {
      W "_default_WFT_";
      C { "all_inputs"=\r10 N ; "all_outputs"=\r30 X ; }
      V { "CLOCK"=0; "RESETN"=1; "TEST_MODE"=1; }
      V { }
   }
}
Pattern "_pattern_" {
   W "_multiclock_capture_WFT_";
   "precondition all Signals": C { "_pi"=\r10 0 ; "_po"=\r30 X ; }
   Macro "test_setup";
   Ann {* full_sequential *}
   "pattern 0": Call "load_unload" { 
      "TEST_SI"=0001111000000010000010000110010011110111; }
   Call "allclock_launch" { 
      "_pi"=0P00111101; }
   Call "allclock_capture" { 
      "_pi"=1P11111001; }
   Ann {* full_sequential *}
   "pattern 1": Call "load_unload" { 
      "SPEAKER"=HLXLLLHHHHHHLLHLHLHLHHHHLLHLLHLHHHLLLHLH; "TEST_SI"=0110111001100101000101101011010111100000; }
   Call "allclock_launch" { 
      "_pi"=0P01111100; }
   Call "allclock_capture" { 
      "_pi"=1P00111001; }
   Ann {* full_sequential *}
   "pattern 2": Call "load_unload" { 
      "SPEAKER"=LHXLLLHHLLHHLHHLHLHLHLLHHLLLLHLHHHHLLHLH; "TEST_SI"=1110100110000001101011000100010011011010; }
   Call "allclock_launch" { 
      "_pi"=0P01111010; }
   Call "allclock_capture" { 
      "_pi"=1P10111000; }
   Ann {* full_sequential *}
   "pattern 3": Call "load_unload" { 
      "SPEAKER"=LXXHLHHLLHHHHHHHHHHLHLLHLHHLLHLHHHLLLHLH; "TEST_SI"=0101011110100010110010011011011111101100; }
   Call "allclock_launch" { 
      "_pi"=1010P11100; }
   Call "allclock_capture" { 
      "_pi"=0011101010; "_po"=HHTHHTLHHLHHTTTLLLLLLLLLLLLLLL; }
   Ann {* full_sequential *}
   "pattern 4": Call "load_unload" { 
      "SPEAKER"=LLLHLHHLHLLLHLHLHLHLHLLHHLHHLHLHHHLHLHLH; "TEST_SI"=0110111110111010010000110011110010110110; }
   Call "allclock_launch" { 
      "_pi"=1P01101100; }
   Call "allclock_capture" { 
      "_pi"=1P10101000; }
   Ann {* full_sequential *}
   "pattern 5": Call "load_unload" { 
      "SPEAKER"=LHXLLLLLHHHLLHHLHLHHHLLHLHHHLHLHHHLLLHLH; "TEST_SI"=1000001100001101100011000101100100001110; }
   Call "allclock_launch" { 
      "_pi"=1000P11110; }
   Call "allclock_capture" { 
      "_pi"=1001101000; "_po"=HHTHHTLHHLHHTTTLLLLLLLLLLLLLLL; }
   Ann {* full_sequential *}
   "pattern 6": Call "load_unload" { 
      "SPEAKER"=LLLHLHHLHLLLHLHLHLHLHLLHHLHHLHLHHHLHLHLH; "TEST_SI"=1001110100010000010101101011101001111100; }
   Call "allclock_launch" { 
      "_pi"=0P00111110; }
   Call "allclock_capture" { 
      "_pi"=1P11111001; }
   Ann {* full_sequential *}
   "pattern 7": Call "load_unload" { 
      "SPEAKER"=HLXLLHLHHHLHLHHLHLHLHLLHLHHHLHLHHHLHLHLH; "TEST_SI"=0111100000101000001101101101100010000000; }
   Call "allclock_launch" { 
      "_pi"=0P10111111; }
   Call "allclock_capture" { 
      "_pi"=1P10111001; }
   Ann {* full_sequential *}
   "pattern 8": Call "load_unload" { 
      "SPEAKER"=LLXLHHHHHLHLLHHHHHHLHLLHLLHHLHLHHHHHLHLH; "TEST_SI"=1010101001010101100100001110001110000010; }
   Call "allclock_launch" { 
      "_pi"=0P00101100; }
   Call "allclock_capture" { 
      "_pi"=1P10111000; }
   Ann {* full_sequential *}
   "pattern 9": Call "load_unload" { 
      "SPEAKER"=LHXHLHHLHLHLHHHLHHLHHHHLLLHHHLLLHHHLLHLH; "TEST_SI"=1110101100101111000111100001001001000001; }
   Call "allclock_launch" { 
      "_pi"=0P00101011; }
   Call "allclock_capture" { 
      "_pi"=0000111011; "_po"=LHTLLTHLHHHHTTTHHHHHHLHHHHLHHL; }
   Ann {* full_sequential *}
   "pattern 10": Call "load_unload" { 
      "SPEAKER"=LLXHLHLLLHLHLLHLHLHLLLLLHHHLLHLHHHHHLHLH; "TEST_SI"=0110101000001001100010111001011110000011; }
   Call "allclock_launch" { 
      "_pi"=0P00111011; }
   Call "allclock_capture" { 
      "_pi"=0010101000; "_po"=LLTLLTLLLHHLTTTLHHHHHHHHHHHLLH; }
   Ann {* full_sequential *}
   "pattern 11": Call "load_unload" { 
      "SPEAKER"=HLXHLHLHHHHHLHHLHLHHLHHHLHHLLHLHHHHLLHLH; "TEST_SI"=0101110011101001011000010110001011100010; }
   Call "allclock_launch" { 
      "_pi"=0P00101010; }
   Call "allclock_capture" { 
      "_pi"=0011101010; "_po"=HHTHHTHLLHHLTTTHHHLHHHHHLLHHLL; }
   Ann {* full_sequential *}
   "pattern 12": Call "load_unload" { 
      "SPEAKER"=LHXLLLHHLLLHLHHLHLLHLLLHHLLHLHLHHHLLLHLH; "TEST_SI"=0001110011010111101110011011010110010011; }
   Call "multiclock_capture" { 
      "_pi"=1P10111010; }
   Call "allclock_launch_capture" { 
      "_pi"=1P00111010; }
   Ann {* full_sequential *}
   "pattern 13": Call "load_unload" { 
      "SPEAKER"=LXXLLLLLHLHLHLHLHLLLLHHLLHLLHLHLLHHLLHLH; "TEST_SI"=0000001001001100000110110111111111010100; }
   Call "allclock_launch" { 
      "_pi"=1P10101011; }
   Call "allclock_capture" { 
      "_pi"=0001111010; "_po"=LHTHHTHLHHLHTTTHLHHLLLHHHHLLLH; }
   Ann {* full_sequential *}
   "pattern 14": Call "load_unload" { 
      "SPEAKER"=HHXHHHLHHLLLHLHLHHHLLHLLHLLLLLLLLLHLLHLH; "TEST_SI"=1000011011101111111101011010100011111101; }
   Call "allclock_launch" { 
      "_pi"=1P11111010; }
   Call "allclock_capture" { 
      "_pi"=0001111001; "_po"=HHTLLTLHHLHHTTTHHHHHHLHHLHHLLL; }
   Ann {* full_sequential *}
   "pattern 15": Call "load_unload" { 
      "SPEAKER"=LHXLLHHLHLLHLLHLHLLLHLHLLHLHLHHHLLLHLHLH; "TEST_SI"=0010101001011001101110100011100110111001; }
   Call "allclock_launch" { 
      "_pi"=0P00101100; }
   Call "allclock_capture" { 
      "_pi"=0P01111011; }
   Ann {* full_sequential *}
   "pattern 16": Call "load_unload" { 
      "SPEAKER"=HHXHLHHLHHLLLHHLHLLLHLHHHLLLHHLLHLLHHHHH; "TEST_SI"=0011110100111100101100000011001000001111; }
   Call "allclock_launch" { 
      "_pi"=0P00101010; }
   Call "allclock_capture" { 
      "_pi"=0001111010; "_po"=LHTHHTLHHLHHTTTHHHHHHHHHHHHLLL; }
   Ann {* full_sequential *}
   "pattern 17": Call "load_unload" { 
      "SPEAKER"=LLXLLLHLHHLHHLHLHLLLHHHHHLHHLHLHHHHLLHLH; "TEST_SI"=0000100000010111110101111000101101100000; }
   Call "allclock_launch" { 
      "_pi"=0P00111000; }
   Call "allclock_capture" { 
      "_pi"=1P10111001; }
   Ann {* full_sequential *}
   "pattern 18": Call "load_unload" { 
      "SPEAKER"=LXXHLHHHLHHLHLHHHHHLHLHHLHHHLHLHHLLHLLLL; "TEST_SI"=1011100001101000101011010110010011101110; }
   Call "allclock_launch" { 
      "_pi"=0P01111001; }
   Call "allclock_capture" { 
      "_pi"=0P01101000; }
   Ann {* full_sequential *}
   "pattern 19": Call "load_unload" { 
      "SPEAKER"=LXXLLHHHHHHLHHHLHLHLHLLHLHHHLHLHHHLLLHLH; "TEST_SI"=1010101000010110110001100111010110001110; }
   Call "allclock_launch" { 
      "_pi"=0P10111001; }
   Call "allclock_capture" { 
      "_pi"=1P00101011; }
   Ann {* full_sequential *}
   "pattern 20": Call "load_unload" { 
      "SPEAKER"=LXXHLHLHHHHLHLHLHLHHHLLHLHHLLHLHHHHLLHLH; "TEST_SI"=0100000000001001110011111011111000000011; }
   Call "allclock_launch" { 
      "_pi"=0P01101010; }
   Call "allclock_capture" { 
      "_pi"=0011101010; "_po"=LHTLLTLLHHHHTTTHHLHHHHHHLLHLHL; }
   Ann {* full_sequential *}
   "pattern 21": Call "load_unload" { 
      "SPEAKER"=LHXHHHHHHHHHLHHLHLHHLLHHLHLLLHLHHHHLLHLH; "TEST_SI"=1011011011001011010011000000110011111000; }
   Call "allclock_launch" { 
      "_pi"=1P01101010; }
   Call "allclock_capture" { 
      "_pi"=0P11111001; }
   Ann {* full_sequential *}
   "pattern 22": Call "load_unload" { 
      "SPEAKER"=LXXHLHHLLLHHLHHLHLHHLLHHHHHHLLHLHLLLLHLH; "TEST_SI"=0010101000110101101101011110110011101001; }
   Call "allclock_launch" { 
      "_pi"=0P00101110; }
   Call "allclock_capture" { 
      "_pi"=0P11111001; }
   Ann {* full_sequential *}
   "pattern 23": Call "load_unload" { 
      "SPEAKER"=HHXLHLHHLLLHLHHLHLLHLHLLLLHLLHHLLLHLLHLH; "TEST_SI"=0100011000110001011101101101101001111101; }
   Call "allclock_launch" { 
      "_pi"=0P10111100; }
   Call "allclock_capture" { 
      "_pi"=0P11101000; }
   Ann {* full_sequential *}
   "pattern 24": Call "load_unload" { 
      "SPEAKER"=LHXHLLHHHLLHHHHLHLHLHLLHLLHHLHLHHHLLLHLH; "TEST_SI"=1011010001110100110110001011111110101010; }
   Call "allclock_launch" { 
      "_pi"=1P00111010; }
   Call "allclock_capture" { 
      "_pi"=1000111001; "_po"=LLTLLTLLLHHLTTTHHHLHHHHHHHHHLL; }
   Ann {* full_sequential *}
   "pattern 25": Call "load_unload" { 
      "SPEAKER"=LLXLHLHHHHHLLHHLHLHLLHHHLHLLLLLLLHLLLHLH; "TEST_SI"=0011001000100010101010101100110000000010; }
   Call "allclock_launch" { 
      "_pi"=0000P11111; }
   Call "allclock_capture" { 
      "_pi"=0001111001; "_po"=HHTHHTLHHLHHTTTLLLLLLLLLLLLLLL; }
   Ann {* full_sequential *}
   "pattern 26": Call "load_unload" { 
      "SPEAKER"=LLLHLHHLHLLLHLHLHLHLHLLHHLHHLHLHHHLHLHLH; "TEST_SI"=0100001101000010101011100110010011101001; }
   Call "allclock_launch" { 
      "_pi"=1000P01100; }
   Call "allclock_capture" { 
      "_pi"=1P00101000; }
   Ann {* full_sequential *}
   "pattern 27": Call "load_unload" { 
      "SPEAKER"=LLXHLHHLHLLLHLHLHLHLHLLHHLHHLHLHHHLLLHLH; "TEST_SI"=1010001010011110110010000010001000100001; }
   Call "allclock_launch" { 
      "_pi"=1010P11100; }
   Call "allclock_capture" { 
      "_pi"=1P00101011; }
   Ann {* full_sequential *}
   "pattern 28": Call "load_unload" { 
      "SPEAKER"=HLXHLHHLHLLLHLHLHLHLHLLHHLHHLHLHHHLLLHLH; "TEST_SI"=1100001110011011001011110110101001011111; }
   Call "allclock_launch" { 
      "_pi"=1P00101000; }
   Call "allclock_capture" { 
      "_pi"=0000111011; "_po"=LHTHHTHLLHHLTTTLHHLHLLLHHHHHLL; }
   Ann {* full_sequential *}
   "pattern 29": Call "load_unload" { 
      "SPEAKER"=LHXHHHLHHHHLLHHLHLLHLLLLHLLHLHLHHLHLLHLH; "TEST_SI"=0000001111111010111100010111001101100000; }
   Call "allclock_launch" { 
      "_pi"=0P10101011; }
   Call "allclock_capture" { 
      "_pi"=0010101011; "_po"=HHTHHTHLHHLHTTTLLHHLHHHHHHHHLH; }
   Ann {* full_sequential *}
   "pattern 30": Call "load_unload" { 
      "SPEAKER"=HHXHHHLLLLLLLHHLHLLLLLLHHLLLLHLHHHLLLHLH; "TEST_SI"=1000101011111000010110010100000001101010; }
   Call "allclock_launch" { 
      "_pi"=1P01101011; }
   Call "allclock_capture" { 
      "_pi"=1P10101011; }
   Ann {* full_sequential *}
   "pattern 31": Call "load_unload" { 
      "SPEAKER"=LXXHLLHLHLLHHHHLHLHLLHHLHLHHHHHHLHLLLHLH; "TEST_SI"=1100100001000001010010111110000111100010; }
   Call "allclock_launch" { 
      "_pi"=0P00111001; }
   Call "allclock_capture" { 
      "_pi"=1000101010; "_po"=LLTHHTHHHHHHTTTHHHHHLHHLHHLHHL; }
   Ann {* full_sequential *}
   "pattern 32": Call "load_unload" { 
      "SPEAKER"=LHXHLHHHHLHHHHHLHLHHLHHHLLLHLHLHHHLLLHLH; "TEST_SI"=1011111111010000000110010101011111010001; }
   Call "allclock_launch" { 
      "_pi"=0011P11001; }
   Call "allclock_capture" { 
      "_pi"=0010111001; "_po"=HHTHHTLHHLHHTTTLLLLLLLLLLLLLLL; }
   Ann {* full_sequential *}
   "pattern 33": Call "load_unload" { 
      "SPEAKER"=LLLHLHHLHLLLHLHLHLHLHLLHHLHHLHLHHHLHLHLH; "TEST_SI"=1010011011110100100001001111111010011001; }
   Call "multiclock_capture" { 
      "_pi"=0P01111110; }
   Call "allclock_launch_capture" { 
      "_pi"=1P10111001; }
   Ann {* full_sequential *}
   "pattern 34": Call "load_unload" { 
      "SPEAKER"=HHXHLLHLLLLHLHHLHHHHLHHLLLLLLLHLHHLHLHLL; "TEST_SI"=0110110010100100101000110111110000111010; }
   Call "allclock_launch" { 
      "_pi"=1P00101100; }
   Call "allclock_capture" { 
      "_pi"=1P01111011; }
   Ann {* full_sequential *}
   "pattern 35": Call "load_unload" { 
      "SPEAKER"=LHXLLHHLHLHHLHLLLLHHHLLHLLLLLHHHHLLHLHHH; "TEST_SI"=0110101000100111100110101011100110111000; }
   Call "multiclock_capture" { 
      "_pi"=0001111011; }
   Call "allclock_launch_capture" { 
      "_pi"=1000101010; "_po"=HHTLLTHHHHLLTTTHHHHHHHHHLLLHHH; }
   Ann {* full_sequential *}
   "pattern 36": Call "load_unload" { 
      "SPEAKER"=HLLHLHLHHHLHHLLLLHHLLHLHLHLLLHHLLHLLLHHH; "TEST_SI"=0111001111010110100110111011001001000010; }
   Call "allclock_launch" { 
      "_pi"=0P00111010; }
   Call "allclock_capture" { 
      "_pi"=0010111011; "_po"=LHTLLTLLHHHHTTTHLHHLHLLHHLLLLL; }
   Ann {* full_sequential *}
   "pattern 37": Call "load_unload" { 
      "SPEAKER"=LLXLHHLLLLHLHLHLHLHLLHHHLHLLLHLHHHHLLHLH; "TEST_SI"=1010011101111001110100001111100110100010; }
   Call "allclock_launch" { 
      "_pi"=0P01111000; }
   Call "allclock_capture" { 
      "_pi"=0P11101001; }
   Ann {* full_sequential *}
   "pattern 38": Call "load_unload" { 
      "SPEAKER"=LXXHHLLLHLLLLHHLHLHLLLLHLLLLLHLHHHLLLHLH; "TEST_SI"=0011110010110011101000000000101001000101; }
   Call "allclock_launch" { 
      "_pi"=1P10111001; }
   Call "allclock_capture" { 
      "_pi"=0001111011; "_po"=LHTLLTHHHHHHTTTHHHLHHLLHHLHHLH; }
   Ann {* full_sequential *}
   "pattern 39": Call "load_unload" { 
      "SPEAKER"=HLXLLLLLHHLLHHHLHLLHHHHHHHHHLHLHHLHHLHLH; "TEST_SI"=1100110010100100000011111010000000000010; }
   Call "allclock_launch" { 
      "_pi"=0P10111010; }
   Call "allclock_capture" { 
      "_pi"=1000101000; "_po"=HLTLLTLLLHHHTTTLLHHLLLLHHLLLLL; }
   Ann {* full_sequential *}
   "pattern 40": Call "load_unload" { 
      "SPEAKER"=LHXHLLHHLHLHLLHLHLHHLLHHLHLHLHLHHHHHLLLL; "TEST_SI"=1110010000001011100010101100001010111101; }
   Call "allclock_launch" { 
      "_pi"=1P00101100; }
   Call "allclock_capture" { 
      "_pi"=1P00101011; }
   Ann {* full_sequential *}
   "pattern 41": Call "load_unload" { 
      "SPEAKER"=LHXHLHHHLHHLHLHLHLHLHLHLLHHHHLHLLHLLLHLH; "TEST_SI"=1100010001011010111100100010111101011011; }
   Call "multiclock_capture" { 
      "_pi"=0011111011; }
   Call "allclock_launch_capture" { 
      "_pi"=1010111000; "_po"=LHTLLTHLHHHHTTTHHLHHHHHHLLHLHL; }
   Ann {* full_sequential *}
   "pattern 42": Call "load_unload" { 
      "SPEAKER"=LLHHHLHHHLHLLHLHLLLLHHLHHHLHLLLLHLHLLHLL; "TEST_SI"=1000111100100010100011010000100000001000; }
   Call "allclock_launch" { 
      "_pi"=0001P01110; }
   Call "allclock_capture" { 
      "_pi"=1P10101001; }
   Ann {* full_sequential *}
   "pattern 43": Call "load_unload" { 
      "SPEAKER"=HLXHLHHLHLLLHLHHHHHLHLLHHLHHLHLHHHLLLHLH; "TEST_SI"=1110001010001010110000110100001100010110; }
   Call "allclock_launch" { 
      "_pi"=1P00101101; }
   Call "allclock_capture" { 
      "_pi"=0P10101011; }
   Ann {* full_sequential *}
   "pattern 44": Call "load_unload" { 
      "SPEAKER"=LHXHHLHLHHHLHLHLHLHHHLLHLHHLLHLHHHLLLHLH; "TEST_SI"=0110000010001011100001110100001110110011; }
   Call "allclock_launch" { 
      "_pi"=1P11101110; }
   Call "allclock_capture" { 
      "_pi"=0P00101011; }
   Ann {* full_sequential *}
   "pattern 45": Call "load_unload" { 
      "SPEAKER"=LHXHHHHLLHHLHLHLHLHHLLLHLHHHHLLLHLLLLHLH; "TEST_SI"=1110010110001010111010110100011101011100; }
   Call "allclock_launch" { 
      "_pi"=0P01101110; }
   Call "allclock_capture" { 
      "_pi"=0P10101001; }
   Ann {* full_sequential *}
   "pattern 46": Call "load_unload" { 
      "SPEAKER"=LHXHLHLLHHHLHLHLHLHLHLLHLHHHLLLHLLLHLHLH; "TEST_SI"=1100011110001011010011010100001010110000; }
   Call "allclock_launch" { 
      "_pi"=1P10111100; }
   Call "allclock_capture" { 
      "_pi"=0P01101011; }
   Ann {* full_sequential *}
   "pattern 47": Call "load_unload" { 
      "SPEAKER"=HHXHLLLLHHHLHLHLHLHLLHLLLHHHLHLHHHLLLHLH; "TEST_SI"=1010100010010111000101101000100001100110; }
   Call "allclock_launch" { 
      "_pi"=1P11101010; }
   Call "allclock_capture" { 
      "_pi"=0P00111001; }
   Ann {* full_sequential *}
   "pattern 48": Call "load_unload" { 
      "SPEAKER"=LXXHLHLLHHHLHLHLHLHLHLLHLHHHLHHHLHLLLHLH; "TEST_SI"=0111100010001010010100110100000011010000; }
   Call "allclock_launch" { 
      "_pi"=1P11111111; }
   Call "allclock_capture" { 
      "_pi"=0P01101001; }
   Ann {* full_sequential *}
   "pattern 49": Call "load_unload" { 
      "SPEAKER"=HLXLHHHLHHHLLLHLHLLHHLLLLHHHLHLHHHLHLHLH; "TEST_SI"=1111100010001010110110110100011010110101; }
   Call "allclock_launch" { 
      "_pi"=1P11101101; }
   Call "allclock_capture" { 
      "_pi"=0P01101001; }
   Ann {* full_sequential *}
   "pattern 50": Call "load_unload" { 
      "SPEAKER"=LLXLHHHLHHHLHLHLHLLLHLLHLHHHLLHLHLLLLHLH; "TEST_SI"=0100100100010111000101101000100100100100; }
   Call "allclock_launch" { 
      "_pi"=1P01111010; }
   Call "allclock_capture" { 
      "_pi"=0P00101011; }
   Ann {* full_sequential *}
   "pattern 51": Call "load_unload" { 
      "SPEAKER"=LXXHLHHLLHHLHLHLHLHLHLLHLHHHLHHLHHLLLHLH; "TEST_SI"=0001100100100110010100010100000010011010; }
   Call "allclock_launch" { 
      "_pi"=1011P11110; }
   Call "allclock_capture" { 
      "_pi"=1P11101001; }
   Ann {* full_sequential *}
   "pattern 52": Call "load_unload" { 
      "SPEAKER"=HLXHLHHLHLLLHLHLHLHLHLLHHLHHLHLHHHLLLHLH; "TEST_SI"=1100110010001011011110110100011111111101; }
   Call "allclock_launch" { 
      "_pi"=1P00101100; }
   Call "allclock_capture" { 
      "_pi"=0P01101011; }
   Ann {* full_sequential *}
   "pattern 53": Call "load_unload" { 
      "SPEAKER"=HHXLLHHLHHHLHLHLHLLLHLLHLHHHLLHHHHLLLHLH; "TEST_SI"=0100010100110111111101101110110101001000; }
   Call "allclock_launch" { 
      "_pi"=1000P11010; }
   Call "allclock_capture" { 
      "_pi"=0P01111001; }
   Ann {* full_sequential *}
   "pattern 54": Call "load_unload" { 
      "SPEAKER"=HLXHLHHLHLLLHLHLHLHLHLLHHLHHLHLHHHLHHHHH; "TEST_SI"=1100110010001011010010110100010010011001; }
   Call "allclock_launch" { 
      "_pi"=0P10101110; }
   Call "allclock_capture" { 
      "_pi"=0P11111001; }
   Ann {* full_sequential *}
   "pattern 55": Call "load_unload" { 
      "SPEAKER"=LHXLLHHLHHHLHLHLHLHLHLLHLHHHLHHLHHLLLHLH; "TEST_SI"=1010100000010101010101111000000110100010; }
   Call "allclock_launch" { 
      "_pi"=1P00101000; }
   Call "allclock_capture" { 
      "_pi"=0P11111001; }
   Ann {* full_sequential *}
   "pattern 56": Call "load_unload" { 
      "SPEAKER"=HXXHLHHHHHHLHLHLHLHLHLHHLHHHLHLHHLLLLHLH; "TEST_SI"=1100100110010111110101001000010101100100; }
   Call "allclock_launch" { 
      "_pi"=0P10111010; }
   Call "allclock_capture" { 
      "_pi"=1P10111001; }
   Ann {* full_sequential *}
   "pattern 57": Call "load_unload" { 
      "SPEAKER"=HXXHLHHHHHHLHLHHHHHLHLHHLHHHHLHLLHLHLLLL; "TEST_SI"=0110100010010111010100001000100100110110; }
   Call "allclock_launch" { 
      "_pi"=1P01111010; }
   Call "allclock_capture" { 
      "_pi"=0P11111001; }
   Ann {* full_sequential *}
   "pattern 58": Call "load_unload" { 
      "SPEAKER"=LXXHLHLLLHHLHLHLHLHLHHHLLHHHLHLHHHLLLHLH; "TEST_SI"=0110100100010101010101111000011010100000; }
   Call "allclock_launch" { 
      "_pi"=1P11111010; }
   Call "allclock_capture" { 
      "_pi"=0P01111011; }
   Ann {* full_sequential *}
   "pattern 59": Call "load_unload" { 
      "SPEAKER"=LXXHLHHLHHHLHLHLHLHLHLHHLHHHLHLHHLLHHHHH; "TEST_SI"=1111010010001010101010111100010110111110; }
   Call "allclock_launch" { 
      "_pi"=0P01101101; }
   Call "allclock_capture" { 
      "_pi"=1P10111011; }
   Ann {* full_sequential *}
   "pattern 60": Call "load_unload" { 
      "SPEAKER"=LLXHLHHLHHHLHLHHHHHLHLLLLHHHLHLLHLLLLHLH; "TEST_SI"=0110101000010101000101011000000001100011; }
   Call "allclock_launch" { 
      "_pi"=0P10101010; }
   Call "allclock_capture" { 
      "_pi"=0P01101001; }
   Ann {* full_sequential *}
   "pattern 61": Call "load_unload" { 
      "SPEAKER"=LXXHLHLHHHHLHLHLHLHLHHLHLHHHLHLHHLLLLHLH; "TEST_SI"=1110100110010111000101101000011110100101; }
   Call "allclock_launch" { 
      "_pi"=0P11101010; }
   Call "allclock_capture" { 
      "_pi"=0P11101011; }
   Ann {* full_sequential *}
   "pattern 62": Call "load_unload" { 
      "SPEAKER"=LXXHLHHHHHHLHLHLHLHLHLLHLHHHHLLLLHLLLHLH; "TEST_SI"=0111010010000111011010110101100011010100; }
   Call "allclock_launch" { 
      "_pi"=0P00111101; }
   Call "allclock_capture" { 
      "_pi"=0P00101001; }
   Ann {* full_sequential *}
   "pattern 63": Call "load_unload" { 
      "SPEAKER"=HLXHLHHLHHHHLLHLHLHLHLLHLHLLHHHLLHLLLHLH; "TEST_SI"=0000111111110110010010010001101000100010; }
   Call "allclock_launch" { 
      "_pi"=1001P01110; }
   Call "allclock_capture" { 
      "_pi"=0P10111011; }
   Ann {* full_sequential *}
   "pattern 64": Call "load_unload" { 
      "SPEAKER"=HLXHLHHLHLLLHLHLHLHLHLLHHLHHLHLHHHLHLLLL; "TEST_SI"=0110010010001011001010110100100010110100; }
   Call "allclock_launch" { 
      "_pi"=1P10111111; }
   Call "allclock_capture" { 
      "_pi"=1P11111001; }
   Ann {* full_sequential *}
   "pattern 65": Call "load_unload" { 
      "SPEAKER"=LHXHLHHLHHHLHLHLHLHLHLLHLHHLHHHLHLLHLHLH; "TEST_SI"=0100010010101011001010110010001110010101; }
   Call "allclock_launch" { 
      "_pi"=0P01111110; }
   Call "allclock_capture" { 
      "_pi"=0P01101011; }
   Ann {* full_sequential *}
   "pattern 66": Call "load_unload" { 
      "SPEAKER"=LHXHLHHLHLHLHLHLHLHLHLLHHLHHHLLLHHLLLHLH; "TEST_SI"=0111010010010011010010110111011000110000; }
   Call "allclock_launch" { 
      "_pi"=0P01101101; }
   Call "allclock_capture" { 
      "_pi"=0P10111001; }
   Ann {* full_sequential *}
   "pattern 67": Call "load_unload" { 
      "SPEAKER"=HLXHLHHLHHLHHLHLHLHLHLLLLLLHLHLHHHLLLHLH; "TEST_SI"=0110010011001011110010111100011100110000; }
   Call "allclock_launch" { 
      "_pi"=1P01101110; }
   Call "allclock_capture" { 
      "_pi"=1P10111011; }
   Ann {* full_sequential *}
   "pattern 68": Call "load_unload" { 
      "SPEAKER"=HHXHLHHHHHHLHLHLHLHLHLHHLHHHLHLHHHLHLHLH; "TEST_SI"=1010100100011100100101101000000010110110; }
   Call "allclock_launch" { 
      "_pi"=0P01111000; }
   Call "allclock_capture" { 
      "_pi"=1P10111001; }
   Ann {* full_sequential *}
   "pattern 69": Call "load_unload" { 
      "SPEAKER"=LXXHLHHLHHHHHLHHHHHLHLLLLHHHLHLHHHLLLHLH; "TEST_SI"=0010100100101100000101101000101011110111; }
   Call "allclock_launch" { 
      "_pi"=0P11111010; }
   Call "allclock_capture" { 
      "_pi"=0P11111011; }
   Ann {* full_sequential *}
   "pattern 70": Call "load_unload" { 
      "SPEAKER"=LXXHLHHLHLHLHLHLHLHLHLLHLHHHLHLLHHLLLHLH; "TEST_SI"=0110010010001101111010110100100010000001; }
   Call "allclock_launch" { 
      "_pi"=1P01101110; }
   Call "allclock_capture" { 
      "_pi"=0P10101001; }
   Ann {* full_sequential *}
   "pattern 71": Call "load_unload" { 
      "SPEAKER"=HHXHLHHLLHHLLHHLHLHLHLLLLHHLLHLHHHHLLHLH; "TEST_SI"=1101010010001001111010110100000000100110; }
   Call "allclock_launch" { 
      "_pi"=0P11111100; }
   Call "allclock_capture" { 
      "_pi"=1P10111011; }
   Ann {* full_sequential *}
   "pattern 72": Call "load_unload" { 
      "SPEAKER"=HLXHLHHLLHHLHHHLHLHLHLLHLHHLLHLHHHHLLHLH; "TEST_SI"=1110010010001101111010110100111111110101; }
   Call "allclock_launch" { 
      "_pi"=0P00101101; }
   Call "allclock_capture" { 
      "_pi"=0P11101001; }
   Ann {* full_sequential *}
   "pattern 73": Call "load_unload" { 
      "SPEAKER"=LHXHLHHLLHHLLHHLHLHLHLLHLHHLLLLLLLLLLHLH; "TEST_SI"=1010100100001100100101101000001110100110; }
   Call "allclock_launch" { 
      "_pi"=0P10111010; }
   Call "allclock_capture" { 
      "_pi"=0P10101001; }
   Ann {* full_sequential *}
   "pattern 74": Call "load_unload" { 
      "SPEAKER"=LXXHLHHLHHLLHLHLHLHLHLLHLHHLLHLHHHLLLHLH; "TEST_SI"=0110100110010100000101101000100010100001; }
   Call "allclock_launch" { 
      "_pi"=0P10101010; }
   Call "allclock_capture" { 
      "_pi"=1P11111011; }
   Ann {* full_sequential *}
   "pattern 75": Call "load_unload" { 
      "SPEAKER"=LXXHLHHLLHHLLLHLHLHLHLLLLHHHLHLHHHLLLHLH; "TEST_SI"=0110110000001001010010000101000101000111; }
   Call "multiclock_capture" { 
      "_pi"=1011111111; }
   Call "allclock_launch_capture" { 
      "_pi"=0P01101000; }
   Ann {* full_sequential *}
   "pattern 76": Call "load_unload" { 
      "SPEAKER"=LLXHLLHHHHHHLHHLHLHHLHHHHLHLHHHLHLHLLHLH; "TEST_SI"=0011100000101000100010100110001010111110; }
   Call "allclock_launch" { 
      "_pi"=0001P11001; }
   Call "allclock_capture" { 
      "_pi"=1000101010; "_po"=HHTHHTLHHLHHTTTLLLLLLLLLLLLLLL; }
   Ann {* full_sequential *}
   "pattern 77": Call "load_unload" { 
      "SPEAKER"=LLLHLHHLHLLLHLHLHLHLHLLHHLHHLHLHHHLHLHLH; "TEST_SI"=1100101101000101001111101001011100011110; }
   Call "allclock_launch" { 
      "_pi"=0P11101110; }
   Call "allclock_capture" { 
      "_pi"=1011111010; "_po"=LHTLLTLLHHHHTTTLHHLHHLLHHLHHLL; }
   Ann {* full_sequential *}
   "pattern 78": Call "load_unload" { 
      "SPEAKER"=LHHLHLLHLHHHLHLHHLLLLLHLHHLHLLLHHHLLLLHL; "TEST_SI"=0000100010011100010010000000101011101101; }
   Call "allclock_launch" { 
      "_pi"=1011P11000; }
   Call "allclock_capture" { 
      "_pi"=1000111000; "_po"=HHTHHTLHHLHHTTTLLLLLLLLLLLLLLL; }
   Ann {* full_sequential *}
   "pattern 79": Call "load_unload" { 
      "SPEAKER"=LLLHLHHLHLLLHLHLHLHLHLLHHLHHLHLHHHLHLHLH; "TEST_SI"=1010011111001011101100011111011100010100; }
   Call "allclock_launch" { 
      "_pi"=1P01101001; }
   Call "allclock_capture" { 
      "_pi"=1010111001; "_po"=LLTHHTLLLHHLTTTLHHHHHHHHHHHLLL; }
   Ann {* full_sequential *}
   "pattern 80": Call "load_unload" { 
      "SPEAKER"=LLXHHLLHHLHHLHHLHLLLHHHLLLLLHLLLHHHLLHLH; "TEST_SI"=0010001110010001010010011111110101000000; }
   Call "allclock_launch" { 
      "_pi"=0P10101000; }
   Call "allclock_capture" { 
      "_pi"=0011101000; "_po"=LLTLLTLLLHHHTTTHHHHHLHHLHHHLLL; }
   Ann {* full_sequential *}
   "pattern 81": Call "load_unload" { 
      "SPEAKER"=LLXHHHLLLHHLHHHLHLLLHLLHLLLLLHLHHHHLLHLH; "TEST_SI"=0101111110111000011111001111100101011100; }
   Call "allclock_launch" { 
      "_pi"=1000P11011; }
   Call "allclock_capture" { 
      "_pi"=1000111001; "_po"=HHTHHTLHHLHHTTTLLLLLLLLLLLLLLL; }
   Ann {* full_sequential *}
   "pattern 82": Call "load_unload" { 
      "SPEAKER"=LLLHLHHLHLLLHLHLHLHLHLLHHLHHLHLHHHLHLHLH; "TEST_SI"=0000011011111111101100000111001011010010; }
   Call "allclock_launch" { 
      "_pi"=1P00101000; }
   Call "allclock_capture" { 
      "_pi"=1010101000; "_po"=HHTHHTLLHHHHTTTHHHHHLHHLHHHLLL; }
   Ann {* full_sequential *}
   "pattern 83": Call "load_unload" { 
      "SPEAKER"=LHXLLHHLHLLLLLHLHLLLHHHHHLLLHHLHLLHLLHLH; "TEST_SI"=0011111011110011101011001101011110110110; }
   Call "allclock_launch" { 
      "_pi"=0001P11011; }
   Call "allclock_capture" { 
      "_pi"=0000111000; "_po"=HHTHHTLHHLHHTTTLLLLLLLLLLLLLLL; }
   Ann {* full_sequential *}
   "pattern 84": Call "load_unload" { 
      "SPEAKER"=LLLHLHHLHLLLHLHLHLHLHLLHHLHHLHLHHHLHLHLH; "TEST_SI"=0111001011111011111100101000111100001010; }
   Call "allclock_launch" { 
      "_pi"=1P10111000; }
   Call "allclock_capture" { 
      "_pi"=1010111011; "_po"=LHTHHTLLHHHHTTTHHHLHHHHHLLHHLL; }
   Ann {* full_sequential *}
   "pattern 85": Call "load_unload" { 
      "SPEAKER"=LLXLHLHLHLLLLHHLHLLLHHLHLHHHLLLLHHHHLLLL; "TEST_SI"=0110011010110000011000110000001100101100; }
   Call "allclock_launch" { 
      "_pi"=0P11111011; }
   Call "allclock_capture" { 
      "_pi"=0001101010; "_po"=HHTLLTHLHHHHTTTHHHLHLLHHHHHHLH; }
   Ann {* full_sequential *}
   "pattern 86": Call "load_unload" { 
      "SPEAKER"=HLXHHLLHLHLLLHHLHLLHHHLLHHHLLHLHHHLLLHLH; "TEST_SI"=0100011001100001011011010100011100100000; }
   Call "allclock_launch" { 
      "_pi"=0P10111011; }
   Call "allclock_capture" { 
      "_pi"=0011111001; "_po"=LLTLLTLLLHHLTTTLLLLLLLLLLLLLLH; }
   Ann {* full_sequential *}
   "pattern 87": Call "load_unload" { 
      "SPEAKER"=HHXHHLLHHLLHHHHLHLHLHLLHLHHLLHLHHHHLLHLH; "TEST_SI"=1011110110101111100011010101001010101111; }
   Call "allclock_launch" { 
      "_pi"=0P01111011; }
   Call "allclock_capture" { 
      "_pi"=0010101011; "_po"=HHTHHTHLLHHLTTTLHLHHLLLHHHHLHL; }
   Ann {* full_sequential *}
   "pattern 88": Call "load_unload" { 
      "SPEAKER"=LLXLLLHHHHLHLLHLHLHHLLHLHLLHLHLHHHLLLHLH; "TEST_SI"=0001110001110011001100010101011001100000; }
   Call "allclock_launch" { 
      "_pi"=1P01101111; }
   Call "allclock_capture" { 
      "_pi"=1010101010; "_po"=HHTHHTHLLHHLTTTHHHHHHLHHLHHLLH; }
   Ann {* full_sequential *}
   "pattern 89": Call "load_unload" { 
      "SPEAKER"=HHLLLHHHLLLHHLLHHLLHHHLHLHLHLLHHLLHHHHHL; "TEST_SI"=0010011100100100110101011011100000110010; }
   Call "allclock_launch" { 
      "_pi"=1011P11010; }
   Call "allclock_capture" { 
      "_pi"=1011111001; "_po"=HHTHHTLHHLHHTTTLLLLLLLLLLLLLLL; }
   Ann {* full_sequential *}
   "pattern 90": Call "load_unload" { 
      "SPEAKER"=LLLHLHHLHLLLHLHLHLHLHLLHHLHHLHLHHHLHLHLH; "TEST_SI"=0110001111111100100100100010101010111110; }
   Call "allclock_launch" { 
      "_pi"=1P10101000; }
   Call "allclock_capture" { 
      "_pi"=1010111001; "_po"=HHTHHTHLLHHLTTTLHLHHLLLHHLHLHL; }
   Ann {* full_sequential *}
   "pattern 91": Call "load_unload" { 
      "SPEAKER"=LLXHHHLLLLLHHLHLHLHLHHLHHHLHLHLHLHLLLHLH; "TEST_SI"=0110110010110110010101010001011100100001; }
   Call "allclock_launch" { 
      "_pi"=0P11101001; }
   Call "allclock_capture" { 
      "_pi"=0010101001; "_po"=HHTLLTHLHHHHTTTHHHHHHLLHHLLHHH; }
   Ann {* full_sequential *}
   "pattern 92": Call "load_unload" { 
      "SPEAKER"=HLXHLLHHLHLLHLHLHLHLHHLHHHHLLHLHHHLHLHLH; "TEST_SI"=0100110110010111011110110100101111110001; }
   Call "allclock_launch" { 
      "_pi"=0P00101100; }
   Call "allclock_capture" { 
      "_pi"=1011111011; "_po"=HLTLLTLLLHHHTTTHHHHHHHHHLLHLLL; }
   Ann {* full_sequential *}
   "pattern 93": Call "load_unload" { 
      "SPEAKER"=LHHLLHLLHHLHLLLHLLLLHLLHLHHLHLLLLLLHHHLH; "TEST_SI"=1110100011000111101101111010010111010000; }
   Call "allclock_launch" { 
      "_pi"=1P11111010; }
   Call "allclock_capture" { 
      "_pi"=1011101010; "_po"=HLTHHTHHHHHHTTTHHHHHHLLHHLLHHL; }
   Ann {* full_sequential *}
   "pattern 94": Call "load_unload" { 
      "SPEAKER"=LLXHLHLLHLHHHLHLHLLLHLLLLHLHHLHLLLHLLHLH; "TEST_SI"=1011011010011111100110011011111110100001; }
   Call "allclock_launch" { 
      "_pi"=0P11111011; }
   Call "allclock_capture" { 
      "_pi"=0011101001; "_po"=HHTLLTLLHHHHTTTHLHHLHHHHLLLLLL; }
   Ann {* full_sequential *}
   "pattern 95": Call "load_unload" { 
      "SPEAKER"=LLXHLHHLHHHLLLHLHLHHHLLHLHLLLHLHHHLHLHLH; "TEST_SI"=0111111011000011010011000111111011111100; }
   Call "allclock_launch" { 
      "_pi"=1P01101010; }
   Call "allclock_capture" { 
      "_pi"=1010111000; "_po"=LLTHHTHHHHHHTTTHLHHLHHHHHHHHLL; }
   Ann {* full_sequential *}
   "pattern 96": Call "load_unload" { 
      "SPEAKER"=LLXLHHHLHLHHHHLLLLHHLLHHHLLLLLLHLLLLLHLH; "TEST_SI"=1100110001011111110011011110101001001000; }
   Call "allclock_launch" { 
      "_pi"=1P10111000; }
   Call "allclock_capture" { 
      "_pi"=1001101001; "_po"=HHTLLTHLHHHHTTTLLHHLLLLHHLLLLL; }
   Ann {* full_sequential *}
   "pattern 97": Call "load_unload" { 
      "SPEAKER"=LHXHLLHHLLHLLLHLHLHHLLHLLLLHLHLHHLHLLHLH; "TEST_SI"=1011010000001101110000001001111100101000; }
   Call "multiclock_capture" { 
      "_pi"=0001P11000; }
   Call "allclock_launch_capture" { 
      "_pi"=0P10101010; }
   Ann {* full_sequential *}
   "pattern 98": Call "load_unload" { 
      "SPEAKER"=LLXHLHHLHLLLHLHLHLHLHLLHHLHHLHLHHHLLLHLH; "TEST_SI"=0011111011110010111111100111111100011110; }
   Call "allclock_launch" { 
      "_pi"=0P11111110; }
   Call "allclock_capture" { 
      "_pi"=0P00101010; }
   Ann {* full_sequential *}
   "pattern 99": Call "load_unload" { 
      "SPEAKER"=LLXLLLHLLLLHHLHLHLLLLLHHLLLLLLLHHHLHLHLH; "TEST_SI"=0000011010111010100110100111000001101001; }
   Call "allclock_launch" { 
      "_pi"=1011P01000; }
   Call "allclock_capture" { 
      "_pi"=1P10111001; }
   Ann {* full_sequential *}
   "pattern 100": Call "load_unload" { 
      "SPEAKER"=HLXHLHHLHLLLHLHHHHHLHLLHHLHHLHLHHHLHLLLL; "TEST_SI"=1010010000101101100101101111011011000110; }
   Call "allclock_launch" { 
      "_pi"=1P10111001; }
   Call "allclock_capture" { 
      "_pi"=0P10111010; }
   Ann {* full_sequential *}
   "pattern 101": Call "load_unload" { 
      "SPEAKER"=LXXHHLHHHHLHLLHLHLHLHLLHHHHHLHLHHHHHLHLL; "TEST_SI"=1111000101110000000011111101100001101010; }
   Call "allclock_launch" { 
      "_pi"=1P00101110; }
   Call "allclock_capture" { 
      "_pi"=0P01111011; }
   Ann {* full_sequential *}
   "pattern 102": Call "load_unload" { 
      "SPEAKER"=LLXHHHLHLLLHLHHLHLHLLLLLLHLLHHHHLLHHLHLH; "TEST_SI"=0110110010010001100101101010001111110001; }
   Call "allclock_launch" { 
      "_pi"=1P01101101; }
   Call "allclock_capture" { 
      "_pi"=0P01101000; }
   Ann {* full_sequential *}
   "pattern 103": Call "load_unload" { 
      "SPEAKER"=LHXLLHHLLHLHHHHLHLHLHLLHLHHLLHLHHHHLLHLH; "TEST_SI"=1000100101010010111011010100010111001110; }
   Call "allclock_launch" { 
      "_pi"=1P01111010; }
   Call "allclock_capture" { 
      "_pi"=0P10111011; }
   Ann {* full_sequential *}
   "pattern 104": Call "load_unload" { 
      "SPEAKER"=LXXHLHHLHLHLHHHLHLHLHLLHLHLHLHLHHHLLLHLH; "TEST_SI"=1001010001111101111100101111111111100011; }
   Call "allclock_launch" { 
      "_pi"=1P00101101; }
   Call "allclock_capture" { 
      "_pi"=0P00101000; }
   Ann {* full_sequential *}
   "pattern 105": Call "load_unload" { 
      "SPEAKER"=LLXHLHLLHLLLLHHLHLLHHLHLLLLLLLLLLLHLLHLH; "TEST_SI"=1111001000010101111011011110010011011011; }
   Call "allclock_launch" { 
      "_pi"=0P10101000; }
   Call "allclock_capture" { 
      "_pi"=1P00111011; }
   Ann {* full_sequential *}
   "pattern 106": Call "load_unload" { 
      "SPEAKER"=LXXLHHLHHHHLHLHLHLHLHLLHLLLLLHLHHLHLLHLH; "TEST_SI"=1111001001010100111101101000101001101100; }
   Call "allclock_launch" { 
      "_pi"=0P11101110; }
   Call "allclock_capture" { 
      "_pi"=0P00101011; }
   Ann {* full_sequential *}
   "pattern 107": Call "load_unload" { 
      "SPEAKER"=LLXHHLHHLHLHLHHLHLHLHLLHHHLHLHLHHHHHLHLH; "TEST_SI"=0101111111011010001101101111001001111100; }
   Call "allclock_launch" { 
      "_pi"=1P01101111; }
   Call "allclock_capture" { 
      "_pi"=1P01111001; }
   Ann {* full_sequential *}
   "pattern 108": Call "load_unload" { 
      "SPEAKER"=LLXLLLLLLHLLLLLLLLHLHLLHLLLLLHLHHHLHLHLH; "TEST_SI"=0011011000101011101010001011100111101110; }
   Call "allclock_launch" { 
      "_pi"=1P10111010; }
   Call "allclock_capture" { 
      "_pi"=1P00111011; }
   Ann {* full_sequential *}
   "pattern 109": Call "load_unload" { 
      "SPEAKER"=LXXLHLLHLHLHLHHLHLLHLHHHLLHLLHLHHHLLLHLH; "TEST_SI"=1100011101101010010011010110010110001110; }
   Call "allclock_launch" { 
      "_pi"=1P10111001; }
   Call "allclock_capture" { 
      "_pi"=0P11111000; }
   Ann {* full_sequential *}
   "pattern 110": Call "load_unload" { 
      "SPEAKER"=LXXHHLLLHHHLHHHLHLHHLLHLLHHHLHLHHHHLLHLH; "TEST_SI"=1100111110110000001111111101100110110111; }
   Call "allclock_launch" { 
      "_pi"=1P00111100; }
   Call "allclock_capture" { 
      "_pi"=0P10111011; }
   Ann {* full_sequential *}
   "pattern 111": Call "load_unload" { 
      "SPEAKER"=LHXLLLLLHLLHLHHLHLLLLLLLLLHHLHLHHHLHLLLL; "TEST_SI"=1100111011011101101101101011111110110001; }
   Call "allclock_launch" { 
      "_pi"=0P10101100; }
   Call "allclock_capture" { 
      "_pi"=1P10101010; }
   Ann {* full_sequential *}
   "pattern 112": Call "load_unload" { 
      "SPEAKER"=LHXLLLHHHHLLLHHHHHHLHLLHLHHHLHLHHHLLLHLH; "TEST_SI"=0000011100110011111011010111101010001110; }
   Call "allclock_launch" { 
      "_pi"=0P01111000; }
   Call "allclock_capture" { 
      "_pi"=0P10111011; }
   Ann {* full_sequential *}
   "pattern 113": Call "load_unload" { 
      "SPEAKER"=LXXHHLLLLHLLHHHLHLHLHLLHLHHLLHLHHHHLLHLH; "TEST_SI"=0000101101011100010100101001100110100111; }
   Call "allclock_launch" { 
      "_pi"=1P00101111; }
   Call "allclock_capture" { 
      "_pi"=0P00101011; }
   Ann {* full_sequential *}
   "pattern 114": Call "load_unload" { 
      "SPEAKER"=HHXLHLLHLHLHHHHLHLLHHLHLHLHHLHLHHHHLLHLH; "TEST_SI"=1100010010110101000011001111100000110001; }
   Call "allclock_launch" { 
      "_pi"=0P10111100; }
   Call "allclock_capture" { 
      "_pi"=0P10101011; }
   Ann {* full_sequential *}
   "pattern 115": Call "load_unload" { 
      "SPEAKER"=LHXHLHHLHLLHLHHLHLHHHLLHLLLLLHLHHHLLLHLH; "TEST_SI"=0101010011011011100100100010111101100010; }
   Call "allclock_launch" { 
      "_pi"=0P10111001; }
   Call "allclock_capture" { 
      "_pi"=1P11101010; }
   Ann {* full_sequential *}
   "pattern 116": Call "load_unload" { 
      "SPEAKER"=LXXHLHHLHLHHHHHLHLHLHHLLHHLLLHLHHHLLLHLH; "TEST_SI"=0100011010000000001011011111101110100000; }
   Call "allclock_launch" { 
      "_pi"=0P10101111; }
   Call "allclock_capture" { 
      "_pi"=0P01111001; }
   Ann {* full_sequential *}
   "pattern 117": Call "load_unload" { 
      "SPEAKER"=LHXHLLHLHHHHLHHLHLHLLHHHLLLLLHLHHHHHLHLH; "TEST_SI"=0100110001000001001011011010101010100000; }
   Call "allclock_launch" { 
      "_pi"=1000P11001; }
   Call "allclock_capture" { 
      "_pi"=1P01111010; }
   Ann {* full_sequential *}
   "pattern 118": Call "load_unload" { 
      "SPEAKER"=LLXHLHHLHLLLHLLLLLHLHLLHHLHHLHLHHHLHHHHH; "TEST_SI"=0101010000000110101110001001110011000010; }
   Call "allclock_launch" { 
      "_pi"=0P00111111; }
   Call "allclock_capture" { 
      "_pi"=1P11111011; }
   Ann {* full_sequential *}
   "pattern 119": Call "load_unload" { 
      "SPEAKER"=LLXHLHHHHHHHLLHLHLLLHHHLHHLLLHHLLHHHLHLH; "TEST_SI"=1000100010100001111011010010010011111011; }
   Call "allclock_launch" { 
      "_pi"=1P11101011; }
   Call "allclock_capture" { 
      "_pi"=0P00101001; }
   Ann {* full_sequential *}
   "pattern 120": Call "load_unload" { 
      "SPEAKER"=LXXHLHHHLHLHHHHLHLHLHLLHHHLLLHLHHLLLLHLH; "TEST_SI"=0001000000101010110010000101110111010001; }
   Call "allclock_launch" { 
      "_pi"=0P00101100; }
   Call "allclock_capture" { 
      "_pi"=0P10101011; }
   Ann {* full_sequential *}
   "pattern 121": Call "load_unload" { 
      "SPEAKER"=HLXHHHHHHLHLHLHLHLHLHHHLLHLLLHLHHHLLLHLH; "TEST_SI"=0111101111111101010100101101100101100010; }
   Call "allclock_launch" { 
      "_pi"=1P10111001; }
   Call "allclock_capture" { 
      "_pi"=0P01101011; }
   Ann {* full_sequential *}
   "pattern 122": Call "load_unload" { 
      "SPEAKER"=HXXLLHLLLLLHHLHLHLHLHHLLLLLHLHLHHHLLLHLH; "TEST_SI"=1110101011110101010101101010111100010001; }
   Call "allclock_launch" { 
      "_pi"=1P11101111; }
   Call "allclock_capture" { 
      "_pi"=1P01111011; }
   Ann {* full_sequential *}
   "pattern 123": Call "load_unload" { 
      "SPEAKER"=LHXLHLHLLLLHLHHLHLHLHLLHHLLHLHLHHHLLLHLH; "TEST_SI"=1111110001010111101011011001100010100000; }
   Call "allclock_launch" { 
      "_pi"=1P00101101; }
   Call "allclock_capture" { 
      "_pi"=0P10101010; }
   Ann {* full_sequential *}
   "pattern 124": Call "load_unload" { 
      "SPEAKER"=LLXLLHLLHHLHLLHLHLHLLHHHHHLLLHLHHHHLLHLH; "TEST_SI"=1010010001101011110101101010101001101101; }
   Call "allclock_launch" { 
      "_pi"=1P00111100; }
   Call "allclock_capture" { 
      "_pi"=1P01101011; }
   Ann {* full_sequential *}
   "pattern 125": Call "load_unload" { 
      "SPEAKER"=HHXHLHLLHLHLHLHLHLHLHLLHHLLHLHLHHHHLLHLH; "TEST_SI"=1001111001001001000100010100101110000010; }
   Call "allclock_launch" { 
      "_pi"=1P01111100; }
   Call "allclock_capture" { 
      "_pi"=1P11101000; }
   Ann {* full_sequential *}
   "pattern 126": Call "load_unload" { 
      "SPEAKER"=LLXLLLHHLHHLHHHLHLLHHHLHLHHLHLLLHHHLLHLH; "TEST_SI"=1100111001111111111011010100010011011011; }
   Call "allclock_launch" { 
      "_pi"=1P00101000; }
   Call "allclock_capture" { 
      "_pi"=1P01111011; }
   Ann {* full_sequential *}
   "pattern 127": Call "load_unload" { 
      "SPEAKER"=LXXHLLLHLLLLLLLLLLHLHLLHLHHLLHLHHLLHHHHH; "TEST_SI"=1011001010111010001011100000111011010111; }
   Call "allclock_launch" { 
      "_pi"=1P00111100; }
   Call "allclock_capture" { 
      "_pi"=0P00111001; }
   Ann {* full_sequential *}
   "pattern 128": Call "load_unload" { 
      "SPEAKER"=HLXHHLHLHHHLLHHLHLHLLLHHHHLHLHLHHHLLLHLH; "TEST_SI"=1100010101000000111110010000111111010000; }
   Call "allclock_launch" { 
      "_pi"=1P01101110; }
   Call "allclock_capture" { 
      "_pi"=0P11101011; }
   Ann {* full_sequential *}
   "pattern 129": Call "load_unload" { 
      "SPEAKER"=LHXHLHLHLHHHHHHLHLLLHHLLHHHLLHLHHHLHLHLH; "TEST_SI"=1011001010000001011011011010111010000001; }
   Call "allclock_launch" { 
      "_pi"=1P00111100; }
   Call "allclock_capture" { 
      "_pi"=0P10111000; }
   Ann {* full_sequential *}
   "pattern 130": Call "load_unload" { 
      "SPEAKER"=LLXHHLHLHHHHHHHLHLHLLHHHHLHLLHLHHHHHLLLL; "TEST_SI"=1001011100000000111011011000001101100001; }
   Call "allclock_launch" { 
      "_pi"=1P01111100; }
   Call "allclock_capture" { 
      "_pi"=0P01111011; }
   Ann {* full_sequential *}
   "pattern 131": Call "load_unload" { 
      "SPEAKER"=HLXHLLLHHHHHHHHLHLHLLHHHHHHHLHLHHHHHHHHH; "TEST_SI"=1111100000010110011011010111010011011010; }
   Call "allclock_launch" { 
      "_pi"=1P01111011; }
   Call "allclock_capture" { 
      "_pi"=0P10101010; }
   Ann {* full_sequential *}
   "pattern 132": Call "load_unload" { 
      "SPEAKER"=LXXLLHHHLHHLHLHLHLHLHLLLLHHHLHLHHHHLLHLH; "TEST_SI"=1001000100101101110010010001111001010000; }
   Call "allclock_launch" { 
      "_pi"=0P00111101; }
   Call "allclock_capture" { 
      "_pi"=0P01111000; }
   Ann {* full_sequential *}
   "pattern 133": Call "load_unload" { 
      "SPEAKER"=LLXHHHLHLLHLLHHLHLHLHHLLHHLLLHLHHHLHLHHH; "TEST_SI"=0011011010001110000101001111101110000000; }
   Call "allclock_launch" { 
      "_pi"=1P11101110; }
   Call "allclock_capture" { 
      "_pi"=1P00111011; }
   Ann {* full_sequential *}
   "pattern 134": Call "load_unload" { 
      "SPEAKER"=HLXHLLHLHHHHHLHLHLHLHLLHLLLLLHLHHHHHLHLH; "TEST_SI"=1010001101110100000101110110100111100011; }
   Call "allclock_launch" { 
      "_pi"=1P10101100; }
   Call "allclock_capture" { 
      "_pi"=0P11111001; }
   Ann {* full_sequential *}
   "pattern 135": Call "load_unload" { 
      "SPEAKER"=HHXHHLLHLHHLHHHLHLLHLLLHLLHLHHLLLLHLLHLH; "TEST_SI"=1100101100101001010011111101001001111011; }
   Call "allclock_launch" { 
      "_pi"=0P00101101; }
   Call "allclock_capture" { 
      "_pi"=1P00101011; }
   Ann {* full_sequential *}
   "pattern 136": Call "load_unload" { 
      "SPEAKER"=LHXLHLLHHLHLHHHLHLHLLLLLLHLHHLHHLLLLLHLH; "TEST_SI"=0110010110100110001100010010100100111101; }
   Call "allclock_launch" { 
      "_pi"=0P10111100; }
   Call "allclock_capture" { 
      "_pi"=0P11111010; }
   Ann {* full_sequential *}
   "pattern 137": Call "load_unload" { 
      "SPEAKER"=LHXHLHLLHLLLHLHLHLLHHHLHHLHLHHLHLHLLLHLH; "TEST_SI"=0111101111000110010001000001010010011011; }
   Call "allclock_launch" { 
      "_pi"=1P00111001; }
   Call "allclock_capture" { 
      "_pi"=1P10111000; }
   Ann {* full_sequential *}
   "pattern 138": Call "load_unload" { 
      "SPEAKER"=LXXLLHLLLLHHHLHHHHHHHLHLHHHLLHLHHHHHLLLL; "TEST_SI"=1001110001100001011111011110010111111011; }
   Call "allclock_launch" { 
      "_pi"=1P01111000; }
   Call "allclock_capture" { 
      "_pi"=0P00101000; }
   Ann {* full_sequential *}
   "pattern 139": Call "load_unload" { 
      "SPEAKER"=LXXLLLHHLLLHHHHLHLLLLLHLLLLHLHLHHLLLLHLH; "TEST_SI"=0101101101100000100010010110010110111011; }
   Call "allclock_launch" { 
      "_pi"=1P01101001; }
   Call "allclock_capture" { 
      "_pi"=1P11101001; }
   Ann {* full_sequential *}
   "pattern 140": Call "load_unload" { 
      "SPEAKER"=HXXLLHLLHLLHLHHLHLHHLHHLHLLHLHLHHHLLLHLH; "TEST_SI"=1110001111000100101110101000101010000000; }
   Call "allclock_launch" { 
      "_pi"=0P11111100; }
   Call "allclock_capture" { 
      "_pi"=1P01111010; }
   Ann {* full_sequential *}
   "pattern 141": Call "load_unload" { 
      "SPEAKER"=LHXHHLLLLHHHLHLLLLLLHHLHHHHLLHLHHHHHLHHH; "TEST_SI"=1111110010111000110110100010001001111101; }
   Call "allclock_launch" { 
      "_pi"=1P10101100; }
   Call "allclock_capture" { 
      "_pi"=1P11101001; }
   Ann {* full_sequential *}
   "pattern 142": Call "load_unload" { 
      "SPEAKER"=LLXLLHHLHLLLHHHLHLLLHLHLHLHHLHLHHHLLLHLH; "TEST_SI"=0010110110111011101011011001001001101101; }
   Call "allclock_launch" { 
      "_pi"=1P10111100; }
   Call "allclock_capture" { 
      "_pi"=0P10111010; }
   Ann {* full_sequential *}
   "pattern 143": Call "load_unload" { 
      "SPEAKER"=LHXLLHLLLLLLHLHLHLHLLHHHHHLHLHLHHHHHLLLL; "TEST_SI"=1111011000011111101011000000100011100011; }
   Call "allclock_launch" { 
      "_pi"=0P01101011; }
   Call "allclock_capture" { 
      "_pi"=1P11111010; }
   Ann {* full_sequential *}
   "pattern 144": Call "load_unload" { 
      "SPEAKER"=LXXLHLLHLHHLLLHLHLLHLLHLHHHHLHLHHLLLLHLH; "TEST_SI"=0000110011111010011110010010010011101110; }
   Call "allclock_launch" { 
      "_pi"=0P11111110; }
   Call "allclock_capture" { 
      "_pi"=0P11111000; }
   Ann {* full_sequential *}
   "pattern 145": Call "load_unload" { 
      "SPEAKER"=LHXLLHHLLHHLLHHLHLLLHHLHHLHHLHHLLLHHLHLH; "TEST_SI"=1001111010100001110101101010001001101100; }
   Call "allclock_launch" { 
      "_pi"=0P00111101; }
   Call "allclock_capture" { 
      "_pi"=0P11111000; }
   Ann {* full_sequential *}
   "pattern 146": Call "load_unload" { 
      "SPEAKER"=LLXLLLHLLLHHHHHLHLHLHLLHLHHLLHLHHHLLLHLH; "TEST_SI"=1010001010110010001110000001000111111010; }
   Call "allclock_launch" { 
      "_pi"=0P10111010; }
   Call "allclock_capture" { 
      "_pi"=1P10101000; }
   Ann {* full_sequential *}
   "pattern 147": Call "load_unload" { 
      "SPEAKER"=LXXHHHLHLHLLHHHHHHLLLHHHHHLHLHLHHHLLLHLH; "TEST_SI"=1010100000101110100111011011010001111011; }
   Call "allclock_launch" { 
      "_pi"=1P00101010; }
   Call "allclock_capture" { 
      "_pi"=1P10111011; }
   Ann {* full_sequential *}
   "pattern 148": Call "load_unload" { 
      "SPEAKER"=LXXHLHHHHHLHLLHHHHHLLLHLLHLLHLHHLLLHLLLL; "TEST_SI"=0100001001001010001000011110001011111100; }
   Call "allclock_launch" { 
      "_pi"=1P00101110; }
   Call "allclock_capture" { 
      "_pi"=1P10111001; }
   Ann {* full_sequential *}
   "pattern 149": Call "load_unload" { 
      "SPEAKER"=LHXHHLHHLHHLLLHHHHHHHHLLLLHHLHLHHHLHLHLH; "TEST_SI"=1001011100110111110100111110011001111100; }
   Call "allclock_launch" { 
      "_pi"=1P00111101; }
   Call "allclock_capture" { 
      "_pi"=1P00111010; }
   Ann {* full_sequential *}
   "pattern 150": Call "load_unload" { 
      "SPEAKER"=LLXHLLLHLLLHLLHLHLLHHLLLLLHHLLHLHHLLLHLH; "TEST_SI"=0110101111000101011011010101111011001110; }
   Call "allclock_launch" { 
      "_pi"=0P01111010; }
   Call "allclock_capture" { 
      "_pi"=1P11101011; }
   Ann {* full_sequential *}
   "pattern 151": Call "load_unload" { 
      "SPEAKER"=LXXHLHLLLLHHHLHLHLHLHLLHHLLLLHLHHHHLLHLH; "TEST_SI"=0001000101110010001011010011010001001110; }
   Call "allclock_launch" { 
      "_pi"=0P01111011; }
   Call "allclock_capture" { 
      "_pi"=1P01101001; }
   Ann {* full_sequential *}
   "pattern 152": Call "load_unload" { 
      "SPEAKER"=HXXLHHHLHLLLHHLLLLHLHLLHLHHLLHLHHHLLLHLH; "TEST_SI"=0011110011000100001011011111100001001110; }
   Call "allclock_launch" { 
      "_pi"=1P01111000; }
   Call "allclock_capture" { 
      "_pi"=1P10101011; }
   Ann {* full_sequential *}
   "pattern 153": Call "load_unload" { 
      "SPEAKER"=LXXLLLHHLLHHLLHHHHHLHLLHHHHLLHLHHHHLLHLH; "TEST_SI"=0110010010110110111011111100010000000010; }
   Call "allclock_launch" { 
      "_pi"=1P01111000; }
   Call "allclock_capture" { 
      "_pi"=1P10111010; }
   Ann {* full_sequential *}
   "pattern 154": Call "load_unload" { 
      "SPEAKER"=LXXHHLHHLHLLHLHLHLLHLLHLLLHHLHLHHHHLLHLH; "TEST_SI"=0101010001010011110101011101101011110001; }
   Call "allclock_launch" { 
      "_pi"=1P00101101; }
   Call "allclock_capture" { 
      "_pi"=0P11101001; }
   Ann {* full_sequential *}
   "pattern 155": Call "load_unload" { 
      "SPEAKER"=LLXHLHLLHHLHHLHLHLLHLHHHLHLLLHLHHHLLLHLH; "TEST_SI"=1111000011001001101001101100111111000001; }
   Call "allclock_launch" { 
      "_pi"=0P00111111; }
   Call "allclock_capture" { 
      "_pi"=0P11111000; }
   Ann {* full_sequential *}
   "pattern 156": Call "load_unload" { 
      "SPEAKER"=LLXHHHHHHHHLHHHLHLHHLHLHLHHLLHLHHHHLLHLH; "TEST_SI"=0011101011000111010011010010001000111100; }
   Call "allclock_launch" { 
      "_pi"=1P10101010; }
   Call "allclock_capture" { 
      "_pi"=1P10101000; }
   Ann {* full_sequential *}
   "pattern 157": Call "load_unload" { 
      "SPEAKER"=LXXLLLHLHLHHLLHLHHHHLLHLHHLHHHLHHLLLLHLH; "TEST_SI"=1010100111010010010011111010110001001000; }
   Call "allclock_launch" { 
      "_pi"=1P01111001; }
   Call "allclock_capture" { 
      "_pi"=1P01111011; }
   Ann {* full_sequential *}
   "pattern 158": Call "load_unload" { 
      "SPEAKER"=LXXHLHHHHLHLHHHLLLHHLLLLLHLHLLHHHLHHLHHH; "TEST_SI"=0011001011111011100101001001111100011011; }
   Call "multiclock_capture" { 
      "_pi"=0001P01010; }
   Call "allclock_launch_capture" { 
      "_pi"=1P00111001; }
   Ann {* full_sequential *}
   "pattern 159": Call "load_unload" { 
      "SPEAKER"=HLXHLHHLHLLLHLHLHLHLHLLHHLHHLHLHHHLLLHLH; "TEST_SI"=1010101001101001101111111000100000010001; }
   Call "allclock_launch" { 
      "_pi"=1P10101111; }
   Call "allclock_capture" { 
      "_pi"=1P11111001; }
   Ann {* full_sequential *}
   "pattern 160": Call "load_unload" { 
      "SPEAKER"=HHXHLHHLHLHLLHHLHLLLLLHHHHHLLHLHHHLLLHLH; "TEST_SI"=1010101001101101101011011111110100000011; }
   Call "allclock_launch" { 
      "_pi"=1P11101101; }
   Call "allclock_capture" { 
      "_pi"=0P11101010; }
   Ann {* full_sequential *}
   "pattern 161": Call "load_unload" { 
      "SPEAKER"=LHXHLHHLHLHHHHHLHLHLLHLLLLLLLHLHHHHLLHLH; "TEST_SI"=0001010010111111001000000100100110011001; }
   Call "allclock_launch" { 
      "_pi"=1P01101111; }
   Call "allclock_capture" { 
      "_pi"=0P10101000; }
   Ann {* full_sequential *}
   "pattern 162": Call "load_unload" { 
      "SPEAKER"=LLXHLHHLHLLLLLHLHLHHHHHHLHHLHHLLHHLLLHLH; "TEST_SI"=1010101001100011110000111010110001111010; }
   Call "allclock_launch" { 
      "_pi"=0P11101111; }
   Call "allclock_capture" { 
      "_pi"=0P01101011; }
   Ann {* full_sequential *}
   "pattern 163": Call "load_unload" { 
      "SPEAKER"=HHXHLHHLHLHHLLHLHLHHHLLLHLHLLHHHLLLHLHLH; "TEST_SI"=0011000001011000010101010010000010011001; }
   Call "allclock_launch" { 
      "_pi"=1P10101010; }
   Call "allclock_capture" { 
      "_pi"=1P01111001; }
   Ann {* full_sequential *}
   "pattern 164": Call "load_unload" { 
      "SPEAKER"=LXXLHHHHHLHHLHHLHLHLHLHLHHLHHHHHLLHHHHHH; "TEST_SI"=1101010010101000010101010110110000000001; }
   Call "allclock_launch" { 
      "_pi"=1P01101001; }
   Call "allclock_capture" { 
      "_pi"=1P10111010; }
   Ann {* full_sequential *}
   "pattern 165": Call "load_unload" { 
      "SPEAKER"=LXXHLHHLHLHLLHHLHLHLHHLHHLLHLHLHHHHHLLLL; "TEST_SI"=0111010010100011100101010011011101110111; }
   Call "allclock_launch" { 
      "_pi"=0P10111000; }
   Call "allclock_capture" { 
      "_pi"=0P10101001; }
   Ann {* full_sequential *}
   "pattern 166": Call "load_unload" { 
      "SPEAKER"=LXXHLHHLHHLHLHHLHLHLHLHLHHLLHLLLHLLLLHLH; "TEST_SI"=1001010010001011011010010011011000010011; }
   Call "allclock_launch" { 
      "_pi"=1P10111010; }
   Call "allclock_capture" { 
      "_pi"=0P10101010; }
   Ann {* full_sequential *}
   "pattern 167": Call "load_unload" { 
      "SPEAKER"=LXXHLHHLHHLLLHHLHLLHLHHLHHLLHLLHHHHLLHLH; "TEST_SI"=0001010010001100010110011011111011001110; }
   Call "allclock_launch" { 
      "_pi"=1P01111011; }
   Call "allclock_capture" { 
      "_pi"=1P00111010; }
   Ann {* full_sequential *}
   "pattern 168": Call "load_unload" { 
      "SPEAKER"=LXXHLHHLHHLLLLHLHLHHHLLHLLHHLHLHHHHLLHLH; "TEST_SI"=0011101001100101100100101111100100010000; }
   Call "allclock_launch" { 
      "_pi"=0P00111110; }
   Call "allclock_capture" { 
      "_pi"=1P01101010; }
   Ann {* full_sequential *}
   "pattern 169": Call "load_unload" { 
      "SPEAKER"=LLXHLHHLHLLLHHHLHLLHHHLHLLLLLHLHHHLHLHLH; "TEST_SI"=1101010001011011100110111101111011110001; }
   Call "allclock_launch" { 
      "_pi"=1P01101010; }
   Call "allclock_capture" { 
      "_pi"=0P11111001; }
   Ann {* full_sequential *}
   "pattern 170": Call "load_unload" { 
      "SPEAKER"=LXXLHLHHLLHLLHHLHLHLLHLLLLHLLLLHLLLLLHLH; "TEST_SI"=0101010011111011101001101001111010001101; }
   Call "allclock_launch" { 
      "_pi"=1P01111111; }
   Call "allclock_capture" { 
      "_pi"=0P11111010; }
   Ann {* full_sequential *}
   "pattern 171": Call "load_unload" { 
      "SPEAKER"=LLXHLHHHHLLLHLHLHLHHLLHLHHLLLLHLHLHLLHLH; "TEST_SI"=0000111001111111010000000000111000101010; }
   Call "allclock_launch" { 
      "_pi"=1P01111011; }
   Call "allclock_capture" { 
      "_pi"=1P11101010; }
   Ann {* full_sequential *}
   "pattern 172": Call "load_unload" { 
      "SPEAKER"=LXXHHHHLHLLLLLHLHLHHHHHLHHHHLHLHHHLLLHLH; "TEST_SI"=1011011000100111011111000111101000100010; }
   Call "allclock_launch" { 
      "_pi"=1P01111010; }
   Call "allclock_capture" { 
      "_pi"=0P11101010; }
   Ann {* full_sequential *}
   "pattern 173": Call "load_unload" { 
      "SPEAKER"=LXXHLHHLHHLHHLHLHLLLLHLHHLLLLHLHHHLLLHLH; "TEST_SI"=1111010110010011011110100011100110010010; }
   Call "allclock_launch" { 
      "_pi"=1P01111000; }
   Call "allclock_capture" { 
      "_pi"=0P10101011; }
   Ann {* full_sequential *}
   "pattern 174": Call "load_unload" { 
      "SPEAKER"=LXXLHLHHLHHLHHHLHLLLLHLLHHLLLHLHHHHLLHLH; "TEST_SI"=0110101011001101110101111111001010101111; }
   Call "allclock_launch" { 
      "_pi"=0P10101110; }
   Call "allclock_capture" { 
      "_pi"=0P11101011; }
   Ann {* full_sequential *}
   "pattern 175": Call "load_unload" { 
      "SPEAKER"=LHXLHLHHHHHLLHHLHLLHLLLLLLLHHLHLHLHLLHLH; "TEST_SI"=0001001001100111111111011100010111010010; }
   Call "allclock_launch" { 
      "_pi"=1P01111101; }
   Call "allclock_capture" { 
      "_pi"=1P01101011; }
   Ann {* full_sequential *}
   "pattern 176": Call "load_unload" { 
      "SPEAKER"=HLXHHLLLHLHHLLHLLLLLLHLLLHHHLHLLLHLLLHLH; "TEST_SI"=1101010010011000010111001010100100011010; }
   Call "allclock_launch" { 
      "_pi"=1P01111010; }
   Call "allclock_capture" { 
      "_pi"=1P00101000; }
   Ann {* full_sequential *}
   "pattern 177": Call "load_unload" { 
      "SPEAKER"=LXXHLHHLHHHHLHHLHLHLLLHLLHLHLHLHHHHLLHLH; "TEST_SI"=0001001111001000010011100110011011011000; }
   Call "allclock_launch" { 
      "_pi"=1P10111010; }
   Call "allclock_capture" { 
      "_pi"=1P00101001; }
   Ann {* full_sequential *}
   "pattern 178": Call "load_unload" { 
      "SPEAKER"=LXXLHHLLLHHLLLHLHLHHLLLHHLLHHLLLHLHLLHLH; "TEST_SI"=0110100110010101010101101000101110100010; }
   Call "allclock_launch" { 
      "_pi"=0P00101000; }
   Call "allclock_capture" { 
      "_pi"=0P01101001; }
   Ann {* full_sequential *}
   "pattern 179": Call "load_unload" { 
      "SPEAKER"=HXXHLHHLLHHLHLHLHLHLHLLLLHHHLHLHHLLLLHLH; "TEST_SI"=1010100100010111110101111000101010100101; }
   Call "allclock_launch" { 
      "_pi"=0P11111010; }
   Call "allclock_capture" { 
      "_pi"=0P11111001; }
   Ann {* full_sequential *}
   "pattern 180": Call "load_unload" { 
      "SPEAKER"=HXXHLHHLLHHLHLHLHLHLHLLLLHHHLHLHLHLLLHLH; "TEST_SI"=0000100111101101011110110001100100011000; }
   Call "multiclock_capture" { 
      "_pi"=0000111011; }
   Call "allclock_launch_capture" { 
      "_pi"=1001111001; "_po"=HHTHHTHLHHLHTTTLHHHHLLLHHLLHHH; }
   Ann {* full_sequential *}
   "pattern 181": Call "load_unload" { 
      "SPEAKER"=HHHHLHHLLLLHLLHLHLLLLHLLHHHLLHHLHHHLLHHH; "TEST_SI"=0100111010010101010100010110101001100010; }
   Call "allclock_launch" { 
      "_pi"=0P11101000; }
   Call "allclock_capture" { 
      "_pi"=1011111000; "_po"=HLTLLTLLLLLLTTTHLHHLHLHHLHLLLL; }
   Ann {* full_sequential *}
   "pattern 182": Call "load_unload" { 
      "SPEAKER"=LHXHLLLHLHHLHLHLHLHLLLLHHLLHLHLHHHLLLHLH; "TEST_SI"=1110110010010001010101101100101000000000; }
   Call "allclock_launch" { 
      "_pi"=0P00111011; }
   Call "allclock_capture" { 
      "_pi"=0000111010; "_po"=LHTLLTHLLHHLTTTLHHHHLLLHHLLHHL; }
   Ann {* full_sequential *}
   "pattern 183": Call "load_unload" { 
      "SPEAKER"=LLXHLLHHLHHLHHHLHLHLHLLLLLHHLHLHHHHLLHLH; "TEST_SI"=0000111010100111110100100011000110101111; }
   Call "allclock_launch" { 
      "_pi"=1P10111010; }
   Call "allclock_capture" { 
      "_pi"=0011111010; "_po"=HHTHHTLHHLHHTTTHHHHHHLLHHLLHHL; }
   Ann {* full_sequential *}
   "pattern 184": Call "load_unload" { 
      "SPEAKER"=LHXHHHHLHHLHHLHLHLHLHHLHHLHHLHLHHHLHLHLL; "TEST_SI"=0010110110010111011010001001010100111001; }
   Call "multiclock_capture" { 
      "_pi"=0000111011; }
   Call "allclock_launch_capture" { 
      "_pi"=1011101010; "_po"=HLTLLTLLLLLLTTTHHHHHHLHHHHLHHH; }
   Ann {* full_sequential *}
   "pattern 185": Call "load_unload" { 
      "SPEAKER"=HHLHLLHLLHHLHLLLHLLHLHHHLHHLHLHLHHLLLHHL; "TEST_SI"=0001000010011010010111101010111001100010; }
   Call "multiclock_capture" { 
      "_pi"=0000111000; }
   Call "allclock_launch_capture" { 
      "_pi"=1001111010; "_po"=LLTLLTLLLHHLTTTLHHLHLLLHHLHHLH; }
   Ann {* full_sequential *}
   "pattern 186": Call "load_unload" { 
      "SPEAKER"=HHHLHHHHLHHLLHLHHLHLLLLHLHLHLLLHHLLHHHLH; "TEST_SI"=1101101110001111110111110011010110101011; }
   Call "multiclock_capture" { 
      "_pi"=0000101011; }
   Call "allclock_launch_capture" { 
      "_pi"=1010111001; "_po"=HHTLLTLLHHHHTTTLHHHHLLLHHHHLLL; }
   Ann {* full_sequential *}
   "pattern 187": Call "load_unload" { 
      "SPEAKER"=LLHLLHLLLHHHLLLLLLHLLLLLHHLLHLHLLHLHLHLL; "TEST_SI"=1100011110010010110010100010010110101111; }
   Call "allclock_launch" { 
      "_pi"=0P11111011; }
   Call "allclock_capture" { 
      "_pi"=0010111000; "_po"=HLTHHTLLLHHLTTTHHLHHHHHHHHHLHL; }
   Ann {* full_sequential *}
   "pattern 188": Call "load_unload" { 
      "SPEAKER"=LHXHHLLLLHHLHHHLHLHHLHLHHHLLLHLHHHLLLHLH; "TEST_SI"=1011010001101001111011011111100110000000; }
   Call "allclock_launch" { 
      "_pi"=0P11101011; }
   Call "allclock_capture" { 
      "_pi"=0011101011; "_po"=LHTLLTHHHHHHTTTLLLLLLLLLLLLLLL; }
   Ann {* full_sequential *}
   "pattern 189": Call "load_unload" { 
      "SPEAKER"=LLXLHLHHHLLHLHHLHLHLHLLHHHHHLHLHHHHLLHLH; "TEST_SI"=1010110110001000111001101011110001001111; }
   Call "allclock_launch" { 
      "_pi"=0P11101010; }
   Call "allclock_capture" { 
      "_pi"=0001111001; "_po"=LHTLLTHLLHHLTTTHLHHLHHHHHHHHLL; }
   Ann {* full_sequential *}
   "pattern 190": Call "load_unload" { 
      "SPEAKER"=LLXHLLHLLHLLHHHLHLLHHLLHLLHHLHLHHHHLLHLH; "TEST_SI"=1110010001100011111111001101101101001111; }
   Call "allclock_launch" { 
      "_pi"=0P00101011; }
   Call "allclock_capture" { 
      "_pi"=0001111000; "_po"=LHTLLTHHHHLLTTTHLHHLLHHLHHHHLL; }
   Ann {* full_sequential *}
   "pattern 191": Call "load_unload" { 
      "SPEAKER"=LLXHHLHHLLLHHHHLHLLLLLHHLLLHLHLHHHHLLHLH; "TEST_SI"=1100110010000100010100111100111011001111; }
   Call "allclock_launch" { 
      "_pi"=0P00101011; }
   Call "allclock_capture" { 
      "_pi"=0010101011; "_po"=LHTLLTHLHHLHTTTHHHHHHLHHLHLHHL; }
   Ann {* full_sequential *}
   "pattern 192": Call "load_unload" { 
      "SPEAKER"=LHXHLLHHLHHHLLHLHLHLHHLLLLHLLHLHHHHLLHLH; "TEST_SI"=0000001000110010110110101001100001101101; }
   Call "allclock_launch" { 
      "_pi"=0P00101000; }
   Call "allclock_capture" { 
      "_pi"=0010101011; "_po"=HHTLLTLHHLHHTTTHLHHLLHHLHHLLLL; }
   Ann {* full_sequential *}
   "pattern 193": Call "load_unload" { 
      "SPEAKER"=LHXHHHLHHHLLHHHLHLHLLHLHLHLHLHLHHHLHLHLH; "TEST_SI"=1100101010101011000111010111100110111111; }
   Call "allclock_launch" { 
      "_pi"=1P11101011; }
   Call "allclock_capture" { 
      "_pi"=0001111011; "_po"=HHTHHTHLHHLHTTTLLHHLLLLHHLLLLL; }
   Ann {* full_sequential *}
   "pattern 194": Call "load_unload" { 
      "SPEAKER"=LHXHLLHLHHLHLHHLHLHLLLHLHLLLLHHLLHLLLHLH; "TEST_SI"=0010011010101111010101111110001011000110; }
   Call "allclock_launch" { 
      "_pi"=1P01111000; }
   Call "allclock_capture" { 
      "_pi"=0001111001; "_po"=LHTLLTHHHHLLTTTLHHHHLLLHHLLHHL; }
   Ann {* full_sequential *}
   "pattern 195": Call "load_unload" { 
      "SPEAKER"=LLXLLHHLHHLHLLLLLLHLHLLLLLLHHHLHLLHHHHHH; "TEST_SI"=1001000111111011101010010111100101001111; }
   Call "allclock_launch" { 
      "_pi"=1P00111000; }
   Call "allclock_capture" { 
      "_pi"=0011101000; "_po"=LLTLLTLLLLLLTTTLHHLHHLLHHLHHLL; }
   Ann {* full_sequential *}
   "pattern 196": Call "load_unload" { 
      "SPEAKER"=LHXLHHHHHLLLLHHLHLLHLHHLLHHHLHLHHHHLLHLH; "TEST_SI"=1111011010011011000000110111000101010100; }
   Call "allclock_launch" { 
      "_pi"=1P11101011; }
   Call "allclock_capture" { 
      "_pi"=0000111010; "_po"=LHTHHTHLHHLHTTTLHLHHLLLHHLHLHL; }
   Ann {* full_sequential *}
   "pattern 197": Call "load_unload" { 
      "SPEAKER"=LLXHLHHLHHHLLHHLHLHHHHLLHLLLHHHLHLHLLHLH; "TEST_SI"=1110011010001111101000100011001011110101; }
   Call "allclock_launch" { 
      "_pi"=1P11101001; }
   Call "allclock_capture" { 
      "_pi"=0011101000; "_po"=HLTHHTLLLHHLTTTHHHLHLHHLHHHHLL; }
   Ann {* full_sequential *}
   "pattern 198": Call "load_unload" { 
      "SPEAKER"=LLXLLHHLHHHHLLHLHLLHHHLHHHLLHHLHLLLHLHLH; "TEST_SI"=1000010011000001001101010001100010111110; }
   Call "multiclock_capture" { 
      "_pi"=0000111011; }
   Call "allclock_launch_capture" { 
      "_pi"=1001101001; "_po"=LLTHHTHHHHHHTTTLHLHHLLLHHHHLHL; }
   Ann {* full_sequential *}
   "pattern 199": Call "load_unload" { 
      "SPEAKER"=LHHHHLHHLLHHHHHLHHLLHLHLHHHLLHHHLHLLLLLH; "TEST_SI"=1110010011110000001010011101011000100011; }
   Call "allclock_launch" { 
      "_pi"=0P01111000; }
   Call "allclock_capture" { 
      "_pi"=1001101011; "_po"=HLTLLTLLLHHLTTTLHLHHLLLHHHHLHL; }
   Ann {* full_sequential *}
   "pattern 200": Call "load_unload" { 
      "SPEAKER"=LLXHHLHHLHHLLLHLHLHLHLLHLLHLLHLHHHLLLHLH; "TEST_SI"=0010001011001100111010111000010001001011; }
   Call "multiclock_capture" { 
      "_pi"=0011111000; }
   Call "allclock_launch_capture" { 
      "_pi"=1011111011; "_po"=HLTHHTLLLHHLTTTHHLHHLLHHHHHLHH; }
   Ann {* full_sequential *}
   "pattern 201": Call "load_unload" { 
      "SPEAKER"=HHLHHHLHLLHHLLHHLLLHLHLLLHHHHLHHHLHHLHLL; "TEST_SI"=0001110111111000110010111100011111000000; }
   Call "allclock_launch" { 
      "_pi"=0P11101000; }
   Call "allclock_capture" { 
      "_pi"=1011111011; "_po"=LHTHHTHLLHHLTTTLLHHLLLLHHLHHLL; }
   Ann {* full_sequential *}
   "pattern 202": Call "load_unload" { 
      "SPEAKER"=LHXLLLHLLLLHHHHLHLHHLHHHLLHHLHLHHHHLLHLH; "TEST_SI"=1011101000110111110010011001001001101101; }
   Call "multiclock_capture" { 
      "_pi"=0001101010; }
   Call "allclock_launch_capture" { 
      "_pi"=1010101011; "_po"=HHTLLTHLLHHLTTTHHHHHHHHHHHHLLL; }
   Ann {* full_sequential *}
   "pattern 203": Call "load_unload" { 
      "SPEAKER"=LHLLLHLHHHLLHLLLLLHHLHHLLHHLHHLHHLLHLLHL; "TEST_SI"=1101111100010001111100010110100110100010; }
   Call "allclock_launch" { 
      "_pi"=0P10111011; }
   Call "allclock_capture" { 
      "_pi"=1011111000; "_po"=LLTLLTLLLLLLTTTHLHHLHLLHHLHHLL; }
   Ann {* full_sequential *}
   "pattern 204": Call "load_unload" { 
      "SPEAKER"=LHXLLLLLHHHLHHHLHLLLLLLHHLLHLHLHHHLHLLLL; "TEST_SI"=1111110011101011101100001111101011110101; }
   Call "allclock_launch" { 
      "_pi"=1P10101010; }
   Call "allclock_capture" { 
      "_pi"=0011111011; "_po"=HLTLLTLLLHHHTTTHHHHHHHHHHHHLLL; }
   Ann {* full_sequential *}
   "pattern 205": Call "load_unload" { 
      "SPEAKER"=LLXLLLLLHLLHLHHLHLLLHHHHLLLLLHLHLLLHLHLH; "TEST_SI"=1001001010000011111101000000101010011100; }
   Call "allclock_launch" { 
      "_pi"=1P00101001; }
   Call "allclock_capture" { 
      "_pi"=0001111000; "_po"=LHTLLTHHHHHHTTTHHHHHHLLHHLHLLL; }
   Ann {* full_sequential *}
   "pattern 206": Call "load_unload" { 
      "SPEAKER"=LHXLHLHLHHHHHHHLHLLLHLHHHHHHLHLHLHHLLHLH; "TEST_SI"=1101000001001101001011110010100011001001; }
   Call "multiclock_capture" { 
      "_pi"=0000101000; }
   Call "allclock_launch_capture" { 
      "_pi"=1011111011; "_po"=HLTHHTLLLHHLTTTLHHLHHHHHHHHHLL; }
   Ann {* full_sequential *}
   "pattern 207": Call "load_unload" { 
      "SPEAKER"=LLHLHHHHHLHHLLHLHHLHLLLLHHLHLHHHLLHHLHHL; "TEST_SI"=1110010100010010100101000111000101100110; }
   Call "multiclock_capture" { 
      "_pi"=0010111010; }
   Call "allclock_launch_capture" { 
      "_pi"=1000101011; "_po"=LLTLLTLLLLLLTTTHHLHHHLLHHLHLHL; }
   Ann {* full_sequential *}
   "pattern 208": Call "load_unload" { 
      "SPEAKER"=LLLHHLHLHHHLHHLHLHHLHLHHHLLLHHHLHLLHHLLH; "TEST_SI"=0011100100000011011110000110010110000000; }
   Call "allclock_launch" { 
      "_pi"=0P10101000; }
   Call "allclock_capture" { 
      "_pi"=0000111011; "_po"=LHTHHTHLLHHLTTTLLHHLLLLHHHHHLL; }
   Ann {* full_sequential *}
   "pattern 209": Call "load_unload" { 
      "SPEAKER"=LLXLLHHLLHHHHHHLHLLLLHHLHLLHLHLHHHHLLHLH; "TEST_SI"=0100111010001011010011001111100111111111; }
   Call "allclock_launch" { 
      "_pi"=1P10101010; }
   Call "allclock_capture" { 
      "_pi"=0010101011; "_po"=HLTLLTLLLHHHTTTHHLHHHHHHLLHLHL; }
   Ann {* full_sequential *}
   "pattern 210": Call "load_unload" { 
      "SPEAKER"=LHXHHHHLHHHHLHHHHHHHLLHHLLLLLHHLLLLLLHLH; "TEST_SI"=0110111010010011110011111000101011011100; }
   Call "allclock_launch" { 
      "_pi"=1P11111010; }
   Call "allclock_capture" { 
      "_pi"=0010101010; "_po"=LLTLLTLLLLLLTTTHHLHHHLHHLHHLHL; }
   Ann {* full_sequential *}
   "pattern 211": Call "load_unload" { 
      "SPEAKER"=LLXHHHHLHHHLHHHLHLHHLLLLLHHHLHLHLLHLLHLH; "TEST_SI"=1100011011110111101010110101001001000101; }
   Call "allclock_launch" { 
      "_pi"=1P10111010; }
   Call "allclock_capture" { 
      "_pi"=0000111010; "_po"=LHTHHTLLHHHHTTTHHHLHHLHHLHHHLL; }
   Ann {* full_sequential *}
   "pattern 212": Call "load_unload" { 
      "SPEAKER"=LHXLLHHLHLLLHLHLHLLHLHLLHLHLHHLHHLHHLHLH; "TEST_SI"=0010101011001011100001001111101111001101; }
   Call "allclock_launch" { 
      "_pi"=1P01111000; }
   Call "allclock_capture" { 
      "_pi"=0010111011; "_po"=LHTLLTHHHHHHTTTHLHHLHHHHHHLLLL; }
   Ann {* full_sequential *}
   "pattern 213": Call "load_unload" { 
      "SPEAKER"=LLXHLLHLHLHHLHHLHLHHHLHHHHHHLHLHHHHHLHLH; "TEST_SI"=1100110011001111110100000001001101100111; }
   Call "allclock_launch" { 
      "_pi"=1P11111000; }
   Call "allclock_capture" { 
      "_pi"=0001101010; "_po"=HHTLLTHLHHHHTTTHHHHHHHHHLLLHHL; }
   Ann {* full_sequential *}
   "pattern 214": Call "load_unload" { 
      "SPEAKER"=LHXHLLLLHLHHLLHLHLHLHHHHHHHLHHLLHLLLLHLH; "TEST_SI"=1000011011000011011111101001001010000100; }
   Call "allclock_launch" { 
      "_pi"=1P01101000; }
   Call "allclock_capture" { 
      "_pi"=0001101000; "_po"=LLTLLTLLLHHLTTTLLHHLHHHHHHHHLL; }
   Ann {* full_sequential *}
   "pattern 215": Call "load_unload" { 
      "SPEAKER"=LHXLLHHLHLHHHHLLLLLLLLLHLHHLHHLHLHHLLHLH; "TEST_SI"=0110111011001011001011100010101001100101; }
   Call "allclock_launch" { 
      "_pi"=1P10111001; }
   Call "allclock_capture" { 
      "_pi"=0010111010; "_po"=HLTHHTHHHHHHTTTHHHLHHHHHLLHHLH; }
   Ann {* full_sequential *}
   "pattern 216": Call "load_unload" { 
      "SPEAKER"=HLXHHHHLHLHHLHHLHHLHLLLHHHLHLHLHHLLHLHLH; "TEST_SI"=0111011010011111110110000001000011100101; }
   Call "allclock_launch" { 
      "_pi"=1P00101001; }
   Call "allclock_capture" { 
      "_pi"=0010111011; "_po"=HHTLLTHLHHHHTTTHLHHLHLLHHLLLLH; }
   Ann {* full_sequential *}
   "pattern 217": Call "load_unload" { 
      "SPEAKER"=HLXHLHHLHHHLLLHLHLHLLHHHHHHLHHHHLLLHLHLH; "TEST_SI"=0100011010000011111110000010001111000100; }
   Call "allclock_launch" { 
      "_pi"=1P11101001; }
   Call "allclock_capture" { 
      "_pi"=0010101011; "_po"=LLTHHTHHHHHHTTTHLHHLHHHHLLHHLH; }
   Ann {* full_sequential *}
   "pattern 218": Call "load_unload" { 
      "SPEAKER"=HHXLLHHLHHHHHHHLHLLLLHHHHHLHHHLLLLHLLHLH; "TEST_SI"=0101110010111010010000110001100011111001; }
   Call "multiclock_capture" { 
      "_pi"=0011101001; }
   Call "allclock_launch_capture" { 
      "_pi"=1001101010; "_po"=LHTLLTHLHHLHTTTHLHHLLLHHHHHHLH; }
   Ann {* full_sequential *}
   "pattern 219": Call "load_unload" { 
      "SPEAKER"=HLHLLLHHLHLLLHLHHLHHHHLLHHHLLHHHLLLLLHHL; "TEST_SI"=1111010111010001110100011000110000000000; }
   Call "allclock_launch" { 
      "_pi"=0P01101010; }
   Call "allclock_capture" { 
      "_pi"=1001101000; "_po"=LHTLLTHHHHHHTTTLHHLHLLLHHHHHLL; }
   Ann {* full_sequential *}
   "pattern 220": Call "load_unload" { 
      "SPEAKER"=LLXLHLHLLLHLHHHLHLHLLLLHLHHHLHLHHHHLLHLH; "TEST_SI"=1111011011110011110101000111101101010101; }
   Call "allclock_launch" { 
      "_pi"=1P11101001; }
   Call "allclock_capture" { 
      "_pi"=0000101001; "_po"=LHTHHTHLHHLHTTTHHHHHLHHLHHLHHL; }
   Ann {* full_sequential *}
   "pattern 221": Call "load_unload" { 
      "SPEAKER"=LLXHLHHLHLLLHHHLHLHLHLHHHLLLLHLLHLHHLHLH; "TEST_SI"=0000001001111110000011010000010100001101; }
   Call "multiclock_capture" { 
      "_pi"=0011111011; }
   Call "allclock_launch_capture" { 
      "_pi"=1011101010; "_po"=HHTHHTLLHHHHTTTHHLHHLHHLHHHLHH; }
   Ann {* full_sequential *}
   "pattern 222": Call "load_unload" { 
      "SPEAKER"=HHHHHHLHHLLLLLLHHHHHLLHLHHHHHLHLHHHHLLHL; "TEST_SI"=0011011010001111110011100100001110010100; }
   Call "allclock_launch" { 
      "_pi"=1P11111010; }
   Call "allclock_capture" { 
      "_pi"=0001101011; "_po"=LHTHHTLHHLHHTTTHHLHHHLLHHLHLHL; }
   Ann {* full_sequential *}
   "pattern 223": Call "load_unload" { 
      "SPEAKER"=LLXHLHHLHHHHLLHLHLHHLLLHHLHHHHLLLHHLLHLH; "TEST_SI"=0100011100110011111101011101110110110101; }
   Call "multiclock_capture" { 
      "_pi"=0001111001; }
   Call "allclock_launch_capture" { 
      "_pi"=1000111000; "_po"=LHTLLTHLLHHLTTTHHLHHHHHHHHHLHH; }
   Ann {* full_sequential *}
   "pattern 224": Call "load_unload" { 
      "SPEAKER"=HLHHHLLLHHLLHHLLLLLLHLHLLLHLLLHLLHLLHLHL; "TEST_SI"=1000101111010011111001111000001011011001; }
   Call "multiclock_capture" { 
      "_pi"=1011101001; }
   Call "allclock_launch_capture" { 
      "_pi"=0001111011; "_po"=LLTLLTLLLLLLTTTHLHHLHLHHHHHHLL; }
   Ann {* full_sequential *}
   "pattern 225": Call "load_unload" { 
      "SPEAKER"=LHHHLHLLLLHLHHLLLLLHHLLLLHHHHHLHLLHLLHHL; "TEST_SI"=0010011110100001100101011110000010001111; }
   Call "multiclock_capture" { 
      "_pi"=0001111000; }
   Call "allclock_launch_capture" { 
      "_pi"=1011111000; "_po"=LHTLLTHHHHLLTTTHHLHHHLHHHHHLHH; }
   Ann {* full_sequential *}
   "pattern 226": Call "load_unload" { 
      "SPEAKER"=HHLHHLLLLHLHHHHLLHHLHLHLLLLHHHHHLHHHLLLL; "TEST_SI"=0000111001000001010111110010001100100001; }
   Call "allclock_launch" { 
      "_pi"=0P10101001; }
   Call "allclock_capture" { 
      "_pi"=0011101011; "_po"=HLTHHTHHHHHHTTTLLHHLHHHHHHLLLH; }
   Ann {* full_sequential *}
   "pattern 227": Call "load_unload" { 
      "SPEAKER"=HHXHLLLHHLHHHHHLHLHLLLHHHHLHLHLHHHLHLHLH; "TEST_SI"=0100011010110111101110101000101001010101; }
   Call "allclock_launch" { 
      "_pi"=1P01101011; }
   Call "allclock_capture" { 
      "_pi"=0000111010; "_po"=LLTLLTLLLLLLTTTHLHHLHLLHHLHHLH; }
   Ann {* full_sequential *}
   "pattern 228": Call "load_unload" { 
      "SPEAKER"=HHXLLHHLHHLLHLHLHLLLLHLHLHHHLHLHHLHHLHLH; "TEST_SI"=0011101011100101000111011010010011111011; }
   Call "allclock_launch" { 
      "_pi"=0P01101001; }
   Call "allclock_capture" { 
      "_pi"=0010111001; "_po"=HHTLLTLHHLHHTTTHLHHLLHHLHHLLLH; }
   Ann {* full_sequential *}
   "pattern 229": Call "load_unload" { 
      "SPEAKER"=HLXLLHLHLLLHHLHLHLHLLHLHLHLHLHLHHHLLLHLH; "TEST_SI"=0100101110100100101011011000111111001111; }
   Call "multiclock_capture" { 
      "_pi"=0001111001; }
   Call "allclock_launch_capture" { 
      "_pi"=1010101010; "_po"=HHTLLTHHHHLLTTTHHHHHHLHHLHLHHH; }
   Ann {* full_sequential *}
   "pattern 230": Call "load_unload" { 
      "SPEAKER"=HLHHLHLLLHLHHLHHLHLHLLHLLHHHLLLLLLHHLLLL; "TEST_SI"=0010101011010010001110101110110010110011; }
   Call "multiclock_capture" { 
      "_pi"=0000111010; }
   Call "allclock_launch_capture" { 
      "_pi"=1000101000; "_po"=LHTLLTHHHHHHTTTLHHHHLLLHHHLHHH; }
   Ann {* full_sequential *}
   "pattern 231": Call "load_unload" { 
      "SPEAKER"=HHLHLHLHLLHLHHLHHHLLLHLHLLLHLLHHLHLLHHLL; "TEST_SI"=0110001110111100101100111111000110000111; }
   Call "allclock_launch" { 
      "_pi"=1P01101000; }
   Call "allclock_capture" { 
      "_pi"=0011111000; "_po"=LLTLLTLLLHHHTTTLHHHHLLLHHHHLLL; }
   Ann {* full_sequential *}
   "pattern 232": Call "load_unload" { 
      "SPEAKER"=LLXHHHLLLHLHHLHLHLLLHHLLLLLLHHHLLHHLLHLH; "TEST_SI"=1000000010001100110100011101100101000111; }
   Call "allclock_launch" { 
      "_pi"=1P11111011; }
   Call "allclock_capture" { 
      "_pi"=0010111000; "_po"=LHTLLTHLHHLHTTTLHHHHLLLHHHLHHL; }
   Ann {* full_sequential *}
   "pattern 233": Call "load_unload" { 
      "SPEAKER"=LHXHHHHHLHLLHLHLHLHLHHHLLLHLLHHLHLHLLHLH; "TEST_SI"=0111100010111101111011010100110101100000; }
   Call "allclock_launch" { 
      "_pi"=0P11101010; }
   Call "allclock_capture" { 
      "_pi"=1011111011; "_po"=HHTLLTHLHHLHTTTHHHHHHLHHLHHLLL; }
   Ann {* full_sequential *}
   "pattern 234": Call "load_unload" { 
      "SPEAKER"=LLXLLHHHLHLLLLHLHLHLHLLHLHHLLHLHHHHLLHLH; "TEST_SI"=0101100010110111110010010011000011101100; }
   Call "allclock_launch" { 
      "_pi"=1P00101011; }
   Call "allclock_capture" { 
      "_pi"=0010111001; "_po"=HHTHHTLHHLHHTTTLHHHHLLLHHLHLLH; }
   Ann {* full_sequential *}
   "pattern 235": Call "load_unload" { 
      "SPEAKER"=HHXLLHLLHHLLHLHLHLHHLHHLHLHHLHLHHHLLLHLH; "TEST_SI"=1101101011000111100110100101101001010111; }
   Call "allclock_launch" { 
      "_pi"=1P10101000; }
   Call "allclock_capture" { 
      "_pi"=0011111010; "_po"=LHTHHTLLHHHHTTTHLHHLLHHLHHLLLL; }
   Ann {* full_sequential *}
   "pattern 236": Call "load_unload" { 
      "SPEAKER"=LHXLLLHLHLHHHLHLHLHLLHLHHLHLLHLHHLHLLHLH; "TEST_SI"=1010111010000011011111000010100110111101; }
   Call "allclock_launch" { 
      "_pi"=1P00111011; }
   Call "allclock_capture" { 
      "_pi"=0001111010; "_po"=HLTHHTHHHHHHTTTHLHHLLHHLHHHHLL; }
   Ann {* full_sequential *}
   "pattern 237": Call "load_unload" { 
      "SPEAKER"=LLXHHHHLHHHHHHHLHLLLLLHHHHLHLHHLLHLHLHLH; "TEST_SI"=1110101011100100000000110100100000000011; }
   Call "allclock_launch" { 
      "_pi"=0P00111000; }
   Call "allclock_capture" { 
      "_pi"=0000101010; "_po"=LHTHHTLHHLHHTTTHHLHHLHHLHHHLHL; }
   Ann {* full_sequential *}
   "pattern 238": Call "load_unload" { 
      "SPEAKER"=LLXHLHLHLLLHLLHLHLHHHHHHHLHHLHLHHHHLLHLH; "TEST_SI"=0001111010100011000010000110101001111100; }
   Call "allclock_launch" { 
      "_pi"=1P11101010; }
   Call "allclock_capture" { 
      "_pi"=0011101000; "_po"=HHTHHTHLLHHLTTTLHHHHHHHHHHHLLL; }
   Ann {* full_sequential *}
   "pattern 239": Call "load_unload" { 
      "SPEAKER"=LHXLHHHLHHLHHHHLHLHHLHHHHLLHLHLHHLLLLHLH; "TEST_SI"=0101010101001011110001010011100101000001; }
   Call "allclock_launch" { 
      "_pi"=0P01111001; }
   Call "allclock_capture" { 
      "_pi"=0011111010; "_po"=LLTHHTLLLHHLTTTLHLHHHHHHHHHLHH; }
   Ann {* full_sequential *}
   "end 239 unload": Call "load_unload" { 
      "SPEAKER"=HHXLHLHLLLHHLHHLHLHHHHLHHHLLLHLHHHHHLHLH; }
}

// Patterns reference 964 V statements, generating 10363 test cycles
