
library IEEE;

use IEEE.std_logic_1164.all;

package CONV_PACK_COMPUTE_BLOCK is

-- define attributes
attribute ENUM_ENCODING : STRING;

end CONV_PACK_COMPUTE_BLOCK;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_COMPUTE_BLOCK.all;

entity TIME_BLOCK_test_1 is

   port( SET_TIME, HRS, MINS, CLK, RESETN, ENABLE : in std_logic;  HRS_OUT : 
         out std_logic_vector (3 downto 0);  MINS_OUT : out std_logic_vector (5
         downto 0);  AM_PM_OUT : out std_logic;  DISPLAY_BUS : out 
         std_logic_vector (10 downto 0);  test_se, test_si1 : in std_logic;  
         test_so1 : out std_logic);

end TIME_BLOCK_test_1;

architecture SYN_NET of TIME_BLOCK_test_1 is

   component INV0
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component CLKIN0
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component NOR20
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component BUFE2
      port( A, E : in std_logic;  Q : out std_logic);
   end component;
   
   component TIME_COUNTER_test_1
      port( HOURS, MINS, SECS, CLK, RESETN : in std_logic;  HOURS_OUT : out 
            std_logic_vector (3 downto 0);  MINUTES_OUT : out std_logic_vector 
            (5 downto 0);  AM_PM_OUT, test_so : out std_logic;  test_se, 
            test_si1 : in std_logic;  test_so1 : out std_logic);
   end component;
   
   component TIME_STATE_MACHINE_test_1
      port( TIME_BUTTON, HOURS_BUTTON, MINUTES_BUTTON, CLK, RESETN : in 
            std_logic;  SECS, HOURS, MINS : out std_logic;  test_se, test_si1 :
            in std_logic;  test_so1 : out std_logic);
   end component;
   
   signal HRS_OUT_3_port, HRS_OUT_2_port, HRS_OUT_1_port, HRS_OUT_0_port, 
      MINS_OUT_5_port, MINS_OUT_4_port, MINS_OUT_3_port, MINS_OUT_2_port, 
      MINS_OUT_1_port, MINS_OUT_0_port, AM_PM_OUT_port, CONNECT5, CONNECT3, 
      CONNECT4, n1, test_so, n6, n7, n8, n9, n3 : std_logic;

begin
   HRS_OUT <= ( HRS_OUT_3_port, HRS_OUT_2_port, HRS_OUT_1_port, HRS_OUT_0_port 
      );
   MINS_OUT <= ( MINS_OUT_5_port, MINS_OUT_4_port, MINS_OUT_3_port, 
      MINS_OUT_2_port, MINS_OUT_1_port, MINS_OUT_0_port );
   AM_PM_OUT <= AM_PM_OUT_port;
   
   U1 : TIME_STATE_MACHINE_test_1 port map( TIME_BUTTON => SET_TIME, 
                           HOURS_BUTTON => HRS, MINUTES_BUTTON => MINS, CLK => 
                           CLK, RESETN => RESETN, SECS => CONNECT5, HOURS => 
                           CONNECT3, MINS => CONNECT4, test_se => test_se, 
                           test_si1 => test_si1, test_so1 => n3);
   U2 : TIME_COUNTER_test_1 port map( HOURS => CONNECT3, MINS => CONNECT4, SECS
                           => CONNECT5, CLK => CLK, RESETN => RESETN, 
                           HOURS_OUT(3) => HRS_OUT_3_port, HOURS_OUT(2) => 
                           HRS_OUT_2_port, HOURS_OUT(1) => HRS_OUT_1_port, 
                           HOURS_OUT(0) => HRS_OUT_0_port, MINUTES_OUT(5) => 
                           MINS_OUT_5_port, MINUTES_OUT(4) => MINS_OUT_4_port, 
                           MINUTES_OUT(3) => MINS_OUT_3_port, MINUTES_OUT(2) =>
                           MINS_OUT_2_port, MINUTES_OUT(1) => MINS_OUT_1_port, 
                           MINUTES_OUT(0) => MINS_OUT_0_port, AM_PM_OUT => 
                           AM_PM_OUT_port, test_so => test_so, test_se => 
                           test_se, test_si1 => n3, test_so1 => test_so1);
   DISPLAY_BUS_tri_1_inst : BUFE2 port map( A => MINS_OUT_1_port, E => n8, Q =>
                           DISPLAY_BUS(1));
   DISPLAY_BUS_tri_5_inst : BUFE2 port map( A => MINS_OUT_5_port, E => n8, Q =>
                           DISPLAY_BUS(5));
   DISPLAY_BUS_tri_3_inst : BUFE2 port map( A => MINS_OUT_3_port, E => n9, Q =>
                           DISPLAY_BUS(3));
   DISPLAY_BUS_tri_6_inst : BUFE2 port map( A => HRS_OUT_0_port, E => n9, Q => 
                           DISPLAY_BUS(6));
   DISPLAY_BUS_tri_10_inst : BUFE2 port map( A => AM_PM_OUT_port, E => n9, Q =>
                           DISPLAY_BUS(10));
   DISPLAY_BUS_tri_7_inst : BUFE2 port map( A => HRS_OUT_1_port, E => n9, Q => 
                           DISPLAY_BUS(7));
   DISPLAY_BUS_tri_2_inst : BUFE2 port map( A => MINS_OUT_2_port, E => n9, Q =>
                           DISPLAY_BUS(2));
   DISPLAY_BUS_tri_4_inst : BUFE2 port map( A => MINS_OUT_4_port, E => n8, Q =>
                           DISPLAY_BUS(4));
   DISPLAY_BUS_tri_0_inst : BUFE2 port map( A => MINS_OUT_0_port, E => n8, Q =>
                           DISPLAY_BUS(0));
   DISPLAY_BUS_tri_8_inst : BUFE2 port map( A => HRS_OUT_2_port, E => n8, Q => 
                           DISPLAY_BUS(8));
   DISPLAY_BUS_tri_9_inst : BUFE2 port map( A => HRS_OUT_3_port, E => n8, Q => 
                           DISPLAY_BUS(9));
   U3 : NOR20 port map( A => test_se, B => n1, Q => n6);
   U4 : CLKIN0 port map( A => ENABLE, Q => n1);
   U5 : INV0 port map( A => n6, Q => n7);
   U6 : INV0 port map( A => n7, Q => n8);
   U7 : INV0 port map( A => n7, Q => n9);

end SYN_NET;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_COMPUTE_BLOCK.all;

entity TIME_STATE_MACHINE_test_1 is

   port( TIME_BUTTON, HOURS_BUTTON, MINUTES_BUTTON, CLK, RESETN : in std_logic;
         SECS, HOURS, MINS : out std_logic;  test_se, test_si1 : in std_logic; 
         test_so1 : out std_logic);

end TIME_STATE_MACHINE_test_1;

