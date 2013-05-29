--------------------------------------------------
-- PROJECT TOP
-- Project: Black-jack
-- File:  jack_black.vhd
-- Authors: Daiane Fraga, George Redivo
--------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;   

entity jack_black is
   port( 	
			card_in 	: in  std_logic_vector(3 downto 0);
			clk_in 	: in  std_logic;
			rst_in 	: in  std_logic;
			hit_in 	: in  std_logic;
			stay_in 	: in  std_logic;
			show_in 	: in  std_logic;
			num_out 	: out std_logic_vector(7 downto 0);
			en0_out 	: out std_logic;
			en1_out 	: out std_logic;
			win_out	: out std_logic;
			lose_out	: out std_logic;
			tie_out	: out std_logic
		);
end jack_black;
 
architecture behavior of jack_black is 
	component displayer
	port(
			clk_in 	: in  std_logic;
			data_in 	: in  std_logic_vector(4 downto 0);
			rst_in 	: in  std_logic;
			num_out 	: out std_logic_vector(7 downto 0);
			en0_out 	: out std_logic;
			en1_out 	: out std_logic
        );
   end component;

	component loader
	port(
			card_in 		: in  std_logic_vector( 3 downto 0);
			hit_in 		: in  std_logic;
			clk 			: in  std_logic;
			rst 			: in  std_logic;
			load_ok_out : out std_logic;
			card_out		: out std_logic_vector(3 downto 0)
       );
   end component;

	component trigger
	port(
			hit_in 	: in  std_logic;
			stay_in 	: in  std_logic;
			show_in 	: in  std_logic;
			clk 		: in  std_logic;
			rst 		: in  std_logic;
			hit_out 	: out std_logic;
			stay_out : out std_logic;
			show_out : out std_logic
       );
   end component;

	component state_machine
	port(
			stay_in     	: in  std_logic;	
			hit_in	    	: in  std_logic;	
			show_in     	: in  std_logic;	
			card_bd_ok_in  : in  std_logic;	
			clk_in     		: in  std_logic;	
			rst_in     		: in  std_logic;	
			card_in			: in 	std_logic_vector(3 downto 0);
			req_card_out	: out std_logic;
			win_out			: out std_logic;
			lose_out			: out std_logic;
			tie_out			: out std_logic;
			num_out     	: out std_logic_vector(4 downto 0)
       );
   end component;
   
	signal sig_clk 			: std_logic;
   signal sig_rst 			: std_logic;
	signal sig_stay_to_trig	: std_logic;
	signal sig_hit_to_trig	: std_logic;
	signal sig_show_to_trig	: std_logic;
	signal sig_stay_to_fsm	: std_logic;
	signal sig_hit_to_fsm	: std_logic;
	signal sig_show_to_fsm	: std_logic;
   signal sig_card_to_loader 		: std_logic_vector(3 downto 0);
	signal sig_card_to_fsm 			: std_logic_vector(3 downto 0);
	signal sig_req_card_to_loader : std_logic;
	signal sig_load_ok		: std_logic;
	signal sig_win_out		: std_logic;
	signal sig_lose_out		: std_logic;
	signal sig_tie_out		: std_logic;	
   signal sig_num_to_disp 	: std_logic_vector(4 downto 0);
   signal sig_en0 			: std_logic;
   signal sig_en1 			: std_logic;
	signal sig_dig_to_disp	: std_logic_vector(7 downto 0);
	
begin
 
	-- Displayer --
   disp: displayer 
	port map 
		(
			clk_in 	=> sig_clk,
			rst_in 	=> sig_rst,
			data_in 	=> sig_num_to_disp,
			num_out 	=> sig_dig_to_disp,
			en0_out 	=> sig_en0,
			en1_out 	=> sig_en1
		);

	-- Loader --
   load: loader 
	port map 
		(
			clk 			=> sig_clk,
			rst 			=> sig_rst,
			card_in 		=> sig_card_to_loader,
			hit_in		=> sig_req_card_to_loader,
			load_ok_out	=> sig_load_ok,
			card_out		=> sig_card_to_fsm
		);

	-- Trigger --
   trig: trigger 
	port map 
		(
			clk 		=> sig_clk,
			rst 		=> sig_rst,
			hit_in 	=> sig_hit_to_trig,
			stay_in 	=> sig_stay_to_trig,
			show_in 	=> sig_show_to_trig,
			hit_out 	=> sig_hit_to_fsm,
			stay_out => sig_stay_to_fsm,
			show_out => sig_hit_to_fsm
		);
		
	-- State Machine --
   fsm: state_machine
	port map 
		(
			clk_in 			=> sig_clk,
			rst_in 			=> sig_rst,
			hit_in 			=> sig_hit_to_fsm,
			stay_in 			=> sig_hit_to_fsm,
			show_in 			=> sig_hit_to_fsm,
			card_bd_ok_in  => sig_load_ok,
			card_in			=> sig_card_to_fsm,
			req_card_out 	=> sig_req_card_to_loader,
			win_out			=> sig_win_out,
			lose_out			=> sig_lose_out,
			tie_out			=> sig_tie_out,
			num_out  		=> sig_num_to_disp
		);
end;
