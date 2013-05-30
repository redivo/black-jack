--------------------------------------------------
-- File:    blackjack_top.vhd
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
entity blackjack_top is
    generic
    (
    	CARDS_QNT	: std_logic_vector(5 downto 0) := "110011"; -- 51
    	CATHODE     : std_logic := '1';
        CLK_EDGE    : std_logic := '1';
        RST_HILO    : std_logic := '1'
    );
    port
    (
        clk         : in    std_logic;
        reset       : in    std_logic;
        stay        : in    std_logic;
        hit         : in    std_logic;
        show        : in    std_logic;
        card        : in    std_logic_vector(3 downto 0);
        win         : out   std_logic;
        lose        : out   std_logic;
        tie         : out   std_logic;
        en0         : out   std_logic;
        en1         : out   std_logic;
        display     : out   std_logic_vector(7 downto 0)
    );
end blackjack_top;


--------------------------
-- architecture
--------------------------
architecture blackjack_top of blackjack_top is

--------------------------
-- types
--------------------------
    type    states is (S_START, S_LOAD, S_CARD, S_PLAYER, S_DEALER, S_END, S_ERROR);

--------------------------
-- constants
--------------------------


--------------------------
-- signals
--------------------------

    signal  state                   : states;          -- estado atual da máquina de estados
    signal sum, sum_card, sum_one, temp,
            pt_player, pt_dealer     : std_logic_vector(4 downto 0);      -- contador de pontos do dealer e do player
    signal ini_card                 : integer; -- contador para cartas iniciais
    signal counter_load             : std_logic_vector(5 downto 0); -- ponteiro para seleção de carta
    signal stay_player, stay_dealer : std_logic;
    signal cards, value_card        : std_logic_vector(3 downto 0);
    signal write_card               : std_logic; -- ativa leitura no banco de cartas
    signal to_display               : std_logic_vector(4 downto 0);

begin

--------------------------
-- instances
--------------------------

	card_bank: entity work.regbank
		generic map(CLK_EDGE => CLK_EDGE,
			        RST_HILO => RST_HILO)
		port map(clk      => clk,
			     reset     => reset,
			     wreg      => write_card,
			     address   => counter_load,
			     value_in  => card,
			     value_out => cards);
			     
	bcd: entity work.bcd
		generic map(CATHODE   => CATHODE,
		            CLK_EDGE   => CLK_EDGE,
			        RST_HILO   => RST_HILO)
		port map(clk       => clk,
			     reset      => reset,
			     number     => to_display,
			     en0        => en0,
			     en1        => en1,
		         bcd_out    => display);

--------------------------
-- combinational
--------------------------
    win  <= '1' when state=S_END and ( (pt_player > pt_dealer and pt_player <= 21) or (pt_player < pt_dealer and pt_dealer >  21) ) else '0';
    lose <= '1' when state=S_END and ( (pt_player > pt_dealer and pt_player >  21) or (pt_player < pt_dealer and pt_dealer <= 21) ) else '0';
    tie  <= '1' when state=S_END and pt_player = pt_dealer else '0';
    
    to_display <= pt_dealer when state=S_END and show='1' else
    			  pt_player;
    			   
    
    write_card <= '1' when state=S_LOAD else '0';
    
    value_card <= "1011" when cards=1 else
    			  "1010" when cards=11 or cards=12 or cards=13 else
    			  cards;
    
    temp <= pt_player when ini_card = 0 or ini_card = 2 or (stay_player = '0' and ini_card /= 1 and ini_card /= 3) else
            pt_dealer when ini_card = 1 or ini_card = 3 or (ini_card /= 0 and ini_card /= 2) else
            "00000";
    
    sum_card <= temp + value_card;
    sum_one  <= temp + 1;        
    sum <= sum_one when value_card = 11 and sum_card > 21 else sum_card;

