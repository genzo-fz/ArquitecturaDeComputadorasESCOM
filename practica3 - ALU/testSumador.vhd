LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testSumador IS
END testSumador;
 
ARCHITECTURE behavior OF testSumador IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sumador
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         cin : IN  std_logic;
         s : OUT  std_logic;
         cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic := '0';
   signal b : std_logic := '0';
   signal cin : std_logic := '0';

 	--Outputs
   signal s : std_logic;
   signal cout : std_logic;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sumador PORT MAP (
          a => a,
          b => b,
          cin => cin,
          s => s,
          cout => cout
        );

   -- Stimulus process
   stim_proc: process
   begin		
      a <= '1';
      b <= '1';
      cin <='0';
		wait for 5 ns;
		a <= '0';
      b <= '1';
      cin <='0';
		wait for 5 ns;
		a <= '1';
      b <= '1';
      cin <='1';
		wait for 5 ns;
		a <= '0';
      b <= '0';
      cin <='0';
		wait for 5 ns;
		a <= '0';
      b <= '1';
      cin <='1';
		wait for 5 ns;
		a <= '1';
      b <= '0';
      cin <='1';
		wait for 5 ns;
      wait;
   end process;

END;
