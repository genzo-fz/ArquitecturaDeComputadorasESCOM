library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use ieee.std_logic_unsigned.all;

entity div_frec is
	 generic ( c: integer := 23);--25~1hz    22~10hz 
    Port ( clk : in  STD_LOGIC;
           clk_div : out  STD_LOGIC := '0');
end div_frec;

architecture Behavioral of div_frec is
	constant max: integer := (2**c)-1;
begin
	reloj:process(clk)
				VARIABLE BE: INTEGER RANGE 0 TO (MAX);
				VARIABLE SW: STD_LOGIC := '0';
			BEGIN
				IF rising_edge(clk) THEN
					if (BE<max) then
						BE := BE+1;
					ELSE--
						SW := NOT SW;
						BE := 0;
					end if;
				end if;
				CLK_DIV <= SW;
			END PROCESS;
end Behavioral;