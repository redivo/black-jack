----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Daiane Fraga, George Pinto
-- 
-- Create Date:    18:28:52 05/19/2013 
-- Design Name: 
-- Module Name:    card loader
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: Module to load the cards
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity loader is
    Port ( card_in : in  STD_LOGIC_VECTOR( 3 downto 0);
           hit_in : in  STD_LOGIC;
		   clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           load_ok_out : out  STD_LOGIC;
           card_out: out  STD_LOGIC_VECTOR(3 downto 0));
end loader;

architecture loader of loader is

type card_bank is array(51 downto 0) of std_logic_vector(3 downto 0);

signal sig_card_out : std_logic_vector(3 downto 0);
signal sig_load_ok_out : std_logic;
signal card : card_bank;
signal counter : integer;

constant NUMBER_OF_CARDS : integer := 52;

begin
	process (clk, rst)
	begin
		if (clk'event and clk = '1') then
			if rst = '1' then
				-- Reset outputs
				sig_load_ok_out <= '0';
				sig_card_out <= "0000";
				counter <= 0;
				
				-- Reset card bank
				card(0) <= "0000";
				card(1) <= "0000";
				card(2) <= "0000";
				card(3) <= "0000";
				card(4) <= "0000";
				card(5) <= "0000";
				card(6) <= "0000";
				card(7) <= "0000";
				card(8) <= "0000";
				card(9) <= "0000";
				card(10) <= "0000";
				card(11) <= "0000";
				card(12) <= "0000";
				card(13) <= "0000";
				card(14) <= "0000";
				card(15) <= "0000";
				card(16) <= "0000";
				card(17) <= "0000";
				card(18) <= "0000";
				card(19) <= "0000";
				card(20) <= "0000";
				card(21) <= "0000";
				card(22) <= "0000";
				card(23) <= "0000";
				card(24) <= "0000";
				card(25) <= "0000";
				card(26) <= "0000";
				card(27) <= "0000";
				card(28) <= "0000";
				card(29) <= "0000";
				card(30) <= "0000";
				card(31) <= "0000";
				card(32) <= "0000";
				card(33) <= "0000";
				card(34) <= "0000";
				card(35) <= "0000";
				card(36) <= "0000";
				card(37) <= "0000";
				card(38) <= "0000";
				card(39) <= "0000";
				card(40) <= "0000";
				card(41) <= "0000";
				card(42) <= "0000";
				card(43) <= "0000";
				card(44) <= "0000";
				card(45) <= "0000";
				card(46) <= "0000";
				card(47) <= "0000";
				card(48) <= "0000";
				card(49) <= "0000";
				card(50) <= "0000";
				card(51) <= "0000";
			else
				--  Load cards from input
				if sig_load_ok_out = '0' then
					card(counter) <= card_in;
					counter <= counter + 1;
					
					-- If load is ok, set this signal and put the first car in output
					if counter = NUMBER_OF_CARDS then
						sig_load_ok_out <= '1';
						counter <= 0;
						sig_card_out <= card(counter);
					end if;
				else
					-- Set next card
					if hit_in = '1' and counter < NUMBER_OF_CARDS then
						counter <= counter + 1;
						sig_card_out <= card(counter);
					end if;
				end if;
			end if;
		end if;
	end process;

end loader;

