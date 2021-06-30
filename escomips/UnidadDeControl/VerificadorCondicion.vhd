library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity VerificadorCondicion is
	port
	(
		--Banderas de la ALU
		OV: in std_logic;
		Z: in std_logic;
		N: in std_logic;
		C: in std_logic;
		
		EQ: out std_logic;
		NEQ: out std_logic;
		LT: out std_logic;
		LET: out std_logic;
		GT: out std_logic;
		GET: out std_logic
	);
end VerificadorCondicion;

architecture Behavioral of VerificadorCondicion is

begin
--		--Igualdad
--		EQ<='1' when (z='1' and ov='0' and c='0' and n='0') else '0';
--		
--		--Desigualdad
--		NEQ<=(not Z);
--		
--		--Menor
--		LT<=(not C);
--		
--		--Menor o igual
--		LET<=(Z or (not C));
--		
--		--Mayor
--		GT<=(C and (not Z));
--		
--		--Mayor o igual
--		GET<=C;

		--Igualdad
		EQ<='1' when (z='1' and ov='0' and c='0' and n='0') else '0';
		--Desigualdad
		NEQ<=(not Z);
		--Menor
		LT<=n;
		--Menor o igual
		LET<=(Z or n);
		--Mayor
		GT<=(not n);
		--Mayor o igual
		GET<=((not n) or z);
		
--	EQ 	<= '1' when rban=	"0010" else '0'; 		-------------------Z=1  		  ==   rban=	"0010" 
--	NEQ 	<= not rban(1); 			-------------------Z=0  		  !=
--	LT 	<=	rban(2);					-------------------N=1          <
--	LE 	<=(rban(2) or  rban(1)); ------------------N=1 o Z=1    <=
--	GTI 	<= not rban(2);			-------------------N=0          >
--	GET 	<=((not rban(2)) or  rban(1));-------------N=0 O Z=1    >=
end Behavioral;