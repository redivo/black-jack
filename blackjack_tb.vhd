--------------------------------------------------
-- File:    blackjack_tb.vhd
-- Author:  Caroline Brandt Menti e Dairan Severo Corrêa
-- Design:  Blackjack - Projeto de Sistemas Integrados I
--------------------------------------------------
-- Description: 
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
entity blackjack_tb is

	generic
	(
		CLK_EDGE    : std_logic := '1';
		RST_HILO    : std_logic := '1'
	);
	port
	(
		error		: out std_logic_vector(7 downto 0)
	);
	

end blackjack_tb;


--------------------------
-- architecture
--------------------------
architecture blackjack_tb of blackjack_tb is

--------------------------
-- types
--------------------------

--------------------------
-- constants
--------------------------
	constant PERIOD	: time                          := 20 ns;	-- definição do período.
	constant CARDS_QNT : std_logic_vector(5 downto 0) := "110011"; -- 52 - 1
	constant CATHODE   : std_logic                     := '1';
	
	

--------------------------
-- signals
--------------------------
	
	-- decoder signals.
	signal 	num_in      : std_logic_vector(2 downto 0) := (others => '0');		-- entrada de dados.
	signal 	bcd_out     : std_logic_vector(7 downto 0) := (others => '0');		-- Ya Yb Yc Yd Ye Yf Yg Ypto.

	-- test signals.
	signal test_vector	: std_logic_vector(7 downto 0) := (others => '0');		-- dados de saída do modelo.
	signal error_int	: std_logic_vector(7 downto 0) := (others => '0');		-- sinal interno de erro.

	-- control signals.
	signal clk			: std_logic := '0';										-- sinal de clock do TB.
	signal reset		: std_logic := '1';
	signal stay			: std_logic := '0';
	signal hit			: std_logic := '0';
	signal show			: std_logic := '0';
	signal card			: std_logic_vector(3 downto 0);
	signal win			: std_logic;
	signal lose			: std_logic;
	signal tie			: std_logic;
	signal en0			: std_logic;
	signal en1			: std_logic;
	signal display		: std_logic_vector(7 downto 0);

begin

--------------------------
-- instances
--------------------------
	blackjack: entity work.blackjack_top
		generic map(CARDS_QNT => CARDS_QNT,
		            CATHODE   => CATHODE,
			        CLK_EDGE  => CLK_EDGE,
			        RST_HILO  => RST_HILO)
		port map(clk    => clk,
			     reset   => reset,
			     stay    => stay,
			     hit     => hit,
			     show    => show,
			     card    => card,
			     win     => win,
			     lose    => lose,
			     tie     => tie,
			     en0     => en0,
			     en1     => en1,
			     display => display);


     
--------------------------
-- combinational
--------------------------

	-- modelo do decodificador.
	

	-- comparaçãoo entre as saídas do modelo e do DUT.
	--error_int(7) <= '1' when test_vector(7) /= bcd_out(7) else '0';
	--error_int(6) <= '1' when test_vector(6) /= bcd_out(6) else '0';
	--error_int(5) <= '1' when test_vector(5) /= bcd_out(5) else '0';	
	--error_int(4) <= '1' when test_vector(4) /= bcd_out(4) else '0';
	--error_int(3) <= '1' when test_vector(3) /= bcd_out(3) else '0';
	--error_int(2) <= '1' when test_vector(2) /= bcd_out(2) else '0';
	--error_int(1) <= '1' when test_vector(1) /= bcd_out(1) else '0';
	--error_int(0) <= '1' when test_vector(0) /= bcd_out(0) else '0';
	
	-- geração do sinal de clock.
	clk	<= not clk after (PERIOD / 2);
	
	reset <= '0' after 3*PERIOD;

	
--------------------------
-- processes
--------------------------

	-- geração dos dados de entrada.
	input_gen: process
	begin
		wait until reset = '0';
		
		-- Caso 1 - Player ganha
		wait for PERIOD - 0.5ns;
		card <= CONV_STD_LOGIC_VECTOR( 1, 4); wait for PERIOD;
		card <= CONV_STD_LOGIC_VECTOR(12, 4); wait for PERIOD;
		card <= CONV_STD_LOGIC_VECTOR( 3, 4); wait for PERIOD;
		card <= CONV_STD_LOGIC_VECTOR(13, 4); wait for PERIOD;
		card <= CONV_STD_LOGIC_VECTOR( 1, 4); wait for PERIOD;
		card <= CONV_STD_LOGIC_VECTOR( 6, 4); wait for PERIOD;
		card <= CONV_STD_LOGIC_VECTOR( 7, 4); wait for PERIOD;
		
		wait for PERIOD*(51-7);
		
		wait for PERIOD*5;
		hit <= '1';
		wait for PERIOD;
		hit <= '0';
		
		wait for PERIOD*3;
        hit <= '1';
        wait for PERIOD;
        hit <= '0';
		
		wait for PERIOD*2;
		stay <= '1';
        wait for PERIOD;
        stay <= '0';
        
        
        
        wait for PERIOD*5;
        show <= '1';
        wait for PERIOD*5;
        show <= '0';
        
        
		
	end process;
	
	
	-- registro dos sinais de saída.
	ff_error: process(clk)
	begin
		if clk'event and clk = CLK_EDGE then
			error <= error_int;
		end if;
	end process;

	
end blackjack_tb;


