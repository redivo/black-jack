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
  
  -- Device Under Test (DUT) --> Project Top
  component black_jack_top
  port(
    clk_in 		: in  std_logic;
    rst_in 		: in  std_logic;
    hit_in 		: in  std_logic;
    stay_in 	: in  std_logic;
    show_in 	: in  std_logic;
    card_in 	: in  std_logic_vector(3 downto 0);
    num_out 	: out std_logic_vector(7 downto 0);
    en0_out 	: out std_logic;
    en1_out 	: out std_logic;
    win_out		: out std_logic;
    lose_out	: out std_logic;
    tie_out		: out std_logic
  );
  end component;
  
  -- Card Deck
  component card_deck
  port(
      clk       : in  std_logic;
			rst       : in  std_logic;
			card_out  : out std_logic_vector(3 downto 0)
  );
  end component;

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
  dut: black_jack_top
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
  deck: card_deck
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
		sig_rst_in <= '1';
		wait for 20 ms;
		sig_rst_in <= '0';
		
		-- Push hit
		wait for 50 ms;
		sig_hit_in <= '1';
		wait for 20 ms;
		sig_hit_in <= '0';
		
		-- Push hit again
		wait for 50 ms;
		sig_hit_in <= '1';
		wait for 20 ms;
		sig_hit_in <= '0';
		
		-- Push stay
		wait for 50 ms;
		sig_stay_in <= '1';
		wait for 20 ms;
		sig_stay_in <= '0';
		
		-- Push show
		wait for 50 ms;
		sig_show_in <= '1';
		wait for 100 ms;
		sig_show_in <= '0';
		
	end process;
end;
