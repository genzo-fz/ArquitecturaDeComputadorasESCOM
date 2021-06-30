library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux5b is
    Port ( I : in  STD_LOGIC_VECTOR (4 downto 0);
           SDOPC : in  STD_LOGIC;
           IOUT : out  STD_LOGIC_VECTOR (4 downto 0));
end mux5b;

architecture Behavioral of mux5b is
begin
	IOUT <= I WHEN SDOPC = '1' ELSE "00000";

end Behavioral;

