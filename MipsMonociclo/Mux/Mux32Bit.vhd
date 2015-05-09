library ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

--Este mux vai ser utilizado em varios pontos da arquitetura.
entity Mux32Bit is
	port(
		s: in std_logic;
		a, b: in std_logic_vector( 31 downto 0 );
		o: out std_logic_vector( 31 downto 0 )
	);
end Mux32Bit;

architecture Mux32BitAlg of Mux32Bit is

begin

	process( a, b, s )

	begin
		if( s = '0' )then
			o <= a;
		else
			o <= b;
		end if;
	end process;
end Mux32BitAlg;