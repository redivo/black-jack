source /soft64/source_gaph
module load modelsim

vlib black-jack # cria biblioteca chamada black-jack

# inserir chamadas. por exemplo:
vcom -93 -explicit ./bcd_decoder.vhd
vcom -93 -explicit ./bcd_decoder_tb.vhd

vsim black-jack.bcd_decoder_tb

add wave	sim:/*
	
run 500 ns
