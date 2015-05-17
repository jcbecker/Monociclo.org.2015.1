library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity Control is
	port(
		cod: in std_logic_vector( 5 downto 0 );
		RegDst, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, Jump, BNE, JAL: out std_logic;
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
			Jump <= '0';
			BNE <= '0';
			JAL <= '0';
		elsif( cod = "100011" ) then --lw		
			RegDst <= '0';
			ALUSrc <= '1';
			MemtoReg <= '1';
			RegWrite <= '1';
			MemRead <= '1';
			MemWrite <= '0';
			Branch <= '0';
			ALUOP <= "00";
			Jump <= '0';
			BNE <= '0';
			JAL <= '0';
		elsif( cod = "101011" ) then --sw
			RegDst <= '0';
			ALUSrc <= '1';
			MemtoReg <= '0';
			RegWrite <= '0';
			MemRead <= '0';
			MemWrite <= '1';
			Branch <= '0';
			ALUOP <= "00";
			Jump <= '0';
			BNE <= '0';
			JAL <= '0';
		elsif( cod = "000100" ) then --beq
			RegDst <= '0';
			ALUSrc <= '0';
			MemtoReg <= '0';
			RegWrite <= '0';
			MemRead <= '0';
			MemWrite <= '0';
			Branch <= '1';
			ALUOP <= "01"; 
			Jump <= '0';
			BNE <= '0';
			JAL <= '0';
		elsif(cod = "000010") then --Jump
			RegDst <= '0';
			ALUSrc <= '0';
			MemtoReg <= '0';
			RegWrite <= '0';
			MemRead <= '0';
			MemWrite <= '0';
			Branch <= '0';
			ALUOP <= "00"; 
			Jump <= '1';
			BNE <= '0';
			JAL <= '0';
		elsif (cod = "001000") then --addi
			RegDst <= '0';
			ALUSrc <= '1';
			MemtoReg <= '0';
			RegWrite <= '1';
			MemRead <= '0';
			MemWrite <= '0';
			Branch <= '0';
			ALUOP <= "00"; 
			Jump <= '0';
			BNE <= '0';
			JAL <= '0';
		elsif (cod = "001100") then --slti
			RegDst <= '0';
			ALUSrc <= '1';
			MemtoReg <= '0';
			RegWrite <= '1';
			MemRead <= '0';
			MemWrite <= '0';
			Branch <= '0';
			ALUOP <= "10"; 
			Jump <= '0';
			BNE <= '0';
			JAL <= '0';
		elsif (cod = "000101") then --BNE
			RegDst <= '0';
			ALUSrc <= '0';
			MemtoReg <= '0';
			RegWrite <= '0';
			MemRead <= '0';
			MemWrite <= '0';
			Branch <= '0';
			ALUOP <= "01"; 
			Jump <= '0';
			BNE <= '1';
			JAL <= '0';
		elsif (cod = "000011") then --JAL
			RegDst <= '0';
			ALUSrc <= '0';
			MemtoReg <= '0';
			RegWrite <= '1';
			MemRead <= '0';
			MemWrite <= '0';
			Branch <= '0';
			ALUOP <= "00"; 
			Jump <= '1';
			BNE <= '0';
			JAL <= '1';

		end if;		
	end process;
end architecture;