LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY test_nivel IS
END test_nivel;
 
ARCHITECTURE behavior OF test_nivel IS 
 
    COMPONENT nivel
    PORT(
         clk : IN  std_logic;
         clr : IN  std_logic;
         NA : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal clr : std_logic := '0';

 	--Outputs
   signal NA : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: nivel PORT MAP (
          clk => clk,
          clr => clr,
          NA => NA
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
      wait for 20 ns;
		clr <= '1';
		wait for 20 ns;
		clr <= '0';
		wait for 40 ns;
		wait for 20 ns;
		clr <= '1';
		wait for 25 ns;
		clr <= '0';
		wait for 40 ns;
      wait;
   end process;

END;
