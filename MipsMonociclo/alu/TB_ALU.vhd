library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

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
		
	end process;
end architecture;