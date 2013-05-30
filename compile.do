vlib work
vmap work work


## Sources
vcom  -explicit regnbit.vhd
vcom  -explicit regbank.vhd
vcom  -explicit bcd.vhd
vcom  -explicit blackjack_top.vhd
vcom  -explicit blackjack_tb.vhd
	
vsim -novopt -t ps  work.blackjack_tb

do wave.do
run 2 us
