
module CLOCK_GEN_test_1 ( CLK, RESETN, INT_CLK, COMPUTE_BLOCK_TM_FIX_in, 
        test_se, test_si1, test_so1 );
  input CLK, RESETN, COMPUTE_BLOCK_TM_FIX_in, test_se, test_si1;
  output INT_CLK, test_so1;
  wire   COUNT, n2, n4, n5;

  TFSEC3 COUNT_reg ( .T(n2), .SD(test_si1), .SE(test_se), .C(CLK), .RN(RESETN), 
        .Q(COUNT) );
  DFSC3 INT_CLK_reg ( .D(COUNT), .SD(COUNT), .SE(test_se), .C(CLK), .RN(RESETN), .Q(test_so1) );
  LOGIC1 U4 ( .Q(n2) );
  CLKIN6 U3 ( .A(test_so1), .Q(n5) );
  CLKIN6 U5 ( .A(CLK), .Q(n4) );
  IMUX23 U6 ( .A(n5), .B(n4), .S(COMPUTE_BLOCK_TM_FIX_in), .Q(INT_CLK) );
endmodule


module TIME_STATE_MACHINE_test_1 ( TIME_BUTTON, HOURS_BUTTON, MINUTES_BUTTON, 
        CLK, RESETN, SECS, HOURS, MINS, test_se, test_si1, test_so1 );
  input TIME_BUTTON, HOURS_BUTTON, MINUTES_BUTTON, CLK, RESETN, test_se,
         test_si1;
  output SECS, HOURS, MINS, test_so1;
  wire   NEXT_SECS, NEXT_HOURS, n7, n11, n12, n13, n14, n2, n3, n4, n5, n1, n6,
         n8;
  wire   [1:0] NEXT_STATE;
  wire   [1:0] CURRENT_STATE;

  DFSC1 CURRENT_STATE_reg_1_ ( .D(NEXT_STATE[1]), .SD(n8), .SE(test_se), .C(
        CLK), .RN(RESETN), .Q(CURRENT_STATE[1]), .QN(n7) );
  DFSC1 CURRENT_STATE_reg_0_ ( .D(NEXT_STATE[0]), .SD(test_si1), .SE(test_se), 
        .C(CLK), .RN(RESETN), .Q(CURRENT_STATE[0]), .QN(n8) );
  DFSC1 MINS_reg ( .D(n2), .SD(n6), .SE(test_se), .C(CLK), .RN(RESETN), .Q(
        MINS), .QN(n1) );
  DFSC1 SECS_reg ( .D(NEXT_SECS), .SD(n1), .SE(test_se), .C(CLK), .RN(RESETN), 
        .Q(SECS), .QN(test_so1) );
  DFSC1 HOURS_reg ( .D(NEXT_HOURS), .SD(n7), .SE(test_se), .C(CLK), .RN(RESETN), .Q(HOURS), .QN(n6) );
  NOR40 U3 ( .A(n4), .B(n5), .C(CURRENT_STATE[0]), .D(HOURS_BUTTON), .Q(
        NEXT_STATE[1]) );
  NOR21 U4 ( .A(n13), .B(CURRENT_STATE[1]), .Q(NEXT_STATE[0]) );
  OAI311 U5 ( .A(n11), .B(CURRENT_STATE[0]), .C(NEXT_STATE[0]), .D(n12), .Q(
        NEXT_SECS) );
  NOR31 U6 ( .A(n4), .B(HOURS_BUTTON), .C(n5), .Q(n11) );
  NAND31 U7 ( .A(n13), .B(n7), .C(CURRENT_STATE[0]), .Q(n12) );
  INV3 U8 ( .A(n14), .Q(n2) );
  NAND22 U9 ( .A(n7), .B(NEXT_STATE[1]), .Q(n14) );
  NOR21 U10 ( .A(CURRENT_STATE[0]), .B(n3), .Q(NEXT_HOURS) );
  INV3 U11 ( .A(NEXT_STATE[0]), .Q(n3) );
  NAND31 U12 ( .A(HOURS_BUTTON), .B(n5), .C(TIME_BUTTON), .Q(n13) );
  INV3 U13 ( .A(MINUTES_BUTTON), .Q(n5) );
  INV3 U14 ( .A(TIME_BUTTON), .Q(n4) );
endmodule


