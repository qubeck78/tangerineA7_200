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
//x"80000006";   -- sprite gen id
//x"80000007";   -- i2s id


typedef struct _BSP_T
{
    volatile uint32_t id;
    volatile uint32_t version;

    //
    volatile uint32_t videoMuxMode;
    
    //b0 - vsync (positive)
    volatile uint32_t videoVSync;
    
    volatile uint32_t  unused0;
        
    //wr b7, b6, b5, b4 - LEDS, b0 - spi0SSel
    volatile uint32_t gpoPort;
    
    //wr b0 - tickTimerReset
    volatile uint32_t tickTimerConfig;
    
    //rd - tickTimerValue
    volatile uint32_t tickTimerValue;
    
    //counts frames (up), write resets timer
    volatile uint32_t  frameTimer;
    

}BSP_T;


extern BSP_T *bsp;

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
    volatile uint32_t saRowWidth;
    volatile uint32_t saWidth;
    volatile uint32_t saHeight;
    volatile uint32_t sbAddress;
    volatile uint32_t sbRowWidth;
    volatile uint32_t scAddress;
    volatile uint32_t scRowWidth;
    volatile uint32_t daAddress;
    volatile uint32_t daRowWidth;
    volatile uint32_t daWidth;
    volatile uint32_t daHeight;
    volatile uint32_t dbAddress;
    volatile uint32_t dbRowWidth;

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

}_SDRAMDMA_REGISTERS_T;

extern _SDRAMDMA_REGISTERS_T *sdrdma;


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

float inline ffMul( float a, float b )
{
    volatile uint32_t j;

    fpalu->fpA = a;
    fpalu->fpB = b;

    for( j = 0; j < 2; j++);


    return fpalu->fpMulResult;
}

float inline ffAdd( float a, float b )
{
    volatile uint32_t j;

    fpalu->fpA = a;
    fpalu->fpB = b;

    for( j = 0; j < 2; j++);
        
    return fpalu->fpAddResult;
}

float inline ffSub( float a, float b )
{
    volatile uint32_t j;

    fpalu->fpA = a;
    fpalu->fpB = b;

    for( j = 0; j < 2; j++);
        
    return fpalu->fpSubResult;
}

float inline ffDiv( float a, float b )
{
    volatile uint32_t j;

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
