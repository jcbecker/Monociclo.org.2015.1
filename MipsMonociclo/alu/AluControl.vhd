library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity AluControl is
	port(
		AluOp: in std_logic_vector( 1 downto 0 );
		funct: in std_logic_vector( 5 downto 0 );
		JR: out std_logic;
		operation: out std_logic_vector( 2 downto 0 )
	);
end entity;

architecture AluControlAlg of AluControl is

begin
	process( AluOp, funct )

	begin
		if( AluOp = "00" )then
			operation <= "010";--soma para fazer addi lw sw
			JR <= '0';
		elsif( AluOp = "01" )then
			operation <= "110";--sub para fazer beq e bne
			JR <= '0';
		elsif (AluOp = "10" )then
			operation <= "111";--slti
			JR <= '0';
		else
			if( funct( 3 downto 0 ) = "0000" )then
				operation <= "010";
				JR <= '0';
			elsif( funct( 3 downto 0 ) = "0010" )then
				operation <= "110";
				JR <= '0';
			elsif( funct( 3 downto 0 ) = "0100" )then
				operation <= "000";
				JR <= '0';
			elsif( funct( 3 downto 0 ) = "0101" )then
				operation <= "001";
				JR <= '0';
			elsif( funct( 3 downto 0 ) = "1010" )then
				operation <= "111";
				JR <= '0';
			elsif( funct( 3 downto 0 ) = "1000" )then --JR
				JR <= '1';
			end if;
		end if;
	end process;
end architecture;