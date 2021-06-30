library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mips is
    Port ( 	clk, clr : in  STD_LOGIC;
				clk_div: out  STD_LOGIC;
				sal, pc: out  STD_LOGIC_VECTOR (7 downto 0));
end mips;

architecture Behavioral of mips is
	component escoMIPS is		
	port(		clr, clk: in std_logic;
				salida: out STD_LOGIC_VECTOR (7 downto 0);
				contador: out STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
	component div_frec is
	Port (	clk : in  STD_LOGIC;
				clk_div : out  STD_LOGIC);
	end component;
	
	signal clk2: STD_LOGIC;
begin
	ESCOMips1: escoMIPS 
	port map(	clr => clr,
					clk => clk2,
					salida => sal,
					contador => pc);
					
	new_clk: div_frec
	Port map(	clk => clk,
					clk_div => clk2);
	clk_div <= clk2;
end Behavioral;

