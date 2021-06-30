library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
	generic (n : integer := 16);
	port(	in1, in2: 								in std_logic_vector(n-1 downto 0);
			--sel_a, sel_b: 						in std_logic;-------------------------|
			                                                                     -----ALUOP
			op:									in std_logic_vector(3 downto 0);------|
			res:									out std_logic_vector(n-1 downto 0);
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
signal c : std_logic_vector(n downto 0);
signal r : std_logic_vector(n-1 downto 0);
 
begin
	--c<=cin;
	c(0)<=op(2);
	ciclo: for i in 0 to n-1 generate
		alu1: ALU1bit
		port map(
			a 		=> in1(i),
			b 		=> in2(i),
			cin 	=> c(i),
			sel_a => op(3),
			sel_b => op(2),
			op 	=> op(1 downto 0),
			res 	=> r(i),
			cout 	=> c(i+1));
	end generate;
	
	cout <= c(n) when op = "0011"---------bandera C
	else '0';  
	band_n <= r(n-1);	-----------------bandera N
	band_ov <= c(n-1) xor c(n);--------bandera OV
	band_z <= not(r(15) or r(14) or r(13) or r(12) or r(11) or r(10) or r(9) or r(8) or r(7) or r(6) or r(5) or r(4) or r(3) or r(2) or r(1) or r(0));
	res <= r;  ------------------------resultado
end Behavioral;  