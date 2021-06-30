LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY testBS IS
END testBS;
 
ARCHITECTURE behavior OF testBS IS 
 
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
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
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
      D<= x"fff9";
		DIR<= '1';
		SHA <= "0000";
		wait for 30 ns;
		SHA <= "0001";
		wait for 30 ns;
		SHA <= "0010";
		wait for 30 ns;
		SHA <= "0011";
		wait for 30 ns;
		SHA <= "0100";
		wait for 30 ns;
		SHA <= "0101";
		wait for 30 ns;
		SHA <= "1000";
		wait for 30 ns;
		
		D<= x"9fff";
		DIR<= '0';
		SHA <= "0000";
		wait for 30 ns;
		SHA <= "0001";
		wait for 30 ns;
		SHA <= "0010";
		wait for 30 ns;
		SHA <= "0011";
		wait for 30 ns;
		SHA <= "0100";
		wait for 30 ns;
		SHA <= "0101";
		wait for 30 ns;
		SHA <= "1000";
		wait for 30 ns;
      wait;
   end process;

END;
