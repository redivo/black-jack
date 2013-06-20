--------------------------------------------------
-- File:    regnbit.vhd
-- Author:  Caroline Brandt Menti e Dairan Severo Corrêa
-- Design:  Blackjack - Projeto de Sistemas Integrados I
--------------------------------------------------
-- Description:  registrador de 4 bits (cada carta) para armazenar as cartas
--------------------------------------------------

library ieee;
	use ieee.std_logic_1164.all;

entity regnbit is
	generic(
		INIT_VALUE : std_logic_vector(3 downto 0) := (others=>'0');
		CLK_EDGE   : std_logic := '1'; --borda do clock
        RST_HILO   : std_logic := '1' --reset ativo em alto ou baixo
	);
	port (
		clk   : in  std_logic;
		reset : in  std_logic;
		ce	  : in  std_logic;-- chip enable ativa o valor se tiver em 1
		d	  : in  std_logic_vector(3 downto 0);
		q	  : out std_logic_vector(3 downto 0)
	);
end entity regnbit;

architecture RTL of regnbit is
	
begin
	process(clk)
	begin
    	if clk'event and clk = CLK_EDGE then
       		if reset = RST_HILO then
        		Q <= INIT_VALUE(3 downto 0);
        	elsif ce = '1' then 
	           	Q <= D; 
	        end if;
       	end if;
	end process;
end architecture RTL;
