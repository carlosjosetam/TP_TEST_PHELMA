-- Generateur de syndrome for a word with
-- 11 bits of data
-- 4 bits of parity
-- 1 bit for double error check
-- m = [pov p1 p2 d3 p4 d5 d6 d7 p8 d9 d10 d11 d12 d13 d14 d15]

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;

entity GEN_SYN is
	port(
		GEN_SYN_IN		:	in 	std_logic_vector(15 downto 0);
		GEN_SYN_OUT		: out 	std_logic_vector(4 downto 0)
		);
end GEN_SYN;

architecture A of GEN_SYN is

signal V : std_logic_vector(15 downto 0);
signal S : std_logic_vector(4 downto 0);


begin
	V <= GEN_SYN_IN;
	GEN_SYN_OUT <= S;

	-- S = [s4 s3 s2 s1 sov]
	-- sov
	S(0) = V(0) xor V(1) xor V(2) xor V(3) xor V(4) xor V(5) xor V(6) xor V(7) xor V(8)  xor V(9)  xor V(10) xor V(11) xor V(12) xor V(13) xor V(14) xor V(15);
	-- s1
	S(1) = V(1) xor V(3) xor V(5) xor V(7) xor V(9) xor V(11) xor V(13) xor V(15);
	-- s2
	S(2) = V(2) xor V(3) xor V(6) xor V(7) xor V(10) xor V(11) xor V(14) xor V(15);
	-- s3
	S(3) = V(4) xor V(5) xor V(6) xor V(7) xor V(12) xor V(13) xor V(14) xor V(15);
	-- s4
	S(4) = V(8) xor V(9) xor V(10) xor V(11) xor V(12) xor V(13) xor V(14) xor V(15);

end A;
