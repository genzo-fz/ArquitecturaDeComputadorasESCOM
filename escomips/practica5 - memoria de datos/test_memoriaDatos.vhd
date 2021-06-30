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
 
ENTITY test_memoriaDatos IS
END test_memoriaDatos;
 
ARCHITECTURE behavior OF test_memoriaDatos IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT memoriaDatos
    PORT(
         datosIn : IN  std_logic_vector(15 downto 0);
         dir : IN  std_logic_vector(15 downto 0);
         clk : IN  std_logic;
         wd : IN  std_logic;
         datosOut : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal datosIn : std_logic_vector(15 downto 0) := (others => '0');
   signal dir : std_logic_vector(15 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal wd : std_logic := '0';

 	--Outputs
   signal datosOut : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: memoriaDatos PORT MAP (
          datosIn => datosIn,
          dir => dir,
          clk => clk,
          wd => wd,
          datosOut => datosOut
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
	variable V_DATOSIN, V_DIR, V_DATOSOUT: STD_LOGIC_VECTOR(15 DOWNTO 0);
	variable V_WD: STD_LOGIC;
	-------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------cadena
	VARIABLE CADENA : STRING(1 TO 4);
	-------------------------------------------------------------------------------------------------
   begin		
		file_open(ARCH_VEC, "VECTORES1.txt", READ_MODE); 	
		file_open(ARCH_RES, "RESULTADO1.txt", WRITE_MODE); 	
	----------------------------------------------------------------------------imprimiendo CADENAS	
		CADENA := " DIR";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);	--"DIR"
		CADENA := " DIN";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);	--"DATOSIN"
		CADENA := "  WD";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);	--"WRITE DATA"
		CADENA := "DOUT";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);	--"DATOSOUT"
		
		writeline(ARCH_RES,LINEA_RES);-- escribe la linea en el archivo
	-------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------imprimiendo RESULTADOS
		WAIT FOR 100 NS;
		FOR I IN 0 TO 14 LOOP
	--............................................................leyendo CADENAS de VECTORES.TXT--
			readline(ARCH_VEC,LINEA_VEC); -- lee una linea completa
--			read(LINEA_VEC, VAR_OPER);  	-- asigna el primer vector a VAR_OPER 
--			OPER <= VAR_OPER;					-- asigna VAR_OPER a OPER
--			Hread(LINEA_VEC, VAR_D);		-- asigna el siguiente vector a VAR_D en formato HEX;

			Hread(LINEA_VEC, V_DIR);
			DIR <= V_DIR;
			Hread(LINEA_VEC, V_DATOSIN);  
			DATOSIN <= V_DATOSIN;
			read(LINEA_VEC, V_WD);
			WD <= V_WD;
	--...........................................................................................--
			WAIT UNTIL RISING_EDGE(CLK);	--ESPERO AL FLANCO DE SUBIDA 
			V_DATOSOUT := DATOSOUT; -- asignando salida
			--////////////////////////////////////////////////////////////////ESCRIBIENDO RESULTADOS
			Hwrite(LINEA_RES, V_DIR, right, 5);
			Hwrite(LINEA_RES, V_DATOSIN, right, 5);
			write(LINEA_RES, V_WD, right, 5);
			Hwrite(LINEA_RES, V_DATOSOUT, right, 5);
			--//////////////////////////////////////////////////////////////////////////////////////
			writeline(ARCH_RES,LINEA_RES);-- escribe la linea en el archivo
		end loop;
		file_close(ARCH_VEC);  -- cierra el archivo
		file_close(ARCH_RES);  -- cierra el archivo
      wait;
   end process;-- Stimulus process	
END;