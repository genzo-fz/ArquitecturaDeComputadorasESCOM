library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registro is
    Port ( D : in  STD_LOGIC_VECTOR (15 downto 0);
           Q : out  STD_LOGIC_VECTOR (15 downto 0);
           L, CLK, CLR : in  STD_LOGIC);
end registro;

architecture Behavioral of registro is

begin
	process(CLK, CLR)begin
		if CLR = '1' then
			Q<=x"0000";
		elsif rising_edge(CLK) then
			if L = '1' then
				Q<=D;
			end if;
		end if;
	end process;
end Behavioral;

