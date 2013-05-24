--------------------------------------------------
-- Project:	Black-jack
-- File:	displayer.vhd
-- Authors:	Daiane Fraga, George Redivo   
--------------------------------------------------

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;  

entity displayer is
    port
    (
        clk_in  : in   std_logic;
        data_in : in   std_logic_vector(4 downto 0);  -- points
        num_out : out  std_logic_vector(7 downto 0);  -- data to display	
        en0_out : out  std_logic;	              -- enable for unit display
        en1_out : out  std_logic	              -- enable for ten display
    );
end displayer;

architecture displayer of displayer is
    signal  bin        : std_logic_vector(4 downto 0);
    signal  unit       : std_logic_vector(3 downto 0);
    signal  ten        : std_logic_vector(3 downto 0);
    signal  number     : std_logic_vector(3 downto 0);
    signal  number_out : std_logic_vector(7 downto 0);
begin
  
  -- instance of bin_to_bcd: binary number to bcd (binary-coded decimal)
  bin_bcd: entity work.bin_to_bcd 
  port map (
    bin_in   => bin, 
    ten_out  => ten, 
    unit_out => unit
  );

  -- instance of decoder: number to display
  decod: entity work.decoder
  port map (
    num_in  => number,
    bcd_out => number_out  
  );

  process(clk_in,data_in)
  begin
    -- testando...
    -- TODO: dividir numero e obter enables
    if clk_in'event and clk_in = '1' then
      bin <= data_in;
      number <= ten;
      en1_out <= '1';
    end if; 
  end process;
end displayer;
