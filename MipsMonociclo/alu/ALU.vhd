library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ALU is
	port(
		op: in std_logic_vector( 2 downto 0 );
		a, b: in std_logic_vector( 31 downto 0 );
		zero: out std_logic;
		result: out std_logic_vector( 31 downto 0 )
	);
end entity;

architecture ALUAlg of ALU is
	signal res: std_logic_vector (31 downto 0);
begin

	process(op,a,b)

	begin
		if( op = "000" )then
			res <= a and b;
		elsif( op = "001" )then
			res <= a or b;
		elsif( op = "010" )then
			res <= a + b;
		elsif( op = "110" )then
			res <= a - b;
		elsif( op = "111" )then
			if( a < b )then
				res <= "00000000000000000000000000000001";
			else 
				res <= "00000000000000000000000000000000";
			end if;
		end if;
--
--		if( a = b )then
--			zero <= '1';
--		else
--			zero <= '0';
--		end if;
	end process;
	zero <= '1' when res = x"00000000"
	else '0';
	result <= res;
end architecture; 