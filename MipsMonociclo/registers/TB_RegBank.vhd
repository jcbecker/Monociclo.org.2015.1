library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity TB_RegBank is
end entity;

architecture TB_RegBankAlg of TB_RegBank is

	component RegisterBank is	
		port(
			RegWrite: in std_logic;
			reg1, reg2, writeReg: in std_logic_vector( 4 downto 0 );
			writeData: in std_logic_vector( 31 downto 0 );
			data1, data2: out std_logic_vector( 31 downto 0 )
		);
	end component;

	signal goWrite: std_logic;
	signal r1, r2, wr: std_logic_vector( 4 downto 0 );
	signal data, d1, d2: std_logic_vector( 31 downto 0 );
begin

	TBRegBank: RegisterBank port map( goWrite, r1, r2, wr, data, d1, d2 );
	process
	begin
		--preparar teste de escrita.
		goWrite <= '0';
		wait for 2 ns;
		wr <= "00010";
		data <= "00000000000000000000000000000010";
		goWrite <= '1';
		wait for 4 ns;

		wait for 2 ns;
		r1 <= "00010";
		wait for 4 ns;

		assert( d1 = "00000000000000000000000000000010" ) report "Resposta errada teste 1." severity error;

		goWrite <= '0';
		wait for 2 ns;
		wr <= "00001";
		data <= "00000000000000000000000000000100";
		goWrite <= '1';
		wait for 4 ns;

		wait for 2 ns;
		r2 <= "00001";
		wait for 4 ns;

		assert( d2 = "00000000000000000000000000000100" ) report "Resposta errada teste 2." severity error;
	end process;
end architecture;