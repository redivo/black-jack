--------------------------------------------------
-- File:    regnbit.vhd
-- Author:  Caroline Brandt Menti e Dairan Severo Corrêa
-- Design:  Blackjack - Projeto de Sistemas Integrados I
--------------------------------------------------
-- Description: 
--------------------------------------------------

library ieee;
	use ieee.std_logic_1164.all;

entity regnbit is
	generic(
		INIT_VALUE : std_logic_vector(3 downto 0) := (others=>'0');
		CLK_EDGE   : std_logic := '1';
        RST_HILO   : std_logic := '1'
	);
	port (
		clk   : in  std_logic;
		reset : in  std_logic;
		ce	  : in  std_logic;
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