module TIME_COUNTER_test_1 ( HOURS, MINS, SECS, CLK, RESETN, HOURS_OUT, 
        MINUTES_OUT, AM_PM_OUT, test_so, test_se, test_si1, test_so1 );
  output [3:0] HOURS_OUT;
  output [5:0] MINUTES_OUT;
  input HOURS, MINS, SECS, CLK, RESETN, test_se, test_si1;
  output AM_PM_OUT, test_so, test_so1;
  wire   N23, N24, N25, N28, N29, N30, N31, N32, N45, N46, N47, N48, N49, N63,
         N64, N65, N90, N91, N92, N137, n22, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, test_so, n37, n38, n39, n40, n41, n45, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, N179, N173,
         N172, N170, n1, n2, n3, n4, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n5;
  wire   [5:0] CURRENT_SECS;
  wire   [5:2] U10_carry;
  wire   [5:2] r84_carry;
  assign test_so1 = test_so;

  OAI212 U24 ( .A(n49), .B(n31), .C(n50), .Q(n88) );
  OAI212 U28 ( .A(n49), .B(n32), .C(n57), .Q(n89) );
  OAI212 U32 ( .A(n49), .B(n33), .C(n60), .Q(n90) );
  OAI212 U36 ( .A(n49), .B(n34), .C(n63), .Q(n91) );
  OAI212 U46 ( .A(n69), .B(test_so), .C(n70), .Q(n92) );
  OAI212 U48 ( .A(n69), .B(n37), .C(n72), .Q(n93) );
  OAI212 U50 ( .A(n69), .B(n38), .C(n73), .Q(n94) );
  OAI212 U52 ( .A(n69), .B(n39), .C(n74), .Q(n95) );
  OAI212 U54 ( .A(n69), .B(n40), .C(n75), .Q(n96) );
  OAI212 U56 ( .A(n69), .B(n41), .C(n76), .Q(n97) );
  OAI212 U61 ( .A(n78), .B(n66), .C(n56), .Q(n69) );
  OAI212 U62 ( .A(n22), .B(n79), .C(n80), .Q(n98) );
  OAI212 U64 ( .A(n26), .B(n79), .C(n82), .Q(n99) );
  OAI212 U66 ( .A(n27), .B(n79), .C(n83), .Q(n100) );
  OAI212 U68 ( .A(n79), .B(n28), .C(n84), .Q(n101) );
  OAI212 U70 ( .A(n29), .B(n79), .C(n85), .Q(n102) );
  OAI212 U72 ( .A(n30), .B(n79), .C(n86), .Q(n103) );
  ADD22 U10_U1_1_1 ( .A(CURRENT_SECS[1]), .B(CURRENT_SECS[0]), .CO(
        U10_carry[2]), .S(N45) );
  ADD22 U10_U1_1_2 ( .A(CURRENT_SECS[2]), .B(U10_carry[2]), .CO(U10_carry[3]), 
        .S(N46) );
  ADD22 U10_U1_1_3 ( .A(CURRENT_SECS[3]), .B(U10_carry[3]), .CO(U10_carry[4]), 
        .S(N47) );
  ADD22 U10_U1_1_4 ( .A(CURRENT_SECS[4]), .B(U10_carry[4]), .CO(U10_carry[5]), 
        .S(N48) );
  ADD22 r84_U1_1_1 ( .A(MINUTES_OUT[1]), .B(MINUTES_OUT[0]), .CO(r84_carry[2]), 
        .S(N28) );
  ADD22 r84_U1_1_2 ( .A(MINUTES_OUT[2]), .B(r84_carry[2]), .CO(r84_carry[3]), 
        .S(N29) );
  ADD22 r84_U1_1_3 ( .A(MINUTES_OUT[3]), .B(r84_carry[3]), .CO(r84_carry[4]), 
        .S(N30) );
  ADD22 r84_U1_1_4 ( .A(MINUTES_OUT[4]), .B(r84_carry[4]), .CO(r84_carry[5]), 
        .S(N31) );
  DFSEC1 AM_PM_OUT_reg ( .D(n1), .SD(test_si1), .E(n45), .SE(test_se), .C(CLK), 
        .RN(RESETN), .Q(AM_PM_OUT), .QN(n5) );
  DFSC1 CURRENT_SECS_reg_5_ ( .D(n98), .SD(n26), .SE(test_se), .C(CLK), .RN(
        RESETN), .Q(CURRENT_SECS[5]), .QN(n22) );
  DFSC1 CURRENT_SECS_reg_3_ ( .D(n100), .SD(n28), .SE(test_se), .C(CLK), .RN(
        RESETN), .Q(CURRENT_SECS[3]), .QN(n27) );
  DFSC1 CURRENT_SECS_reg_2_ ( .D(n101), .SD(CURRENT_SECS[1]), .SE(test_se), 
        .C(CLK), .RN(RESETN), .Q(CURRENT_SECS[2]), .QN(n28) );
  DFSC1 CURRENT_SECS_reg_4_ ( .D(n99), .SD(n27), .SE(test_se), .C(CLK), .RN(
        RESETN), .Q(CURRENT_SECS[4]), .QN(n26) );
  DFSC1 MINUTES_OUT_reg_3_ ( .D(n94), .SD(n39), .SE(test_se), .C(CLK), .RN(
        RESETN), .Q(MINUTES_OUT[3]), .QN(n38) );
  DFSC1 MINUTES_OUT_reg_2_ ( .D(n95), .SD(MINUTES_OUT[1]), .SE(test_se), .C(
        CLK), .RN(RESETN), .Q(MINUTES_OUT[2]), .QN(n39) );
  DFSC1 MINUTES_OUT_reg_4_ ( .D(n93), .SD(n38), .SE(test_se), .C(CLK), .RN(
        RESETN), .Q(MINUTES_OUT[4]), .QN(n37) );
  DFSC1 CURRENT_SECS_reg_1_ ( .D(n102), .SD(CURRENT_SECS[0]), .SE(test_se), 
        .C(CLK), .RN(RESETN), .Q(CURRENT_SECS[1]), .QN(n29) );
  DFSC1 HOURS_OUT_reg_1_ ( .D(n90), .SD(HOURS_OUT[0]), .SE(test_se), .C(CLK), 
        .RN(RESETN), .Q(HOURS_OUT[1]), .QN(n33) );
  DFSC1 HOURS_OUT_reg_0_ ( .D(n91), .SD(n22), .SE(test_se), .C(CLK), .RN(
        RESETN), .Q(HOURS_OUT[0]), .QN(n34) );
  DFSC1 CURRENT_SECS_reg_0_ ( .D(n103), .SD(n5), .SE(test_se), .C(CLK), .RN(
        RESETN), .Q(CURRENT_SECS[0]), .QN(n30) );
  DFSC1 MINUTES_OUT_reg_1_ ( .D(n96), .SD(n41), .SE(test_se), .C(CLK), .RN(
        RESETN), .Q(MINUTES_OUT[1]), .QN(n40) );
  DFSC1 MINUTES_OUT_reg_5_ ( .D(n92), .SD(n37), .SE(test_se), .C(CLK), .RN(
        RESETN), .Q(MINUTES_OUT[5]), .QN(test_so) );
  DFSC1 MINUTES_OUT_reg_0_ ( .D(n97), .SD(n31), .SE(test_se), .C(CLK), .RN(
        RESETN), .Q(MINUTES_OUT[0]), .QN(n41) );
  DFSP1 HOURS_OUT_reg_2_ ( .D(n89), .SD(HOURS_OUT[1]), .SE(test_se), .C(CLK), 
        .SN(RESETN), .Q(HOURS_OUT[2]), .QN(n32) );
  DFSP1 HOURS_OUT_reg_3_ ( .D(n88), .SD(n32), .SE(test_se), .C(CLK), .SN(
        RESETN), .Q(HOURS_OUT[3]), .QN(n31) );
  XOR21 U3 ( .A(AM_PM_OUT), .B(n47), .Q(n1) );
  INV3 U4 ( .A(n69), .Q(n10) );
  INV3 U5 ( .A(n45), .Q(n9) );
  NOR21 U6 ( .A(n11), .B(n10), .Q(n71) );
  NOR21 U7 ( .A(n9), .B(n48), .Q(n49) );
  NOR31 U8 ( .A(n66), .B(n9), .C(n67), .Q(n51) );
  AOI221 U9 ( .A(N65), .B(n55), .C(N92), .D(n56), .Q(n53) );
  XNR21 U10 ( .A(n16), .B(N173), .Q(N92) );
  XNR21 U11 ( .A(n18), .B(N173), .Q(N65) );
  INV3 U12 ( .A(n4), .Q(N173) );
  NAND22 U13 ( .A(n10), .B(n68), .Q(n45) );
  NAND22 U14 ( .A(N179), .B(N170), .Q(n19) );
  NAND22 U15 ( .A(N179), .B(N170), .Q(n17) );
  NAND22 U16 ( .A(N179), .B(N170), .Q(n21) );
  AOI221 U17 ( .A(N63), .B(n55), .C(N90), .D(n56), .Q(n62) );
  XNR21 U18 ( .A(n3), .B(N179), .Q(N90) );
  XNR21 U19 ( .A(n3), .B(N179), .Q(N63) );
  AOI221 U20 ( .A(N64), .B(n55), .C(N91), .D(n56), .Q(n59) );
  XNR21 U21 ( .A(n17), .B(N172), .Q(N91) );
  XNR21 U22 ( .A(n19), .B(N172), .Q(N64) );
  NAND22 U23 ( .A(N172), .B(n12), .Q(n18) );
  NAND22 U25 ( .A(N172), .B(n12), .Q(n16) );
  NAND22 U26 ( .A(N172), .B(n12), .Q(n20) );
  INV3 U27 ( .A(n21), .Q(n12) );
  NAND31 U29 ( .A(n66), .B(n68), .C(n56), .Q(n79) );
  NOR21 U30 ( .A(n66), .B(n8), .Q(n81) );
  INV3 U31 ( .A(n78), .Q(n8) );
  AOI211 U33 ( .A(n66), .B(n56), .C(n11), .Q(n48) );
  NAND22 U34 ( .A(n45), .B(n66), .Q(n54) );
  NOR21 U35 ( .A(n67), .B(n56), .Q(n55) );
  INV3 U37 ( .A(n67), .Q(n11) );
  NAND31 U38 ( .A(n15), .B(n14), .C(MINS), .Q(n56) );
  NAND31 U39 ( .A(n15), .B(n13), .C(SECS), .Q(n66) );
  NAND41 U40 ( .A(CURRENT_SECS[4]), .B(CURRENT_SECS[3]), .C(CURRENT_SECS[5]), 
        .D(n87), .Q(n78) );
  NOR31 U41 ( .A(n29), .B(CURRENT_SECS[2]), .C(n30), .Q(n87) );
  NAND22 U42 ( .A(N32), .B(n71), .Q(n70) );
  NAND22 U43 ( .A(N49), .B(n81), .Q(n80) );
  AOI211 U44 ( .A(n3), .B(n51), .C(n64), .Q(n63) );
  NOR21 U45 ( .A(n65), .B(n54), .Q(n64) );
  AOI221 U47 ( .A(n3), .B(n55), .C(n3), .D(n56), .Q(n65) );
  AOI211 U49 ( .A(N23), .B(n51), .C(n61), .Q(n60) );
  XNR21 U51 ( .A(n7), .B(N179), .Q(N23) );
  NOR21 U53 ( .A(n62), .B(n54), .Q(n61) );
  AOI211 U55 ( .A(N24), .B(n51), .C(n58), .Q(n57) );
  XNR21 U57 ( .A(n21), .B(N172), .Q(N24) );
  NOR21 U58 ( .A(n59), .B(n54), .Q(n58) );
  AOI211 U59 ( .A(N25), .B(n51), .C(n52), .Q(n50) );
  XNR21 U60 ( .A(n20), .B(N173), .Q(N25) );
  NOR21 U63 ( .A(n53), .B(n54), .Q(n52) );
  INV3 U65 ( .A(n7), .Q(N170) );
  INV3 U67 ( .A(n6), .Q(N172) );
  INV3 U69 ( .A(n2), .Q(N179) );
  NAND41 U71 ( .A(HOURS_OUT[3]), .B(HOURS_OUT[2]), .C(n34), .D(n33), .Q(N137)
         );
  INV3 U73 ( .A(SECS), .Q(n14) );
  INV3 U74 ( .A(MINS), .Q(n13) );
  INV3 U75 ( .A(HOURS), .Q(n15) );
  NAND41 U76 ( .A(MINUTES_OUT[4]), .B(MINUTES_OUT[3]), .C(MINUTES_OUT[5]), .D(
        n77), .Q(n67) );
  NOR31 U77 ( .A(n40), .B(MINUTES_OUT[2]), .C(n41), .Q(n77) );
  NAND31 U78 ( .A(n13), .B(n14), .C(HOURS), .Q(n68) );
  NAND22 U79 ( .A(N31), .B(n71), .Q(n72) );
  NAND22 U80 ( .A(N30), .B(n71), .Q(n73) );
  NAND22 U81 ( .A(N29), .B(n71), .Q(n74) );
  NAND22 U82 ( .A(N28), .B(n71), .Q(n75) );
  NAND22 U83 ( .A(n41), .B(n71), .Q(n76) );
  NAND22 U84 ( .A(N48), .B(n81), .Q(n82) );
  NAND22 U85 ( .A(N47), .B(n81), .Q(n83) );
  NAND22 U86 ( .A(N45), .B(n81), .Q(n85) );
  NAND22 U87 ( .A(n30), .B(n81), .Q(n86) );
  NAND22 U88 ( .A(N46), .B(n81), .Q(n84) );
  NOR21 U89 ( .A(N137), .B(n48), .Q(n47) );
  NAND20 U91 ( .A(HOURS_OUT[0]), .B(N137), .Q(n3) );
  NAND20 U92 ( .A(HOURS_OUT[1]), .B(N137), .Q(n2) );
  NAND20 U93 ( .A(HOURS_OUT[0]), .B(N137), .Q(n7) );
  NAND20 U94 ( .A(HOURS_OUT[2]), .B(N137), .Q(n6) );
  NAND20 U95 ( .A(N137), .B(HOURS_OUT[3]), .Q(n4) );
  XOR20 U96 ( .A(r84_carry[5]), .B(MINUTES_OUT[5]), .Q(N32) );
  XOR20 U97 ( .A(U10_carry[5]), .B(CURRENT_SECS[5]), .Q(N49) );
