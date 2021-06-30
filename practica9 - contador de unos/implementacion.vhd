library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity implementacion is
	port(	INI, CLK, CLR : in  STD_LOGIC;
				D : in  STD_LOGIC_VECTOR (8 downto 0);
				A : out STD_LOGIC_VECTOR (8 downto 0);
				B : out STD_LOGIC_VECTOR (6 downto 0);
				clk_div : out  STD_LOGIC);
end implementacion;

architecture Behavioral of implementacion is
	component main is
	Port (	INI, CLK, CLR : in  STD_LOGIC;
				D : in  STD_LOGIC_VECTOR (8 downto 0);
				A : out STD_LOGIC_VECTOR (8 downto 0);
				B : out STD_LOGIC_VECTOR (6 downto 0));
	end component;
	
	component div_frec is
   Port ( clk : in  STD_LOGIC;
          clk_div : out  STD_LOGIC);
	end component;
	SIGNAL CLK_IMP: STD_LOGIC;
begin
	COMP: main
	Port MAP(	
					INI => INI, 
					CLK => CLK_IMP,
					CLR => CLR,
					D => D,
					A => A, 
					B => B
				);
				
	CLKD: div_frec
   Port MAP( 	clk => CLK, 
					clk_div => CLK_IMP
				);
				
	CLK_DIV <= CLK_IMP;
end Behavioral;

