library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity MIPS is
	port(
		clkPC, reset: in std_logic;
		newInstAddress, newInst: in std_logic_vector( 31 downto 0 )
	);
end entity;

architecture Arch of MIPS is

	component Mux32Bit is
		port(
			s: in std_logic;
			a, b: in std_logic_vector( 31 downto 0 );
			o: out std_logic_vector( 31 downto 0 )
		);
	end component;

	component Extends16To32 is
		port(
			e16: in std_logic_vector( 15 downto 0 );
			o: out std_logic_vector( 31 downto 0 )
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

	component PC is
		port(
			clk, reset: in std_logic;
			q: in std_logic_vector( 31 downto 0 );
			d: out std_logic_vector( 31 downto 0 )
		);
	end component;

	component InstructionMemory is
		port(
			writeInst, e, newInst: in std_logic_vector( 31 downto 0 );
			o: out std_logic_vector( 31 downto 0 )
		);
	end component;

	component Extends26To32 is
		port(
			e26: in std_logic_vector( 25 downto 0 );
			o: out std_logic_vector( 31 downto 0 )
		);
	end component;

	component ShiftLeft2 is
		port(
			e: in std_logic_vector( 31 downto 0 );
			o: out std_logic_vector( 31 downto 0 )
		);
	end component;

	component Control is
		port(
			cod: in std_logic_vector( 5 downto 0 );
			RegDst, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, Jump, BNE, JAL: out std_logic;
			ALUOP: out std_logic_vector( 1 downto 0 )
		);
	end component;
	
	component Mux5Bit is
		port(
			s: in std_logic;
			a20_16, b15_11: in std_logic_vector( 4 downto 0 );
			o: out std_logic_vector( 4 downto 0 )
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

	component RegisterBank is
		port(
			clkPC, RegWrite: in std_logic;
			reg1, reg2, writeReg: in std_logic_vector( 4 downto 0 );
			writeData: in std_logic_vector( 31 downto 0 );
			data1, data2: out std_logic_vector( 31 downto 0 )
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

	constant four: std_logic_vector( 31 downto 0 ) := "00000000000000000000000000000100";	
	constant thirtyOne: std_logic_vector( 4 downto 0 ) := "11111";
	
	--Registradores de entrada do banco.
	signal RS,RD: std_logic_vector( 4 downto 0 );
	signal writeDataRB: std_logic_vector( 31 downto 0 );
	signal writeDataRB_BeforeJalTest: std_logic_vector( 31 downto 0 );
	--Registradores de saida do banco.
	signal A, B: std_logic_vector( 31 downto 0 );

	--relativos ao calculo do jump.
	signal jAddressBeforeSL, JumpAddress: std_logic_vector( 31 downto 0 );

	--Flags para controle.
	signal RegDst, Jump, Branch, MemRead, MemToReg, MemWrite, BNE, ALUSrc, RegWrite, JAL: std_logic;
	signal ALUOp: std_logic_vector( 1 downto 0 );

	signal JR: std_logic;

	--Offset I-type.
	signal offset32, offset32SL: std_logic_vector( 31 downto 0 );

	--Registrador PC.
	signal inst20_16OR15_11: std_logic_vector( 4 downto 0 );
	signal pcIn, pcOut, inst: std_logic_vector( 31 downto 0 );

	--ALU signals.
	signal OP: std_logic_vector( 2 downto 0 );
	signal eB: std_logic_vector( 31 downto 0 );
	signal zero: std_logic;
	signal result: std_logic_vector( 31 downto 0 );

	--BNE, BEQ signals.
	signal selCond: std_logic;
	signal condAddress: std_logic_vector( 31 downto 0 ); 

	--PC signals
	signal pcPlusFour: std_logic_vector( 31 downto 0 );
	signal condOrPc: std_logic_vector( 31 downto 0 );
	signal pcBeforeJRTest: std_logic_vector( 31 downto 0 );

	--DataMemory signals.
	signal dataFromMem: std_logic_vector( 31 downto 0 );

	--inst = instrucao atual.
begin
	PCReg: PC port map( clkPC, reset, pcIn, pcOut );
	InstMemory: InstructionMemory port map( newInstAddress, pcOut, newInst, inst );
	Ext26To32: Extends26To32 port map( inst( 25 downto 0 ), jAddressBeforeSL );
	SLForJump: ShiftLeft2 port map( jAddressBeforeSL, JumpAddress );
	Ctrl: Control port map( inst( 31 downto 26 ), RegDst, Branch, MemRead, MemToReg, MemWrite, ALUSrc, RegWrite, Jump, BNE, JAL, ALUOP );
	ChooseRS: Mux5Bit port map( JR, inst( 25 downto 21 ), thirtyOne, RS );
	ChooseInst20_16OR15_11: Mux5Bit port map( RegDst, inst( 20 downto 16 ), inst( 15 downto 11 ), inst20_16OR15_11 );
	ChooseRD: Mux5Bit port map( JAL, inst20_16OR15_11, thirtyOne, RD );
	Ext16To32: Extends16To32 port map( inst( 15 downto 0 ), offset32 );
	AluCTRL: AluControl port map( ALUOp, inst( 5 downto 0 ), JR, OP );
	RB: RegisterBank port map( clkPC, RegWrite, RS, inst( 20 downto 16 ), RD, writeDataRB, A, B );
	ChooseALU_EB: Mux32Bit port map( ALUSrc, B, offset32, eB ); 
	ALUComp: ALU port map( OP, A, eB, zero, result );
	DataMem: DataMemory port map( MemRead, MemWrite, result, B, dataFromMem );
	ChooseDataMemResul: Mux32Bit port map( MemToReg, result, dataFromMem, writeDataRB_BeforeJalTest );
 	PlusFour: Sum port map( pcOut, four, pcPlusFour );
	ChooseWriteData: Mux32Bit port map( JAL, writeDataRB_BeforeJalTest, pcPlusFour, writeDataRB );
	SLOffet: ShiftLeft2 port map( offset32, offset32SL );
	pcPlusFourPlusOffset32SL: Sum port map( pcPlusFour, offset32SL, condAddress );
	selCond <= ( Branch AND zero ) OR ( BNE AND ( NOT zero ) );
	ChooseOffset32SLORpcPlusFour: Mux32Bit port map( selCond, pcPlusFour, condAddress, condOrPc );
	ChooseJAORcondOrPC: Mux32Bit port map( Jump, condOrPc, JumpAddress, pcBeforeJRTest );
	ChoosePCIN: Mux32Bit port map( JR, pcBeforeJRTest, A, pcIn );
end architecture;