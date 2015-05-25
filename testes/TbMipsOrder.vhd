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
		wait for 2 ns;
		reset <= '1';

		memAddress := 0;
		inst <= x"20080001";
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		wait for 2 ns;

		memAddress := 4;
		inst <= x"ac080000";
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		wait for 2 ns;

		memAddress := memaddress + 4;
		inst <= x"20080003";
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		wait for 2 ns;

		memAddress := memaddress + 4;
		inst <= x"ac080004";
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		wait for 2 ns;

		memAddress := memaddress + 4;
		inst <= x"20080002";
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		wait for 2 ns;

		memAddress := memaddress + 4;
		inst <= x"ac080008";
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		wait for 2 ns;

		memAddress := memaddress + 4;
		inst <= x"20080005";
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		wait for 2 ns;

		memAddress := memaddress + 4;
		inst <= x"ac08000c";
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		wait for 2 ns;

		memAddress := memaddress + 4;
		inst <= x"20080004";
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		wait for 2 ns;

		memAddress := memaddress + 4;
		inst <= x"ac080010";
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		wait for 2 ns;

		memAddress := memaddress + 4;
		inst <= x"20080007";
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		wait for 2 ns;

		memAddress := memaddress + 4;
		inst <= x"ac080014";
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		wait for 2 ns;

		memAddress := memaddress + 4;
		inst <= x"20080006";
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		wait for 2 ns;

		memAddress := memaddress + 4;
		inst <= x"ac080018";
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		wait for 2 ns;

		memAddress := memaddress + 4;
		inst <= x"20080009";
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		wait for 2 ns;

		memAddress := memaddress + 4;
		inst <= x"ac08001c";
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		wait for 2 ns;

		memAddress := memaddress + 4;
		inst <= x"20080008";
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		wait for 2 ns;

		memAddress := memaddress + 4;
		inst <= x"ac080020";
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		wait for 2 ns;

		memAddress := memaddress + 4;
		inst <= x"2008000a";
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		wait for 2 ns;

		memAddress := memaddress + 4;
		inst <= x"ac080024";
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		wait for 2 ns;

		memAddress := memaddress + 4;
		inst <= x"20040000";
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		wait for 2 ns;

		memAddress := memaddress + 4;
		inst <= x"2005000a";
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		wait for 2 ns;

		memAddress := memaddress + 4;
		inst <= x"20090000";
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		wait for 2 ns;

		memAddress := memaddress + 4;
		inst <= x"20900000";
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		wait for 2 ns;

		memAddress := memaddress + 4;
		inst <= x"11250010";
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		wait for 2 ns;

		memAddress := memaddress + 4;
		inst <= x"22110004";
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		wait for 2 ns;

		memAddress := memaddress + 4;
		inst <= x"212a0001";
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		wait for 2 ns;

		memAddress := memaddress + 4;
		inst <= x"1145000a";
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		wait for 2 ns;

		memAddress := memaddress + 4;
		inst <= x"8e0b0000";
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		wait for 2 ns;

		memAddress := memaddress + 4;
		inst <= x"8e2c0000";
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		wait for 2 ns;

		memAddress := memaddress + 4;
		inst <= x"018b782a";
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		wait for 2 ns;

		memAddress := memaddress + 4;
		inst <= x"11e00003";
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		wait for 2 ns;

		memAddress := memaddress + 4;
		inst <= x"ae0c0000";
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		wait for 2 ns;

		memAddress := memaddress + 4;
		inst <= x"ae2b0000";
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		wait for 2 ns;

		memAddress := memaddress + 4;
		inst <= x"214a0001";
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		wait for 2 ns;

		memAddress := memaddress + 4;
		inst <= x"22310004";
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		wait for 2 ns;

		memAddress := memaddress + 4;
		inst <= x"0810001B";
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		wait for 2 ns;

		memAddress := memaddress + 4;
		inst <= x"21290001";
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		wait for 2 ns;

		memAddress := memaddress + 4;
		inst <= x"22100004";
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		wait for 2 ns;

		memAddress := memaddress + 4;
		inst <= x"08100018";
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		wait for 2 ns;

		memAddress := memaddress + 4;
		inst <= x"00000000";
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		wait for 2 ns;

		memAddress := memaddress + 4;
		inst <= x"00000000";
		writeInst <= std_logic_vector( to_unsigned( memAddress, writeInst'length ) );
		wait for 2 ns;
		reset <= '0';
		wait for 1 ns;

		for i in 0 to 700 loop
			clkPC <= '0';
			wait for 2 ns;
			clkPC <= '1';
			wait for 2 ns;
		end loop;
		wait;
	end process;

end architecture;