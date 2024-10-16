#include "main.h"
#include <cstring>
#include <climits>
#include <cstdio>

#include "../gfxLib/bsp.h"
#include "../gfxLib/osAlloc.h"
#include "../gfxLib/osFile.h"
#include "../gfxLib/gfBitmap.h"
#include "../gfxLib/gfDrawing.h"
#include "../gfxLib/gfFont.h"

#include "../gfxLib/osUIEvents.h"


extern tgfTextOverlay   con;
tgfBitmap               screen;
tgfBitmap               bmp;

char buf[256];

volatile uint32_t      *paletteRegisters;



static uint32_t waitKey()
{
    uint32_t    keyPressed;
    tosUIEvent  event; 

    keyPressed = 0;

    do
    {
        while( !osGetUIEvent( &event ) )
        { 
            if( event.type == OS_EVENT_TYPE_KEYBOARD_KEYPRESS )
            {
                keyPressed = 1;

                if( event.arg1 ==  _KEYCODE_PAUSE )
                {
                    reboot();
                }
            }
        }

        delayMs( 10 );

    }while( !keyPressed );
    
    return 0;
}

int main()
{
    uint32_t    i;
    uint32_t    j;
    uint32_t    rv;
    uint8_t    *fb;
    int32_t     x;
    int32_t     y;
    tosUIEvent  event; 
    
    paletteRegisters = (volatile uint32_t*)( 0xf0920000 );

    bspInit();

    
    setVideoMode( _VIDEOMODE_320_8BPP_TEXT80_OVER_GFX );

    //adjust DMA request length to 320x240x8bpp, row width: 256
    /*sdrdma->ch3DmaRequestLength     = 0x4f;
    sdrdma->ch3DmaRequest0Modulo    = 0x30;
    sdrdma->ch3DmaRequest1Modulo    = 0x30;
    */
    
    //alloc screen buffers
    screen.width            = 160;
    screen.rowWidth         = 256;
    screen.height           = 240;
    
    
    screen.flags            = 0;
    screen.transparentColor = 0;
    screen.buffer           = osAlloc( screen.rowWidth * screen.height * 2, OS_ALLOC_MEMF_CHIP );
    
    if( screen.buffer == NULL )
    {
        toPrint( &con, (char*)"\nCan't alloc screen\n" );
        do{}while( 1 );
    } 
        
    fb = ( uint8_t *)screen.buffer;

    for( y = 0; y < 240; y++ )
    {
        for( x = 0; x < 320; x++ )
        {
            fb[ x + ( y << 9 ) ] = 0;
        }
    }

    //display first buffer
    gfDisplayBitmap( &screen );


    //init events queue
    rv = osUIEventsInit();   
    
    //init filesystem
    rv = osFInit();

    toPrintF( &con, "GfxTest8bpp. GfxPixelGen id: %08x, version: %08x\n", gfxPixelGen->id, gfxPixelGen->version );
    

    for( i = 0; i < 256; i++ )
    {
        paletteRegisters[i] = i | i << 8 | i << 16;
    }
    
    for( i = 0; i < 256; i++ )
    {
        if( paletteRegisters[i] != ( i | i << 8 | i << 16 ) )
        {
            toPrintF( &con, (char*)"Palette registers read error\n" );
            break;
        }
    }
    

    for( y = 0; y < 240; y++ )
    {
        for( x = 0; x < 320; x++ )
        {

            fb[ x + ( y << 9 ) ] = x & 0xff;

        }
    }

    waitKey();

    for( y = 0; y < 240; y++ )
    {
        for( x = 0; x < 320; x++ )
        {

            fb[ x + ( y << 9 ) ] = y & 0xff;

        }
    }

    waitKey();

    for( y = 0; y < 240; y++ )
    {
        for( x = 0; x < 320; x++ )
        {
            fb[ x + ( y << 9 ) ] = 0;
        }
    }

    for( y = 0; y < 240; y++ )
    {

        fb[ y +  ( y << 9 ) ] = 0xff;

        fb[ ( y << 9 ) ] = 0xff;
        fb[ 319 + ( y << 9 ) ] = 0xff;
    }
    for( x = 0; x < 320; x++ )
    {
        fb[ x + ( 0 << 9 ) ] = 0xff;
        fb[ x + ( 239 << 9 ) ] = 0xff;

    }

    waitKey();


    toPrintF( &con, (char*)"done - press Pause to reboot\n" );


    do
    {
        uint32_t *fbl = (uint32_t *)fb;

        for( y = 1; y < 239; y++ )
        {
            for( x = 1; x < 79; x++ )
            {

                fbl[ x + ( y << 7 ) ] = randomNumber();

            }
        }

        //waitKey();

        if( !osGetUIEvent( &event ) )
        { 
            if( event.type == OS_EVENT_TYPE_KEYBOARD_KEYPRESS )
            {
                if( event.arg1 ==  _KEYCODE_PAUSE )
                {
                    reboot();
                }
            }
        }

    }while( 1 );


    do
    {
        waitKey();
        
    }while( 1 );
    

} 