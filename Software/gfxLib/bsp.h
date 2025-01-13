#ifndef _BSP_H
#define _BSP_H

#ifdef __cplusplus
extern "C" 
{
#endif


//Memory regions

//7.5MB
//#define _SYSTEM_MEMORY_SIZE 	( 7864320 - 16)

//63.5MB
#define _SYSTEM_MEMORY_SIZE     ( 66584576 - 16)

#define _SYSTEM_MEMORY_BASE		0x20000000


#define _VIDEOMODE_TEXT40_ONLY                  0x00
#define _VIDEOMODE_TEXT80_ONLY                  0x04
#define _VIDEOMODE_TEXT80_60_ONLY               0x0c

#define _VIDEOMODE_320_TEXT40_OVER_GFX          0x02
#define _VIDEOMODE_320_TEXT80_OVER_GFX          0x06
#define _VIDEOMODE_320_TEXT80_60_OVER_GFX       0x0e

#define _VIDEOMODE_640_TEXT40_OVER_GFX          0x12
#define _VIDEOMODE_640_TEXT80_OVER_GFX          0x16
#define _VIDEOMODE_640_TEXT80_60_OVER_GFX       0x1e

#define _VIDEOMODE_320_8BPP_TEXT40_OVER_GFX     0x22
#define _VIDEOMODE_320_8BPP_TEXT80_OVER_GFX     0x26
#define _VIDEOMODE_320_8BPP_TEXT80_60_OVER_GFX  0x2e

#include "gfTypes.h"


//IRQ macros

//set mie bit in mstatus csr
#define __enable_irq() asm volatile( "csrrsi zero, 0x300, 0x08" )

//clear mie bit in mstatus csr
#define __disable_irq() asm volatile( "csrrci zero, 0x300, 0x08" )

#define __break() asm volatile( "ebreak" )


//x"80000000";   -- root id
//x"80000001";   -- serial id
//x"80000002";   -- spi id
//x"80000003";   -- sdram DMA id
//x"80000004";   -- usb hid host id
//x"80000005";   -- blitter id
//x"80000006";   -- sprite gen id
//x"80000007";   -- i2s id
//x"80000008";   -- gfx pixel gen id
//x"80000009";   -- fpalu id

typedef struct _BSP_T
{
    volatile uint32_t id;
    volatile uint32_t version;

    //txt/gfx/mux mode
    volatile uint32_t   videoMuxMode;
    
    //b0 - vsync (positive)
    volatile uint32_t   videoVSync;
    
    volatile uint32_t   unused0;
        
    //wr b7, b6, b5, b4 - LEDS, b0 - spi0SSel
    volatile uint32_t   gpoPort;
    
    //wr b0 - tickTimerReset
    volatile uint32_t   tickTimerConfig;
    
    //rd - tickTimerValue
    volatile uint32_t   tickTimerValue;
    
    //counts frames (up), write resets timer
    volatile uint32_t   frameTimer;
    
    volatile uint32_t   unused1;

    //counts up, clocked by cpu clock
    volatile uint64_t   mtime;

    //mtime compare, generates interrupt on match
    volatile uint64_t   mtimeCmp;

}BSP_T;

extern BSP_T *bsp;


typedef struct __GFXPIXELGEN_REGISTERS_T
{
    volatile uint32_t id;
    volatile uint32_t version;
    
}_GFXPIXELGEN_REGISTERS_T;

extern _GFXPIXELGEN_REGISTERS_T *gfxPixelGen;


typedef struct __SPRITEGEN_REGISTERS_T
{
    volatile uint32_t id;
    volatile uint32_t version;
    
    volatile uint32_t spriteX;
    volatile uint32_t spriteY;

}_SPRITEGEN_REGISTERS_T;

extern _SPRITEGEN_REGISTERS_T *spriteGen;

typedef struct __BLITTER_REGISTERS_T
{
    volatile uint32_t id;
    volatile uint32_t version;

    volatile uint32_t command;
    volatile uint32_t input0;
    volatile uint32_t input1;
    volatile uint32_t input2;
    volatile uint32_t input3;
    volatile uint32_t saAddress;
    volatile uint16_t saRowWidth;
    volatile uint16_t unused0;
    volatile uint16_t saWidth;
    volatile uint16_t unused1;
    volatile uint16_t saHeight;
    volatile uint16_t unused2;
    volatile uint32_t sbAddress;
    volatile uint16_t sbRowWidth;
    volatile uint16_t unused3;
    volatile uint32_t scAddress;
    volatile uint16_t scRowWidth;
    volatile uint16_t unused4;    
    volatile uint32_t daAddress;
    volatile uint16_t daRowWidth;
    volatile uint16_t unused5;
    volatile uint16_t daWidth;
    volatile uint16_t unused6;
    volatile uint16_t daHeight;
    volatile uint16_t unused7;
    volatile uint32_t dbAddress;
    volatile uint16_t dbRowWidth;
    volatile uint16_t unused8;
    
    //3d
    //bounding box min/max
    volatile int16_t  bbXMin;
    volatile uint16_t unused9;
    volatile int16_t  bbXMax;
    volatile uint16_t unused10;
    volatile int16_t  bbYMin;
    volatile uint16_t unused11;
    volatile int16_t  bbYMax;
    volatile uint16_t unused12;

    //triangle vertices a,b,c
    volatile int16_t  aX;
    volatile uint16_t unused13;
    volatile int16_t  aY;
    volatile uint16_t unused14;
    volatile int16_t  aZ;
    volatile uint16_t unused15;
    volatile uint32_t aIt0;
    volatile uint32_t aIt1;
    volatile uint32_t aIt2;

    volatile int16_t  bX;
    volatile uint16_t unused16;
    volatile int16_t  bY;
    volatile uint16_t unused17;
    volatile int16_t  bZ;
    volatile uint16_t unused18;
    volatile uint32_t bIt0;
    volatile uint32_t bIt1;
    volatile uint32_t bIt2;

    volatile int16_t  cX;
    volatile uint16_t unused19;
    volatile int16_t  cY;
    volatile uint16_t unused20;
    volatile int16_t  cZ;
    volatile uint16_t unused21;
    volatile uint32_t cIt0;
    volatile uint32_t cIt1;
    volatile uint32_t cIt2;

    volatile int32_t  triangleArea;
    volatile int32_t  triangleAreaInv;
    
}_BLITTER_REGISTERS_T;

extern _BLITTER_REGISTERS_T *blt;

typedef struct __USBHOST_REGISTERS_T
{
    volatile uint32_t id;
    volatile uint32_t version;

    volatile uint32_t usbHidKeyboardStatus;
    volatile uint32_t usbHidKeyboardData;
    volatile int32_t  usbHidMouseX;
    volatile int32_t  usbHidMouseY;
    volatile uint32_t usbHidMouseButtons;

}_USBHOST_REGISTERS_T;

extern _USBHOST_REGISTERS_T *usbhost;

typedef struct __UART_REGISTERS_T
{
    volatile uint32_t id;
    volatile uint32_t version;

    //wr - send data via uart, rd - read received data from fifo
    volatile uint32_t uartData;

    //b0 - suDataReceivedReady, b1 - suDataSenderReady
    volatile uint32_t uartStatus;

}_UART_REGISTERS_T;

extern _UART_REGISTERS_T *uart0;

typedef struct __SPI_REGISTERS_T
{
    volatile uint32_t id;
    volatile uint32_t version;

    //wr - send data via spi, rd - read received data
    volatile uint32_t spiData;
    
    //rd b0 - spiReady
    volatile uint32_t spiStatus;

}_SPI_REGISTERS_T;

extern _SPI_REGISTERS_T *spi0;
extern _SPI_REGISTERS_T *spi1;

typedef struct __AUDIO_REGISTERS_T
{
    volatile uint32_t id;
    volatile uint32_t version;
    volatile uint32_t audioFiFoData;
    volatile uint32_t audioFiFoStatus;
    volatile uint32_t i2sClockConfig;
    volatile uint32_t fifoReadConfig;
    volatile uint32_t audioDmaConfig;
    volatile uint32_t audioDmaStatus;
    volatile uint32_t audioDmaPointer;
    volatile uint32_t audioDmaLength;

}_AUDIO_REGISTERS_T;

extern _AUDIO_REGISTERS_T *aud;

typedef struct __SDRAMDMA_REGISTERS_T
{
    volatile uint32_t id;
    volatile uint32_t version;
    volatile uint32_t ch3DmaPointerStart;
    volatile uint32_t ch3DmaRequest0Modulo;
    volatile uint32_t ch3DmaRequest1Modulo;
    volatile uint32_t ch3DmaRequestLength;

}_SDRAMDMA_REGISTERS_T;

extern _SDRAMDMA_REGISTERS_T *sdrdma;


typedef struct __FPALU_REGISTERS_T
{
    
    volatile uint32_t   id;
    volatile uint32_t   version;
    volatile uint32_t   command;
    volatile float      fA;
    volatile float      fB;
    volatile float      fC;
    volatile float      fResult;

}_FPALU_REGISTERS_T;

extern _FPALU_REGISTERS_T *fpalu;


uint32_t    bspInit( void );
uint32_t    randomNumber( void );
void        itoaHex2Digits( uint32_t value, char* str );
void        itoaHex4Digits( uint32_t value, char* str );
void        itoaHex8Digits( uint32_t value, char* str );
uint32_t    getTicks( void );
void        delayMs( uint32_t delay );

uint32_t    setVideoMode( uint32_t videoMode );
void        reboot( void );





#ifdef _GFXLIB_FPALU

float inline ffAdd( float a, float b )
{

    fpalu->fA       = a;
    fpalu->fB       = b;
    fpalu->command  = 0x00000001;

    return fpalu->fResult;
}

float inline ffSub( float a, float b )
{

    fpalu->fA       = a;
    fpalu->fB       = b;
    fpalu->command  = 0x80000001;
        
    return fpalu->fResult;
}

float inline ffMul( float a, float b )
{

    fpalu->fA = a;
    fpalu->fB = b;

    fpalu->command  = 0x00000002;

    return fpalu->fResult;
}

float inline ffDiv( float a, float b )
{

    fpalu->fA = a;
    fpalu->fB = b;

    fpalu->command  = 0x00000003;
    
    return fpalu->fResult;
}

#else

float inline ffMul( float a, float b )
{
    return a * b;
}

float inline ffAdd( float a, float b )
{        
    return a + b;
}

float inline ffSub( float a, float b )
{    
    return a - b;
}


float inline ffDiv( float a, float b )
{
    return a / b;
}


#endif

#ifdef __cplusplus
} 
#endif

#endif
