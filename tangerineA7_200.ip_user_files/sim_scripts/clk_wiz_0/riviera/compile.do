transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../ipstatic" -l xil_defaultlib \
"../../../../tangerineA7_200.gen/sources_1/ip/clk_wiz_0/clk_wiz_0_clk_wiz.v" \
"../../../../tangerineA7_200.gen/sources_1/ip/clk_wiz_0/clk_wiz_0.v" \


vlog -work xil_defaultlib \
"glbl.v"

