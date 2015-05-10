library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

--Este TB testa o controle da ula e a ula.

entity TB_ALU is
end entity;

architecture TB_ALUALG of TB_ALU is

	component AluControl is
		port(
			AluOp: in std_logic_vector( 1 downto 0 );
			funct: in std_logic_vector( 5 downto 0 );
			operation: out std_logic_vector( 2 downto 0 )
		);
	end component;

	component ALU is
		port(
			op: in std_logic_vector( 2 downto 0 );
			a, b: in std_logic_vector( 31 downto 0 );
			zero: out std_logic;
			result: out std_logic_vector( 31 downto 0 )
		);
	end component;

	--AluControl signals.
	signal AluOpTB: std_logic_vector( 1 downto 0 );
	signal functTB: std_logic_vector( 5 downto 0 );
	signal operationTB: std_logic_vector( 2 downto 0 );

	--ALU signals.
	signal zeroTB: std_logic;
	signal na, nb, resulTB: std_logic_vector( 31 downto 0 );
begin
	TBAluControl: AluControl port map(AluOpTB,functTB,operationTB);
	TBAlu: ALU port map(operationTB,na,nb,zeroTB,resulTB);
	process

	begin
		wait for 2 ns;
		na <= "01010101010101010101010101010101";
		nb <= "10101010101010101010101010101010";
		AluOpTB <= "10";
		functTB <= "000100"; --AND
		wait for 4 ns;

		assert( resulTB = "00000000000000000000000000000000" ) report "Resposta errada teste 0" severity error;

		wait for 2 ns;
		na <= "01010101010101010101010101010101";
		nb <= "10101010101010101010101010101010";
		AluOpTB <= "10";
		functTB <= "000101"; --OR
		wait for 4 ns;

		assert( resulTB = "11111111111111111111111111111111" ) report "Resposta errada teste 1." severity error;

		wait for 2 ns;
		na <= "00000000000000000000000001111111";
		nb <= "00000000000000000000000000000001";
		AluOpTB <= "10";
		functTB <= "000000"; --ADD
		wait for 4 ns;	

		assert( resulTB = "00000000000000000000000010000000" ) report "Resposta errada teste 2." severity error;

		wait for 2 ns;
		na <= "00000000000000000000000010000000";
		nb <= "00000000000000000000000000000001";
		AluOpTB <= "10";
		functTB <= "000010"; --subtract
		wait for 4 ns;	

		assert( resulTB = "00000000000000000000000001111111" ) report "Resposta errada teste 3." severity error;

		wait for 2 ns;
		na <= "00000000000000000000000010000000";
		nb <= "00000000000000000000000000000001";
		AluOpTB <= "10";
		functTB <= "001010"; --set-on-less-than
		wait for 4 ns;	

		assert( resulTB = "00000000000000000000000000000000" ) report "Resposta errada teste 4." severity error;

		wait for 2 ns;
		na <= "00000000000000000000000010000000";
		nb <= "00000000000000000000000010000000";
		AluOpTB <= "10";
		functTB <= "001010"; --repetindo less-than para verificar flag de zero.
		wait for 4 ns;	

		assert( zeroTB = '1' ) report "Resposta errada teste 5." severity error;
	end process;
end architecture;