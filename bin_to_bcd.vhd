--------------------------------------------------
-- Project: Black-jack
-- File:  bin_to_bcd.vhd
-- Authors: Daiane Fraga, George Redivo
--------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;

-- binary number to binary-coded decimal
entity bin_to_bcd is
  port
  (
    bin_in    : in  std_logic_vector(4 downto 0);  -- input data in binary
    ten_out   : out std_logic_vector(3 downto 0);  -- output data = ten
    one_out  : out std_logic_vector(3 downto 0)   -- output data = one
  );
end bin_to_bcd;

architecture bin_to_bcd of bin_to_bcd is
  signal sig_bin 	: std_logic_vector(4 downto 0);
  signal sig_temp	: std_logic_vector(4 downto 0);

begin
	sig_bin <= bin_in;

	ten_out <= 	"0000" when sig_bin < "01010" else
					"0001" when sig_bin < "10100" else
					"0010" when sig_bin < "11110" else
					"0011";

	sig_temp <= sig_bin 	  			when sig_bin < "01010" else
					sig_bin - "01010" when sig_bin < "10100" else
					sig_bin - "10100" when sig_bin < "11110" else
					sig_bin - "11110";

	one_out <= sig_temp(3 downto 0);

end bin_to_bcd;
