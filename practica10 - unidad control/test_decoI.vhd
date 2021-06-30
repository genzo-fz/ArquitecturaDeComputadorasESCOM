LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY test_decoI IS
END test_decoI;
 
ARCHITECTURE behavior OF test_decoI IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT decoInst
    PORT(
         INS : IN  std_logic_vector(4 downto 0);
         TIPOR : OUT  std_logic;
         BEQI : OUT  std_logic;
         BNEQI : OUT  std_logic;
         BLTI : OUT  std_logic;
         BLETI : OUT  std_logic;
         BGTI : OUT  std_logic;
         BGETI : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal INS : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal TIPOR : std_logic;
   signal BEQI : std_logic;
   signal BNEQI : std_logic;
   signal BLTI : std_logic;
   signal BLETI : std_logic;
   signal BGTI : std_logic;
   signal BGETI : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: decoInst PORT MAP (
          INS => INS,
          TIPOR => TIPOR,
          BEQI => BEQI,
          BNEQI => BNEQI,
          BLTI => BLTI,
          BLETI => BLETI,
          BGTI => BGTI,
          BGETI => BGETI
        );

   -- Stimulus process
   stim_proc: process
   begin		
      ins <= "00001";--
      wait for 10 ns;	
		ins <= "00000";--
      wait for 10 ns;
		ins <= "01101";--
      wait for 10 ns;
		ins <= "01110";--
      wait for 10 ns;
		ins <= "01111";--
      wait for 10 ns;
		ins <= "10000";--
      wait for 10 ns;
		ins <= "10001";--
      wait for 10 ns;
		ins <= "10010";--
      wait for 10 ns;
		ins <= "00010";--
      wait for 10 ns;
      wait;
   end process;

END;
