
#
#to compile and send to board invoke 'make send'
#adjust com port number in 'send' section if sending fails
#
#if compilation fails, update paths to used libs ( libgcc.a, libstdc++.a, etc )
#
#program send utility ( pc )
#https://github.com/qubeck78/srecsend
#

#file send utility ( pc app for 'download' command )
#https://github.com/qubeck78/tangyLink
#

PORT = auto
TARGET = shell

CC = riscv-none-embed-gcc -march=rv32im -c -O3 -I"../gfxLib/"
LD = riscv-none-embed-ld -T ram.ld
NM = riscv-none-embed-nm -n 
OBJCOPY = riscv-none-embed-objcopy
OBJDUMP = riscv-none-embed-objdump 
OBJSIZE = riscv-none-embed-size
LIBGCC =   "c:\Program Files\riscv-none-gcc\lib\gcc\riscv-none-embed\8.2.0\rv32im\ilp32\libgcc.a"
LIBSTDCC = "c:\Program Files\riscv-none-gcc\riscv-none-embed\lib\rv32im\ilp32\libstdc++.a"
LIBC     = "c:\Program Files\riscv-none-gcc\riscv-none-embed\lib\rv32im\ilp32\libc.a"
LIBM     = "c:\Program Files\riscv-none-gcc\riscv-none-embed\lib\rv32im\ilp32\libm.a" 
LIBNOSYS = "c:\Program Files\riscv-none-gcc\riscv-none-embed\lib\rv32im\ilp32\libnosys.a"
SENDER = srecsend

all: $(TARGET).bin $(TARGET).rec $(TARGET).disasm 

$(TARGET).disasm: $(TARGET).elf
	$(OBJDUMP) --disassemble -S $(TARGET).elf>$(TARGET).disasm

$(TARGET).rec: $(TARGET).elf $(TARGET).disasm 
	$(OBJCOPY) -O srec $(TARGET).elf $(TARGET).rec

$(TARGET).elf: main.o objViewer.o shellUI.o hxcmod.o modPlayer.o fileOperations.o bsp.o startup.o osAlloc.o osFile.o osSerial.o gfBitmap.o gfDrawing.o gfFont.o gfGouraud.o gfJPEG.o picojpeg.o diskio.o ccsbcs.o ff.o osUIEvents.o usbHID.o gfAudio.o
	$(LD) startup.o main.o objViewer.o shellUI.o hxcmod.o modPlayer.o fileOperations.o ../gfxLib/bsp.o ../gfxLib/diskio.o ../gfxLib/ccsbcs.o ../gfxLib/ff.o ../gfxLib/osAlloc.o ../gfxLib/osFile.o ../gfxLib/osSerial.o ../gfxLib/gfBitmap.o ../gfxLib/gfDrawing.o ../gfxLib/gfFont.o ../gfxLib/gfGouraud.o ../gfxLib/gfJPEG.o ../gfxLib/picojpeg.o ../gfxLib/osUIEvents.o ../gfxLib/usbHID.o ../gfxLib/gfAudio.o $(LIBC) $(LIBNOSYS) $(LIBM) $(LIBGCC)  -o $(TARGET).elf
	$(NM) $(TARGET).elf >$(TARGET).sym


$(TARGET).bin: $(TARGET).elf
	$(OBJCOPY) -O binary $(TARGET).elf $(TARGET).bin

objViewer.o: objViewer.cpp
	$(CC) -o objViewer.o objViewer.cpp 

hxcmod.o: hxcmod.cpp
	$(CC) -o hxcmod.o hxcmod.cpp 

modPlayer.o: modPlayer.cpp
	$(CC) -o modPlayer.o modPlayer.cpp 

fileOperations.o: fileOperations.cpp
	$(CC) -o fileOperations.o fileOperations.cpp 

shellUI.o: shellUI.cpp	
	$(CC) -o shellUI.o shellUI.cpp 

main.o: main.cpp
	$(CC) -o main.o main.cpp 

bsp.o: ../gfxLib/bsp.c
	$(CC) -o ../gfxLib/bsp.o ../gfxLib/bsp.c 

startup.o: startup.S
	$(CC) -o startup.o startup.S

gfBitmap.o: ../gfxLib/gfBitmap.c
	$(CC) -o ../gfxLib/gfBitmap.o ../gfxLib/gfBitmap.c 
	
gfDrawing.o: ../gfxLib/gfDrawing.c
	$(CC) -o ../gfxLib/gfDrawing.o ../gfxLib/gfDrawing.c 

gfFont.o: ../gfxLib/gfFont.c
	$(CC) -o ../gfxLib/gfFont.o ../gfxLib/gfFont.c 
	
gfJPEG.o: ../gfxLib/gfJPEG.c
	$(CC) -o ../gfxLib/gfJPEG.o ../gfxLib/gfJPEG.c 

picojpeg.o: ../gfxLib/picojpeg.c
	$(CC) -o ../gfxLib/picojpeg.o ../gfxLib/picojpeg.c 

osAlloc.o: ../gfxLib/osAlloc.c
	$(CC) -o ../gfxLib/osAlloc.o ../gfxLib/osAlloc.c 

osFile.o: ../gfxLib/osFile.c
	$(CC) -o ../gfxLib/osFile.o ../gfxLib/osFile.c 

osSerial.o: ../gfxLib/osSerial.c
	$(CC) -o ../gfxLib/osSerial.o ../gfxLib/osSerial.c 

gfAudio.o: ../gfxLib/gfAudio.c
	$(CC) -o ../gfxLib/gfAudio.o ../gfxLib/gfAudio.c

gfGouraud.o: ../gfxLib/gfGouraud.c
	$(CC) -o ../gfxLib/gfGouraud.o ../gfxLib/gfGouraud.c 

diskio.o: ../gfxLib/diskio.c
	$(CC) -o ../gfxLib/diskio.o ../gfxLib/diskio.c 

ff.o: ../gfxLib/ff.c
	$(CC) -o ../gfxLib/ff.o ../gfxLib/ff.c  

ccsbcs.o: ../gfxLib/ccsbcs.c 
	$(CC) -o ../gfxLib/ccsbcs.o ../gfxLib/ccsbcs.c  

osUIEvents.o: ../gfxLib/osUIEvents.c
	$(CC) -o ../gfxLib/osUIEvents.o ../gfxLib/osUIEvents.c  

usbHID.o: ../gfxLib/usbHID.c
	$(CC) -o ../gfxLib/usbHID.o ../gfxLib/usbHID.c


clean:
	rm -f *.o *.rec *.disasm *.elf *.mif *.mi *.bin *.map
	rm -f ../gfxLib/*.o

# uart baudrate set to 460800, if it fails, change it here and in uart.vhd SOC file
send: $(TARGET).rec
	$(SENDER) $(TARGET).rec $(PORT) 460800
	$(OBJSIZE) $(TARGET).elf

run: $(TARGET).rec
	cp $(TARGET).rec "/c/Users/qubeck/Documents/Development/ProjektyGCCWindows/tangerineSOCEmulator/bin"
	cd "/c/Users/qubeck/Documents/Development/ProjektyGCCWindows/tangerineSOCEmulator/bin" && ./tangerine.exe $(TARGET).rec
