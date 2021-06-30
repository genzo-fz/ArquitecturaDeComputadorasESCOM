library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity barrelShifter is
	generic(	n: integer := 4;
				t: integer := 16);
    Port ( D : in  STD_LOGIC_VECTOR (t-1 downto 0);
           SHA : in  STD_LOGIC_VECTOR (n-1 downto 0);
           DIR : in  STD_LOGIC;
           CR : out  STD_LOGIC_VECTOR (t-1 downto 0));
end barrelShifter;

architecture Behavioral of barrelShifter is 
begin
	process(DIR, SHA, D)
		variable DATA: STD_LOGIC_VECTOR (t-1 downto 0);
	begin
		DATA := D;
		if DIR='1' then----corrimiento a la derecha
			for i in 0 to n-1 loop
				for j in t-1 downto 0 loop
					if SHA(i) = '1' then
						if j<2**i then
							DATA(j) := '0';
						else
							DATA(j) := DATA(j-(2**i));
						end if;
					end if;
				end loop;
			end loop;
		else--------------corrimiento a la izquierda
			for i in 0 to n-1 loop
				for j in 0 to t-1 loop
					if SHA(i) = '1' then
						if j>((t-1)-2**i) then
							DATA(j) := '0';
						else
							DATA(j) := DATA(j+(2**i));
						end if;
					end if;
				end loop;
			end loop;
		end if;
		CR <= DATA;
	end process;
end Behavioral;

