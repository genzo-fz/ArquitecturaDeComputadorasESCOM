library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2a1 is
    Port ( 	ent1, ent2 : in  STD_LOGIC_VECTOR (15 downto 0);
				cond: in std_logic;
				msal : out  STD_LOGIC_VECTOR (15 downto 0));
end mux2a1;

architecture Behavioral of mux2a1 is
begin
	msal <= ent1 when cond='1' else ent2;
end Behavioral;

