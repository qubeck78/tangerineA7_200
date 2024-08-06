transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xpm
vlib riviera/fifo_generator_v13_2_9
vlib riviera/xil_defaultlib

vmap xpm riviera/xpm
vmap fifo_generator_v13_2_9 riviera/fifo_generator_v13_2_9
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xpm  -incr -l xpm -l fifo_generator_v13_2_9 -l xil_defaultlib \
"F:/Xilinx/Vivado/2023.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"F:/Xilinx/Vivado/2023.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  -incr \
"F:/Xilinx/Vivado/2023.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work fifo_generator_v13_2_9  -incr -v2k5 -l xpm -l fifo_generator_v13_2_9 -l xil_defaultlib \
"../../../ipstatic/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_9 -93  -incr \
"../../../ipstatic/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_9  -incr -v2k5 -l xpm -l fifo_generator_v13_2_9 -l xil_defaultlib \
"../../../ipstatic/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work xil_defaultlib  -incr -v2k5 -l xpm -l fifo_generator_v13_2_9 -l xil_defaultlib \
"../../../../tangerineA7_200.gen/sources_1/ip/uartFiFo/sim/uartFiFo.v" \

vlog -work xil_defaultlib \
"glbl.v"

