LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY test IS
END test; 
ARCHITECTURE behavior OF test IS 
 
    COMPONENT practica2
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         cin : IN  std_logic;
         cout : OUT  std_logic;
         s : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    
   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');
   signal cin : std_logic := '0';

 	--Outputs
   signal cout : std_logic;
   signal s : std_logic_vector(3 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: practica2 PORT MAP (
          a => a,
          b => b,
          cin => cin,
          cout => cout,
          s => s
        );

   -- Stimulus process
   stim_proc: process
   begin		----------- 5+5
      a <= "0101";
		b <= "0101";
		cin <= '0';
      wait for 5 ps;--- 12+7
		a <= "1100";
		b <= "0111";
      wait for 5 ps;--- 9+5
		a <= "1001";
		b <= "0101";
      wait for 5 ps;--- 14+9
		a <= "1110";
		b <= "1001";
      wait for 5 ps;--- 4+2
		a <= "0100";
		b <= "0010";
      wait for 5 ps;--- 7+7
		a <= "0111";
		b <= "0111";
		wait for 5 ps;--- 15+5
		a <= "1111";
		b <= "0101";
		wait for 5 ps;--- 11+8
		a <= "1011";
		b <= "1000";
		wait for 5 ps;--- 1+4
		a <= "0001";
		b <= "0100";
		wait for 5 ps;--- 
		a <= "0001";
		b <= "1111";
		------0000
		wait for 5 ps;
      wait;
   end process;

END;
