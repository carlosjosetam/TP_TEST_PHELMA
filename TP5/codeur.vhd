-- codeur module

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;

entity CODEUR is 
	port(
		DIN		: in 	std_logic_vector(11 downto 1);		-- Data In
		DOUT		: out	std_logic_vector(15 downto 0)		-- Data Out
		
	);
end CODEUR;

architecture A of CODEUR is

signal P : std_logic_vector(5 downto 1);
 
begin
		
			P(1) <= DIN(1)xor DIN(2)xor DIN(4)xor DIN(5)xor DIN(7)xor DIN(9) xor DIN(11);
			P(2) <= DIN(1)xor DIN(3)xor DIN(4)xor DIN(6)xor DIN(7)xor DIN(10) xor DIN(11);
			P(3) <= DIN(2)xor DIN(3)xor DIN(4)xor DIN(8)xor DIN(9)xor DIN(10) xor DIN(11);
			P(4) <= DIN(9)xor DIN(6)xor DIN(7)xor DIN(8)xor DIN(9)xor DIN(10) xor DIN(11);
			P(5) <= P(1)xor P(2) xor DIN(1) xor P(3) xor DIN(2) xor DIN(3) xor DIN(4) xor  P(4) xor DIN(5) xor DIN(6)xor DIN(7)xor DIN(8) xor DIN(9) xor DIN(10) xor DIN(11);


DOUT <= DIN(11) & DIN(10)& DIN(9) & DIN(8) & DIN(7) & DIN(6) & DIN(5) & P(4) &  DIN(4) & DIN(3) & DIN(2)& P(3)& DIN(1) & P(2) & P(1) & P(5);

end A;
