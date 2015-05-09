library ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all;

entity ShiftLeft2 is
	port(
		e: in std_logic_vector( 31 downto 0 );
		o: out std_logic_vector( 31 downto 0 )
	);
end entity;

architecture ShiftLeft2Alg of ShiftLeft2 is

begin
	o <= e( 29 downto 0 ) & "00";
end architecture;