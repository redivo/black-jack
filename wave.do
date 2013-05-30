onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /blackjack_tb/blackjack/reset
add wave -noupdate /blackjack_tb/blackjack/clk
add wave -noupdate -radix unsigned /blackjack_tb/blackjack/card
add wave -noupdate -radix unsigned /blackjack_tb/blackjack/counter_load
add wave -noupdate /blackjack_tb/blackjack/ini_card
add wave -noupdate /blackjack_tb/blackjack/state
add wave -noupdate /blackjack_tb/blackjack/stay_dealer
add wave -noupdate /blackjack_tb/blackjack/stay_player
add wave -noupdate -radix unsigned /blackjack_tb/blackjack/cards
add wave -noupdate -radix unsigned /blackjack_tb/blackjack/value_card
add wave -noupdate -radix unsigned -childformat {{/blackjack_tb/blackjack/temp(4) -radix unsigned} {/blackjack_tb/blackjack/temp(3) -radix unsigned} {/blackjack_tb/blackjack/temp(2) -radix unsigned} {/blackjack_tb/blackjack/temp(1) -radix unsigned} {/blackjack_tb/blackjack/temp(0) -radix unsigned}} -subitemconfig {/blackjack_tb/blackjack/temp(4) {-height 17 -radix unsigned} /blackjack_tb/blackjack/temp(3) {-height 17 -radix unsigned} /blackjack_tb/blackjack/temp(2) {-height 17 -radix unsigned} /blackjack_tb/blackjack/temp(1) {-height 17 -radix unsigned} /blackjack_tb/blackjack/temp(0) {-height 17 -radix unsigned}} /blackjack_tb/blackjack/temp
add wave -noupdate -radix unsigned /blackjack_tb/blackjack/sum
add wave -noupdate -radix unsigned /blackjack_tb/blackjack/pt_player
add wave -noupdate -radix unsigned /blackjack_tb/blackjack/pt_dealer
add wave -noupdate -radix unsigned -childformat {{/blackjack_tb/blackjack/to_display(4) -radix unsigned} {/blackjack_tb/blackjack/to_display(3) -radix unsigned} {/blackjack_tb/blackjack/to_display(2) -radix unsigned} {/blackjack_tb/blackjack/to_display(1) -radix unsigned} {/blackjack_tb/blackjack/to_display(0) -radix unsigned}} -subitemconfig {/blackjack_tb/blackjack/to_display(4) {-height 17 -radix unsigned} /blackjack_tb/blackjack/to_display(3) {-height 17 -radix unsigned} /blackjack_tb/blackjack/to_display(2) {-height 17 -radix unsigned} /blackjack_tb/blackjack/to_display(1) {-height 17 -radix unsigned} /blackjack_tb/blackjack/to_display(0) {-height 17 -radix unsigned}} /blackjack_tb/blackjack/to_display
add wave -noupdate -divider BCD
add wave -noupdate /blackjack_tb/blackjack/bcd/clk
add wave -noupdate /blackjack_tb/blackjack/bcd/reset
add wave -noupdate -radix unsigned /blackjack_tb/blackjack/bcd/number
add wave -noupdate -radix unsigned /blackjack_tb/blackjack/bcd/num_int
add wave -noupdate -radix unsigned /blackjack_tb/blackjack/bcd/uni
add wave -noupdate -radix unsigned /blackjack_tb/blackjack/bcd/dec
add wave -noupdate -radix decimal /blackjack_tb/blackjack/bcd/sub10
add wave -noupdate -radix decimal /blackjack_tb/blackjack/bcd/sub20
add wave -noupdate -radix decimal /blackjack_tb/blackjack/bcd/sub30
add wave -noupdate /blackjack_tb/blackjack/bcd/bcd_out
add wave -noupdate -divider <NULL>
add wave -noupdate /blackjack_tb/blackjack/hit
add wave -noupdate /blackjack_tb/blackjack/stay
add wave -noupdate /blackjack_tb/blackjack/show
add wave -noupdate /blackjack_tb/blackjack/win
add wave -noupdate /blackjack_tb/blackjack/lose
add wave -noupdate /blackjack_tb/blackjack/tie
add wave -noupdate /blackjack_tb/blackjack/en0
add wave -noupdate /blackjack_tb/blackjack/en1
add wave -noupdate /blackjack_tb/blackjack/display
add wave -noupdate /blackjack_tb/blackjack/write_card
add wave -noupdate -radix unsigned -childformat {{/blackjack_tb/blackjack/card_bank/reg(0) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(1) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(2) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(3) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(4) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(5) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(6) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(7) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(8) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(9) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(10) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(11) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(12) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(13) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(14) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(15) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(16) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(17) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(18) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(19) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(20) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(21) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(22) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(23) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(24) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(25) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(26) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(27) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(28) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(29) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(30) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(31) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(32) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(33) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(34) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(35) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(36) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(37) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(38) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(39) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(40) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(41) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(42) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(43) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(44) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(45) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(46) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(47) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(48) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(49) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(50) -radix unsigned} {/blackjack_tb/blackjack/card_bank/reg(51) -radix unsigned}} -expand -subitemconfig {/blackjack_tb/blackjack/card_bank/reg(0) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(1) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(2) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(3) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(4) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(5) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(6) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(7) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(8) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(9) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(10) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(11) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(12) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(13) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(14) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(15) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(16) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(17) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(18) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(19) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(20) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(21) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(22) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(23) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(24) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(25) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(26) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(27) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(28) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(29) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(30) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(31) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(32) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(33) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(34) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(35) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(36) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(37) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(38) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(39) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(40) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(41) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(42) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(43) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(44) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(45) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(46) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(47) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(48) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(49) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(50) {-height 17 -radix unsigned} /blackjack_tb/blackjack/card_bank/reg(51) {-height 17 -radix unsigned}} /blackjack_tb/blackjack/card_bank/reg
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1269548 ps} 0}
configure wave -namecolwidth 335
configure wave -valuecolwidth 69
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {932006 ps} {1538103 ps}
