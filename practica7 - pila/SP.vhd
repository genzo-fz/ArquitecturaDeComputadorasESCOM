library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity SP is
    Port ( up, dw, clk, clr : in  STD_LOGIC;
           sp_out : inout  STD_LOGIC_VECTOR (2 downto 0));
end SP;

architecture Behavioral of SP is

begin
	STACK: PROCESS(CLK, CLR)
	BEGIN
		IF CLR = '1' THEN
			sp_out <= "000";
		ELSIF RISING_EDGE(CLK) THEN
			IF UP = '1' THEN
				sp_out <= sp_out + 1;
			ELSIF DW = '1' THEN
				sp_out <= sp_out - 1;
			END IF;
		END IF;
	END PROCESS;

end Behavioral;

