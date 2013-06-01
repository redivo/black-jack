
LIBRARY ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;

ENTITY decoder_tb IS
END decoder_tb;

ARCHITECTURE behavior OF decoder_tb IS
   COMPONENT decoder
   PORT(
         num_in 	: IN  std_logic_vector(3 downto 0);
         bcd_out 	: OUT  std_logic_vector(7 downto 0)
       );
   END COMPONENT;

	constant PERIOD	: time := 20 ns;

	signal num_in 	: std_logic_vector(3 downto 0) := (others => '0');
	signal bcd_out 	: std_logic_vector(7 downto 0);
	signal clk			: std_logic := '0';
BEGIN

  -- generate clock
	clk	<= not clk after (PERIOD / 2);

  -- unit under test
	uut: decoder
  PORT MAP (
              num_in => num_in,
              bcd_out => bcd_out
           );

  -- generate input data
	input_gen: process
	begin
		num_in <= num_in + 1;
		wait for PERIOD;
	end process;
END;