endmodule


module TIME_BLOCK_test_1 ( SET_TIME, HRS, MINS, CLK, RESETN, ENABLE, HRS_OUT, 
        MINS_OUT, AM_PM_OUT, DISPLAY_BUS, test_se, test_si1, test_so1 );
  output [3:0] HRS_OUT;
  output [5:0] MINS_OUT;
  output [10:0] DISPLAY_BUS;
  input SET_TIME, HRS, MINS, CLK, RESETN, ENABLE, test_se, test_si1;
  output AM_PM_OUT, test_so1;
  wire   CONNECT5, CONNECT3, CONNECT4, n1, test_so, n6, n7, n8, n9, n3;

  BUFE2 DISPLAY_BUS_tri_1_ ( .A(MINS_OUT[1]), .E(n8), .Q(DISPLAY_BUS[1]) );
  BUFE2 DISPLAY_BUS_tri_5_ ( .A(MINS_OUT[5]), .E(n8), .Q(DISPLAY_BUS[5]) );
  BUFE2 DISPLAY_BUS_tri_3_ ( .A(MINS_OUT[3]), .E(n9), .Q(DISPLAY_BUS[3]) );
  BUFE2 DISPLAY_BUS_tri_6_ ( .A(HRS_OUT[0]), .E(n9), .Q(DISPLAY_BUS[6]) );
  BUFE2 DISPLAY_BUS_tri_10_ ( .A(AM_PM_OUT), .E(n9), .Q(DISPLAY_BUS[10]) );
  BUFE2 DISPLAY_BUS_tri_7_ ( .A(HRS_OUT[1]), .E(n9), .Q(DISPLAY_BUS[7]) );
  BUFE2 DISPLAY_BUS_tri_2_ ( .A(MINS_OUT[2]), .E(n9), .Q(DISPLAY_BUS[2]) );
  BUFE2 DISPLAY_BUS_tri_4_ ( .A(MINS_OUT[4]), .E(n8), .Q(DISPLAY_BUS[4]) );
  BUFE2 DISPLAY_BUS_tri_0_ ( .A(MINS_OUT[0]), .E(n8), .Q(DISPLAY_BUS[0]) );
  BUFE2 DISPLAY_BUS_tri_8_ ( .A(HRS_OUT[2]), .E(n8), .Q(DISPLAY_BUS[8]) );
  BUFE2 DISPLAY_BUS_tri_9_ ( .A(HRS_OUT[3]), .E(n8), .Q(DISPLAY_BUS[9]) );
  NOR20 U3 ( .A(test_se), .B(n1), .Q(n6) );
  CLKIN0 U4 ( .A(ENABLE), .Q(n1) );
  INV0 U5 ( .A(n6), .Q(n7) );
  INV0 U6 ( .A(n7), .Q(n8) );
  INV0 U7 ( .A(n7), .Q(n9) );
  TIME_STATE_MACHINE_test_1 U1 ( .TIME_BUTTON(SET_TIME), .HOURS_BUTTON(HRS), 
        .MINUTES_BUTTON(MINS), .CLK(CLK), .RESETN(RESETN), .SECS(CONNECT5), 
        .HOURS(CONNECT3), .MINS(CONNECT4), .test_se(test_se), .test_si1(
        test_si1), .test_so1(n3) );
  TIME_COUNTER_test_1 U2 ( .HOURS(CONNECT3), .MINS(CONNECT4), .SECS(CONNECT5), 
        .CLK(CLK), .RESETN(RESETN), .HOURS_OUT(HRS_OUT), .MINUTES_OUT(MINS_OUT), .AM_PM_OUT(AM_PM_OUT), .test_so(test_so), .test_se(test_se), .test_si1(n3), 
        .test_so1(test_so1) );
