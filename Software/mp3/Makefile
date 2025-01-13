#
#to compile and send to board invoke 'make send'
#adjust com port number in 'send' section if sending fails
#
#if compilation fails, update paths to used libs ( libgcc.a, libstdc++.a, etc )
#
#program send utility
#https://github.com/qubeck78/srecsend
#


PORT = auto
TARGET = mp3

CC = riscv-none-embed-gcc -march=rv32im -c -O2 -I. -I../gfxLib/ -IlibHelix/pub/ -IlibHelix/real/ -DHELIX_CONFIG_FIXEDPOINT
LD = riscv-none-embed-ld -T ram.ld
NM = riscv-none-embed-nm -n 
OBJCOPY = riscv-none-embed-objcopy
OBJDUMP = riscv-none-embed-objdump 
OBJSIZE = riscv-none-embed-size
SENDER = srecsend

LIBGCC =   "c:\Program Files\riscv-none-gcc\lib\gcc\riscv-none-embed\8.2.0\rv32im\ilp32\libgcc.a"
LIBSTDCC = "c:\Program Files\riscv-none-gcc\riscv-none-embed\lib\rv32im\ilp32\libstdc++.a"
LIBC     = "c:\Program Files\riscv-none-gcc\riscv-none-embed\lib\rv32im\ilp32\libc.a"
LIBM     = "c:\Program Files\riscv-none-gcc\riscv-none-embed\lib\rv32im\ilp32\libm.a" 
LIBNOSYS = "c:\Program Files\riscv-none-gcc\riscv-none-embed\lib\rv32im\ilp32\libnosys.a"

all: $(TARGET).bin $(TARGET).rec $(TARGET).disasm 

$(TARGET).disasm: $(TARGET).elf
	$(OBJDUMP) --disassemble -S $(TARGET).elf>$(TARGET).disasm

$(TARGET).rec: $(TARGET).elf $(TARGET).disasm 
	$(OBJCOPY) -O srec $(TARGET).elf $(TARGET).rec

$(TARGET).elf: main.o bsp.o startup.o osAlloc.o osFile.o gfBitmap.o gfDrawing.o gfFont.o diskio.o ccsbcs.o ff.o osUIEvents.o usbHID.o mp3dec.o mp3tabs.o buffers.o bitstream.o huffman.o hufftabs.o dequant.o scalfact.o dct32.o dqchan.o imdct.o polyphase.o stproc.o subband.o trigtabs.o gfAudio.o
	$(LD) startup.o main.o ../gfxLib/bsp.o ../gfxLib/diskio.o ../gfxLib/ccsbcs.o ../gfxLib/ff.o ../gfxLib/osAlloc.o ../gfxLib/osFile.o ../gfxLib/gfBitmap.o ../gfxLib/gfDrawing.o ../gfxLib/gfFont.o ../gfxLib/osUIEvents.o ../gfxLib/usbHID.o libHelix/mp3dec.o libHelix/mp3tabs.o libHelix/real/buffers.o libHelix/real/bitstream.o libHelix/real/huffman.o libHelix/real/hufftabs.o libHelix/real/dequant.o libHelix/real/scalfact.o libHelix/real/dct32.o libHelix/real/dqchan.o libHelix/real/imdct.o libHelix/real/polyphase.o libHelix/real/stproc.o libHelix/real/subband.o libHelix/real/trigtabs.o ../gfxLib/gfAudio.o $(LIBC) $(LIBNOSYS) $(LIBM) $(LIBGCC) -o $(TARGET).elf
	$(NM) $(TARGET).elf >$(TARGET).sym

$(TARGET).bin: $(TARGET).elf
	$(OBJCOPY) -O binary $(TARGET).elf $(TARGET).bin

$(TARGET)_L.mif: $(TARGET).bin
	bin2mif16 $(TARGET).bin $(TARGET)

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

