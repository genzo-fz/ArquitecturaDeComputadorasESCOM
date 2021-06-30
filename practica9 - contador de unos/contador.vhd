library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use ieee.std_logic_unsigned.all;

entity contador is
    Port ( CLK, CLR, L, I : in  STD_LOGIC;
           B : out  STD_LOGIC_VECTOR (3 downto 0));
end contador;

architecture Behavioral of contador is
	CONSTANT CARGA: STD_LOGIC_VECTOR := "0000";
begin
	CONTADOR: PROCESS (CLK, CLR)
		VARIABLE BE: STD_LOGIC_VECTOR (3 downto 0);
	BEGIN
		IF CLR = '1' THEN
			BE := x"0";
		ELSIF rising_edge(clk) THEN
			IF L = '1' THEN
				BE := CARGA;
			ELSIF I = '1' THEN
				BE := BE + 1;
			END IF;
		END IF;
		B <= BE;
	END PROCESS;

end Behavioral;