architecture SYN_RTL of TIME_STATE_MACHINE_test_1 is

   component INV3
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND31
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   component NOR21
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND22
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component NOR31
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   component OAI311
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component NOR40
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component DFSC1
      port( D, SD, SE, C, RN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal NEXT_STATE_1_port, NEXT_STATE_0_port, CURRENT_STATE_1_port, 
      CURRENT_STATE_0_port, NEXT_SECS, NEXT_HOURS, n7, n11, n12, n13, n14, n2, 
      n3, n4, n5, n1, n6, n8 : std_logic;

begin
   
   CURRENT_STATE_reg_1_inst : DFSC1 port map( D => NEXT_STATE_1_port, SD => n8,
                           SE => test_se, C => CLK, RN => RESETN, Q => 
                           CURRENT_STATE_1_port, QN => n7);
   CURRENT_STATE_reg_0_inst : DFSC1 port map( D => NEXT_STATE_0_port, SD => 
                           test_si1, SE => test_se, C => CLK, RN => RESETN, Q 
                           => CURRENT_STATE_0_port, QN => n8);
   MINS_reg : DFSC1 port map( D => n2, SD => n6, SE => test_se, C => CLK, RN =>
                           RESETN, Q => MINS, QN => n1);
   SECS_reg : DFSC1 port map( D => NEXT_SECS, SD => n1, SE => test_se, C => CLK
                           , RN => RESETN, Q => SECS, QN => test_so1);
   HOURS_reg : DFSC1 port map( D => NEXT_HOURS, SD => n7, SE => test_se, C => 
                           CLK, RN => RESETN, Q => HOURS, QN => n6);
   U3 : NOR40 port map( A => n4, B => n5, C => CURRENT_STATE_0_port, D => 
                           HOURS_BUTTON, Q => NEXT_STATE_1_port);
   U4 : NOR21 port map( A => n13, B => CURRENT_STATE_1_port, Q => 
                           NEXT_STATE_0_port);
   U5 : OAI311 port map( A => n11, B => CURRENT_STATE_0_port, C => 
                           NEXT_STATE_0_port, D => n12, Q => NEXT_SECS);
   U6 : NOR31 port map( A => n4, B => HOURS_BUTTON, C => n5, Q => n11);
   U7 : NAND31 port map( A => n13, B => n7, C => CURRENT_STATE_0_port, Q => n12
                           );
   U8 : INV3 port map( A => n14, Q => n2);
   U9 : NAND22 port map( A => n7, B => NEXT_STATE_1_port, Q => n14);
   U10 : NOR21 port map( A => CURRENT_STATE_0_port, B => n3, Q => NEXT_HOURS);
   U11 : INV3 port map( A => NEXT_STATE_0_port, Q => n3);
   U12 : NAND31 port map( A => HOURS_BUTTON, B => n5, C => TIME_BUTTON, Q => 
                           n13);
   U13 : INV3 port map( A => MINUTES_BUTTON, Q => n5);
   U14 : INV3 port map( A => TIME_BUTTON, Q => n4);

end SYN_RTL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_COMPUTE_BLOCK.all;

entity ALARM_SM_2_test_1 is

   port( COMPARE_IN, TOGGLE_ON, CLOCK, RESETN : in std_logic;  RING : out 
         std_logic;  test_se, test_si1 : in std_logic);

end ALARM_SM_2_test_1;

architecture SYN_RTL of ALARM_SM_2_test_1 is

   component INV3
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component DFSC1
      port( D, SD, SE, C, RN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   component OAI212
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   signal RING_port, n3, n2, n_1000 : std_logic;

begin
   RING <= RING_port;
   
   U4 : OAI212 port map( A => COMPARE_IN, B => RING_port, C => TOGGLE_ON, Q => 
                           n3);
   CURRENT_STATE_reg : DFSC1 port map( D => n2, SD => test_si1, SE => test_se, 
                           C => CLOCK, RN => RESETN, Q => RING_port, QN => 
                           n_1000);
   U3 : INV3 port map( A => n3, Q => n2);

end SYN_RTL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_COMPUTE_BLOCK.all;

entity ALARM_COUNTER_test_1 is

   port( HOURS, MINS, CLK, RESETN : in std_logic;  HRS_OUT : out 
         std_logic_vector (3 downto 0);  MINUTES_OUT : out std_logic_vector (5 
         downto 0);  AM_PM_OUT : out std_logic;  test_se, test_si1 : in 
         std_logic;  test_so1 : out std_logic);

end ALARM_COUNTER_test_1;

architecture SYN_RTL of ALARM_COUNTER_test_1 is

   component XOR20
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND20
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component INV3
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND22
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component XNR21
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component AOI221
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component NOR40
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND31
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND41
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component NOR21
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component DFSEC1
      port( D, SD, E, SE, C, RN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   component DFSC1
      port( D, SD, SE, C, RN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   component DFSP1
      port( D, SD, SE, C, SN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   component ADD22
      port( A, B : in std_logic;  CO, S : out std_logic);
   end component;
   
   component TFSEC3
      port( T, SD, SE, C, RN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   component OAI222
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component OAI212
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   signal HRS_OUT_3_port, HRS_OUT_2_port, HRS_OUT_1_port, HRS_OUT_0_port, 
      MINUTES_OUT_5_port, MINUTES_OUT_4_port, MINUTES_OUT_3_port, 
      MINUTES_OUT_2_port, MINUTES_OUT_1_port, MINUTES_OUT_0_port, N15, N16, N17
      , N20, N21, N22, N23, N24, N37, N38, N39, n16_port, n17_port, n18, n19, 
      n28, n31, n32, n33, n34, n35, n36, n37_port, n38_port, n39_port, n40, n41
      , n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, N79, N77, N76, 
      N74, U6_carry_2_port, U6_carry_3_port, U6_carry_4_port, U6_carry_5_port, 
      n1, n2, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15_port, 
      n20_port, n21_port, n22_port, n23_port, n24_port, n25, n26, n27, n3, n29,
      n30, n53 : std_logic;

begin
   HRS_OUT <= ( HRS_OUT_3_port, HRS_OUT_2_port, HRS_OUT_1_port, HRS_OUT_0_port 
      );
   MINUTES_OUT <= ( MINUTES_OUT_5_port, MINUTES_OUT_4_port, MINUTES_OUT_3_port,
      MINUTES_OUT_2_port, MINUTES_OUT_1_port, MINUTES_OUT_0_port );
   
   U17 : OAI212 port map( A => n32, B => n19, C => n34, Q => n49);
   U19 : OAI212 port map( A => n32, B => n18, C => n37_port, Q => n50);
   U21 : OAI212 port map( A => n17_port, B => n32, C => n38_port, Q => n51);
   U23 : OAI212 port map( A => n16_port, B => n32, C => n39_port, Q => n52);
   U27 : OAI222 port map( A => n40, B => n41, C => MINS, D => n23_port, Q => 
                           n32);
   AM_PM_OUT_reg : TFSEC3 port map( T => n15_port, SD => test_si1, SE => 
                           test_se, C => CLK, RN => RESETN, Q => AM_PM_OUT, QN 
                           => n53);
   U6_U1_1_1 : ADD22 port map( A => MINUTES_OUT_1_port, B => MINUTES_OUT_0_port
                           , CO => U6_carry_2_port, S => N20);
   U6_U1_1_2 : ADD22 port map( A => MINUTES_OUT_2_port, B => U6_carry_2_port, 
                           CO => U6_carry_3_port, S => N21);
   U6_U1_1_3 : ADD22 port map( A => MINUTES_OUT_3_port, B => U6_carry_3_port, 
                           CO => U6_carry_4_port, S => N22);
   U6_U1_1_4 : ADD22 port map( A => MINUTES_OUT_4_port, B => U6_carry_4_port, 
                           CO => U6_carry_5_port, S => N23);
   MINUTES_OUT_reg_2_inst : DFSEC1 port map( D => n12, SD => n30, E => n22_port
                           , SE => test_se, C => CLK, RN => RESETN, Q => 
                           MINUTES_OUT_2_port, QN => n28);
   MINUTES_OUT_reg_3_inst : DFSEC1 port map( D => n11, SD => MINUTES_OUT_2_port
                           , E => n22_port, SE => test_se, C => CLK, RN => 
                           RESETN, Q => MINUTES_OUT_3_port, QN => n29);
   MINUTES_OUT_reg_4_inst : DFSEC1 port map( D => n10, SD => n29, E => n22_port
                           , SE => test_se, C => CLK, RN => RESETN, Q => 
                           MINUTES_OUT_4_port, QN => n3);
   HRS_OUT_reg_3_inst : DFSP1 port map( D => n52, SD => HRS_OUT_2_port, SE => 
                           test_se, C => CLK, SN => RESETN, Q => HRS_OUT_3_port
                           , QN => n16_port);
   HRS_OUT_reg_2_inst : DFSP1 port map( D => n51, SD => n18, SE => test_se, C 
                           => CLK, SN => RESETN, Q => HRS_OUT_2_port, QN => 
                           n17_port);
   MINUTES_OUT_reg_5_inst : DFSEC1 port map( D => n9, SD => n3, E => n22_port, 
                           SE => test_se, C => CLK, RN => RESETN, Q => 
                           MINUTES_OUT_5_port, QN => test_so1);
   MINUTES_OUT_reg_1_inst : DFSEC1 port map( D => n13, SD => n1, E => n22_port,
                           SE => test_se, C => CLK, RN => RESETN, Q => 
                           MINUTES_OUT_1_port, QN => n30);
   HRS_OUT_reg_0_inst : DFSC1 port map( D => n49, SD => n53, SE => test_se, C 
                           => CLK, RN => RESETN, Q => HRS_OUT_0_port, QN => n19
                           );
   HRS_OUT_reg_1_inst : DFSC1 port map( D => n50, SD => n19, SE => test_se, C 
                           => CLK, RN => RESETN, Q => HRS_OUT_1_port, QN => n18
                           );
   MINUTES_OUT_reg_0_inst : DFSEC1 port map( D => n8, SD => HRS_OUT_3_port, E 
                           => n22_port, SE => test_se, C => CLK, RN => RESETN, 
                           Q => MINUTES_OUT_0_port, QN => n1);
   U3 : NOR21 port map( A => n14, B => n22_port, Q => n36);
   U4 : NOR21 port map( A => n40, B => n14, Q => n35);
   U5 : NAND22 port map( A => N79, B => N74, Q => n27);
   U6 : NAND22 port map( A => N79, B => N74, Q => n25);
   U7 : INV3 port map( A => n32, Q => n14);
   U8 : INV3 port map( A => n33, Q => n6);
   U9 : NAND22 port map( A => N76, B => n21_port, Q => n26);
   U10 : NAND22 port map( A => N76, B => n21_port, Q => n24_port);
   U11 : INV3 port map( A => n25, Q => n21_port);
   U12 : INV3 port map( A => n43, Q => n10);
   U13 : NAND22 port map( A => n41, B => N23, Q => n43);
   U14 : INV3 port map( A => n45, Q => n12);
   U15 : NAND22 port map( A => n41, B => N21, Q => n45);
   U16 : INV3 port map( A => n46, Q => n13);
   U18 : NAND22 port map( A => n41, B => N20, Q => n46);
   U20 : INV3 port map( A => n44, Q => n11);
   U22 : NAND22 port map( A => n41, B => N22, Q => n44);
   U24 : INV3 port map( A => n31, Q => n15_port);
   U25 : NAND22 port map( A => n32, B => n33, Q => n31);
   U26 : INV3 port map( A => n40, Q => n22_port);
   U28 : NAND41 port map( A => MINUTES_OUT_4_port, B => MINUTES_OUT_3_port, C 
                           => MINUTES_OUT_5_port, D => n20_port, Q => n41);
   U29 : INV3 port map( A => n48, Q => n20_port);
   U30 : NAND31 port map( A => MINUTES_OUT_1_port, B => n28, C => 
                           MINUTES_OUT_0_port, Q => n48);
   U31 : NOR40 port map( A => n16_port, B => n17_port, C => HRS_OUT_0_port, D 
                           => HRS_OUT_1_port, Q => n33);
   U32 : AOI221 port map( A => N15, B => n35, C => N37, D => n36, Q => n37_port
                           );
   U33 : XNR21 port map( A => n5, B => N79, Q => N37);
   U34 : XNR21 port map( A => n5, B => N79, Q => N15);
   U35 : AOI221 port map( A => n5, B => n35, C => n5, D => n36, Q => n34);
   U36 : AOI221 port map( A => N17, B => n35, C => N39, D => n36, Q => n39_port
                           );
   U37 : XNR21 port map( A => n24_port, B => N77, Q => N39);
   U38 : XNR21 port map( A => n26, B => N77, Q => N17);
   U39 : AOI221 port map( A => N16, B => n35, C => N38, D => n36, Q => n38_port
                           );
   U40 : XNR21 port map( A => n25, B => N76, Q => N38);
   U41 : XNR21 port map( A => n27, B => N76, Q => N16);
   U42 : INV3 port map( A => n5, Q => N74);
   U43 : INV3 port map( A => n7, Q => N79);
   U44 : INV3 port map( A => n42, Q => n9);
   U45 : NAND22 port map( A => n41, B => N24, Q => n42);
   U46 : INV3 port map( A => n2, Q => N77);
   U47 : NAND22 port map( A => MINS, B => n23_port, Q => n40);
   U48 : INV3 port map( A => n4, Q => N76);
   U49 : INV3 port map( A => n47, Q => n8);
   U50 : NAND22 port map( A => n41, B => n1, Q => n47);
   U51 : INV3 port map( A => HOURS, Q => n23_port);
   U53 : NAND20 port map( A => HRS_OUT_0_port, B => n6, Q => n5);
   U54 : NAND20 port map( A => HRS_OUT_2_port, B => n6, Q => n4);
   U55 : NAND20 port map( A => n6, B => HRS_OUT_3_port, Q => n2);
   U56 : NAND20 port map( A => HRS_OUT_1_port, B => n6, Q => n7);
   U57 : XOR20 port map( A => U6_carry_5_port, B => MINUTES_OUT_5_port, Q => 
                           N24);

end SYN_RTL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_COMPUTE_BLOCK.all;

entity ALARM_STATE_MACHINE_test_1 is

   port( ALARM_BUTTON, HOURS_BUTTON, MINUTES_BUTTON, CLK, RESETN : in std_logic
         ;  HOURS, MINS : out std_logic;  test_se, test_si1 : in std_logic;  
         test_so1 : out std_logic);

end ALARM_STATE_MACHINE_test_1;

architecture SYN_RTL of ALARM_STATE_MACHINE_test_1 is

   component INV3
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component NOR21
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component NOR40
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component DFSC1
      port( D, SD, SE, C, RN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal NEXT_STATE_1_port, NEXT_STATE_0_port, CURRENT_STATE_1_port, 
      CURRENT_STATE_0_port, NEXT_HOURS, NEXT_MINS, n2, n3, n4, n5, n6, n1, n7, 
      n8 : std_logic;

begin
   
   CURRENT_STATE_reg_0_inst : DFSC1 port map( D => NEXT_STATE_0_port, SD => 
                           test_si1, SE => test_se, C => CLK, RN => RESETN, Q 
                           => CURRENT_STATE_0_port, QN => n8);
   CURRENT_STATE_reg_1_inst : DFSC1 port map( D => NEXT_STATE_1_port, SD => n8,
                           SE => test_se, C => CLK, RN => RESETN, Q => 
                           CURRENT_STATE_1_port, QN => n7);
   HOURS_reg : DFSC1 port map( D => NEXT_HOURS, SD => n7, SE => test_se, C => 
                           CLK, RN => RESETN, Q => HOURS, QN => n1);
   MINS_reg : DFSC1 port map( D => NEXT_MINS, SD => n1, SE => test_se, C => CLK
                           , RN => RESETN, Q => MINS, QN => test_so1);
   U3 : NOR40 port map( A => n4, B => n6, C => CURRENT_STATE_0_port, D => 
                           HOURS_BUTTON, Q => NEXT_STATE_1_port);
   U4 : INV3 port map( A => MINUTES_BUTTON, Q => n6);
   U5 : NOR40 port map( A => n5, B => n4, C => CURRENT_STATE_1_port, D => 
                           MINUTES_BUTTON, Q => NEXT_STATE_0_port);
   U6 : INV3 port map( A => HOURS_BUTTON, Q => n5);
   U7 : NOR21 port map( A => CURRENT_STATE_0_port, B => n3, Q => NEXT_HOURS);
   U8 : INV3 port map( A => NEXT_STATE_0_port, Q => n3);
   U9 : NOR21 port map( A => CURRENT_STATE_1_port, B => n2, Q => NEXT_MINS);
   U10 : INV3 port map( A => NEXT_STATE_1_port, Q => n2);
   U11 : INV3 port map( A => ALARM_BUTTON, Q => n4);

end SYN_RTL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_COMPUTE_BLOCK.all;

entity ALARM_BLOCK_test_1 is

   port( ALARM, HRS, MINS, CLK, RESETN, ENABLE : in std_logic;  HRS_OUT : out 
         std_logic_vector (3 downto 0);  MINS_OUT : out std_logic_vector (5 
         downto 0);  AM_PM_OUT : out std_logic;  DISPLAY_BUS : out 
         std_logic_vector (10 downto 0);  test_se, test_si1 : in std_logic;  
         test_so1 : out std_logic);

end ALARM_BLOCK_test_1;

architecture SYN_NET of ALARM_BLOCK_test_1 is

   component INV0
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component CLKIN0
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component NOR20
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component BUFE2
      port( A, E : in std_logic;  Q : out std_logic);
   end component;
   
   component ALARM_COUNTER_test_1
      port( HOURS, MINS, CLK, RESETN : in std_logic;  HRS_OUT : out 
            std_logic_vector (3 downto 0);  MINUTES_OUT : out std_logic_vector 
            (5 downto 0);  AM_PM_OUT : out std_logic;  test_se, test_si1 : in 
            std_logic;  test_so1 : out std_logic);
   end component;
   
   component ALARM_STATE_MACHINE_test_1
      port( ALARM_BUTTON, HOURS_BUTTON, MINUTES_BUTTON, CLK, RESETN : in 
            std_logic;  HOURS, MINS : out std_logic;  test_se, test_si1 : in 
            std_logic;  test_so1 : out std_logic);
   end component;
   
   signal HRS_OUT_3_port, HRS_OUT_2_port, HRS_OUT_1_port, HRS_OUT_0_port, 
      MINS_OUT_5_port, MINS_OUT_4_port, MINS_OUT_3_port, MINS_OUT_2_port, 
      MINS_OUT_1_port, MINS_OUT_0_port, AM_PM_OUT_port, CONNECT1, CONNECT2, n1,
      n6, n7, n8, n9, n3 : std_logic;

begin
   HRS_OUT <= ( HRS_OUT_3_port, HRS_OUT_2_port, HRS_OUT_1_port, HRS_OUT_0_port 
      );
   MINS_OUT <= ( MINS_OUT_5_port, MINS_OUT_4_port, MINS_OUT_3_port, 
      MINS_OUT_2_port, MINS_OUT_1_port, MINS_OUT_0_port );
   AM_PM_OUT <= AM_PM_OUT_port;
   
   U0 : ALARM_STATE_MACHINE_test_1 port map( ALARM_BUTTON => ALARM, 
                           HOURS_BUTTON => HRS, MINUTES_BUTTON => MINS, CLK => 
                           CLK, RESETN => RESETN, HOURS => CONNECT1, MINS => 
                           CONNECT2, test_se => test_se, test_si1 => test_si1, 
                           test_so1 => n3);
   U3 : ALARM_COUNTER_test_1 port map( HOURS => CONNECT1, MINS => CONNECT2, CLK
                           => CLK, RESETN => RESETN, HRS_OUT(3) => 
                           HRS_OUT_3_port, HRS_OUT(2) => HRS_OUT_2_port, 
                           HRS_OUT(1) => HRS_OUT_1_port, HRS_OUT(0) => 
                           HRS_OUT_0_port, MINUTES_OUT(5) => MINS_OUT_5_port, 
                           MINUTES_OUT(4) => MINS_OUT_4_port, MINUTES_OUT(3) =>
                           MINS_OUT_3_port, MINUTES_OUT(2) => MINS_OUT_2_port, 
                           MINUTES_OUT(1) => MINS_OUT_1_port, MINUTES_OUT(0) =>
                           MINS_OUT_0_port, AM_PM_OUT => AM_PM_OUT_port, 
                           test_se => test_se, test_si1 => n3, test_so1 => 
                           test_so1);
   DISPLAY_BUS_tri_10_inst : BUFE2 port map( A => AM_PM_OUT_port, E => n9, Q =>
                           DISPLAY_BUS(10));
   DISPLAY_BUS_tri_2_inst : BUFE2 port map( A => MINS_OUT_2_port, E => n9, Q =>
                           DISPLAY_BUS(2));
   DISPLAY_BUS_tri_9_inst : BUFE2 port map( A => HRS_OUT_3_port, E => n8, Q => 
                           DISPLAY_BUS(9));
   DISPLAY_BUS_tri_8_inst : BUFE2 port map( A => HRS_OUT_2_port, E => n8, Q => 
                           DISPLAY_BUS(8));
   DISPLAY_BUS_tri_5_inst : BUFE2 port map( A => MINS_OUT_5_port, E => n8, Q =>
                           DISPLAY_BUS(5));
   DISPLAY_BUS_tri_4_inst : BUFE2 port map( A => MINS_OUT_4_port, E => n8, Q =>
                           DISPLAY_BUS(4));
   DISPLAY_BUS_tri_3_inst : BUFE2 port map( A => MINS_OUT_3_port, E => n9, Q =>
                           DISPLAY_BUS(3));
   DISPLAY_BUS_tri_1_inst : BUFE2 port map( A => MINS_OUT_1_port, E => n8, Q =>
                           DISPLAY_BUS(1));
   DISPLAY_BUS_tri_7_inst : BUFE2 port map( A => HRS_OUT_1_port, E => n9, Q => 
                           DISPLAY_BUS(7));
   DISPLAY_BUS_tri_6_inst : BUFE2 port map( A => HRS_OUT_0_port, E => n9, Q => 
                           DISPLAY_BUS(6));
   DISPLAY_BUS_tri_0_inst : BUFE2 port map( A => MINS_OUT_0_port, E => n8, Q =>
                           DISPLAY_BUS(0));
   U1 : NOR20 port map( A => test_se, B => n1, Q => n6);
   U2 : CLKIN0 port map( A => ENABLE, Q => n1);
   U4 : INV0 port map( A => n6, Q => n7);
   U5 : INV0 port map( A => n7, Q => n8);
   U6 : INV0 port map( A => n7, Q => n9);

end SYN_NET;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_COMPUTE_BLOCK.all;

entity TIME_COUNTER_test_1 is

   port( HOURS, MINS, SECS, CLK, RESETN : in std_logic;  HOURS_OUT : out 
         std_logic_vector (3 downto 0);  MINUTES_OUT : out std_logic_vector (5 
         downto 0);  AM_PM_OUT, test_so : out std_logic;  test_se, test_si1 : 
         in std_logic;  test_so1 : out std_logic);

end TIME_COUNTER_test_1;

architecture SYN_RTL_architecture of TIME_COUNTER_test_1 is

   component XOR20
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND20
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component NOR21
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND22
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND31
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   component NOR31
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND41
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component INV3
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component XNR21
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component AOI211
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   component AOI221
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component XOR21
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component DFSP1
      port( D, SD, SE, C, SN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   component DFSC1
      port( D, SD, SE, C, RN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   component DFSEC1
      port( D, SD, E, SE, C, RN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   component ADD22
      port( A, B : in std_logic;  CO, S : out std_logic);
   end component;
   
   component OAI212
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   signal HOURS_OUT_3_port, HOURS_OUT_2_port, HOURS_OUT_1_port, 
      HOURS_OUT_0_port, MINUTES_OUT_5_port, MINUTES_OUT_4_port, 
      MINUTES_OUT_3_port, MINUTES_OUT_2_port, MINUTES_OUT_1_port, 
      MINUTES_OUT_0_port, AM_PM_OUT_port, CURRENT_SECS_5_port, 
      CURRENT_SECS_4_port, CURRENT_SECS_3_port, CURRENT_SECS_2_port, 
      CURRENT_SECS_1_port, CURRENT_SECS_0_port, N23, N24, N25, N28, N29, N30, 
      N31, N32, N45, N46, N47, N48, N49, N63, N64, N65, N90, N91, N92, N137, 
      n22, n26, n27, n28_port, n29_port, n30_port, n31_port, n32_port, n33, n34
      , test_so_port, n37, n38, n39, n40, n41, n45_port, n47_port, n48_port, 
      n49_port, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62
      , n63_port, n64_port, n65_port, n66, n67, n68, n69, n70, n71, n72, n73, 
      n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88
      , n89, n90_port, n91_port, n92_port, n93, n94, n95, n96, n97, n98, n99, 
      n100, n101, n102, n103, N179, N173, N172, N170, U10_carry_2_port, 
      U10_carry_3_port, U10_carry_4_port, U10_carry_5_port, r84_carry_2_port, 
      r84_carry_3_port, r84_carry_4_port, r84_carry_5_port, n1, n2, n3, n4, n6,
      n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, 
      n5 : std_logic;

begin
   
   U24 : OAI212 port map( A => n49_port, B => n31_port, C => n50, Q => n88);
   U28 : OAI212 port map( A => n49_port, B => n32_port, C => n57, Q => n89);
   U32 : OAI212 port map( A => n49_port, B => n33, C => n60, Q => n90_port);
   U36 : OAI212 port map( A => n49_port, B => n34, C => n63_port, Q => n91_port
                           );
   U46 : OAI212 port map( A => n69, B => test_so_port, C => n70, Q => n92_port)
                           ;
   U48 : OAI212 port map( A => n69, B => n37, C => n72, Q => n93);
   U50 : OAI212 port map( A => n69, B => n38, C => n73, Q => n94);
   U52 : OAI212 port map( A => n69, B => n39, C => n74, Q => n95);
   U54 : OAI212 port map( A => n69, B => n40, C => n75, Q => n96);
   U56 : OAI212 port map( A => n69, B => n41, C => n76, Q => n97);
   U61 : OAI212 port map( A => n78, B => n66, C => n56, Q => n69);
   U62 : OAI212 port map( A => n22, B => n79, C => n80, Q => n98);
   U64 : OAI212 port map( A => n26, B => n79, C => n82, Q => n99);
   U66 : OAI212 port map( A => n27, B => n79, C => n83, Q => n100);
   U68 : OAI212 port map( A => n79, B => n28_port, C => n84, Q => n101);
   U70 : OAI212 port map( A => n29_port, B => n79, C => n85, Q => n102);
   U72 : OAI212 port map( A => n30_port, B => n79, C => n86, Q => n103);
   U10_U1_1_1 : ADD22 port map( A => CURRENT_SECS_1_port, B => 
                           CURRENT_SECS_0_port, CO => U10_carry_2_port, S => 
                           N45);
   U10_U1_1_2 : ADD22 port map( A => CURRENT_SECS_2_port, B => U10_carry_2_port
                           , CO => U10_carry_3_port, S => N46);
   U10_U1_1_3 : ADD22 port map( A => CURRENT_SECS_3_port, B => U10_carry_3_port
                           , CO => U10_carry_4_port, S => N47);
   U10_U1_1_4 : ADD22 port map( A => CURRENT_SECS_4_port, B => U10_carry_4_port
                           , CO => U10_carry_5_port, S => N48);
   r84_U1_1_1 : ADD22 port map( A => MINUTES_OUT_1_port, B => 
                           MINUTES_OUT_0_port, CO => r84_carry_2_port, S => N28
                           );
   r84_U1_1_2 : ADD22 port map( A => MINUTES_OUT_2_port, B => r84_carry_2_port,
                           CO => r84_carry_3_port, S => N29);
   r84_U1_1_3 : ADD22 port map( A => MINUTES_OUT_3_port, B => r84_carry_3_port,
                           CO => r84_carry_4_port, S => N30);
   r84_U1_1_4 : ADD22 port map( A => MINUTES_OUT_4_port, B => r84_carry_4_port,
                           CO => r84_carry_5_port, S => N31);
   AM_PM_OUT_reg : DFSEC1 port map( D => n1, SD => test_si1, E => n45_port, SE 
                           => test_se, C => CLK, RN => RESETN, Q => 
                           AM_PM_OUT_port, QN => n5);
   CURRENT_SECS_reg_5_inst : DFSC1 port map( D => n98, SD => n26, SE => test_se
                           , C => CLK, RN => RESETN, Q => CURRENT_SECS_5_port, 
                           QN => n22);
   CURRENT_SECS_reg_3_inst : DFSC1 port map( D => n100, SD => n28_port, SE => 
                           test_se, C => CLK, RN => RESETN, Q => 
                           CURRENT_SECS_3_port, QN => n27);
   CURRENT_SECS_reg_2_inst : DFSC1 port map( D => n101, SD => 
                           CURRENT_SECS_1_port, SE => test_se, C => CLK, RN => 
                           RESETN, Q => CURRENT_SECS_2_port, QN => n28_port);
   CURRENT_SECS_reg_4_inst : DFSC1 port map( D => n99, SD => n27, SE => test_se
                           , C => CLK, RN => RESETN, Q => CURRENT_SECS_4_port, 
                           QN => n26);
   MINUTES_OUT_reg_3_inst : DFSC1 port map( D => n94, SD => n39, SE => test_se,
                           C => CLK, RN => RESETN, Q => MINUTES_OUT_3_port, QN 
                           => n38);
   MINUTES_OUT_reg_2_inst : DFSC1 port map( D => n95, SD => MINUTES_OUT_1_port,
                           SE => test_se, C => CLK, RN => RESETN, Q => 
                           MINUTES_OUT_2_port, QN => n39);
   MINUTES_OUT_reg_4_inst : DFSC1 port map( D => n93, SD => n38, SE => test_se,
                           C => CLK, RN => RESETN, Q => MINUTES_OUT_4_port, QN 
                           => n37);
   CURRENT_SECS_reg_1_inst : DFSC1 port map( D => n102, SD => 
                           CURRENT_SECS_0_port, SE => test_se, C => CLK, RN => 
                           RESETN, Q => CURRENT_SECS_1_port, QN => n29_port);
   HOURS_OUT_reg_1_inst : DFSC1 port map( D => n90_port, SD => HOURS_OUT_0_port
                           , SE => test_se, C => CLK, RN => RESETN, Q => 
                           HOURS_OUT_1_port, QN => n33);
   HOURS_OUT_reg_0_inst : DFSC1 port map( D => n91_port, SD => n22, SE => 
                           test_se, C => CLK, RN => RESETN, Q => 
                           HOURS_OUT_0_port, QN => n34);
   CURRENT_SECS_reg_0_inst : DFSC1 port map( D => n103, SD => n5, SE => test_se
                           , C => CLK, RN => RESETN, Q => CURRENT_SECS_0_port, 
                           QN => n30_port);
   MINUTES_OUT_reg_1_inst : DFSC1 port map( D => n96, SD => n41, SE => test_se,
                           C => CLK, RN => RESETN, Q => MINUTES_OUT_1_port, QN 
                           => n40);
   MINUTES_OUT_reg_5_inst : DFSC1 port map( D => n92_port, SD => n37, SE => 
                           test_se, C => CLK, RN => RESETN, Q => 
                           MINUTES_OUT_5_port, QN => test_so_port);
   MINUTES_OUT_reg_0_inst : DFSC1 port map( D => n97, SD => n31_port, SE => 
                           test_se, C => CLK, RN => RESETN, Q => 
                           MINUTES_OUT_0_port, QN => n41);
   HOURS_OUT_reg_2_inst : DFSP1 port map( D => n89, SD => HOURS_OUT_1_port, SE 
                           => test_se, C => CLK, SN => RESETN, Q => 
                           HOURS_OUT_2_port, QN => n32_port);
   HOURS_OUT_reg_3_inst : DFSP1 port map( D => n88, SD => n32_port, SE => 
                           test_se, C => CLK, SN => RESETN, Q => 
                           HOURS_OUT_3_port, QN => n31_port);
   U3 : XOR21 port map( A => AM_PM_OUT_port, B => n47_port, Q => n1);
   U4 : INV3 port map( A => n69, Q => n10);
   U5 : INV3 port map( A => n45_port, Q => n9);
   U6 : NOR21 port map( A => n11, B => n10, Q => n71);
   U7 : NOR21 port map( A => n9, B => n48_port, Q => n49_port);
   U8 : NOR31 port map( A => n66, B => n9, C => n67, Q => n51);
   U9 : AOI221 port map( A => N65, B => n55, C => N92, D => n56, Q => n53);
   U10 : XNR21 port map( A => n16, B => N173, Q => N92);
   U11 : XNR21 port map( A => n18, B => N173, Q => N65);
   U12 : INV3 port map( A => n4, Q => N173);
   U13 : NAND22 port map( A => n10, B => n68, Q => n45_port);
   U14 : NAND22 port map( A => N179, B => N170, Q => n19);
   U15 : NAND22 port map( A => N179, B => N170, Q => n17);
   U16 : NAND22 port map( A => N179, B => N170, Q => n21);
   U17 : AOI221 port map( A => N63, B => n55, C => N90, D => n56, Q => n62);
   U18 : XNR21 port map( A => n3, B => N179, Q => N90);
   U19 : XNR21 port map( A => n3, B => N179, Q => N63);
   U20 : AOI221 port map( A => N64, B => n55, C => N91, D => n56, Q => n59);
   U21 : XNR21 port map( A => n17, B => N172, Q => N91);
   U22 : XNR21 port map( A => n19, B => N172, Q => N64);
   U23 : NAND22 port map( A => N172, B => n12, Q => n18);
   U25 : NAND22 port map( A => N172, B => n12, Q => n16);
   U26 : NAND22 port map( A => N172, B => n12, Q => n20);
   U27 : INV3 port map( A => n21, Q => n12);
   U29 : NAND31 port map( A => n66, B => n68, C => n56, Q => n79);
   U30 : NOR21 port map( A => n66, B => n8, Q => n81);
   U31 : INV3 port map( A => n78, Q => n8);
   U33 : AOI211 port map( A => n66, B => n56, C => n11, Q => n48_port);
   U34 : NAND22 port map( A => n45_port, B => n66, Q => n54);
   U35 : NOR21 port map( A => n67, B => n56, Q => n55);
   U37 : INV3 port map( A => n67, Q => n11);
   U38 : NAND31 port map( A => n15, B => n14, C => MINS, Q => n56);
   U39 : NAND31 port map( A => n15, B => n13, C => SECS, Q => n66);
   U40 : NAND41 port map( A => CURRENT_SECS_4_port, B => CURRENT_SECS_3_port, C
                           => CURRENT_SECS_5_port, D => n87, Q => n78);
   U41 : NOR31 port map( A => n29_port, B => CURRENT_SECS_2_port, C => n30_port
                           , Q => n87);
   U42 : NAND22 port map( A => N32, B => n71, Q => n70);
   U43 : NAND22 port map( A => N49, B => n81, Q => n80);
   U44 : AOI211 port map( A => n3, B => n51, C => n64_port, Q => n63_port);
   U45 : NOR21 port map( A => n65_port, B => n54, Q => n64_port);
   U47 : AOI221 port map( A => n3, B => n55, C => n3, D => n56, Q => n65_port);
   U49 : AOI211 port map( A => N23, B => n51, C => n61, Q => n60);
   U51 : XNR21 port map( A => n7, B => N179, Q => N23);
   U53 : NOR21 port map( A => n62, B => n54, Q => n61);
   U55 : AOI211 port map( A => N24, B => n51, C => n58, Q => n57);
   U57 : XNR21 port map( A => n21, B => N172, Q => N24);
   U58 : NOR21 port map( A => n59, B => n54, Q => n58);
   U59 : AOI211 port map( A => N25, B => n51, C => n52, Q => n50);
   U60 : XNR21 port map( A => n20, B => N173, Q => N25);
   U63 : NOR21 port map( A => n53, B => n54, Q => n52);
   U65 : INV3 port map( A => n7, Q => N170);
   U67 : INV3 port map( A => n6, Q => N172);
   U69 : INV3 port map( A => n2, Q => N179);
   U71 : NAND41 port map( A => HOURS_OUT_3_port, B => HOURS_OUT_2_port, C => 
                           n34, D => n33, Q => N137);
   U73 : INV3 port map( A => SECS, Q => n14);
   U74 : INV3 port map( A => MINS, Q => n13);
   U75 : INV3 port map( A => HOURS, Q => n15);
   U76 : NAND41 port map( A => MINUTES_OUT_4_port, B => MINUTES_OUT_3_port, C 
                           => MINUTES_OUT_5_port, D => n77, Q => n67);
   U77 : NOR31 port map( A => n40, B => MINUTES_OUT_2_port, C => n41, Q => n77)
                           ;
   U78 : NAND31 port map( A => n13, B => n14, C => HOURS, Q => n68);
   U79 : NAND22 port map( A => N31, B => n71, Q => n72);
   U80 : NAND22 port map( A => N30, B => n71, Q => n73);
   U81 : NAND22 port map( A => N29, B => n71, Q => n74);
   U82 : NAND22 port map( A => N28, B => n71, Q => n75);
   U83 : NAND22 port map( A => n41, B => n71, Q => n76);
   U84 : NAND22 port map( A => N48, B => n81, Q => n82);
   U85 : NAND22 port map( A => N47, B => n81, Q => n83);
   U86 : NAND22 port map( A => N45, B => n81, Q => n85);
   U87 : NAND22 port map( A => n30_port, B => n81, Q => n86);
   U88 : NAND22 port map( A => N46, B => n81, Q => n84);
   U89 : NOR21 port map( A => N137, B => n48_port, Q => n47_port);
   U91 : NAND20 port map( A => HOURS_OUT_0_port, B => N137, Q => n3);
   U92 : NAND20 port map( A => HOURS_OUT_1_port, B => N137, Q => n2);
   U93 : NAND20 port map( A => HOURS_OUT_0_port, B => N137, Q => n7);
   U94 : NAND20 port map( A => HOURS_OUT_2_port, B => N137, Q => n6);
   U95 : NAND20 port map( A => N137, B => HOURS_OUT_3_port, Q => n4);
   U96 : XOR20 port map( A => r84_carry_5_port, B => MINUTES_OUT_5_port, Q => 
                           N32);
   U97 : XOR20 port map( A => U10_carry_5_port, B => CURRENT_SECS_5_port, Q => 
                           N49);

end SYN_RTL_architecture;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_COMPUTE_BLOCK.all;

entity CLOCK_GEN_test_1 is

   port( CLK, RESETN : in std_logic;  INT_CLK : out std_logic;  
         COMPUTE_BLOCK_TM_FIX_in, test_se, test_si1 : in std_logic;  test_so1 :
         out std_logic);

end CLOCK_GEN_test_1;

architecture SYN_RTL of CLOCK_GEN_test_1 is

   component IMUX23
      port( A, B, S : in std_logic;  Q : out std_logic);
   end component;
   
   component CLKIN6
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component LOGIC1
      port( Q : out std_logic);
   end component;
   
   component DFSC3
      port( D, SD, SE, C, RN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   component TFSEC3
      port( T, SD, SE, C, RN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal COUNT, n2, n4, n5, test_so1_port, n_1001, n_1002 : std_logic;

begin
   test_so1 <= test_so1_port;
   
   COUNT_reg : TFSEC3 port map( T => n2, SD => test_si1, SE => test_se, C => 
                           CLK, RN => RESETN, Q => COUNT, QN => n_1001);
   INT_CLK_reg : DFSC3 port map( D => COUNT, SD => COUNT, SE => test_se, C => 
                           CLK, RN => RESETN, Q => test_so1_port, QN => n_1002)
                           ;
   U4 : LOGIC1 port map( Q => n2);
   U3 : CLKIN6 port map( A => test_so1_port, Q => n5);
   U5 : CLKIN6 port map( A => CLK, Q => n4);
   U6 : IMUX23 port map( A => n5, B => n4, S => COMPUTE_BLOCK_TM_FIX_in, Q => 
                           INT_CLK);

end SYN_RTL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_COMPUTE_BLOCK.all;

entity COMPARATOR is

   port( ALARM_HRS, TIME_HRS : in std_logic_vector (3 downto 0);  ALARM_MINS, 
         TIME_MINS : in std_logic_vector (5 downto 0);  ALARM_AM_PM, TIME_AM_PM
         : in std_logic;  RINGER : out std_logic);

end COMPARATOR;

architecture SYN_RTL of COMPARATOR is

   component NOR40
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component XOR20
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND30
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   component XNR20
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component OAI220
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component NOR20
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component AOI220
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND20
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component XOR21
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component INV3
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component XNR21
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND31
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   signal N2, n2_port, n3, n4, n5, n6, n7, n1, n8, n9, n10, n11, n12, n13, n14,
      n15, n16, n17, n18 : std_logic;

begin
   
   U1 : INV3 port map( A => n8, Q => n18);
   U2 : NOR40 port map( A => n2_port, B => n3, C => n4, D => n5, Q => RINGER);
   U3 : XOR21 port map( A => TIME_AM_PM, B => ALARM_AM_PM, Q => n5);
   U4 : NAND31 port map( A => n6, B => N2, C => n7, Q => n2_port);
   U5 : XNR21 port map( A => TIME_HRS(3), B => ALARM_HRS(3), Q => n6);
   U6 : XNR21 port map( A => TIME_HRS(1), B => ALARM_HRS(1), Q => n7);
   U7 : INV3 port map( A => TIME_MINS(0), Q => n16);
   U8 : INV3 port map( A => ALARM_MINS(1), Q => n17);
   U9 : XOR21 port map( A => TIME_HRS(2), B => ALARM_HRS(2), Q => n4);
   U10 : XOR21 port map( A => TIME_HRS(0), B => ALARM_HRS(0), Q => n3);
   U11 : NAND20 port map( A => ALARM_MINS(0), B => n16, Q => n1);
   U12 : AOI220 port map( A => n17, B => n1, C => n1, D => TIME_MINS(1), Q => 
                           n8);
   U13 : NOR20 port map( A => n16, B => ALARM_MINS(0), Q => n9);
   U14 : OAI220 port map( A => n9, B => n17, C => TIME_MINS(1), D => n9, Q => 
                           n11);
   U15 : XNR20 port map( A => TIME_MINS(5), B => ALARM_MINS(5), Q => n10);
   U16 : NAND30 port map( A => n18, B => n11, C => n10, Q => n15);
   U17 : XOR20 port map( A => TIME_MINS(4), B => ALARM_MINS(4), Q => n14);
   U18 : XOR20 port map( A => TIME_MINS(2), B => ALARM_MINS(2), Q => n13);
   U19 : XOR20 port map( A => TIME_MINS(3), B => ALARM_MINS(3), Q => n12);
   U20 : NOR40 port map( A => n15, B => n14, C => n13, D => n12, Q => N2);

end SYN_RTL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_COMPUTE_BLOCK.all;

entity COMPUTE_BLOCK is

   port( SET_TIME, ALARM, HRS, MINS, TOGGLE_SWITCH, CLK, TM_FIX, RESETN : in 
         std_logic;  TIM_DISPLAY, ALM_DISPLAY : out std_logic_vector (10 downto
         0);  SPEAKER_OUT : out std_logic;  test_si, test_se : in std_logic);

end COMPUTE_BLOCK;

architecture SYN_NET of COMPUTE_BLOCK is

   component INV3
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component ALARM_SM_2_test_1
      port( COMPARE_IN, TOGGLE_ON, CLOCK, RESETN : in std_logic;  RING : out 
            std_logic;  test_se, test_si1 : in std_logic);
   end component;
   
   component COMPARATOR
      port( ALARM_HRS, TIME_HRS : in std_logic_vector (3 downto 0);  ALARM_MINS
            , TIME_MINS : in std_logic_vector (5 downto 0);  ALARM_AM_PM, 
            TIME_AM_PM : in std_logic;  RINGER : out std_logic);
   end component;
   
   component ALARM_BLOCK_test_1
      port( ALARM, HRS, MINS, CLK, RESETN, ENABLE : in std_logic;  HRS_OUT : 
            out std_logic_vector (3 downto 0);  MINS_OUT : out std_logic_vector
            (5 downto 0);  AM_PM_OUT : out std_logic;  DISPLAY_BUS : out 
            std_logic_vector (10 downto 0);  test_se, test_si1 : in std_logic; 
            test_so1 : out std_logic);
   end component;
   
   component TIME_BLOCK_test_1
      port( SET_TIME, HRS, MINS, CLK, RESETN, ENABLE : in std_logic;  HRS_OUT :
            out std_logic_vector (3 downto 0);  MINS_OUT : out std_logic_vector
            (5 downto 0);  AM_PM_OUT : out std_logic;  DISPLAY_BUS : out 
            std_logic_vector (10 downto 0);  test_se, test_si1 : in std_logic; 
            test_so1 : out std_logic);
   end component;
   
   component CLOCK_GEN_test_1
      port( CLK, RESETN : in std_logic;  INT_CLK : out std_logic;  
            COMPUTE_BLOCK_TM_FIX_in, test_se, test_si1 : in std_logic;  
            test_so1 : out std_logic);
   end component;
   
   signal INT_CLK, TIM_HRS_3_port, TIM_HRS_2_port, TIM_HRS_1_port, 
      TIM_HRS_0_port, TIM_MINS_5_port, TIM_MINS_4_port, TIM_MINS_3_port, 
      TIM_MINS_2_port, TIM_MINS_1_port, TIM_MINS_0_port, TIM_AM_PM, 
      ALM_HRS_3_port, ALM_HRS_2_port, ALM_HRS_1_port, ALM_HRS_0_port, 
      ALM_MINS_5_port, ALM_MINS_4_port, ALM_MINS_3_port, ALM_MINS_2_port, 
      ALM_MINS_1_port, ALM_MINS_0_port, ALM_AM_PM, KONNECT12, n2, n9, n10, n11 
      : std_logic;

begin
   
   U7 : CLOCK_GEN_test_1 port map( CLK => CLK, RESETN => RESETN, INT_CLK => 
                           INT_CLK, COMPUTE_BLOCK_TM_FIX_in => TM_FIX, test_se 
                           => test_se, test_si1 => n10, test_so1 => n9);
   U1 : TIME_BLOCK_test_1 port map( SET_TIME => SET_TIME, HRS => HRS, MINS => 
                           MINS, CLK => INT_CLK, RESETN => RESETN, ENABLE => n2
                           , HRS_OUT(3) => TIM_HRS_3_port, HRS_OUT(2) => 
                           TIM_HRS_2_port, HRS_OUT(1) => TIM_HRS_1_port, 
                           HRS_OUT(0) => TIM_HRS_0_port, MINS_OUT(5) => 
                           TIM_MINS_5_port, MINS_OUT(4) => TIM_MINS_4_port, 
                           MINS_OUT(3) => TIM_MINS_3_port, MINS_OUT(2) => 
                           TIM_MINS_2_port, MINS_OUT(1) => TIM_MINS_1_port, 
                           MINS_OUT(0) => TIM_MINS_0_port, AM_PM_OUT => 
                           TIM_AM_PM, DISPLAY_BUS(10) => TIM_DISPLAY(10), 
                           DISPLAY_BUS(9) => TIM_DISPLAY(9), DISPLAY_BUS(8) => 
                           TIM_DISPLAY(8), DISPLAY_BUS(7) => TIM_DISPLAY(7), 
                           DISPLAY_BUS(6) => TIM_DISPLAY(6), DISPLAY_BUS(5) => 
                           TIM_DISPLAY(5), DISPLAY_BUS(4) => TIM_DISPLAY(4), 
                           DISPLAY_BUS(3) => TIM_DISPLAY(3), DISPLAY_BUS(2) => 
                           TIM_DISPLAY(2), DISPLAY_BUS(1) => TIM_DISPLAY(1), 
                           DISPLAY_BUS(0) => TIM_DISPLAY(0), test_se => test_se
                           , test_si1 => test_si, test_so1 => n11);
   U2 : ALARM_BLOCK_test_1 port map( ALARM => ALARM, HRS => HRS, MINS => MINS, 
                           CLK => INT_CLK, RESETN => RESETN, ENABLE => ALARM, 
                           HRS_OUT(3) => ALM_HRS_3_port, HRS_OUT(2) => 
                           ALM_HRS_2_port, HRS_OUT(1) => ALM_HRS_1_port, 
                           HRS_OUT(0) => ALM_HRS_0_port, MINS_OUT(5) => 
                           ALM_MINS_5_port, MINS_OUT(4) => ALM_MINS_4_port, 
                           MINS_OUT(3) => ALM_MINS_3_port, MINS_OUT(2) => 
                           ALM_MINS_2_port, MINS_OUT(1) => ALM_MINS_1_port, 
                           MINS_OUT(0) => ALM_MINS_0_port, AM_PM_OUT => 
                           ALM_AM_PM, DISPLAY_BUS(10) => ALM_DISPLAY(10), 
                           DISPLAY_BUS(9) => ALM_DISPLAY(9), DISPLAY_BUS(8) => 
                           ALM_DISPLAY(8), DISPLAY_BUS(7) => ALM_DISPLAY(7), 
                           DISPLAY_BUS(6) => ALM_DISPLAY(6), DISPLAY_BUS(5) => 
                           ALM_DISPLAY(5), DISPLAY_BUS(4) => ALM_DISPLAY(4), 
                           DISPLAY_BUS(3) => ALM_DISPLAY(3), DISPLAY_BUS(2) => 
                           ALM_DISPLAY(2), DISPLAY_BUS(1) => ALM_DISPLAY(1), 
                           DISPLAY_BUS(0) => ALM_DISPLAY(0), test_se => test_se
                           , test_si1 => n11, test_so1 => n10);
   U4 : COMPARATOR port map( ALARM_HRS(3) => ALM_HRS_3_port, ALARM_HRS(2) => 
                           ALM_HRS_2_port, ALARM_HRS(1) => ALM_HRS_1_port, 
                           ALARM_HRS(0) => ALM_HRS_0_port, TIME_HRS(3) => 
                           TIM_HRS_3_port, TIME_HRS(2) => TIM_HRS_2_port, 
                           TIME_HRS(1) => TIM_HRS_1_port, TIME_HRS(0) => 
                           TIM_HRS_0_port, ALARM_MINS(5) => ALM_MINS_5_port, 
                           ALARM_MINS(4) => ALM_MINS_4_port, ALARM_MINS(3) => 
                           ALM_MINS_3_port, ALARM_MINS(2) => ALM_MINS_2_port, 
                           ALARM_MINS(1) => ALM_MINS_1_port, ALARM_MINS(0) => 
                           ALM_MINS_0_port, TIME_MINS(5) => TIM_MINS_5_port, 
                           TIME_MINS(4) => TIM_MINS_4_port, TIME_MINS(3) => 
                           TIM_MINS_3_port, TIME_MINS(2) => TIM_MINS_2_port, 
                           TIME_MINS(1) => TIM_MINS_1_port, TIME_MINS(0) => 
                           TIM_MINS_0_port, ALARM_AM_PM => ALM_AM_PM, 
                           TIME_AM_PM => TIM_AM_PM, RINGER => KONNECT12);
   U5 : ALARM_SM_2_test_1 port map( COMPARE_IN => KONNECT12, TOGGLE_ON => 
                           TOGGLE_SWITCH, CLOCK => INT_CLK, RESETN => RESETN, 
                           RING => SPEAKER_OUT, test_se => test_se, test_si1 =>
                           n9);
   U6 : INV3 port map( A => ALARM, Q => n2);

end SYN_NET;