gfGouraud.o: ../gfxLib/gfGouraud.c
	$(CC) -o ../gfxLib/gfGouraud.o ../gfxLib/gfGouraud.c

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

diskio.o: ../gfxLib/diskio.c
	$(CC) -o ../gfxLib/diskio.o ../gfxLib/diskio.c

ff.o: ../gfxLib/ff.c
	$(CC) -o ../gfxLib/ff.o ../gfxLib/ff.c

ccsbcs.o: ../gfxLib/ccsbcs.c
	$(CC) -o ../gfxLib/ccsbcs.o ../gfxLib/ccsbcs.c

osUIEvents.o: ../gfxLib/osUIEvents.c
	$(CC) -o ../gfxLib/osUIEvents.o ../gfxLib/osUIEvents.c

gfAudio.o: ../gfxLib/gfAudio.c
	$(CC) -o ../gfxLib/gfAudio.o ../gfxLib/gfAudio.c

usbHID.o: ../gfxLib/usbHID.c
	$(CC) -o ../gfxLib/usbHID.o ../gfxLib/usbHID.c

mp3dec.o: libHelix/mp3dec.c
	$(CC) -o libHelix/mp3dec.o libHelix/mp3dec.c 

mp3tabs.o: libHelix/mp3tabs.c
	$(CC) -o libHelix/mp3tabs.o libHelix/mp3tabs.c 

buffers.o: libHelix/real/buffers.c
	$(CC) -o libHelix/real/buffers.o libHelix/real/buffers.c 

bitstream.o: libHelix/real/bitstream.c
	$(CC) -o libHelix/real/bitstream.o libHelix/real/bitstream.c 

scalfact.o: libHelix/real/scalfact.c
	$(CC) -o libHelix/real/scalfact.o libHelix/real/scalfact.c 

huffman.o: libHelix/real/huffman.c
	$(CC) -o libHelix/real/huffman.o libHelix/real/huffman.c 

hufftabs.o: libHelix/real/hufftabs.c
	$(CC) -o libHelix/real/hufftabs.o libHelix/real/hufftabs.c 

dequant.o: libHelix/real/dequant.c
	$(CC) -o libHelix/real/dequant.o libHelix/real/dequant.c 

dqchan.o: libHelix/real/dqchan.c
	$(CC) -o libHelix/real/dqchan.o libHelix/real/dqchan.c 

dct32.o: libHelix/real/dct32.c
	$(CC) -o libHelix/real/dct32.o libHelix/real/dct32.c 

imdct.o: libHelix/real/dct32.c
	$(CC) -o libHelix/real/imdct.o libHelix/real/imdct.c 

polyphase.o: libHelix/real/polyphase.c
	$(CC) -o libHelix/real/polyphase.o libHelix/real/polyphase.c 

stproc.o: libHelix/real/stproc.c
	$(CC) -o libHelix/real/stproc.o libHelix/real/stproc.c 

subband.o: libHelix/real/subband.c
	$(CC) -o libHelix/real/subband.o libHelix/real/subband.c 

trigtabs.o: libHelix/real/trigtabs.c
	$(CC) -o libHelix/real/trigtabs.o libHelix/real/trigtabs.c 

clean:
	rm -f *.o *.rec *.disasm *.elf *.mif *.mi *.bin *.map
	rm -f ../gfxLib/*.o
	rm -f libHelix/*.o
	rm -f libHelix/real/*.o

send: $(TARGET).rec
	$(SENDER) $(TARGET).rec $(PORT) 460800
	$(OBJSIZE) $(TARGET).elf
	
run: $(TARGET).rec
	cp $(TARGET).rec "/c/Users/qubeck/Documents/Development/ProjektyGCCWindows/tangerineSOCEmulator/bin"
	cd "/c/Users/qubeck/Documents/Development/ProjektyGCCWindows/tangerineSOCEmulator/bin" && ./tangerine.exe $(TARGET).rec
