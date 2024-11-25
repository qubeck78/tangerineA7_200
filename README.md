# tangerineA7_200
RiscV based SOC for Qmtech Artix A7-200 board


Tangerine SOC is a system on chip design written in VHDL language. Such SOC is sutable to be synthesized and placed in a programmable chip - FPGA ( for now: AMD Artix A7-200 ).
In order to test the design You will need a Qmtech Artix A7-200 board with a base board ( schematics included in repo ).
But there is another way :P. [I've created an emulator](http://qubeck.cba.pl), that simulates almost all SOC features. It can even run directly in your browser :).

The main cpu of Tangerine is a RISC-V 32IM ( nekoRv ). It runs at 100MHz, providing quite plenty of computing power.
In addition to CPU, there is a bitmap acceleration coprocessor ( blitter 2D ) that offloads cpu from bitmap copying, scaling, drawing rectangles.
You can also enjoy 16-bit stereo audio thanks to I2S controller with DMA.
SD card acts as a storage.
2x USB for connecting a keyboard and mouse ( nand2mario USB Host ).

