library ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Extends26To32 is
	port(
		e26: in std_logic_vector( 25 downto 0 );
		o: out std_logic_vector( 31 downto 0 )
	);
end entity;

architecture Extends26To32Alg of Extends26To32 is

begin
	o <= std_logic_vector(resize( signed(e26), 32 ) );
end architecture;
