--------------------------------------------------
-- Project:	Black-jack
-- File:	decoder.vhd
-- Authors:	Daiane Fraga, George Redivo   
--------------------------------------------------

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;   

entity state_machine is
    port
    (
        stay_in     	: in    std_logic;	
        hit_in	    	: in    std_logic;	
        show_in     	: in    std_logic;	
        card_bd_ok_in   : in    std_logic;	
        clk_in     	: in    std_logic;	
        rst_in     	: in    std_logic;	
	card_in		: in 	std_logic_vector(3 downto 0);
	req_card_out	: out 	std_logic;
	win_out		: out 	std_logic;
	lose_out	: out 	std_logic;
	tie_out		: out 	std_logic;
        num_out     	: out 	std_logic_vector(4 downto 0)
    );
end state_machine;

architecture state_machine of state_machine is
	constant RESET		: integer := 0; 
	constant LOAD		: integer := 1; 
	constant START		: integer := 2; 
	constant SHOW_POINTS	: integer := 3; 
	constant CHECK_STOP	: integer := 4;
	constant CHECK_BUT	: integer := 5;
	constant GIVE_CARD	: integer := 6;
	constant CHECK_FINISH	: integer := 7;
	constant FINISH		: integer := 8;

	signal	 State			: integer;
	signal   sig_num_out		: std_logic_vector(4 downto 0);
	signal   sig_win_out		: std_logic;
	signal   sig_lose_out		: std_logic;
	signal   sig_tie_out		: std_logic;
	signal   sig_req_card_out	: std_logic;
	signal	 dealer_points		: std_logic_vector(4 downto 0);
	signal	 player_points		: std_logic_vector(4 downto 0);
	signal	 card_counter		: std_logic_vector(4 downto 0);
	signal stoped				: std_logic;
	signal dealer_turn			: std_logic;
begin
	num_out <= sig_num_out;
	win_out <= sig_win_out;
	lose_out <= sig_lose_out;
	tie_out <= sig_tie_out;
	req_card_out <= sig_req_card_out;

	fsm: process(rst, clk)
	begin    
		if clock'event and clock='1'
			if rst='1' then 
	        		State	<= RESET;
			else
				case State is
					when RESET =>
						sig_num_out <= (others='0');
						sig_win_out <= '0';
						sig_lose_out <= '0';
						sig_tie_out <= '0';
						sig_req_card_out <= '0';
						stoped <= '0';
						dealer_turn <= '0';
						dealer_points <= 0;
						player_points <= 0;
						card_counter <= 0;
						State <= LOAD;

					when LOAD =>
						if card_bd_ok_in then
							State <= START;		
						end if;

					when START =>
						sig_req_card_out <= '1';
						if card_counter < 2
							player_points <= player_points + card_in;
						elsif card_counter < 4
							dealer_points <= dealer_points + card_in;
						else
							sig_req_card_out <= '0';
							State <= SHOW_POINTS;
						end if;	
						card_counter <= card_counter + 1;

					when SHOW_POINTS => 
						sig_req_card_out <= '0';
						sig_num_out <= player_points;
						State <= CHECK_FINISH;

					when CHECK_STOP =>
						if stoped = '1' then
							dealer_turn <= '1';
							State <= GIVE_CARD;
						else
							State <= CHECK_BUT;
						end if;

					when CHECK_BUT =>
						if hit_in = '1' then
							State <= GIVE_CARD;

						elsif stay_in = '1' then
							stoped <= '1';
							State <= CHECK_FINISH;
						end if;


					when GIVE_CARD =>
						if sig_req_card_out = '1' then
							sig_req_card_out <= '0';
							State <= SHOW_POINTS;
						else
							sig_req_card_out <= '1';

							if dealer_turn = '1' then
								dealer_points = dealer_points + card_in;
							else
								player_points = player_points + card_in;
							end if;
						end if;

					when CHECK_FINISH => 
						if player_points < 21 and dealer_points < 21 then
							-- Dealer stay, so finish it
							if sig_dealer_turn = '1' and (not (dealer_points < 16)) then
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
							State <- FINISH;
							sig_win_out <= '1';

						-- Player lose
						elsif (player_points > 21 and (not (dealer_points > 21)))
								or (player_points < 21 and dealer_points = 21) then
							State <- FINISH;
							sig_lose_out <= '1';

						-- Tie
						else
							State <- FINISH;
							sig_tie_out <= '1';

						end if;

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

