library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity TB_Util is
end entity;

architecture TB_UtilAlg of TB_Util is

	component Extends16To32 is
		port(
			e: in std_logic_vector( 15 downto 0 );
			o: out std_logic_vector( 31 downto 0 )
		);
	end component;

	component ShiftLeft2 is
		port(
			e: in std_logic_vector( 31 downto 0 );
			o: out std_logic_vector( 31 downto 0 )
		);
	end component;

	signal eE: std_logic_vector( 15 downto 0 );
	signal oE, eSL, oSL: std_logic_vector( 31 downto 0 );
begin
	TBExtends: Extends16To32 port map(eE,oE);
	TBShift: ShiftLeft2 port map(eSL,oSL);
	process
	begin
		eE <= "1111111111111111";
		wait for 2 ns;

		assert( oE = "00000000000000001111111111111111" ) report "Resposta errada teste 1." severity error;

		eSL <= "00000000000000000000000000000011";
		wait for 2 ns;

		assert( oSL = "00000000000000000000000000001100" ) report "Resposta errada teste 2." severity error;
	end process;
end architecture;