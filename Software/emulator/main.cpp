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
#include "disasm.h"
#include "memio.h"
#include "emul.h"

extern tgfTextOverlay   con;

dsContext_t             dctx;

char                    disasmOutputBuffer[80];
char                    lineBuffer[81];

emContext_t             ectx;


ulong init()
{

    bspInit();

    setVideoMode( _VIDEOMODE_TEXT80_ONLY );

    con.textAttributes = 0x7a;

    toCls( &con );

    con.textAttributes = 0x7a;

        
    //init events queue
    osUIEventsInit();   

    //disassembler

    dctx.codeBuf        = (ulong*) 0x0;
    dctx.codeBufIdx     = 0;
    dctx.codeBufStartPc = 0;

    //emulator
    ectx.fetchInstruction   = fetchInstruction;
    ectx.fetchData          = fetchData;
    ectx.storeData          = storeData;



    return 0;
}

int main()
{
    ulong       i;
    ulong       j;
    ulong       disasmLineLength;

    int         rv;
    tosUIEvent  event; 
    ulong       disasmIdx;
    ulong       refresh;


    init();

    disasmIdx           = 0;
    refresh             = 1;

    rvReset( &ectx );
    

    do
    {

        if( refresh )
        {
            refresh = 0;

            dctx.codeBuf        = (ulong*) 0x0;
            dctx.codeBufIdx     = disasmIdx;
            dctx.codeBufStartPc = 0;

            toSetCursorPos( &con, 0, 0 );

            for( i = 0; i < 30; i++ )
            {
                dsDisassemble( &dctx, disasmOutputBuffer );

                toSetCursorPos( &con, 0, i );

                sprintf( lineBuffer, (char*)"0x%08x 0x%08x    %s", dctx.pc, dctx.instruction, disasmOutputBuffer );
                disasmLineLength = strlen( lineBuffer );

                for( j = disasmLineLength + 1; j < 80; j++ )
                {
                    strcat( lineBuffer, " " );
                }

                toPrint( &con, lineBuffer );

            }
        }

        while( !osGetUIEvent( &event ) )
        { 
            if( event.type == OS_EVENT_TYPE_KEYBOARD_KEYPRESS )
            {
                switch( event.arg1 )
                {
                    case _KEYCODE_PAUSE:

                        reboot();
                        break;  

                    case _KEYCODE_DOWN:

                        disasmIdx++;

                        refresh = 1;

                        break;

                    case _KEYCODE_PGDOWN:

                        disasmIdx   += 30;

                        refresh     = 1;

                        break;

                    case _KEYCODE_UP:

                        disasmIdx--;

                        refresh = 1;

                        break;

                    case _KEYCODE_PGUP:

                        disasmIdx   -= 30;

                        refresh     = 1;

                        break;
                }
            }
        }


        delayMs( 100 );
        
    }while( 1 );
    

} 
