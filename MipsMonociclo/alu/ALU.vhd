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

begin

	process(a,b)

	begin
		if( op = "000" )then
			result <= a and b;
		elsif( op = "001" )then
			result <= a or b;
		elsif( op = "010" )then
			result <= a + b;
		elsif( op = "010" )then
			result <= a - b;
		elsif( op = "010" )then
			if( a < b )then
				result <= "00000000000000000000000000000001";
			else 
				result <= "00000000000000000000000000000000";
			end if;
		end if;

		if( a = b )then
			zero <= '1';
		else
			zero <= '0';
		end if;
	end process;
end architecture; 