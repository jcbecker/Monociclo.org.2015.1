library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity DataMemory is
	port(
		clk, MemRead, MemWrite: in std_logic;
		address, writeData: in std_logic_vector( 31 downto 0 );
		o: out std_logic_vector( 31 downto 0 )
	);
end entity;

architecture DataMemoryAlg of DataMemory is
    
type Bytes is array( 255 downto 0 ) of std_logic_vector( 7 downto 0 );
signal cell: Bytes;   

begin
process (clk)
begin
    
    if( rising_edge(clk) and MemWrite = '1' )then
       cell( conv_integer( address ) ) <= writeData( 7 downto 0 );
       cell( conv_integer( address )+1 ) <= writeData( 15 downto 8 );
       cell( conv_integer( address )+2 ) <= writeData( 23 downto 16 );
       cell( conv_integer( address )+3 ) <= writeData( 31 downto 24 );
    end if;
end process;

process( MemRead )

begin
    if( MemRead = '1' )then
       o( 7 downto 0 ) <= cell( conv_integer( address ) );
       o( 15 downto 8 ) <= cell( conv_integer( address )+1 );
       o( 23 downto 16 ) <= cell( conv_integer( address )+2 );
       o( 31 downto 24 ) <= cell( conv_integer( address )+3 );
    end if;
end process;
	
end architecture;