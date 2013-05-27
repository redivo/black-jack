library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;

entity displayer_tb is
end displayer_tb;

architecture displayer_tb of displayer_tb is
   component displayer
   port(
        clk_in  : in   std_logic;
        data_in : in   std_logic_vector(4 downto 0);	-- points
        num_out : out  std_logic_vector(7 downto 0);	-- data to display
        en0_out : out  std_logic;							-- enable for unit display
        en1_out : out  std_logic								-- enable for ten display
       );
  end component;

  constant	PERIOD	: time := 20 ns;

	signal data_in 	: std_logic_vector(4 downto 0) := (others => '0');
	signal num_out 	: std_logic_vector(7 downto 0) := (others => '0');
	signal clk			: std_logic := '0';
	signal en0_out 	: std_logic := '0';
  signal en1_out 	: std_logic := '0';

 begin

	clk	<= not clk after (PERIOD / 2);

	uut: displayer
	port map (
		data_in 	=> data_in,
    num_out 	=> num_out,
		clk_in	=> clk,
		en0_out	=> en0_out,
		en1_out	=> en1_out
   );

  input_gen: process
	begin
		wait for 100ns;
    data_in <= data_in + 1;
		wait for PERIOD;
	end process;
end;
