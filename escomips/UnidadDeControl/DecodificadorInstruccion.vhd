library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DecodificadorInstruccion is
	port
	(
		OP_CODE: in std_logic_vector(4 downto 0);
		
		TIPOR: 	out std_logic;
		BEQI: 	out std_logic;
		BNEI: 	out std_logic;
		BLTI: 	out std_logic;
		BLETI: 	out std_logic;
		BGTI: 	out std_logic;
		BGETI: 	out std_logic
	);
end DecodificadorInstruccion;

architecture Behavioral of DecodificadorInstruccion is
begin

	TIPOR	<= '1' when OP_CODE="00000" else '0';--00
	BEQI	<= '1' when OP_CODE="01101" else '0';--13
	BNEI	<= '1' when OP_CODE="01110" else '0';--14
	BLTI	<= '1' when OP_CODE="01111" else '0';--15
	BLETI	<= '1' when OP_CODE="10000" else '0';--16
	BGTI	<= '1' when OP_CODE="10001" else '0';--17
	BGETI	<= '1' when OP_CODE="10010" else '0';--18
	
end Behavioral;