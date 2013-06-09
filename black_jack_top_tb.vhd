--------------------------------------------------
-- PROJECT TOP -- TESTBENCH
-- Project: black-jack
-- File:  jack_black.vhd
-- Authors: Daiane Fraga, George Redivo
--------------------------------------------------

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;   
 
entity black_jack_top_tb is
end black_jack_top_tb;
 
architecture behavior of black_jack_top_tb is 
  -- Clock period definitions
  constant CLK_PERIOD : time := 10 ns;
  
  -- Clock and Reset signals
  signal clk_in    : std_logic := '0';
  signal rst_in    : std_logic := '0';

  -- Input signals
  signal stay_in   : std_logic := '0';
  signal hit_in    : std_logic := '0';
  signal show_in   : std_logic := '0';
  signal card_in   : std_logic_vector(3 downto 0) := (others => '0');

  -- Output signals
  signal num_out   : std_logic_vector(7 downto 0);
  signal win_out   : std_logic;
  signal lose_out  : std_logic;
  signal tie_out   : std_logic;
  signal en0_out   : std_logic;   
  signal en1_out   : std_logic;   

begin
 
  -- Instantiate the DUT
  dut: entity work.black_jack_top
  port map (
    clk_in   => clk_in,
    rst_in   => rst_in,
    stay_in  => stay_in,
    hit_in   => hit_in,
    show_in  => show_in,
    card_in  => card_in,
    win_out  => win_out,
    lose_out => lose_out,
    tie_out  => tie_out,
    num_out  => num_out,
    en0_out  => en0_out,
    en1_out  => en1_out
  );
  
  -- Instantiate the card deck
  deck: entity work.card_deck
  port map (
    clk      => clk_in,
    rst      => rst_in,
    card_out => card_in
  );
  
  -- Generate clock
	clk_in	<= not clk_in after (CLK_PERIOD/2);
 
	-- Stimulus process
	stim_proc: process
	begin		
		-- Push reset
		wait for 50 ms;
		rst_in <= '1';
		wait for 20 ms;
		rst_in <= '0';
		
		-- Push hit
		wait for 50 ms;
		hit_in <= '1';
		wait for 20 ms;
		hit_in <= '0';
		
		-- Push hit again
		wait for 50 ms;
		hit_in <= '1';
		wait for 20 ms;
		hit_in <= '0';
		
		-- Push stay
		wait for 50 ms;
		stay_in <= '1';
		wait for 20 ms;
		stay_in <= '0';
		
		-- Push show
		wait for 50 ms;
		show_in <= '1';
		wait for 100 ms;
		show_in <= '0';
		
	end process;
end;
