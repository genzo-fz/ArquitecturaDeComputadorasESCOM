LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY testALU1bit IS
END testALU1bit;
 
ARCHITECTURE behavior OF testALU1bit IS 
 
    COMPONENT ALU1bit
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         cin : IN  std_logic;
         sel_a : IN  std_logic;
         sel_b : IN  std_logic;
         op : IN  std_logic_vector(1 downto 0);
         res : OUT  std_logic;
         cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic := '0';
   signal b : std_logic := '0';
   signal cin : std_logic := '0';
   signal sel_a : std_logic := '0';
   signal sel_b : std_logic := '0';
   signal op : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal res : std_logic;
   signal cout : std_logic;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU1bit PORT MAP (
          a => a,
          b => b,
          cin => cin,
          sel_a => sel_a,
          sel_b => sel_b,
          op => op,
          res => res,
          cout => cout
        );
		  
   -- Stimulus process
   stim_proc: process
   begin		
		a <= '0';
		b <= '1';

		sel_a <= '0';
		sel_b <= '0';
		op <= "00";----------AND
		wait for 30 ns;
		op <= "01";----------OR
		wait for 30 ns;
		op <= "10";----------XOR
		wait for 30 ns;
		op <= "11";----------SUMA
		wait for 30 ns;
		sel_a <= '1';
		sel_b <= '1';
		op <= "01";----------NAND
		wait for 30 ns;
		op <= "00";----------NOR
		wait for 30 ns;
		sel_a <= '0';
		op <= "10";----------XNOR
		wait;
   end process;

END;
