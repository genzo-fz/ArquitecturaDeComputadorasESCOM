Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity UC is
    Port ( CLK, CLR, INI, A0, Z : in  STD_LOGIC;
           LA, EA, EC, EB, LB : out  STD_LOGIC);
end UC;

architecture Behavioral of UC is
type estados is (E0, E1, E2);
signal EDO_ACT, EDO_SIG: estados; 
begin
----------
EDOS: PROCESS (CLK, CLR)BEGIN
				IF CLR = '1' THEN
					EDO_ACT <= E0;
				ELSIF RISING_EDGE(CLK) THEN
					EDO_ACT <= EDO_SIG;
				END IF;
			END PROCESS;
----------
TRANS: PROCESS (EDO_ACT, A0, INI, Z) BEGIN
				LA <= '0';
				EA <= '0';
				EC <= '0';
				EB <= '0';
				LB <= '0';
				CASE EDO_ACT IS
					WHEN E0 =>----------------- ESTADO 0 
						LB <= '1';--
						IF INI = '1' THEN--
							EDO_SIG <= E1; 
						ELSE
							LA <= '1';
							EDO_SIG <= E0;
						END IF;
						
					WHEN E1 =>----------------- ESTADO 1
						EA <= '1';
						IF Z = '1' THEN
							EDO_SIG <= E2; 
						ELSE
							IF A0 = '1' THEN
								EB <= '1';
							END IF;
							EDO_SIG <= E1;
						END IF;
						
					WHEN E2 =>----------------- ESTADO 2
						EC <= '1';
						IF INI = '1' THEN
							EDO_SIG <= E2;
						ELSE 
							EDO_SIG <= E0;
						END IF;
				END CASE;
			END PROCESS;
end Behavioral;

