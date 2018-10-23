library IEEE ;
use IEEE.std_logic_1164.ALL ;
-- library ARITHMETIC;
use IEEE.STD_LOGIC_ARITH.ALL;

entity MISR
 is
	port(	Reset		: in STD_LOGIC;
		TEST		: in STD_LOGIC; -- '1' for TEST mode | '0' for NORMAL mode
		MODE		: in STD_LOGIC; -- '0' for MISR | '1' for SR
		Paralel_MISR 	: in STD_LOGIC_VECTOR(3 downto 0);
		SIN		: in STD_LOGIC;
		Clk		: in STD_LOGIC;
		SOUT		: out STD_LOGIC;
		Out_MISR	: out STD_LOGIC_VECTOR(3 downto 0)) ;
		
end MISR;


architecture B of MISR is

component Flip_Flop
	port(	D		: in STD_LOGIC;
		Clk		: in STD_LOGIC;
		Reset		: in STD_LOGIC;
		Q		: out STD_LOGIC) ;
end component;

signal S_aux: STD_LOGIC_VECTOR(3 downto 0);
signal MISR_in : STD_LOGIC;
signal Reset_s : STD_LOGIC;
signal signal_aux_0, signal_aux_1, signal_aux_2, signal_aux_3 : STD_LOGIC;

begin
	Reset_s <= Reset;
	Out_MISR <= S_aux;
	

	GEN_MISR :
	for I in 1 to 2 generate
     		 
   	end generate GEN_MISR;
	FFD_0 : Flip_Flop port map ( signal_aux_0, Clk, Reset_s, S_aux(0));
	FFD_1 : Flip_Flop port map ( signal_aux_1, Clk, Reset_s, S_aux(1));
	FFD_2 : Flip_Flop port map ( signal_aux_2, Clk, Reset_s, S_aux(2));
	FFD_3 : Flip_Flop port map ( signal_aux_3, Clk, Reset_s, S_aux(3));

	MUX : process (MODE, Clk) begin case MODE is
			when '0' => MISR_in <= S_aux(3) xor Paralel_MISR(0);
			when '1' => MISR_in <= SIN;
			when others => MISR_in <= '0';
		end case;
		end process;

	MUX2 : process (TEST, Clk, MODE)

			variable MODE_CONCATENATE : std_logic_vector(1 downto 0);
			begin
			MODE_CONCATENATE := TEST & MODE;

			case (MODE_CONCATENATE) is
			when "00" => -- chargement Parallele
				signal_aux_0 <= Paralel_MISR(0);
				signal_aux_1 <= Paralel_MISR(1);
				signal_aux_2 <= Paralel_MISR(2);
				signal_aux_3 <= Paralel_MISR(3);
			when "01" => -- chargement Parallele
				signal_aux_0 <= Paralel_MISR(0);
				signal_aux_1 <= Paralel_MISR(1);
				signal_aux_2 <= Paralel_MISR(2);
				signal_aux_3 <= Paralel_MISR(3);
			when "10" => 
				signal_aux_0 <= MISR_in;
				signal_aux_1 <= S_aux(0) xor Paralel_MISR(1);
				signal_aux_2 <= S_aux(1) xor Paralel_MISR(2);
				signal_aux_3 <= S_aux(2) xor Paralel_MISR(3) xor S_aux(3);
			when "11" => 
				signal_aux_0 <= MISR_in;
				signal_aux_1 <= S_aux(0);
				signal_aux_2 <= S_aux(1);
				signal_aux_3 <= S_aux(2);
			when others =>
				signal_aux_0 <= 'U';
				signal_aux_1 <= 'U';
				signal_aux_2 <= 'U';
				signal_aux_3 <= 'U';
		end case;
		end process;

	SOUT <= S_aux(3);

	

end B;









