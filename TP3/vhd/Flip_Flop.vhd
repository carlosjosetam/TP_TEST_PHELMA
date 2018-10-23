library IEEE ;
use IEEE.std_logic_1164.ALL ;
-- library ARITHMETIC;
use IEEE.STD_LOGIC_ARITH.ALL;

entity Flip_Flop
 is
	port(	D		: in STD_LOGIC;
		Clk		: in STD_LOGIC;
		Reset		: in STD_LOGIC;
		Q		: out STD_LOGIC) ;
		
end Flip_Flop;


architecture C of Flip_Flop is

begin
 
    P_Flip_Flop : process (Clk,Reset,D)
    
    	begin
	 if Reset = '1' then
		Q <= '0';
	 elsif Clk'event and Clk = '1' then
		Q <= D;
	 end if;
	end process;
	
end C;
