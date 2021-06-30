--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY test_divFrec IS
END test_divFrec;
 
ARCHITECTURE behavior OF test_divFrec IS 
 
    COMPONENT div_frec
    PORT(
         clk : IN  std_logic;
         clk_div : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal clk : std_logic := '0';

 	--Outputs
   signal clk_div : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: div_frec PORT MAP (
          clk => clk,
          clk_div => clk_div
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;

   -- Stimulus process
   stim_proc: process
   begin	
      wait for 2000 ms;	
      -- insert stimulus here 

      wait;
   end process;

END;
