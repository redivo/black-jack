--------------------------------------------------
-- Project:	Black-jack
-- File:	displayer.vhd
-- Authors:	Daiane Fraga, George Redivo   
--------------------------------------------------

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;   

entity displayer is
    port
    (
        clk_in		: in	std_logic;
        data_in		: in	std_logic_vector(4 downto 0);
        num_out     : out   std_logic_vector(3 downto 0);	
        en0_out		: out	std_logic;	-- enable for unit display
        en1_out		: out	std_logic	-- enable for ten display
    );
end displayer;
--
-- Exemplo: data_in = 10101 (21 decimal)
--          data_in = 11011 (27 decimal)
--
--
architecture displayer of displayer is

    signal  unit    : std_logic_vector(3 downto 0);
    signal  ten     : std_logic_vector(3 downto 0);
begin


end displayer;
