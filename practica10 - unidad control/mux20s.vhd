library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux20s is
    Port ( MF, MOP : in  STD_LOGIC_VECTOR (19 downto 0);
           SM : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (19 downto 0));
end mux20s;

architecture Behavioral of mux20s is

begin
	S <= MOP WHEN SM = '1' ELSE MF;
end Behavioral;

