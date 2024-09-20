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
tgfBitmap               background;
tgfBitmap               cursor;
tgfBitmap               cursorBg;


static ulong waitKey()
{
    ulong       keyPressed;
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
    ulong       i;
    ulong       rv;
    tosUIEvent  event;

    long       mouseX;
    long       mouseY;
    long       prvMouseX;
    long       prvMouseY;
    
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

    gfFillRect( &screen, 0, 0, screen.width - 1, screen.height - 1 , gfColor( 0, 0, 0 ) ); 
    
    bsp->frameTimer = 0;

    //init events queue
    rv = osUIEventsInit();   
    
    //init filesystem
    rv = osFInit();

    toPrintF( &con, (char*)"Mouse test. USBHID id: %08x, version: %08x\n", usbhost->id, usbhost->version );
    
    gfLoadBitmapFS( &cursor, (char*)"0:/sys/cursor.gbm" );
    
    cursor.flags            = GF_BITMAP_FLAG_TRANSPARENT;
    cursor.transparentColor = gfColor( 0, 0, 0 );
    
    gfLoadBitmapFS( &cursorBg, (char*)"0:/sys/cursor.gbm" );

    gfLoadBitmapFS( &background, (char*)"0:/shell/background.gbm" );
    
    gfBlitBitmap( &screen, &background, 0, 0 );

    
    mouseX      = 0;
    mouseY      = 0;
    prvMouseX   = 0;
    prvMouseY   = 0;

    gfBlitBitmapSrcRect( &cursorBg, &screen, mouseX, mouseY, cursorBg.width, cursorBg.height, 0, 0 );


    do
    {

        mouseX += usbhost->usbHidMouseX;        
        mouseY += usbhost->usbHidMouseY;
    
        if( mouseX < 0 )
        {
            mouseX = 0;
        }
        
        if( mouseY < 0 )
        {
            mouseY = 0;
        }
        
        if( mouseX > ( screen.width - 1 ) )
        {
            mouseX = screen.width -1;
        }

        if( mouseY > ( screen.height - 1 ) )
        {
            mouseY = screen.height -1;
        }

        if ( ( mouseX != prvMouseX ) || ( mouseY != prvMouseY ) )
        {
            gfBlitBitmap( &screen, &cursorBg, prvMouseX, prvMouseY );
            
            if( usbhost->usbHidMouseButtons & 1 )
            {
                gfPlot( &screen, mouseX, mouseY, gfColor( 255, 255, 255 ) );
            }
            
            if( usbhost->usbHidMouseButtons & 2 )
            {
                gfBlitBitmap( &screen, &background, 0, 0 );
            }


            gfBlitBitmapSrcRect( &cursorBg, &screen, mouseX, mouseY, cursorBg.width, cursorBg.height, 0, 0 );

            gfBlitBitmap( &screen, &cursor, mouseX, mouseY );

            prvMouseX = mouseX;
            prvMouseY = mouseY;

        }

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
    

} 