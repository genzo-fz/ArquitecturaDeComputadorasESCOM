LIBRARY ieee;
LIBRARY STD;
USE STD.TEXTIO.ALL;
USE ieee.std_logic_TEXTIO.ALL;  --PERMITE USAR STD_LOGIC 
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_UNSIGNED.ALL;
USE ieee.std_logic_ARITH.ALL;
 
ENTITY test_UC IS
END test_UC;
 
ARCHITECTURE behavior OF test_UC IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT UC
    PORT(
         R : IN  std_logic_vector(3 downto 0);
         FLAGS : IN  std_logic_vector(3 downto 0);
         I : IN  std_logic_vector(4 downto 0);
         CLK : IN  std_logic;
         CLR : IN  std_logic;
         LF : IN  std_logic;
         S : OUT  std_logic_vector(19 downto 0);
         NVL : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal R : std_logic_vector(3 downto 0) := (others => '0');
   signal FLAGS : std_logic_vector(3 downto 0) := (others => '0');
   signal I : std_logic_vector(4 downto 0) := (others => '0');
   signal CLK : std_logic := '0';
   signal CLR : std_logic := '0';
   signal LF : std_logic := '0';

 	--Outputs
   signal S : std_logic_vector(19 downto 0);
   signal NVL: STD_LOGIC;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: UC PORT MAP (
          R => R,
          FLAGS => FLAGS,
          I => I,
          CLK => CLK,
          CLR => CLR,
          LF => LF,
          S => S,
          NVL => NVL
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
  file ARCH_RES : TEXT;     -------------------------------------------------archivo de resultados                                    
  variable LINEA_RES : line;  -------------------------------------------------linea de resultado
  file ARCH_VEC : TEXT;   -------------------------------------------------archivo de vectores
  variable LINEA_VEC : line;  -------------------------------------------------linea de vectores
  
  ----------------------------------------------------------------------------variables
  variable V_R, V_FLAGS: STD_LOGIC_VECTOR(3 DOWNTO 0);
  variable V_I: STD_LOGIC_VECTOR(4 DOWNTO 0);
  variable V_CLR, V_LF, V_NVL: STD_LOGIC;
  variable V_S: std_logic_vector(19 downto 0);
  -------------------------------------------------------------------------------------------------
  ----------------------------------------------------------------------------cadena
  VARIABLE CADENA : STRING(1 TO 7);
  -------------------------------------------------------------------------------------------------
   begin    
    file_open(ARCH_VEC, "VECTORES1.txt", READ_MODE);  
    file_open(ARCH_RES, "RESULTADO1.txt", WRITE_MODE);  
  ----------------------------------------------------------------------------imprimiendo CADENAS 
    CADENA := "OP_CODE";
    write(LINEA_RES, CADENA, right, CADENA'LENGTH+1); --OP_CODE
    CADENA := "FUNCION";
    write(LINEA_RES, CADENA, right, CADENA'LENGTH+1); --FUNCION
    CADENA := " B_ONZC";
    write(LINEA_RES, CADENA, right, CADENA'LENGTH+1); --BANDERA ONZC
    CADENA := "    CLR";
    write(LINEA_RES, CADENA, right, CADENA'LENGTH+1); --CLR
    CADENA := "     LF";
    write(LINEA_RES, CADENA, right, CADENA'LENGTH+1); --LF
    CADENA := "MICROIN";
    write(LINEA_RES, CADENA, right, CADENA'LENGTH+14); --MICROINS
    CADENA := "  NIVEL";
    write(LINEA_RES, CADENA, right, CADENA'LENGTH+1); --NIVEL
    
    writeline(ARCH_RES,LINEA_RES);-- escribe la linea en el archivo
  -------------------------------------------------------------------------------------------------
  ----------------------------------------------------------------------------imprimiendo RESULTADOS
    WAIT FOR 100 NS;
    FOR J IN 0 TO 50 LOOP
  --............................................................leyendo CADENAS de VECTORES.TXT--
      readline(ARCH_VEC,LINEA_VEC); -- lee una linea completa
      read(LINEA_VEC, V_I);
      I <= V_I;
      read(LINEA_VEC, V_R);
      R <= V_R;
      read(LINEA_VEC, V_FLAGS);
      FLAGS <= V_FLAGS;
      read(LINEA_VEC, v_clr);
      clr <= v_clr;
      read(LINEA_VEC, V_LF);
      LF <= V_LF;
  --...........................................................................................--
      WAIT UNTIL RISING_EDGE(CLK);  --ESPERO AL FLANCO DE SUBIDA 
      V_S := S; -- asignando salida
      V_NVL := NVL;
      --////////////////////////////////////////////////////////////////ESCRIBIENDO RESULTADOS
      write(LINEA_RES, V_I, right, 8);
      write(LINEA_RES, V_R, right, 8);
      write(LINEA_RES, V_FLAGS, right, 8);
      write(LINEA_RES, V_CLR, right, 8);
      write(LINEA_RES, V_LF, right, 8);
      write(LINEA_RES, V_S, right, 21);
      write(LINEA_RES, V_NVL, right, 8);
      --//////////////////////////////////////////////////////////////////////////////////////
      writeline(ARCH_RES,LINEA_RES);-- escribe la linea en el archivo
    end loop;
    file_close(ARCH_VEC);  -- cierra el archivo
    file_close(ARCH_RES);  -- cierra el archivo
      wait;
   end process;-- Stimulus process  

END;
