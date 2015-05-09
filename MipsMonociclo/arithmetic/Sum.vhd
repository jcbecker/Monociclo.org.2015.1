library ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all;

entity Sum is
	port(
		clk: in std_logic;
		a, b: in std_logic_vector( 31 downto 0 );
		o: out std_logic_vector( 31 downto 0 )
	);
end entity;

architecture SumAlg of Sum is

begin

	process(clk)

	begin
		if( clk'event and clk = '1' ) then
			o <= a + b;
		end if;
	end process;	
end architecture;