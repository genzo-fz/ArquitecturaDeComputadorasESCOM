library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dmux is
	port(WSP: in std_logic_vector(2 downto 0);
			wpc: in std_logic;
			dexa: out std_logic_vector(7 downto 0));
end dmux;

architecture Behavioral of dmux is
begin
	dexa(0) <= wpc when WSP = "000" else '0';
	dexa(1) <= wpc when WSP = "001" else '0';
	dexa(2) <= wpc when WSP = "010" else '0';
	dexa(3) <= wpc when WSP = "011" else '0';
	dexa(4) <= wpc when WSP = "100" else '0';
	dexa(5) <= wpc when WSP = "101" else '0';
	dexa(6) <= wpc when WSP = "110" else '0';
	dexa(7) <= wpc when WSP = "111" else '0';
end Behavioral;