endmodule


module ALARM_STATE_MACHINE_test_1 ( ALARM_BUTTON, HOURS_BUTTON, MINUTES_BUTTON, 
        CLK, RESETN, HOURS, MINS, test_se, test_si1, test_so1 );
  input ALARM_BUTTON, HOURS_BUTTON, MINUTES_BUTTON, CLK, RESETN, test_se,
         test_si1;
  output HOURS, MINS, test_so1;
  wire   NEXT_HOURS, NEXT_MINS, n2, n3, n4, n5, n6, n1, n7, n8;
  wire   [1:0] NEXT_STATE;
  wire   [1:0] CURRENT_STATE;

  DFSC1 CURRENT_STATE_reg_0_ ( .D(NEXT_STATE[0]), .SD(test_si1), .SE(test_se), 
        .C(CLK), .RN(RESETN), .Q(CURRENT_STATE[0]), .QN(n8) );
  DFSC1 CURRENT_STATE_reg_1_ ( .D(NEXT_STATE[1]), .SD(n8), .SE(test_se), .C(
        CLK), .RN(RESETN), .Q(CURRENT_STATE[1]), .QN(n7) );
  DFSC1 HOURS_reg ( .D(NEXT_HOURS), .SD(n7), .SE(test_se), .C(CLK), .RN(RESETN), .Q(HOURS), .QN(n1) );
  DFSC1 MINS_reg ( .D(NEXT_MINS), .SD(n1), .SE(test_se), .C(CLK), .RN(RESETN), 
        .Q(MINS), .QN(test_so1) );
  NOR40 U3 ( .A(n4), .B(n6), .C(CURRENT_STATE[0]), .D(HOURS_BUTTON), .Q(
        NEXT_STATE[1]) );
  INV3 U4 ( .A(MINUTES_BUTTON), .Q(n6) );
  NOR40 U5 ( .A(n5), .B(n4), .C(CURRENT_STATE[1]), .D(MINUTES_BUTTON), .Q(
        NEXT_STATE[0]) );
  INV3 U6 ( .A(HOURS_BUTTON), .Q(n5) );
  NOR21 U7 ( .A(CURRENT_STATE[0]), .B(n3), .Q(NEXT_HOURS) );
  INV3 U8 ( .A(NEXT_STATE[0]), .Q(n3) );
  NOR21 U9 ( .A(CURRENT_STATE[1]), .B(n2), .Q(NEXT_MINS) );
  INV3 U10 ( .A(NEXT_STATE[1]), .Q(n2) );
  INV3 U11 ( .A(ALARM_BUTTON), .Q(n4) );
endmodule


module ALARM_COUNTER_test_1 ( HOURS, MINS, CLK, RESETN, HRS_OUT, MINUTES_OUT, 
        AM_PM_OUT, test_se, test_si1, test_so1 );
  output [3:0] HRS_OUT;
  output [5:0] MINUTES_OUT;
  input HOURS, MINS, CLK, RESETN, test_se, test_si1;
  output AM_PM_OUT, test_so1;
  wire   N15, N16, N17, N20, N21, N22, N23, N24, N37, N38, N39, n16, n17, n18,
         n19, n28, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, N79, N77, N76, N74,
         n1, n2, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n20,
         n21, n22, n23, n24, n25, n26, n27, n3, n29, n30, n53;
  wire   [5:2] U6_carry;

  OAI212 U17 ( .A(n32), .B(n19), .C(n34), .Q(n49) );
  OAI212 U19 ( .A(n32), .B(n18), .C(n37), .Q(n50) );
  OAI212 U21 ( .A(n17), .B(n32), .C(n38), .Q(n51) );
  OAI212 U23 ( .A(n16), .B(n32), .C(n39), .Q(n52) );
  OAI222 U27 ( .A(n40), .B(n41), .C(MINS), .D(n23), .Q(n32) );
  TFSEC3 AM_PM_OUT_reg ( .T(n15), .SD(test_si1), .SE(test_se), .C(CLK), .RN(
        RESETN), .Q(AM_PM_OUT), .QN(n53) );
  ADD22 U6_U1_1_1 ( .A(MINUTES_OUT[1]), .B(MINUTES_OUT[0]), .CO(U6_carry[2]), 
        .S(N20) );
  ADD22 U6_U1_1_2 ( .A(MINUTES_OUT[2]), .B(U6_carry[2]), .CO(U6_carry[3]), .S(
        N21) );
  ADD22 U6_U1_1_3 ( .A(MINUTES_OUT[3]), .B(U6_carry[3]), .CO(U6_carry[4]), .S(
        N22) );
  ADD22 U6_U1_1_4 ( .A(MINUTES_OUT[4]), .B(U6_carry[4]), .CO(U6_carry[5]), .S(
        N23) );
  DFSEC1 MINUTES_OUT_reg_2_ ( .D(n12), .SD(n30), .E(n22), .SE(test_se), .C(CLK), .RN(RESETN), .Q(MINUTES_OUT[2]), .QN(n28) );
  DFSEC1 MINUTES_OUT_reg_3_ ( .D(n11), .SD(MINUTES_OUT[2]), .E(n22), .SE(
        test_se), .C(CLK), .RN(RESETN), .Q(MINUTES_OUT[3]), .QN(n29) );
  DFSEC1 MINUTES_OUT_reg_4_ ( .D(n10), .SD(n29), .E(n22), .SE(test_se), .C(CLK), .RN(RESETN), .Q(MINUTES_OUT[4]), .QN(n3) );
  DFSP1 HRS_OUT_reg_3_ ( .D(n52), .SD(HRS_OUT[2]), .SE(test_se), .C(CLK), .SN(
        RESETN), .Q(HRS_OUT[3]), .QN(n16) );
  DFSP1 HRS_OUT_reg_2_ ( .D(n51), .SD(n18), .SE(test_se), .C(CLK), .SN(RESETN), 
        .Q(HRS_OUT[2]), .QN(n17) );
  DFSEC1 MINUTES_OUT_reg_5_ ( .D(n9), .SD(n3), .E(n22), .SE(test_se), .C(CLK), 
        .RN(RESETN), .Q(MINUTES_OUT[5]), .QN(test_so1) );
  DFSEC1 MINUTES_OUT_reg_1_ ( .D(n13), .SD(n1), .E(n22), .SE(test_se), .C(CLK), 
        .RN(RESETN), .Q(MINUTES_OUT[1]), .QN(n30) );
  DFSC1 HRS_OUT_reg_0_ ( .D(n49), .SD(n53), .SE(test_se), .C(CLK), .RN(RESETN), 
        .Q(HRS_OUT[0]), .QN(n19) );
  DFSC1 HRS_OUT_reg_1_ ( .D(n50), .SD(n19), .SE(test_se), .C(CLK), .RN(RESETN), 
        .Q(HRS_OUT[1]), .QN(n18) );
  DFSEC1 MINUTES_OUT_reg_0_ ( .D(n8), .SD(HRS_OUT[3]), .E(n22), .SE(test_se), 
        .C(CLK), .RN(RESETN), .Q(MINUTES_OUT[0]), .QN(n1) );
  NOR21 U3 ( .A(n14), .B(n22), .Q(n36) );
  NOR21 U4 ( .A(n40), .B(n14), .Q(n35) );
  NAND22 U5 ( .A(N79), .B(N74), .Q(n27) );
  NAND22 U6 ( .A(N79), .B(N74), .Q(n25) );
  INV3 U7 ( .A(n32), .Q(n14) );
  INV3 U8 ( .A(n33), .Q(n6) );
  NAND22 U9 ( .A(N76), .B(n21), .Q(n26) );
  NAND22 U10 ( .A(N76), .B(n21), .Q(n24) );
  INV3 U11 ( .A(n25), .Q(n21) );
  INV3 U12 ( .A(n43), .Q(n10) );
  NAND22 U13 ( .A(n41), .B(N23), .Q(n43) );
  INV3 U14 ( .A(n45), .Q(n12) );
  NAND22 U15 ( .A(n41), .B(N21), .Q(n45) );
  INV3 U16 ( .A(n46), .Q(n13) );
  NAND22 U18 ( .A(n41), .B(N20), .Q(n46) );
  INV3 U20 ( .A(n44), .Q(n11) );
  NAND22 U22 ( .A(n41), .B(N22), .Q(n44) );
  INV3 U24 ( .A(n31), .Q(n15) );
  NAND22 U25 ( .A(n32), .B(n33), .Q(n31) );
  INV3 U26 ( .A(n40), .Q(n22) );
  NAND41 U28 ( .A(MINUTES_OUT[4]), .B(MINUTES_OUT[3]), .C(MINUTES_OUT[5]), .D(
        n20), .Q(n41) );
  INV3 U29 ( .A(n48), .Q(n20) );
  NAND31 U30 ( .A(MINUTES_OUT[1]), .B(n28), .C(MINUTES_OUT[0]), .Q(n48) );
  NOR40 U31 ( .A(n16), .B(n17), .C(HRS_OUT[0]), .D(HRS_OUT[1]), .Q(n33) );
  AOI221 U32 ( .A(N15), .B(n35), .C(N37), .D(n36), .Q(n37) );
  XNR21 U33 ( .A(n5), .B(N79), .Q(N37) );
  XNR21 U34 ( .A(n5), .B(N79), .Q(N15) );
  AOI221 U35 ( .A(n5), .B(n35), .C(n5), .D(n36), .Q(n34) );
  AOI221 U36 ( .A(N17), .B(n35), .C(N39), .D(n36), .Q(n39) );
  XNR21 U37 ( .A(n24), .B(N77), .Q(N39) );
  XNR21 U38 ( .A(n26), .B(N77), .Q(N17) );
  AOI221 U39 ( .A(N16), .B(n35), .C(N38), .D(n36), .Q(n38) );
  XNR21 U40 ( .A(n25), .B(N76), .Q(N38) );
  XNR21 U41 ( .A(n27), .B(N76), .Q(N16) );
  INV3 U42 ( .A(n5), .Q(N74) );
  INV3 U43 ( .A(n7), .Q(N79) );
  INV3 U44 ( .A(n42), .Q(n9) );
  NAND22 U45 ( .A(n41), .B(N24), .Q(n42) );
  INV3 U46 ( .A(n2), .Q(N77) );
  NAND22 U47 ( .A(MINS), .B(n23), .Q(n40) );
  INV3 U48 ( .A(n4), .Q(N76) );
  INV3 U49 ( .A(n47), .Q(n8) );
  NAND22 U50 ( .A(n41), .B(n1), .Q(n47) );
  INV3 U51 ( .A(HOURS), .Q(n23) );
  NAND20 U53 ( .A(HRS_OUT[0]), .B(n6), .Q(n5) );
  NAND20 U54 ( .A(HRS_OUT[2]), .B(n6), .Q(n4) );
  NAND20 U55 ( .A(n6), .B(HRS_OUT[3]), .Q(n2) );
  NAND20 U56 ( .A(HRS_OUT[1]), .B(n6), .Q(n7) );
  XOR20 U57 ( .A(U6_carry[5]), .B(MINUTES_OUT[5]), .Q(N24) );
