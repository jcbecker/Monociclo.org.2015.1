library ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all;

--Este mux vai escolher em qual registrador vai
--ser realizado a escrita. ( Write register ).
entity Mux5Bit is
	port(
		s: in std_logic;
		a20_16, b15_11: in std_logic_vector( 4 downto 0 );
		o: out std_logic_vector( 4 downto 0 )
	);
end Mux5Bit;

architecture Mux5BitALg of Mux5Bit is

begin
	process( s )

	begin 
		if( s = '0' ) then
			o <= a20_16;
		else
			o <= b15_11;
		end if;
	end process;
end architecture;