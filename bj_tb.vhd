--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:40:52 06/01/2013
-- Design Name:   
-- Module Name:   /media/Arquivos/Documentos/PUC/2013-1/vls1/black-jack/bj_tb.vhd
-- Project Name:  black_jack
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: black_jack_top
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY bj_tb IS
END bj_tb;
 
ARCHITECTURE behavior OF bj_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT black_jack_top
    PORT(
         card_in : IN  std_logic_vector(3 downto 0);
         clk_in : IN  std_logic;
         rst_in : IN  std_logic;
         hit_in : IN  std_logic;
         stay_in : IN  std_logic;
         show_in : IN  std_logic;
         num_out : OUT  std_logic_vector(7 downto 0);
         en0_out : OUT  std_logic;
         en1_out : OUT  std_logic;
         win_out : OUT  std_logic;
         lose_out : OUT  std_logic;
         tie_out : OUT  std_logic
        );
    END COMPONENT;
    
	COMPONENT black_jack_top
    PORT(
         card_in : IN  std_logic_vector(3 downto 0);
         clk_in : IN  std_logic;
         rst_in : IN  std_logic;
         hit_in : IN  std_logic;
         stay_in : IN  std_logic;
         show_in : IN  std_logic;
         num_out : OUT  std_logic_vector(7 downto 0);
         en0_out : OUT  std_logic;
         en1_out : OUT  std_logic;
         win_out : OUT  std_logic;
         lose_out : OUT  std_logic;
         tie_out : OUT  std_logic
        );
    END COMPONENT;
	
	

   --Inputs
   signal sig_card_in : std_logic_vector(3 downto 0) := (others => '0');
   signal sig_clk_in : std_logic := '0';
   signal sig_rst_in : std_logic := '0';
   signal sig_hit_in : std_logic := '0';
   signal sig_stay_in : std_logic := '0';
   signal sig_show_in : std_logic := '0';

 	--Outputs
   signal sig_num_out : std_logic_vector(7 downto 0);
   signal sig_en0_out : std_logic;
   signal sig_en1_out : std_logic;
   signal sig_win_out : std_logic;
   signal sig_lose_out : std_logic;
   signal sig_tie_out : std_logic;

   -- Clock period definitions
   constant clk_in_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: black_jack_top PORT MAP (
          card_in => sig_card_in,
          clk_in => sig_clk_in,
          rst_in => sig_rst_in,
          hit_in => sig_hit_in,
          stay_in => sig_stay_in,
          show_in => sig_show_in,
          num_out => sig_num_out,
          en0_out => sig_en0_out,
          en1_out => sig_en1_out,
          win_out => sig_win_out,
          lose_out => sig_lose_out,
          tie_out => sig_tie_out
        );

   -- Clock process definitions
   clk_in_process :process
   begin
		sig_clk_in <= '0';
		wait for clk_in_period/2;
		sig_clk_in <= '1';
		wait for clk_in_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_in_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
