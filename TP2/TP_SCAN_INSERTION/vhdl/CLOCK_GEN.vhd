--------------------------------------------------
-- FREQUENCY DIVIDER -----------------------------
--
-- File: CLOCK_GEN.vhd
-- Task: Divide system clock by 2.
--------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity CLOCK_GEN is
  port( CLK:in      STD_LOGIC;
        RESETN:in   STD_LOGIC;
        INT_CLK:out STD_LOGIC
  );
end CLOCK_GEN;


architecture RTL of CLOCK_GEN is

signal COUNT:STD_LOGIC;

begin
  DIVIDER: process (CLK, RESETN)  begin
    if (RESETN = '0') then
       COUNT <= '0';
       INT_CLK <= '0';
    elsif (CLK'event and CLK = '1') then
       if (COUNT = '1') then
         COUNT <= '0';
         INT_CLK <= '1';
       else
         COUNT <= '1';
         INT_CLK <= '0';
       end if;
    end if;
  end process DIVIDER;
end RTL;

