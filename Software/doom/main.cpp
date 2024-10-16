#include "main.h"
#include <cstring>
#include <climits>

#include "../gfxLib/bsp.h"
#include "../gfxLib/osAlloc.h"
#include "../gfxLib/osFile.h"
#include "../gfxLib/gfBitmap.h"
#include "../gfxLib/gfDrawing.h"
#include "../gfxLib/gfFont.h"
#include "../gfxLib/osUIEvents.h"
#include "../gfxLib/ff.h" 
#include "gfLibInterface.h"

#include <cstdio>
#include <stddef.h>  // for size_t
#include <unistd.h>  // for STDERR_FILENO


//https://info.iar.com/knowledge/learn/programming/mastering-stack-and-heap-for-system-reliability/



extern BSP_T                *bsp;
extern tgfTextOverlay        con;

tgfBitmap                    tgFrameBufferBMP;
uint8_t                     *tgFrameBuffer;
volatile uint32_t           *tgPaletteRegisters;

extern "C" void D_DoomMain( void );

extern "C" void _fini(void) { }

extern "C" int _write ( int file, const void * ptr, size_t len ) 
{
    char        buf[4];
    uint32_t    i;

    buf[1] = 0;

    for( i = 0; i < len; i++ )
    {
        buf[0] = ((char*)ptr)[i];
        toPrint( &con, buf );
    }

    return len;
}


int main()
{
    uint32_t    i;
    uint32_t    rv;
    uint32_t    x;
    uint32_t    y;

    tgPaletteRegisters = (volatile uint32_t*)( 0xf0920000 );

    bspInit();
            
    setVideoMode( _VIDEOMODE_320_8BPP_TEXT80_OVER_GFX );
    

    toCls( &con );
    con.textAttributes = 0x8f;

    toPrint( &con, (char*)"DOOM loader B20241015\n\n" );
    

    tgFrameBufferBMP.rowWidth  = 256;
    tgFrameBufferBMP.width     = 160;
    tgFrameBufferBMP.height    = 240;
    tgFrameBufferBMP.flags     = 0;

    tgFrameBufferBMP.buffer    = osAlloc( tgFrameBufferBMP.rowWidth * tgFrameBufferBMP.height * 2, OS_ALLOC_MEMF_CHIP ); 
    
    if( tgFrameBufferBMP.buffer == NULL )
    {
        toPrint( &con, (char*)"\nCan't alloc screen\n" );
        do{}while( 1 );
    } 
    
    tgFrameBuffer   = (uint8_t*)tgFrameBufferBMP.buffer;

    //init palette
    for( i = 0; i < 256; i++ )
    {
        tgPaletteRegisters[i] = ( i << 16 ) | ( i << 8 ) | i;
    }
    
    //display frame buffer    
    gfDisplayBitmap( &tgFrameBufferBMP );

    //draw background
    for( y = 0; y < 240; y++ )
    {
        if( y < 200 )
        {
            for( x = 0; x < 320; x++ )
            {
                tgFrameBuffer[ x + ( y << 9 ) ] = randomNumber() & 0x7f;

            }
        }
        else
        {
            for( x = 0; x < 320; x++ )
            {
                tgFrameBuffer[ x + ( y << 9 ) ] = 0;
            }

        }
    }

    //init events queue
    osUIEventsInit();  

    //init filesystem
    rv = osFInit();

    if( rv )
    {
        toPrint( &con, ( char* )"SD init error!" );
        
        do{
        }while( 1 );        
    }
    else
    {
        toPrint( &con, ( char* )"SD init ok\n" );
    }

    gfLibInterfaceInit( tgFrameBufferBMP.buffer );

    D_DoomMain();

    do
    {


    }while( 1 );



    reboot();
} 
