library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity RegisterBank is
	port(
		RegWrite: in std_logic;
		reg1, reg2, writeReg: in std_logic_vector( 4 downto 0 );
		writeData: in std_logic_vector( 31 downto 0 );
		data1, data2: out std_logic_vector( 31 downto 0 )
	);
end entity;

architecture RegisterBankAlg of RegisterBank is

type Registers is array( 31 downto 0 ) of std_logic_vector( 31 downto 0 );
signal bank: Registers;

begin
	process( RegWrite )

	begin
		if( RegWrite = '1' )then
			bank( conv_integer( writeReg ) ) <= writeData;
		end if;
	end process;

	process( reg1 )
	begin
		data1 <= bank( conv_integer( reg1 ) );
	end process;

	process( reg2 )
	begin
		data2 <= bank( conv_integer( reg2 ) );
	end process;
end architecture;