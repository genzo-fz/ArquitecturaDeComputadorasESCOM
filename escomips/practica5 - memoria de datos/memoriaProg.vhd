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
LI&R0&x"0001", 		--0 LI R0, #1
LI&R0&x"0001", 		--1 LI R1, #7
CALL&SU&x"0005", 	--2 CICLO: CALL SUMA
SWI&R1&x"0005", 	--3 SWI R1, 5
B&SU&x"0003", 		--4 B CICLO
TR&R1&R1&R0&SU&ADD,	--5 SUMA: ADD R1, R1, R0
RET&x"00000", 				--6 RET
others => (others => '0')
);
begin
	datosOut <= memoria(conv_integer(dir));
end Behavioral;