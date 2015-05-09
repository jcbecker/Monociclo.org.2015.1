library ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all;

--somador tanto para ALU quanto para PC + 4.
entity Sum is
	port(
		a, b: in std_logic_vector( 31 downto 0 );
		o: out std_logic_vector( 31 downto 0 )
	);
end entity;

architecture SumAlg of Sum is

begin
	o <= a + b;
end architecture;