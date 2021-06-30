LIBRARY ieee;
LIBRARY STD;
USE STD.TEXTIO.ALL;
USE ieee.std_logic_TEXTIO.ALL;	--PERMITE USAR STD_LOGIC 
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_UNSIGNED.ALL;
USE ieee.std_logic_ARITH.ALL;

ENTITY test_memoriaProg IS
END test_memoriaProg;
 
ARCHITECTURE behavior OF test_memoriaProg IS 
 
    COMPONENT memoriaProg
    PORT(
         dir : IN  std_logic_vector(15 downto 0);
         datosOut : OUT  std_logic_vector(24 downto 0)
        );
    END COMPONENT;
   --Inputs
   signal dir : std_logic_vector(15 downto 0);
 	--Outputs
   signal datosOut : std_logic_vector(24 downto 0);
BEGIN
   uut: memoriaProg PORT MAP (
          dir => dir,
          datosOut => datosOut
        );
  -- Stimulus process
   stim_proc: process
	file ARCH_RES : TEXT;	  	-------------------------------------------------archivo de resultados																		
	variable LINEA_RES : line;	-------------------------------------------------linea de resultado
	file ARCH_VEC : TEXT;		-------------------------------------------------archivo de vectores
	variable LINEA_VEC : line;	-------------------------------------------------linea de vectores
	
	----------------------------------------------------------------------------variables
	variable V_DIR: STD_LOGIC_VECTOR(15 DOWNTO 0);
	variable V_DATOSOUT: STD_LOGIC_VECTOR(24 DOWNTO 0);
	-------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------cadena
	VARIABLE CADENA : STRING(1 TO 4);
	-------------------------------------------------------------------------------------------------
   begin		
		file_open(ARCH_VEC, "VECTORES2.txt", READ_MODE); 	
		file_open(ARCH_RES, "RESULTADO2.txt", WRITE_MODE); 	
	----------------------------------------------------------------------------imprimiendo CADENAS	
		CADENA := "   A";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+4);	
		CADENA := " COD";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH);
		CADENA := "19..";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH);	
		CADENA := "15..";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH);
		CADENA := "11..";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH);	
		CADENA := "7..4";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH);	
		CADENA := "3..0";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);	
		writeline(ARCH_RES,LINEA_RES);-- escribe la linea en el archivo
	-------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------imprimiendo RESULTADOS
		WAIT FOR 10 NS;
		FOR I IN 0 TO 8 LOOP
			readline(ARCH_VEC,LINEA_VEC);
	--............................................................leyendo CADENAS de VECTORES2.TXT--
			Hread(LINEA_VEC, V_DIR);
			dir<= V_DIR;
	--...........................................................................................--
			wait for 10 ns;
			V_DATOSOUT := DATOSOUT; -- asignando salida
			--////////////////////////////////////////////////////////////////ESCRIBIENDO RESULTADOS
			Hwrite(LINEA_RES, V_DIR,  right, 5);
			write(LINEA_RES, " ", right, 1);
			write(LINEA_RES, V_DATOSOUT, right, V_DATOSOUT'LENGTH+1);
			--//////////////////////////////////////////////////////////////////////////////////////
			writeline(ARCH_RES,LINEA_RES);-- escribe la linea en el archivo
		end loop;

		file_close(ARCH_VEC);  -- cierra el archivo
		file_close(ARCH_RES);  -- cierra el archivo
      wait;
   end process;-- Stimulus process

END;
