library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity escoMIPS is
	generic (
			d : integer := 25;
			a : integer := 16;
			n: integer := 4;
			
			tam_Microinstruccion:integer:=20;
			tam_OPCODE: integer:=5;
			tam_FUNCIONCODE: integer:=4
		);
		
	port(clr, clk: in std_logic;
			salida: out STD_LOGIC_VECTOR (7 downto 0);
			contador: out STD_LOGIC_VECTOR (7 downto 0));
end escoMIPS;

architecture Behavioral of escoMIPS is
-----------------------------------------------------------------------
		component pilaMem is
			port(	 	pc_in : in  STD_LOGIC_VECTOR (a-1 downto 0);
						clk, clr, up, dw, wpc : in  STD_LOGIC;
						pc_out : out  STD_LOGIC_VECTOR (a-1 downto 0);
						datosOut : out  STD_LOGIC_VECTOR (d-1 downto 0)
						);
		end component;
-----------------------------------------------------------------------
		component ArchivoReg is
		Port (rr1,rr2,wr,shamt : in  STD_LOGIC_VECTOR (n-1 downto 0);
           wdata : in  STD_LOGIC_VECTOR (a-1 downto 0);
           rdata1, rdata2 : inout  STD_LOGIC_VECTOR (a-1 downto 0);
           wd, she, dir, clk , clr : in  STD_LOGIC);
		end component;
-----------------------------------------------------------------------
		component ALU is
		port(	in1, in2: 							in std_logic_vector(a-1 downto 0);
				op:									in std_logic_vector(3 downto 0);
				res:									out std_logic_vector(a-1 downto 0);
				cout, band_n, band_z, band_ov:out std_logic);
		end component;
-----------------------------------------------------------------------
		component UnidadDeControl is
		port
		(
			OV:  in std_logic;
			N:   in std_logic;
			Z:   in std_logic;
			C:   in std_logic;
			lf:  in std_logic;
			clk: in std_logic;
			clr: in std_logic;
			 
			OP_CODE: 	in std_logic_vector(tam_OPCODE-1 downto 0);
			FUN_CODE: 	in std_logic_vector(tam_FUNCIONCODE-1 downto 0);
			
			MicroInstruccion: out std_logic_vector(tam_Microinstruccion-1 downto 0)
		);
		end component; 
-----------------------------------------------------------------------
component div_frec 
    Port ( clk : in  STD_LOGIC;
           clk_div : out  STD_LOGIC);
end component;
-----------------------------------------------------------------------
	component memoriaDatos is
	Port ( 	datosIn: in  STD_LOGIC_VECTOR (15 downto 0);
				dir : in  STD_LOGIC_VECTOR (15 downto 0);
				clk, wd : in  STD_LOGIC;
				datosOut : out  STD_LOGIC_VECTOR (15 downto 0));
	end component;
-----------------------------------------------------------------------
	component mux2a1 is
    Port ( 	ent1, ent2 : in  STD_LOGIC_VECTOR (15 downto 0);
				cond: in std_logic;
				msal : out  STD_LOGIC_VECTOR (15 downto 0));
	end component;
