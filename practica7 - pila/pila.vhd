library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use ieee.std_logic_unsigned.all;

entity pila is
    Port ( pc_in : in  STD_LOGIC_VECTOR (15 downto 0);
           clk, clr, up, dw, wpc : in  STD_LOGIC;
           pc_out : out  STD_LOGIC_VECTOR (15 downto 0);
			  sps: out std_logic_vector(2 downto 0));
end pila;
architecture Behavioral of pila is
	type vectores is array (0 to 7) of std_logic_vector(15 downto 0);
begin
	pila: process(clk, clr)
		variable sp : std_logic_vector(2 downto 0);
		variable pcaux : vectores;
	begin
		if(clr = '1')then
			sp := "000";
			pcaux := (others => (others => '0'));
		elsif(rising_edge(clk))then
			if( wpc = '1' and up = '0' and dw = '0' )then -- jmp 
				pcaux(conv_integer(sp)) := pc_in;
			elsif( wpc= '1' and up = '1' and dw = '0' )then	-- call
				sp := sp + 1;
				pcaux(conv_integer(sp)) := pc_in;
			elsif( wpc = '0' and up = '0' and dw = '1' )then -- ret
				sp := sp - 1;
				pcaux(conv_integer(sp)) := pcaux(conv_integer(sp)) + 1;
			elsif( wpc = '0' and up = '0' and dw = '0' )then -- inc
				pcaux(conv_integer(sp)) := pcaux(conv_integer(sp)) + 1;
			end if;			
		end if;
		pc_out <= pcaux(conv_integer(sp));
		sps<= sp;
	end process;
end Behavioral;