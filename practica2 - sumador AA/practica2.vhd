library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sumador is
    Port ( a, b, cin : in  STD_LOGIC;
           s, cout : out  STD_LOGIC);
end sumador;

architecture Behavioral of practica2 is

begin

	process(a,b)
		variable g,p: std_logic_vector(3 downto 0);
		variable c: std_logic_vector(4 downto 0);
		variable algo: std_logic;
	begin
			c(0) := cin;
			for i in 0 to 3 loop
				g(i) := a(i) and b(i);
				p(i) := a(i) xor b(i);
				s(i) <= p(i) xor c(i);
				
				c(i+1) := g(i);
				
				algo := cin; 
				for j in 0 to i loop
					algo := algo and p(j);
				end loop;
				
				c(i+1) := c(i+1) or algo; 
				
				for k in 0 to i-1 loop
					algo := p(k+1); 
					for l in k+1 to i loop
						algo :=  algo and g(k) and p(l);
					end loop;	
					c(i+1) := c(i+1) or algo;
				end loop;

			end loop;
			cout <= c(4);
	end process;

end Behavioral;

