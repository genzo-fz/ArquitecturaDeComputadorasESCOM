library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity regEdo is
    Port ( CLK, CLR, LF : in  STD_LOGIC;
           BAN : in  STD_LOGIC_VECTOR (3 downto 0);
           RBAN : out  STD_LOGIC_VECTOR (3 downto 0));
end regEdo;

architecture Behavioral of regEdo is

begin
	PROCESS(CLK, CLR)BEGIN
		IF CLR = '1' THEN
			RBAN <= X"0";
		ELSIF (CLK'EVENT AND CLK='0') THEN
			IF LF = '1' THEN
				RBAN <= BAN;
			END IF;
		END IF;
	END PROCESS;
end Behavioral;

