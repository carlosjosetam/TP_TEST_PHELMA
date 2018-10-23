
library IEEE;

use IEEE.std_logic_1164.all;

package CONV_PACK_CONVERTOR_CKT is

-- define attributes
attribute ENUM_ENCODING : STRING;

-- define any necessary types
type UNSIGNED is array (INTEGER range <>) of std_logic;

end CONV_PACK_CONVERTOR_CKT;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_CONVERTOR_CKT.all;

entity CONVERTOR_CKT is

   port( bin_time : in UNSIGNED (10 downto 0);  hr_display, min_display : out 
         std_logic_vector (13 downto 0);  am_pm_display : out std_logic);

end CONVERTOR_CKT;

architecture SYN_RTL of CONVERTOR_CKT is

   component NOR40
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component LOGIC0
      port( Q : out std_logic);
   end component;
   
   component INV3
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND22
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component NOR21
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component AOI2111
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component AOI211
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   component AOI311
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component NOR31
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   component OAI2111
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component OAI222
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component IMUX21
      port( A, B, S : in std_logic;  Q : out std_logic);
   end component;
   
   component OAI212
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   component OAI311
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component AOI221
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND31
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   component OAI2110
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component NOR30
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   component OAI210
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   component AOI210
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   signal hr_display_12_port, hr_display_6_port, hr_display_5_port, 
      hr_display_4_port, hr_display_3_port, hr_display_2_port, 
      hr_display_1_port, hr_display_0_port, min_display_13_port, 
      min_display_12_port, min_display_11_port, min_display_9_port, 
      min_display_8_port, min_display_7_port, min_display_6_port, 
      min_display_5_port, min_display_4_port, min_display_3_port, 
      min_display_2_port, min_display_1_port, min_display_0_port, 
      hr_displayx13x, n114, n115, n116, n117, n118, n119, n120, n121, n122, 
      n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, 
      n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, 
      n147, n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, 
      n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, 
      n171, n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, 
      n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, 
      n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, 
      n207, n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218 : 
      std_logic;

