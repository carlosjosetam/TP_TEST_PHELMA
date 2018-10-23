-- Decodeur pour code hamming
-- 11 bits of data
-- 4 bits of parity
-- 1 bit for double error check
-- m = [pov p1 p2 d3 p4 d5 d6 d7 p8 d9 d10 d11 d12 d13 d14 d15]
-- S = S = v. T(H) et sov= v0+v1+v2+v3+...+v15
-- Si sov=0   (s4 s3 s2 s1)= 0 alors pas d’erreurs
-- 						(s4 s3 s2 s1) différent de 0 alors erreur double (pas de correction)
-- Si sov=1   erreur simple correction avec la valeur de (s4 s3 s2 s1)


library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;

entity DECODEUR is
	port(
		DECODEUR_IN		:	in 	std_logic_vector(4 downto 0);
		DOUBLE_ERROR	: out	std_logic;
		NO_ERROR			: out std_logic;
		BIT_POSITION	: out std_logic_vector(14 downto 0)
		);
end DECODEUR;

architecture A of DECODEUR is

signal DECOD : std_logic_vector(14 downto 0);

begin
	GEN_OUT : process (DECODEUR_IN)
	begin
		if sov = 1 then
			DOUBLE_ERROR <= '0';
			NO_ERROR <= '1';
			BIT_POSITION <= DECOD;
		elsif S(4 downto 1) = "0000" then -- sov = 0 and no error
			DOUBLE_ERROR <= '0';
			NO_ERROR < = '0';
			BIT_POSITION <= "ZZZZZZZZZZZZZZZ";
		else then -- no correction
			DOUBLE_ERROR <= '1';
			NO_ERROR < = '1';
			BIT_POSITION <= "ZZZZZZZZZZZZZZZ";
		end if;
	end process;

	GEN_DECOD : process (DECODEUR_IN)
	begin
		case( DECODEUR_IN(4 downto 1) ) is
			when "0000" => DECOD <= "00000000000000";
			when "0001" => DECOD <= "00000000000001";
			when "0010" => DECOD <= "00000000000010";
			when "0011" => DECOD <= "00000000000100";
			when "0100" => DECOD <= "00000000001000";
			when "0101" => DECOD <= "00000000010000";
			when "0110" => DECOD <= "00000000100000";
			when "0111" => DECOD <= "00000001000000";
			when "1000" => DECOD <= "00000010000000";
			when "1001" => DECOD <= "00000100000000";
			when "1010" => DECOD <= "00001000000000";
			when "1011" => DECOD <= "00010000000000";
			when "1100" => DECOD <= "00100000000000";
			when "1101" => DECOD <= "01000000000000";
			when "1110" => DECOD <= "10000000000000";
			when others => DECOD <= "00000000000000";
		end case;
		end process;

end A;
