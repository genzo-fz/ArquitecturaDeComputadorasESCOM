LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY test_condicion IS
END test_condicion;
 
ARCHITECTURE behavior OF test_condicion IS 
  
    COMPONENT condicion
    PORT(
         rban : IN  std_logic_vector(3 downto 0);
         EQ : OUT  std_logic;
         NEQ : OUT  std_logic;
         LT : OUT  std_logic;
         LE : OUT  std_logic;
         BGT : OUT  std_logic;
         GET : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal rban : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal EQ : std_logic;
   signal NEQ : std_logic;
   signal LT : std_logic;
   signal LE : std_logic;
   signal BGT : std_logic;
   signal GET : std_logic;
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: condicion PORT MAP (
          rban => rban,
          EQ => EQ,
          NEQ => NEQ,
          LT => LT,
          LE => LE,
          BGT => BGT,
          GET => GET
        );

   -- Stimulus process
   stim_proc: process
   begin		
      rban<="0000";
      wait for 10 ns;	
      rban<="0010";
      wait for 10 ns;	
		rban<="0100";
      wait for 10 ns;	
		rban<="0110";
      wait for 10 ns;	
      wait;
   end process;

END;