endmodule


module ALARM_BLOCK_test_1 ( ALARM, HRS, MINS, CLK, RESETN, ENABLE, HRS_OUT, 
        MINS_OUT, AM_PM_OUT, DISPLAY_BUS, test_se, test_si1, test_so1 );
  output [3:0] HRS_OUT;
  output [5:0] MINS_OUT;
  output [10:0] DISPLAY_BUS;
  input ALARM, HRS, MINS, CLK, RESETN, ENABLE, test_se, test_si1;
  output AM_PM_OUT, test_so1;
  wire   CONNECT1, CONNECT2, n1, n6, n7, n8, n9, n3;

  BUFE2 DISPLAY_BUS_tri_10_ ( .A(AM_PM_OUT), .E(n9), .Q(DISPLAY_BUS[10]) );
  BUFE2 DISPLAY_BUS_tri_2_ ( .A(MINS_OUT[2]), .E(n9), .Q(DISPLAY_BUS[2]) );
  BUFE2 DISPLAY_BUS_tri_9_ ( .A(HRS_OUT[3]), .E(n8), .Q(DISPLAY_BUS[9]) );
  BUFE2 DISPLAY_BUS_tri_8_ ( .A(HRS_OUT[2]), .E(n8), .Q(DISPLAY_BUS[8]) );
  BUFE2 DISPLAY_BUS_tri_5_ ( .A(MINS_OUT[5]), .E(n8), .Q(DISPLAY_BUS[5]) );
  BUFE2 DISPLAY_BUS_tri_4_ ( .A(MINS_OUT[4]), .E(n8), .Q(DISPLAY_BUS[4]) );
  BUFE2 DISPLAY_BUS_tri_3_ ( .A(MINS_OUT[3]), .E(n9), .Q(DISPLAY_BUS[3]) );
  BUFE2 DISPLAY_BUS_tri_1_ ( .A(MINS_OUT[1]), .E(n8), .Q(DISPLAY_BUS[1]) );
  BUFE2 DISPLAY_BUS_tri_7_ ( .A(HRS_OUT[1]), .E(n9), .Q(DISPLAY_BUS[7]) );
  BUFE2 DISPLAY_BUS_tri_6_ ( .A(HRS_OUT[0]), .E(n9), .Q(DISPLAY_BUS[6]) );
  BUFE2 DISPLAY_BUS_tri_0_ ( .A(MINS_OUT[0]), .E(n8), .Q(DISPLAY_BUS[0]) );
  NOR20 U1 ( .A(test_se), .B(n1), .Q(n6) );
  CLKIN0 U2 ( .A(ENABLE), .Q(n1) );
  INV0 U4 ( .A(n6), .Q(n7) );
  INV0 U5 ( .A(n7), .Q(n8) );
  INV0 U6 ( .A(n7), .Q(n9) );
  ALARM_STATE_MACHINE_test_1 U0 ( .ALARM_BUTTON(ALARM), .HOURS_BUTTON(HRS), 
        .MINUTES_BUTTON(MINS), .CLK(CLK), .RESETN(RESETN), .HOURS(CONNECT1), 
        .MINS(CONNECT2), .test_se(test_se), .test_si1(test_si1), .test_so1(n3)
         );
  ALARM_COUNTER_test_1 U3 ( .HOURS(CONNECT1), .MINS(CONNECT2), .CLK(CLK), 
        .RESETN(RESETN), .HRS_OUT(HRS_OUT), .MINUTES_OUT(MINS_OUT), 
        .AM_PM_OUT(AM_PM_OUT), .test_se(test_se), .test_si1(n3), .test_so1(
        test_so1) );
endmodule


