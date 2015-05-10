library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity DataMemory is
	port(
		MemRead, MemWrite: in std_logic;
		adress, writeData: in std_logic_vector( 31 downto 0 );
		o: out std_logic_vector( 31 downto 0 )
	);
end entity;

architecture DataMemoryAlg of DataMemory is

begin
	
end architecture;