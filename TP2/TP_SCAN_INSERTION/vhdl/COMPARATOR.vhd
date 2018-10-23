-- ALARM TIME COMPARATOR -------------------------
--
-- File: COMPARATOR.vhd
-- Task: Compare clock time with alarm setting.
--------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity COMPARATOR is
  port( ALARM_HRS:in   INTEGER range 1 to 12; 
        TIME_HRS:in   INTEGER range 1 to 12; 
        ALARM_MINS:in  INTEGER range 0 to 59;
        TIME_MINS:in  INTEGER range 0 to 59;
        ALARM_AM_PM:in STD_LOGIC;
        TIME_AM_PM:in STD_LOGIC;
        RINGER:out STD_LOGIC
  );
end COMPARATOR;


architecture RTL of COMPARATOR is
begin
  COMPARE: 
     process(ALARM_HRS,TIME_HRS,ALARM_MINS,TIME_MINS,ALARM_AM_PM,TIME_AM_PM)
     begin
     RINGER <= '0';
     if ( (ALARM_HRS = TIME_HRS) and
          (ALARM_MINS = TIME_MINS) and
          (ALARM_AM_PM = TIME_AM_PM) ) then
        RINGER <= '1';
     end if;
   end process COMPARE;
end RTL;