module COMPARATOR ( ALARM_HRS, TIME_HRS, ALARM_MINS, TIME_MINS, ALARM_AM_PM, 
        TIME_AM_PM, RINGER );
  input [3:0] ALARM_HRS;
  input [3:0] TIME_HRS;
  input [5:0] ALARM_MINS;
  input [5:0] TIME_MINS;
  input ALARM_AM_PM, TIME_AM_PM;
  output RINGER;
  wire   N2, n2, n3, n4, n5, n6, n7, n1, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18;

  INV3 U1 ( .A(n8), .Q(n18) );
  NOR40 U2 ( .A(n2), .B(n3), .C(n4), .D(n5), .Q(RINGER) );
  XOR21 U3 ( .A(TIME_AM_PM), .B(ALARM_AM_PM), .Q(n5) );
  NAND31 U4 ( .A(n6), .B(N2), .C(n7), .Q(n2) );
  XNR21 U5 ( .A(TIME_HRS[3]), .B(ALARM_HRS[3]), .Q(n6) );
  XNR21 U6 ( .A(TIME_HRS[1]), .B(ALARM_HRS[1]), .Q(n7) );
  INV3 U7 ( .A(TIME_MINS[0]), .Q(n16) );
  INV3 U8 ( .A(ALARM_MINS[1]), .Q(n17) );
  XOR21 U9 ( .A(TIME_HRS[2]), .B(ALARM_HRS[2]), .Q(n4) );
  XOR21 U10 ( .A(TIME_HRS[0]), .B(ALARM_HRS[0]), .Q(n3) );
  NAND20 U11 ( .A(ALARM_MINS[0]), .B(n16), .Q(n1) );
  AOI220 U12 ( .A(n17), .B(n1), .C(n1), .D(TIME_MINS[1]), .Q(n8) );
  NOR20 U13 ( .A(n16), .B(ALARM_MINS[0]), .Q(n9) );
  OAI220 U14 ( .A(n9), .B(n17), .C(TIME_MINS[1]), .D(n9), .Q(n11) );
  XNR20 U15 ( .A(TIME_MINS[5]), .B(ALARM_MINS[5]), .Q(n10) );
  NAND30 U16 ( .A(n18), .B(n11), .C(n10), .Q(n15) );
  XOR20 U17 ( .A(TIME_MINS[4]), .B(ALARM_MINS[4]), .Q(n14) );
  XOR20 U18 ( .A(TIME_MINS[2]), .B(ALARM_MINS[2]), .Q(n13) );
  XOR20 U19 ( .A(TIME_MINS[3]), .B(ALARM_MINS[3]), .Q(n12) );
  NOR40 U20 ( .A(n15), .B(n14), .C(n13), .D(n12), .Q(N2) );
endmodule


module ALARM_SM_2_test_1 ( COMPARE_IN, TOGGLE_ON, CLOCK, RESETN, RING, test_se, 
        test_si1 );
  input COMPARE_IN, TOGGLE_ON, CLOCK, RESETN, test_se, test_si1;
  output RING;
  wire   n3, n2;

  OAI212 U4 ( .A(COMPARE_IN), .B(RING), .C(TOGGLE_ON), .Q(n3) );
  DFSC1 CURRENT_STATE_reg ( .D(n2), .SD(test_si1), .SE(test_se), .C(CLOCK), 
        .RN(RESETN), .Q(RING) );
  INV3 U3 ( .A(n3), .Q(n2) );
endmodule


module COMPUTE_BLOCK ( SET_TIME, ALARM, HRS, MINS, TOGGLE_SWITCH, CLK, TM_FIX, 
        RESETN, TIM_DISPLAY, ALM_DISPLAY, SPEAKER_OUT, test_si, test_se );
  output [10:0] TIM_DISPLAY;
  output [10:0] ALM_DISPLAY;
  input SET_TIME, ALARM, HRS, MINS, TOGGLE_SWITCH, CLK, TM_FIX, RESETN,
         test_si, test_se;
  output SPEAKER_OUT;
  wire   INT_CLK, TIM_AM_PM, ALM_AM_PM, KONNECT12, n2, n9, n10, n11;
  wire   [3:0] TIM_HRS;
  wire   [5:0] TIM_MINS;
  wire   [3:0] ALM_HRS;
  wire   [5:0] ALM_MINS;

  INV3 U6 ( .A(ALARM), .Q(n2) );
  CLOCK_GEN_test_1 U7 ( .CLK(CLK), .RESETN(RESETN), .INT_CLK(INT_CLK), 
        .COMPUTE_BLOCK_TM_FIX_in(TM_FIX), .test_se(test_se), .test_si1(n10), 
        .test_so1(n9) );
  TIME_BLOCK_test_1 U1 ( .SET_TIME(SET_TIME), .HRS(HRS), .MINS(MINS), .CLK(
        INT_CLK), .RESETN(RESETN), .ENABLE(n2), .HRS_OUT(TIM_HRS), .MINS_OUT(
        TIM_MINS), .AM_PM_OUT(TIM_AM_PM), .DISPLAY_BUS(TIM_DISPLAY), .test_se(
        test_se), .test_si1(test_si), .test_so1(n11) );
  ALARM_BLOCK_test_1 U2 ( .ALARM(ALARM), .HRS(HRS), .MINS(MINS), .CLK(INT_CLK), 
        .RESETN(RESETN), .ENABLE(ALARM), .HRS_OUT(ALM_HRS), .MINS_OUT(ALM_MINS), .AM_PM_OUT(ALM_AM_PM), .DISPLAY_BUS(ALM_DISPLAY), .test_se(test_se), 
        .test_si1(n11), .test_so1(n10) );
  COMPARATOR U4 ( .ALARM_HRS(ALM_HRS), .TIME_HRS(TIM_HRS), .ALARM_MINS(
        ALM_MINS), .TIME_MINS(TIM_MINS), .ALARM_AM_PM(ALM_AM_PM), .TIME_AM_PM(
        TIM_AM_PM), .RINGER(KONNECT12) );
  ALARM_SM_2_test_1 U5 ( .COMPARE_IN(KONNECT12), .TOGGLE_ON(TOGGLE_SWITCH), 
        .CLOCK(INT_CLK), .RESETN(RESETN), .RING(SPEAKER_OUT), .test_se(test_se), .test_si1(n9) );
endmodule


