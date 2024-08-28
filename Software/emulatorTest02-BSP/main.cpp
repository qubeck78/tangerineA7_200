#include "main.h"

#include "../gfxLib/bsp.h"
#include "../gfxLib/osAlloc.h"
#include "../gfxLib/osFile.h"
#include "../gfxLib/gfBitmap.h"
#include "../gfxLib/gfDrawing.h"
#include "../gfxLib/gfFont.h"

#include "../gfxLib/osUIEvents.h"

extern tgfTextOverlay   con;

int main()
{
    int         rv;

    bspInit();
    setVideoMode( _VIDEOMODE_TEXT80_ONLY );
 
    con.textAttributes = 0x0f;
    
    toCls( &con );
    toPrintF( &con, (char*)"BSP test\n" );


    asm(
        "ebreak\n"
        );


    do{}while( 1 );
} 