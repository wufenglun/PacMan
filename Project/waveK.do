
vlib work

vlog -timescale 1ns/1ns keycontrol.v

vsim keycontrol


log {/*}

add wave {/*}

force {KEY[0]} 1 0, 0 1000, 1 2000
force {KEY[1]} 1 0, 0 2000, 1 3000
force {KEY[2]} 1 0, 0 3000, 1 4000
force {KEY[3]} 1 0, 0 4000, 1 5000

force {clk} 0 0, 1 10 -repeat 20

run 10000ns


