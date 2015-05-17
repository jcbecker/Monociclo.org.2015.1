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
		--resetando registrador pc.
		reset <= '0';
		wait for 2 ns;
		reset <= '1';

		--OP: add $1, $0, $0
		writeInst <= "00000000000000000000000000000000";--instrucao de endereco 0.
		inst <= "00000000000000000000100000000000";
		wait for 2 ns;
		
		--OP: sw $1, $1
		writeInst <= "00000000000000000000000000000100";--instrucao de endereco 4.
		inst <= "10101100001000010000000000000000";
		wait for 2 ns;

		--OP: lw $2, $1
		writeInst <= "00000000000000000000000000001000";--instrucao de endereco 8.
		inst <= "10001100001000100000000000000000";
		wait for 2 ns;

		--OP: addi $1, $1, 6
		writeInst <= "00000000000000000000000000001100";--instrucao de endereco 12.
		inst <= "00100000001000010000000000000110";
		wait for 2 ns;

		--OP: bne $1, $2, 0000000000000000 
		writeInst <= "00000000000000000000000000010000";--instrucao de endereco 16.
		inst <= "00010100001000100000000000000000";
		wait for 2 ns;

		--OP: J  00000000000000000000001000
		writeInst <= "00000000000000000000000000010100";--instrucao de endereco 20.
		inst <= "00001000000000000000000000001000";
		wait for 2 ns;

		reset <= '0';

		clkPC <= '0';
		wait for 2 ns;
		clkPC <= '1';
		wait for 2 ns;

		clkPC <= '0';
		wait for 2 ns;
		clkPC <= '1';
		wait for 2 ns;

		clkPC <= '0';
		wait for 2 ns;
		clkPC <= '1';
		wait for 2 ns;

		clkPC <= '0';
		wait for 2 ns;
		clkPC <= '1';
		wait for 2 ns;

		clkPC <= '0';
		wait for 2 ns;
		clkPC <= '1';
		wait for 2 ns;
	end process;
end architecture;

