library ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all;

entity TB_Mux32Bit is
end TB_Mux32Bit;

architecture TB_Mux32BitALg of TB_Mux32Bit is

	component Mux32Bit is
		port(
			s: in std_logic;
			a, b: in std_logic_vector( 31 downto 0 );
			o: out std_logic_vector( 31 downto 0 )
		);
	end component;

	signal sel: std_logic;
	signal e1, e2, ans: std_logic_vector( 31 downto 0 );
begin

	TBMux32: Mux32Bit port map( sel, e1, e2, ans ); 
	process

	begin
		e1 <= "11111111111111111111111111111111";
		e2 <= "00000000000000000000000000000000";

		sel <= '0';
		wait for 2 ns;

		assert( ans = "11111111111111111111111111111111" ) report "Resposta errada na linha 33." severity error;

		wait for 2 ns;
		sel <= '1';
		wait for 2 ns;

		assert( ans = "00000000000000000000000000000000" ) report "Resposta errada na linha 39." severity error;
	end process;
end architecture;