begin
   hr_display <= ( hr_displayx13x, hr_display_12_port, hr_display_12_port, 
      hr_displayx13x, hr_displayx13x, hr_displayx13x, hr_displayx13x, 
      hr_display_6_port, hr_display_5_port, hr_display_4_port, 
      hr_display_3_port, hr_display_2_port, hr_display_1_port, 
      hr_display_0_port );
   min_display <= ( min_display_13_port, min_display_12_port, 
      min_display_11_port, min_display_13_port, min_display_9_port, 
      min_display_8_port, min_display_7_port, min_display_6_port, 
      min_display_5_port, min_display_4_port, min_display_3_port, 
      min_display_2_port, min_display_1_port, min_display_0_port );
   
   U136 : AOI210 port map( A => bin_time(2), B => n170, C => n191, Q => n114);
   U137 : OAI210 port map( A => n203, B => n210, C => n114, Q => n213);
   U138 : NOR30 port map( A => n216, B => n179, C => n213, Q => n115);
   U139 : OAI2110 port map( A => n206, B => n210, C => n217, D => n115, Q => 
                           min_display_13_port);
   U140 : AOI211 port map( A => n128, B => n131, C => n127, Q => n130);
   U141 : AOI2111 port map( A => bin_time(9), B => n125, C => n127, D => n124, 
                           Q => n126);
   U142 : AOI211 port map( A => n123, B => n131, C => bin_time(8), Q => n124);
   U143 : INV3 port map( A => bin_time(7), Q => n123);
   U144 : IMUX21 port map( A => bin_time(3), B => n196, S => bin_time(4), Q => 
                           n198);
   U145 : OAI222 port map( A => bin_time(1), B => n212, C => n195, D => n215, Q
                           => n200);
   U146 : AOI221 port map( A => n190, B => n189, C => n215, D => n188, Q => 
                           n192);
   U147 : OAI311 port map( A => bin_time(5), B => n196, C => n215, D => n181, Q
                           => n182);
   U148 : OAI222 port map( A => bin_time(2), B => n189, C => bin_time(4), D => 
                           n178, Q => n183);
   U149 : AOI221 port map( A => n190, B => n206, C => n215, D => n177, Q => 
                           n186);
   U150 : OAI212 port map( A => n208, B => n176, C => n175, Q => n177);
   U151 : OAI212 port map( A => n172, B => n193, C => n171, Q => n174);
   U152 : IMUX21 port map( A => bin_time(5), B => n193, S => bin_time(0), Q => 
                           n176);
   U153 : AOI2111 port map( A => bin_time(5), B => n211, C => n162, D => n194, 
                           Q => n165);
   U154 : AOI221 port map( A => n196, B => n215, C => n190, D => n203, Q => 
                           n161);
   U155 : AOI211 port map( A => n158, B => n157, C => bin_time(0), Q => n159);
   U156 : OAI212 port map( A => n210, B => n203, C => n158, Q => n160);
   U157 : NAND22 port map( A => bin_time(3), B => n172, Q => n150);
   U158 : OAI222 port map( A => bin_time(0), B => n146, C => n145, D => n215, Q
                           => n147);
   U159 : AOI211 port map( A => n173, B => n144, C => n143, Q => n145);
   U160 : OAI222 port map( A => bin_time(0), B => n158, C => n144, D => n206, Q
                           => n143);
   U161 : NOR21 port map( A => n168, B => n167, Q => n146);
   U162 : AOI221 port map( A => bin_time(2), B => n210, C => n207, D => n178, Q
                           => n168);
   U163 : AOI211 port map( A => n195, B => n142, C => n206, Q => n148);
   U164 : INV3 port map( A => n153, Q => n142);
   U165 : NOR21 port map( A => n215, B => n172, Q => n190);
   U166 : OAI212 port map( A => n134, B => n215, C => n187, Q => n163);
   U167 : INV3 port map( A => bin_time(2), Q => n215);
   U168 : AOI2111 port map( A => n173, B => n189, C => n208, D => n179, Q => 
                           n134);
   U169 : INV3 port map( A => bin_time(5), Q => n206);
   U170 : NOR21 port map( A => bin_time(1), B => n170, Q => n208);
   U171 : INV3 port map( A => bin_time(4), Q => n172);
   U172 : INV3 port map( A => bin_time(3), Q => n170);
   U173 : INV3 port map( A => bin_time(10), Q => am_pm_display);
   U174 : INV3 port map( A => n116, Q => hr_display_12_port);
   U175 : OAI212 port map( A => bin_time(7), B => bin_time(8), C => bin_time(9)
                           , Q => n116);
   U176 : OAI2111 port map( A => n132, B => n131, C => n130, D => n129, Q => 
                           hr_display_6_port);
   U177 : OAI311 port map( A => bin_time(7), B => bin_time(6), C => n132, D => 
                           n126, Q => hr_display_5_port);
   U178 : OAI2111 port map( A => n132, B => n123, C => n131, D => n122, Q => 
                           hr_display_4_port);
   U179 : NAND31 port map( A => n121, B => n120, C => n119, Q => 
                           hr_display_3_port);
   U180 : OAI2111 port map( A => bin_time(9), B => n123, C => bin_time(8), D =>
                           bin_time(6), Q => n120);
   U181 : OAI212 port map( A => bin_time(6), B => n129, C => n119, Q => 
                           hr_display_2_port);
   U182 : NAND31 port map( A => bin_time(7), B => n131, C => n118, Q => n119);
   U183 : NAND22 port map( A => bin_time(9), B => n123, Q => n129);
   U184 : OAI222 port map( A => n117, B => n122, C => n123, D => n118, Q => 
                           hr_display_1_port);
   U185 : OAI212 port map( A => bin_time(9), B => bin_time(8), C => n118, Q => 
                           n122);
   U186 : INV3 port map( A => n125, Q => n117);
   U187 : OAI212 port map( A => n127, B => n132, C => n121, Q => 
                           hr_display_0_port);
   U188 : IMUX21 port map( A => n128, B => n123, S => bin_time(9), Q => n121);
   U189 : NOR21 port map( A => bin_time(8), B => n123, Q => n128);
   U190 : NOR21 port map( A => bin_time(9), B => n125, Q => n127);
   U191 : NAND22 port map( A => bin_time(7), B => bin_time(6), Q => n125);
   U192 : OAI311 port map( A => bin_time(3), B => bin_time(2), C => n171, D => 
                           n141, Q => min_display_12_port);
   U193 : NOR21 port map( A => n154, B => n140, Q => n141);
   U194 : OAI212 port map( A => bin_time(2), B => n157, C => n139, Q => 
                           min_display_11_port);
   U195 : AOI2111 port map( A => bin_time(2), B => n138, C => bin_time(5), D =>
                           n140, Q => n139);
   U196 : AOI211 port map( A => n211, B => n170, C => bin_time(4), Q => n140);
   U197 : INV3 port map( A => n158, Q => n138);
   U198 : OAI212 port map( A => bin_time(5), B => n218, C => n217, Q => 
                           min_display_9_port);
   U199 : AOI2111 port map( A => n216, B => n215, C => n214, D => n213, Q => 
                           n218);
   U200 : NOR21 port map( A => bin_time(1), B => n212, Q => n214);
   U201 : OAI311 port map( A => bin_time(5), B => n211, C => n210, D => n209, Q
                           => min_display_8_port);
   U202 : AOI221 port map( A => bin_time(5), B => n210, C => n208, D => n207, Q
                           => n209);
   U203 : NAND31 port map( A => n206, B => n212, C => n205, Q => 
                           min_display_7_port);
   U204 : OAI2111 port map( A => n204, B => n203, C => n202, D => n201, Q => 
                           min_display_6_port);
   U205 : AOI221 port map( A => bin_time(5), B => n200, C => n215, D => n199, Q
                           => n201);
   U206 : OAI212 port map( A => bin_time(0), B => n198, C => n197, Q => n199);
   U207 : INV3 port map( A => n194, Q => n202);
   U208 : AOI2111 port map( A => n216, B => n193, C => n192, D => n191, Q => 
                           n204);
   U209 : OAI2111 port map( A => bin_time(4), B => n187, C => n186, D => n185, 
                           Q => min_display_5_port);
   U210 : OAI222 port map( A => n203, B => n184, C => n183, D => n182, Q => 
                           n185);
   U211 : AOI221 port map( A => bin_time(0), B => n174, C => bin_time(1), D => 
                           n173, Q => n175);
   U212 : OAI311 port map( A => n206, B => n170, C => n215, D => n169, Q => 
                           min_display_4_port);
   U213 : OAI2111 port map( A => bin_time(2), B => n166, C => n165, D => n164, 
                           Q => min_display_3_port);
   U214 : IMUX21 port map( A => n184, B => n163, S => bin_time(0), Q => n164);
   U215 : OAI222 port map( A => bin_time(5), B => n161, C => bin_time(4), D => 
                           n187, Q => n194);
   U216 : AOI211 port map( A => bin_time(5), B => n160, C => n159, Q => n166);
   U217 : AOI211 port map( A => n156, B => n155, C => bin_time(0), Q => 
                           min_display_2_port);
   U218 : AOI2111 port map( A => n154, B => n170, C => n153, D => n184, Q => 
                           n155);
   U219 : OAI212 port map( A => n195, B => n215, C => n197, Q => n184);
   U220 : INV3 port map( A => n188, Q => n154);
   U221 : IMUX21 port map( A => n152, B => n180, S => bin_time(2), Q => n156);
   U222 : OAI2111 port map( A => n172, B => n206, C => n151, D => n150, Q => 
                           n152);
   U223 : OAI2111 port map( A => n212, B => n178, C => n149, D => n217, Q => 
                           min_display_1_port);
   U224 : NAND22 port map( A => n180, B => n215, Q => n217);
   U225 : AOI2111 port map( A => n162, B => n215, C => n148, D => n147, Q => 
                           n149);
   U226 : OAI222 port map( A => bin_time(1), B => n188, C => bin_time(5), D => 
                           n158, Q => n167);
   U227 : NAND22 port map( A => bin_time(3), B => bin_time(1), Q => n158);
   U228 : NAND22 port map( A => bin_time(4), B => n206, Q => n188);
   U229 : NOR21 port map( A => bin_time(2), B => bin_time(4), Q => n207);
   U230 : NOR21 port map( A => n193, B => n205, Q => n153);
   U231 : INV3 port map( A => n216, Q => n205);
   U232 : INV3 port map( A => n208, Q => n178);
   U233 : OAI2111 port map( A => bin_time(2), B => n137, C => n136, D => n135, 
                           Q => min_display_0_port);
   U234 : AOI211 port map( A => bin_time(4), B => n211, C => n163, Q => n135);
   U235 : NOR21 port map( A => n206, B => n189, Q => n179);
   U236 : INV3 port map( A => n196, Q => n189);
   U237 : NOR21 port map( A => bin_time(5), B => bin_time(4), Q => n173);
   U238 : NOR31 port map( A => bin_time(0), B => bin_time(1), C => bin_time(2),
                           Q => n211);
   U239 : AOI311 port map( A => bin_time(2), B => n203, C => n172, D => n162, Q
                           => n136);
   U240 : AOI211 port map( A => n171, B => n151, C => n157, Q => n162);
   U241 : NAND22 port map( A => bin_time(4), B => n170, Q => n157);
   U242 : NAND22 port map( A => bin_time(1), B => n206, Q => n151);
   U243 : NAND22 port map( A => bin_time(5), B => n193, Q => n171);
   U244 : AOI2111 port map( A => n216, B => n203, C => n133, D => n191, Q => 
                           n137);
   U245 : INV3 port map( A => n195, Q => n191);
   U246 : NAND22 port map( A => n196, B => n172, Q => n195);
   U247 : INV3 port map( A => n197, Q => n133);
   U248 : NAND22 port map( A => bin_time(5), B => n144, Q => n197);
   U249 : NOR21 port map( A => n208, B => n196, Q => n144);
   U250 : NOR21 port map( A => bin_time(3), B => n193, Q => n196);
   U251 : NAND22 port map( A => n208, B => n206, Q => n187);
   U252 : NOR21 port map( A => n170, B => n172, Q => n216);
   U253 : INV3 port map( A => bin_time(6), Q => n131);
   U254 : NAND22 port map( A => bin_time(9), B => bin_time(8), Q => n118);
   U255 : INV3 port map( A => bin_time(8), Q => n132);
   U256 : INV3 port map( A => n187, Q => n180);
   U257 : NAND22 port map( A => n170, B => n172, Q => n210);
   U258 : INV3 port map( A => n190, Q => n212);
   U259 : INV3 port map( A => bin_time(1), Q => n193);
   U260 : INV3 port map( A => bin_time(0), Q => n203);
   U261 : LOGIC0 port map( Q => hr_displayx13x);
   U262 : NOR40 port map( A => bin_time(0), B => n179, C => n168, D => n167, Q 
                           => n169);
   U263 : NOR40 port map( A => bin_time(0), B => n180, C => n179, D => n190, Q 
                           => n181);

end SYN_RTL;
