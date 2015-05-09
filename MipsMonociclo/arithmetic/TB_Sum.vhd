library ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all;

entity TB_Sum is
end entity;

architecture TB_SumAlg of TB_Sum is

	Component Sum is
		port(
			clk: in std_logic;
			a, b: in std_logic_vector( 31 downto 0 );
			o: out std_logic_vector( 31 downto 0 )
		);
	end Component;
	
	signal cl: std_logic;
	signal o1, o2, r: std_logic_vector( 31 downto 0 );
begin
	TBSum: Sum port map(cl,o1,o2,r);
	process
	begin
		o1 <= "00000000000000000000000000000110"; -- 6
		o2 <= "00000000000000000000000000000111"; -- 7

		cl <= '0';
		wait for 10 ns;
		cl <= '1';
		wait for 10 ns;
		
		assert( r = "00000000000000000000000000001101" ) report "Resposta errada linha 33." severity error;

		o1 <= "00000000000000000000000000000001"; -- 1
		o2 <= "00000000000000000000000000000111"; -- 7

		cl <= '0';
		wait for 10 ns;
		cl <= '1';
		wait for 10 ns;
		
		assert( r = "00000000000000000000000000001000" ) report "Resposta errada linha 43." severity error;
	end process;
end architecture;