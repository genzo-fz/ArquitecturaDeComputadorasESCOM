library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity ALU1bit is
	Port (a, b, cin, sel_a, sel_b:in  STD_LOGIC;
			op : 							in  STD_LOGIC_VECTOR (1 downto 0);
         res,cout:					out std_logic);
end ALU1bit;

architecture Behavioral of ALU1bit is
----------------------------------------------------------------------------COMPONENTE SUMADOR
	component sumador is
		 Port ( a, b, cin : in  STD_LOGIC;
				  s, cout : out  STD_LOGIC);
	end component;
----------------------------------------------------------------------------
----------------------------------------------------------------------------SEÑALES
signal aux_a, aux_b, res_and, res_or, res_xor, res_suma: std_logic;
----------------------------------------------------------------------------
begin	
	
	aux_a <= a xor sel_a;
	aux_b <= b xor sel_b;
	
	res_and <= aux_a and aux_b;
	res_or <= aux_a or aux_b;
	res_xor <= aux_a xor aux_b;
----------------------------------------------------------------------------REFERENCIA DE PUERTOS SUMADOR
	sum:  sumador
    Port map ( 
			 a	=> aux_a,
			 b => aux_b,
			 cin => cin,
			 cout => cout,
			 s => res_suma);
----------------------------------------------------------------------------
	process (res_and, res_or, res_xor, res_suma, OP)
		begin
			case op is
				when "00" => res <= res_and;
				when "01" => res <= res_or;
				when "10" => res <= res_xor;
				when others => res <= res_suma;
		end case;
	end process;
end Behavioral;