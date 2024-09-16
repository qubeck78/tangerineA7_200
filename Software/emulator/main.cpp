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
#include "srec.h"

//https://riscvasm.lucasteske.dev/#

extern tgfTextOverlay   con;

dsContext_t             dctx;

char                    disasmOutputBuffer[80];
char                    lineBuffer[255];

emContext_t             ectx;

extern ulong *rvStackL;

ulong init()
{
    ulong rv;

    bspInit();

    setVideoMode( _VIDEOMODE_TEXT80_ONLY );

    con.textAttributes = 0x7a;

    toCls( &con );

    con.textAttributes = 0x7a;

    //init filesystem
    rv = osFInit();

    if( rv )
    {
        toPrint( &con, ( char* )"SD init error!" );
        
        do{
        }while( 1 );        
    }
        
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

    //mem io
    mioInit();


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
    ulong       *bootloaderPtr;


    init();


    //copy bootloader
    bootloaderPtr = (ulong*)0;

    for( i = 0; i < 2048; i++ )
    {

        storeData( i * 4, 0b1111, bootloaderPtr[i] );
    }

    con.textAttributes = 0x8a;
    toCls( &con );


    rvReset( &ectx );
    
    srecLoadFile( (char*)"0:emul\\shell.rec" );
    ectx.pc = 0x20780000;

    
    do
    {
        /*if( ectx.instrCounter >= 0x9650 )
        {
            break;
        }
        */
       /* if( ectx.pc == 0x148 )
        {
            break;
        }*/
       /* if( ectx.pc >= 0x20780000 )
        {
            break;
        }*/

    }
    while( !rvStep( &ectx ) );
    


    disasmIdx           = 0;
    refresh             = 1;

    dctx.codeBuf        = (ulong*) 0;

    dctx.codeBufIdx     = ectx.pc / 4;
    dctx.codeBufStartPc = 0;

    do
    {


        if( refresh )
        {
            refresh = 0;

            toSetCursorPos( &con, 69, 0 );

            toPrintF( &con, (char*) "PC %08x", ectx.pc );

            for( i = 0; i < 16; i++ )
            {
                nameRegister( i, disasmOutputBuffer );
                sprintf( lineBuffer, "%s %08x", disasmOutputBuffer, ectx.regs[i] );

                toSetCursorPos( &con, 67 - strlen( lineBuffer ), i + 1 );
                toPrint( &con, lineBuffer );

                nameRegister( i + 16, disasmOutputBuffer );
                sprintf( lineBuffer, "%s %08x", disasmOutputBuffer, ectx.regs[i + 16] );

                toSetCursorPos( &con, 80 - strlen( lineBuffer ), i + 1 );
                toPrint( &con, lineBuffer );

            }

            toSetCursorPos( &con, 0, 0 );

            dctx.codeBufIdx     = ectx.pc / 4 + disasmIdx;

            for( i = 21; i < 30; i++ )
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
                    
                    case 32:
                        
                        rvStep( &ectx );
                        refresh = 1;

                        break;

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


        //delayMs( 100 );
        
    }while( 1 );
    

} 
