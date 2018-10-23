--------------------------------------------------
-- COMPUTE BLOCK ---------------------------------
--
-- File: COMPUTE_BLOCK.vhd
-- Task: 
--------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity COMPUTE_BLOCK is
  port( SET_TIME,ALARM:in STD_LOGIC;
        HRS,MINS:in STD_LOGIC;
        TOGGLE_SWITCH,CLK, TM_FIX:in STD_LOGIC;
        RESETN: in STD_LOGIC;
        TIM_DISPLAY:out STD_LOGIC_VECTOR(10 downto 0);
        ALM_DISPLAY:out STD_LOGIC_VECTOR(10 downto 0);
        SPEAKER_OUT:out STD_LOGIC
  );
end COMPUTE_BLOCK;


architecture NET of COMPUTE_BLOCK is

  component COMPARATOR
    port( ALARM_HRS:in STD_LOGIC_VECTOR(3 downto 0);
	  TIME_HRS:in STD_LOGIC_VECTOR(3 downto 0);
	  ALARM_MINS:in STD_LOGIC_VECTOR(5 downto 0);
	  TIME_MINS:in STD_LOGIC_VECTOR(5 downto 0);
          ALARM_AM_PM, TIME_AM_PM:in STD_LOGIC;
	  RINGER:out STD_LOGIC
    );
  end component;

  component TIME_BLOCK
    port( SET_TIME, HRS, MINS:in  STD_LOGIC;
          CLK, RESETN, ENABLE:in  STD_LOGIC;
          HRS_OUT:buffer STD_LOGIC_VECTOR (3 downto 0);
          MINS_OUT:buffer STD_LOGIC_VECTOR (5 downto 0);
          AM_PM_OUT:buffer STD_LOGIC;
          DISPLAY_BUS:out STD_LOGIC_VECTOR (10 downto 0)
    );
  end component;

  component ALARM_BLOCK
    port( ALARM, HRS, MINS:in STD_LOGIC;
          CLK, RESETN, ENABLE:in STD_LOGIC;
          HRS_OUT:buffer STD_LOGIC_VECTOR (3 downto 0);
          MINS_OUT:buffer STD_LOGIC_VECTOR (5 downto 0);
          AM_PM_OUT:buffer STD_LOGIC;
          DISPLAY_BUS:out STD_LOGIC_VECTOR (10 downto 0)
    );
  end component;

  component ALARM_SM_2
    port(
          COMPARE_IN, TOGGLE_ON:in STD_LOGIC;
          CLOCK:in STD_LOGIC;
          RESETN:in STD_LOGIC;
          RING:out STD_LOGIC
    );
  end component;

  component CLOCK_GEN
    port( CLK:in STD_LOGIC; 
          RESETN:in STD_LOGIC;
          INT_CLK:out STD_LOGIC
    );
  end component;

  signal INT_CLK:   STD_LOGIC;
  signal ALM_AM_PM: STD_LOGIC;
  signal TIM_AM_PM: STD_LOGIC; 
  signal TIM_HRS:  STD_LOGIC_VECTOR(3 downto 0);
  signal TIM_MINS:  STD_LOGIC_VECTOR(5 downto 0);
  signal ALM_HRS:  STD_LOGIC_VECTOR(3 downto 0);
  signal ALM_MINS: STD_LOGIC_VECTOR(5 downto 0);
  signal KONNECT12: STD_LOGIC; 
  signal ALARM_NOT: STD_LOGIC;

  begin
  U7:CLOCK_GEN
    port map( CLK => CLK, 
              RESETN => RESETN,
              INT_CLK => INT_CLK
    );

  ALARM_NOT <= not (ALARM);
  U1:TIME_BLOCK
    port map( SET_TIME => SET_TIME,
              HRS => HRS,
              MINS => MINS,
              CLK => INT_CLK,
              RESETN => RESETN,
              ENABLE => ALARM_NOT,
              HRS_OUT => TIM_HRS,
              MINS_OUT => TIM_MINS,
              AM_PM_OUT => TIM_AM_PM,
              DISPLAY_BUS => TIM_DISPLAY
    );

  U2:ALARM_BLOCK
    port map( ALARM => ALARM,
	      HRS => HRS,
	      MINS => MINS, 
	      CLK => INT_CLK,
              RESETN => RESETN,
	      ENABLE => ALARM,
	      HRS_OUT => ALM_HRS,
	      MINS_OUT => ALM_MINS,
	      AM_PM_OUT => ALM_AM_PM,
	      DISPLAY_BUS => ALM_DISPLAY
    );

  U4:COMPARATOR
    port map( ALARM_HRS => ALM_HRS,
	      TIME_HRS => TIM_HRS, 
	      ALARM_MINS => ALM_MINS,
	      TIME_MINS => TIM_MINS,
	      ALARM_AM_PM => ALM_AM_PM,
	      TIME_AM_PM => TIM_AM_PM,
	      RINGER => KONNECT12
    );

  U5:ALARM_SM_2
    port map( COMPARE_IN => KONNECT12,
	      TOGGLE_ON => TOGGLE_SWITCH,
	      CLOCK => INT_CLK,
              RESETN => RESETN,
	      RING => SPEAKER_OUT
    );

end NET;
