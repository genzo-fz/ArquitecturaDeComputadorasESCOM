library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RegistroBanderas is
	port
	(
		--Banderas de la ALU
		OV: in std_logic;
		N:  in std_logic;
		Z:  in std_logic;
		C:  in std_logic;
		
		LF:  in std_logic;
		clk: in std_logic;
		clr: in std_logic;
		
		OV_out: inout std_logic;
		N_out:  inout std_logic;
		Z_out:  inout std_logic;
		C_out:  inout std_logic
	);
end RegistroBanderas;

architecture Behavioral of RegistroBanderas is

begin

	process (clk,clr)
	begin
		if (clr='1') then
			OV_out<='0';
			N_out<='0';
			Z_out<='0';
			C_out<='0';
		elsif (falling_edge(clk)) then
			if (LF='1') then
				OV_out<=OV;
				N_out<=N;
				Z_out<=Z;
				C_out<=C;
			else
				OV_out<=OV_out;
				N_out<=N_out;
				Z_out<=Z_out;
				C_out<=C_out;
			end if;
		end if;
	end process;

end Behavioral;