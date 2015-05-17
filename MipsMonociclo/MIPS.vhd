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
			RegWrite: in std_logic;
			reg1, reg2, writeReg: in std_logic_vector( 4 downto 0 );
			writeData: in std_logic_vector( 31 downto 0 );
			data1, data2: out std_logic_vector( 31 downto 0 )
		);
	end component;

	component AluControl is
		port(
			AluOp: in std_logic_vector( 1 downto 0 );
			funct: in std_logic_vector( 5 downto 0 );
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

	signal op: std_logic_vector( 2 downto 0 );
	signal ALUOp: std_logic_vector( 1 downto 0 );
	signal writeReg, OutJalMux: std_logic_vector( 4 downto 0 );
	signal zero, RegDst, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, PCSrc, Jump, BNE, JAL: std_logic;
	signal data1, data2, writeData, result, instMemO, pcE, pcO, offset, secOP, readData, nextInst, beqInst4, beqInst: std_logic_vector( 31 downto 0 );
	signal jumpaddress, PCmuxout, OutJalMux2: std_logic_vector( 31 downto 0 );
	
begin
	PCTB: PC port map( clkPC, reset, pcE, pcO);
	InstMemTB: InstructionMemory port map( writeInst, pcO, inst, instMemo);
	ControlTB: Control port map( instMemo( 31 downto 26 ), RegDst, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, Jump, BNE, JAL, ALUOp);
	writeRegTB: Mux5Bit port map( RegDst, instMemo( 20 downto 16 ), instMemo( 15 downto 11 ), writeReg );
	RegBankTB: RegisterBank port map( RegWrite, instMemo( 25 downto 21 ), instMemo( 20 downto 16 ), OutJalMux, OutJalMux2, data1, data2 );
	SignExTB: Extends16To32 port map( instMemo( 15 downto 0 ), offset );
	AluCtrlTB: AluControl port map( ALUOp, instMemo( 5 downto 0 ), op );
	MuxSegOP: Mux32Bit port map( ALUSrc, data2, offset, secOP );
	ALUTB: ALU port map( op, data1, secOP, zero, result );
	DMTB: DataMemory port map( MemRead, MemWrite, result, data2, readData );
	MuxWriteData: Mux32Bit port map( MemtoReg, result, readData, writeData );
	NextInstTB: Sum port map( pcO, four, nextInst);
	SLTB: ShiftLeft2 port map( offset, beqInst4 );
	BeqSumTB: Sum port map( nextInst, beqInst4, beqInst );
	PCSrc <= (Branch and zero) or (BNE and (not zero));
	jumpaddress <= nextInst (31 downto 28) & instMemo(25 downto 0)& "00";-- a concatenacao a direita e equivalente a shift esquerda e mul 4
	NextInstTB2: Mux32Bit port map( PCSrc, nextInst, beqInst, PCmuxout );
	JumpMux: Mux32Bit port map (Jump, PCmuxout, jumpaddress, pcE);
	WregJal: Mux5Bit port map (JAL, WriteReg, "11111", OutJalMux);
	WriteDataMuxJal: Mux32Bit port map (JAL, writeData, nextInst,OutJalMux2 );
end architecture;