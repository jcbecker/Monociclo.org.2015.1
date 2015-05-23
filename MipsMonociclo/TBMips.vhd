library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity TBMips is
end entity;

architecture MachineCode of TBMips is	
	
	component MIPS is
		port(
			clkPC, reset: in std_logic;
			newInstAddress, newInst: in std_logic_vector( 31 downto 0 )
		);
	end component;

	signal clkPC, TBSign, reset: std_logic;
	signal writeInst, inst: std_logic_vector( 31 downto 0 );
begin
	Mips32bit: MIPS port map( clkPC, reset, writeInst, inst);

	process
	begin
		reset <= '0';

		--OP: add $1, $0, $0
		writeInst <= "00000000000000000000000000000000";--instrucao de endereco 0.
		inst <= "00000000000000000000100000000000";
		wait for 1 ns;
		
		--OP: sw $1, $1
		writeInst <= "00000000000000000000000000000100";--instrucao de endereco 4.
		inst <= "10101100001000010000000000000000";
		wait for 1 ns;

		--OP: lw $2, $1
		writeInst <= "00000000000000000000000000001000";--instrucao de endereco 8.
		inst <= "10001100001000100000000000000000";
		wait for 1 ns;

		--OP: addi $1, $1, 6
		writeInst <= "00000000000000000000000000001100";--instrucao de endereco 12.
		inst <= "00100000001000010000000000000110";
		wait for 1 ns;
		
		--OP: and $3, $1, $2
		--inst <= "00000000010000010001100000100100";
		--writeInst <= "00000000000000000000000000010000";
		--wait for 1 ns;

		--OP: sub $2, $0, $0
 		--ja fiz testes melhores, esse aqui e para testar o slti
		--pois as funcoes slt/slti nao funcionam para numeros 
		--negativos. Ver: MIPS_ISA.
		writeInst <= "00000000000000000000000000010000";
		inst <= "00000000000000000000000000100010";
		wait for 1 ns;

		--OP: slt $3, $2, $1
		writeInst <= "00000000000000000000000000010100";
		inst <= "00000000010000010001100000011010";
		wait for 1 ns;

		--OP: slti $4, $1, 7         
		writeInst <= "00000000000000000000000000011000";
		inst <= "00101000001001000000000000000111";
		wait for 1 ns;

		--OP: beq $0, $2, 1111111111111011 funciona.
		--inst <= "00010000000000101111111111111011";
		--writeInst <= "00000000000000000000000000010000";

		--OP: bne $1, $2, 1111111111111011 funciona.
		--writeInst <= "00000000000000000000000000010000";--instrucao de endereco 16.
		--inst <= "00010100001000101111111111111011";
		--wait for 1 ns;

		--OP: J  00000000000000000000000011 se o bne estiver descomentado o jump 
		--				nao vai executar porque o BNE vai desviar.
		writeInst <= "00000000000000000000000000011100"; --instrucao de endereco 20.
		inst <= "00001000000000000000000000000011";
		wait for 1 ns; --14 ns.

		reset <= '1';
		wait for 2 ns;
		reset <= '0';

		clkPC <= '1';
		clkPC <= '0';
		wait for 2 ns;
		
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
		clkPC <= '0';

		wait for 2 ns;
	end process;
end architecture;

