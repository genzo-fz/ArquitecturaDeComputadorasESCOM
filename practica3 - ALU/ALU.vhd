library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
	generic (n : integer := 3);
	port(	a, b: 								in std_logic_vector(n downto 0);
			sel_a, sel_b: 						in std_logic;
			op:									in std_logic_vector(1 downto 0);
			res:									out std_logic_vector(n downto 0);
			cout, band_n, band_z, band_ov:out std_logic);
end ALU;
architecture Behavioral of ALU is
----------------------------------------------------------------------------COMPONENTE ALU1bit
	COMPONENT ALU1bit is
	Port (a, b, cin, sel_a, sel_b:in  STD_LOGIC;
			op : 							in  STD_LOGIC_VECTOR (1 downto 0);
         res,cout:					out std_logic);
	end COMPONENT;
----------------------------------------------------------------------------
signal c : std_logic_vector(n+1 downto 0);
signal r : std_logic_vector(n downto 0);
 
begin
	--c<=cin;
	c(0)<=sel_b;
	ciclo: for i in 0 to n generate
		alu1: ALU1bit
		port map(
			a 		=> a(i),
			b 		=> b(i),
			cin 	=> c(i),
			sel_a => sel_a,
			sel_b => sel_b,
			op 	=> op,
			res 	=> r(i),
			cout 	=> c(i+1));
	end generate;
	
	cout <= c(n+1) when op = "11"---------bandera C
			else '0';  
	band_n <= r(n);	-----------------bandera N
	band_ov <= c(n+1) xor c(n);--------bandera OV
	band_z <= not(r(0) or r(1) or r(2) or r(3));
--	process(a, b, r)   ----------------bandera Z
--		variable aux_z: std_logic;
--	begin
--		aux_z := '0';
--		band: for j in 0 to n loop
--			band_z <= aux_z nor r(j);
--		end loop;
--	end process;
	res <= r;  ------------------------resultado
	
end Behavioral;  