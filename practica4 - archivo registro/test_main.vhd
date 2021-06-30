LIBRARY ieee;
LIBRARY STD;
USE STD.TEXTIO.ALL;
USE ieee.std_logic_TEXTIO.ALL;	--PERMITE USAR STD_LOGIC 

USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_UNSIGNED.ALL;
USE ieee.std_logic_ARITH.ALL;
 
ENTITY test_main IS
END test_main;
 
ARCHITECTURE behavior OF test_main IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT main
    PORT(
         rr1 : IN  std_logic_vector(3 downto 0);
         rr2 : IN  std_logic_vector(3 downto 0);
         wr : IN  std_logic_vector(3 downto 0);
         shamt : IN  std_logic_vector(3 downto 0);
         wdata : IN  std_logic_vector(15 downto 0);
         rdata1 : INOUT  std_logic_vector(15 downto 0);
         rdata2 : INOUT  std_logic_vector(15 downto 0);
         wd : IN  std_logic;
         she : IN  std_logic;
         dir : IN  std_logic;
         clk : IN  std_logic;
         clr : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal rr1 : std_logic_vector(3 downto 0) := (others => '0');
   signal rr2 : std_logic_vector(3 downto 0) := (others => '0');
   signal wr : std_logic_vector(3 downto 0) := (others => '0');
   signal shamt : std_logic_vector(3 downto 0) := (others => '0');
   signal wdata : std_logic_vector(15 downto 0) := (others => '0');
   signal wd : std_logic := '0';
   signal she : std_logic := '0';
   signal dir : std_logic := '0';
   signal clk : std_logic := '0';
   signal clr : std_logic := '0';

	--BiDirs
   signal rdata1 : std_logic_vector(15 downto 0);
   signal rdata2 : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: main PORT MAP (
          rr1 => rr1,
          rr2 => rr2,
          wr => wr,
          shamt => shamt,
          wdata => wdata,
          rdata1 => rdata1,
          rdata2 => rdata2,
          wd => wd,
          she => she,
          dir => dir,
          clk => clk,
          clr => clr
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   --  Stimulus process			
   stim_proc: process
	file ARCH_RES : TEXT;	  	-------------------------------------------------archivo de resultados																		
	variable LINEA_RES : line;	-------------------------------------------------linea de resultado
	file ARCH_VEC : TEXT;		-------------------------------------------------archivo de vectores
	variable LINEA_VEC : line;	-------------------------------------------------linea de vectores
	
	----------------------------------------------------------------------------variables
	variable V_READREG1, V_READREG2, V_WR, V_SHAMT: STD_LOGIC_VECTOR(3 DOWNTO 0);
	variable V_WDATA, V_RDATA1, V_RDATA2: STD_LOGIC_VECTOR(15 DOWNTO 0);
	variable V_WD, V_SHE, V_DIR, V_CLR: STD_LOGIC;
	-------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------cadena
	VARIABLE CADENA : STRING(1 TO 4);
	-------------------------------------------------------------------------------------------------
   begin		
		file_open(ARCH_VEC, "VECTORES.txt", READ_MODE); 	
		file_open(ARCH_RES, "RESULTADO.txt", WRITE_MODE); 	
	----------------------------------------------------------------------------imprimiendo CADENAS	
		CADENA := " RR1";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);	--ESCRIBE LA CADENA " RR1"
		CADENA := " RR2";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);	--ESCRIBE LA CADENA " RR2"
		CADENA := "SHAM";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);	--ESCRIBE LA CADENA "SHAMT"
		CADENA := "WREG";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);	--ESCRIBE LA CADENA "WREG"
		CADENA := "  WD";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);
		CADENA := "  WR";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);
		CADENA := " SHE";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);
		CADENA := " DIR";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);
		CADENA := " CLR";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);
		CADENA := " RD1";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);
		CADENA := " RD2";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);
		writeline(ARCH_RES,LINEA_RES);-- escribe la linea en el archivo
	-------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------imprimiendo RESULTADOS
		WAIT FOR 100 NS;
		FOR I IN 0 TO 14 LOOP
	--............................................................leyendo CADENAS de VECTORES.TXT--
			readline(ARCH_VEC,LINEA_VEC); -- lee una linea completa
--			read(LINEA_VEC, VAR_OPER);  	-- asigna el primer vector a VAR_OPER 
--			OPER <= VAR_OPER;					-- asigna VAR_OPER a OPER
--			Hread(LINEA_VEC, VAR_D);		-- asigna el siguiente vector a VAR_D en formato HEX
--			D <= VAR_D;		
--			read(LINEA_VEC, VAR_CLR);  
--			CLR <= VAR_CLR;

			Hread(LINEA_VEC, V_READREG1);  
			RR1 <= V_READREG1;
			Hread(LINEA_VEC, V_READREG2);
			RR2 <= V_READREG2;
			Hread(LINEA_VEC, V_SHAMT); 
			SHAMT <= V_SHAMT;
			Hread(LINEA_VEC, V_WR); 
			WR <= V_WR;
			Hread(LINEA_VEC, V_WDATA);
			WDATA <= V_WDATA;
			read(LINEA_VEC, V_WD); 
			WD <= V_WD;
			read(LINEA_VEC, V_SHE);
			SHE <= V_SHE;
			read(LINEA_VEC, V_DIR);
			DIR <= V_DIR;
			read(LINEA_VEC, V_CLR);
			CLR <= V_CLR;
	--...........................................................................................--
			WAIT UNTIL RISING_EDGE(CLK);	--ESPERO AL FLANCO DE SUBIDA 
			V_RDATA1 := RDATA1;
			V_RDATA2 := RDATA2;
			Hwrite(LINEA_RES, V_READREG1, right, 5);
			Hwrite(LINEA_RES, V_READREG2, right, 5);
			Hwrite(LINEA_RES, V_SHAMT, right, 5);
			Hwrite(LINEA_RES, V_WR, right, 5);
			Hwrite(LINEA_RES, V_WDATA, right, 5);
			write(LINEA_RES, V_WD, right, 5);
			write(LINEA_RES, V_SHE, right, 5);
			write(LINEA_RES, V_DIR, right, 5);
			write(LINEA_RES, V_CLR, right, 5);
			Hwrite(LINEA_RES, V_RDATA1, right, 5);
			Hwrite(LINEA_RES, V_RDATA2, right, 5);
--			VAR_Q := Q;	
--			write(LINEA_RES, VAR_OPER, right, 5);	--ESCRIBE EL CAMPO OPER
--			Hwrite(LINEA_RES, VAR_D, 	right, 5);	--ESCRIBE EL CAMPO D
--			write(LINEA_RES, VAR_CLR, 	right, 5);	--ESCRIBE EL CAMPO CLR
--			Hwrite(LINEA_RES, VAR_Q, 	right, 5);	--ESCRIBE EL CAMPO Q
			writeline(ARCH_RES,LINEA_RES);-- escribe la linea en el archivo
		end loop;
		file_close(ARCH_VEC);  -- cierra el archivo
		file_close(ARCH_RES);  -- cierra el archivo
      wait;
   end process;-- Stimulus process		
END;
