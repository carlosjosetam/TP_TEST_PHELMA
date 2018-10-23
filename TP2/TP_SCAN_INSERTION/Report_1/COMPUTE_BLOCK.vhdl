
library IEEE;

use IEEE.std_logic_1164.all;

package CONV_PACK_COMPUTE_BLOCK is

-- define attributes
attribute ENUM_ENCODING : STRING;

-- define any necessary types
type VHDLOUT_TYPE is range 1 to 12;
type VHDLOUT_TYPE_2 is range 0 to 59;
type VHDLOUT_TYPE_3 is range 0 to 12;

end CONV_PACK_COMPUTE_BLOCK;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_COMPUTE_BLOCK.all;

entity ALARM_COUNTER is

   port( HOURS, MINS, CLK, RESETN : in std_logic;  HRS_OUT : out 
         std_logic_vector (1 to 4);  MINUTES_OUT : out std_logic_vector (0 to 
         5);  AM_PM_OUT : out std_logic);

end ALARM_COUNTER;

architecture SYN_RTL of ALARM_COUNTER is

   component OAI2112
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component XNR22
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component CLKBU15
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component CLKIN15
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component NOR24
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component OAI222
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component BUF15
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component OAI212
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND24
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component CLKIN6
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component NOR42
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component CLKIN12
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND28
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component NOR33
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   component CLKIN4
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND43
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component CLKBU12
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component ADD22
      port( A, B : in std_logic;  CO, S : out std_logic);
   end component;
   
   component DFEC3
      port( D, E, C, RN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   component TFEC3
      port( T, C, RN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   component DFC3
      port( D, C, RN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   component DFP3
      port( D, C, SN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal n74, N20, N21, N22, N23, n38, n39, n40, n41, add_47_carry_2_port, 
      add_47_carry_3_port, add_47_carry_4_port, add_47_carry_5_port, n1, n7, n8
      , n9, n11, n13, n14, n15, n16, n17, n18, n20_port, n21_port, n22_port, 
      n23_port, n24, n25, n26, n27, n28, n29, n30, n32, n33, n34, n37, n110, 
      n75, n76, n77, n78, n79, HRS_OUT_3_port, n81, n82, n83, 
      MINUTES_OUT_5_port, HRS_OUT_0_port, n86, MINUTES_OUT_0_port, 
      MINUTES_OUT_3_port, MINUTES_OUT_4_port, n90, MINUTES_OUT_2_port, 
      HRS_OUT_1_port, MINUTES_OUT_1_port, n94, HRS_OUT_2_port, n96, n97, n98, 
      n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n_1000, 
      n_1001, n_1002, n_1003, n_1004, n_1005, n_1006, n_1007, n_1008, n_1009, 
      n_1010 : std_logic;

begin
   HRS_OUT <= ( HRS_OUT_3_port, HRS_OUT_2_port, HRS_OUT_1_port, HRS_OUT_0_port 
      );
   MINUTES_OUT <= ( MINUTES_OUT_5_port, MINUTES_OUT_4_port, MINUTES_OUT_3_port,
      MINUTES_OUT_2_port, MINUTES_OUT_1_port, MINUTES_OUT_0_port );
   
   HRS_OUT_reg_2_inst : DFP3 port map( D => n40, C => CLK, SN => RESETN, Q => 
                           n_1000, QN => n106);
   HRS_OUT_reg_3_inst : DFP3 port map( D => n41, C => CLK, SN => RESETN, Q => 
                           n_1001, QN => n107);
   MINUTES_OUT_reg_2_inst : DFEC3 port map( D => n7, E => n100, C => CLK, RN =>
                           RESETN, Q => n_1002, QN => n104);
   MINUTES_OUT_reg_0_inst : DFEC3 port map( D => n75, E => n100, C => CLK, RN 
                           => RESETN, Q => n110, QN => n_1003);
   HRS_OUT_reg_0_inst : DFC3 port map( D => n38, C => CLK, RN => RESETN, Q => 
                           n79, QN => n_1004);
   HRS_OUT_reg_1_inst : DFC3 port map( D => n39, C => CLK, RN => RESETN, Q => 
                           n_1005, QN => n32);
   AM_PM_OUT_reg : TFEC3 port map( T => n34, C => CLK, RN => RESETN, Q => 
                           AM_PM_OUT, QN => n_1006);
   MINUTES_OUT_reg_1_inst : DFEC3 port map( D => n8, E => n100, C => CLK, RN =>
                           RESETN, Q => n74, QN => n_1007);
   MINUTES_OUT_reg_3_inst : DFEC3 port map( D => n78, E => n100, C => CLK, RN 
                           => RESETN, Q => n_1008, QN => n99);
   MINUTES_OUT_reg_4_inst : DFEC3 port map( D => n9, E => n100, C => CLK, RN =>
                           RESETN, Q => n_1009, QN => n102);
   MINUTES_OUT_reg_5_inst : DFEC3 port map( D => n37, E => n100, C => CLK, RN 
                           => RESETN, Q => n_1010, QN => n33);
   add_47_U1_1_1 : ADD22 port map( A => MINUTES_OUT_0_port, B => 
                           MINUTES_OUT_1_port, CO => add_47_carry_2_port, S => 
                           N20);
   add_47_U1_1_2 : ADD22 port map( A => add_47_carry_2_port, B => 
                           MINUTES_OUT_2_port, CO => add_47_carry_3_port, S => 
                           N21);
   add_47_U1_1_3 : ADD22 port map( A => add_47_carry_3_port, B => 
                           MINUTES_OUT_3_port, CO => add_47_carry_4_port, S => 
                           N22);
   add_47_U1_1_4 : ADD22 port map( A => add_47_carry_4_port, B => 
                           MINUTES_OUT_4_port, CO => add_47_carry_5_port, S => 
                           N23);
   U22 : OAI222 port map( A => MINS, B => n13, C => n20_port, D => n96, Q => 
                           n22_port);
   U3 : CLKBU12 port map( A => n27, Q => n81);
   U4 : CLKBU15 port map( A => n15, Q => n96);
   U5 : NAND43 port map( A => MINUTES_OUT_4_port, B => MINUTES_OUT_0_port, C =>
                           MINUTES_OUT_3_port, D => n30, Q => n15);
   U6 : BUF15 port map( A => n77, Q => HRS_OUT_2_port);
   U7 : BUF15 port map( A => n105, Q => n94);
   U8 : CLKIN4 port map( A => n22_port, Q => n105);
   U9 : CLKIN6 port map( A => MINUTES_OUT_0_port, Q => n75);
   U10 : CLKBU15 port map( A => n32, Q => n82);
   U11 : BUF15 port map( A => n79, Q => HRS_OUT_0_port);
   U12 : NOR33 port map( A => n86, B => n76, C => MINUTES_OUT_2_port, Q => n30)
                           ;
   U13 : CLKIN12 port map( A => MINUTES_OUT_1_port, Q => n76);
   U14 : CLKBU15 port map( A => n107, Q => n97);
   U15 : CLKIN12 port map( A => n83, Q => n77);
   U16 : CLKBU15 port map( A => n106, Q => n83);
   U17 : NAND28 port map( A => HRS_OUT_2_port, B => n1, Q => n25);
   U18 : NAND28 port map( A => HRS_OUT_0_port, B => HRS_OUT_1_port, Q => n26);
   U19 : CLKIN12 port map( A => n20_port, Q => n100);
   U20 : NAND28 port map( A => n13, B => MINS, Q => n20_port);
   U21 : CLKIN12 port map( A => n82, Q => n11);
   U23 : CLKIN15 port map( A => n86, Q => MINUTES_OUT_5_port);
   U24 : CLKIN15 port map( A => n97, Q => HRS_OUT_3_port);
   U25 : CLKIN6 port map( A => n108, Q => n37);
   U26 : NAND24 port map( A => n109, B => n96, Q => n108);
   U27 : CLKIN6 port map( A => n14, Q => n9);
   U28 : NAND24 port map( A => N23, B => n96, Q => n14);
   U29 : CLKIN6 port map( A => n16, Q => n8);
   U30 : NAND24 port map( A => N20, B => n96, Q => n16);
   U31 : NOR42 port map( A => HRS_OUT_1_port, B => HRS_OUT_0_port, C => n83, D 
                           => n97, Q => n27);
   U32 : CLKIN6 port map( A => n18, Q => n78);
   U33 : NAND24 port map( A => N22, B => n96, Q => n18);
   U34 : CLKIN6 port map( A => n17, Q => n7);
   U35 : NAND24 port map( A => N21, B => n96, Q => n17);
   U36 : OAI222 port map( A => n21_port, B => n94, C => n90, D => n97, Q => n41
                           );
   U37 : XNR22 port map( A => n23_port, B => n24, Q => n21_port);
   U38 : CLKIN15 port map( A => HOURS, Q => n13);
   U39 : NOR24 port map( A => n97, B => n81, Q => n23_port);
   U40 : CLKIN15 port map( A => n81, Q => n1);
   U41 : NOR24 port map( A => n26, B => n25, Q => n24);
   U42 : OAI212 port map( A => n90, B => n82, C => n29, Q => n39);
   U43 : XNR22 port map( A => n86, B => add_47_carry_5_port, Q => n109);
   U44 : BUF15 port map( A => n11, Q => HRS_OUT_1_port);
   U45 : CLKBU15 port map( A => n33, Q => n86);
   U46 : OAI222 port map( A => n90, B => n83, C => n94, D => n28, Q => n40);
   U47 : NOR24 port map( A => n1, B => n94, Q => n34);
   U48 : CLKBU15 port map( A => n110, Q => MINUTES_OUT_0_port);
   U49 : CLKBU15 port map( A => n99, Q => n98);
   U50 : CLKIN15 port map( A => n98, Q => MINUTES_OUT_3_port);
   U51 : CLKBU15 port map( A => n102, Q => n101);
   U52 : CLKIN15 port map( A => n101, Q => MINUTES_OUT_4_port);
   U53 : CLKIN15 port map( A => n94, Q => n90);
   U54 : CLKBU15 port map( A => n104, Q => n103);
   U55 : CLKIN15 port map( A => n103, Q => MINUTES_OUT_2_port);
   U56 : XNR22 port map( A => n26, B => n25, Q => n28);
   U57 : CLKBU15 port map( A => n74, Q => MINUTES_OUT_1_port);
   U58 : XNR22 port map( A => HRS_OUT_0_port, B => n94, Q => n38);
   U59 : OAI2112 port map( A => HRS_OUT_1_port, B => HRS_OUT_0_port, C => n26, 
                           D => n90, Q => n29);

end SYN_RTL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_COMPUTE_BLOCK.all;

entity ALARM_STATE_MACHINE is

   port( ALARM_BUTTON, HOURS_BUTTON, MINUTES_BUTTON, CLK, RESETN : in std_logic
         ;  HOURS, MINS : out std_logic);

end ALARM_STATE_MACHINE;

architecture SYN_RTL of ALARM_STATE_MACHINE is

   component CLKIN6
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component NOR42
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component CLKIN15
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND43
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component NOR24
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND24
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component CLKBU15
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component CLKBU12
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component DFC3
      port( D, C, RN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal n18, n11, NEXT_STATE_1_port, NEXT_HOURS, n1, n3, n4, n5, n6, n7, n8, 
      n13, n14, n16, n17, n_1011, n_1012, n_1013, n_1014 : std_logic;

begin
   
   CURRENT_STATE_reg_0_inst : DFC3 port map( D => n3, C => CLK, RN => RESETN, Q
                           => n17, QN => n_1011);
   CURRENT_STATE_reg_1_inst : DFC3 port map( D => NEXT_STATE_1_port, C => CLK, 
                           RN => RESETN, Q => n_1012, QN => n8);
   MINS_reg : DFC3 port map( D => n1, C => CLK, RN => RESETN, Q => n11, QN => 
                           n_1013);
   HOURS_reg : DFC3 port map( D => NEXT_HOURS, C => CLK, RN => RESETN, Q => n18
                           , QN => n_1014);
   U3 : CLKBU12 port map( A => n17, Q => n13);
   U4 : CLKBU12 port map( A => n6, Q => n16);
   U5 : CLKBU15 port map( A => n11, Q => MINS);
   U6 : CLKBU12 port map( A => n8, Q => n14);
   U7 : CLKIN15 port map( A => ALARM_BUTTON, Q => n4);
   U8 : CLKBU15 port map( A => n18, Q => HOURS);
   U9 : CLKIN6 port map( A => n7, Q => n1);
   U10 : NAND24 port map( A => NEXT_STATE_1_port, B => n14, Q => n7);
   U11 : NOR24 port map( A => n13, B => n16, Q => NEXT_HOURS);
   U12 : NAND43 port map( A => HOURS_BUTTON, B => n14, C => ALARM_BUTTON, D => 
                           n5, Q => n6);
   U13 : CLKIN15 port map( A => MINUTES_BUTTON, Q => n5);
   U14 : NOR42 port map( A => n13, B => n5, C => n4, D => HOURS_BUTTON, Q => 
                           NEXT_STATE_1_port);
   U15 : CLKIN6 port map( A => n16, Q => n3);

end SYN_RTL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_COMPUTE_BLOCK.all;

entity TIME_COUNTER is

   port( HOURS, MINS, SECS, CLK, RESETN : in std_logic;  HOURS_OUT : out 
         std_logic_vector (0 to 3);  MINUTES_OUT : out std_logic_vector (0 to 
         5);  AM_PM_OUT : out std_logic);

end TIME_COUNTER;

architecture SYN_RTL of TIME_COUNTER is

   component XNR21
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component CLKIN4
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component NOR24
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component OAI222
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component BUF15
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component CLKIN15
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component NOR33
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   component CLKBU12
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component CLKBU15
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component AOI222
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component OAI212
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND24
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component CLKIN12
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component CLKIN3
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component XNR22
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component NOR42
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND34
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND28
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component CLKIN6
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND43
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND42
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component IMUX21
      port( A, B, S : in std_logic;  Q : out std_logic);
   end component;
   
   component MUX22
      port( A, B, S : in std_logic;  Q : out std_logic);
   end component;
   
   component XOR21
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component BUF8
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component AOI212
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   component ADD22
      port( A, B : in std_logic;  CO, S : out std_logic);
   end component;
   
   component DFEC3
      port( D, E, C, RN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   component DFP3
      port( D, C, SN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   component DFC3
      port( D, C, RN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal n127, N28, N29, N30, N31, N45, N46, N47, N48, n5, n9, n10, n16, n17, 
      n71, n72, n73, n74, n75, n76, n77, n78, n80, n81, n82, n83, n84, n86, 
      add_54_carry_2_port, add_54_carry_3_port, add_54_carry_4_port, 
      add_54_carry_5_port, r84_carry_2_port, r84_carry_3_port, r84_carry_4_port
      , r84_carry_5_port, n110, n3, n4, n6, n7, n11, n12, n13, n14, n15, n19, 
      n20, n21, n22, n23, n24, n25, n30_port, n31_port, n32, n33, n34, n35, n36
      , n37, n38, n39, n40, n41, n42, n43, n44, n45_port, n46_port, n47_port, 
      n48_port, n49, n50, n51, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62
      , n63, n64, n65, n66, n67, n68, n69, n70, n79, n87, n188, n133, n134, 
      n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, 
      n148, n149, n150, n151, n152, HOURS_OUT_3_port, n154, n155, n156, n157, 
      n158, MINUTES_OUT_0_port, n160, HOURS_OUT_1_port, MINUTES_OUT_1_port, 
      MINUTES_OUT_5_port, n164, MINUTES_OUT_3_port, MINUTES_OUT_2_port, 
      MINUTES_OUT_4_port, HOURS_OUT_2_port, n169, n170, n171, n172, n173, 
      HOURS_OUT_0_port, n175, n176, n177, n178, n179, n180, n181, n182, n183, 
      n184, n185, n186, n187, n_1015, n_1016, n_1017, n_1018, n_1019, n_1020, 
      n_1021, n_1022, n_1023, n_1024, n_1025, n_1026, n_1027, n_1028, n_1029 : 
      std_logic;

begin
   HOURS_OUT <= ( HOURS_OUT_3_port, HOURS_OUT_2_port, HOURS_OUT_1_port, 
      HOURS_OUT_0_port );
   MINUTES_OUT <= ( MINUTES_OUT_5_port, MINUTES_OUT_4_port, MINUTES_OUT_3_port,
      MINUTES_OUT_2_port, MINUTES_OUT_1_port, MINUTES_OUT_0_port );
   
   CURRENT_SECS_reg_0_inst : DFC3 port map( D => n86, C => CLK, RN => RESETN, Q
                           => n_1015, QN => n180);
   CURRENT_SECS_reg_1_inst : DFC3 port map( D => n11, C => CLK, RN => RESETN, Q
                           => n87, QN => n_1016);
   MINUTES_OUT_reg_0_inst : DFC3 port map( D => n80, C => CLK, RN => RESETN, Q 
                           => n_1017, QN => n69);
   MINUTES_OUT_reg_1_inst : DFC3 port map( D => n4, C => CLK, RN => RESETN, Q 
                           => n_1018, QN => n178);
   HOURS_OUT_reg_1_inst : DFC3 port map( D => n73, C => CLK, RN => RESETN, Q =>
                           n_1019, QN => n16);
   HOURS_OUT_reg_0_inst : DFC3 port map( D => n74, C => CLK, RN => RESETN, Q =>
                           n_1020, QN => n17);
   CURRENT_SECS_reg_2_inst : DFC3 port map( D => n84, C => CLK, RN => RESETN, Q
                           => n_1021, QN => n68);
   CURRENT_SECS_reg_3_inst : DFC3 port map( D => n83, C => CLK, RN => RESETN, Q
                           => n_1022, QN => n10);
   CURRENT_SECS_reg_4_inst : DFC3 port map( D => n82, C => CLK, RN => RESETN, Q
                           => n_1023, QN => n9);
   CURRENT_SECS_reg_5_inst : DFC3 port map( D => n81, C => CLK, RN => RESETN, Q
                           => n_1024, QN => n5);
   MINUTES_OUT_reg_2_inst : DFC3 port map( D => n78, C => CLK, RN => RESETN, Q 
                           => n_1025, QN => n67);
   MINUTES_OUT_reg_3_inst : DFC3 port map( D => n77, C => CLK, RN => RESETN, Q 
                           => n_1026, QN => n66);
   MINUTES_OUT_reg_4_inst : DFC3 port map( D => n76, C => CLK, RN => RESETN, Q 
                           => n_1027, QN => n65);
   MINUTES_OUT_reg_5_inst : DFC3 port map( D => n75, C => CLK, RN => RESETN, Q 
                           => n127, QN => n79);
   HOURS_OUT_reg_3_inst : DFP3 port map( D => n71, C => CLK, SN => RESETN, Q =>
                           n_1028, QN => n186);
   HOURS_OUT_reg_2_inst : DFP3 port map( D => n72, C => CLK, SN => RESETN, Q =>
                           n188, QN => n184);
   AM_PM_OUT_reg : DFEC3 port map( D => n110, E => n3, C => CLK, RN => RESETN, 
                           Q => n_1029, QN => n70);
   add_54_U1_1_1 : ADD22 port map( A => n170, B => n160, CO => 
                           add_54_carry_2_port, S => N45);
   add_54_U1_1_2 : ADD22 port map( A => add_54_carry_2_port, B => n141, CO => 
                           add_54_carry_3_port, S => N46);
   add_54_U1_1_3 : ADD22 port map( A => add_54_carry_3_port, B => n140, CO => 
                           add_54_carry_4_port, S => N47);
   add_54_U1_1_4 : ADD22 port map( A => add_54_carry_4_port, B => n142, CO => 
                           add_54_carry_5_port, S => N48);
   r84_U1_1_1 : ADD22 port map( A => MINUTES_OUT_0_port, B => 
                           MINUTES_OUT_1_port, CO => r84_carry_2_port, S => N28
                           );
   r84_U1_1_2 : ADD22 port map( A => r84_carry_2_port, B => MINUTES_OUT_2_port,
                           CO => r84_carry_3_port, S => N29);
   r84_U1_1_3 : ADD22 port map( A => r84_carry_3_port, B => MINUTES_OUT_3_port,
                           CO => r84_carry_4_port, S => N30);
   r84_U1_1_4 : ADD22 port map( A => r84_carry_4_port, B => MINUTES_OUT_4_port,
                           CO => r84_carry_5_port, S => N31);
   U3 : OAI222 port map( A => n179, B => n172, C => n160, D => n171, Q => n86);
   U20 : AOI212 port map( A => n19, B => n6, C => n7, Q => n47_port);
   U24 : XNR22 port map( A => HOURS_OUT_0_port, B => HOURS_OUT_1_port, Q => n51
                           );
   U33 : OAI222 port map( A => n59, B => n185, C => n155, D => n187, Q => n50);
   U41 : AOI212 port map( A => n63, B => n187, C => n23, Q => n62);
   U61 : CLKIN6 port map( A => r84_carry_5_port, Q => n19);
   U4 : BUF8 port map( A => n5, Q => n144);
   U5 : MUX22 port map( A => n133, B => n188, S => n181, Q => n72);
   U6 : XOR21 port map( A => n53, B => n54, Q => n133);
   U7 : MUX22 port map( A => n39, B => n134, S => n5, Q => n81);
   U8 : CLKIN3 port map( A => n38, Q => n134);
   U9 : IMUX21 port map( A => n51, B => n16, S => n181, Q => n73);
   U10 : CLKIN12 port map( A => n151, Q => n23);
   U11 : CLKBU12 port map( A => n58, Q => n151);
   U12 : CLKBU12 port map( A => n16, Q => n154);
   U13 : CLKIN12 port map( A => n155, Q => n3);
   U14 : CLKIN12 port map( A => n176, Q => n7);
   U15 : CLKIN12 port map( A => n158, Q => n32);
   U16 : NAND42 port map( A => n160, B => n170, C => n152, D => n61, Q => n42);
   U17 : BUF15 port map( A => n136, Q => MINUTES_OUT_2_port);
   U18 : BUF15 port map( A => n138, Q => MINUTES_OUT_4_port);
   U19 : BUF15 port map( A => n139, Q => MINUTES_OUT_3_port);
   U21 : CLKIN12 port map( A => n154, Q => n24);
   U22 : BUF15 port map( A => n182, Q => n157);
   U23 : CLKBU12 port map( A => n44, Q => n183);
   U25 : BUF15 port map( A => n137, Q => MINUTES_OUT_0_port);
   U26 : CLKIN12 port map( A => n164, Q => n182);
   U27 : CLKBU15 port map( A => n49, Q => n187);
   U28 : NAND43 port map( A => MINUTES_OUT_5_port, B => MINUTES_OUT_1_port, C 
                           => n150, D => n64, Q => n49);
   U29 : CLKIN4 port map( A => n50, Q => n181);
   U30 : CLKIN6 port map( A => n70, Q => AM_PM_OUT);
   U31 : CLKIN15 port map( A => n169, Q => HOURS_OUT_3_port);
   U32 : CLKBU15 port map( A => n186, Q => n169);
   U34 : CLKIN12 port map( A => n150, Q => n136);
   U35 : CLKIN12 port map( A => n146, Q => n137);
   U36 : CLKBU15 port map( A => n67, Q => n150);
   U37 : CLKBU15 port map( A => n69, Q => n146);
   U38 : CLKBU12 port map( A => n87, Q => n170);
   U39 : CLKIN12 port map( A => n148, Q => n138);
   U40 : CLKIN12 port map( A => n149, Q => n139);
   U42 : CLKBU15 port map( A => n65, Q => n148);
   U43 : CLKBU15 port map( A => n66, Q => n149);
   U44 : CLKIN12 port map( A => n145, Q => n140);
   U45 : CLKIN12 port map( A => n152, Q => n141);
   U46 : CLKBU15 port map( A => n10, Q => n145);
   U47 : CLKBU15 port map( A => n68, Q => n152);
   U48 : CLKIN12 port map( A => n147, Q => n142);
   U49 : CLKBU15 port map( A => n9, Q => n147);
   U50 : NAND28 port map( A => n187, B => n175, Q => n45_port);
   U51 : NAND28 port map( A => HOURS_OUT_2_port, B => n23, Q => n54);
   U52 : CLKBU15 port map( A => n35, Q => n171);
   U53 : NAND24 port map( A => n32, B => n173, Q => n35);
   U54 : CLKIN12 port map( A => n45_port, Q => n6);
   U55 : NAND28 port map( A => HOURS_OUT_0_port, B => HOURS_OUT_1_port, Q => 
                           n53);
   U56 : OAI222 port map( A => n47_port, B => n79, C => n48_port, D => n19, Q 
                           => n75);
   U57 : NAND24 port map( A => n79, B => n6, Q => n48_port);
   U58 : CLKBU12 port map( A => n41, Q => n143);
   U59 : NAND34 port map( A => n33, B => n34, C => SECS, Q => n43);
   U60 : NOR42 port map( A => n184, B => HOURS_OUT_0_port, C => 
                           HOURS_OUT_1_port, D => n169, Q => n58);
   U62 : NOR33 port map( A => n146, B => n148, C => n149, Q => n64);
   U63 : NOR33 port map( A => n144, B => n147, C => n145, Q => n61);
   U64 : CLKIN4 port map( A => N46, Q => n15);
   U65 : CLKBU15 port map( A => n60, Q => n155);
   U66 : CLKIN3 port map( A => n46_port, Q => n4);
   U67 : NOR33 port map( A => HOURS, B => n34, C => SECS, Q => n40);
   U68 : CLKIN15 port map( A => MINS, Q => n34);
   U69 : OAI222 port map( A => n157, B => n169, C => n164, D => n55, Q => n71);
   U70 : XNR22 port map( A => n56, B => n57, Q => n55);
   U71 : CLKIN4 port map( A => N47, Q => n14);
   U72 : CLKIN4 port map( A => N48, Q => n13);
   U73 : CLKIN15 port map( A => HOURS, Q => n33);
   U74 : BUF15 port map( A => n181, Q => n164);
   U75 : OAI212 port map( A => n171, B => n156, C => n172, Q => n39);
   U76 : CLKIN3 port map( A => n36, Q => n11);
   U77 : AOI222 port map( A => n170, B => n31_port, C => N45, D => n12, Q => 
                           n36);
   U78 : CLKIN12 port map( A => n171, Q => n12);
   U79 : NAND24 port map( A => n12, B => n156, Q => n38);
   U80 : NOR24 port map( A => n169, B => n151, Q => n56);
   U81 : CLKBU15 port map( A => n17, Q => n25);
   U82 : CLKIN12 port map( A => n185, Q => n30_port);
   U83 : CLKBU15 port map( A => n40, Q => n185);
   U84 : NOR24 port map( A => n53, B => n54, Q => n57);
   U85 : NOR33 port map( A => MINS, B => n33, C => SECS, Q => n41);
   U86 : CLKBU12 port map( A => add_54_carry_5_port, Q => n156);
   U87 : CLKBU15 port map( A => n43, Q => n158);
   U88 : NAND24 port map( A => n3, B => n158, Q => n59);
   U89 : NAND24 port map( A => n30_port, B => n158, Q => n63);
   U90 : OAI212 port map( A => n158, B => n173, C => n30_port, Q => n44);
   U91 : CLKBU15 port map( A => n37, Q => n31_port);
   U92 : CLKBU15 port map( A => n180, Q => n179);
   U93 : CLKIN15 port map( A => n179, Q => n160);
   U94 : BUF15 port map( A => n24, Q => HOURS_OUT_1_port);
   U95 : CLKBU15 port map( A => n178, Q => n177);
   U96 : CLKIN15 port map( A => n177, Q => MINUTES_OUT_1_port);
   U97 : AOI222 port map( A => n7, B => MINUTES_OUT_1_port, C => N28, D => n6, 
                           Q => n46_port);
   U98 : CLKBU15 port map( A => n127, Q => MINUTES_OUT_5_port);
   U99 : OAI222 port map( A => n25, B => n157, C => n164, D => HOURS_OUT_0_port
                           , Q => n74);
   U100 : CLKBU15 port map( A => n188, Q => HOURS_OUT_2_port);
   U101 : OAI222 port map( A => n152, B => n172, C => n15, D => n171, Q => n84)
                           ;
   U102 : OAI222 port map( A => n147, B => n172, C => n13, D => n171, Q => n82)
                           ;
   U103 : OAI222 port map( A => n145, B => n172, C => n14, D => n171, Q => n83)
                           ;
   U104 : CLKIN15 port map( A => n31_port, Q => n172);
   U105 : CLKBU12 port map( A => n42, Q => n173);
   U106 : NOR33 port map( A => n185, B => n32, C => n143, Q => n37);
   U107 : CLKIN15 port map( A => n25, Q => HOURS_OUT_0_port);
   U108 : BUF15 port map( A => n176, Q => n175);
   U109 : BUF15 port map( A => n183, Q => n176);
   U110 : OAI222 port map( A => n183, B => n148, C => n20, D => n45_port, Q => 
                           n76);
   U111 : OAI222 port map( A => n146, B => n175, C => MINUTES_OUT_0_port, D => 
                           n45_port, Q => n80);
   U112 : OAI222 port map( A => n150, B => n175, C => n22, D => n45_port, Q => 
                           n78);
   U113 : OAI222 port map( A => n149, B => n175, C => n21, D => n45_port, Q => 
                           n77);
   U114 : NOR24 port map( A => n176, B => n143, Q => n60);
   U115 : CLKIN4 port map( A => N29, Q => n22);
   U116 : CLKIN4 port map( A => N30, Q => n21);
   U117 : CLKIN4 port map( A => N31, Q => n20);
   U118 : XNR21 port map( A => n62, B => n70, Q => n110);

end SYN_RTL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_COMPUTE_BLOCK.all;

entity TIME_STATE_MACHINE is

   port( TIME_BUTTON, HOURS_BUTTON, MINUTES_BUTTON, CLK, RESETN : in std_logic;
         SECS, HOURS, MINS : out std_logic);

end TIME_STATE_MACHINE;

architecture SYN_RTL of TIME_STATE_MACHINE is

   component CLKIN15
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND34
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   component CLKIN6
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component CLKBU15
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component OAI312
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component NOR24
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND33
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND28
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component CLKIN12
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component BUF15
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component NOR33
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   component DFC3
      port( D, C, RN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal n22, n23, NEXT_STATE_0_port, NEXT_SECS, n1, n2, n5, n6, n7, n8, n9, 
      n10, n11, n12, n14, n24, n25, n26, n27, n29, n32, n33, n34, n35, n36, 
      n_1030, n_1031, n_1032, n_1033, n_1034 : std_logic;

begin
   
   CURRENT_STATE_reg_0_inst : DFC3 port map( D => n35, C => CLK, RN => RESETN, 
                           Q => n_1030, QN => n36);
   CURRENT_STATE_reg_1_inst : DFC3 port map( D => n2, C => CLK, RN => RESETN, Q
                           => n12, QN => n_1031);
   MINS_reg : DFC3 port map( D => n14, C => CLK, RN => RESETN, Q => n23, QN => 
                           n_1032);
   SECS_reg : DFC3 port map( D => NEXT_SECS, C => CLK, RN => RESETN, Q => 
                           n_1033, QN => n34);
   HOURS_reg : DFC3 port map( D => n1, C => CLK, RN => RESETN, Q => n22, QN => 
                           n_1034);
   U7 : NOR33 port map( A => HOURS_BUTTON, B => n6, C => n5, Q => n8);
   U3 : BUF15 port map( A => n25, Q => n27);
   U4 : CLKIN12 port map( A => n29, Q => n24);
   U5 : CLKBU15 port map( A => n12, Q => n29);
   U6 : CLKIN12 port map( A => n26, Q => n25);
   U8 : CLKBU15 port map( A => n36, Q => n26);
   U9 : NAND28 port map( A => n26, B => n35, Q => n11);
   U10 : CLKBU15 port map( A => n8, Q => n32);
   U11 : NAND28 port map( A => n26, B => n32, Q => n7);
   U12 : CLKIN15 port map( A => TIME_BUTTON, Q => n5);
   U13 : CLKIN6 port map( A => n11, Q => n1);
   U14 : NOR24 port map( A => n7, B => n29, Q => n14);
   U15 : CLKBU15 port map( A => n23, Q => MINS);
   U16 : NAND33 port map( A => n10, B => n24, C => n27, Q => n9);
   U17 : CLKBU15 port map( A => n22, Q => HOURS);
   U18 : NOR24 port map( A => n29, B => n10, Q => NEXT_STATE_0_port);
   U19 : OAI312 port map( A => n32, B => n35, C => n27, D => n9, Q => NEXT_SECS
                           );
   U20 : CLKBU15 port map( A => NEXT_STATE_0_port, Q => n35);
   U21 : CLKBU15 port map( A => n34, Q => n33);
   U22 : CLKIN15 port map( A => n33, Q => SECS);
   U23 : CLKIN6 port map( A => n7, Q => n2);
   U24 : NAND34 port map( A => n6, B => TIME_BUTTON, C => HOURS_BUTTON, Q => 
                           n10);
   U25 : CLKIN15 port map( A => MINUTES_BUTTON, Q => n6);

end SYN_RTL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_COMPUTE_BLOCK.all;

entity ALARM_SM_2 is

   port( COMPARE_IN, TOGGLE_ON, CLOCK, RESETN : in std_logic;  RING : out 
         std_logic);

end ALARM_SM_2;

architecture SYN_RTL of ALARM_SM_2 is

   component CLKIN2
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component OAI211
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   component DFC3
      port( D, C, RN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal CURRENT_STATE, n1, n2, n_1035 : std_logic;

begin
   RING <= CURRENT_STATE;
   
   CURRENT_STATE_reg : DFC3 port map( D => n1, C => CLOCK, RN => RESETN, Q => 
                           CURRENT_STATE, QN => n_1035);
   U3 : OAI211 port map( A => COMPARE_IN, B => CURRENT_STATE, C => TOGGLE_ON, Q
                           => n2);
   U4 : CLKIN2 port map( A => n2, Q => n1);

end SYN_RTL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_COMPUTE_BLOCK.all;

entity COMPARATOR is

   port( ALARM_HRS, TIME_HRS : in std_logic_vector (1 to 4);  ALARM_MINS, 
         TIME_MINS : in std_logic_vector (0 to 5);  ALARM_AM_PM, TIME_AM_PM : 
         in std_logic;  RINGER : out std_logic);

end COMPARATOR;

architecture SYN_RTL of COMPARATOR is

   component NAND22
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component NOR41
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component XNR22
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND32
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND31
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   signal n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15 : 
      std_logic;

begin
   
   U1 : NAND31 port map( A => n7, B => n8, C => n9, Q => n3);
   U2 : XNR22 port map( A => TIME_HRS(4), B => ALARM_HRS(4), Q => n7);
   U3 : NAND32 port map( A => n10, B => n11, C => n12, Q => n2);
   U4 : NAND32 port map( A => n13, B => n14, C => n15, Q => n1);
   U5 : XNR22 port map( A => TIME_HRS(2), B => ALARM_HRS(2), Q => n9);
   U6 : XNR22 port map( A => TIME_HRS(3), B => ALARM_HRS(3), Q => n11);
   U7 : XNR22 port map( A => TIME_AM_PM, B => ALARM_AM_PM, Q => n8);
   U8 : XNR22 port map( A => ALARM_HRS(1), B => TIME_HRS(1), Q => n12);
   U9 : XNR22 port map( A => TIME_MINS(0), B => ALARM_MINS(0), Q => n15);
   U10 : XNR22 port map( A => TIME_MINS(5), B => ALARM_MINS(5), Q => n5);
   U11 : XNR22 port map( A => TIME_MINS(2), B => ALARM_MINS(2), Q => n13);
   U12 : XNR22 port map( A => TIME_MINS(1), B => ALARM_MINS(1), Q => n14);
   U13 : XNR22 port map( A => TIME_MINS(3), B => ALARM_MINS(3), Q => n10);
   U14 : XNR22 port map( A => TIME_MINS(4), B => ALARM_MINS(4), Q => n6);
   U15 : NOR41 port map( A => n2, B => n1, C => n4, D => n3, Q => RINGER);
   U16 : NAND22 port map( A => n5, B => n6, Q => n4);

end SYN_RTL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_COMPUTE_BLOCK.all;

entity ALARM_BLOCK is

   port( ALARM, HRS, MINS, CLK, RESETN, ENABLE : in std_logic;  HRS_OUT : out 
         std_logic_vector (1 to 4);  MINS_OUT : out std_logic_vector (0 to 5); 
         AM_PM_OUT : out std_logic;  DISPLAY_BUS : out std_logic_vector (10 
         downto 0));

end ALARM_BLOCK;

architecture SYN_NET of ALARM_BLOCK is

   component BUFE6
      port( A, E : in std_logic;  Q : out std_logic);
   end component;
   
   component ALARM_COUNTER
      port( HOURS, MINS, CLK, RESETN : in std_logic;  HRS_OUT : out 
            std_logic_vector (1 to 4);  MINUTES_OUT : out std_logic_vector (0 
            to 5);  AM_PM_OUT : out std_logic);
   end component;
   
   component ALARM_STATE_MACHINE
      port( ALARM_BUTTON, HOURS_BUTTON, MINUTES_BUTTON, CLK, RESETN : in 
            std_logic;  HOURS, MINS : out std_logic);
   end component;
   
   signal HRS_OUT_3_port, HRS_OUT_2_port, HRS_OUT_1_port, HRS_OUT_0_port, 
      MINS_OUT_5_port, MINS_OUT_4_port, MINS_OUT_3_port, MINS_OUT_2_port, 
      MINS_OUT_1_port, MINS_OUT_0_port, AM_PM_OUT_port, CONNECT1, CONNECT2 : 
      std_logic;
   
   signal HRS_OUT_pin : std_logic_vector (1 to 4);
   
   signal MINUTES_OUT_pin : std_logic_vector (0 to 5);

begin
   HRS_OUT <= ( HRS_OUT_3_port, HRS_OUT_2_port, HRS_OUT_1_port, HRS_OUT_0_port 
      );
   MINS_OUT <= ( MINS_OUT_5_port, MINS_OUT_4_port, MINS_OUT_3_port, 
      MINS_OUT_2_port, MINS_OUT_1_port, MINS_OUT_0_port );
   AM_PM_OUT <= AM_PM_OUT_port;
   
   U0 : ALARM_STATE_MACHINE port map( ALARM_BUTTON => ALARM, HOURS_BUTTON => 
                           HRS, MINUTES_BUTTON => MINS, CLK => CLK, RESETN => 
                           RESETN, HOURS => CONNECT1, MINS => CONNECT2);
   ( HRS_OUT_3_port, HRS_OUT_2_port, HRS_OUT_1_port, HRS_OUT_0_port ) <= 
      HRS_OUT_pin;
   ( MINS_OUT_5_port, MINS_OUT_4_port, MINS_OUT_3_port, MINS_OUT_2_port, 
      MINS_OUT_1_port, MINS_OUT_0_port ) <= MINUTES_OUT_pin;
   U3 : ALARM_COUNTER port map( HOURS => CONNECT1, MINS => CONNECT2, CLK => CLK
      , RESETN => RESETN, HRS_OUT => HRS_OUT_pin, MINUTES_OUT => 
      MINUTES_OUT_pin, AM_PM_OUT => AM_PM_OUT_port);
   DISPLAY_BUS_tri_7_inst : BUFE6 port map( A => HRS_OUT_1_port, E => ENABLE, Q
                           => DISPLAY_BUS(7));
   DISPLAY_BUS_tri_10_inst : BUFE6 port map( A => AM_PM_OUT_port, E => ENABLE, 
                           Q => DISPLAY_BUS(10));
   DISPLAY_BUS_tri_6_inst : BUFE6 port map( A => HRS_OUT_0_port, E => ENABLE, Q
                           => DISPLAY_BUS(6));
   DISPLAY_BUS_tri_2_inst : BUFE6 port map( A => MINS_OUT_2_port, E => ENABLE, 
                           Q => DISPLAY_BUS(2));
   DISPLAY_BUS_tri_4_inst : BUFE6 port map( A => MINS_OUT_4_port, E => ENABLE, 
                           Q => DISPLAY_BUS(4));
   DISPLAY_BUS_tri_3_inst : BUFE6 port map( A => MINS_OUT_3_port, E => ENABLE, 
                           Q => DISPLAY_BUS(3));
   DISPLAY_BUS_tri_0_inst : BUFE6 port map( A => MINS_OUT_0_port, E => ENABLE, 
                           Q => DISPLAY_BUS(0));
   DISPLAY_BUS_tri_1_inst : BUFE6 port map( A => MINS_OUT_1_port, E => ENABLE, 
                           Q => DISPLAY_BUS(1));
   DISPLAY_BUS_tri_8_inst : BUFE6 port map( A => HRS_OUT_2_port, E => ENABLE, Q
                           => DISPLAY_BUS(8));
   DISPLAY_BUS_tri_9_inst : BUFE6 port map( A => HRS_OUT_3_port, E => ENABLE, Q
                           => DISPLAY_BUS(9));
   DISPLAY_BUS_tri_5_inst : BUFE6 port map( A => MINS_OUT_5_port, E => ENABLE, 
                           Q => DISPLAY_BUS(5));

end SYN_NET;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_COMPUTE_BLOCK.all;

entity TIME_BLOCK is

   port( SET_TIME, HRS, MINS, CLK, RESETN, ENABLE : in std_logic;  HRS_OUT : 
         out std_logic_vector (1 to 4);  MINS_OUT : out std_logic_vector (0 to 
         5);  AM_PM_OUT : out std_logic;  DISPLAY_BUS : out std_logic_vector 
         (10 downto 0));

end TIME_BLOCK;

architecture SYN_NET of TIME_BLOCK is

   component BUFE4
      port( A, E : in std_logic;  Q : out std_logic);
   end component;
   
   component BUFE6
      port( A, E : in std_logic;  Q : out std_logic);
   end component;
   
   component TIME_COUNTER
      port( HOURS, MINS, SECS, CLK, RESETN : in std_logic;  HOURS_OUT : out 
            std_logic_vector (0 to 3);  MINUTES_OUT : out std_logic_vector (0 
            to 5);  AM_PM_OUT : out std_logic);
   end component;
   
   component TIME_STATE_MACHINE
      port( TIME_BUTTON, HOURS_BUTTON, MINUTES_BUTTON, CLK, RESETN : in 
            std_logic;  SECS, HOURS, MINS : out std_logic);
   end component;
   
   signal HRS_OUT_3_port, HRS_OUT_2_port, HRS_OUT_1_port, HRS_OUT_0_port, 
      MINS_OUT_5_port, MINS_OUT_4_port, MINS_OUT_3_port, MINS_OUT_2_port, 
      MINS_OUT_1_port, MINS_OUT_0_port, AM_PM_OUT_port, CONNECT5, CONNECT3, 
      CONNECT4 : std_logic;
   
   signal HOURS_OUT_pin : std_logic_vector (0 to 3);
   
   signal MINUTES_OUT_pin : std_logic_vector (0 to 5);

begin
   HRS_OUT <= ( HRS_OUT_3_port, HRS_OUT_2_port, HRS_OUT_1_port, HRS_OUT_0_port 
      );
   MINS_OUT <= ( MINS_OUT_5_port, MINS_OUT_4_port, MINS_OUT_3_port, 
      MINS_OUT_2_port, MINS_OUT_1_port, MINS_OUT_0_port );
   AM_PM_OUT <= AM_PM_OUT_port;
   
   U1 : TIME_STATE_MACHINE port map( TIME_BUTTON => SET_TIME, HOURS_BUTTON => 
                           HRS, MINUTES_BUTTON => MINS, CLK => CLK, RESETN => 
                           RESETN, SECS => CONNECT5, HOURS => CONNECT3, MINS =>
                           CONNECT4);
   ( HRS_OUT_3_port, HRS_OUT_2_port, HRS_OUT_1_port, HRS_OUT_0_port ) <= 
      HOURS_OUT_pin;
   ( MINS_OUT_5_port, MINS_OUT_4_port, MINS_OUT_3_port, MINS_OUT_2_port, 
      MINS_OUT_1_port, MINS_OUT_0_port ) <= MINUTES_OUT_pin;
   U2 : TIME_COUNTER port map( HOURS => CONNECT3, MINS => CONNECT4, SECS => 
      CONNECT5, CLK => CLK, RESETN => RESETN, HOURS_OUT => HOURS_OUT_pin, 
      MINUTES_OUT => MINUTES_OUT_pin, AM_PM_OUT => AM_PM_OUT_port);
   DISPLAY_BUS_tri_3_inst : BUFE6 port map( A => MINS_OUT_3_port, E => ENABLE, 
                           Q => DISPLAY_BUS(3));
   DISPLAY_BUS_tri_8_inst : BUFE6 port map( A => HRS_OUT_2_port, E => ENABLE, Q
                           => DISPLAY_BUS(8));
   DISPLAY_BUS_tri_4_inst : BUFE6 port map( A => MINS_OUT_4_port, E => ENABLE, 
                           Q => DISPLAY_BUS(4));
   DISPLAY_BUS_tri_5_inst : BUFE6 port map( A => MINS_OUT_5_port, E => ENABLE, 
                           Q => DISPLAY_BUS(5));
   DISPLAY_BUS_tri_2_inst : BUFE4 port map( A => MINS_OUT_2_port, E => ENABLE, 
                           Q => DISPLAY_BUS(2));
   DISPLAY_BUS_tri_7_inst : BUFE6 port map( A => HRS_OUT_1_port, E => ENABLE, Q
                           => DISPLAY_BUS(7));
   DISPLAY_BUS_tri_6_inst : BUFE6 port map( A => HRS_OUT_0_port, E => ENABLE, Q
                           => DISPLAY_BUS(6));
   DISPLAY_BUS_tri_1_inst : BUFE6 port map( A => MINS_OUT_1_port, E => ENABLE, 
                           Q => DISPLAY_BUS(1));
   DISPLAY_BUS_tri_0_inst : BUFE6 port map( A => MINS_OUT_0_port, E => ENABLE, 
                           Q => DISPLAY_BUS(0));
   DISPLAY_BUS_tri_10_inst : BUFE4 port map( A => AM_PM_OUT_port, E => ENABLE, 
                           Q => DISPLAY_BUS(10));
   DISPLAY_BUS_tri_9_inst : BUFE4 port map( A => HRS_OUT_3_port, E => ENABLE, Q
                           => DISPLAY_BUS(9));

end SYN_NET;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_COMPUTE_BLOCK.all;

entity CLOCK_GEN is

   port( CLK, RESETN : in std_logic;  INT_CLK : out std_logic);

end CLOCK_GEN;

architecture SYN_RTL of CLOCK_GEN is

   component BUF15
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component DFC3
      port( D, C, RN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   component TFC3
      port( C, RN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal n2, COUNT, n_1036, n_1037 : std_logic;

begin
   
   COUNT_reg : TFC3 port map( C => CLK, RN => RESETN, Q => COUNT, QN => n_1036)
                           ;
   INT_CLK_reg : DFC3 port map( D => COUNT, C => CLK, RN => RESETN, Q => n2, QN
                           => n_1037);
   U3 : BUF15 port map( A => n2, Q => INT_CLK);

end SYN_RTL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_COMPUTE_BLOCK.all;

entity COMPUTE_BLOCK is

   port( SET_TIME, ALARM, HRS, MINS, TOGGLE_SWITCH, CLK, TM_FIX, RESETN : in 
         std_logic;  TIM_DISPLAY, ALM_DISPLAY : out std_logic_vector (10 downto
         0);  SPEAKER_OUT : out std_logic);

end COMPUTE_BLOCK;

architecture SYN_NET of COMPUTE_BLOCK is

   component CLKIN15
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component ALARM_SM_2
      port( COMPARE_IN, TOGGLE_ON, CLOCK, RESETN : in std_logic;  RING : out 
            std_logic);
   end component;
   
   component COMPARATOR
      port( ALARM_HRS, TIME_HRS : in std_logic_vector (1 to 4);  ALARM_MINS, 
            TIME_MINS : in std_logic_vector (0 to 5);  ALARM_AM_PM, TIME_AM_PM 
            : in std_logic;  RINGER : out std_logic);
   end component;
   
   component ALARM_BLOCK
      port( ALARM, HRS, MINS, CLK, RESETN, ENABLE : in std_logic;  HRS_OUT : 
            out std_logic_vector (1 to 4);  MINS_OUT : out std_logic_vector (0 
            to 5);  AM_PM_OUT : out std_logic;  DISPLAY_BUS : out 
            std_logic_vector (10 downto 0));
   end component;
   
   component TIME_BLOCK
      port( SET_TIME, HRS, MINS, CLK, RESETN, ENABLE : in std_logic;  HRS_OUT :
            out std_logic_vector (1 to 4);  MINS_OUT : out std_logic_vector (0 
            to 5);  AM_PM_OUT : out std_logic;  DISPLAY_BUS : out 
            std_logic_vector (10 downto 0));
   end component;
   
   component CLOCK_GEN
      port( CLK, RESETN : in std_logic;  INT_CLK : out std_logic);
   end component;
   
   signal INT_CLK, TIM_HRS_3_port, TIM_HRS_2_port, TIM_HRS_1_port, 
      TIM_HRS_0_port, TIM_MINS_5_port, TIM_MINS_4_port, TIM_MINS_3_port, 
      TIM_MINS_2_port, TIM_MINS_1_port, TIM_MINS_0_port, TIM_AM_PM, 
      ALM_HRS_3_port, ALM_HRS_2_port, ALM_HRS_1_port, ALM_HRS_0_port, 
      ALM_MINS_5_port, ALM_MINS_4_port, ALM_MINS_3_port, ALM_MINS_2_port, 
      ALM_MINS_1_port, ALM_MINS_0_port, ALM_AM_PM, KONNECT12, n3 : std_logic;
   
   signal HRS_OUT_pin, HRS_OUT_pin_port : std_logic_vector (1 to 4);
   
   signal MINS_OUT_pin, MINS_OUT_pin_port : std_logic_vector (0 to 5);

begin
   
   U7 : CLOCK_GEN port map( CLK => CLK, RESETN => RESETN, INT_CLK => INT_CLK);
   ( TIM_HRS_3_port, TIM_HRS_2_port, TIM_HRS_1_port, TIM_HRS_0_port ) <= 
      HRS_OUT_pin;
   ( TIM_MINS_5_port, TIM_MINS_4_port, TIM_MINS_3_port, TIM_MINS_2_port, 
      TIM_MINS_1_port, TIM_MINS_0_port ) <= MINS_OUT_pin;
   U1 : TIME_BLOCK port map( SET_TIME => SET_TIME, HRS => HRS, MINS => MINS, 
      CLK => INT_CLK, RESETN => RESETN, ENABLE => n3, HRS_OUT => HRS_OUT_pin, 
      MINS_OUT => MINS_OUT_pin, AM_PM_OUT => TIM_AM_PM, DISPLAY_BUS(10) => 
      TIM_DISPLAY(10), DISPLAY_BUS(9) => TIM_DISPLAY(9), DISPLAY_BUS(8) => 
      TIM_DISPLAY(8), DISPLAY_BUS(7) => TIM_DISPLAY(7), DISPLAY_BUS(6) => 
      TIM_DISPLAY(6), DISPLAY_BUS(5) => TIM_DISPLAY(5), DISPLAY_BUS(4) => 
      TIM_DISPLAY(4), DISPLAY_BUS(3) => TIM_DISPLAY(3), DISPLAY_BUS(2) => 
      TIM_DISPLAY(2), DISPLAY_BUS(1) => TIM_DISPLAY(1), DISPLAY_BUS(0) => 
      TIM_DISPLAY(0));
   ( ALM_HRS_3_port, ALM_HRS_2_port, ALM_HRS_1_port, ALM_HRS_0_port ) <= 
      HRS_OUT_pin_port;
   ( ALM_MINS_5_port, ALM_MINS_4_port, ALM_MINS_3_port, ALM_MINS_2_port, 
      ALM_MINS_1_port, ALM_MINS_0_port ) <= MINS_OUT_pin_port;
   U2 : ALARM_BLOCK port map( ALARM => ALARM, HRS => HRS, MINS => MINS, CLK => 
      INT_CLK, RESETN => RESETN, ENABLE => ALARM, HRS_OUT => HRS_OUT_pin_port, 
      MINS_OUT => MINS_OUT_pin_port, AM_PM_OUT => ALM_AM_PM, DISPLAY_BUS(10) =>
      ALM_DISPLAY(10), DISPLAY_BUS(9) => ALM_DISPLAY(9), DISPLAY_BUS(8) => 
      ALM_DISPLAY(8), DISPLAY_BUS(7) => ALM_DISPLAY(7), DISPLAY_BUS(6) => 
      ALM_DISPLAY(6), DISPLAY_BUS(5) => ALM_DISPLAY(5), DISPLAY_BUS(4) => 
      ALM_DISPLAY(4), DISPLAY_BUS(3) => ALM_DISPLAY(3), DISPLAY_BUS(2) => 
      ALM_DISPLAY(2), DISPLAY_BUS(1) => ALM_DISPLAY(1), DISPLAY_BUS(0) => 
      ALM_DISPLAY(0));
   U4 : COMPARATOR port map( ALARM_HRS(1) => ALM_HRS_3_port, ALARM_HRS(2) => 
                           ALM_HRS_2_port, ALARM_HRS(3) => ALM_HRS_1_port, 
                           ALARM_HRS(4) => ALM_HRS_0_port, TIME_HRS(1) => 
                           TIM_HRS_3_port, TIME_HRS(2) => TIM_HRS_2_port, 
                           TIME_HRS(3) => TIM_HRS_1_port, TIME_HRS(4) => 
                           TIM_HRS_0_port, ALARM_MINS(0) => ALM_MINS_5_port, 
                           ALARM_MINS(1) => ALM_MINS_4_port, ALARM_MINS(2) => 
                           ALM_MINS_3_port, ALARM_MINS(3) => ALM_MINS_2_port, 
                           ALARM_MINS(4) => ALM_MINS_1_port, ALARM_MINS(5) => 
                           ALM_MINS_0_port, TIME_MINS(0) => TIM_MINS_5_port, 
                           TIME_MINS(1) => TIM_MINS_4_port, TIME_MINS(2) => 
                           TIM_MINS_3_port, TIME_MINS(3) => TIM_MINS_2_port, 
                           TIME_MINS(4) => TIM_MINS_1_port, TIME_MINS(5) => 
                           TIM_MINS_0_port, ALARM_AM_PM => ALM_AM_PM, 
                           TIME_AM_PM => TIM_AM_PM, RINGER => KONNECT12);
   U5 : ALARM_SM_2 port map( COMPARE_IN => KONNECT12, TOGGLE_ON => 
                           TOGGLE_SWITCH, CLOCK => INT_CLK, RESETN => RESETN, 
                           RING => SPEAKER_OUT);
   U8 : CLKIN15 port map( A => ALARM, Q => n3);

end SYN_NET;
