LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY test_mips IS
END test_mips;
 
ARCHITECTURE behavior OF test_mips IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT escoMIPS
    PORT(
         clr : IN  std_logic;
         clk : IN  std_logic;
         salida : OUT  std_logic_vector(7 downto 0);
         contador : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clr : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal salida : std_logic_vector(7 downto 0);
   signal contador : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: escoMIPS PORT MAP (
          clr => clr,
          clk => clk,
          salida => salida,
          contador => contador
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
      clr <= '1';
      wait for 100 ns;	
		clr <= '0';
		wait for 100 ns;

      wait;
   end process;

END;
