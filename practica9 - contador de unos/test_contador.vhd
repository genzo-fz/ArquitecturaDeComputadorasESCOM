--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:50:58 05/07/2019
-- Design Name:   
-- Module Name:   C:/Users/genzo/Google Drive/ESCOM/5to semestre/Arquitectura de sistemas/practica9/contador/test_contador.vhd
-- Project Name:  contador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: contador
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_contador IS
END test_contador;
 
ARCHITECTURE behavior OF test_contador IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT contador
    PORT(
         CLK : IN  std_logic;
         CLR : IN  std_logic;
         L : IN  std_logic;
         I : IN  std_logic;
         B : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal CLR : std_logic := '0';
   signal L : std_logic := '0';
   signal I : std_logic := '0';

 	--Outputs
   signal B : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: contador PORT MAP (
          CLK => CLK,
          CLR => CLR,
          L => L,
          I => I,
          B => B
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		clr <= '1';
      wait for 30 ns;
		clr <= '0';
		wait for 30 ns;
		L <= '1';
      wait for 20 ns;
		L <= '0';
		I <= '1';
		wait for 100 ns;
		I <= '0';
		wait for 10 ns;
		CLR <= '1';
		wait for 10 ns;
		ClR <= '0';
      -- insert stimulus here 

      wait;
   end process;

END;
