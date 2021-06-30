LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY test_main IS
END test_main;
 
ARCHITECTURE behavior OF test_main IS 

    COMPONENT main
    PORT(
         
         CLK : IN  std_logic;
         CLR : IN  std_logic;
			INI : IN  std_logic;
         D : IN  std_logic_vector(8 downto 0);
         A : OUT  std_logic_vector(8 downto 0);
         B : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    
   --Inputs
   signal CLK : std_logic := '0';
   signal CLR : std_logic := '0';
   signal INI : std_logic := '0';
	signal D : std_logic_vector(8 downto 0) := (others => '0');

 	--Outputs
   signal A : std_logic_vector(8 downto 0);
   signal B : std_logic_vector(6 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: main PORT MAP (
          CLK => CLK,
          CLR => CLR,
			 INI => INI,
          D => D,
          A => A,
          B => B
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
		clr <= '0';
		d <= x"a5"&'1';
		wait for 30 ns;
		clr <= '1'; 
		wait for 10 ns;
		clr <= '0';
		wait for 30 ns;
		ini <= '1';
		wait for 150 ns;
		ini <= '0';
		d <= x"ff"&'1';
		wait for 50 ns;
		ini <= '1';
		wait for 20 ns;
		ini <= '0';
		wait for 130 ns;
	
      wait;
   end process;

END;
