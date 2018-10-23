--------------------------------------------------
-- RINGER STATE MACHINE --------------------------
--
-- File: ALARM_SM_2.vhd
-- Task: Activate ringer at alarm time.
--------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity ALARM_SM_2 is 
  port( COMPARE_IN:in  STD_LOGIC;
        TOGGLE_ON:in   STD_LOGIC;
        CLOCK:in       STD_LOGIC;
        RESETN:in      STD_LOGIC;
        RING:out       STD_LOGIC
  );
end;


architecture RTL of ALARM_SM_2 is 

type state_type is (IDLE, ACTIVATE);
signal CURRENT_STATE: state_type;
signal NEXT_STATE:    state_type;

begin
  COMBIN : process(CURRENT_STATE,COMPARE_IN,TOGGLE_ON) begin
    case CURRENT_STATE is 

      when IDLE =>
          RING <= '0';
          if ((COMPARE_IN and TOGGLE_ON) = '1') then
     	     NEXT_STATE <= ACTIVATE;
          else
     	     NEXT_STATE <= IDLE;
          end if;

      when ACTIVATE =>
          RING <= '1';
          if (TOGGLE_ON = '0') then
     	     NEXT_STATE <= IDLE;
          else
     	     NEXT_STATE <= ACTIVATE;
          end if;
    end case;
  end process COMBIN;

  SYNCH : process (CLOCK, RESETN) begin
     if (RESETN = '0') then
        CURRENT_STATE <= IDLE;
     elsif (CLOCK'event and CLOCK = '1') then
        CURRENT_STATE <= NEXT_STATE;
     end if;
  end process SYNCH;
end RTL;

