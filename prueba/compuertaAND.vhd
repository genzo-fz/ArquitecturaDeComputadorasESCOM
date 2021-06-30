library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity compuertaAND is
    Port ( a, b : inout  STD_LOGIC;
           c : out  STD_LOGIC);
end compuertaAND;

architecture Behavioral of compuertaAND is
begin
	c <= a and b;
end Behavioral;

