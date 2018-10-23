library IEEE ;
use IEEE.std_logic_1164.ALL ;
-- library ARITHMETIC;
use IEEE.STD_LOGIC_ARITH.ALL;

entity LFSR
 is
	port(	Reset		: in STD_LOGIC;
		MODE		: in STD_LOGIC; -- '0' for LFSR | '1' for SR
		SIN		: in STD_LOGIC;
		Clk		: in STD_LOGIC;
		SOUT		: out STD_LOGIC;
		S		: out STD_LOGIC_VECTOR(10 downto 0)) ;
		
end LFSR;


architecture B of LFSR is

component Flip_Flop
	port(	D		: in STD_LOGIC;
		Clk		: in STD_LOGIC;
		Reset		: in STD_LOGIC;
		Q		: out STD_LOGIC) ;
end component;

signal S_aux : STD_LOGIC_VECTOR(10 downto 0);
signal LFSR_in : STD_LOGIC;

begin

	S <= S_aux;

	GEN_LFSR :
	for I in 1 to 10 generate
     		 FFDX : Flip_Flop port map (S_aux(I), Clk, Reset, S_aux(I-1));
   	end generate GEN_LFSR;

	MUX : process (MODE, Clk) begin case MODE is
			when '0' => LFSR_in <= S_aux(2) xor S_aux(0);
			when '1' => LFSR_in <= SIN;
			when others => LFSR_in <= '0';
		end case;
		end process;

	SOUT <= S_aux(0);

	FFD_11 : Flip_Flop port map (LFSR_in, Clk, Reset, S_aux(10));
	
end B;









