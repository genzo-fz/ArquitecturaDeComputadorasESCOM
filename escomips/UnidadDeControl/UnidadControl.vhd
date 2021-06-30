library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity UnidadControl is
	port
	(
		
		TIPOR: in std_logic;
		BEQI: in std_logic;
		BNEI: in std_logic;
		BLTI: in std_logic;
		BLETI: in std_logic;
		BGTI: in std_logic;
		BGETI: in std_logic;
		
		NA: in std_logic;
		
		EQ: in std_logic;
		NEQ: in std_logic;
		LT: in std_logic;
		LET: in std_logic;
		GT: in std_logic;
		GET: in std_logic;
		
		SDOPC: out std_logic;
		SM: out std_logic
	);
end UnidadControl;

architecture Behavioral of UnidadControl is
	
begin
	
				
	SDOPC<=(
				(
					(not NA) and 
									(
										(BEQI  and EQ ) or
										(BNEI  and NEQ) or
										(BLTI  and LT ) or
										(BLETI and LET) or
										(BGTI  and GT ) or
										(BGETI and GET)
									)
				) or (not (TIPOR or BEQI or BNEI or BLTI or BLETI or BGTI or BGETI)) 
			);	
			
	SM<=(not TIPOR);
	
end Behavioral;