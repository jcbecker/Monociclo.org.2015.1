library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity TbMipsOrder is
end entity;

architecture TbMipsOrderAlg of TbMipsOrder is
	component MIPS is
		port(
			clkPC, reset: in std_logic;
			newInstAddress, newInst: in std_logic_vector( 31 downto 0 )
		);
	end component;

	signal clkPC, reset: std_logic;
	signal writeInst, inst: std_logic_vector( 31 downto 0 );

begin
	Mips32bit: MIPS port map( clkPC, reset, writeInst, inst);

	process
	variable memAddress: integer;
	begin
		--resetando registrador pc.
		reset <= '0';
		wait for 1 ns;
		reset <= '1';
		wait for 1 ns;
		

		memAddress := 0;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "00000000000000001000000000100000";
		wait for 1 ns;
		

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "00100000000100010000000000001010";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "00100000000010000000000000000001";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "10101110000010000000000000000000";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "00100000000010000000000000000011";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "10101110000010000000000000000100";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "00100000000010000000000000000010";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "10101110000010000000000000001000";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "00100000000010000000000000000101";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "10101110000010000000000000001100";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "00100000000010000000000000000100";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "10101110000010000000000000010000";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "00100000000010000000000000000111";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "10101110000010000000000000010100";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "00100000000010000000000000000110";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "10101110000010000000000000011000";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "00100000000010000000000000001001";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "10101110000010000000000000011100";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "00100000000010000000000000001000";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "10101110000010000000000000100000";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "00100000000010000000000000001010";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "10101110000010000000000000100100";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "00000000000000000010000000100000";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "00000010001000000010100000100000";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "00001100000000000000000000011001";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "00001000000000000000000000111000";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "00000000100000000100000000100000";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "00000011111000000111000000100000";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "00100000101010101111111111111111";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "00100000000011110000000000000001";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "00010000000011110000000000010011";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "00000000000000000111100000100000";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "00000000000000000100100000100000";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "00000001000000001100000000100000";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "00000001001010100110000000101010";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "00010000000011000000000000001101";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "00100011000110010000000000000100";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "10001111000001000000000000000000";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "10001111001001010000000000000000";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "00001100000000000000000000110011";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "00010100000000100000000000000101";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "10001111000010110000000000000000";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "10001111001011010000000000000000";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "10101111000011010000000000000000";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "10101111001010110000000000000000";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "00100000000011110000000000000001";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "00100001001010010000000000000001";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "00100011000110000000000000000100";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------
		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "00001000000000000000000000100001";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------
		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "00001000000000000000000000011101";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------
		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "00000001110000001111100000100000";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------
		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "00000011111000000000000000001000";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------
		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "00000000100001010001000000101010";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------
		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "00010100000000000000000000000010";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------
		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "00100000101001010000000000000001";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------
		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "00000000100001010001000000101010";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------
		----------------------------------------------------------------------------------------
		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "00000011111000000000000000001000";
		wait for 1 ns;
		-----------------------------------------------------------------------------------------



		memAddress := memAddress + 4;
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		inst <= "00000000000000000000000000000000";
		wait for 1 ns;
		
		reset <= '0';
		wait for 1 ns;

		for i in 0 to 700 loop
		
			clkPC <= '0';
			wait for 1 ns;
			clkPC <= '1';
			wait for 1 ns;

		end loop;



		wait;
	end process;

end architecture;