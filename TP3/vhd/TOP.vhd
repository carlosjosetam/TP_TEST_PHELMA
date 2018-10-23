library IEEE ;
use IEEE.std_logic_1164.ALL ;
-- library ARITHMETIC;
use IEEE.STD_LOGIC_ARITH.ALL;

entity TOP
 is
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
		
end TOP;


architecture B of TOP is

component ALU is
	port(	A,B		: in STD_LOGIC_VECTOR(3 downto 0) ;
		CMD		: in STD_LOGIC_VECTOR(2 downto 0) ;
		S		: out STD_LOGIC_VECTOR(3 downto 0)) ;
end component;

component LFSR
 is
	port(	Reset		: in STD_LOGIC;
		MODE		: in STD_LOGIC; -- '0' for LFSR | '1' for SR
		SIN		: in STD_LOGIC;
		Clk		: in STD_LOGIC;
		SOUT		: out STD_LOGIC;
		S		: out STD_LOGIC_VECTOR(10 downto 0)) ;
		
end component;

component MISR
 is
	port(	Reset		: in STD_LOGIC;
		TEST		: in STD_LOGIC; -- '1' for TEST mode | '0' for NORMAL mode
		MODE		: in STD_LOGIC; -- '0' for MISR | '1' for SR
		Paralel_MISR 	: in STD_LOGIC_VECTOR(3 downto 0);
		SIN		: in STD_LOGIC;
		Clk		: in STD_LOGIC;
		SOUT		: out STD_LOGIC;
		Out_MISR	: out STD_LOGIC_VECTOR(3 downto 0)) ;
		
end component;

signal Parallel_out_LFSR, MUX_out : STD_LOGIC_VECTOR(10 downto 0);
signal ALU_out : STD_LOGIC_VECTOR(3 downto 0);
signal LFSR_serial_out : STD_LOGIC;

begin

process (TEST, Clk)
begin
	case TEST is
	when '0' => MUX_out <= A & B & CMD;
	when '1' => MUX_out <= Parallel_out_LFSR;
	when others => MUX_out <= "-----------";
	end case;
end process;

S_LFSR : LFSR port map (Reset, MODE_LFSR, SIN, Clk, LFSR_serial_out, Parallel_out_LFSR);

S_MISR : MISR port map (Reset, TEST, MODE_MISR, ALU_out, LFSR_serial_out, Clk, SOUT_MISR, Out_MISR);

S_ALU : ALU port map(MUX_out(10 downto 7), MUX_out(6 downto 3), MUX_out(2 downto 0), ALU_out);


end B;