--------------------------
-- processes
--------------------------

    -- parte sequencial da máquina de estados finitos
    fsm: process(clk)
    begin
        
        if clk'event and clk = CLK_EDGE then
            if reset = RST_HILO then 
                state   <= S_START;
            else

                case state is
                    
                    -- estado inicial que inicializa os sinais
                    when S_START => 
                        state <= S_LOAD;

                    when S_LOAD =>
                        if counter_load = CARDS_QNT then
                            state <= S_CARD;
                        else
                            state <= S_LOAD;
                        end if;

                    -- estado para verificação de cartas
                    when S_CARD =>
                    
                        -- se ainda está entregando as cartas iniciais
                        if ini_card < 3 then
                            state <= S_CARD;
                            
                        -- se alguém perdeu ou se ambos jogadores estão em stay
                        elsif pt_player > 21 or pt_dealer > 21 or (stay_player = '1' and stay_dealer = '1') then
                            state <= S_END;
                            
                        -- se o player não desistiu de pedir cartas
                        elsif stay_player = '0' then
                            state <= S_PLAYER;
                            
                        -- se o dealer não desistiu de pedir cartas
                        elsif stay_dealer = '0' then
                            state <= S_DEALER;
                            
                        -- caso não caia em nenhuma condição acima, a simulação deve reportar um erro
                        else
                            state <= S_ERROR;
                        end if;
                    
                    -- estado para indicar de quem foi a vitória
                    when S_END => 
                        state <= S_END;
                        
                    -- estado para aguardar uma decisão do player
                    when S_PLAYER =>
                        if hit = '1' and stay = '0' then
                            state <= S_CARD;
                        elsif stay = '1' and hit = '0' then
                            state <= S_DEALER;
                        else
                            state <= S_PLAYER;
                        end if;

                    -- estado para o dealer decidir jogada através do sinal stay_dealer
                    when S_DEALER =>
                        state <= S_CARD;

                    -- estado para reportar um erro na simulação
                    when others =>
                        assert FALSE report "ERRO estado não esperado" severity failure;
                end case;
            end if;  
        end if;

    end process;
    
    
    -- parte combinacional da máquina de estados finitos
    process(clk)
    begin
        if clk'event and clk = CLK_EDGE then
        
            ini_card     <= ini_card;
            stay_player  <= stay_player;
            stay_dealer  <= stay_dealer;
            pt_player    <= pt_player;
            pt_dealer    <= pt_dealer;
            counter_load <= counter_load;
            
            case state is
                
                -- estado inicial que inicializa os sinais
                when S_START => 
                    ini_card    <= 0;
                    stay_player <= '0';
                    stay_dealer <= '0';
                    pt_player   <= (others=>'0');
                    pt_dealer   <= (others=>'0');
                    counter_load <= (others=>'0');
                    
                when S_LOAD =>
                	if counter_load = CARDS_QNT then
                		counter_load <= (others=>'0');
            		else
                    	counter_load <= counter_load + 1;
                    end if;

                -- estado para verificação das cartas
                when S_CARD =>            
                    -- se ainda está entregando as cartas iniciais
                    if stay_player = '0' or stay_dealer = '0' then
                        
                        if ini_card = 0 or ini_card = 2 or (stay_player = '0' and ini_card /= 1 and ini_card /= 3) then
                            pt_player <= sum;
                        else
                            pt_dealer <= sum;
                        end if;
                        
                        if ini_card < 3 then
                            counter_load <= counter_load + 1;
                        end if;
                        
                        if ini_card < 4 then
                            ini_card <= ini_card + 1;
                        end if;
                        
                    end if;
                    
                -- estado para aguardar uma decisão do player
                when S_PLAYER =>            
                    if stay = '1' and hit = '0' then
                        stay_player <= '1';
                    elsif hit = '1' and stay = '0' then
                    	counter_load <= counter_load + 1;
                    end if;

                -- estado para o dealer decidir jogada através do sinal stay_dealer
                when S_DEALER =>            
                    if pt_dealer >= 17 then
                        stay_dealer <= '1';
                    else
                    	counter_load <= counter_load + 1;
                    end if;
                when others =>
            end case;
            
        end if;            

    end process;
    
end blackjack_top;

