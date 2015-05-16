library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity PC is
	port(
		clk, reset: in std_logic;
		q: in std_logic_vector( 31 downto 0 );
		d: out std_logic_vector( 31 downto 0 )
	);
end entity;

architecture PCAlg of PC is
	signal ans: std_logic_vector( 31 downto 0 );
begin

	process( clk, reset )
	begin
		if( reset = '1' ) then
			ans <= "00000000000000000000000000000000";
		elsif( clk'event and clk = '1' ) then
			ans <= q;
		end if;
	end process;
	d <= ans;
end architecture;	