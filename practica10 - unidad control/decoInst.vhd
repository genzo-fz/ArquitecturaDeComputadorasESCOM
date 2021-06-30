library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoInst is
    Port ( INS : in  STD_LOGIC_VECTOR (4 downto 0);
           TIPOR, BEQI, BNEQI, BLTI, BLETI, BGTI, BGETI : out  STD_LOGIC);
end decoInst;

architecture Behavioral of decoInst is
begin
	TIPOR <= '1' WHEN INS = "00000" ELSE '0';
	BEQI <= 	'1' WHEN INS = "01101" ELSE '0';
	BNEQI <=	'1' WHEN INS = "01110" ELSE '0';
	BLTI <= 	'1' WHEN INS = "01111" ELSE '0';
	BLETI <= '1' WHEN INS = "10000" ELSE '0';
	BGTI <= 	'1' WHEN INS = "10001" ELSE '0';
	BGETI <= '1' WHEN INS = "10010" ELSE '0';

end Behavioral;

