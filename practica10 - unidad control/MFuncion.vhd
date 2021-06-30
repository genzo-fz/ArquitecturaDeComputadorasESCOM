library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity MFuncion is
	 generic (
		DL : integer := 20;
		AL : integer := 4);
    Port ( A : in  STD_LOGIC_VECTOR (AL-1 downto 0);
           D : out  STD_LOGIC_VECTOR (DL-1 downto 0));
end MFuncion;

architecture Behavioral of MFuncion is
	constant add: 	std_logic_vector := X"04433";
	constant sub: 	std_logic_vector := X"04473";
	
	constant opand:  	std_logic_vector := X"04403"; --and  0000
	constant opor: 	std_logic_vector := X"04413"; --or   0001 
	constant opxor: 	std_logic_vector := X"04423"; --xor  0010
	constant opnand: 	std_logic_vector := X"044D3"; --nand 1101
	constant opnor: 	std_logic_vector := X"044C3"; --nor  1100
	constant opxnor: 	std_logic_vector := X"044A3"; --xnor 1010
	constant opnot: 	std_logic_vector := X"044D3"; --not  1101
	
	constant opsll: 	std_logic_vector := X"01400";
	constant opsrl: 	std_logic_vector := X"01C00";
	
	type banco is array (0 to (2**AL)-1) of std_logic_vector(DL-1 downto 0);
	constant memoria : banco := (
		ADD,		--00
		SUB,		--01
		
		OPAND,	--02
		OPOR,		--03
		OPXOR,	--04
		OPNAND,	--05
		OPNOR,	--06
		OPXNOR,	--07
		OPNOT,	--08
		
		OPSLL,	--09
		OPSRL,	--10
					--11
					--12
					--13
					--14
					--15
		others => (others => '0'));
begin
	D <= memoria(conv_integer(A));
end Behavioral;