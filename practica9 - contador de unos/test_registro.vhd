LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY test_registro IS
END test_registro;
 
ARCHITECTURE behavior OF test_registro IS 
 
    COMPONENT registro
    PORT(
			CLK : IN  std_logic;
         SH : IN  std_logic;
         L : IN  std_logic;
         CLR : IN  std_logic;
         D : IN  std_logic_vector(8 downto 0);
         Q : OUT  std_logic_vector(8 downto 0)
        );
    END COMPONENT;
    

   --Inputs
	signal CLK : std_logic := '0';
   signal SH : std_logic := '0';
   signal L : std_logic := '0';
   signal CLR : std_logic := '0';
   signal D : std_logic_vector(8 downto 0) := (others => '1');

 	--Outputs
   signal Q : std_logic_vector(8 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: registro PORT MAP (
			CLK => CLK,
         SH => SH,
         L => L,   
         CLR => CLR,
         D => D,
         Q => Q
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      L <= '1';
      wait for 10 ns;	
		L <= '0';
      wait for 10 ns;
		CLR <= '1';
      wait for 10 ns;	
		CLR <= '0';
      wait for 10 ns;
      L <= '1';
      wait for 10 ns;	
		L <= '0';
      wait for 10 ns;
		SH <= '1';
      wait for 10 ns;	
		SH <= '0';
      wait for 10 ns;
		SH <= '1';
      wait for 30 ns;
		SH <= '0';
      wait for 10 ns;
      wait;
   end process;

END;
