----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sumador is
    Port ( a, b, cin : in  STD_LOGIC;
           s, cout : out  STD_LOGIC);
end sumador;

architecture Behavioral of sumador is
signal ebi: std_logic;
begin
	ebi 	<= b;--cin xor b;
	s		<= a xor ebi xor cin;
	cout	<= (a and ebi) or (a and cin) or (ebi and cin);
end Behavioral;
