transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+keyboardFifo  -L xpm -L fifo_generator_v13_2_9 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.keyboardFifo xil_defaultlib.glbl

do {keyboardFifo.udo}

run 1000ns

endsim

quit -force
