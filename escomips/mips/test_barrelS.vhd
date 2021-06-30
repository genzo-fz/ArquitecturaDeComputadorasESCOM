LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY test_barrelS IS
END test_barrelS;
 
ARCHITECTURE behavior OF test_barrelS IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT barrelShifter
    PORT(
         D : IN  std_logic_vector(15 downto 0);
         SHA : IN  std_logic_vector(3 downto 0);
         DIR : IN  std_logic;
         CR : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal D : std_logic_vector(15 downto 0) := (others => '0');
   signal SHA : std_logic_vector(3 downto 0) := (others => '0');
   signal DIR : std_logic := '0';

 	--Outputs
   signal CR : std_logic_vector(15 downto 0);
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: barrelShifter PORT MAP (
          D => D,
          SHA => SHA,
          DIR => DIR,
          CR => CR
        );

   -- Stimulus process
   stim_proc: process
   begin		
      D <= X"01e0";
      SHA<="0010";
		dir <= '0';
      wait for 100 ns;	
		dir <= '1';
      wait for 100 ns;	

      
      -- insert stimulus here 

      wait;
   end process;

END;
