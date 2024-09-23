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
#include "../gfxLib/usbHID.h"

extern tgfTextOverlay   con;
tgfBitmap               screen;
tgfBitmap               background;
tgfBitmap               cursor;



static uint32_t waitKey()
{
    uint32_t       keyPressed;
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
    uint32_t    rv;
    tosUIEvent  event;

    uint32_t    mouseX;
    uint32_t    mouseY;
    uint32_t    mouseButtons;
    
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
    
    //init events queue
    rv = osUIEventsInit();   
    
    //init filesystem
    rv = osFInit();

    toPrintF( &con, (char*)"Mouse test.\nUSBHID    id: %08x, version: %08x\n", usbhost->id, usbhost->version );
    toPrintF( &con, (char*)"SPRITEGEN id: %08x, version: %08x\n", spriteGen->id, spriteGen->version );
   
    gfLoadBitmapFS( &background, (char*)"0:/shell/background.gbm" );    
    gfBlitBitmap( &screen, &background, 0, 0 );

    gfLoadBitmapFS( &cursor, (char*)"0:/sys/cursor.gbm" );
    usbHIDSetMousePointerShape( &cursor );

    usbHIDSetMousePointerVisibility( 1 );


    do
    {

        usbHIDGetMouse( &mouseX, &mouseY, &mouseButtons );
        
        if( usbhost->usbHidMouseButtons & 1 )
        {
            gfPlot( &screen, mouseX >> 1, mouseY >> 1, gfColor( 255, 255, 255 ) );
        }
        
        if( usbhost->usbHidMouseButtons & 2 )
        {
            gfBlitBitmap( &screen, &background, 0, 0 );
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