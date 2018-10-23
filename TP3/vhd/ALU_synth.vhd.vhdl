
library IEEE;

use IEEE.std_logic_1164.all;

package CONV_PACK_ALU is

-- define attributes
attribute ENUM_ENCODING : STRING;

end CONV_PACK_ALU;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_ALU.all;

entity ALU is

   port( A, B : in std_logic_vector (3 downto 0);  CMD : in std_logic_vector (2
         downto 0);  S : out std_logic_vector (3 downto 0));

end ALU;

architecture SYN_A of ALU is

   component CLKIN0
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component NOR30
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   component NOR20
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND30
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   component OAI210
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   component AOI210
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND20
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component IMUX20
      port( A, B, S : in std_logic;  Q : out std_logic);
   end component;
   
   component AOI2110
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component XNR20
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component XOR20
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component MUX21
      port( A, B, S : in std_logic;  Q : out std_logic);
   end component;
   
   component IMAJ30
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   component XOR40
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   signal n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
      n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90
      , n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, 
      n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, 
      n116, n117, n118 : std_logic;

begin
   
   U58 : OAI210 port map( A => n62, B => n63, C => n64, Q => S(3));
   U59 : IMUX20 port map( A => n65, B => n66, S => A(3), Q => n64);
   U60 : NAND20 port map( A => n67, B => n68, Q => n66);
   U61 : MUX21 port map( A => n69, B => n70, S => n71, Q => n67);
   U62 : OAI210 port map( A => n71, B => n70, C => n72, Q => n65);
   U63 : CLKIN0 port map( A => B(3), Q => n71);
   U64 : XOR40 port map( A => n73, B => n74, C => A(3), D => n75, Q => n63);
   U65 : OAI210 port map( A => n76, B => n77, C => n78, Q => n74);
   U66 : OAI210 port map( A => n79, B => n80, C => A(2), Q => n78);
   U67 : CLKIN0 port map( A => n76, Q => n80);
   U68 : NAND20 port map( A => B(3), B => n81, Q => n73);
   U69 : IMUX20 port map( A => n82, B => n83, S => A(2), Q => S(2));
   U70 : AOI2110 port map( A => n84, B => n85, C => n86, D => n87, Q => n83);
   U71 : IMUX20 port map( A => n69, B => n70, S => n88, Q => n86);
   U72 : XNR20 port map( A => n76, B => n77, Q => n84);
   U73 : AOI2110 port map( A => n89, B => n85, C => n90, D => n91, Q => n82);
   U74 : NOR20 port map( A => n88, B => n70, Q => n90);
   U75 : CLKIN0 port map( A => B(2), Q => n88);
   U76 : XNR20 port map( A => n79, B => n76, Q => n89);
   U77 : IMAJ30 port map( A => A(1), B => n92, C => n93, Q => n76);
   U78 : NOR20 port map( A => n94, B => n95, Q => n93);
   U79 : CLKIN0 port map( A => n81, Q => n95);
   U80 : XNR20 port map( A => n96, B => n97, Q => n94);
   U81 : MUX21 port map( A => A(0), B => n75, S => n98, Q => n92);
   U82 : CLKIN0 port map( A => n77, Q => n79);
   U83 : NAND20 port map( A => n81, B => n99, Q => n77);
   U84 : XNR20 port map( A => B(2), B => n97, Q => n99);
   U85 : IMUX20 port map( A => n100, B => n101, S => A(1), Q => S(1));
   U86 : AOI2110 port map( A => n102, B => n85, C => n103, D => n87, Q => n101)
                           ;
   U87 : IMUX20 port map( A => n69, B => n70, S => n96, Q => n103);
   U88 : XNR20 port map( A => n104, B => n105, Q => n102);
   U89 : AOI2110 port map( A => n106, B => n85, C => n107, D => n91, Q => n100)
                           ;
   U90 : CLKIN0 port map( A => n72, Q => n91);
   U91 : NOR20 port map( A => n96, B => n70, Q => n107);
   U92 : CLKIN0 port map( A => B(1), Q => n96);
   U93 : XOR20 port map( A => n105, B => n104, Q => n106);
   U94 : NAND20 port map( A => n81, B => n108, Q => n104);
   U95 : XNR20 port map( A => B(1), B => n97, Q => n108);
   U96 : CLKIN0 port map( A => n75, Q => n97);
   U97 : IMUX20 port map( A => n75, B => A(0), S => n109, Q => n105);
   U98 : NOR20 port map( A => CMD(1), B => CMD(0), Q => n75);
   U99 : IMUX20 port map( A => n110, B => n111, S => A(0), Q => S(0));
   U100 : AOI2110 port map( A => n98, B => n85, C => n112, D => n87, Q => n111)
                           ;
   U101 : CLKIN0 port map( A => n68, Q => n87);
   U102 : NAND30 port map( A => CMD(1), B => n113, C => CMD(0), Q => n68);
   U103 : IMUX20 port map( A => n69, B => n70, S => n114, Q => n112);
   U104 : NAND20 port map( A => CMD(2), B => n115, Q => n69);
   U105 : AOI210 port map( A => n109, B => n85, C => n116, Q => n110);
   U106 : OAI210 port map( A => n70, B => n114, C => n72, Q => n116);
   U107 : NAND30 port map( A => CMD(2), B => CMD(1), C => CMD(0), Q => n72);
   U108 : CLKIN0 port map( A => B(0), Q => n114);
   U109 : CLKIN0 port map( A => n117, Q => n70);
   U110 : NOR20 port map( A => n113, B => CMD(0), Q => n117);
   U111 : CLKIN0 port map( A => CMD(2), Q => n113);
   U112 : CLKIN0 port map( A => n62, Q => n85);
   U113 : NOR20 port map( A => n81, B => n118, Q => n62);
   U114 : NOR20 port map( A => CMD(2), B => CMD(1), Q => n81);
   U115 : CLKIN0 port map( A => n98, Q => n109);
   U116 : NOR20 port map( A => n118, B => B(0), Q => n98);
   U117 : NOR30 port map( A => CMD(0), B => CMD(2), C => n115, Q => n118);
   U118 : CLKIN0 port map( A => CMD(1), Q => n115);

end SYN_A;
