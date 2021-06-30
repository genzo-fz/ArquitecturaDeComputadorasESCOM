
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity main is
		generic(	n: integer := 3;
					t: integer := 15);
		Port ( rr1,rr2,wr,shamt : in  STD_LOGIC_VECTOR (n downto 0);
           wdata : in  STD_LOGIC_VECTOR (t downto 0);
           rdata1, rdata2 : inout  STD_LOGIC_VECTOR (t downto 0);
           wd, she, dir, clk , clr : in  STD_LOGIC);
end main;

architecture Behavioral of main is
	component registro is
		 Port ( D : in  STD_LOGIC_VECTOR (t downto 0);
				  Q : out  STD_LOGIC_VECTOR (t downto 0);
				  L, CLK, CLR : in  STD_LOGIC);
	end component;
	
	component barrelShifter is
		 Port ( D : in  STD_LOGIC_VECTOR (t downto 0);
				  SHA : in  STD_LOGIC_VECTOR (n downto 0);
				  DIR : in  STD_LOGIC;
				  CR : out  STD_LOGIC_VECTOR (t downto 0));
	end component;
	
	component mux_RD is
		Port( 	R0: in std_logic_vector(t downto 0);
					R1: in std_logic_vector(t downto 0);
					R2: in std_logic_vector(t downto 0);
					R3: in std_logic_vector(t downto 0);
					R4: in std_logic_vector(t downto 0);
					R5: in std_logic_vector(t downto 0);
					R6: in std_logic_vector(t downto 0);
					R7: in std_logic_vector(t downto 0);
					R8: in std_logic_vector(t downto 0);
					R9: in std_logic_vector(t downto 0);
					R10: in std_logic_vector(t downto 0);
					R11: in std_logic_vector(t downto 0);
					R12: in std_logic_vector(t downto 0);
					R13: in std_logic_vector(t downto 0);
					R14: in std_logic_vector(t downto 0);
					R15: in std_logic_vector(t downto 0);
					READ_R : in  STD_LOGIC_VECTOR (n downto 0);
					READ_D : out  STD_LOGIC_VECTOR (t downto 0));
	end component;
	
	component dmux is
		port(		wra: in std_logic_vector(n downto 0);
					wda: in std_logic;
					dexa: out std_logic_vector(t downto 0));
	end component;
	
	type vectores is array (0 to t) of std_logic_vector(t downto 0);
	signal banco:vectores;
	
	signal dex, smux, data: std_logic_vector(t downto 0);
begin
	barrel_S: barrelShifter
	Port map ( 
		D => rdata2,
		SHA => shamt,
		DIR => dir,
		CR => smux);
		
	data <= smux when she = '1' else wdata;
	
	demux: dmux
	port map(	
		wra => wr,
		wda => wd,
		dexa => dex
		);
		
	regs: for i in 0 to t generate
		reg: registro
		port map(
			d => data,
         clk => clk, 
			clr => clr, 
			l => dex(i),
         q => banco(i)
		);
	end generate;
	
	mux1: mux_rd
	port map(
		R0 => banco(0),
		R1 => banco(1),
		R2 => banco(2),
		R3 => banco(3),
		R4 => banco(4),
		R5 => banco(5),
		R6 => banco(6),
		R7 => banco(7),
		R8 => banco(8),
		R9 => banco(9),
		R10 => banco(10),
		R11 => banco(11),
		R12 => banco(12),
		R13 => banco(13),
		R14 => banco(14),
		R15 => banco(15),
		READ_R => rr1,
		READ_D => rdata1);
	
	mux2: mux_rd
	port map(
		R0 => banco(0),
		R1 => banco(1),
		R2 => banco(2),
		R3 => banco(3),
		R4 => banco(4),
		R5 => banco(5),
		R6 => banco(6),
		R7 => banco(7),
		R8 => banco(8),
		R9 => banco(9),
		R10 => banco(10),
		R11 => banco(11),
		R12 => banco(12),
		R13 => banco(13),
		R14 => banco(14),
		R15 => banco(15),
		READ_R => rr2,
		READ_D => rdata2);
end Behavioral;

