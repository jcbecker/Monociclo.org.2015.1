library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity TB_DTMemory is
end entity;

architecture TBDTMemoryAlg of TB_DTMemory is
    
    component DataMemory is
       port(
		   MemRead, MemWrite: in std_logic;
		   address, writeData: in std_logic_vector( 31 downto 0 );
   		   o: out std_logic_vector( 31 downto 0 )
      	);    
    end component;
    
    signal memReadTB, memWriteTB: std_logic;
    signal addTB, writeTB, oTB: std_logic_vector( 31 downto 0 );
begin
    TBDTMem: DataMemory port map( memReadTB, memWriteTB, addTB, writeTB, oTB );
    
    process
        
    begin
       memReadTB <= '0';
       memWriteTB <= '0';

       wait for 2 ns;
       addTB <= "00000000000000000000000000000000";
       writeTB <= "00000000000000000000000000000011";
       memWriteTB <= '1';       
       wait for 2 ns;
       
       memWriteTB <= '0';
       
       wait for 2 ns;
       memReadTB <= '1';
       wait for 2 ns;
       assert( oTB = writeTB ) report "Erro TB memoria de dados teste 1." severity error;
       memReadTB <= '0';--reset
       memWriteTB <= '0';
       wait for 2 ns;
       ---------------------------------------------------------------------------caso 2
       addTB <= "00000000000000000000000000000100";
       writeTB <= "00000000000000000000000000000001";
       wait for 2 ns;
       memWriteTB <= '1'; 
       wait for 2 ns;
       memWriteTB <= '0';
       wait for 2 ns; 
       
       ---------------------------------------------------------------------------caso 3
       addTB <= "00000000000000000000000000001000";
       writeTB <= "00000000000000000000000000000010";
       wait for 2 ns;
       memWriteTB <= '1'; 
       wait for 2 ns;
       memWriteTB <= '0';
       wait for 2 ns; 
       
       ---------------------------------------------------------------------------caso 4
       addTB <= "00000000000000000000000000001100";
       writeTB <= "00000000000000000000000000000100";
       wait for 2 ns;
       memWriteTB <= '1'; 
       wait for 2 ns;
       memWriteTB <= '0';
       wait for 2 ns; 
       --------------------------------------------------------------------------recaso2
       addTB <= "00000000000000000000000000000100";
       wait for 2 ns;
       memReadTB <= '1';
       wait for 2 ns;
       assert( oTB = "00000000000000000000000000000001" ) report "Erro TB memoria de dados teste 2." severity error;
       memReadTB <= '0';
       wait for 2 ns;
       
       --------------------------------------------------------------------------recaso3
       addTB <= "00000000000000000000000000001000";
       wait for 2 ns;
       memReadTB <= '1';
       wait for 2 ns;
       assert( oTB = "00000000000000000000000000000010" ) report "Erro TB memoria de dados teste 3." severity error;
       memReadTB <= '0';
       wait for 2 ns;
       
       --------------------------------------------------------------------------recaso4
       addTB <= "00000000000000000000000000001100";
       wait for 2 ns;
       memReadTB <= '1';
       wait for 2 ns;
       assert( oTB = "00000000000000000000000000000100" ) report "Erro TB memoria de dados teste 4." severity error;
       memReadTB <= '0';
       wait for 2 ns;
       
       
       
       
       
    end process;   
end architecture;