--------------------------------------------------
-- Project:	Laboratorio 3
-- File: clock_divider.vhd
-- Author: Daiane Fraga   
-- E-mail: daiane.fraga@acad.pucrs.br
--------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_arith.all;
  use ieee.std_logic_unsigned.all;   

entity clock_divider is
  gereric
  (
    CLK_EDGE : std_logic := '1';
    DIV_BASE : integer   :=  4
  );
  port
  (
    clk_in  : in  std_logic;	-- reference clock
    rst_in  : in  std_logic;	-- reset
    clk_out : out std_logic		-- divided clock 
  );
end clock_divider;

architecture clock_divider of clock_divider is
  signal count : integer;
begin

process(clk_in)
begin
  if(clk'event and clk=CLK_EDGE) then
    if(count < DIV_BASE-1) then
      count <= count + 1;
    else
      count <= 0;
    end if;
  
    if(count < (DIV_BASE/2)-1) then
      clk_out <= '0';
    else
      clk_out <= '1';
    end;
  end if;
end process;

end clock_divider;
