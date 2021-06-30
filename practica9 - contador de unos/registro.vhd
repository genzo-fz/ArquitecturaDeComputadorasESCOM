library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registro is
    Port ( SH, L, CLK, CLR : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (8 downto 0);
           Q : out  STD_LOGIC_VECTOR (8 downto 0));
end registro;

architecture Behavioral of registro is
begin
	
	REGISTRO: PROCESS (CLR, CLK) 
		variable Dat: std_logic_vector(8 downto 0);
		BEGIN
			IF CLR = '1' THEN
				DAT := x"00"&'0';
			ELSIF CLK'event and CLK='1' THEN
				IF L = '1' THEN
					DAT:= D;
				ELSIF SH = '1' THEN
					for i in 0 to 8 loop
						if i > 7 then
							dat(i):= '0';
						else
							dat(i):= dat(i+1);
						end if;
					end loop;
				END IF;
			END IF;
			Q <= DAT;
		END PROCESS;
			

end Behavioral;

