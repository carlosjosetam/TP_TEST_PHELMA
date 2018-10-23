--------------------------------------------------
-- HOURS ZERO FILTER -----------------------------
--
-- File: HOURS_FILTER.vhd
-- Task: Blank out leading zero in hours display.
--------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity HOURS_FILTER is
  port( TENS_DIGIT_HRS_IN:in STD_LOGIC_VECTOR(6 downto 0);
        TENS_DIGIT_HRS_OUT:out STD_LOGIC_VECTOR(6 downto 0)
  );
end HOURS_FILTER;


architecture RTL of HOURS_FILTER is
begin
  FILTER: process( TENS_DIGIT_HRS_IN ) begin
    if( TENS_DIGIT_HRS_IN = "1111110" ) then
      TENS_DIGIT_HRS_OUT <= "0000000";
    else
      TENS_DIGIT_HRS_OUT <= TENS_DIGIT_HRS_IN;
    end if;
  end process FILTER;
end RTL;


--------------------------------------------------
-- DISPLAY DRIVER UNIT ---------------------------
--
-- File: CONVERTOR_CKT.vhd
-- Task: Drive HH and MM displays.
--------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity CONVERTOR_CKT is 
  port( bin_time:in UNSIGNED(10 downto 0);
        hr_display:out STD_LOGIC_VECTOR(13 downto 0);
        min_display:out STD_LOGIC_VECTOR(13 downto 0);
        am_pm_display:out STD_LOGIC
  );
end CONVERTOR_CKT;


architecture RTL of CONVERTOR_CKT is

  component CONVERTOR
    port( T0,T1,T2,T3,T4,T5:in     STD_LOGIC;
          A0,B0,C0,D0,E0,F0,G0:out STD_LOGIC;
          A1,B1,C1,D1,E1,F1,G1:out STD_LOGIC
    );
  end component;

  component HOURS_FILTER
    port( TENS_DIGIT_HRS_IN:in STD_LOGIC_VECTOR(6 downto 0);
          TENS_DIGIT_HRS_OUT:out STD_LOGIC_VECTOR(6 downto 0)
    );
  end component;

  signal connect14: STD_LOGIC_VECTOR(6 downto 0);
  signal logic0 : STD_LOGIC;

begin
  logic0 <= '0';
  am_pm_display <= not (bin_time(10) );

  U7:CONVERTOR
    port map( T0 => logic0,
              T1 => logic0,
              T2 => bin_time(9),
              T3 => bin_time(8),
              T4 => bin_time(7),
              T5 => bin_time(6), 
              A0 => connect14(6),
              B0 => connect14(5),
              C0 => connect14(4), 
              D0 => connect14(3), 
              E0 => connect14(2), 
              F0 => connect14(1), 
              G0 => connect14(0), 
              A1 => hr_display(6),
              B1 => hr_display(5),
              C1 => hr_display(4), 
              D1 => hr_display(3), 
              E1 => hr_display(2), 
              F1 => hr_display(1), 
              G1 => hr_display(0)
    );

  U8:CONVERTOR
    port map( T0 => bin_time(5),
              T1 => bin_time(4),
              T2 => bin_time(3),
              T3 => bin_time(2),
              T4 => bin_time(1),
              T5 => bin_time(0), 
              A0 => min_display(13),
              B0 => min_display(12),
              C0 => min_display(11), 
              D0 => min_display(10), 
              E0 => min_display(9), 
              F0 => min_display(8), 
              G0 => min_display(7), 
              A1 => min_display(6),
              B1 => min_display(5),
              C1 => min_display(4), 
              D1 => min_display(3), 
              E1 => min_display(2), 
              F1 => min_display(1), 
              G1 => min_display(0)
    );

  U9:HOURS_FILTER
    port map( TENS_DIGIT_HRS_IN => connect14,
              TENS_DIGIT_HRS_OUT => hr_display(13 downto 7)
    );
end RTL;
