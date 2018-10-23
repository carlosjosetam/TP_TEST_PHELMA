--------------------------------------------------
-- TIME COUNTER SUBBLOCK -------------------------
--
-- File: TIME_COUNTER.vhd
-- Task:
--------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity TIME_COUNTER is
  port(HOURS,MINS,SECS,CLK:in STD_LOGIC;
       RESETN: in STD_LOGIC;
       HOURS_OUT:buffer INTEGER range 0 to 12 := 12;
       MINUTES_OUT:buffer INTEGER range 0 to 59 := 0;
       AM_PM_OUT:buffer STD_LOGIC := '0'
  );
end TIME_COUNTER;


architecture RTL of TIME_COUNTER is

signal CURRENT_SECS: INTEGER range 0 to 59;

begin
  process (CLK, RESETN) begin
     if (RESETN = '0') then
        HOURS_OUT <= 12;
        MINUTES_OUT <= 0;
        AM_PM_OUT <= '0';
        CURRENT_SECS <= 0;
     elsif ( CLK'event and CLK = '1' ) then
        HOURS_OUT <= HOURS_OUT;
        MINUTES_OUT <= MINUTES_OUT;
        AM_PM_OUT <= AM_PM_OUT;
        CURRENT_SECS <= CURRENT_SECS;

        if (SECS = '1' and MINS = '0' and HOURS = '0') then
           if (CURRENT_SECS = 59) then
              CURRENT_SECS <= 0;
              if (MINUTES_OUT = 59) then
                 MINUTES_OUT <= 0;
                 if (HOURS_OUT = 12) then
                    HOURS_OUT <= 1;
                    AM_PM_OUT <= not AM_PM_OUT;
                 else
                    HOURS_OUT <= HOURS_OUT + 1;
                 end if;
              else
                 MINUTES_OUT <= MINUTES_OUT + 1;
              end if;
           else
              CURRENT_SECS <= CURRENT_SECS + 1;
           end if;
        elsif (SECS = '0' and MINS = '1' and HOURS = '0') then
           CURRENT_SECS <= 0;
           if (MINUTES_OUT = 59) then
              MINUTES_OUT <= 0;
              if (HOURS_OUT = 12) then
                 HOURS_OUT <= 1;
                 AM_PM_OUT <= not AM_PM_OUT;
              else
                 HOURS_OUT <= HOURS_OUT + 1;
              end if;
           else
              MINUTES_OUT <= MINUTES_OUT + 1;
           end if;
        elsif (SECS = '0' and MINS = '0' and HOURS = '1') then
           CURRENT_SECS <= 0;   
           if (HOURS_OUT = 12) then
              HOURS_OUT <= 1;
              AM_PM_OUT <= not AM_PM_OUT;
           else
              HOURS_OUT <= HOURS_OUT + 1;
           end if;
        end if;
    end if;  
  end process;
end RTL;


--------------------------------------------------
-- TIME STATE MACHINE ----------------------------
--
-- File: TIME_STATE_MACHINE.vhd
-- Task: Control TIME_COUNTER block.
--------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity TIME_STATE_MACHINE is
  port( TIME_BUTTON,HOURS_BUTTON:in STD_LOGIC;
        MINUTES_BUTTON,CLK:in       STD_LOGIC;
        RESETN:in                   STD_LOGIC;
        SECS,HOURS,MINS:out         STD_LOGIC
  );
end TIME_STATE_MACHINE;


architecture RTL of TIME_STATE_MACHINE is

type STATE_TYPE is (COUNT_TIME, SET_HOURS, SET_MINUTES);
signal CURRENT_STATE: STATE_TYPE;
signal NEXT_STATE:    STATE_TYPE;
signal NEXT_SECS, NEXT_HOURS, NEXT_MINS : STD_LOGIC;

begin
  COMBIN: process( CURRENT_STATE, TIME_BUTTON, HOURS_BUTTON, MINUTES_BUTTON )
  begin
    NEXT_STATE <= CURRENT_STATE;
    NEXT_SECS <= '0';
    NEXT_HOURS <= '0';
    NEXT_MINS <= '0';

    case CURRENT_STATE is

      when COUNT_TIME =>
        if ( TIME_BUTTON ='1' and 
             HOURS_BUTTON='1' and 
             MINUTES_BUTTON='0' ) then
                     NEXT_STATE <= SET_HOURS;
                     NEXT_HOURS <= '1';
        elsif ( TIME_BUTTON='1' and
		HOURS_BUTTON='0' and
		MINUTES_BUTTON='1' ) then
                     NEXT_STATE <= SET_MINUTES;
                     NEXT_MINS <= '1';
        else
                     NEXT_STATE <= COUNT_TIME;
                     NEXT_SECS <= '1';
        end if;

      when SET_HOURS =>
        if ( TIME_BUTTON='1' and 
             HOURS_BUTTON='1' and 
             MINUTES_BUTTON='0' ) then
                     NEXT_STATE <= SET_HOURS;
                     NEXT_HOURS <= '0';
        else
                     NEXT_STATE <= COUNT_TIME;
                     NEXT_SECS <= '1';
        end if;

      when SET_MINUTES =>
	if ( TIME_BUTTON='1' and 
             HOURS_BUTTON='0' and
             MINUTES_BUTTON='1' ) then
           	  NEXT_STATE <= SET_MINUTES;
           	  NEXT_MINS <= '0';
	else
           	  NEXT_STATE <= COUNT_TIME;
           	  NEXT_SECS <= '1';
	end if;
    end case;
  end process COMBIN;

  SYNCH : process (CLK, RESETN) begin
    if (RESETN = '0') then
       CURRENT_STATE <= COUNT_TIME;
       SECS <= '0';
       HOURS <= '0';
       MINS <= '0';
    elsif (CLK'event and CLK = '1') then
       CURRENT_STATE <= NEXT_STATE;
       SECS <= NEXT_SECS;
       HOURS <= NEXT_HOURS;
       MINS <= NEXT_MINS;
    end if;
  end process SYNCH;
end RTL;


--------------------------------------------------
-- CURRENT-TIME MONITOR --------------------------
--
-- File: TIME_BLOCK.vhd
-- Task: Monitor and set the current time.
--------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity TIME_BLOCK is
  port( SET_TIME:in       STD_LOGIC;
        HRS,MINS,CLK:in   STD_LOGIC;
        RESETN:in         STD_LOGIC;
        ENABLE:in         STD_LOGIC;
        HRS_OUT:buffer   INTEGER range 1 to 12;
        MINS_OUT:buffer   INTEGER range 0 to 59;
        AM_PM_OUT:buffer   STD_LOGIC;
        DISPLAY_BUS:out STD_LOGIC_VECTOR(10 downto 0)
  );
end TIME_BLOCK;


architecture NET of TIME_BLOCK is

  component TIME_STATE_MACHINE
    port( TIME_BUTTON:in STD_LOGIC;
          HOURS_BUTTON:in STD_LOGIC;
          MINUTES_BUTTON:in STD_LOGIC;
          CLK:in    STD_LOGIC;
          RESETN:in STD_LOGIC;
          SECS:out  STD_LOGIC;
          HOURS:out STD_LOGIC;
          MINS:out  STD_LOGIC
    );
  end component;

  component TIME_COUNTER 
    port( SECS:in  STD_LOGIC;
          HOURS:in STD_LOGIC;
          MINS:in  STD_LOGIC;
          CLK:in   STD_LOGIC;
          RESETN:in STD_LOGIC;
          HOURS_OUT:buffer INTEGER range 1 to 12;
          MINUTES_OUT:buffer INTEGER range 0 to 59;
          AM_PM_OUT:buffer STD_LOGIC
    );
  end component;

  signal CONNECT3,CONNECT4,CONNECT5: STD_LOGIC;

  begin
  U1:TIME_STATE_MACHINE
    port map( SET_TIME, HRS, MINS, CLK, RESETN, CONNECT5, CONNECT3, CONNECT4 );

  U2:TIME_COUNTER
    port map( CONNECT5, CONNECT3, CONNECT4, CLK, RESETN, HRS_OUT, MINS_OUT, 
       AM_PM_OUT );

  CLOCK_DISPLAY : process( ENABLE, HRS_OUT, MINS_OUT ) begin
    if (ENABLE='1') then
       DISPLAY_BUS <= AM_PM_OUT &
                      CONV_STD_LOGIC_VECTOR(HRS_OUT,4) &
                      CONV_STD_LOGIC_VECTOR(MINS_OUT,6);
    else
       DISPLAY_BUS <= "ZZZZZZZZZZZ";
    end if;
  end process CLOCK_DISPLAY;
end NET;

