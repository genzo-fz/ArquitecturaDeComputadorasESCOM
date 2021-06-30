library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pilaMem is
	generic (
		d : integer := 25;
		a : integer := 16
		);
	port(	 	pc_in : in  STD_LOGIC_VECTOR (a-1 downto 0);
				clk, clr, up, dw, wpc : in  STD_LOGIC;
				pc_out : out  STD_LOGIC_VECTOR (a-1 downto 0);
				datosOut : out  STD_LOGIC_VECTOR (d-1 downto 0)
				);
end pilaMem;

architecture Behavioral of pilaMem is
	component pila is
    Port ( pc_in : in  STD_LOGIC_VECTOR (a-1 downto 0);
           clk, clr, up, dw, wpc : in  STD_LOGIC;
           pc_out : out  STD_LOGIC_VECTOR (a-1 downto 0)
			);
	end component;
	
	component memoriaProg is
    Port ( dir : in  STD_LOGIC_VECTOR (a-1 downto 0);
           datosOut : out  STD_LOGIC_VECTOR (d-1 downto 0));
	end component;
	
	signal dir_a: STD_LOGIC_VECTOR (a-1 downto 0);
begin
	p: pila
    Port map( pc_in => pc_in, 
           clk => clk, 
           clr => clr, 
           up => up, 
           dw => dw, 
           wpc => wpc,
           pc_out => dir_a
          	);
    memo: memoriaProg
    Port map( dir => dir_a,
           datosOut => datosOut);
	pc_out <= dir_a;
end Behavioral;

