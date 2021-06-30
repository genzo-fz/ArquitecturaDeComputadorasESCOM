library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dmux is
	port(	wra: in std_logic_vector(3 downto 0);
			wda: in std_logic;
			dexa: out std_logic_vector(15 downto 0));
end dmux;

architecture Behavioral of dmux is
begin
	dexa(0) <= wda when wra = "0000" else '0';
	dexa(1) <= wda when wra = "0001" else '0';
	dexa(2) <= wda when wra = "0010" else '0';
	dexa(3) <= wda when wra = "0011" else '0';
	dexa(4) <= wda when wra = "0100" else '0';
	dexa(5) <= wda when wra = "0101" else '0';
	dexa(6) <= wda when wra = "0110" else '0';
	dexa(7) <= wda when wra = "0111" else '0';
	dexa(8) <= wda when wra = "1000" else '0';
	dexa(9) <= wda when wra = "1001" else '0';
	dexa(10) <= wda when wra = "1010" else '0';
	dexa(11) <= wda when wra = "1011" else '0';
	dexa(12) <= wda when wra = "1100" else '0';
	dexa(13) <= wda when wra = "1101" else '0';
	dexa(14) <= wda when wra = "1110" else '0';
	dexa(15) <= wda when wra = "1111" else '0';
end Behavioral;

