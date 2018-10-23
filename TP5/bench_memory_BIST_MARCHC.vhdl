library ieee;
use ieee.std_logic_1164.all;

entity bench_memory_BIST_MARCHC is
end entity;  

architecture arch of bench_memory_BIST_MARCHC is

  component BIST_MARCHC is
	port(
		CLK		:	in 	std_logic;
		MEM_ADD		:	out	std_logic_vector(9 downto 0);
		MEM_DIN		:	out	std_logic_vector(15 downto 0);
		MEM_DOUT	:	in	std_logic_vector(15 downto 0);
		MEM_CSn		:	out	std_logic;
		MEM_WEn		:	out	std_logic;
		TEST_RUN	: 	in	std_logic;
		TEST_FAIL	:	out	std_logic;
		TEST_SO		:	out	std_logic
	);
  end component;

  component RAM1024X16 is 
	port(
		ADD		: in 	std_logic_vector(9 downto 0);		-- Address Bus
		DIN		: in 	std_logic_vector(15 downto 0);		-- Data In
		DOUT		: out	std_logic_vector(15 downto 0);		-- Data Out
		CSn		: in 	std_logic;				-- Chip Select
		WEn		: in	std_logic;				-- Write Enable
		CLK		: in	std_logic				-- Clock
	);
  end component;


	
signal BIST_ADD_OUT_s  				: STD_LOGIC_VECTOR(9 downto 0);
signal memory_DOUT_s, BIST_DOUT_s	: STD_LOGIC_VECTOR(15 downto 0);
signal WEN_s, CSn_s			: STD_LOGIC; 
signal TEST_RUN_s			: STD_LOGIC;
signal TEST_FAIL_s, TEST_SO_s		: STD_LOGIC;
signal CLK_s				: STD_LOGIC := '0';
signal memory_DIN_s			: STD_LOGIC_VECTOR(15 downto 0);

signal TRASH_s	: STD_LOGIC_VECTOR(15 downto 0) := x"0000";




begin
	memory_DIN_s <= BIST_DOUT_s or TRASH_s; -- TO INSERT ERRORS
		

	bist_S : BIST_MARCHC port map (
		CLK		=> CLK_s,
		MEM_ADD		=> BIST_ADD_OUT_s,
		MEM_DIN		=> BIST_DOUT_s,
		MEM_DOUT	=> memory_DOUT_s,
		MEM_CSn		=> CSn_s,
		MEM_WEn		=> WEN_s,
		TEST_RUN	=> TEST_RUN_s,
		TEST_FAIL	=> TEST_FAIL_s,
		TEST_SO		=> TEST_SO_s);
	
	memory_S : RAM1024X16 port map (
		ADD		=> BIST_ADD_OUT_s,		
		DIN		=> memory_DIN_s,
		DOUT		=> memory_DOUT_s,
		CSn		=> CSn_s,
		WEn		=> WEN_s,
		CLK		=> CLK_s);


	CLK_DEF: CLK_s <= not CLK_s after 5 ns;

	
  process  
	constant delay : time := 10 ns;           
    begin
	
        TEST_RUN_s <= '0';
	wait for 10*delay;


	TEST_RUN_s <= '1'; -- start running with no trash (error)
	wait for 100*delay;

	TRASH_s <= x"DEAD"; -- insertion of error in DIN of memory.
	-- error introduced in sequence SEQ1. Error will be detected in SEQ2.
	wait for delay;

	TRASH_s <= x"0000"; -- continue test with no error
	wait for 12*1024*delay;

	
	assert false report "END OF SIMULATION" severity failure;
 end process;
end arch;
