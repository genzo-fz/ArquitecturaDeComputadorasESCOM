library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity unidadC is
    Port ( TIPOR,BEQ,BNEQ,BLT, BLE, BGT, BGET, NA : in  STD_LOGIC;
           EQ, NEQ, LT, LE, GTI, GET : in  STD_LOGIC;
           CLK, CLR : in  STD_LOGIC;
           SDOPC, SM : out  STD_LOGIC);
end unidadC;

architecture Behavioral of unidadC is

begin
----------
EDOS: PROCESS (CLK, CLR, TIPOR, BEQ, BNEQ, BLT, BLE, BGT, BGET, NA, EQ, NEQ, LT, LE, GTI, GET)BEGIN
				IF CLR = '1' THEN
					SDOPC <= '0';
					SM <= '0';
				ELSIF RISING_EDGE(CLK) THEN
					IF TIPOR = '1' THEN------------------TIPOR
						SDOPC <= '0';
						SM <= '0';
					ELSE
						IF BEQ = '1' THEN----------------BEQ
							IF NA = '1' THEN-------------VERIF
								SDOPC <= '0';
								SM <= '1';
							ELSIF EQ = '1' THEN---------SALTO
								SDOPC <= '1';
								SM <= '1';
							ELSE
								SDOPC <= '0';
								SM <= '1';
							END IF;
						ELSIF BNEQ = '1' THEN----------------BNEQ
							IF NA = '1' THEN-------------VERIF
								SDOPC <= '0';
								SM <= '1';
							ELSIF NEQ = '1' THEN---------SALTO
								SDOPC <= '1';
								SM <= '1';
							ELSE
								SDOPC <= '0';
								SM <= '1';
							END IF;
						ELSIF BLT = '1' THEN----------------BLT
							IF NA = '1' THEN-------------VERIF
								SDOPC <= '0';
								SM <= '1';
							ELSIF LT = '1' THEN---------SALTO
								SDOPC <= '1';
								SM <= '1';
							ELSE
								SDOPC <= '0';
								SM <= '1';
							END IF;
						ELSIF BLE = '1' THEN----------------BLE
							IF NA = '1' THEN-------------VERIF
								SDOPC <= '0';
								SM <= '1';
							ELSIF LE = '1' THEN---------SALTO
								SDOPC <= '1';
								SM <= '1';
							ELSE
								SDOPC <= '0';
								SM <= '1';
							END IF;
						ELSIF BGT = '1' THEN----------------BGT
							IF NA = '1' THEN-------------VERIF
								SDOPC <= '0';
								SM <= '1';
							ELSIF GTI = '1' THEN---------SALTO
								SDOPC <= '1';
								SM <= '1';
							ELSE
								SDOPC <= '0';
								SM <= '1';
							END IF;
						ELSIF BGET = '1' THEN----------------BGET
							IF NA = '1' THEN-------------VERIF
								SDOPC <= '0';
								SM <= '1';
							ELSIF GET = '1' THEN---------SALTO
								SDOPC <= '1';
								SM <= '1';
							ELSE
								SDOPC <= '0';
								SM <= '1';
							END IF;
						END IF;
					END IF;
				END IF;
			END PROCESS;

end Behavioral;

