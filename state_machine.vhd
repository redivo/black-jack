--------------------------------------------------
-- Project:	Black-jack
-- File:	state_machine.vhd
-- Authors:	Daiane Fraga, George Redivo   
--------------------------------------------------

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_arith.all;
	use ieee.std_logic_unsigned.all;   

-- External interface	
entity state_machine is
    port
    (
			stay_in     	: in    std_logic;	
			hit_in	    	: in    std_logic;	
			show_in     	: in    std_logic;	
			card_bd_ok_in	: in    std_logic;	
			clk_in     		: in    std_logic;	
			rst_in     		: in    std_logic;	
			card_in			: in 	std_logic_vector(3 downto 0);
			req_card_out	: out 	std_logic;
			win_out			: out 	std_logic;
			lose_out		: out 	std_logic;
			tie_out			: out 	std_logic;
			num_out			: out 	std_logic_vector(4 downto 0)
    );
end state_machine;

architecture state_machine of state_machine is
	-- States
	constant RESET			: integer := 0; 
	constant LOAD			: integer := 1; 
	constant START			: integer := 2; 
	constant SHOW_POINTS	: integer := 3; 
	constant CHECK_STOP		: integer := 4;
	constant CHECK_BUT		: integer := 5;
	constant GIVE_CARD		: integer := 6;
	constant CHECK_FINISH	: integer := 7;
	constant FINISH			: integer := 8;
	
	-- Internal signals
	signal	State			: integer;
	signal  sig_num_out		: std_logic_vector(4 downto 0);
	signal  sig_win_out		: std_logic;
	signal  sig_lose_out	: std_logic;
	signal  sig_tie_out		: std_logic;
	signal  sig_req_card_out: std_logic;
	signal	dealer_points	: std_logic_vector(4 downto 0);
	signal	player_points	: std_logic_vector(4 downto 0);
	signal	card_counter	: std_logic_vector(4 downto 0);
	signal 	stopped			: std_logic;
	signal 	dealer_turn		: std_logic;
begin

	-- Mapping signals and ports
	num_out <= sig_num_out;
	win_out <= sig_win_out;
	lose_out <= sig_lose_out;
	tie_out <= sig_tie_out;
	req_card_out <= sig_req_card_out;

	fsm: process(clk_in)
	begin    
		if clk_in'event and clk_in='1' then
			-- Do not generate latch
			State <= State;
			
			if rst_in = '1' then 
	        		State <= RESET;
			else
				case State is
					-- Reset all signals. The game began.
					when RESET =>
						sig_num_out <= "00000";
						dealer_points <= "00000";
						player_points <= "00000";
						card_counter <= "00000";
						sig_req_card_out <= '0';
						sig_req_card_out <= '0';
						sig_win_out <= '0';
						sig_lose_out <= '0';
						sig_tie_out <= '0';
						stopped <= '0';
						dealer_turn <= '0';

						State <= LOAD;

					-- While card-bank isn't loaded
					when LOAD =>
						if card_bd_ok_in = '1' then
							State <= START;		
						end if;

					-- Give cards (2 for each)
					when START =>
						if sig_req_card_out = '0' then
							sig_req_card_out <= '1';
							card_counter <= card_counter + 1;

							if (card_counter = 0 or card_counter = 2) then
								player_points <= player_points + card_in;
							elsif (card_counter = 1 or card_counter = 3) then
								dealer_points <= dealer_points + card_in;
							else
								sig_req_card_out <= '0';
								State <= SHOW_POINTS;
							end if;

						else
							sig_req_card_out <= '0';
						end if;

					-- Show player points on displays
					when SHOW_POINTS => 
						sig_req_card_out <= '0';
						sig_num_out <= player_points;
						State <= CHECK_FINISH;

					-- Check wheater player stopped (pushed stay)
					when CHECK_STOP =>
						if stopped = '1' then
							dealer_turn <= '1';
							State <= GIVE_CARD;
						else
							State <= CHECK_BUT;
						end if;

					-- Check wheater a button was pushed
					when CHECK_BUT =>
						if hit_in = '1' then
							State <= GIVE_CARD;
						elsif stay_in = '1' then
							stopped <= '1';
							State <= CHECK_FINISH;
						end if;

					-- Give a card after hit
					when GIVE_CARD =>
						if sig_req_card_out = '1' then
							sig_req_card_out <= '0';
							State <= SHOW_POINTS;
						else
							sig_req_card_out <= '1';

							if dealer_turn = '1' then
								dealer_points <= dealer_points + card_in;
							else
								player_points <= player_points + card_in;
							end if;
						end if;

					-- Check wheater the game finished
					when CHECK_FINISH => 
						if (player_points < 21 and dealer_points < 21) then
							-- Dealer stay, so finish it
							if dealer_turn = '1' and (not (dealer_points < 16)) then
								if player_points > dealer_points then
									sig_win_out <= '1';
								elsif dealer_points > player_points then
									sig_lose_out <= '1';
								else
									sig_tie_out <= '1';
								end if;

								State <= FINISH;

							-- Continue game
							else
								State <= CHECK_STOP;
							end if;

						-- Player win
						elsif (not (dealer_points = 21)) and (not (player_points > 21)) then
							State <= FINISH;
							sig_win_out <= '1';

						-- Player lose
						elsif (player_points > 21 and (not (dealer_points > 21)))
								or (player_points < 21 and dealer_points = 21) then
							State <= FINISH;
							sig_lose_out <= '1';

						-- Tie
						else
							State <= FINISH;
							sig_tie_out <= '1';

						end if;

					-- The game finished
					when FINISH =>
						if show_in = '1' then
							sig_num_out <= dealer_points;
						else
							sig_num_out <= player_points;
						end if;

					when others =>
						State	<= RESET;

				end case;
			end if;
		end if;
	end process;
end state_machine;

