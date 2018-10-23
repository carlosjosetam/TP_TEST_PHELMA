library ieee;
use ieee.std_logic_1164.all;

entity bench_TOP is
end entity;  

architecture arch of bench_TOP is

  component TOP is
	port(	A		: in STD_LOGIC_VECTOR(3 downto 0);
		B		: in STD_LOGIC_VECTOR(3 downto 0);
		CMD		: in STD_LOGIC_VECTOR(2 downto 0);
		TEST		: in STD_LOGIC; -- '1' for TEST mode | '0' for NORMAL mode
		MODE_LFSR		: in STD_LOGIC; -- '0' for LFSR | '1' for SR
		MODE_MISR		: in STD_LOGIC; -- '0' for MISR | '1' for SR		
		SIN		: in STD_LOGIC;
		Clk		: in STD_LOGIC;
		Reset		: in STD_LOGIC;
		SOUT_MISR	: out STD_LOGIC;
		Out_MISR	: out STD_LOGIC_VECTOR(3 downto 0)) ;
  end component;

signal A_s, B_s   			: STD_LOGIC_VECTOR(3 downto 0);
signal CMD_s				: STD_LOGIC_VECTOR(2 downto 0);
signal TEST_s				: STD_LOGIC; 
signal MODE_LFSR_s, MODE_MISR_s		: STD_LOGIC; -- '0' for LFSR | '1' for SR
signal SIN_s				: STD_LOGIC;
signal Clk_s				: STD_LOGIC := '0';
signal Reset_s				: STD_LOGIC;
signal SOUT_MISR_s			: STD_LOGIC;
signal Out_MISR_s			: STD_LOGIC_VECTOR(3 downto 0) ;



begin
	S_TOP: TOP port map (A_s, B_s, CMD_s, TEST_s, MODE_LFSR_s, MODE_MISR_s,SIN_s,Clk_s,Reset_s,SOUT_MISR_s,Out_MISR_s);

	CLK_DEF: clk_s <= not clk_s after 5 ns;

	

  process  
	constant delay : time := 10 ns;           
    begin
	Reset_s <= '1';
	A_s <= x"0";
	B_s <= x"7";
	CMD_s <= "001";
	TEST_s <= '0'; 
	MODE_LFSR_s <= '0';
	MODE_MISR_s <= '0';
	SIN_s <= '0';

	wait for delay;

	
	-- test for normal function ALU in NORMAL MODE, MISR in CHARGEMENT
	Reset_s <= '0';
	wait for 2*delay;
	CMD_s <= "000";
	wait for delay;
	CMD_s <= "001";
	wait for delay;
	CMD_s <= "010";
	wait for delay;
	CMD_s <= "011";
	wait for delay;
	CMD_s <= "100";
	wait for delay;
	CMD_s <= "101";
	wait for delay;
	CMD_s <= "110";
	wait for delay;
	CMD_s <= "111";
	wait for delay;

	-- 2
	-- TEST of ALU

	-- 2.1
	TEST_s <= '1';
	MODE_LFSR_s <= '1';
	MODE_MISR_s <= '1';
	-- inicialize MISR with "0000" and LFSR with "01010101010"
	SIN_s <= '0';
	wait for 5*delay;
	SIN_s <= not (SIN_s);
	wait for delay;
	SIN_s <= not (SIN_s);
	wait for delay;
	SIN_s <= not (SIN_s);
	wait for delay;
	SIN_s <= not (SIN_s);
	wait for delay;
	SIN_s <= not (SIN_s);
	wait for delay;
	SIN_s <= not (SIN_s);
	wait for delay;
	SIN_s <= not (SIN_s);
	wait for delay;
	SIN_s <= not (SIN_s);
	wait for delay;
	SIN_s <= not (SIN_s);
	wait for delay;
	SIN_s <= not (SIN_s);
	wait for 2*delay;

	-- 2.2
	-- SIMULATION LFSR and MISR
	MODE_LFSR_s <= '0';
	MODE_MISR_s <= '0';
	CMD_s <= "000";
	wait for delay;
	CMD_s <= "001";
	wait for delay;
	CMD_s <= "010";
	wait for delay;
	CMD_s <= "011";
	wait for delay;
	CMD_s <= "100";
	wait for delay;
	CMD_s <= "101";
	wait for delay;
	CMD_s <= "110";
	wait for delay;
	CMD_s <= "111";
	wait for delay;

	
	assert false report "END OF SIMULATION" severity failure;
 end process;
end arch;
