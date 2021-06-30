library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity condicion is
    Port ( rban : in  STD_LOGIC_VECTOR (3 downto 0);
           EQ, NEQ, LT, LE, GTI, GET : out  STD_LOGIC);
end condicion;

architecture Behavioral of condicion is
	
begin
   -------------------------3210
	-------------------------0NZC
	EQ 	<= '1' when rban=	"0010" else '0'; 		-------------------Z=1  		  ==   rban=	"0010" 
	NEQ 	<= not rban(1); 			-------------------Z=0  		  !=
	LT 	<=	rban(2);					-------------------N=1          <
	LE 	<=(rban(2) or  rban(1)); ------------------N=1 o Z=1    <=
	GTI 	<= not rban(2);			-------------------N=0          >
	GET 	<=((not rban(2)) or  rban(1));-------------N=0 O Z=1    >=
end Behavioral;

