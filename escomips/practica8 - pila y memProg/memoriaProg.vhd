library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity memoriaProg is
	generic (
		d : integer := 25;
		a : integer := 16
		);
    Port ( dir : in  STD_LOGIC_VECTOR (a-1 downto 0);
           datosOut : out  STD_LOGIC_VECTOR (d-1 downto 0));
end memoriaProg;

architecture Behavioral of memoriaProg is
---------------------------------------------------------------comandos
----TIPO R
constant TR  : std_logic_vector(4 downto 0) := 	"00000";
constant ADD : std_logic_vector(3 downto 0) := 	"0000";
constant SUB : std_logic_vector(3 downto 0) := 	"0001";

constant OPAND : std_logic_vector(3 downto 0) :=  "0010";
constant OPOR : std_logic_vector(3 downto 0) :=   "0011";
constant OPXOR : std_logic_vector(3 downto 0) :=  "0100";
constant OPNAND: std_logic_vector(3 downto 0) :=  "0101";
constant OPNOR : std_logic_vector(3 downto 0) :=  "0110";
constant OPXNOR : std_logic_vector(3 downto 0) := "0111";
constant OPNOT : std_logic_vector(3 downto 0) :=  "1000";

constant OPSLL : std_logic_vector(3 downto 0) :=  "1001";
constant OPSRL : std_logic_vector(3 downto 0) :=  "1010";
-----------
----TIPO I
constant LI : std_logic_vector(4 downto 0) :=  	"00001";
constant LWI : std_logic_vector(4 downto 0) := 	"00010";
constant LW : std_logic_vector(4 downto 0) :=  	"10111";
constant SWI : std_logic_vector(4 downto 0) := 	"00011";
constant SW : std_logic_vector(4 downto 0) :=  	"00100";

constant ADDI : std_logic_vector(4 downto 0):= 	"00101";
constant SUBI : std_logic_vector(4 downto 0):= 	"00110";

constant ANDI: std_logic_vector(4 downto 0) :=  "00111";
constant ORI : std_logic_vector(4 downto 0) :=  "01000";
constant XORI : std_logic_vector(4 downto 0) := "01001";
constant NANDI : std_logic_vector(4 downto 0):= "01010";
constant NORI: std_logic_vector(4 downto 0) :=  "01011";
constant XNORI : std_logic_vector(4 downto 0):= "01100";

