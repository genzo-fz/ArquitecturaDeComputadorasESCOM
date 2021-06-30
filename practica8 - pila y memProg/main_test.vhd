LIBRARY ieee;
LIBRARY STD;
USE STD.TEXTIO.ALL;
USE ieee.std_logic_TEXTIO.ALL;	--PERMITE USAR STD_LOGIC 
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_UNSIGNED.ALL;
USE ieee.std_logic_ARITH.ALL;
 
ENTITY main_test IS
END main_test;
 
ARCHITECTURE behavior OF main_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT main
    PORT(
         pc_in : IN  std_logic_vector(15 downto 0);
         clk : IN  std_logic;
         clr : IN  std_logic;
         up : IN  std_logic;
         dw : IN  std_logic;
         wpc : IN  std_logic;
         datosOut : OUT  std_logic_vector(24 downto 0);
			pc_out : out  STD_LOGIC_VECTOR (15 downto 0)
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
   signal datosOut : std_logic_vector(24 downto 0);
	signal pc_out : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: main PORT MAP (
          pc_in => pc_in,
          clk => clk,
          clr => clr,
          up => up,
          dw => dw,
          wpc => wpc,
          datosOut => datosOut,
			 pc_out => pc_out
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
	variable v_pc_in: STD_LOGIC_VECTOR(15 DOWNTO 0);
	variable v_pc_out : std_logic_vector(15 downto 0);
	variable v_datosOut: STD_LOGIC_VECTOR(24 DOWNTO 0);
	variable v_datosOut0: STD_LOGIC_VECTOR(4 DOWNTO 0);
	variable v_datosOut1, v_datosOut2, v_datosOut3, v_datosOut4, v_datosOut5: STD_LOGIC_VECTOR(3 DOWNTO 0);
	variable v_clr, v_up, v_dw, v_wpc: STD_LOGIC;
	-------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------cadena
	VARIABLE CADENA : STRING(1 TO 4);
	-------------------------------------------------------------------------------------------------
   begin		
		file_open(ARCH_VEC, "VECTORES.txt", READ_MODE); 	
		file_open(ARCH_RES, "RESULTADO.txt", WRITE_MODE); 	
	----------------------------------------------------------------------------imprimiendo CADENAS	
		CADENA := "POUT";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);	--"DIR"
		CADENA := "24..";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+2);	--"DATOSIN"
		CADENA := "19..";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);	--"WRITE DATA"
		CADENA := "15..";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);	--"DATOSOUT"
		CADENA := "11..";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);	
		CADENA := "7...";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);
		CADENA := "3...";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);
		writeline(ARCH_RES,LINEA_RES);-- escribe la linea en el archivo
	-------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------imprimiendo RESULTADOS
		WAIT FOR 100 NS;
		FOR I IN 0 TO 25 LOOP
	--............................................................leyendo CADENAS de VECTORES.TXT--
			readline(ARCH_VEC,LINEA_VEC); -- lee una linea completa
--			read(LINEA_VEC, VAR_OPER);  	-- asigna el primer vector a VAR_OPER 
--			OPER <= VAR_OPER;					-- asigna VAR_OPER a OPER
--			Hread(LINEA_VEC, VAR_D);		-- asigna el siguiente vector a VAR_D en formato HEX;
			Hread(LINEA_VEC, v_pc_in);
			pc_in <= v_pc_in;
			read(LINEA_VEC, v_up);
			up <= V_up;
			read(LINEA_VEC,v_dw);
			dw <= v_dw;
			read(LINEA_VEC, v_wpc);
			wpc <= v_wpc;
			read(LINEA_VEC, v_clr);
			clr <= v_clr;
	--...........................................................................................--
			WAIT UNTIL RISING_EDGE(CLK);	--ESPERO AL FLANCO DE SUBIDA 
			
			
--				pc_in : IN  std_logic_vector(15 downto 0);
--         	clr : IN  std_logic;
--         	up : IN  std_logic;
--         	dw : IN  std_logic;
--         	wpc : IN  std_logic;
--         	datosOut : OUT  std_logic_vector(24 downto 0);
--				pc_out : out  STD_LOGIC_VECTOR (15 downto 0);
--
--	variable v_pc_in: STD_LOGIC_VECTOR(15 DOWNTO 0);
-- variable v_pc_out : std_logic_vector(15 downto 0);
--	variable v_datosOut: STD_LOGIC_VECTOR(24 DOWNTO 0);
--	variable v_clr, v_up, v_dw, v_wpc: STD_LOGIC;
			
			v_pc_out := pc_out; -- asignando salida
			--v_datosOut := datosOut;
			v_datosOut0(4) := datosOut(24);
			v_datosOut0(3) := datosOut(23);
			v_datosOut0(2) := datosOut(22);
			v_datosOut0(1) := datosOut(21);
			v_datosOut0(0) := datosOut(20);
			
			v_datosOut1(3) := datosOut(19);
			v_datosOut1(2) := datosOut(18);
			v_datosOut1(1) := datosOut(17);
			v_datosOut1(0) := datosOut(16);
			
			v_datosOut2(3) := datosOut(15);
			v_datosOut2(2) := datosOut(14);
			v_datosOut2(1) := datosOut(13);
			v_datosOut2(0) := datosOut(12);
			
			v_datosOut3(3) := datosOut(11);
			v_datosOut3(2) := datosOut(10);
			v_datosOut3(1) := datosOut(9);
			v_datosOut3(0) := datosOut(8);
			
			v_datosOut4(3) := datosOut(7);
			v_datosOut4(2) := datosOut(6);
			v_datosOut4(1) := datosOut(5);
			v_datosOut4(0) := datosOut(4);
			
			v_datosOut5(3) := datosOut(3);
			v_datosOut5(2) := datosOut(2);
			v_datosOut5(1) := datosOut(1);
			v_datosOut5(0) := datosOut(0);
			--////////////////////////////////////////////////////////////////ESCRIBIENDO RESULTADOS
			Hwrite(LINEA_RES, v_pc_out, right, 5);
			--write(LINEA_RES, v_datosOut, right, 27);

			write(LINEA_RES, v_datosOut0, right, 6);
			write(LINEA_RES, v_datosOut1, right, 5);
			write(LINEA_RES, v_datosOut2, right, 5);
			write(LINEA_RES, v_datosOut3, right, 5);
			write(LINEA_RES, v_datosOut4, right, 5);
			write(LINEA_RES, v_datosOut5, right, 5);
			
			--//////////////////////////////////////////////////////////////////////////////////////
			writeline(ARCH_RES,LINEA_RES);-- escribe la linea en el archivo
		end loop;
		file_close(ARCH_VEC);  -- cierra el archivo
		file_close(ARCH_RES);  -- cierra el archivo
      wait;
   end process;-- Stimulus process	
END;
