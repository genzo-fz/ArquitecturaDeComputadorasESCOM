LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY test_UC IS
END test_UC;
 
ARCHITECTURE behavior OF test_UC IS 
 
    COMPONENT UC
    PORT(
         CLK : IN  std_logic;
         CLR : IN  std_logic;
         INI : IN  std_logic;
         A0 : IN  std_logic;
         Z : IN  std_logic;
         LA : OUT  std_logic;
         EA : OUT  std_logic;
         EC : OUT  std_logic;
         EB : OUT  std_logic;
         LB : OUT  std_logic
        );
    END COMPONENT;    

   --Inputs
   signal CLK : std_logic := '0';
   signal CLR : std_logic := '0';
   signal INI : std_logic := '0';
   signal A0 : std_logic := '0';
   signal Z : std_logic := '0';

 	--Outputs
   signal LA : std_logic;
   signal EA : std_logic;
   signal EC : std_logic;
   signal EB : std_logic;
   signal LB : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: UC PORT MAP (
          CLK => CLK,
          CLR => CLR,
          INI => INI,
          A0 => A0,
          Z => Z,
          LA => LA,
          EA => EA,
          EC => EC,
          EB => EB,
          LB => LB
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
		clr <= '1';
      wait for 30 ns;
		clr <= '0';
		wait for 10 ns;	
		ini <= '1';
		a0 <= '1';
		z <= '0';
		wait for 60 ns;
		ini <= '1';
		a0 <= '0';
		z <= '1';
		wait for 20 ns;
		ini <= '0';
		wait for 10 ns;	
      wait;
   end process;

END;
