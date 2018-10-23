library IEEE ;
use IEEE.std_logic_1164.ALL ;
-- library ARITHMETIC;
use IEEE.STD_LOGIC_ARITH.ALL;

entity ALU is
	port(	A,B		: in STD_LOGIC_VECTOR(3 downto 0) ;
		CMD		: in STD_LOGIC_VECTOR(2 downto 0) ;
		S		: out STD_LOGIC_VECTOR(3 downto 0)) ;
		
end ALU;

architecture A of ALU is

begin
 
    P_ALU : process (A, B, CMD)
    
    	begin
		case CMD is
			when "000" => S<= conv_std_logic_vector((UNSIGNED(A) - UNSIGNED(B)), 4);
			when "001" => S<= conv_std_logic_vector((UNSIGNED(A)+ UNSIGNED(B)), 4);
			when "010" => S<= conv_std_logic_vector((UNSIGNED(A) + UNSIGNED'("0001")), 4);
			when "011" => S<= A;
			when "100" => S<= A or B;
			when "101" => S<= A and B;
			when "110" => S<= A xor B;
			when "111" => S<= not A ;
			when others => S<= "----";
		end case;
	end process P_ALU;
	
end A;