-----------------------------------------------------------------------
	component mux2_4b is
   Port ( 	ent1, ent2 : in  STD_LOGIC_VECTOR (3 downto 0);
				cond : in  STD_LOGIC;
				msal : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;
-----------------------------------------------------------------------
	signal 	sdmp, sr2, swd, sext, sop1, sop2, sdmd, sr,
				UP, DW, WPC,
				she, dir, wr,
				band_n, band_z, band_ov, band_c,
				wd, lf: std_logic;
				
	signal 	pc_out, pc_in,
				writedat, readdat1, readdat2,
				in1, in2, res,
				dirmd, datosO,
				extend, signo, signo1, signo2, addr, sro: STD_LOGIC_VECTOR (a-1 downto 0);
				
				
	signal 	prog: STD_LOGIC_VECTOR (d-1 downto 0);
	
	signal 	readreg1, readreg2, writereg, shamt, 
				aluop: STD_LOGIC_VECTOR (n-1 downto 0);
begin
-----------------------------------------------------------------------------------------------------------------
	muxSOP1: mux2a1 
   Port map( 	ent1 => pc_out,
					ent2 => readdat1,
					cond => sop1,
					msal => in1);
	--in1 <= pc_out when sop1='1' else readdat1;
	--------------------------------------------------------------------------------------------------------------
	muxSOP2: mux2a1 
   Port map( 	ent1 => extend,
					ent2 => readdat2,
					cond => sop2,
					msal => in2);
	--in2 <= extend when sop2='1' else readdat2;
	--------------------------------------------------------------------------------------------------------------
	muxSDMD: mux2a1 
   Port map( 	ent1 => prog(15 downto 0),
					ent2 => res,
					cond => sdmd,
					msal => dirmd);
	--dirmd <= prog(15 downto 0) when sdmd='1' else res;
	--------------------------------------------------------------------------------------------------------------
	muxSR: mux2a1 
   Port map( 	ent1 => res,
					ent2 => datoso,
					cond => sr,
					msal => sro);
	--sro <= res when sr='1' else datoso;
	--------------------------------------------------------------------------------------------------------------
	muxSWD: mux2a1 
   Port map( 	ent1 => sro,
					ent2 => prog(15 downto 0),
					cond => swd,
					msal => writedat);
	--writedat <= sro when swd='1' else prog(15 downto 0);
	--------------------------------------------------------------------------------------------------------------
	muxSDMP: mux2a1 
   Port map( 	ent1 => sro,
					ent2 => prog(15 downto 0),
					cond => sdmp,
					msal => pc_in);
	--pc_in <= sro when sdmp='1' else prog(15 downto 0);--	entradaPC		 |  sroSalida   |  lit[15-0]   | mux sdmp
	--------------------------------------------------------------------------------------------------------------
	muxSEXT: mux2a1 
   Port map( 	ent1 => addr,
					ent2 => signo,
					cond => sext,
					msal => extend);
	--extend <= ("0000"& prog(11 downto 0)) when sext='1' else signo;
	--------------------------------------------------------------------------------------------------------------
	muxSR2: mux2_4b 
   Port map( 	ent1 => prog(19 downto 16),
				ent2 => prog(11 downto 8),
				cond => sr2,
				msal => readreg2);
	--readreg2 <= prog(19 downto 16)when sr2='1' else prog(11 downto 8);
	--------------------------------------------------------------------------------------------------------------
	muxSigno: mux2a1 
   Port map( 	ent1 => signo1,
					ent2 => signo2,
					cond => prog(11),
					msal => signo);
	signo1 <= "1111"& prog(11 downto 0);
	signo2 <= "0000" & prog(11 downto 0);
	--signo <=  signo1 when prog(11)='1' else signo2;--------------------extensor de signo
	addr <= "0000"& prog(11 downto 0);--------------------extensor de direccion
	
	readreg1 <= prog(15 downto 12);-----------------------entrada read regiter 1
	
	writereg <= prog(19 downto 16);-----------------------write register
	
	shamt <= prog(7 downto 4);----------------------------shamt
-----------------------------------------------------------------------------------------------------------------
	md: memoriaDatos
	Port map( 	
					datosIn => readdat2,
					dir => dirmd,
					clk => clk, 
					wd => wd,
					datosOut => datoso
					);
-----------------------------------------------------------------------
	PilaYmemoria: pilaMem
	port map(	pc_in => PC_IN,
					clk => clk, ----------
					clr => CLR, 
					up => UP, 
					dw => DW, 
					wpc => WPC,
					pc_out => PC_OUT,
					datosOut => prog
				);
-----------------------------------------------------------------------
	AchivoRegistros: ArchivoReg 
	Port map( 	rr1 => readreg1,
					rr2 => readreg2,
					wr => writereg,
					shamt => shamt, 
					wdata => writedat,
					rdata1 => readdat1,
					rdata2 => readdat2,
					wd => wr,
					she => she, 
					dir => dir,
					clk => clk, ---------------
					clr => clr
				);
-----------------------------------------------------------------------					
	ALUm: ALU 
	port map(	in1 => in1,
					in2 => in2,
					op => aluop,					
					res => res,
					cout => band_c,
					band_n => band_n,
					band_z => band_z,
					band_ov => band_ov);
-----------------------------------------------------------------------
	UC: UnidadDeControl 
	port map(
					OV => band_ov,
					N => band_n,
					Z => band_z,
					C => band_c,
					lf => lf,
					clk => clk, -----------
					clr => clr,
					
					OP_CODE  => prog(24 downto 20),
					FUN_CODE => prog(3 downto 0),
					
					MicroInstruccion(19) => sdmp,
					MicroInstruccion(18) => up,
					MicroInstruccion(17) => dw,
					MicroInstruccion(16) => wpc,
					
					MicroInstruccion(15) => sr2,
					MicroInstruccion(14) => swd,
					MicroInstruccion(13) => sext,
					MicroInstruccion(12) => she,
					
					MicroInstruccion(11) => dir,
					MicroInstruccion(10) => wr,
					MicroInstruccion(9) => sop1,
					MicroInstruccion(8) => sop2,
					
					MicroInstruccion(7) => aluop(3),
					MicroInstruccion(6) => aluop(2),
					MicroInstruccion(5) => aluop(1),
					MicroInstruccion(4) => aluop(0),
					
					MicroInstruccion(3) => sdmd,
					MicroInstruccion(2) => wd,
					MicroInstruccion(1) => sr,
					MicroInstruccion(0) => lf
		);
-----------------------------------------------------------------------
	--salida <= datoso(7 downto 0);--	SALIDA MEMORIA DATOS
	--salida <= dirmd(7 downto 0);--		SALIDA MUX SDMD
	--salida <= readdat1(7 downto 0);--	SALIDA READ DATA 1
	salida <= readdat2(7 downto 0);--	SALIDA READ DATA 2
	--salida <= res(7 downto 0);--		SALIDA ALU
	--salida <= "0000"&aluop;
	------------------------------
--	salida(7 downto 4) <= "0000";
--	salida(3) <= band_c;
--	salida(2) <= band_n;
--	salida(1) <= band_z;
--	salida(0) <= band_ov;
	------------------------------
	contador <= PC_OUT(7 downto 0);	

end Behavioral;

