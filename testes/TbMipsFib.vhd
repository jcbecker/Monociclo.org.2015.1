
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity TM_Mips_Fibonacci is
end entity;

architecture MachineCode of TM_Mips_Fibonacci is	
	
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
	begin
		--resetando registrador pc.
		reset <= '0';
		wait for 2 ns;
		reset <= '1';

		--[00000000]  20080007  addi $8, $0, 7
		--[00000004]  00004820  add $9, $0, $0  
		--[00000008]  200a0001  addi $10, $0, 1
		--[0000000c]  11000006  beq $8, $0, 24 [quebra-0x00000024] rótolo loop esta aqui [0000000c]
		--[00000010]  012a5820  add $11, $9, $10 
		--[00000014]  000a4820  add $9, $0, $10  
		--[00000018]  000b5020  add $10, $0, $11
		--[0000001c]  2108ffff  addi $8, $8, -1 
		--[00000020]  08000003  j 0x000000003 [loop] 
		--[00000024]  00000000  rotolo quebra esta aqui
		--[00000028]  00000000  
		--[0000002c]  00000000  verificar se o registrador 11 tem n-esimo fib

		--n-esimo termo da sequencia de fibonacci.
		--deve ser colocado aqui no lugar do 8.
		--OP: addi $8, $0, 8
		writeInst <= x"00000000";--instrucao de endereco 0.
		inst <= x"20080008";
		wait for 2 ns;
		
		--OP: add $9, $0, $0 
		writeInst <= x"00000004";--instrucao de endereco 4.
		inst <= x"00004820";
		wait for 2 ns;

		--OP: addi $10, $0, 1
		writeInst <= x"00000008";--instrucao de endereco 8.
		inst <= x"200a0001";
		wait for 2 ns;

		--OP: beq $8, $0, 24 [quebra-0x00000024] rótolo loop esta aqui [0000000c]
		writeInst <= x"0000000c";--instrucao de endereco 12.
		inst <= x"11000006";
		wait for 2 ns;

		--OP: add $11, $9, $10
		writeInst <= x"00000010";--instrucao de endereco 16.
		inst <= x"012a5820";
		wait for 2 ns;

		--OP:add $9, $0, $10
		writeInst <= x"00000014";--instrucao de endereco 20.
		inst <= x"000a4820";
		wait for 2 ns;

		--OP: add $10, $0, $11
		writeInst <= x"00000018";--instrucao de endereco 24.
		inst <= x"000b5020";
		wait for 2 ns;

		--OP: addi $8, $8, -1 
		writeInst <= x"0000001c";--instrucao de endereco 28.
		inst <= x"2108ffff";
		wait for 2 ns;

		--OP: j 0x000000003 [loop]
		writeInst <= x"00000020";--instrucao de endereco 32.
		inst <= x"08000003";
		wait for 2 ns;

		--OP: rotolo quebra esta aqui
		writeInst <= x"00000024";--instrucao de endereco 36.
		inst <= x"00000000";
		wait for 2 ns;

		--OP: ?
		writeInst <= x"00000028";--instrucao de endereco 40.
		inst <= x"00000000";
		wait for 2 ns;

		--OP: ?
		writeInst <= x"0000002c";--instrucao de endereco 44.
		inst <= x"00000000";
		wait for 2 ns;

		reset <= '0';

		wait for 1 ns;
		for i in 0 to 200 loop
		
			clkPC <= '0';
			wait for 2 ns;
			clkPC <= '1';
			wait for 2 ns;
		end loop;

		wait;
	end process;
end architecture;