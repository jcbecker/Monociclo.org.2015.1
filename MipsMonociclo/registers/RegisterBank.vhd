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
	bank( conv_integer( writeReg ) ) <= writeData when( RegWrite = '1' and writeReg /= "00000" );
	
	data1 <= "00000000000000000000000000000000" when reg1 = "00000"
	else  bank( conv_integer( reg1 ) );
	
	data2 <= "00000000000000000000000000000000" when reg2 = "00000"
	else bank( conv_integer( reg2 ) );

end architecture;