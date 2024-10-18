#
#to compile and send to board invoke 'make send'
#adjust com port number in 'send' section if sending fails
#
#if compilation fails, update paths to used libs ( libgcc.a, libstdc++.a, etc )
#
#program send utility
#https://github.com/qubeck78/srecsend
#

PORT = com7
TARGET = doom

CC = riscv-none-embed-gcc -march=rv32im -c -O2 -I./ -I./doom/src
LD = riscv-none-embed-ld -T ram.ld
NM = riscv-none-embed-nm -n 
OBJCOPY = riscv-none-embed-objcopy
OBJDUMP = riscv-none-embed-objdump 
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

$(TARGET).elf: main.o bsp.o startup.o osAlloc.o osFile.o gfBitmap.o gfDrawing.o gfFont.o diskio.o ccsbcs.o ff.o osUIEvents.o usbHID.o gfLibInterface.o am_map.o d_items.o d_net.o doomdef.o doomstat.o dstrings.o f_finale.o f_wipe.o g_game.o hu_lib.o hu_stuff.o info.o m_argv.o m_bbox.o m_cheat.o m_fixed.o m_menu.o m_misc.o m_random.o m_swap.o p_ceilng.o p_doors.o p_enemy.o p_floor.o p_inter.o p_lights.o p_map.o p_maputl.o p_mobj.o p_plats.o p_pspr.o p_saveg.o p_setup.o p_sight.o p_spec.o p_switch.o p_telept.o p_tick.o p_user.o r_bsp.o r_data.o r_draw.o r_main.o r_plane.o r_segs.o r_sky.o r_things.o sounds.o s_sound.o st_lib.o st_stuff.o tables.o v_video.o wi_stuff.o  w_wad.o z_zone.o i_net.o i_sound.o i_system.o i_video.o d_main.o
	$(LD) startup.o main.o ../gfxLib/bsp.o ../gfxLib/diskio.o ../gfxLib/ccsbcs.o ../gfxLib/ff.o ../gfxLib/osAlloc.o ../gfxLib/osFile.o ../gfxLib/gfBitmap.o ../gfxLib/gfDrawing.o ../gfxLib/gfFont.o ../gfxLib/osUIEvents.o ../gfxLib/usbHID.o gfLibInterface.o doom/src/am_map.o doom/src/d_items.o doom/src/d_net.o doom/src/doomdef.o doom/src/doomstat.o doom/src/dstrings.o doom/src/f_finale.o doom/src/f_wipe.o doom/src/g_game.o doom/src/hu_lib.o doom/src/hu_stuff.o doom/src/info.o doom/src/m_argv.o doom/src/m_bbox.o doom/src/m_cheat.o doom/src/m_fixed.o doom/src/m_menu.o m_misc.o doom/src/m_random.o doom/src/m_swap.o doom/src/p_ceilng.o doom/src/p_doors.o doom/src/p_enemy.o doom/src/p_floor.o doom/src/p_inter.o doom/src/p_lights.o doom/src/p_map.o doom/src/p_maputl.o doom/src/p_mobj.o doom/src/p_plats.o doom/src/p_pspr.o doom/src/p_saveg.o doom/src/p_setup.o doom/src/p_sight.o doom/src/p_spec.o doom/src/p_switch.o doom/src/p_telept.o doom/src/p_tick.o doom/src/p_user.o doom/src/r_bsp.o doom/src/r_data.o doom/src/r_draw.o doom/src/r_main.o doom/src/r_plane.o doom/src/r_segs.o doom/src/r_sky.o doom/src/r_things.o doom/src/sounds.o s_sound.o doom/src/st_lib.o doom/src/st_stuff.o doom/src/tables.o doom/src/v_video.o doom/src/wi_stuff.o  w_wad.o doom/src/z_zone.o i_net.o i_sound.o i_system.o i_video.o d_main.o $(LIBC) $(LIBNOSYS) $(LIBM) $(LIBGCC)  -o $(TARGET).elf
	$(NM) $(TARGET).elf >$(TARGET).sym


$(TARGET).bin: $(TARGET).elf
	$(OBJCOPY) -O binary $(TARGET).elf $(TARGET).bin

$(TARGET)_L.mif: $(TARGET).bin
	bin2mif16 $(TARGET).bin $(TARGET)

main.o: main.cpp
	$(CC) -o main.o main.cpp 

bsp.o: ../gfxLib/bsp.cpp
	$(CC) -o ../gfxLib/bsp.o ../gfxLib/bsp.cpp 

startup.o: startup.S
	$(CC) -o startup.o startup.S

gfBitmap.o: ../gfxLib/gfBitmap.cpp
	$(CC) -o ../gfxLib/gfBitmap.o ../gfxLib/gfBitmap.cpp 
	
