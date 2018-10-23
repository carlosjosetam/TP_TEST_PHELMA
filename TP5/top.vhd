-- codeur module

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;

entity testbench_Hamming  is		
end testbench_Hamming;


architecture B of testbench_Hamming is

component CODEUR is 
	port(
		DIN		: in 	std_logic_vector(11 downto 1);		-- Data In
		DOUT		: out	std_logic_vector(15 downto 0)		-- Data Out
		
	);
end component;


component CORRECTEUR is
	port(
		CORRECTEUR_IN		: in 	std_logic_vector(14 downto 0);
		DATA_IN			: in 	std_logic_vector(15 downto 0);
		DATA_OUT		: out	std_logic_vector(10 downto 0);
		NO_ERROR		: in    std_logic;
		DOUBLE_ERROR		: in    std_logic
		);
end component;

component DECODEUR is
	port(
		DECODEUR_IN		: in 	std_logic_vector(4 downto 0);
		DOUBLE_ERROR		: out	std_logic;
		NO_ERROR		: out std_logic;
		BIT_POSITION		: out std_logic_vector(14 downto 0)
		);
end component;

component GEN_SYN is
	port(
		GEN_SYN_IN		: in 	std_logic_vector(15 downto 0);
		GEN_SYN_OUT		: out 	std_logic_vector(4 downto 0)
		);
end component;

signal DATA_IN_s, DATA_OUT_s	: std_logic_vector(10 downto 0);
signal Codeur_out		: std_logic_vector(15 downto 0);
signal Syndrome_out 		: std_logic_vector(4 downto 0);

signal Signal_DOUBLE_ERROR 	: std_logic;
signal Signal_NO_ERROR		: std_logic;
signal Signal_BIT_POSITION 	: std_logic_vector(14 downto 0);


signal Memory_out 		: std_logic_vector(15 downto 0);

signal trash 			: std_logic_vector(15 downto 0);
	


begin 

Memory_out <= Codeur_out xor trash;

S_CODEUR : CODEUR port map (DATA_IN_s, Codeur_out);

S_GEN_SYN : GEN_SYN port map (Memory_out, Syndrome_out);

S_DECODEUR : DECODEUR port map (Syndrome_out, Signal_DOUBLE_ERROR, Signal_NO_ERROR, Signal_BIT_POSITION);

S_CORRECTEUR : CORRECTEUR port map (Signal_BIT_POSITION, Memory_out, DATA_OUT_s, Signal_NO_ERROR, Signal_DOUBLE_ERROR);

process  
	constant delay : time := 10 ns;           
    begin

	trash <= "0000000000000000";

	-- TEST GEN_SYN changing Memory_out

        DATA_IN_s <= "10101010101";
	wait for delay;

	assert Syndrome_out = "00000" report "ERROR Test GEN_SYN" severity note;
	assert Signal_DOUBLE_ERROR = '0' report "ERROR Test Signal_DOUBLE_ERROR" severity note;
	assert Signal_NO_ERROR = '1' report "ERROR Test Signal_NO_ERROR" severity note;
	assert DATA_OUT_s = "10101010101" report "ERROR Test DATA_OUT_s" severity note;

	-- add SIMPLE ERROR
	DATA_IN_s <= "10101010101";
	trash <= "0000000000000010"; -- invert bit 1, error simple
	wait for delay;

	assert Syndrome_out = "00011" report "ERROR Test GEN_SYN" severity note;
	assert Signal_DOUBLE_ERROR = '0' report "ERROR Test Signal_DOUBLE_ERROR" severity note;
	assert Signal_NO_ERROR = '0' report "ERROR Test Signal_NO_ERROR" severity note;
	assert DATA_OUT_s = "10101010101" report "ERROR Test DATA_OUT_s" severity note;

	-- add DOUBLE ERROR 
	DATA_IN_s <= "10001100001";
	trash <= "0000000100001000"; -- double error
	wait for delay;

	assert Signal_DOUBLE_ERROR = '1' report "ERROR Test Signal_DOUBLE_ERROR" severity note;
	assert Signal_NO_ERROR = '0' report "ERROR Test Signal_NO_ERROR" severity note;
	assert DATA_OUT_s = "10001100000" report "ERROR Test DATA_OUT_s" severity note; -- 
	
	
	assert false report "END OF SIMULATION" severity failure;
 end process;


end B;


