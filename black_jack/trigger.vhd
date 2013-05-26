----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Daiane Fraga, George Pinto
-- 
-- Create Date:    18:28:52 05/19/2013 
-- Design Name: 
-- Module Name:    trigger - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: Module to trig the input signs and avoid flaps
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

entity trigger is
    Port ( hit_in : in  STD_LOGIC;
           stay_in : in  STD_LOGIC;
           show_in : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           hit_out : out  STD_LOGIC;
           stay_out : out  STD_LOGIC;
           show_out : out  STD_LOGIC);
end trigger;

architecture trigger of trigger is

-- Internal signals
signal	sig_hit_out: std_logic;
signal	sig_stay_out: std_logic;
signal	sig_show_out: std_logic;
signal hit_pressed_out: std_logic;
signal stay_pressed_out: std_logic;

-- Hysteresis
signal hit_hysteresis: integer;
signal stay_hysteresis: integer;

constant HYSTERESIS: integer := 50;
begin

	-- Set signals to pins
	hit_out <= sig_hit_out;
	stay_out <= sig_stay_out;
	sig_show_out <= show_in;
	show_out <= sig_show_out;

	process (clk, rst)
	begin
		if (clk'event and clk = '1') then

			if (rst = '1') then
				hit_hysteresis <= 0;
				stay_hysteresis <= 0;
				hit_pressed_out <= '1';
				stay_pressed_out <= '1';

			else
				-- Handle Hit input
				if (hit_in = '1' and sig_hit_out = '0' and hit_pressed_out = '1') then
					hit_hysteresis <= hit_hysteresis + 1;
					if (hit_hysteresis = HYSTERESIS) then
						hit_pressed_out <= '0';
						hit_hysteresis <= 0;
						sig_hit_out <= '1';
					else
						sig_hit_out <= '0';
				end if;
				else
					if (hit_in = '0') then
					hit_pressed_out <= '1';
					end if;
					sig_hit_out <= '0';
				end if;

				-- Handle Stay input
				if (stay_in = '1') then
					stay_hysteresis <= stay_hysteresis + 1;
					if (stay_hysteresis = HYSTERESIS) then
						stay_pressed_out <= '0';
						stay_hysteresis <= 0;
					sig_stay_out <= '1';
					else
						sig_stay_out <= '0';
					end if;
				else
					if (stay_in = '0') then
						stay_pressed_out <= '1';
					end if;
					sig_stay_out <= '0';
				end if;
			end if;
		end if;
	end process;

end trigger;

