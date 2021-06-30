library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity CodigoOperacionROM is
	generic
	(
		--Tamaño del Bus de Microinstrucciones
		constant tamWord: integer:=20;
		--Tamaño del Bus de Direcciones
		constant tamDir: integer:=5
	);
	port
	(
		--Bus de Direcciones
		BusDir: in std_logic_vector(tamDir-1 downto 0);
		--Bus de Instrucciones
		MicroInstruccionOP: out std_logic_vector(tamWord-1 downto 0)
	);
end CodigoOperacionROM;

architecture Behavioral of CodigoOperacionROM is
	type ROM is array(0 to ((2**tamDir)-1)) of std_logic_vector(tamWord-1 downto 0);
	--Microinstruccion
	--SDMP,UP,DW,WPC,SR2,SWD,SEXT,SHE,DIR,WR,SOP1,SOP2,ALUOP[3],ALUOP[2],ALUOP[1],ALUOP[0],SDMD,WD,SR,LF
	constant verificacion: std_logic_vector:="00001000000001110001";
	constant LI:  std_logic_vector:="00000000010000000000";
	constant LWI: std_logic_vector:="00000100010000001000";
	constant SWI: std_logic_vector:="00001000000000001100";
	constant SW:  std_logic_vector:="00001010000100110100";
	
	constant ADDI:  std_logic_vector:="00000100010100110010";
	constant SUBI:  std_logic_vector:="00000100010101110010";
	constant ANDI:  std_logic_vector:="00000100010100000010";
	constant ORI:   std_logic_vector:="00000100010100010010";
	constant XORI:  std_logic_vector:="00000100010100100010";
	constant NANDI: std_logic_vector:="00000100010111010010";
	constant NORI:  std_logic_vector:="00000100010111000010";
	constant XNORI: std_logic_vector:="00000100010110100010";
	constant salto: std_logic_vector:="10010000001100110010"; 
	constant B: 	 std_logic_vector:="00010000000000000000";
	constant CALL:  std_logic_vector:="01010000000000000000";
	constant RET: 	 std_logic_vector:="00100000000000000000";
	constant NOP: 	 std_logic_vector(tamWord-1 downto 0):=(others=>'0');
	constant LW: 	 std_logic_vector:="00000110010100110000";
	
	constant Memoria: ROM:=(
									verificacion, 	--00
									LI,				--01
									LWI,				--02
									SWI,				--03
									SW,				--04
									ADDI,				--05
									SUBI,				--06
									ANDI,				--07
									ORI,				--08
									XORI,				--09
									NANDI,			--10
									NORI,				--11
									XNORI,			--12
									salto,			--13
									salto,			--14
									salto,			--15
									salto,			--16
									salto,			--17
									salto,			--18
									B,					--19
									CALL,				--20
									RET,				--21
									NOP,				--22
									LW,				--23
									others=>(others=>'0')
									);
begin

	MicroInstruccionOP<=Memoria(conv_integer(BusDir));
	
end Behavioral;