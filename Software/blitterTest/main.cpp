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


static uint32_t fillTest()
{
    uint32_t   i;

    gfLine( &screen, 160, 0, 160, 239, gfColor( 0, 255, 0 ) );
    gfLine( &screen, 0, 120, 319, 120, gfColor( 0, 255, 0 ) );
    
    blt->daAddress  = (uint32_t)screen.buffer;
    blt->daRowWidth = screen.rowWidth;
    blt->daWidth    = 160;
    blt->daHeight   = 120;
    blt->input0     = gfColor( 255, 100, 200 );

    blt->command    = 0x0100;

    while( ! ( blt->command & 1 ) );

    blt->daAddress  = (uint32_t)screen.buffer + ( 122 * ( screen.rowWidth << 1 ) + 2 );

    blt->daRowWidth = screen.rowWidth;
    blt->daWidth    = 158;
    blt->daHeight   = 117;
    blt->input0     = gfColor( 255, 255, 255 );

    blt->command    = 0x0100;

    while( ! ( blt->command & 1 ) );

    for( i = 0; i < 120; i++ )
    {

        blt->daAddress  = (uint32_t)screen.buffer + ( i * ( screen.rowWidth << 1 ) + ( 161 << 1 ) );

        blt->daRowWidth = screen.rowWidth;
        blt->daWidth    = 159;
        blt->daHeight   = 1;
        blt->input0     = gfColor( i << 1, i, 255 - ( i << 1) );

        blt->command    = 0x0100;


        while( ! ( blt->command & 1 ) );
    
    }

    for( i = 0; i < 159; i++ )
    {

        blt->daAddress  = (uint32_t)screen.buffer + ( 121 * ( screen.rowWidth << 1 ) + ( ( i + 161 ) << 1 ) );

        blt->daRowWidth = screen.rowWidth;
        blt->daWidth    = 1;
        blt->daHeight   = 119;
        blt->input0     = gfColor( i , i, i );

        blt->command    = 0x0100;


        while( ! ( blt->command & 1 ) );
    
    }

    return 0;
}

static uint32_t copyTest()
{

    blt->saAddress  = (uint32_t)bmp.buffer;
    blt->saRowWidth = bmp.rowWidth;
    blt->saWidth    = bmp.width;
    blt->saHeight   = bmp.height;

    blt->daAddress  = (uint32_t)screen.buffer + ( 32 * ( screen.rowWidth << 1 ) + ( 32 << 1) );
    blt->daRowWidth = screen.rowWidth;

    blt->daWidth    = bmp.width;
    blt->daHeight   = bmp.height;

    blt->command    = 0x0200;

    while( ! ( blt->command & 1 ) );

    blt->saAddress  = (uint32_t)bmp.buffer;
    blt->saRowWidth = bmp.rowWidth;
    blt->saWidth    = bmp.width;
    blt->saHeight   = bmp.height;

    blt->daAddress  = (uint32_t)screen.buffer + ( ( 121 + 32 ) * ( screen.rowWidth << 1 ) + ( ( 161 + 32 ) << 1) );
    blt->daRowWidth = screen.rowWidth;

    blt->daWidth    = bmp.width;
    blt->daHeight   = bmp.height;
    blt->input0     = gfColor( 0, 0, 0 );

    blt->command    = 0x0201;

    while( ! ( blt->command & 1 ) );

    blt->saAddress  = (uint32_t)bmp.buffer;
    blt->saRowWidth = bmp.rowWidth;
    blt->saWidth    = bmp.width;
    blt->saHeight   = bmp.height;

    blt->sbAddress  = (uint32_t)screen.buffer + ( 32 * ( screen.rowWidth << 1 ) + (  ( 161 + 32 ) << 1) );
    blt->sbRowWidth = screen.rowWidth;

    blt->daAddress  = (uint32_t)screen.buffer + ( 32 * ( screen.rowWidth << 1 ) + ( ( 161 + 32 ) << 1) );
    blt->daRowWidth = screen.rowWidth;

    blt->daWidth    = bmp.width;
    blt->daHeight   = bmp.height;

    blt->input0     = ( 64 >> 3 );

    blt->command    = 0x0300;

    while( ! ( blt->command & 1 ) );

    blt->saAddress  = (uint32_t)bmp.buffer;
    blt->saRowWidth = bmp.rowWidth;
    blt->saWidth    = bmp.width;
    blt->saHeight   = bmp.height;

    blt->sbAddress  = (uint32_t)screen.buffer + ( ( 121 + 32 ) * ( screen.rowWidth << 1 ) + (  32 << 1 ) );
    blt->sbRowWidth = screen.rowWidth;

    blt->daAddress  = (uint32_t)screen.buffer + ( ( 121 + 32 ) * ( screen.rowWidth << 1 ) + ( 32  << 1 ) );
    blt->daRowWidth = screen.rowWidth;

    blt->daWidth    = bmp.width;
    blt->daHeight   = bmp.height;

    blt->input0     = ( 128 >> 3 );
    blt->input1     = gfColor( 0, 0, 0 );

    blt->command    = 0x0301;

    while( ! ( blt->command & 1 ) );

    return 0;
}

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
    uint32_t   i;
    uint32_t   rv;

    bspInit();


    
    setVideoMode( _VIDEOMODE_320_TEXT80_OVER_GFX );
    
    //alloc screen buffers
    screen.width            = 320;
    screen.rowWidth         = 512;
    screen.height           = 240;
    
    
    screen.flags            = 0;
    screen.transparentColor = 0;
    screen.buffer           = osAlloc( screen.rowWidth * screen.height * 2, OS_ALLOC_MEMF_CHIP );
    
    if( screen.buffer == NULL )
    {
        toPrint( &con, (char*)"\nCan't alloc screen\n" );
        do{}while( 1 );
    } 
        
    
    //display first buffer
    gfDisplayBitmap( &screen );

    gfFillRect( &screen, 0, 0, screen.width - 1, screen.height - 1 , gfColor( 0, 0, 255 ) ); 
    
    bsp->frameTimer = 0;

    //init events queue
    rv = osUIEventsInit();   
    
    //init filesystem
    rv = osFInit();


    toPrintF( &con, (char*)"Blitter test. Blitter2D id: %08x, version: %08x\n", blt->id, blt->version );
    
    gfLoadBitmapFS( &bmp, (char*)"0:/demos/ida.gbm" );

    fillTest();

    waitKey();

    copyTest();

    waitKey();

    toPrintF( &con, (char*)"done - press Pause to reboot\n" );

    do
    {
        waitKey();
        
    }while( 1 );
    

} 