--------------------------------------------------
-- Project:	Black-jack
-- File:	bin_to_bcd.vhd
-- Authors:	Daiane Fraga, George Redivo   
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
    unit_out  : out std_logic_vector(3 downto 0)   -- output data = unit
  );
end bin_to_bcd;

architecture bin_to_bcd of bin_to_bcd is

  -- internal signal
  signal    var_int	  : std_logic_vector(4 downto 0);
  -- output numbers (bcd)
  signal    sig_ten_out	  : std_logic_vector(3 downto 0);
  signal    sig_unit_out  : std_logic_vector(3 downto 0);
  -- input number (binary)
  signal    sig_bin_in	  : std_logic_vector(4 downto 0);
  
  -- constants to control numbers
  constant  TEN		  : std_logic_vector(4 downto 0) := "01010";
  constant  TEN_LIMIT	  : std_logic_vector(4 downto 0) := "01001";
  constant  INCREMENT	  : std_logic_vector(3 downto 0) := "0001";
	
begin
  -- combinational circuit

  var_int     <= sig_bin_int;
  sig_ten_out <= "0000";
  
  while var_int > TEN_LIMIT 
    var_int	<= var_int - TEN;
    sig_ten_out <= sig_ten_out + INCREMENT; 
  end while;

  -- decimal unit
  unit_out  <= var_int;
  -- decimal ten
  ten_out   <= sig_ten_out;

end bin_to_bcd;

