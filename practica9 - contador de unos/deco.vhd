library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity deco is
    Port ( D : in  STD_LOGIC_VECTOR (3 downto 0);
           Q : out  STD_LOGIC_VECTOR(6 downto 0));
end deco;

architecture Behavioral of deco is
	constant d0: std_logic_vector :="0000001";
	constant d1: std_logic_vector :="1001111";
	constant d2: std_logic_vector :="0010010";
	constant d3: std_logic_vector :="0000110";
	constant d4: std_logic_vector :="1001100";
	constant d5: std_logic_vector :="0100100";
	constant d6: std_logic_vector :="0100000";
	constant d7: std_logic_vector :="0001111";
	constant d8: std_logic_vector :="0000000";
	constant d9: std_logic_vector :="0000100";
	constant di: std_logic_vector :="0110110";
	
begin
	Q <=  d0	WHEN D = x"0" ELSE
			d1	WHEN D = x"1" ELSE
			d2	WHEN D = x"2" else
			d3	WHEN D = x"3" ELSE
			d4	WHEN D = x"4" ELSE
			d5	WHEN D = x"5" ELSE
			d6	WHEN D = x"6" ELSE
			d7	WHEN D = x"7" ELSE
			d8	WHEN D = x"8" ELSE
			d9 WHEN D = x"9" ELSE
			di;
end Behavioral;