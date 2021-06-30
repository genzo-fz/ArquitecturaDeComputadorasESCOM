ENTITY tb_testp IS
END tb_testp;
 
ARCHITECTURE behavior OF tb_testp IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pila
    PORT(
         pc_in : IN  std_logic_vector(15 downto 0);
         clk : IN  std_logic;
         clr : IN  std_logic;
         up : IN  std_logic;
         dw : IN  std_logic;
         wpc : IN  std_logic;
         pc_out : OUT  std_logic_vector(15 downto 0);
         sps : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal pc_in : std_logic_vector(15 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal clr : std_logic := '0';
   signal up : std_logic := '0';
   signal dw : std_logic := '0';
   signal wpc : std_logic := '0';

 	--Outputs
   signal pc_out : std_logic_vector(15 downto 0);
   signal sps : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pila PORT MAP (
          pc_in => pc_in,
          clk => clk,
          clr => clr,
          up => up,
          dw => dw,
          wpc => wpc,
          pc_out => pc_out,
          sps => sps
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      PC_IN <= X"0000";
		up <= '0';
		dw <= '0';
		wpc <= '0';
		clr <= '0';
      wait for clk_period*1;
		PC_IN <= X"0000";
		up <= '0';
		dw <= '0';
		wpc <= '0';
		clr <= '0';
      wait for clk_period*1;
		wait for 10 ns;
      wait;
   end process;

END;
