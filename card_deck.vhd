--------------------------------------------------
-- Project: Black-jack
-- File:  card_deck.vhd
-- Authors: Daiane Fraga, George Redivo
--------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;   

entity card_deck is
    Port ( 	
				clk : in  STD_LOGIC;
				rst : in  STD_LOGIC;
				card_out: out  STD_LOGIC_VECTOR(3 downto 0)
			);
end card_deck;

architecture card_deck of card_deck is

type card_bank is array(51 downto 0) of std_logic_vector(3 downto 0);

signal sig_card_out : std_logic_vector(3 downto 0);
signal card : card_bank;
signal counter : integer;

constant NUMBER_OF_CARDS : integer := 52;

begin
	-- Paste here the code generated by program shuffle
  card(0) <= 3;
  card(1) <= 7;
  card(2) <= 2;
  card(3) <= 5;
  card(4) <= 2;
  card(5) <= 6;
  card(6) <= 10;
  card(7) <= 12;
  card(8) <= 3;
  card(9) <= 9;
  card(10) <= 13;
  card(11) <= 6;
  card(12) <= 8;
  card(13) <= 10;
  card(14) <= 7;
  card(15) <= 7;
  card(16) <= 11;
  card(17) <= 13;
  card(18) <= 9;
  card(19) <= 2;
  card(20) <= 12;
  card(21) <= 1;
  card(22) <= 5;
  card(23) <= 10;
  card(24) <= 6;
  card(25) <= 10;
  card(26) <= 1;
  card(27) <= 11;
  card(28) <= 9;
  card(29) <= 4;
  card(30) <= 2;
  card(31) <= 4;
  card(32) <= 8;
  card(33) <= 1;
  card(34) <= 1;
  card(35) <= 5;
  card(36) <= 9;
  card(37) <= 13;
  card(38) <= 11;
  card(39) <= 3;
  card(40) <= 8;
  card(41) <= 6;
  card(42) <= 12;
  card(43) <= 7;
  card(44) <= 13;
  card(45) <= 11;
  card(46) <= 4;
  card(47) <= 4;
  card(48) <= 12;
  card(49) <= 8;
  card(50) <= 5;
  card(51) <= 3;
	-- end of paste

	process (clk, rst)
	begin
		if (clk'event and clk = '1') then
			if counter < NUMBER_OF_CARDS then
				sig_card_out <= card(counter);
				counter <= counter + 1;
			else
				counter <= 0;
				sig_card_out <= card(counter);
			end if;
		end if;
	end process;

end card_deck;

