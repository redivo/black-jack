--------------------------------------------------
-- File:    bcd.vhd
-- Author:  Caroline Brandt Menti e Dairan Severo Corrêa
-- Design:  Blackjack - Projeto de Sistemas Integrados I
--------------------------------------------------
-- Description: mostra os pontos no display de 7 segmentos
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
entity bcd is
    generic(
        CATHODE    : std_logic := '1';
		CLK_EDGE   : std_logic := '1';
        RST_HILO   : std_logic := '1'
	);
    port
    (
        clk         : in std_logic;
		reset       : in std_logic;
		
        number      : in    std_logic_vector(4 downto 0);		-- entrada de pontos dos jogadores player/dealer
        
        -- interface com o display.					
        en0, en1    : out   std_logic;                          -- dígito de dezena1/unidade0
        bcd_out     : out   std_logic_vector(7 downto 0)		-- Ya Yb Yc Yd Ye Yf Yg Ypto. leds do display
    );
end bcd;


--------------------------
-- architecture
--------------------------
architecture bcd of bcd is

--------------------------
-- types
--------------------------


--------------------------
-- constants
--------------------------


--------------------------
-- signals
--------------------------
    signal  num_int, uni, dec   : std_logic_vector(3 downto 0);--num_int mux entre a unidade e a dezena valor que vai ser colocado no display
    signal  sub10, sub20, sub30 : std_logic_vector(4 downto 0); -- subtrai para obter unidade
    signal  en                  : std_logic; -- controle de qual digito está sendo mostrado
    signal  display             : std_logic_vector(7 downto 0);


begin

--------------------------
-- instances
--------------------------


--------------------------
-- combinational
--------------------------
    en0 <= en when CATHODE='1' else not en; -- UNIDADE
    en1 <= not en when CATHODE='1' else en; -- DEZENA
    
    sub10 <= number - 10;
    sub20 <= number - 20;
    sub30 <= number - 30;
    
    uni <= sub10(3 downto 0) when number >  9 and number < 20 else
           sub20(3 downto 0) when number > 19 and number < 30 else
           sub30(3 downto 0) when number > 29 and number < 40 else
           number(3 downto 0);
    
    dec <= "0001" when number >  9 and number < 20 else
           "0010" when number > 19 and number < 30 else
           "0011" when number > 29 and number < 40 else
           "0000";
           
    num_int <= uni when en = '1' else dec;
    
    display <=  "00000011"  when num_int = "0000" else  -- 0
                "10011111"  when num_int = "0001" else  -- 1
                "00100101"  when num_int = "0010" else  -- 2
                "00001101"  when num_int = "0011" else  -- 3
                "10011001"  when num_int = "0100" else  -- 4
                "01001001"  when num_int = "0101" else  -- 5
                "01000001"  when num_int = "0110" else  -- 6
                "00011111"  when num_int = "0111" else  -- 7
                "00000001"  when num_int = "1000" else  -- 8
                "00001001"  when num_int = "1001" else  -- 9
                "00010001"  when num_int = "1010" else  -- A
                "11000001"  when num_int = "1011" else  -- B
                "01100011"  when num_int = "1100" else  -- C
                "10000101"  when num_int = "1101" else  -- D
                "01100001"  when num_int = "1110" else  -- E
                "01110001"  when num_int = "1111";       -- F
                
    bcd_out <= display when CATHODE = '0' else
               not display;
                            
                                                        
--------------------------
-- processes -- flip flop para ficar trocando o valor do display entre a dezena e a unidade
--------------------------
    process(clk)
    begin
        if clk'event and clk = CLK_EDGE then
            if reset = RST_HILO then 
                en   <= '0';
            else
                en <= not en;
            end if;
        end if;
    end process;

end bcd;

