--------------------------------------------------
-- Project:	Black-jack
-- File:	decoder.vhd
-- Authors:	Daiane Fraga, George Redivo
--------------------------------------------------

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;

entity decoder is
    port
    (
        num_in      : in    std_logic_vector(3 downto 0);	-- input data
        bcd_out     : out   std_logic_vector(7 downto 0)	-- Ya Yb Yc Yd Ye Yf Yg Ypto
    );
end decoder;

architecture decoder of decoder is

    signal  num_int : std_logic_vector(3 downto 0);
begin
    num_int <= num_in;
														-- 0 up to 9
    bcd_out <= "11111100" when num_int = "0000" else  -- 0
               "01100000" when num_int = "0001" else  -- 1
               "11011010" when num_int = "0010" else  -- 2
               "11110010" when num_int = "0011" else  -- 3
               "01100110" when num_int = "0100" else  -- 4
               "10110110" when num_int = "0101" else  -- 5
               "01001001" when num_int = "0110" else  -- 6
               "11100000" when num_int = "0111" else  -- 7
               "11111110" when num_int = "1000" else  -- 8
               "11110110" when num_int = "1001" else	-- 9
				       "00000000";	-- default
end decoder;

