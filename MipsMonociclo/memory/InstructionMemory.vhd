library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity InstructionMemory is
    port(	
	writeInst, e, newInst: in std_logic_vector( 31 downto 0 );
	o: out std_logic_vector( 31 downto 0 )
    );
end entity;

architecture InsAlg of InstructionMemory is
   type Inst is array( 255 downto 0 ) of std_logic_vector( 7 downto 0 );
   signal instruction: Inst;   

begin
   
        o( 7 downto 0 ) <= instruction( conv_integer( e ) );
        o( 15 downto 8 ) <= instruction( conv_integer( e )+1 );
        o( 23 downto 16 ) <= instruction( conv_integer( e )+2 );
	o( 31 downto 24 ) <= instruction( conv_integer( e )+3 );

	process( writeInst )
	begin
		instruction( conv_integer( writeInst ) ) <= newInst( 7 downto 0 );
		instruction( conv_integer( writeInst )+1 ) <= newInst( 15 downto 8 );
		instruction( conv_integer( writeInst )+2 ) <= newInst( 23 downto 16 );
		instruction( conv_integer( writeInst )+3 ) <= newInst( 31 downto 24 );
	end process;	
end architecture;