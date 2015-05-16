library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity TBMips is
end entity;

architecture MachineCode of TBMips is	
	
	component MIPS is
		port(
			clkPC, reset: in std_logic;
			writeInst, inst: in std_logic_vector( 31 downto 0 )
		);
	end component;

	signal clkPC, TBSign, reset: std_logic;
	signal writeInst, inst: std_logic_vector( 31 downto 0 );
begin
	Mips32bit: MIPS port map( clkPC, reset, writeInst, inst);

	process
	begin
		reset <= '0';
		wait for 2 ns;
		reset <= '1';
		writeInst <= "00000000000000000000000000000000";
		inst <= "00000000000000000000100000000000";
		wait for 2 ns;
		
		writeInst <= "00000000000000000000000000000100";
		inst <= "10101100001000010000000000000000";
		wait for 2 ns;

		reset <= '0';
		clkPC <= '0';
		wait for 2 ns;
		clkPC <= '1';
		wait for 5 ns;

	end process;
end architecture;

