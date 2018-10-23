--------------------------------------------------
-- DIGITAL CLOCK CHIP CORE -----------------------
--
-- File: CORE.vhd
-- Task: Core-level block.
--------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity CORE is
  port( SET_TIME,ALARM:in  STD_LOGIC;
        HOURS,MINUTES:in   STD_LOGIC;
        TOGGLE:in          STD_LOGIC;
        CLOCK:in           STD_LOGIC;
        RESETN:in          STD_LOGIC;
        SPEAKER:out        STD_LOGIC;
        HR:out             STD_LOGIC_VECTOR(13 downto 0);
        MIN:out            STD_LOGIC_VECTOR(13 downto 0);
        AM_PM:out          STD_LOGIC;
        TEST_MODE:in       STD_LOGIC;
        TEST_SE:in         STD_LOGIC;
        TEST_SI:in         STD_LOGIC
  );
end CORE;


architecture NET of CORE is 

  component COMPUTE_BLOCK 
    port( SET_TIME,ALARM:in    STD_LOGIC;
	  HRS,MINS:in          STD_LOGIC;
	  TOGGLE_SWITCH:in     STD_LOGIC;
	  CLK:in 	       STD_LOGIC;
	  RESETN:in            STD_LOGIC;
	  TM_FIX: in	       STD_LOGIC;
	  TIM_DISPLAY:out      STD_LOGIC_VECTOR(10 downto 0);
	  ALM_DISPLAY:out      STD_LOGIC_VECTOR(10 downto 0);
	  SPEAKER_OUT:out      STD_LOGIC;
    );
  end component;

  component CONVERTOR_CKT
    port( bin_time:in          STD_LOGIC_VECTOR(10 downto 0);
          hr_display:out       STD_LOGIC_VECTOR(13 downto 0);
          min_display:out      STD_LOGIC_VECTOR(13 downto 0);
          am_pm_display:out    STD_LOGIC
    );
  end component;


signal CLK_DISPLAY: STD_LOGIC_VECTOR(10 downto 0);

begin
  U1:COMPUTE_BLOCK
    port map( SET_TIME => SET_TIME,
              ALARM => ALARM,
              HRS => HOURS,
              MINS => MINUTES,
              TOGGLE_SWITCH => TOGGLE,
              CLK => CLOCK,
              RESETN => RESETN,
              TIM_DISPLAY => CLK_DISPLAY,
              ALM_DISPLAY => CLK_DISPLAY,
              SPEAKER_OUT => SPEAKER,
              TM_FIX =>TEST_MODE
    );
  U3:CONVERTOR_CKT
    port map( bin_time => CLK_DISPLAY,
              hr_display => HR,
              min_display => MIN,
              am_pm_display => AM_PM
    );
end NET;
