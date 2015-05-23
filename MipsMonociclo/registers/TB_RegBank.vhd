library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity TB_RegBank is
end entity;

architecture TB_RegBankAlg of TB_RegBank is

	component RegisterBank is	
		port(
			clkPC, RegWrite: in std_logic;
			reg1, reg2, writeReg: in std_logic_vector( 4 downto 0 );
			writeData: in std_logic_vector( 31 downto 0 );
			data1, data2: out std_logic_vector( 31 downto 0 )
		);
	end component;

	
	signal clkPC, RegWrite: std_logic;
	signal reg1, reg2, writeReg: std_logic_vector( 4 downto 0 );
	signal data1, data2, writeData: std_logic_vector( 31 downto 0 );
begin

	TBRegBank: RegisterBank port map( clkPC, RegWrite, reg1, reg2, writeReg, writeData, data1, data2 );
	process
	begin
		--Escrevendo writeData no registrador 1.
		clkPC <= '0';
		RegWrite <= '1';
		writeReg <= "00001";
		writeData <= "00000000000000000000000000000011";
		clkPC <= '1';
		wait for 2 ns;

		--Lendo o registrador 1 somente para verificar conteudo escrito acima.
		reg1 <= "00001";
		RegWrite <= '0';
		clkPC <= '0';
		wait for 2 ns;
		assert( data1 = "00000000000000000000000000000011" ) report "Resposta errada teste 1." severity error;

		--Escrevendo writeData no registrador 2.
		clkPC <= '0';
		RegWrite <= '1';
		writeReg <= "00010";
		writeData <= "00000000000000000000000000000100";
		clkPC <= '1';
		wait for 2 ns;

		--Lendo o registrador 2 somente para verificar conteudo escrito acima.
		reg2 <= "00010";
		RegWrite <= '0';
		clkPC <= '0';
		wait for 2 ns;
		assert( data2 = "00000000000000000000000000000100" ) report "Resposta errada teste 2." severity error;
	end process;
end architecture;