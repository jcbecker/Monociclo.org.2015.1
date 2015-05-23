library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity MIPS is
	port(
		clkPC, reset: in std_logic;
		writeInst, inst: in std_logic_vector( 31 downto 0 )
	);
end entity;

architecture Arch of MIPS is

	component Mux5Bit is
		port(
			s: in std_logic;
			a20_16, b15_11: in std_logic_vector( 4 downto 0 );
			o: out std_logic_vector( 4 downto 0 )
		);
	end component;

	component Mux32Bit is
		port(
			s: in std_logic;
			a, b: in std_logic_vector( 31 downto 0 );
			o: out std_logic_vector( 31 downto 0 )
		);
	end component;

	component Extends16To32 is
		port(
			e: in std_logic_vector( 15 downto 0 );
			o: out std_logic_vector( 31 downto 0 )
		);
	end component;

	component ShiftLeft2 is
		port(
			e: in std_logic_vector( 31 downto 0 );
			o: out std_logic_vector( 31 downto 0 )
		);
	end component;

	component InstructionMemory is
		port(
			writeInst, e, newInst: in std_logic_vector( 31 downto 0 );
			o: out std_logic_vector( 31 downto 0 )
		);
	end component;

	component PC is
		port(
			clk, reset: in std_logic;
			q: in std_logic_vector( 31 downto 0 );
			d: out std_logic_vector( 31 downto 0 )
		);
	end component;

	component Control is
		port(
			cod: in std_logic_vector( 5 downto 0 );
			RegDst, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, Jump, BNE, JAL: out std_logic;
			ALUOP: out std_logic_vector( 1 downto 0 )
		);
	end component;	

	component RegisterBank is
		port(
			clkPC, RegWrite: in std_logic;
			reg1, reg2, writeReg: in std_logic_vector( 4 downto 0 );
			writeData: in std_logic_vector( 31 downto 0 );
			data1, data2: out std_logic_vector( 31 downto 0 )
		);
	end component;

	component AluControl is
		port(
			AluOp: in std_logic_vector( 1 downto 0 );
			funct: in std_logic_vector( 5 downto 0 );
			JR: out std_logic;
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

	component DataMemory is
		port(
			MemRead, MemWrite: in std_logic;
			address, writeData: in std_logic_vector( 31 downto 0 );
			o: out std_logic_vector( 31 downto 0 )
		);
	end component;

	component Sum is
		port(
			a, b: in std_logic_vector( 31 downto 0 );
			o: out std_logic_vector( 31 downto 0 )
		);
	end component;

	constant four: std_logic_vector( 31 downto 0 ) := "00000000000000000000000000000100";	
begin

end architecture;