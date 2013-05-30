--------------------------------------------------
-- File:    regbank.vhd
-- Author:  Caroline Brandt Menti e Dairan Severo Corrêa
-- Design:  Blackjack - Projeto de Sistemas Integrados I
--------------------------------------------------
-- Description: 
--------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all; 

entity regbank is
	generic(
		CLK_EDGE   : std_logic := '1';
        RST_HILO   : std_logic := '1'
	);
	port (
		clk      : in std_logic;
		reset    : in std_logic;
		wreg     : in std_logic; -- ativa escrita
        address  : in std_logic_vector(5 downto 0); -- qual posição do banco
        value_in : in std_logic_vector(3 downto 0); 
        value_out: out std_logic_vector(3 downto 0) 
           );
end entity regbank;

architecture RTL of regbank is
	type bank is array(0 to 51) of std_logic_vector(3 downto 0);
   	signal reg : bank ;                            
   	signal wen : std_logic_vector(51 downto 0) ;
begin
	g1: for i in 0 to 51 generate        
      
		wen(i) <= '1' when address=i and wreg='1' else '0';
		
		rx: entity work.regnbit
			generic map(CLK_EDGE   => CLK_EDGE,
				        RST_HILO   => RST_HILO)
			port map(clk   => clk,
				     reset => reset,
				     ce    => wen(i),
				     d     => value_in,
				     q     => reg(i));
                
	end generate g1;   
    
    value_out <= reg(CONV_INTEGER(address)); 
 
end architecture RTL;
