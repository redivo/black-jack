--------------------------------------------------
-- PROJECT TOP
-- Project: Black-jack
-- File:  black_jack_top.vhd
-- Authors: Daiane Fraga, George Redivo
-- Description: Project's top. Performs the ports 
--              mapping for internal modules.
--------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;   

-- Interface ports (pins)
entity black_jack_top is
   port( 	
			card_in 	: in  std_logic_vector(3 downto 0);
			clk_in 	  : in  std_logic;
			rst_in 	  : in  std_logic;
			hit_in 	  : in  std_logic;
			stay_in 	: in  std_logic;
			show_in 	: in  std_logic;
			num_out 	: out std_logic_vector(7 downto 0);
			en0_out 	: out std_logic;
			en1_out 	: out std_logic;
			win_out	  : out std_logic;
			lose_out	: out std_logic;
			tie_out	  : out std_logic
		);
end black_jack_top;




-------------------------------
-- Architecture coding --
-------------------------------

architecture behavior of black_jack_top is 
	---------------------------------------
	-- Modules componentation --
	---------------------------------------

  -- Displayer module
	component displayer
	port(
    clk_in 	: in  std_logic;
    rst_in 	: in  std_logic;
    data_in : in  std_logic_vector(4 downto 0);
    num_out : out std_logic_vector(7 downto 0);
    en0_out : out std_logic;
    en1_out : out std_logic
  );
  end component;

  -- Loader module
	component loader
	port(
    clk 			  : in  std_logic;
    rst 			  : in  std_logic;
    card_in 		: in  std_logic_vector( 3 downto 0);
    hit_in 		  : in  std_logic;
    load_ok_out : out std_logic;
    card_out		: out std_logic_vector(3 downto 0)
  );
  end component;

  -- Trigger module
	component trigger
	port(
    clk	      : in  std_logic;
    rst       : in  std_logic;
    hit_in 	  : in  std_logic;
    stay_in   : in  std_logic;
    show_in   : in  std_logic;
    hit_out   : out std_logic;
    stay_out  : out std_logic;
    show_out  : out std_logic
  );
  end component;

  -- State Machine module
	component state_machine
	port(
    clk_in     		: in  std_logic;	
    rst_in     		: in  std_logic;	  
    stay_in     	: in  std_logic;	
    hit_in	    	: in  std_logic;	
    show_in     	: in  std_logic;	
    card_bd_ok_in : in  std_logic;	
    card_in			  : in 	std_logic_vector(3 downto 0);
    req_card_out	: out std_logic;
    win_out			  : out std_logic;
    lose_out			: out std_logic;
    tie_out			  : out std_logic;
    num_out     	: out std_logic_vector(4 downto 0)
  );
  end component;
   
   -------------------------------
   -- Signals declaration --
   -------------------------------
  signal sig_clk 			          : std_logic;
  signal sig_rst 			          : std_logic;
  signal sig_stay_to_trig	      : std_logic;
  signal sig_hit_to_trig	      : std_logic;
  signal sig_show_to_trig	      : std_logic;
  signal sig_stay_to_fsm	      : std_logic;
  signal sig_hit_to_fsm	        : std_logic;
  signal sig_show_to_fsm	      : std_logic;
  signal sig_card_to_loader     : std_logic_vector(3 downto 0);
  signal sig_card_to_fsm 		    : std_logic_vector(3 downto 0);
  signal sig_req_card_to_loader : std_logic;
  signal sig_load_ok		        : std_logic;
  signal sig_win_out		        : std_logic;
  signal sig_lose_out		        : std_logic;
  signal sig_tie_out		        : std_logic;	
  signal sig_num_to_disp 	      : std_logic_vector(4 downto 0);
  signal sig_en0 			          : std_logic;
  signal sig_en1 			          : std_logic;
  signal sig_dig_to_disp	      : std_logic_vector(7 downto 0);

begin
	-----------------
	-- Behavior --
	-----------------
	
	-------------------------
	-- Top pin linkage --
	-------------------------
	-- General signals
	 sig_clk <= clk_in;
	 sig_rst <= rst_in;
	
	-- Signals to loader
	 sig_card_to_loader <= card_in;
	
	-- Signals to trigger
	 sig_hit_to_trig <= hit_in;
	 sig_stay_to_trig <= stay_in;
	 sig_show_to_trig <= show_in;
	
	-- Signals out
	num_out <= sig_dig_to_disp;
	en0_out <= sig_en0;
	en1_out <= sig_en1;
	win_out <= sig_win_out;
	lose_out <= sig_lose_out;
	tie_out <= sig_tie_out;


  -- Instantiate the Displayer --
  disp: displayer 
  port map 
  (
    clk_in 	=> sig_clk,
    rst_in 	=> sig_rst,
    data_in => sig_num_to_disp,
    num_out => sig_dig_to_disp,
    en0_out => sig_en0,
    en1_out => sig_en1
  );

  -- Instantiate the Loader --
  load: loader 
  port map 
  (
    clk 			  => sig_clk,
    rst 			  => sig_rst,
    card_in 		=> sig_card_to_loader,
    hit_in		  => sig_req_card_to_loader,
    load_ok_out	=> sig_load_ok,
    card_out		=> sig_card_to_fsm
  );

  -- Instantiate the Trigger --
  trig: trigger 
  port map 
  (
    clk 		  => sig_clk,
    rst 		  => sig_rst,
    hit_in 	  => sig_hit_to_trig,
    stay_in   => sig_stay_to_trig,
    show_in   => sig_show_to_trig,
    hit_out   => sig_hit_to_fsm,
    stay_out  => sig_stay_to_fsm,
    show_out  => sig_show_to_fsm
  );

  -- Instantiate the State Machine --
  fsm: state_machine
  port map 
  (
    clk_in 			  => sig_clk,
    rst_in 			  => sig_rst,
    hit_in 			  => sig_hit_to_fsm,
    stay_in 			=> sig_stay_to_fsm,
    show_in 			=> sig_show_to_fsm,
    card_bd_ok_in => sig_load_ok,
    card_in			  => sig_card_to_fsm,
    req_card_out 	=> sig_req_card_to_loader,
    win_out			  => sig_win_out,
    lose_out			=> sig_lose_out,
    tie_out			  => sig_tie_out,
    num_out  		  => sig_num_to_disp
  );
end;
