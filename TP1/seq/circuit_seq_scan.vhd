
library IEEE;

use IEEE.std_logic_1164.all;

package CONV_PACK_fsm is

-- Declarations for conversion functions.
function std_logic_to_BIT(arg : in std_logic) return BIT;
function BIT_to_std_logic(arg : in BIT) return std_logic;

end CONV_PACK_fsm;

package body CONV_PACK_fsm is
   
   -- std_logic to enum type function
   function std_logic_to_BIT(arg : in std_logic) return BIT is
   -- synopsys built_in SYN_FEED_THRU;
   begin
      case arg is
         when '0' => return '0';
         when '1' => return '1';
         when others => assert FALSE -- this should not happen.
               report "un-convertible value"
               severity warning;
               return '0';
      end case;
   end;
   
   -- enum type to std_logic function
   function BIT_to_std_logic(arg : in BIT) return std_logic is
   -- synopsys built_in SYN_FEED_THRU;
   begin
      case arg is
         when '0' => return '0';
         when '1' => return '1';
         when others => assert FALSE -- this should not happen.
               report "un-convertible value"
               severity warning;
               return '0';
      end case;
   end;

end CONV_PACK_fsm;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_fsm.all;

entity fsm is

   port( a, b, ck : in BIT;  s : out BIT;  test_si : in std_logic;  test_so : 
         out std_logic;  test_se : in std_logic);

end fsm;

architecture SYN_structural of fsm is

   component na2_x1
      port( i0, i1 : in std_logic;  nq : out std_logic);
   end component;
   
   component o2_x2
      port( i0, i1 : in std_logic;  q : out std_logic);
   end component;
   
   component buf_x8
      port( i : in std_logic;  q : out std_logic);
   end component;
   
   component na2_x4
      port( i0, i1 : in std_logic;  nq : out std_logic);
   end component;
   
   component sff2_x4
      port( i0, i1, cmd, ck : in std_logic;  q : out std_logic);
   end component;
   
   signal e, a_port, c, f, b_port, d, ck_port, s_port : std_logic;

begin
   a_port <= BIT_to_std_logic(a);
   b_port <= BIT_to_std_logic(b);
   ck_port <= BIT_to_std_logic(ck);
   s <= std_logic_to_BIT(s_port);
   
   g1 : na2_x1 port map( i0 => e, i1 => a_port, nq => c);
   g5 : o2_x2 port map( i0 => e, i1 => f, q => s_port);
   U4 : buf_x8 port map( i => f, q => test_so);
   U5 : na2_x4 port map( i0 => f, i1 => b_port, nq => d);
   g4 : sff2_x4 port map( i0 => d, i1 => e, cmd => test_se, ck => ck_port, q =>
                           f);
   g3 : sff2_x4 port map( i0 => c, i1 => test_si, cmd => test_se, ck => ck_port
                           , q => e);

end SYN_structural;
