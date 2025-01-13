
#include "bsp.h"

#include <stddef.h>  // for size_t
#include <unistd.h>  // for STDERR_FILENO

#include "gfFont.h"
#include "osAlloc.h"

BSP_T *bsp                              = ( BSP_T *)                        0xf0000000; //registers base address

_BLITTER_REGISTERS_T *blt               = ( _BLITTER_REGISTERS_T *)         0xf0200000; //blitter base address
_SPRITEGEN_REGISTERS_T *spriteGen       = ( _SPRITEGEN_REGISTERS_T *)       0xf0100000; //hw sprite generator base address
_USBHOST_REGISTERS_T *usbhost           = ( _USBHOST_REGISTERS_T *)         0xf0300000; //hid usb host base address
_UART_REGISTERS_T *uart0                = ( _UART_REGISTERS_T *)            0xf0400000; //uart 0 base address
_SPI_REGISTERS_T *spi0                  = ( _SPI_REGISTERS_T *)             0xf0500000; //spi 0 base address
_AUDIO_REGISTERS_T *aud                 = ( _AUDIO_REGISTERS_T*)            0xf0600000; //i2s audio base address
_SPI_REGISTERS_T *spi1                  = ( _SPI_REGISTERS_T *)             0xf0700000; //spi 1 base address
_SDRAMDMA_REGISTERS_T *sdrdma           = ( _SDRAMDMA_REGISTERS_T *)        0xf0800000; //sdram dma base address
_GFXPIXELGEN_REGISTERS_T *gfxPixelGen   = ( _GFXPIXELGEN_REGISTERS_T * )    0xf0900000; //gfx pixel gen base address
_FPALU_REGISTERS_T *fpalu               = ( _FPALU_REGISTERS_T * )          0xf0a00000; //fpalu base address

void (*bootLoaderEntry)(void) = (void(*)())0x0; 

tgfTextOverlay  con;

uint32_t    randomSeed;

#ifdef __cplusplus
extern "C" 
#endif
void _fini(void) { }

#ifdef __cplusplus
extern "C" 
#endif
int _write ( int file, const void * ptr, size_t len ) 
{
    char        buf[4];
    uint32_t    i;

    if( ( file == STDOUT_FILENO ) || ( file == STDERR_FILENO ) )
    {

        buf[1] = 0;

        for( i = 0; i < len; i++ )
        {
            buf[0] = ((char*)ptr)[i];
            toPrint( &con, buf );
        }

        return len;
    }
    else
    {
        return 0;
    }
}


uint32_t bspInit()
{
    randomSeed = 3242323459 + ( bsp->tickTimerValue << 16 ) ^ ( bsp->tickTimerValue ^ 0xef122333 );

    osAllocInit();
    osAllocAddNode( 0, ( void* )_SYSTEM_MEMORY_BASE, _SYSTEM_MEMORY_SIZE, OS_ALLOC_MEMF_CHIP );
    
	//osAllocAddNode( 1, ( void* )_SDRAM_MEMORY_BASE, _SDRAM_MEMORY_SIZE, OS_ALLOC_MEMF_FAST );

    bsp->videoMuxMode       = _VIDEOMODE_320_TEXT40_OVER_GFX; //text over gfx, 320x240
    
    //connect gfxlib con to hardware text overlay   
    con.type                = GF_TEXT_OVERLAY_TYPE_HARDWARE;
    con.flags               = 0;
    con.width               = 80;               //clear whole buffer
    con.height              = 30;
    con.cursX               = 0;
    con.cursY               = 0;
    con.textAttributes      = 0x0f;
    con.font                = NULL;
    con.textBuffer          = (uint8_t*) 0x5a80; //hw text mode buffer address

    toCls( &con );

    con.width               = 40;               //default 40x30 console

    con.textAttributes      = 0x8f; 

    bootLoaderEntry = (void(*)())0x0; 

    return 0;
} 

