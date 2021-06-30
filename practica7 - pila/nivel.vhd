library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity nivel is
    Port ( D : in  STD_LOGIC_VECTOR (15 downto 0);
           L, clk, clr : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (15 downto 0));
end nivel;

architecture Behavioral of nivel is

begin
	nivel: process(CLK, CLR)begin
		if CLR = '1' then
			Q<=x"0000";
		elsif rising_edge(CLK) then
			if L = '1' then
				Q<=D;
			end if;
		end if;
	end process;

end Behavioral;