constant BEQI : std_logic_vector(4 downto 0):= 	"01101";
constant BNEI : std_logic_vector(4 downto 0):= 	"01110";
constant BLTI : std_logic_vector(4 downto 0):= 	"01111";
constant BLETI : std_logic_vector(4 downto 0):=	"10000";
constant BGTI : std_logic_vector(4 downto 0):= 	"10001";
constant BGETI : std_logic_vector(4 downto 0):=	"10010";
-----------
-----TIPO J
constant B: std_logic_vector(4 downto 0):=     "10011";
constant CALL : std_logic_vector(4 downto 0):= "10100";
-----------
-----OTRAS
constant RET : std_logic_vector(4 downto 0):= "10101";
constant NOP : std_logic_vector(4 downto 0):= "10110";
constant SU : std_logic_vector(3 downto 0) := "0000";
----------
constant r0 : std_logic_vector(3 downto 0) := "0000";
constant r1 : std_logic_vector(3 downto 0) := "0001";
constant r2 : std_logic_vector(3 downto 0) := "0010";
constant r3 : std_logic_vector(3 downto 0) := "0011";
constant r4 : std_logic_vector(3 downto 0) := "0100";
constant r5 : std_logic_vector(3 downto 0) := "0101";
constant r6 : std_logic_vector(3 downto 0) := "0110";
constant r7 : std_logic_vector(3 downto 0) := "0111";
constant r8 : std_logic_vector(3 downto 0) := "1000";
constant r9 : std_logic_vector(3 downto 0) := "1001";
constant r10 : std_logic_vector(3 downto 0) := "1010";
constant r11 : std_logic_vector(3 downto 0) := "1011";
constant r12 : std_logic_vector(3 downto 0) := "1100";
constant r13 : std_logic_vector(3 downto 0) := "1101";
constant r14 : std_logic_vector(3 downto 0) := "1110";
constant r15 : std_logic_vector(3 downto 0) := "1111";
---------------------------------------------------------------comandos
type banco is array (0 to (2**a)-1) of std_logic_vector(d-1 downto 0);
constant memoria : banco := (
---PROGRAMA 1------------------------------------------------
--	LI&R0&x"0001", 			--0. LI R0, #1
--	LI&R1&x"0007", 			--1. LI R1, #7
--	CALL&SU&x"0005", 			--2. CICLO: CALL SUMA
--	SWI&R1&x"0005", 			--3. SWI R1, 5
--	B&SU&x"0002", 				--4. B CICLO
--	TR&R1&R1&R0&SU&ADD,		--5. SUMA: ADD R1, R1, R0
--	RET&x"00000", 				--6. RET
-------------------------------------------------------------
---PROGRAMA 2------------------------------------------------
--	LI&R0&x"0001", 			--0.  LI R0, #1
--	LI&R1&x"0000", 			--1.  LI R1, #0
--	LI&R2&x"000a", 			--2.  LI R2, #10
--	LI&R3&x"0001", 			--3.  LI R3, #1
--	LI&R4&x"0000", 			--4.  LI R4, #0
--	SWI&R3&x"0076", 			--5.  SWI R3, 76
--	TR&R0&R1&R0&SU&ADD,		--6.  SUMA: ADD R0, R1, R0
--	LWI&R1&X"0076",			--7.  LWI R1, 76
--	SWI&R0&x"0076", 			--8.  SWI R0, 76
--	TR&R4&R4&R3&SU&ADD,		--9.  SUMA: ADD R4, R4, R3
--	BLTI&R2&R3&X"ffb",   	--10. BLTI R2, R3, -4 (1111 1111 1011)
--	NOP&X"00000",				--11. NOP
--	B&SU&x"000b", 				--12. B CICLO
-------------------------------------------------------------
---PROGRAMA 3------------------------------------------------
	LI&R1&x"0001", 			--0. LI R1, #1
	LI&R2&x"0011", 			--1. LI R2, #1
	LI&R3&x"0010", 			--2. LI R3, #1
	ADDI&R4&R1&X"000",		--3. ADDI R4 R1 0
	BLTI&R4&R2&X"009",		--4. BLTI R4 R2 S1
	BLTI&R4&R3&X"00b",		--5. SALTO1: BLTI R4 R3 S2
	SWI&R4&X"0026",			--6. SALTO2: SWI  R4 26
	NOP&X"00000",				--7. NOP
	B&SU&x"0004", 				--8. B 5
	--S1
	ADDI&R4&R3&X"000",		--9. ADDI R4 R3 0
	B&SU&x"0005", 				--10. B SALTO1
	--S1
	ADDI&R4&R3&X"000",		--11. ADDI R4 R3 0
	B&SU&x"0006", 				--12. B SALTO1
	
----------ALT	
--	li&R0&x"0003",				--0. LI  R0 3
--	SWI&R0&x"0095",			--0. SWI R0 95
--	li&R0&x"0020",				--0. LI  R0 20 
--	SWI&R0&x"0096",			--0. SWI R0,96
--	li&R0&x"0005",				--0. LI  RO 5
--	SWI&R0&x"0097",			--0. SWI R0 97
--	li&R0&x"0002",				--0. LI  RO 2
--	SWI&R0&x"0098",			--0. SWI R0 98
--	LWI&R0&x"0095",			--0. LWI R0 mem[95]
--	TR&R1&R1&R0&SU&ADD, 		--0. add R1 R1 R0	
--	LWI&R0&x"0096",			--0. LWI R0,mem[96]
--	TR&R1&R1&R0&SU&ADD, 		--0. add R1 R1 R0
--	LWI&R0&x"0097",			--0. LWI R0,mem[97]
--	TR&R1&R1&R0&SU&ADD, 		--0. add R1 R1 R0
--	LWI&R0&x"0098",			--0. LWI R0,mem[98]
--	TR&R1&R1&R0&SU&ADD, 		--0. add R1 R1 R0
--	TR&R1&R1&SU&x"2"&OPSRL,	--0. sRl R1,R1,2
--	SWI&R1&x"0000",			--0. mem[00]=R1
-------------------------------------------------------------

---BUBBLE SORT------------------------------------------------
--	call & SU & x"0006", 					--	(0) B ARREGLO -> (6)
--	call & SU & x"0013", 					--	(1) B BURBUJA -> (22)
--	call & SU & x"0024",					--	(2) B MOSTRAR -> (42)
--	B & SU & x"0002",						--	(3) B (2)
----FIN-------------------------------------------------------------
--	NOP & SU & SU & SU & SU & SU,			--	(4) NOP FIN 
--	B & SU & x"0004",						--	(5) Branch - - - - - - 
----ARREGLO---------------------------------------------------------								
--	LI & R1 & x"0005",						--	(6)	 R1 = 5- - - - - -    				
--	SWI & R1 & x"0000", 					--  (7)  men[0] = R1 = 5
--	LI & R1 & x"0004",						--	(8)	 R1 = 4- - - - - -    				
--	SWI & R1 & x"0001", 					--  (9)  men[1] = R1 = 4
--	LI & R1 & x"0003",						--	(10) R1 = 0- - - - - -    				
--	SWI & R1 & x"0002", 					--  (11) mem[2] = R1 = 3 
--	LI & R1 & x"0002",						--	(12) R1 = 2 - - - - -     				
--	SWI & R1 & x"0003", 					-- 	(13) mem[3] = R1 = 2
--	LI & R1 & x"0001",						--	(14) R1 = 1 - - - - -     				
--	SWI & R1 & x"0004", 					--  (15) mem[4] = R1 = 1
--	LWI & R1 & x"0001",						--	(16) R1 = mem[1] = 4 -    				
--	ADDI & R1 & R1 & x"000", 				--  (17) R1 = R1
--	ret & SU & SU & SU & SU & SU,			--  (18) - - FIN ARREGLO-          	
----BURBUJA---------------------------------------------------------
-- LI & R10 & x"0004",						--	(19) LIMITE I   R10= 4
-- LI & R11 & x"0004",						--	(20) LIMITE J   R11= 4
--	LI & R2 & x"0000",						--	(21) CONTADOR I R2 = 0
--	LI & R3 & x"0001",						--	(22) Contador J	R3 = 1
----CICLO I---------------------------------------------------------
----CICLO J---------------------------------------------------------
--	SUBI & R6 & R3 & x"001",				--	(23) R6 = R3 - 1 = 0 -
--	LW & R4 & R6 & x"000",					--	(24) R4 = MEM[J - 1] -
--	LW & R5 & R3 & x"000",					--	(25) R5 = MEM[J] - - -
--	ADDI & R4 & R4 & x"000",				--	(26) R4 = R4
--	ADDI & R5 & R5 & x"000",				--	(27) R5 = R5
--	BLETI & R5 & R4 & x"005",				--	(28) BLTI INCREMENTO J R4 <= R5 -> (26 + 5)
------INTERCAMBIO-----------------------------------------------------
--	SW & R4 & R3 & "000000000000",			--	(29) MEM[R6 + 0] = R4
--	SW & R5 & R6 & "000000000000",			--	(30) MEM[R3 + 0] = R5
----INCREMENTO J ---------------------------------------------------
-- ADDI & R3 & R3 & "000000000001",		--	(31) R3 = J (R8) + 1
--	BLETI & R11 & R3 & "111111110111",		--	(32) BNEI CICLO J R3 <= R11 = 4 -> 32 - 9
----INCREMENTO I----------------------------------------------------
--	ADDI  & R2 & R2 & "000000000001",		--	(33) R2 = R9 + 1
--	BLETI & R10 & R2 & "111111110100",		--	(34) BNEI CICLO I R2 <= R10 = 4 -> 34-12
--	ret & SU & SU & SU & SU & SU,			--	(35) Regresar FIN Burbuja
----MOSTRAR---------------------------------------------------------------
--	LWI & R14 & x"0000",					--	(36) R14 = MEM[0]
--	ADDI & R14 & R14 & x"000",				--  (37)
--	LWI & R14 & x"0001",					--	(38) R14 = MEM[1]
--	ADDI & R14 & R14 & x"000",				--  (39)
--	LWI & R14 & x"0002",					--	(40) R14 = MEM[2]
--	ADDI & R14 & R14 & x"000",				--  (41)
--	LWI & R14 & x"0003",					--	(42) R14 = MEM[3]
--	ADDI & R14 & R14 & x"000",				--  (43)
--	LWI & R14 & x"0004",					--	(44) R14 = MEM[4]
--	ADDI & R14 & R14 & x"000",				--  (45)
--	B&su&x"0024",							--	(46) CICLADO
--	ret & SU & SU & SU & SU & SU,

others => (others => '0')
);
begin
	datosOut <= memoria(conv_integer(dir));
end Behavioral;