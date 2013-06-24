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
		-- Syntax: 
		--	assert condition report string severity severity_level;
		
		-- severity, predefined values: 
		--	note, warning, error, and failure.
		
		-- Assumir sempre failure, visto que eh uma verificacao funcional?
		
		-- Example: 
		--	assert not hit_out report "Should win" severity failure;
		
		
		-- ### RESET: START THE GAME ### --
		report "Reseting..."
		severity note;
		
		wait for 50 ms;
		rst_in <= '1';
		wait for 20 ms;
		rst_in <= '0';
		
		report "Reset done."
		severity note;
		
		-- ### LEDS POWERED OFF ### --
		
		-- TODO: Criar funcoes para verificacoes comuns.
		report "Checking LEDs..."
		severity note;
		
		assert (win_out = '0')
			report "Win's LED should be powered off."
			severity failure;
			
		assert (lose_out = '0')
			report "Lose's LED should be powered off."
			severity failure;
		
		assert (tie_out = '0')
			report "Tie's LED should be powered off."
			severity failure;
		
		-- Player: 7 points
		-- Dealer: 9 points
		-- TODO: Como verificar digitos no displayer, se eles ficam oscilando??
		report "Checking displays..."
		severity note;
		assert ((num_out = "00000011" and en1 = '1') or (num_out = "00011111" and en0 = '1'))
			report "Invalid value on displays."
			severity failure;
		
		-- ### PUSH HIT ### --
		wait for 50 ms;
		hit_in <= '1';
		wait for 20 ms;
		hit_in <= '0';
		
		-- Player: 13 points
		
		report "Checking first Hit..."
		severity note;
		
		report "Checking LEDs..."
		severity note;
		
		assert (win_out = '0')
			report "Win's LED should be powered off."
			severity failure;
			
		assert (lose_out = '0')
			report "Lose's LED should be powered off."
			severity failure;
		
		assert (tie_out = '0')
			report "Tie's LED should be powered off."
			severity failure;
			
		report "Checking displays..."
		severity note;
			
		assert ((num_out = "00000011" and en1 = '1') or (num_out = "00001101" and en0 = '1'))
			report "Invalid value on displays."
			severity failure;	
		
		
		-- ### PUSH HIT AGAIN AND PLAYER WINS ### --
		wait for 50 ms;
		hit_in <= '1';
		wait for 20 ms;
		hit_in <= '0';
		
		-- Player: 21 points (Win)
		
		report "Checking second Hit..."
		severity note;
				
		report "Checking LEDs when player wins..."
		severity note;
		
		assert (win_out = '1')
			report "Win's LED should be powered on."
			severity failure;
			
		assert (lose_out = '0')
			report "Lose's LED should be powered off."
			severity failure;
		
		assert (tie_out = '0')
			report "Tie's LED should be powered off."
			severity failure;

		report "Checking player points..."
		severity note;
		
		assert ((num_out = "00100101" and en1 = '1') or (num_out = "10011111" and en0 = '1'))
			report "Invalid value on displays."
			severity failure;	
			
		-- ### PUSH SHOW ### --
		wait for 50 ms;
		show_in <= '1';
		
		report "Checking push show..."
		severity note;
		
		report "Checking LEDs when pushed show..."
		severity note;
		
		assert (win_out = '1')
			report "Win's LED should be powered on."
			severity failure;
			
		assert (lose_out = '0')
			report "Lose's LED should be powered off."
			severity failure;
		
		assert (tie_out = '0')
			report "Tie's LED should be powered off."
			severity failure;
		
		report "Checking dealer points..."
		severity note;
		
		assert ((num_out = "00000011" and en1 = '1') or (num_out = "00001001" and en0 = '1'))
			report "Invalid value on displays."
			severity failure;	
		
		wait for 100 ms;
		show_in <= '0';
		
		assert ((num_out = "00100101" and en1 = '1') or (num_out = "10011111" and en0 = '1'))
			report "Invalid value on displays."
			severity failure;	
		
	end process;
	
end; -- END TESTBENCH --
