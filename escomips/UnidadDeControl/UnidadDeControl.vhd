library IEEE;
library WORK;

use IEEE.STD_LOGIC_1164.ALL;
use WORK.paqueteUC.all;

entity UnidadDeControl is
	generic
	(
		constant tam_Microinstruccion:integer:=20;
		constant tam_OPCODE: integer:=5;
		constant tam_FUNCIONCODE: integer:=4
	);
	port
	(
		--Banderas de la ALU
		OV:  in std_logic;
		N:   in std_logic;
		Z:   in std_logic;
		C:   in std_logic;
		
		LF:  in std_logic;
		
		clk: in std_logic;
		clr: in std_logic;
		 
		OP_CODE: 	in std_logic_vector(tam_OPCODE-1 downto 0);
		FUN_CODE: 	in std_logic_vector(tam_FUNCIONCODE-1 downto 0);
		
--		NA_out: out std_logic;
--		SDOPC_out: out std_logic;
--		SM_out: out std_logic;
		MicroInstruccion: out std_logic_vector(tam_Microinstruccion-1 downto 0)
	);
end UnidadDeControl; 

architecture Behavioral of UnidadDeControl is
	
	constant ceros: 						std_logic_vector(tam_OPCODE-1 downto 0):=(others=>'0');
	signal OPCODE_SDOPC: 				std_logic_vector(tam_OPCODE-1 downto 0);
	signal MicroInstruccionOP: 		std_logic_vector(tam_Microinstruccion-1 downto 0);
	signal MicroInstruccionFuncion: 	std_logic_vector(tam_Microinstruccion-1 downto 0);
	
	signal SDOPC: 	std_logic;
	signal SM: 		std_logic;
	signal TIPOR: 	std_logic;
	signal BEQI: 	std_logic;
	signal BNEI: 	std_logic;
	signal BLTI: 	std_logic;
	signal BLETI: 	std_logic;
	signal BGTI: 	std_logic;
	signal BGETI: 	std_logic;
	
	signal NA: 		std_logic;
	
	signal EQ: 		std_logic;
	signal NEQ: 	std_logic;
	signal LT: 		std_logic;
	signal LET:		std_logic;
	signal GT: 		std_logic;
	signal GET: 	std_logic;
	
	signal OV1:	std_logic;
	signal Z1: 	std_logic;
	signal C1: 	std_logic;
	signal N1: 	std_logic;
	
	
begin

	RegistroFlags: RegistroBanderas
		port map
		(
			OV=>OV,
			N=>N,  
			Z=>Z,  
			C=>C,  
			LF=>LF,
			clk=>clk,
			clr=>clr,
			OV_out=>OV1,
			N_out=>N1,
			Z_out=>Z1,
			C_out=>C1
		);
	
	Condicion: VerificadorCondicion
		port map
		(
			OV=>OV1,
			Z=>Z1,
			N=>N1,
			C=>C1,
			EQ=>EQ,
			NEQ=>NEQ,
			LT=>LT,
			LET=>LET,
			GT=>GT,
			GET=>GET
		);
		
	Nivel: DetectorNivel
		port map
		(
			clk=>clk,
			clr=>clr,
			NA=>NA
		);
		
		Deco: DecodificadorInstruccion
		port map
		(
			OP_CODE=>OP_CODE,
			TIPOR=>TIPOR,
			BEQI=>BEQI,
			BNEI=>BNEI,
			BLTI=>BLTI,
			BLETI=>BLETI,
			BGTI=>BGTI,
			BGETI=>BGETI
		);
		
		UC: UnidadControl
		port map
		(
			TIPOR=>TIPOR,
			BEQI=>BEQI,
			BNEI=>BNEI,
			BLTI=>BLTI,
			BLETI=>BLETI,
			BGTI=>BGTI,
			BGETI=>BGETI,
			NA=>NA,	
			EQ=>EQ,
			NEQ=>NEQ,
			LT=>LT,
			LET=>LET,
			GT=>GT,
			GET=>GET,
			SDOPC=>SDOPC,
			SM=>SM
		);
		
		OP_CODE_ROM: CodigoOperacionROM
		port map
		(
			BusDir=>OPCODE_SDOPC,
			MicroInstruccionOP=>MicroInstruccionOP
		);
		
		FUNCION_CODE_ROM: CodigoFuncionROM
		port map
		(
			BusDir=>FUN_CODE,
			MicroinstruccionFuncion=>MicroinstruccionFuncion
		);
		
		OPCODE_SDOPC<=OP_CODE when SDOPC='1' else ceros;
		Microinstruccion<=MicroinstruccionOP when SM='1' else MicroinstruccionFuncion;
--		NA_out<=NA;
--		SDOPC_out<=SDOPC;
--		SM_out<=SM; 

		--LF <= Microinstruccion(0);		
end Behavioral;