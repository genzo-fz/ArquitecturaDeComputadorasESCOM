library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BZ is
    Port ( CZ : in  STD_LOGIC_VECTOR (8 downto 0);
           Z : out  STD_LOGIC);
end BZ;

architecture Behavioral of BZ is

begin
	Z <= NOT(CZ(8) OR CZ(7) OR CZ(6) OR 
				CZ(5) OR CZ(4) OR CZ(3) OR 
				CZ(2) OR CZ(1) OR CZ(0));
	
end Behavioral;