module CONVERTOR_CKT ( bin_time, hr_display, min_display, am_pm_display );
  input [10:0] bin_time;
  output [13:0] hr_display;
  output [13:0] min_display;
  output am_pm_display;
  wire   n170, n191, n114, n203, n210, n213, n216, n179, n115, n206, n217,
         n128, n131, n127, n130, n125, n124, n126, n123, n196, n198, n212,
         n195, n215, n200, n190, n189, n188, n192, n181, n182, n178, n183,
         n177, n186, n208, n176, n175, n172, n193, n171, n174, n211, n162,
         n194, n165, n161, n158, n157, n159, n160, n150, n146, n145, n147,
         n173, n144, n143, n168, n167, n207, n142, n148, n153, n134, n187,
         n163, n116, n132, n129, n122, n121, n120, n119, n118, n117, n141,
         n154, n140, n139, n138, n218, n214, n209, n205, n204, n202, n201,
         n199, n197, n185, n184, n169, n166, n164, n156, n155, n152, n180,
         n151, n149, n137, n136, n135, n133;
  assign hr_display[7] = hr_display[13];
  assign hr_display[8] = hr_display[13];
  assign hr_display[9] = hr_display[13];
  assign hr_display[10] = hr_display[13];
  assign hr_display[11] = hr_display[12];
  assign min_display[10] = min_display[13];

  AOI210 U136 ( .A(bin_time[2]), .B(n170), .C(n191), .Q(n114) );
  OAI210 U137 ( .A(n203), .B(n210), .C(n114), .Q(n213) );
  NOR30 U138 ( .A(n216), .B(n179), .C(n213), .Q(n115) );
  OAI2110 U139 ( .A(n206), .B(n210), .C(n217), .D(n115), .Q(min_display[13])
         );
  AOI211 U140 ( .A(n128), .B(n131), .C(n127), .Q(n130) );
  AOI2111 U141 ( .A(bin_time[9]), .B(n125), .C(n127), .D(n124), .Q(n126) );
  AOI211 U142 ( .A(n123), .B(n131), .C(bin_time[8]), .Q(n124) );
  INV3 U143 ( .A(bin_time[7]), .Q(n123) );
  IMUX21 U144 ( .A(bin_time[3]), .B(n196), .S(bin_time[4]), .Q(n198) );
  OAI222 U145 ( .A(bin_time[1]), .B(n212), .C(n195), .D(n215), .Q(n200) );
  AOI221 U146 ( .A(n190), .B(n189), .C(n215), .D(n188), .Q(n192) );
  OAI311 U147 ( .A(bin_time[5]), .B(n196), .C(n215), .D(n181), .Q(n182) );
  OAI222 U148 ( .A(bin_time[2]), .B(n189), .C(bin_time[4]), .D(n178), .Q(n183)
         );
  AOI221 U149 ( .A(n190), .B(n206), .C(n215), .D(n177), .Q(n186) );
  OAI212 U150 ( .A(n208), .B(n176), .C(n175), .Q(n177) );
  OAI212 U151 ( .A(n172), .B(n193), .C(n171), .Q(n174) );
  IMUX21 U152 ( .A(bin_time[5]), .B(n193), .S(bin_time[0]), .Q(n176) );
  AOI2111 U153 ( .A(bin_time[5]), .B(n211), .C(n162), .D(n194), .Q(n165) );
  AOI221 U154 ( .A(n196), .B(n215), .C(n190), .D(n203), .Q(n161) );
  AOI211 U155 ( .A(n158), .B(n157), .C(bin_time[0]), .Q(n159) );
  OAI212 U156 ( .A(n210), .B(n203), .C(n158), .Q(n160) );
  NAND22 U157 ( .A(bin_time[3]), .B(n172), .Q(n150) );
  OAI222 U158 ( .A(bin_time[0]), .B(n146), .C(n145), .D(n215), .Q(n147) );
  AOI211 U159 ( .A(n173), .B(n144), .C(n143), .Q(n145) );
  OAI222 U160 ( .A(bin_time[0]), .B(n158), .C(n144), .D(n206), .Q(n143) );
  NOR21 U161 ( .A(n168), .B(n167), .Q(n146) );
  AOI221 U162 ( .A(bin_time[2]), .B(n210), .C(n207), .D(n178), .Q(n168) );
  AOI211 U163 ( .A(n195), .B(n142), .C(n206), .Q(n148) );
  INV3 U164 ( .A(n153), .Q(n142) );
  NOR21 U165 ( .A(n215), .B(n172), .Q(n190) );
  OAI212 U166 ( .A(n134), .B(n215), .C(n187), .Q(n163) );
  INV3 U167 ( .A(bin_time[2]), .Q(n215) );
  AOI2111 U168 ( .A(n173), .B(n189), .C(n208), .D(n179), .Q(n134) );
  INV3 U169 ( .A(bin_time[5]), .Q(n206) );
  NOR21 U170 ( .A(bin_time[1]), .B(n170), .Q(n208) );
  INV3 U171 ( .A(bin_time[4]), .Q(n172) );
  INV3 U172 ( .A(bin_time[3]), .Q(n170) );
  INV3 U173 ( .A(bin_time[10]), .Q(am_pm_display) );
  INV3 U174 ( .A(n116), .Q(hr_display[12]) );
  OAI212 U175 ( .A(bin_time[7]), .B(bin_time[8]), .C(bin_time[9]), .Q(n116) );
  OAI2111 U176 ( .A(n132), .B(n131), .C(n130), .D(n129), .Q(hr_display[6]) );
  OAI311 U177 ( .A(bin_time[7]), .B(bin_time[6]), .C(n132), .D(n126), .Q(
        hr_display[5]) );
  OAI2111 U178 ( .A(n132), .B(n123), .C(n131), .D(n122), .Q(hr_display[4]) );
  NAND31 U179 ( .A(n121), .B(n120), .C(n119), .Q(hr_display[3]) );
  OAI2111 U180 ( .A(bin_time[9]), .B(n123), .C(bin_time[8]), .D(bin_time[6]), 
        .Q(n120) );
  OAI212 U181 ( .A(bin_time[6]), .B(n129), .C(n119), .Q(hr_display[2]) );
  NAND31 U182 ( .A(bin_time[7]), .B(n131), .C(n118), .Q(n119) );
  NAND22 U183 ( .A(bin_time[9]), .B(n123), .Q(n129) );
  OAI222 U184 ( .A(n117), .B(n122), .C(n123), .D(n118), .Q(hr_display[1]) );
  OAI212 U185 ( .A(bin_time[9]), .B(bin_time[8]), .C(n118), .Q(n122) );
  INV3 U186 ( .A(n125), .Q(n117) );
  OAI212 U187 ( .A(n127), .B(n132), .C(n121), .Q(hr_display[0]) );
  IMUX21 U188 ( .A(n128), .B(n123), .S(bin_time[9]), .Q(n121) );
  NOR21 U189 ( .A(bin_time[8]), .B(n123), .Q(n128) );
  NOR21 U190 ( .A(bin_time[9]), .B(n125), .Q(n127) );
  NAND22 U191 ( .A(bin_time[7]), .B(bin_time[6]), .Q(n125) );
  OAI311 U192 ( .A(bin_time[3]), .B(bin_time[2]), .C(n171), .D(n141), .Q(
        min_display[12]) );
  NOR21 U193 ( .A(n154), .B(n140), .Q(n141) );
  OAI212 U194 ( .A(bin_time[2]), .B(n157), .C(n139), .Q(min_display[11]) );
  AOI2111 U195 ( .A(bin_time[2]), .B(n138), .C(bin_time[5]), .D(n140), .Q(n139) );
  AOI211 U196 ( .A(n211), .B(n170), .C(bin_time[4]), .Q(n140) );
  INV3 U197 ( .A(n158), .Q(n138) );
  OAI212 U198 ( .A(bin_time[5]), .B(n218), .C(n217), .Q(min_display[9]) );
  AOI2111 U199 ( .A(n216), .B(n215), .C(n214), .D(n213), .Q(n218) );
  NOR21 U200 ( .A(bin_time[1]), .B(n212), .Q(n214) );
  OAI311 U201 ( .A(bin_time[5]), .B(n211), .C(n210), .D(n209), .Q(
        min_display[8]) );
  AOI221 U202 ( .A(bin_time[5]), .B(n210), .C(n208), .D(n207), .Q(n209) );
  NAND31 U203 ( .A(n206), .B(n212), .C(n205), .Q(min_display[7]) );
  OAI2111 U204 ( .A(n204), .B(n203), .C(n202), .D(n201), .Q(min_display[6]) );
  AOI221 U205 ( .A(bin_time[5]), .B(n200), .C(n215), .D(n199), .Q(n201) );
  OAI212 U206 ( .A(bin_time[0]), .B(n198), .C(n197), .Q(n199) );
  INV3 U207 ( .A(n194), .Q(n202) );
  AOI2111 U208 ( .A(n216), .B(n193), .C(n192), .D(n191), .Q(n204) );
  OAI2111 U209 ( .A(bin_time[4]), .B(n187), .C(n186), .D(n185), .Q(
        min_display[5]) );
  OAI222 U210 ( .A(n203), .B(n184), .C(n183), .D(n182), .Q(n185) );
  AOI221 U211 ( .A(bin_time[0]), .B(n174), .C(bin_time[1]), .D(n173), .Q(n175)
         );
  OAI311 U212 ( .A(n206), .B(n170), .C(n215), .D(n169), .Q(min_display[4]) );
  OAI2111 U213 ( .A(bin_time[2]), .B(n166), .C(n165), .D(n164), .Q(
        min_display[3]) );
  IMUX21 U214 ( .A(n184), .B(n163), .S(bin_time[0]), .Q(n164) );
  OAI222 U215 ( .A(bin_time[5]), .B(n161), .C(bin_time[4]), .D(n187), .Q(n194)
         );
  AOI211 U216 ( .A(bin_time[5]), .B(n160), .C(n159), .Q(n166) );
  AOI211 U217 ( .A(n156), .B(n155), .C(bin_time[0]), .Q(min_display[2]) );
  AOI2111 U218 ( .A(n154), .B(n170), .C(n153), .D(n184), .Q(n155) );
  OAI212 U219 ( .A(n195), .B(n215), .C(n197), .Q(n184) );
  INV3 U220 ( .A(n188), .Q(n154) );
  IMUX21 U221 ( .A(n152), .B(n180), .S(bin_time[2]), .Q(n156) );
  OAI2111 U222 ( .A(n172), .B(n206), .C(n151), .D(n150), .Q(n152) );
  OAI2111 U223 ( .A(n212), .B(n178), .C(n149), .D(n217), .Q(min_display[1]) );
  NAND22 U224 ( .A(n180), .B(n215), .Q(n217) );
  AOI2111 U225 ( .A(n162), .B(n215), .C(n148), .D(n147), .Q(n149) );
  OAI222 U226 ( .A(bin_time[1]), .B(n188), .C(bin_time[5]), .D(n158), .Q(n167)
         );
  NAND22 U227 ( .A(bin_time[3]), .B(bin_time[1]), .Q(n158) );
  NAND22 U228 ( .A(bin_time[4]), .B(n206), .Q(n188) );
  NOR21 U229 ( .A(bin_time[2]), .B(bin_time[4]), .Q(n207) );
  NOR21 U230 ( .A(n193), .B(n205), .Q(n153) );
  INV3 U231 ( .A(n216), .Q(n205) );
  INV3 U232 ( .A(n208), .Q(n178) );
  OAI2111 U233 ( .A(bin_time[2]), .B(n137), .C(n136), .D(n135), .Q(
        min_display[0]) );
  AOI211 U234 ( .A(bin_time[4]), .B(n211), .C(n163), .Q(n135) );
  NOR21 U235 ( .A(n206), .B(n189), .Q(n179) );
  INV3 U236 ( .A(n196), .Q(n189) );
  NOR21 U237 ( .A(bin_time[5]), .B(bin_time[4]), .Q(n173) );
  NOR31 U238 ( .A(bin_time[0]), .B(bin_time[1]), .C(bin_time[2]), .Q(n211) );
  AOI311 U239 ( .A(bin_time[2]), .B(n203), .C(n172), .D(n162), .Q(n136) );
  AOI211 U240 ( .A(n171), .B(n151), .C(n157), .Q(n162) );
  NAND22 U241 ( .A(bin_time[4]), .B(n170), .Q(n157) );
  NAND22 U242 ( .A(bin_time[1]), .B(n206), .Q(n151) );
  NAND22 U243 ( .A(bin_time[5]), .B(n193), .Q(n171) );
  AOI2111 U244 ( .A(n216), .B(n203), .C(n133), .D(n191), .Q(n137) );
  INV3 U245 ( .A(n195), .Q(n191) );
  NAND22 U246 ( .A(n196), .B(n172), .Q(n195) );
  INV3 U247 ( .A(n197), .Q(n133) );
  NAND22 U248 ( .A(bin_time[5]), .B(n144), .Q(n197) );
  NOR21 U249 ( .A(n208), .B(n196), .Q(n144) );
  NOR21 U250 ( .A(bin_time[3]), .B(n193), .Q(n196) );
  NAND22 U251 ( .A(n208), .B(n206), .Q(n187) );
  NOR21 U252 ( .A(n170), .B(n172), .Q(n216) );
  INV3 U253 ( .A(bin_time[6]), .Q(n131) );
  NAND22 U254 ( .A(bin_time[9]), .B(bin_time[8]), .Q(n118) );
  INV3 U255 ( .A(bin_time[8]), .Q(n132) );
  INV3 U256 ( .A(n187), .Q(n180) );
  NAND22 U257 ( .A(n170), .B(n172), .Q(n210) );
  INV3 U258 ( .A(n190), .Q(n212) );
  INV3 U259 ( .A(bin_time[1]), .Q(n193) );
  INV3 U260 ( .A(bin_time[0]), .Q(n203) );
  LOGIC0 U261 ( .Q(hr_display[13]) );
  NOR40 U262 ( .A(bin_time[0]), .B(n179), .C(n168), .D(n167), .Q(n169) );
  NOR40 U263 ( .A(bin_time[0]), .B(n180), .C(n179), .D(n190), .Q(n181) );