gfDrawing.o: ../gfxLib/gfDrawing.cpp
	$(CC) -o ../gfxLib/gfDrawing.o ../gfxLib/gfDrawing.cpp 

gfFont.o: ../gfxLib/gfFont.cpp
	$(CC) -o ../gfxLib/gfFont.o ../gfxLib/gfFont.cpp 
	
osAlloc.o: ../gfxLib/osAlloc.cpp
	$(CC) -o ../gfxLib/osAlloc.o ../gfxLib/osAlloc.cpp 

osFile.o: ../gfxLib/osFile.cpp
	$(CC) -o ../gfxLib/osFile.o ../gfxLib/osFile.cpp 

diskio.o: ../gfxLib/diskio.cpp
	$(CC) -o ../gfxLib/diskio.o ../gfxLib/diskio.cpp 

ff.o: ../gfxLib/ff.cpp
	$(CC) -o ../gfxLib/ff.o ../gfxLib/ff.cpp  

ccsbcs.o: ../gfxLib/ccsbcs.cpp 
	$(CC) -o ../gfxLib/ccsbcs.o ../gfxLib/ccsbcs.cpp  

osUIEvents.o: ../gfxLib/osUIEvents.cpp
	$(CC) -o ../gfxLib/osUIEvents.o ../gfxLib/osUIEvents.cpp  

usbHID.o: ../gfxLib/usbHID.cpp
	$(CC) -o ../gfxLib/usbHID.o ../gfxLib/usbHID.cpp 

gfLibInterface.o: gfLibInterface.cpp
	$(CC) -o gfLibInterface.o gfLibInterface.cpp 

am_map.o: doom/src/am_map.c
	$(CC) -o doom/src/am_map.o doom/src/am_map.c 

d_items.o: doom/src/d_items.c
	$(CC) -o doom/src/d_items.o doom/src/d_items.c 

d_net.o: doom/src/d_net.c
	$(CC) -o doom/src/d_net.o doom/src/d_net.c 

doomdef.o: doom/src/doomdef.c
	$(CC) -o doom/src/doomdef.o doom/src/doomdef.c 

doomstat.o: doom/src/doomstat.c
	$(CC) -o doom/src/doomstat.o doom/src/doomstat.c 

dstrings.o: doom/src/dstrings.c
	$(CC) -o doom/src/dstrings.o doom/src/dstrings.c 

f_finale.o: doom/src/f_finale.c
	$(CC) -o doom/src/f_finale.o doom/src/f_finale.c 

f_wipe.o: doom/src/f_wipe.c
	$(CC) -o doom/src/f_wipe.o doom/src/f_wipe.c 

g_game.o: doom/src/g_game.c
	$(CC) -o doom/src/g_game.o doom/src/g_game.c 

hu_lib.o: doom/src/hu_lib.c
	$(CC) -o doom/src/hu_lib.o doom/src/hu_lib.c 

hu_stuff.o: doom/src/hu_stuff.c
	$(CC) -o doom/src/hu_stuff.o doom/src/hu_stuff.c 

info.o: doom/src/info.c
	$(CC) -o doom/src/info.o doom/src/info.c 

m_argv.o: doom/src/m_argv.c
	$(CC) -o doom/src/m_argv.o doom/src/m_argv.c 

m_bbox.o: doom/src/m_bbox.c
	$(CC) -o doom/src/m_bbox.o doom/src/m_bbox.c 

m_cheat.o: doom/src/m_cheat.c
	$(CC) -o doom/src/m_cheat.o doom/src/m_cheat.c 

m_fixed.o: doom/src/m_fixed.c
	$(CC) -o doom/src/m_fixed.o doom/src/m_fixed.c 

m_menu.o: doom/src/m_menu.c
	$(CC) -o doom/src/m_menu.o doom/src/m_menu.c 

m_misc.o: m_misc.c
	$(CC) -o m_misc.o m_misc.c 

m_random.o: doom/src/m_random.c
	$(CC) -o doom/src/m_random.o doom/src/m_random.c 

m_swap.o: doom/src/m_swap.c
	$(CC) -o doom/src/m_swap.o doom/src/m_swap.c 

p_ceilng.o: doom/src/p_ceilng.c
	$(CC) -o doom/src/p_ceilng.o doom/src/p_ceilng.c 

p_doors.o: doom/src/p_doors.c
	$(CC) -o doom/src/p_doors.o doom/src/p_doors.c 

p_enemy.o: doom/src/p_enemy.c
	$(CC) -o doom/src/p_enemy.o doom/src/p_enemy.c 

p_floor.o: doom/src/p_floor.c
	$(CC) -o doom/src/p_floor.o doom/src/p_floor.c 

p_inter.o: doom/src/p_inter.c
	$(CC) -o doom/src/p_inter.o doom/src/p_inter.c 

p_lights.o: doom/src/p_lights.c
	$(CC) -o doom/src/p_lights.o doom/src/p_lights.c 

