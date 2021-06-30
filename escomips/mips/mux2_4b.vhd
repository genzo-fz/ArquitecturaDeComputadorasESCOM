library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2_4b is
    Port ( 	ent1, ent2 : in  STD_LOGIC_VECTOR (3 downto 0);
				cond : in  STD_LOGIC;
				msal : out  STD_LOGIC_VECTOR (3 downto 0));
end mux2_4b;

architecture Behavioral of mux2_4b is
begin
	msal <= ent1 when cond='1' else ent2;
end Behavioral;

