library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity memoriaDatos is
  generic (
    d : integer := 16;
    a : integer := 6
    );
    Port (  datosIn: in  STD_LOGIC_VECTOR (d-1 downto 0);
				dir : in  STD_LOGIC_VECTOR (d-1 downto 0);
				clk, wd : in  STD_LOGIC;
				datosOut : out  STD_LOGIC_VECTOR (d-1 downto 0));
end memoriaDatos;

architecture Behavioral of memoriaDatos is
type banco is array (0 to (2**a)-1) of std_logic_vector(d-1 downto 0);
signal memoria : banco := (others=>(others=>'0'));
signal di: STD_LOGIC_VECTOR (a-1 downto 0);
begin
  di <= dir(a-1 downto 0);
  --escritura--
  process(clk)
  begin 
    if (clk'event and clk = '1') then
      if (wd = '1') then
        memoria(conv_integer(di)) <= datosIn;
      end if;
    end if;
  end process;
  
  datosOut <= memoria(conv_integer(di));
end Behavioral;