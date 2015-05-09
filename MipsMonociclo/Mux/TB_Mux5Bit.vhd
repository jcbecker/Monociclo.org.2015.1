library ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

entity TB_Mux5Bit is
end TB_Mux5Bit;

architecture TB_Mux5BitAlg of TB_Mux5Bit is

	component Mux5Bit is
		port(
			s: in std_logic;
			a20_16, b15_11: in std_logic_vector( 4 downto 0 );
			o: out std_logic_vector( 4 downto 0 )
		);
	end component;

	signal sel: std_logic;
	signal ins20_16, ins15_11, wr: std_logic_vector( 4 downto 0 );
begin
	TBMux5: Mux5Bit port map(sel,ins20_16,ins15_11,wr);
	process
	begin
		wait for 2 ns;
		ins20_16 <= "11111";
		ins15_11 <= "00000";
		sel <= '0';
		wait for 4 ns;

		assert( wr = "11111" ) report "Resposta errada linha 31." severity error;

		wait for 2 ns;
		sel <= '1';
		wait for 4 ns;

		assert( wr = "00000" ) report "Resposta errada linha 37." severity error;		
	end process;

end architecture;