p_map.o: doom/src/p_map.c
	$(CC) -o doom/src/p_map.o doom/src/p_map.c 

p_maputl.o: doom/src/p_maputl.c
	$(CC) -o doom/src/p_maputl.o doom/src/p_maputl.c 

p_mobj.o: doom/src/p_mobj.c
	$(CC) -o doom/src/p_mobj.o doom/src/p_mobj.c 

p_plats.o: doom/src/p_plats.c
	$(CC) -o doom/src/p_plats.o doom/src/p_plats.c 

p_pspr.o: doom/src/p_pspr.c
	$(CC) -o doom/src/p_pspr.o doom/src/p_pspr.c 

p_saveg.o: doom/src/p_saveg.c
	$(CC) -o doom/src/p_saveg.o doom/src/p_saveg.c 

p_setup.o: doom/src/p_setup.c
	$(CC) -o doom/src/p_setup.o doom/src/p_setup.c 

p_sight.o: doom/src/p_sight.c
	$(CC) -o doom/src/p_sight.o doom/src/p_sight.c 

p_spec.o: doom/src/p_spec.c
	$(CC) -o doom/src/p_spec.o doom/src/p_spec.c 

p_switch.o: doom/src/p_switch.c
	$(CC) -o doom/src/p_switch.o doom/src/p_switch.c 

p_telept.o: doom/src/p_telept.c
	$(CC) -o doom/src/p_telept.o doom/src/p_telept.c 

p_tick.o: doom/src/p_tick.c
	$(CC) -o doom/src/p_tick.o doom/src/p_tick.c 

p_user.o: doom/src/p_user.c
	$(CC) -o doom/src/p_user.o doom/src/p_user.c 

r_bsp.o: doom/src/r_bsp.c
	$(CC) -o doom/src/r_bsp.o doom/src/r_bsp.c 

r_data.o: doom/src/r_data.c
	$(CC) -o doom/src/r_data.o doom/src/r_data.c 

r_draw.o: doom/src/r_draw.c
	$(CC) -o doom/src/r_draw.o doom/src/r_draw.c 

r_main.o: doom/src/r_main.c
	$(CC) -o doom/src/r_main.o doom/src/r_main.c 

r_plane.o: doom/src/r_plane.c
	$(CC) -o doom/src/r_plane.o doom/src/r_plane.c 

r_segs.o: doom/src/r_segs.c
	$(CC) -o doom/src/r_segs.o doom/src/r_segs.c 

r_sky.o: doom/src/r_sky.c
	$(CC) -o doom/src/r_sky.o doom/src/r_sky.c 

r_things.o: doom/src/r_things.c
	$(CC) -o doom/src/r_things.o doom/src/r_things.c 

sounds.o: doom/src/sounds.c
	$(CC) -o doom/src/sounds.o doom/src/sounds.c 

st_lib.o: doom/src/st_lib.c
	$(CC) -o doom/src/st_lib.o doom/src/st_lib.c 

st_stuff.o: doom/src/st_stuff.c
	$(CC) -o doom/src/st_stuff.o doom/src/st_stuff.c 

tables.o: doom/src/tables.c
	$(CC) -o doom/src/tables.o doom/src/tables.c 

v_video.o: doom/src/v_video.c
	$(CC) -o doom/src/v_video.o doom/src/v_video.c 

wi_stuff.o: doom/src/wi_stuff.c
	$(CC) -o doom/src/wi_stuff.o doom/src/wi_stuff.c 

z_zone.o: doom/src/z_zone.c
	$(CC) -o doom/src/z_zone.o doom/src/z_zone.c 

w_wad.o: w_wad.c
	$(CC) -o w_wad.o w_wad.c 

i_net.o: i_net.c
	$(CC) -o i_net.o i_net.c 

s_sound.o: s_sound.c
	$(CC) -o s_sound.o s_sound.c 

i_sound.o: i_sound.c
	$(CC) -o i_sound.o i_sound.c 

i_system.o: i_system.c
	$(CC) -o i_system.o i_system.c 

i_video.o: i_video.c
	$(CC) -o i_video.o i_video.c 

d_main.o: d_main.c
	$(CC) -o d_main.o d_main.c 

clean:
	rm -f *.o *.rec *.disasm *.elf *.mif *.mi *.bin *.map
	rm -f ../gfxLib/*.o
	rm -f src/doom/*.o

send: $(TARGET).rec
	srecsend $(TARGET).rec $(PORT) 460800
	riscv-none-embed-size $(TARGET).elf
	
run: $(TARGET).rec
	cp $(TARGET).rec "/f/msys64/home/qubec/ProjektyGCCWindows/tangerineSOCEmulator/bin"
	cd "/f/msys64/home/qubec/ProjektyGCCWindows/tangerineSOCEmulator/bin" && ./tangerine.exe $(TARGET).rec

