#ifndef _GFTYPES_H
#define _GFTYPES_H

//Version

#define _GFXLIB_VERSION 20240917


//Platform

//#define _GFXLIB_SDL
//#define _GFXLIB_STM32_FATFS
//#define _GFXLIB_ESP32_FFAT
#define _GFXLIB_RISCV_FATFS

//Features

//#define _GFXLIB_BIG_ENDIAN

#define _GFXLIB_HW_BLITTER_2D
//#define _GFXLIB_HW_BLITTER_3D
//#define _GFXLIB_FPALU
#define _GFXLIB_USB_HOST


typedef unsigned char	uchar;
typedef unsigned char	ubyte;
typedef unsigned short	ushort;
typedef unsigned long	ulong;

#ifndef NULL
#define NULL 0
#endif


#define gfAbs(x) ((x)>0?(x):-(x))



#endif
