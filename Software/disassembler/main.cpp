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
#include "disasm.h"

extern tgfTextOverlay   con;
tgfBitmap               screen;
dsContext_t             dctx;
char                    disasmOutputBuffer[256];


int main()
{
    ulong       i;
    int         rv;
    tosUIEvent  event; 

    bspInit();

    con.textAttributes = 0x0f;

    toCls( &con );

    con.textAttributes = 0x8f;

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
    osUIEventsInit();   

    dctx.codeBuf        = (ulong*) 0x0;
    dctx.codeBufIdx     = 0;
    dctx.codeBufStartPc = 0;

    for( i = 0; i < 29; i++ )
    {
        dsDisassemble( &dctx, disasmOutputBuffer );
        toPrintF( &con, (char*)"0x%08x 0x%08x    %s\n", dctx.pc, dctx.instruction, disasmOutputBuffer );
    }

    do
    {

        while( !osGetUIEvent( &event ) )
        { 
            if( event.type == OS_EVENT_TYPE_KEYBOARD_KEYPRESS )
            {
                switch( event.arg1 )
                {
                    case _KEYCODE_PAUSE:

                        reboot();
                        break;  
                }
            }
        }


        delayMs( 100 );
        
    }while( 1 );
    

} 