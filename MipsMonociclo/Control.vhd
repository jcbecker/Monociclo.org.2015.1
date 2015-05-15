library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity Control is
	port(
		cod: in std_logic_vector( 5 downto 0 );
		RegDst, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite: out std_logic;
		ALUOP: out std_logic_vector( 1 downto 0 )
	);
end entity;	

architecture ControlAlg of Control is

begin
	process(cod)
	begin

		if( cod = "000000" ) then --r-type
			RegDst <= '1';
			ALUSrc <= '0';
			MemtoReg <= '0';
			RegWrite <= '1';
			MemRead <= '0';
			MemWrite <= '0';
			Branch <= '0';
			ALUOP <= "11";
		elsif( cod = "100011" ) then --lw		
			RegDst <= '0';
			ALUSrc <= '1';
			MemtoReg <= '1';
			RegWrite <= '1';
			MemRead <= '1';
			MemWrite <= '0';
			Branch <= '0';
			ALUOP <= "00";
		elsif( cod = "101011" ) then --sw
			RegDst <= '0';
			ALUSrc <= '1';
			MemtoReg <= '0';
			RegWrite <= '0';
			MemRead <= '0';
			MemWrite <= '1';
			Branch <= '0';
			ALUOP <= "00";
		elsif( cod = "000100" ) then --beq
			RegDst <= '0';
			ALUSrc <= '0';
			MemtoReg <= '0';
			RegWrite <= '0';
			MemRead <= '0';
			MemWrite <= '0';
			Branch <= '1';
			ALUOP <= "01"; 
		end if;		
	end process;
end architecture;