endmodule


module CORE ( SET_TIME, ALARM, HOURS, MINUTES, TOGGLE, CLOCK, RESETN, SPEAKER, 
        HR, MIN, AM_PM, TEST_MODE, TEST_SE, TEST_SI );
  output [13:0] HR;
  output [13:0] MIN;
  input SET_TIME, ALARM, HOURS, MINUTES, TOGGLE, CLOCK, RESETN, TEST_MODE,
         TEST_SE, TEST_SI;
  output SPEAKER, AM_PM;
  wire   SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2,
         SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4,
         SYNOPSYS_UNCONNECTED_5;
  wire   [10:0] CLK_DISPLAY;
  assign HR[10] = HR[13];
  assign HR[9] = HR[13];
  assign HR[8] = HR[13];
  assign HR[7] = HR[13];

  COMPUTE_BLOCK U1 ( .SET_TIME(SET_TIME), .ALARM(ALARM), .HRS(HOURS), .MINS(
        MINUTES), .TOGGLE_SWITCH(TOGGLE), .CLK(CLOCK), .TM_FIX(TEST_MODE), 
        .RESETN(RESETN), .TIM_DISPLAY(CLK_DISPLAY), .ALM_DISPLAY(CLK_DISPLAY), 
        .SPEAKER_OUT(SPEAKER), .test_si(TEST_SI), .test_se(TEST_SE) );
  CONVERTOR_CKT U3 ( .bin_time(CLK_DISPLAY), .hr_display({
        SYNOPSYS_UNCONNECTED_1, HR[12:11], SYNOPSYS_UNCONNECTED_2, 
        SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4, SYNOPSYS_UNCONNECTED_5, 
        HR[6:0]}), .min_display(MIN), .am_pm_display(AM_PM) );
  LOGIC0 U2 ( .Q(HR[13]) );
endmodule

