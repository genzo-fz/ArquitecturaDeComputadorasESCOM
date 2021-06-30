LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY test_unidadC IS
END test_unidadC;
 
ARCHITECTURE behavior OF test_unidadC IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT unidadC
    PORT(
         TIPOR : IN  std_logic;
         BEQ : IN  std_logic;
         BNEQ : IN  std_logic;
         BLT : IN  std_logic;
         BLE : IN  std_logic;
         BGT : IN  std_logic;
         BGET : IN  std_logic;
         NA : IN  std_logic;
         EQ : IN  std_logic;
         NEQ : IN  std_logic;
         LT : IN  std_logic;
         LE : IN  std_logic;
         GTI : IN  std_logic;
         GET : IN  std_logic;
         CLK : IN  std_logic;
         CLR : IN  std_logic;
         SDOPC : OUT  std_logic;
         SM : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal TIPOR : std_logic := '0';
   signal BEQ : std_logic := '0';
   signal BNEQ : std_logic := '0';
   signal BLT : std_logic := '0';
   signal BLE : std_logic := '0';
   signal BGT : std_logic := '0';
   signal BGET : std_logic := '0';
   signal NA : std_logic := '0';
   signal EQ : std_logic := '0';
   signal NEQ : std_logic := '0';
   signal LT : std_logic := '0';
   signal LE : std_logic := '0';
   signal GTI : std_logic := '0';
   signal GET : std_logic := '0';
   signal CLK : std_logic := '0';
   signal CLR : std_logic := '0';

 	--Outputs
   signal SDOPC : std_logic;
   signal SM : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: unidadC PORT MAP (
          TIPOR => TIPOR,
          BEQ => BEQ,
          BNEQ => BNEQ,
          BLT => BLT,
          BLE => BLE,
          BGT => BGT,
          BGET => BGET,
          NA => NA,
          EQ => EQ,
          NEQ => NEQ,
          LT => LT,
          LE => LE,
          GTI => GTI,
          GET => GET,
          CLK => CLK,
          CLR => CLR,
          SDOPC => SDOPC,
          SM => SM
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
	
--			TIPOR : IN  std_logic;
--       BEQ : IN  std_logic;
--       BNEQ : IN  std_logic;
--       BLT : IN  std_logic;
--       BLE : IN  std_logic;
--       BGT : IN  std_logic;
--       BGET : IN  std_logic;
--        NA : IN  std_logic;
--         EQ : IN  std_logic;
--         NEQ : IN  std_logic;
--         LT : IN  std_logic;
--         LE : IN  std_logic;
--         GTI : IN  std_logic;
--         GET : IN  std_logic;
--         CLK : IN  std_logic;
--         CLR : IN  std_logic;
	
   stim_proc: process
   begin	
		CLR <= '1';
		wait for 20 ns;
		CLR <= '0';
		TIPOR <= '1';
      wait for 20 ns;
		TIPOR <= '0';
		BEQ <= '1';
		wait for 20 ns;
		NA <= '1';
		NEQ <= '1';
		wait for 20 ns;
		EQ <= '1';
		NEQ <= '0';
		
		BGET <= '1';
		wait for 20 ns;
		NA <= '1';
		NEQ <= '1';
		wait for 20 ns;
		GET <= '1';
		NEQ <= '0';
		
      wait for CLK_period*10;

      

      wait;
   end process;

END;
