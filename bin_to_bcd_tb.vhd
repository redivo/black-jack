library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;
 
ENTITY bin_to_bcd_tb IS
END bin_to_bcd_tb;
 
ARCHITECTURE behavior OF bin_to_bcd_tb IS 
    COMPONENT bin_to_bcd
    PORT(
         bin_in : IN  std_logic_vector(4 downto 0);
         ten_out : OUT  std_logic_vector(3 downto 0);
         one_out : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
 
   signal bin_in  : std_logic_vector(4 downto 0) := (others => '0');
   signal ten_out : std_logic_vector(3 downto 0);
   signal one_out : std_logic_vector(3 downto 0);
	signal clk		: std_logic;
 
   constant clk_period : time := 10 ns;
 
BEGIN
 
	clk	<= not clk after (clk_period / 2);
	
	uut: bin_to_bcd PORT MAP (
          bin_in => bin_in,
          ten_out => ten_out,
          one_out => one_out
        );

   stim_proc: process
   begin		
		bin_in <= "10110";
      wait for clk_period*10;
		bin_in <= "11111";	
		wait for clk_period*10;
		bin_in <= "00010";	
		wait for clk_period*10;
		bin_in <= "11001";	
      wait;
   end process;

END;
