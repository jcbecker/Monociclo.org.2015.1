library ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Extends16To32 is
	port(
		e: in std_logic_vector( 15 downto 0 );
		o: out std_logic_vector( 31 downto 0 )
	);
end entity;

architecture Extends16To32Alg of Extends16To32 is

begin
	o <= std_logic_vector(resize( signed(e), 32 ) );
end architecture;