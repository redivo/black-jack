--------------------------------------------------
-- Project: Black-jack
-- File:  displayer.vhd
-- Authors: Daiane Fraga, George Redivo
--------------------------------------------------

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;

entity displayer is
    port
    (
        clk_in  	: in  std_logic;
        data_in 	: in  std_logic_vector(4 downto 0);  -- points
		  rst_in		: in 	std_logic;
        num_out	: out std_logic_vector(7 downto 0);  -- data to display
        en0_out 	: out std_logic;                     -- enable for unit display
        en1_out 	: out std_logic                      -- enable for ten display
    );
end displayer;

architecture displayer of displayer is
    signal  bin        	: std_logic_vector(4 downto 0);
    signal  one      	: std_logic_vector(3 downto 0);
    signal  ten        	: std_logic_vector(3 downto 0);
    signal  number     	: std_logic_vector(3 downto 0);
    signal  number_out 	: std_logic_vector(7 downto 0);
	 signal  enable		: std_logic; 	-- enable = 0 -> one
													-- enable = 1 -> ten
begin

	-- instance of bin_to_bcd: binary number to bcd (binary-coded decimal)
	bin_bcd: entity work.bin_to_bcd
	port map (
		bin_in   => bin,
		ten_out  => ten,
		one_out => one
	);

	-- instance of decoder: number to display
	decod: entity work.decoder
	port map (
		num_in  => number,
		bcd_out => number_out
	);

	-- multiplexer displays
	process(clk_in, data_in)
	begin

		bin <= data_in;
	 
		if clk_in'event and clk_in = '1' then
			if rst_in = '1' then
				number <= "1111";
				en0_out <= '0';
				en1_out <= '0';
				enable <= '0';
			elsif enable = '1' then	
				number <= ten;
				en0_out <= '0';
				en1_out <= '1';
				enable <= not enable;
			else
				number <= one;
				en0_out <= '1';
				en1_out <= '0';
				enable <= not enable;
			end if;
		end if;

		num_out <= number_out;
	
	end process;
end displayer;
