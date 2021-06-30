LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY testALU IS
END testALU;
 
ARCHITECTURE behavior OF testALU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT ALU
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         --cin : IN  std_logic;
         sel_a : IN  std_logic;
         sel_b : IN  std_logic;
         op : IN  std_logic_vector(1 downto 0);
         res : OUT  std_logic_vector(3 downto 0);
         cout : OUT  std_logic;
         band_n : OUT  std_logic;
         band_z : OUT  std_logic;
         band_ov : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');
    --signal cin : std_logic := '0';
   signal sel_a : std_logic := '0';
   signal sel_b : std_logic := '0';
   signal op : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal res : std_logic_vector(3 downto 0);
   signal cout : std_logic;
   signal band_n : std_logic;
   signal band_z : std_logic;
   signal band_ov : std_logic;
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          a => a,
          b => b,
          --cin => cin,
          sel_a => sel_a,
          sel_b => sel_b,
          op => op,
          res => res,
          cout => cout,
          band_n => band_n,
          band_z => band_z,
          band_ov => band_ov
        );

   -- Stimulus process
   stim_proc: process
   begin		
      a <= "0101";
		b <= "1110";
		
		sel_a <= '0';
		sel_b <= '0';
		op 	<= "11";---suma
		wait for 5 ns;
		sel_b <= '1';
		op 	<= "11";---resta
		wait for 5 ns;
		sel_a <= '0';
		sel_b <= '0';
		op 	<= "00";---AND
		wait for 5 ns;
		sel_a <= '1';
		sel_b <= '1';
		op 	<= "10";---NAND
		wait for 5 ns;
		sel_a <= '0';
		sel_b <= '0';
		op 	<= "01";---OR
		wait for 5 ns;
		sel_a <= '1';
		sel_b <= '1';
		op 	<= "00";---NOR
		wait for 5 ns;
		sel_a <= '0';
		sel_b <= '0';
		op 	<= "10";---XOR
		wait for 5 ns;
		sel_a <= '1';
		sel_b <= '0';
		op 	<= "10";---XNOR
		wait for 5 ns;
		
		b <= "0111";-----b=7
		
		sel_a <= '0';
		sel_b <= '0';
		op 	<= "11";---SUMA
		wait for 5 ns;
		sel_a <= '1';
		sel_b <= '1';
		op 	<= "01";---NOT(NAND)
		wait for 5 ns;
		wait;
   end process;

END;
