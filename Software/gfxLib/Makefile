
#

TARGET = libtangerine

CC = riscv-none-embed-gcc -march=rv32im -c -O2

LD = riscv-none-embed-ld -T ram.ld
NM = riscv-none-embed-nm -n 
AR = riscv-none-embed-ar

OBJCOPY = riscv-none-embed-objcopy
OBJDUMP = riscv-none-embed-objdump 
OBJSIZE = riscv-none-embed-size
LIBGCC =   "c:\Program Files\riscv-none-gcc\lib\gcc\riscv-none-embed\8.2.0\rv32im\ilp32\libgcc.a"
LIBSTDCC = "c:\Program Files\riscv-none-gcc\riscv-none-embed\lib\rv32im\ilp32\libstdc++.a"
LIBC     = "c:\Program Files\riscv-none-gcc\riscv-none-embed\lib\rv32im\ilp32\libc.a"
LIBM     = "c:\Program Files\riscv-none-gcc\riscv-none-embed\lib\rv32im\ilp32\libm.a" 
LIBNOSYS = "c:\Program Files\riscv-none-gcc\riscv-none-embed\lib\rv32im\ilp32\libnosys.a"
SENDER = srecsend

all: $(TARGET).a 

$(TARGET).disasm: $(TARGET).elf
	$(OBJDUMP) --disassemble -S $(TARGET).elf>$(TARGET).disasm


$(TARGET).a: bsp.o osAlloc.o osFile.o osSerial.o gfBitmap.o gfDrawing.o gfFont.o gfGouraud.o gfJPEG.o picojpeg.o diskio.o ccsbcs.o ff.o osUIEvents.o usbHID.o gfAudio.o
	$(AR) rcs $(TARGET).a bsp.o diskio.o ccsbcs.o ff.o osAlloc.o osFile.o osSerial.o gfBitmap.o gfDrawing.o gfFont.o gfGouraud.o gfJPEG.o picojpeg.o osUIEvents.o usbHID.o gfAudio.o

bsp.o: bsp.c
	$(CC) -o bsp.o bsp.c 

gfBitmap.o: gfBitmap.c
	$(CC) -o gfBitmap.o gfBitmap.c 
	
gfDrawing.o: gfDrawing.c
	$(CC) -o gfDrawing.o gfDrawing.c 

gfFont.o: gfFont.c
	$(CC) -o gfFont.o gfFont.c 
	
gfJPEG.o: gfJPEG.c
	$(CC) -o gfJPEG.o gfJPEG.c 

picojpeg.o: picojpeg.c
	$(CC) -o picojpeg.o picojpeg.c 

osAlloc.o: osAlloc.c
	$(CC) -o osAlloc.o osAlloc.c 

osFile.o: osFile.c
	$(CC) -o osFile.o osFile.c 

osSerial.o: osSerial.c
	$(CC) -o osSerial.o osSerial.c 

gfAudio.o: gfAudio.c
	$(CC) -o gfAudio.o gfAudio.c

gfGouraud.o: gfGouraud.c
	$(CC) -o gfGouraud.o gfGouraud.c 

diskio.o: diskio.c
	$(CC) -o diskio.o diskio.c 

ff.o: ff.c
	$(CC) -o ff.o ff.c  

ccsbcs.o: ccsbcs.c 
	$(CC) -o ccsbcs.o ccsbcs.c  

osUIEvents.o: osUIEvents.c
	$(CC) -o osUIEvents.o osUIEvents.c  

usbHID.o: usbHID.c
	$(CC) -o usbHID.o usbHID.c

clean:
	rm -f *.o *.a *.disasm *.elf *.mif *.mi *.bin *.map
