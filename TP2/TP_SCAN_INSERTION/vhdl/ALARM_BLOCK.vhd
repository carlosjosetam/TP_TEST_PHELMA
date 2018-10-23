--------------------------------------------------
-- ALARM COUNTER SUBBLOCK ------------------------
--
-- File: ALARM_COUNTER.vhd
-- Path: ~/TST/WATCH/VHDL
-- Task: 
--------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity ALARM_COUNTER is
  port( HOURS:in 	 STD_LOGIC;
        MINS:in		 STD_LOGIC;
        CLK:in		 STD_LOGIC;
        RESETN:in	 STD_LOGIC;
        HRS_OUT:buffer INTEGER range 1 to 12 := 12;
        MINUTES_OUT:buffer INTEGER range 0 to 59 := 0;
        AM_PM_OUT:buffer STD_LOGIC := '0'
  );
end ALARM_COUNTER;


architecture RTL of ALARM_COUNTER is
begin
  process (CLK, RESETN) begin
        if (RESETN = '0') then
           HRS_OUT <= 12;
           MINUTES_OUT <= 0;
           AM_PM_OUT <= '0';
        elsif (CLK'event and CLK = '1') then
           MINUTES_OUT <= MINUTES_OUT;
           HRS_OUT <= HRS_OUT;
           AM_PM_OUT <= AM_PM_OUT;
   
           if (MINS = '1' and HOURS = '0') then
              if (MINUTES_OUT = 59) then
                 MINUTES_OUT <= 0;
                 if (HRS_OUT = 12) then
                    HRS_OUT <= 1;
                    AM_PM_OUT <= not AM_PM_OUT;
                 else
                    HRS_OUT <= HRS_OUT + 1;
                 end if;
              else
                 MINUTES_OUT <= MINUTES_OUT + 1;
              end if;
           elsif (HOURS = '1' and MINS = '0') then
              if (HRS_OUT = 12) then
                 HRS_OUT <= 1;
                 AM_PM_OUT <= not AM_PM_OUT;
              else
                 HRS_OUT <= HRS_OUT + 1;
              end if;
           end if;
        end if;
  end process;
end RTL;


--------------------------------------------------
-- ALARM STATE MACHINE ---------------------------
--
-- File: ALARM_STATE_MACHINE.vhd
-- Task: Controls ALARM_COUNTER.
--------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity ALARM_STATE_MACHINE is
  port( ALARM_BUTTON,HOURS_BUTTON:in STD_LOGIC;
        MINUTES_BUTTON,CLK:in        STD_LOGIC;
        RESETN:in                    STD_LOGIC;
        HOURS,MINS:out               STD_LOGIC
  );
end ALARM_STATE_MACHINE;


architecture RTL of ALARM_STATE_MACHINE is

type STATE_TYPE is (IDLE,SET_HOURS,SET_MINUTES);
signal CURRENT_STATE: STATE_TYPE;
signal NEXT_STATE:    STATE_TYPE;
signal NEXT_HOURS, NEXT_MINS : STD_LOGIC;

begin
  COMBIN:
  process( CURRENT_STATE, ALARM_BUTTON,
           HOURS_BUTTON, MINUTES_BUTTON )
  begin
    NEXT_STATE <= CURRENT_STATE;
    NEXT_HOURS <= '0';
    NEXT_MINS <= '0';

    case CURRENT_STATE is

      when IDLE =>
        if ( ALARM_BUTTON='1' and 
             HOURS_BUTTON='1' and 
             MINUTES_BUTTON='0' ) then
                     NEXT_STATE <= SET_HOURS;
                     NEXT_HOURS <= '1';
        elsif ( ALARM_BUTTON='1' and 
                HOURS_BUTTON='0' and
                MINUTES_BUTTON='1' ) then
                     NEXT_STATE <= SET_MINUTES;
                     NEXT_MINS <= '1';
        else
                     NEXT_STATE <= IDLE;
        end if;

      when SET_HOURS =>
        if ( ALARM_BUTTON='1' and 
             HOURS_BUTTON='1' and 
             MINUTES_BUTTON='0' ) then
                     NEXT_STATE <= SET_HOURS;
                     NEXT_HOURS <= '0';
        else
                     NEXT_STATE <= IDLE;
        end if;

      when SET_MINUTES =>
        if ( ALARM_BUTTON='1' and
             HOURS_BUTTON='0' and
             MINUTES_BUTTON='1' ) then
                     NEXT_STATE <= SET_MINUTES;
                     NEXT_MINS <= '0';
        else
                     NEXT_STATE <= IDLE;
        end if;
    end case;
  end process;

  SYNCH : process ( CLK, RESETN ) begin
     if (RESETN = '0') then
        CURRENT_STATE <= IDLE;
        HOURS <= '0';
        MINS <= '0';
     elsif (CLK'event and CLK = '1') then
        CURRENT_STATE <= NEXT_STATE;
        HOURS <= NEXT_HOURS;
        MINS <= NEXT_MINS;
     end if;
  end process;
end RTL;


--------------------------------------------------
-- ALARM BLOCK MODULE ----------------------------
--
-- File: ALARM_BLOCK.vhd
-- Task: Set alarm time.
--------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity ALARM_BLOCK is
  port( ALARM:in         STD_LOGIC;
        HRS,MINS,CLK:in  STD_LOGIC;
        RESETN:in        STD_LOGIC;
        ENABLE:in        STD_LOGIC;
        HRS_OUT:buffer  INTEGER range 1 to 12;
        MINS_OUT:buffer INTEGER range 0 to 59;
        AM_PM_OUT:buffer STD_LOGIC;
        DISPLAY_BUS:out STD_LOGIC_VECTOR(10 downto 0)
  );
end ALARM_BLOCK;


architecture NET of ALARM_BLOCK is

  component ALARM_STATE_MACHINE
    port( ALARM_BUTTON: in STD_LOGIC;
	  HOURS_BUTTON: in STD_LOGIC;
	  MINUTES_BUTTON: in STD_LOGIC;
	  CLK:in STD_LOGIC;
	  RESETN:in STD_LOGIC;
	  HOURS:out STD_LOGIC;
	  MINS:out STD_LOGIC
    );
  end component;

  component ALARM_COUNTER
    port( HOURS:in STD_LOGIC;
	  MINS:in STD_LOGIC;
	  CLK:in STD_LOGIC;
	  RESETN:in STD_LOGIC;
	  HRS_OUT:buffer   INTEGER range 1 to 12;
	  MINUTES_OUT:buffer INTEGER range 0 to 59;
	  AM_PM_OUT:buffer   STD_LOGIC
    );
  end component;

  signal CONNECT1,CONNECT2: STD_LOGIC;

begin
  U0:ALARM_STATE_MACHINE
    port map ( ALARM, HRS, MINS, CLK, RESETN, CONNECT1, CONNECT2 );

  U3:ALARM_COUNTER
    port map ( CONNECT1, CONNECT2, CLK, RESETN, HRS_OUT, MINS_OUT, AM_PM_OUT );

  TIME_DISPLAY : process( ENABLE, HRS_OUT, MINS_OUT )
  begin
    if (ENABLE='1') then
      DISPLAY_BUS <= AM_PM_OUT &
                     CONV_STD_LOGIC_VECTOR(HRS_OUT,4) &
                     CONV_STD_LOGIC_VECTOR(MINS_OUT,6);
    else
      DISPLAY_BUS <= "ZZZZZZZZZZZ";
    end if;
  end process TIME_DISPLAY;
end NET;

