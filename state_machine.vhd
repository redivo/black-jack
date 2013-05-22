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
	constant LOAD		: integer := 0; 
	constant START		: integer := 1; 
	constant SHOW_POINTS	: integer := 2; 
	constant CHECK_STOP	: integer := 3;
	constant CHECK_BUT	: integer := 4;
	constant GIVE_CARD	: integer := 5;
	constant CHECK_FINISH	: integer := 6;
	constant FINISH		: integer := 7;
	signal	 State		: integer := 0;
	signal   sig_num_out	: std_logic_vector(4 downto 0);
	signal   sig_win_out	: std_logic;
	signal   sig_lose_out	: std_logic;
	signal   sig_tie_out	: std_logic;
	signal   sig_req_card_out	: std_logic;
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
	        		State	<= LOAD;
				sig_num_out <= (others='0');
				sig_win_out <= '0';
				sig_lose_out <= '0';
				sig_tie_out <= '0';
				sig_req_card_out <= '0';
			else
				case State is
                			when LOAD => 
                			when START => 
                			when SHOW_POINTS => 
                			when CHECK_STOP => 
                			when CHECK_BUT => 
                			when GIVE_CARD => 
                			when CHECK_FINISH => 
                			when FINISH => 

					when others =>
			        		State	<= LOAD;
						sig_num_out <= (others='0');
						sig_win_out <= '0';
						sig_lose_out <= '0';
						sig_tie_out <= '0';
						sig_req_card_out <= '0';

				end case;
			end if;
		end if;
	end process;
end state_machine;

