LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY test_MF IS
END test_MF;
 
ARCHITECTURE behavior OF test_MF IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MFuncion
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         D : OUT  std_logic_vector(19 downto 0)
        );
    END COMPONENT;  

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal D : std_logic_vector(19 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MFuncion PORT MAP (
          A => A,
          D => D
        );
		  
   -- Stimulus process
   stim_proc: process
   begin		
      A <= x"0";
      wait for 10 ns;	
		A <= x"1";
      wait for 10 ns;	
		A <= x"2";
      wait for 10 ns;	
		A <= x"3";
      wait for 10 ns;	
		A <= x"4";
      wait for 10 ns;	
		A <= x"5";
      wait for 10 ns;	
		A <= x"6";
      wait for 10 ns;	
		A <= x"7";
      wait for 10 ns;	
		A <= x"8";
      wait for 10 ns;	
		A <= x"9";
      wait for 10 ns;	
		A <= x"A";
      wait for 10 ns;	
		A <= x"B";
      wait for 10 ns;
		A <= x"C";
      wait for 10 ns;	
		A <= x"D";
      wait for 10 ns;	
		A <= x"E";
      wait for 10 ns;
		A <= x"F";
      wait for 10 ns;	
      wait;
   end process;

END;
