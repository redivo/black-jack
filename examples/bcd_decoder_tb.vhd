--------------------------------------------------
-- File:    bcd_decoder_tb.vhd
-- Author:  Prof. M.Sc. Marlon Moraes
-- E-mail:  marlon.moraes@pucrs.br
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
entity bcd_decoder_tb is

	generic
	(
		CLK_EDGE    : std_logic := '1'
	);
	port
	(
		error		: out std_logic_vector(7 downto 0)
	);
	

end bcd_decoder_tb;


--------------------------
-- architecture
--------------------------
architecture bcd_decoder_tb of bcd_decoder_tb is

--------------------------
-- types
--------------------------

--------------------------
-- constants
--------------------------
	constant	PERIOD	: time := 20 ns;										-- definição do período.

--------------------------
-- signals
--------------------------
	
	-- decoder signals.
	signal 	num_in      : std_logic_vector(3 downto 0) := (others => '0');		-- entrada de dados.
	signal 	bcd_out     : std_logic_vector(7 downto 0) := (others => '0');		-- Ya Yb Yc Yd Ye Yf Yg Ypto.

	-- test signals.
	signal test_vector	: std_logic_vector(7 downto 0) := (others => '0');		-- dados de saída do modelo.
	signal error_int	: std_logic_vector(7 downto 0) := (others => '0');		-- sinal interno de erro.

	-- control signals.
	signal clk			: std_logic := '0';										-- sinal de clock do TB.

begin

--------------------------
-- instances
--------------------------
	bcd_decoder: entity work.bcd_decoder
	port map
	(
    	num_in      => num_in,		-- entrada de dados.
		bcd_out     => bcd_out		-- Ya Yb Yc Yd Ye Yf Yg Ypto.
    );

     
--------------------------
-- combinational
--------------------------

	-- modelo do decodificador.
	test_vector(7)	<=	((not num_in(3)) and (not num_in(2)) and (not num_in(1)) and num_in(0)) or
						((not num_in(3)) and num_in(2) and (not num_in(1)) and (not num_in(0))) or
						(num_in(3) and num_in(2) and (not num_in(1)) and num_in(0)) or 
						(num_in(3) and (not num_in(2)) and num_in(1) and num_in(0));

	test_vector(6)	<=	((not num_in(3)) and num_in(2) and (not num_in(1)) and num_in(0)) or
						(num_in(3) and num_in(2) and (not num_in(1)) and (not num_in(0))) or
						(num_in(3) and num_in(1) and num_in(0)) or
						(num_in(2) and num_in(1) and (not num_in(0)));
	
	test_vector(5)	<=	((num_in(3)) and (num_in(2)) and (not num_in(1)) and (not num_in(0))) or
						((not num_in(3)) and (not num_in(2)) and (num_in(1)) and (not num_in(0))) or
						((num_in(3)) and (num_in(2)) and (num_in(1)));

	test_vector(4)	<=	((not num_in(3)) and (num_in(2)) and (not num_in(1)) and (not num_in(0))) or
						((not num_in(3)) and (not num_in(2)) and (not num_in(1)) and (num_in(0))) or
						((num_in(2)) and (num_in(1)) and (num_in(0))) or
						((num_in(3)) and (not num_in(2)) and (num_in(1)) and (not num_in(0)));

	test_vector(3)	<=	((not num_in(3)) and (num_in(2)) and (not num_in(1))) or
						((not num_in(2)) and (not num_in(1)) and (num_in(0))) or
						((not num_in(3)) and (num_in(1)) and (num_in(0)));

	test_vector(2)	<=	((num_in(3)) and (num_in(2)) and (not num_in(1)) and (num_in(0))) or
						((not num_in(3)) and (not num_in(2)) and (num_in(0))) or
						((not num_in(3)) and (not num_in(2)) and (num_in(1))) or
						((not num_in(3)) and (num_in(1)) and (num_in(0)));

	test_vector(1)	<=	((not num_in(3)) and (not num_in(2)) and (not num_in(1))) or
						((num_in(3)) and (num_in(2)) and (not num_in(1)) and (not num_in(0))) or
						((not num_in(3)) and (num_in(2)) and (num_in(1)) and (num_in(0)));
	
	test_vector(0)	<= '1';


	-- comparação entre as saídas do modelo e do DUT.
	error_int(7) <= '1' when test_vector(7) /= bcd_out(7) else '0';
	error_int(6) <= '1' when test_vector(6) /= bcd_out(6) else '0';
	error_int(5) <= '1' when test_vector(5) /= bcd_out(5) else '0';	
	error_int(4) <= '1' when test_vector(4) /= bcd_out(4) else '0';
	error_int(3) <= '1' when test_vector(3) /= bcd_out(3) else '0';
	error_int(2) <= '1' when test_vector(2) /= bcd_out(2) else '0';
	error_int(1) <= '1' when test_vector(1) /= bcd_out(1) else '0';
	error_int(0) <= '1' when test_vector(0) /= bcd_out(0) else '0';
	
	-- geração do sinal de clock.
	clk	<= not clk after (PERIOD / 2);

	
--------------------------
-- processes
--------------------------

	-- geração dos dados de entrada.
	input_gen: process
	begin
		num_in	<= num_in + 1;	 
		wait for PERIOD;
	end process;
	
	
	-- registro dos sinais de saída.
	ff_error: process(clk)
	begin
		if clk'event and clk = CLK_EDGE then
			error <= error_int;
		end if;
	end process;

	
end bcd_decoder_tb;