uint32_t randomNumber()
{
    uint32_t r = randomSeed;

    r ^= r << 13;
    r ^= r >> 17;
    r ^= r << 5;

    randomSeed = r;

    return r;

/* 
    //https://github.com/cmcqueen/simplerandom/blob/main/c/lecuyer/lfsr88.c
   uint32_t b;

    b = (((s1 << 13) ^ s1) >> 19);
    s1 = (((s1 & 4294967294) << 12) ^ b);
    b = (((s2 << 2) ^ s2) >> 25);
    s2 = (((s2 & 4294967288) << 4) ^ b);
    b = (((s3 << 3) ^ s3) >> 11);
    s3 = (((s3 & 4294967280) << 17) ^ b);
    return (s1 ^ s2 ^ s3);
    */
} 

void hexDigit(char *string,char digit)
{
    digit &= 0x0f;
    
    if( digit<10 )
    {
        string[0] = digit + '0';
        string[1] = 0;
    }
    else
    {
        string[0] = digit + 'a' - 10;
        string[1] = 0;
    }
}

void itoaHex2Digits( uint32_t value, char* str )
{
    hexDigit(&str[0], ( value >> 4 ) & 0x0f );
    hexDigit(&str[1], ( value ) & 0x0f );
}

void itoaHex4Digits( uint32_t value, char* str )
{
    hexDigit(&str[4], ( value >> 12 ) & 0x0f );
    hexDigit(&str[5], ( value >> 8 ) & 0x0f );

    hexDigit(&str[6], ( value >> 4) & 0x0f );
    hexDigit(&str[7], ( value ) & 0x0f );
}


void itoaHex8Digits( uint32_t value, char* str )
{
    hexDigit(&str[0], ( value >> 28 ) & 0x0f );
    hexDigit(&str[1], ( value >> 24 ) & 0x0f );

    hexDigit(&str[2], ( value >> 20 ) & 0x0f );
    hexDigit(&str[3], ( value >> 16 ) & 0x0f );

    hexDigit(&str[4], ( value >> 12 ) & 0x0f );
    hexDigit(&str[5], ( value >> 8 ) & 0x0f );

    hexDigit(&str[6], ( value >> 4) & 0x0f );
    hexDigit(&str[7], ( value ) & 0x0f );
}

uint32_t getTicks()
{
    return bsp->tickTimerValue;
}

void delayMs( uint32_t delay )
{
    uint32_t startMs;
    
    startMs = bsp->tickTimerValue;
    
    while( bsp->tickTimerValue < ( startMs + delay ) );
    
}

uint32_t setVideoMode( uint32_t videoMode )
{
    bsp->videoMuxMode = videoMode;
    
    //check textmode: 40 or 80 column and adjust console width
    if( videoMode & _VIDEOMODE_TEXT80_ONLY )
    {
        con.width = 80;
    }
    else
    {
        con.width = 40;     
    }

    if( videoMode & 0x10 )
    {
        
        //640 x 480

        //adjust dma request modulos to achieve continuous data throughout x scan line
        //line size: 1024 pixels, 512 longwords
        sdrdma->ch3DmaRequest0Modulo = 0;
        sdrdma->ch3DmaRequest1Modulo = 192;   
        
        //dma request length: 160 long words ( 2 requests per line )
        sdrdma->ch3DmaRequestLength     = 0x9f;
    }
    else
    {
        //320 x 240

        if( videoMode & 0x20 )
        {
            //8bpp

            //adjust dma request modulos to have 512 pixels, 128 longwords odd & even scan lines
            sdrdma->ch3DmaRequest0Modulo = 0x30;
            sdrdma->ch3DmaRequest1Modulo = 0x30;   

            //dma request length: 80 long words ( 1 request per two lines )
            sdrdma->ch3DmaRequestLength  = 0x4f;

        }
        else
        {        
            //16bpp

            //adjust dma request modulos to have 512 pixels, 256 longwords odd & even scan lines
            sdrdma->ch3DmaRequest0Modulo = 0x60;
            sdrdma->ch3DmaRequest1Modulo = 0x60;   

            //dma request length: 160 long words ( 1 request per two lines )
            sdrdma->ch3DmaRequestLength  = 0x9f;
        }
    }


    return 0;
}

void reboot()
{
    (*bootLoaderEntry)();
}
