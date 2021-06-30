library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_RD is
		---i : in array(integer range 2**sel_width - 1 downto 0) of std_logic_vector(bus_width - 1 downto 0
		 Port( 	R0: in std_logic_vector(15 downto 0);
					R1: in std_logic_vector(15 downto 0);
					R2: in std_logic_vector(15 downto 0);
					R3: in std_logic_vector(15 downto 0);
					R4: in std_logic_vector(15 downto 0);
					R5: in std_logic_vector(15 downto 0);
					R6: in std_logic_vector(15 downto 0);
					R7: in std_logic_vector(15 downto 0);
					SP : in  STD_LOGIC_VECTOR (2 downto 0);
					PC_OUT: out  STD_LOGIC_VECTOR (15 downto 0));
end mux_RD;

architecture Behavioral of mux_RD is
begin	
	PC_OUT <= 	R0 when SP = "000" else
					R1 when SP = "001" else
					R2 when SP = "010" else
					R3 when SP = "011" else
					R4 when SP = "100" else
					R5 when SP = "101" else
					R6 when SP = "110" else
					R7;
end Behavioral;

