LIBRARY ieee;
LIBRARY STD;
USE STD.TEXTIO.ALL;
USE ieee.std_logic_TEXTIO.ALL;	--PERMITE USAR STD_LOGIC 
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_UNSIGNED.ALL;
USE ieee.std_logic_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_p IS
END tb_p;
 
ARCHITECTURE behavior OF tb_p IS 
 
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
	file ARCH_RES : TEXT;	  	-------------------------------------------------archivo de resultados																		
	variable LINEA_RES : line;	-------------------------------------------------linea de resultado
	file ARCH_VEC : TEXT;		-------------------------------------------------archivo de vectores
	variable LINEA_VEC : line;	-------------------------------------------------linea de vectores
	
	----------------------------------------------------------------------------variables
	variable V_PC_IN, V_PC_OUT: STD_LOGIC_VECTOR(15 DOWNTO 0);
	variable v_sps: std_logic_vector(3 downto 0);
	variable V_CLR, V_UP, V_DW, V_WPC: STD_LOGIC;
	-------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------cadena
	VARIABLE CADENA : STRING(1 TO 4);
	-------------------------------------------------------------------------------------------------
   begin		
		file_open(ARCH_VEC, "VECTORES1.txt", READ_MODE); 	
		file_open(ARCH_RES, "RESULTADO1.txt", WRITE_MODE); 	
	----------------------------------------------------------------------------imprimiendo CADENAS	
		CADENA := "   D";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);	--"DIR"
		CADENA := "  UP";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);	--"DATOSIN"
		CADENA := "  DW";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);	--"WRITE DATA"
		CADENA := " WPC";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);	--"DATOSOUT"
		CADENA := " CLR";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);	--"DATOSOUT"
		CADENA := "  SP";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);	--"DATOSOUT"
		CADENA := "   Q";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);	--"DATOSOUT"
		writeline(ARCH_RES,LINEA_RES);-- escribe la linea en el archivo
	-------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------imprimiendo RESULTADOS
		WAIT FOR 100 NS;
		FOR I IN 0 TO 30 LOOP
	--............................................................leyendo CADENAS de VECTORES.TXT--
			readline(ARCH_VEC,LINEA_VEC); -- lee una linea completa
--			read(LINEA_VEC, VAR_OPER);  	-- asigna el primer vector a VAR_OPER 
--			OPER <= VAR_OPER;					-- asigna VAR_OPER a OPER
--			Hread(LINEA_VEC, VAR_D);		-- asigna el siguiente vector a VAR_D en formato HEX;

--variable V_PC_IN, V_PC_OUT: STD_LOGIC_VECTOR(15 DOWNTO 0);
--	variable V_CLR, V_UP, V_DW, V_WPC, : STD_LOGIC;
			hread(LINEA_VEC, V_pc_in);
			pc_in <= v_pc_in;
			read(LINEA_VEC, v_up);
			up <= v_up;
			read(LINEA_VEC, v_dw);
			dw <= v_dw;
			read(LINEA_VEC, v_wpc);
			wpc <= v_wpc;
			read(LINEA_VEC, v_clr);
			clr <= v_clr;
	--...........................................................................................--
			WAIT UNTIL RISING_EDGE(CLK);	--ESPERO AL FLANCO DE SUBIDA 
			V_pc_out := pc_out; -- asignando salida
			v_sps := '0'&sps;
			--////////////////////////////////////////////////////////////////ESCRIBIENDO RESULTADOS
			--variable V_PC_IN, V_PC_OUT: STD_LOGIC_VECTOR(15 DOWNTO 0);
			--variable v_sps: std_logic_vector(2 downto 0);
			--variable V_CLR, V_UP, V_DW, V_WPC: STD_LOGIC;
			Hwrite(LINEA_RES, v_pc_in, right, 5);
			write(LINEA_RES, v_up, right, 5);
			write(LINEA_RES, v_dw, right, 5);
			write(LINEA_RES, v_wpc, right, 5);
			write(LINEA_RES, v_clr, right, 5);
			Hwrite(LINEA_RES, v_sps, right, 5);
			Hwrite(LINEA_RES, v_pc_out, right, 5);
			--//////////////////////////////////////////////////////////////////////////////////////
			writeline(ARCH_RES,LINEA_RES);-- escribe la linea en el archivo
		end loop;
		file_close(ARCH_VEC);  -- cierra el archivo
		file_close(ARCH_RES);  -- cierra el archivo
      wait;
   end process;-- Stimulus process	

END;
