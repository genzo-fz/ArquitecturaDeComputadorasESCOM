library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity UC is
    Port ( R, FLAGS : in  STD_LOGIC_VECTOR (3 downto 0);
           I : in  STD_LOGIC_VECTOR (4 downto 0);
           CLK, CLR, LF: in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (19 downto 0)
			  );
end UC;

architecture Behavioral of UC is
	component unidadC is
    Port ( TIPOR,BEQ,BNEQ,BLT, BLE, BGT, BGET, NA : in  STD_LOGIC;
           EQ, NEQ, LT, LE, GTI, GET : in  STD_LOGIC;
           CLK, CLR : in  STD_LOGIC;
           SDOPC, SM : out  STD_LOGIC);
	end component;

component regEdo is
    Port ( CLK, CLR, LF : in  STD_LOGIC;
           BAN : in  STD_LOGIC_VECTOR (3 downto 0);
           RBAN : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component nivel is
    Port ( clk, clr : in  STD_LOGIC;
           NA : out  STD_LOGIC);
end component;

component mux5b is
    Port ( I : in  STD_LOGIC_VECTOR (4 downto 0);
           SDOPC : in  STD_LOGIC;
           IOUT : out  STD_LOGIC_VECTOR (4 downto 0));
end component;

component mux20s is
    Port ( MF, MOP : in  STD_LOGIC_VECTOR (19 downto 0);
           SM : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (19 downto 0));
end component;

component decoInst is
    Port ( INS : in  STD_LOGIC_VECTOR (4 downto 0);
           TIPOR, BEQI, BNEQI, BLTI, BLETI, BGTI, BGETI : out  STD_LOGIC);
end component;

component condicion is
    Port ( rban : in  STD_LOGIC_VECTOR (3 downto 0);
           EQ, NEQ, LT, LE, GTI, GET : out  STD_LOGIC);
end component;

component MOpcode is
    Port ( A : in  STD_LOGIC_VECTOR (4 downto 0);
           D : out  STD_LOGIC_VECTOR (19 downto 0));
end component;

component MFuncion is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           D : out  STD_LOGIC_VECTOR (19 downto 0));
end component;

SIGNAL OTR, OTP: STD_LOGIC_VECTOR(19 DOWNTO 0);
SIGNAL IMUX: STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL RB: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL SDOPC, NA, SM: STD_LOGIC;
SIGNAL TIPOR,BEQI,BNEQI,BLTI, BLETI,BGTI,BGETI: STD_LOGIC; 
SIGNAL EQ,NEQ,LT,LE,GTI,GET :STD_LOGIC;
begin

microFuncion: MFuncion 
    Port map( 	A => R, 
					D => OTR);

muxMini: mux5b
    Port map( 	I => I,
					SDOPC => SDOPC,
					IOUT => IMUX);
	
microOp: MOpcode
    Port map( 	A => IMUX,
					D => OTP);
					
muxMega: mux20s 
    Port map( 	MF => OTR, 
					MOP => OTP,
					SM => SM,
					S => S);
					
level: nivel 
    Port map( 	clk => clk, 
					clr => clr,
					NA => NA);

decod:decoInst
    Port map( 	INS => I,
					TIPOR => TIPOR, 
					BEQI => BEQI, 
					BNEQI => BNEQI, 
					BLTI => BLTI, 
					BLETI => BLETI, 
					BGTI => BGTI, 
					BGETI => BGETI);
					
registro:regEdo    
	Port map( 	CLK => clk, 
					CLR => clr, 
					LF => LF,
					BAN => FLAGS,
					RBAN => RB);
					
cond:condicion 
    Port map( 	rban => RB,
					EQ => EQ, 
					NEQ => NEQ, 
					LT => LT, 
					LE => LE, 
					GTI => GTI, 
					GET => GET);

control:unidadC
    Port map( 	TIPOR => TIPOR,
					BEQ => BEQI,
					BNEQ => BNEQI,
					BLT => BLTI, 
					BLE => BLETI, 
					BGT => BGTI, 
					BGET => BGETI,
					NA => NA,
					EQ => EQ, 
					NEQ => NEQ, 
					LT => LT, 
					LE => LE, 
					GTI => GTI,
					GET => GET,
					CLK => CLK, 
					CLR => CLR,
					SDOPC => SDOPC, 
					SM => SM);

end Behavioral;

