--------------------------------------------------
-- Project:	Black-jack
-- File:	bcd_decoder.vhd
-- Authors:	Daiane Fraga, George Redivo   
--------------------------------------------------
-- library
--------------------------
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;   
--------------------------
-- entity
--------------------------
entity bcd_decoder is
    port
    (
        num_in      : in    std_logic_vector(3 downto 0);	-- input data	
        bcd_out     : out   std_logic_vector(7 downto 0)	-- Ya Yb Yc Yd Ye Yf Yg Ypto
    );
end bcd_decoder;
--------------------------
-- architecture
--------------------------
architecture bcd_decoder of bcd_decoder is
--------------------------
-- signals
--------------------------
    signal  num_int : std_logic_vector(3 downto 0);
begin
--------------------------
-- combinational
--------------------------
    num_int <= num_in;
														-- 0 up to 9
    bcd_out <=  "00000011"  when num_int = "0000" else  -- 0
                "10011111"  when num_int = "0001" else  -- 1
                "00100101"  when num_int = "0010" else  -- 2
                "00001101"  when num_int = "0011" else  -- 3
                "10011001"  when num_int = "0100" else  -- 4
                "01001001"  when num_int = "0101" else  -- 5
                "01000001"  when num_int = "0110" else  -- 6
                "00011111"  when num_int = "0111" else  -- 7
                "00000001"  when num_int = "1000" else  -- 8
                "00001001"  when num_int = "1001" else	-- 9
				"11111111";								-- default
end bcd_decoder;

