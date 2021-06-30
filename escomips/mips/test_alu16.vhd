LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY test_alu16 IS
END test_alu16;
 
ARCHITECTURE behavior OF test_alu16 IS 
  
    COMPONENT ALU
    PORT(
         in1 : IN  std_logic_vector(15 downto 0);
         in2 : IN  std_logic_vector(15 downto 0);
         --sel_a : IN  std_logic;
         --sel_b : IN  std_logic;
         op : IN  std_logic_vector(3 downto 0);
         res : OUT  std_logic_vector(15 downto 0);
         cout : OUT  std_logic;
         band_n : OUT  std_logic;
         band_z : OUT  std_logic;
         band_ov : OUT  std_logic
        );
    END COMPONENT;

   --Inputs
   signal in1 : std_logic_vector(15 downto 0) := (others => '0');
   signal in2 : std_logic_vector(15 downto 0) := (others => '0');
  -- signal sel_a : std_logic := '0';
   --signal sel_b : std_logic := '0';
   signal op : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal res : std_logic_vector(15 downto 0);
   signal cout : std_logic;
   signal band_n : std_logic;
   signal band_z : std_logic;
   signal band_ov : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          in1 => in1,
          in2 => in2,
          --sel_a => sel_a,
          --sel_b => sel_b,
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
      in1 <= x"0001";
      in2 <= x"0007";
		op <= "0000";
      wait for 10 ns;-- and
		op <= "0001";
      wait for 10 ns;-- or
		op <= "0010";
      wait for 10 ns;-- xor
		op <= "1101";
      wait for 10 ns;-- nand
		op <= "1100";
      wait for 10 ns;-- nor
		op <= "1010";
      wait for 10 ns;-- xnor
		op <= "0110";
      wait for 10 ns;-- xnor
		op <= "1101";
      wait for 10 ns;-- not
		op <= "0011";
      wait for 10 ns;-- suma
		op <= "0111";
      wait for 10 ns;-- resta
		
      wait;
   end process;

END;
