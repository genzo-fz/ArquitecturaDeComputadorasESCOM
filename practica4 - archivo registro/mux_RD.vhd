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
					R8: in std_logic_vector(15 downto 0);
					R9: in std_logic_vector(15 downto 0);
					R10: in std_logic_vector(15 downto 0);
					R11: in std_logic_vector(15 downto 0);
					R12: in std_logic_vector(15 downto 0);
					R13: in std_logic_vector(15 downto 0);
					R14: in std_logic_vector(15 downto 0);
					R15: in std_logic_vector(15 downto 0);
					READ_R : in  STD_LOGIC_VECTOR (3 downto 0);
					READ_D : out  STD_LOGIC_VECTOR (15 downto 0));
end mux_RD;

architecture Behavioral of mux_RD is
begin	
	read_d <= 	r0 when read_r = "0000" else
					r1 when read_r = "0001" else
					r2 when read_r = "0010" else
					r3 when read_r = "0011" else
					r4 when read_r = "0100" else
					r5 when read_r = "0101" else
					r6 when read_r = "0110" else
					r7 when read_r = "0111" else
					r8 when read_r = "1000" else
					r9 when read_r = "1001" else
					r10 when read_r = "1010" else
					r11 when read_r = "1011" else
					r12 when read_r = "1100" else
					r13 when read_r = "1101" else
					r14 when read_r = "1110" else
					r15;
end Behavioral;

