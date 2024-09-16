#ifndef _BSP_H
#define _BSP_H


//Memory regions

//7.5MB
#define _SYSTEM_MEMORY_SIZE 	( 7864320 - 16)
#define _SYSTEM_MEMORY_BASE		0x20000000


#define _VIDEOMODE_TEXT40_ONLY              0x00
#define _VIDEOMODE_TEXT80_ONLY              0x04

#define _VIDEOMODE_320_TEXT40_OVER_GFX      0x02
#define _VIDEOMODE_320_TEXT80_OVER_GFX      0x06

#define _VIDEOMODE_640_TEXT40_OVER_GFX      0x12
#define _VIDEOMODE_640_TEXT80_OVER_GFX      0x16


#include "gfTypes.h"

//x"80000000";   -- root id
//x"80000001";   -- serial id
//x"80000002";   -- spi id
//x"80000003";   -- sdram DMA id
//x"80000004";   -- usb hid host id
//x"80000005";   -- blitter2d id



typedef struct _BSP_T
{
    volatile ulong id;
    volatile ulong version;

    //
    volatile unsigned long videoMuxMode;
    
    //b0 - vsync (positive)
    volatile unsigned long videoVSync;
    
    volatile unsigned long  unused0;
        
    //wr b7, b6, b5, b4 - LEDS, b0 - spi0SSel
    volatile unsigned long gpoPort;
    
    //wr b0 - tickTimerReset
    volatile unsigned long tickTimerConfig;
    
    //rd - tickTimerValue
    volatile unsigned long tickTimerValue;
    
    //counts frames (up), write resets timer
    volatile unsigned long  frameTimer;
    

}BSP_T;


extern BSP_T *bsp;

typedef struct __FPALU_REGISTERS_T
{
    volatile float fpA;
    volatile float fpB;
    volatile float fpAddResult;
    volatile float fpSubResult;
    volatile float fpMulResult;
    volatile float fpDivResult;

}_FPALU_REGISTERS_T;

extern _FPALU_REGISTERS_T *fpalu;


typedef struct __BLITTER_REGISTERS_T
{
    volatile ulong id;
    volatile ulong version;

    volatile ulong command;
    volatile ulong input0;
    volatile ulong input1;
    volatile ulong input2;
    volatile ulong input3;
    volatile ulong saAddress;
    volatile ulong saRowWidth;
    volatile ulong saWidth;
    volatile ulong saHeight;
    volatile ulong sbAddress;
    volatile ulong sbRowWidth;
    volatile ulong scAddress;
    volatile ulong scRowWidth;
    volatile ulong daAddress;
    volatile ulong daRowWidth;
    volatile ulong daWidth;
    volatile ulong daHeight;
    volatile ulong dbAddress;
    volatile ulong dbRowWidth;

}_BLITTER_REGISTERS_T;

extern _BLITTER_REGISTERS_T *blt;

typedef struct __USBHOST_REGISTERS_T
{
    volatile ulong id;
    volatile ulong version;

    volatile unsigned long usbHidKeyboardStatus;
    volatile unsigned long usbHidKeyboardData;

}_USBHOST_REGISTERS_T;

extern _USBHOST_REGISTERS_T *usbhost;

typedef struct __UART_REGISTERS_T
{
    volatile ulong id;
    volatile ulong version;

    //wr - send data via uart, rd - read received data from fifo
    volatile unsigned long uartData;

    //b0 - suDataReceivedReady, b1 - suDataSenderReady
    volatile unsigned long uartStatus;

}_UART_REGISTERS_T;

extern _UART_REGISTERS_T *uart0;

typedef struct __SPI_REGISTERS_T
{
    volatile ulong id;
    volatile ulong version;

    //wr - send data via spi, rd - read received data
    volatile unsigned long spiData;
    
    //rd b0 - spiReady
    volatile unsigned long spiStatus;

}_SPI_REGISTERS_T;

extern _SPI_REGISTERS_T *spi0;
extern _SPI_REGISTERS_T *spi1;

typedef struct __AUDIO_REGISTERS_T
{
    volatile ulong audioFiFoData;
    volatile ulong audioFiFoStatus;
    volatile ulong i2sClockConfig;
    volatile ulong fifoReadConfig;
    volatile ulong audioDmaConfig;
    volatile ulong audioDmaStatus;
    volatile ulong audioDmaPointer;
    volatile ulong audioDmaLength;

}_AUDIO_REGISTERS_T;

extern _AUDIO_REGISTERS_T *aud;

typedef struct __SDRAMDMA_REGISTERS_T
{
    volatile ulong id;
    volatile ulong version;
    volatile ulong ch3DmaPointerStart;
    volatile ulong ch3DmaRequest0Modulo;
    volatile ulong ch3DmaRequest1Modulo;

}_SDRAMDMA_REGISTERS_T;

extern _SDRAMDMA_REGISTERS_T *sdrdma;


int     bspInit( void );
int     randomNumber( void );
void    itoaHex2Digits( int value, char* str );
void    itoaHex4Digits( int value, char* str );
void    itoaHex8Digits( int value, char* str );
ulong   getTicks( void );
void    delayMs( unsigned long delay );

int     setVideoMode( ulong videoMode );
void    reboot( void );


#ifdef _GFXLIB_FPALU

float inline ffMul( float a, float b )
{
    volatile ulong j;

    fpalu->fpA = a;
    fpalu->fpB = b;

    for( j = 0; j < 2; j++);


    return fpalu->fpMulResult;
}

float inline ffAdd( float a, float b )
{
    volatile ulong j;

    fpalu->fpA = a;
    fpalu->fpB = b;

    for( j = 0; j < 2; j++);
        
    return fpalu->fpAddResult;
}

float inline ffSub( float a, float b )
{
    volatile ulong j;

    fpalu->fpA = a;
    fpalu->fpB = b;

    for( j = 0; j < 2; j++);
        
    return fpalu->fpSubResult;
}

float inline ffDiv( float a, float b )
{
    volatile ulong j;

    fpalu->fpA = a;
    fpalu->fpB = b;

    for( j = 0; j < 8; j++);
        
    return fpalu->fpDivResult;
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
#endif
