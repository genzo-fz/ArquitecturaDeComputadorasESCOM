LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY testReg IS
END testReg;
 
ARCHITECTURE behavior OF testReg IS 

    COMPONENT registro
    PORT(
         D : IN  std_logic_vector(15 downto 0);
         Q : OUT  std_logic_vector(15 downto 0);
         L : IN  std_logic;
         CLK : IN  std_logic;
         CLR : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal D : std_logic_vector(15 downto 0) := (others => '0');
   signal L : std_logic := '0';
   signal CLK : std_logic := '0';
   signal CLR : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: registro PORT MAP (
          D => D,
          Q => Q,
          L => L,
          CLK => CLK,
          CLR => CLR
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
      wait for 30 ns;
		clr <= '1';
		wait for 40 ns;
		clr <= '0';
		d <= x"AB00";
		l <= '1';
		wait for 50 ns;
		l <= '0';
		d <= x"1234";
      wait;
   end process;

END;
