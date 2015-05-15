library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity PC is
	port(
		clk: in std_logic;
		q: in std_logic_vector( 31 downto 0 );
		d: out std_logic_vector( 31 downto 0 )
	);
end entity;

architecture PCAlg of PC is
begin

	process( clk )
	begin
		if( clk'event and clk = '1' ) then
			d <= q;
		end if;
	end process;
end architecture;	