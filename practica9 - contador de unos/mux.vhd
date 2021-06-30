library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux is
    Port ( 	deco : in  STD_LOGIC_VECTOR (6 downto 0);
				op: in std_logic;
				Q : out  STD_LOGIC_VECTOR (6 downto 0));
end mux;

architecture Behavioral of mux is
	constant di: std_logic_vector :="1111110";
begin
	q <= 	deco when op = '1' else
			di;

end Behavioral;

