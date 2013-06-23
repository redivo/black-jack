--------------------------------------------------
-- Project: Black-jack
-- File:  loader.vhd
-- Authors: Daiane Fraga, George Redivo
--------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;   


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

	-- Pin linkage
	load_ok_out <= sig_load_ok_out;
	card_out <= sig_card_out;

	process (clk, hit_in)
    variable index : integer;
	begin
		if (clk'event and clk = '1') then
			if rst = '1' then
				-- Reset outputs
				sig_load_ok_out <= '0';
				sig_card_out <= "0000";
				counter <= 0;
				
				-- Reset card bank
				for index in 0 to 51 loop
					card(index) <= "0000";
				end loop;
			else
				--  Load cards from input
				if sig_load_ok_out = '0' then
				-- If load is ok, set this signal and put the first car in output
					if counter = NUMBER_OF_CARDS then
						sig_load_ok_out <= '1';
						counter <= 0;
						sig_card_out <= card(0);
					else
						card(counter) <= card_in;
						counter <= counter + 1;
					end if;
				end if;
			end if;
		end if;

		if (hit_in'event and hit_in = '1') then
			if counter >= 0 and counter < (NUMBER_OF_CARDS - 1) then
				sig_card_out <= card(counter + 1);
				counter <= counter + 1;
			else
				sig_card_out <= card(NUMBER_OF_CARDS - 1);
			end if;
		end if;


	end process;

--	process (hit_in)
--	begin
--		if hit_in'event and hit_in = '1' then
--			if counter >= 0 and counter < (NUMBER_OF_CARDS - 1) then
--				sig_card_out <= card(counter + 1);
--				counter <= counter + 1;
--			else
--				sig_card_out <= card(NUMBER_OF_CARDS - 1);
--			end if;
--		end if;
--	end process;

end loader;

