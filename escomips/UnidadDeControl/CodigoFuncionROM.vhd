library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity CodigoFuncionROM is
	generic
	(
		--Tamaño del Bus de Microinstrucciones
		constant tamWord: integer:=20;
		--Tamaño del Bus de Direcciones
		constant tamDir: integer:=4
	);
	port
	(
		--Bus de Direcciones
		BusDir: in std_logic_vector(tamDir-1 downto 0);
		--Bus de Microinstrucciones
		MicroinstruccionFuncion: out std_logic_vector(tamWord-1 downto 0)
	);
end CodigoFuncionROM;

architecture Behavioral of CodigoFuncionROM is
	TYPE ROM IS ARRAY (0 to ((2**tamDir)-1)) OF std_logic_vector(tamWord-1 downto 0);
	--Microinstruccion
	--SDMP,UP,DW,WPC,SR2,SWD,SEXT,SHE,DIR,WR,SOP1,SOP2,ALUOP[3],ALUOP[2],ALUOP[1],ALUOP[0],SDMD,WD,SR,LF
	constant ADD:    std_logic_vector:="00000100010000110010";
	constant SUB:    std_logic_vector:="00000100010001110010";
	constant AND_M:  std_logic_vector:="00000100010000000010";
	constant OR_M:   std_logic_vector:="00000100010000010010";
	constant XOR_M:  std_logic_vector:="00000100010000100010";
	constant NAND_M: std_logic_vector:="00000100010011010010";
	constant NOR_M:  std_logic_vector:="00000100010011000010";
	constant XNOR_M: std_logic_vector:="00000100010010100010";
	constant NOT_M:  std_logic_vector:="00000100010011010010";
	constant SLL_M:  std_logic_vector:="00000001110000000000";
	constant SRL_M:  std_logic_vector:="00000001010000000000";
	
	constant Memoria: ROM:=(
									ADD,			--00
									SUB,			--01
									AND_M,		--02
									OR_M,			--03
									XOR_M,		--04
									NAND_M,		--05
									NOR_M,		--06
									XNOR_M,		--07
									NOT_M,		--08
									SLL_M,		--09
									SRL_M,		--10
									others=>(others=>'0')
									);
begin

	MicroinstruccionFuncion<=Memoria(conv_integer(BusDir));

end Behavioral;