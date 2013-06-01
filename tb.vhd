--------------------------------------------------
-- File:    bcd_decoder_tb.vhd
-- Author:  Prof. M.Sc. Marlon Moraes
-- E-mail:  marlon.moraes@pucrs.br
--------------------------------------------------

--------------------------
-- library
--------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all; 

--------------------------
-- entity
--------------------------
entity top_tb is

generic
(
	CLK_EDGE    : std_logic := '1'
);
port
(
	error		: out std_logic_vector(7 downto 0)
);
	end top_tb;


	--------------------------
	-- architecture
	--------------------------
architecture top_tb of top_tb is

	constant	PERIOD		: time := 20 ns;	-- Clock: 100MHz
	constant	PUSH_TIME	: time := 500 ms;
	constant	WAIT_TIME	: time := 2000 ms;
	constant	SHOW_TIME	: time := 3000 ms;

	-- decoder signals.
	signal 	num_in      : std_logic_vector(3 downto 0) := (others => '0');		-- entrada de dados.
	signal 	bcd_out     : std_logic_vector(7 downto 0) := (others => '0');		-- Ya Yb Yc Yd Ye Yf Yg Ypto.

	-- test signals.
	signal test_vector	: std_logic_vector(7 downto 0) := (others => '0');		-- dados de saída do modelo.
	signal error_int	: std_logic_vector(7 downto 0) := (others => '0');		-- sinal interno de erro.

	-- control signals.
	signal clk			: std_logic := '0';										-- sinal de clock do TB.

	signal stay_in_tb		: std_logic := '0';
	signal hit_in_tb		: std_logic := '0';
	signal show_in_tb		: std_logic := '0';
	signal card_bd_ok_in_tb	: std_logic;
	signal clk_in_tb		: std_logic := '0';
	signal rst_in_tb		: std_logic := '0';
	signal card_in_tb		: std_logic_vector(3 downto 0);
	signal req_card_out_tb	: std_logic;
	signal win_out_tb		: std_logic;
	signal lose_out_tb		: std_logic;
	signal tie_out_tb		: std_logic;
	signal num_out_tb		: std_logic_vector(4 downto 0);

	begin

	--------------------------
	-- instances
	--------------------------
	fsm: entity work.state_machine
	port map
	(
		stay_in			=> stay_in_tb,
		hit_in			=> hit_in_tb,
		show_in			=> show_in_tb,
		card_bd_ok_in	=> card_bd_ok_in_tb,
		clk_in			=> clk_in_tb,
		rst_in			=> rst_in_tb,
		card_in			=> card_in_tb,
		req_card_out	=> req_card_out_tb,
		win_out			=> win_out_tb,
		lose_out		=> lose_out_tb,
		tie_out			=> tie_out_tb,
		num_out			=> num_out_tb
	);

 -- Instantiate the card deck
  deck: entity work.card_deck
  port map (
    clk      => clk_in_tb,
    rst      => rst_in_tb,
    card_out => card_in_tb
  );
	--------------------------
	-- processes
	--------------------------

	-- Clock generator
	input_clk: process
	begin
		wait for PERIOD;
		clk_in_tb <= not clk_in_tb;
	end process;

	-- Generate input push buttons
	input_gen: process
	begin
		-- Push reset button
		wait for WAIT_TIME;
		rst_in_tb <= '1';
		wait for PUSH_TIME;
		rst_in_tb <= '0';

		-- Push hit button
		wait for WAIT_TIME;
		hit_in_tb <= '1';
		wait for PUSH_TIME;
		hit_in_tb <= '0';

		-- Push hit button again
		wait for WAIT_TIME;
		hit_in_tb <= '1';
		wait for PUSH_TIME;
		hit_in_tb <= '0';

		-- Push stay button
		wait for WAIT_TIME;
		stay_in_tb <= '1';
		wait for PUSH_TIME;
		stay_in_tb <= '0';

		-- Push show button
		wait for WAIT_TIME;
		show_in_tb <= '1';
		wait for SHOW_TIME;
		show_in_tb <= '0';

	end process;

end top_tb;
