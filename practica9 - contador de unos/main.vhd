library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
	Port (	INI, CLK, CLR : in  STD_LOGIC;
				D : in  STD_LOGIC_VECTOR (8 downto 0);
				A : out STD_LOGIC_VECTOR (8 downto 0);
				B : out STD_LOGIC_VECTOR (6 downto 0));
end main;

architecture Behavioral of main is
	component registro is--------------------------------------REGISTRO
    Port ( 	SH, L, CLK, CLR : in  STD_LOGIC;
				D : in  STD_LOGIC_VECTOR (8 downto 0);
				Q : out  STD_LOGIC_VECTOR (8 downto 0));
	end component;
	
	component contador is--------------------------------------CONTADOR
    Port ( 	CLK, CLR, L, I : in  STD_LOGIC;
				B : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;
	
	component deco is------------------------------------------DECO
    Port ( 	D : in  STD_LOGIC_VECTOR (3 downto 0);
				Q : out  STD_LOGIC_VECTOR(6 downto 0));
	end component;
	
	component mux is-------------------------------------------MUX
    Port ( 	deco : in  STD_LOGIC_VECTOR (6 downto 0);
				op: in std_logic;
				Q : out  STD_LOGIC_VECTOR (6 downto 0));
	end component;
	
	component UC is---------------------------------------------UNIDAD DE CONTROL
    Port ( CLK, CLR, INI, A0, Z : in  STD_LOGIC;
           LA, EA, EC, EB, LB : out  STD_LOGIC);
	end component;
	
	component BZ is---------------------------------------------BANDERA Z
    Port ( CZ : in  STD_LOGIC_VECTOR (8 downto 0);
           Z: out  STD_LOGIC);
	end component;
	------------------------------------------------------------SEÑALES
	signal A0, Z, LA, EA, EC, EB, LB: STD_LOGIC;
	signal B1: STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL CZ: STD_LOGIC_VECTOR(8 downto 0);
	SIGNAL B_AUX: STD_LOGIC_VECTOR(6 downto 0);
	
begin
	A <= CZ;
	A0 <= CZ(0);
	
	BAND_Z: BZ
	Port map( 	CZ => CZ,
					Z => Z
				);
		
	U_CTRL: UC
   Port MAP( 	------RELOJ
					CLK => CLK, 
					------ENTRADAS FISICAS
					CLR => CLR,
					INI => INI, 
					------ENTRADAS CON SEÑALES
					A0 => A0,
					Z => Z,
					------SALIDAS A COMPONENTES
					LA => LA, -- A = D
					EA => EA, -- A>>1
					EC => EC, -- MOSTRAR B
					EB => EB, -- B++
					LB => LB  -- B = 0
				);	
				
	CONT: contador 
   Port MAP( 	------RELOJ
					CLK => CLK,
					------ENTRADA FISICA
					CLR => CLR,
					------ENTRADAS POR LA UC
					L => LB, 
					I => EB,
					------SALIDA A DECO
					B => B1
				);
				
	 REG: registro
    Port MAP(  ------RELOJ
					CLK => CLK, 
					------ENTRADA FISICA
					CLR => CLR,
					D => D,
					------ENTRADA POR LA UC
					SH => EA, 
					L => LA,
					------SALIDA A LA UC
					Q => CZ
				);
				
	DEC: deco 
   Port MAP( 	------ENTRADA DEL CONTADOR
					D => B1,
					------SALIDA A MUX
					Q => B_AUX
				);
				
	MULT_PX: mux
   Port MAP(  	------ENTRADA DEL DECO
					deco => B_AUX,
					------ENTRADA DE UC
					op => EC,
					------SALIDA FISICA
					Q => B
				);			
end Behavioral;

