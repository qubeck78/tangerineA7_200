#include "main.h"
#include <cstring>
#include <climits>
#include <cstdio>

#include "bsp.h"
#include "osAlloc.h"
#include "osFile.h"
#include "gfBitmap.h"
#include "gfDrawing.h"
#include "gfFont.h"
#include "gfGouraud.h"

#include "osUIEvents.h"


extern tgfTextOverlay   con;
tgfBitmap               screen;
tgfBitmap               zBuffer;
tgfBitmap               bmp;

char buf[256];

int32_t gouraudEdge( tgfPoint3D *e1, tgfPoint3D *e2, tgfPoint3D *p )
{
   tgfPoint3D a,b;


   a.x2D = p->x2D - e1->x2D;
   a.y2D = p->y2D - e1->y2D;

   b.x2D = e2->x2D - e1->x2D;
   b.y2D = e2->y2D - e1->y2D;

   return ( ( a.x2D * b.y2D ) - ( a.y2D * b.x2D ) );
}



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
    uint32_t     i;
    uint32_t     rv;
    tgfPoint3D   pa;
    tgfPoint3D   pb;
    tgfPoint3D   pc;
    uint32_t     hwTriangleArea;
    uint32_t     hwTriangleAreaInv;
    uint32_t     swTriangleArea;
    uint32_t     swTriangleAreaInv;
    
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
        printf( "\nCan't alloc screen\n" );
        do{}while( 1 );
    } 
        
    
    zBuffer.width            = 320;
    zBuffer.rowWidth         = 512;
    zBuffer.height           = 240;
        
    zBuffer.flags            = 0;
    zBuffer.transparentColor = 0;
    zBuffer.buffer           = osAlloc( zBuffer.rowWidth * zBuffer.height * 2, OS_ALLOC_MEMF_CHIP );
    
    if( zBuffer.buffer == NULL )
    {
        printf( "\nCan't alloc z-buffer\n" );
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


    printf( "Blitter test. Blitter id: %08x, version: %08x\n", blt->id, blt->version );
    
    gfLoadBitmapFS( &bmp, (char*)"0:/demos/ida.gbm" );

    fillTest();

    waitKey();

    copyTest();

    waitKey();

    //clear zbuffer
    gfFillRect( &zBuffer, 0, 0, zBuffer.width - 1, zBuffer.height - 1, 1500 /*0xffff*/ );

    blt->daAddress  = (uint32_t)screen.buffer;
    blt->dbAddress  = (uint32_t)zBuffer.buffer;

    blt->bbXMin = 0;
    blt->bbXMax = 319;
    blt->bbYMin = 0;
    blt->bbYMax = 239;

    blt->aX     = 160;
    blt->aY     = 10;
    blt->aZ     = 100;
    
    blt->bX     = 310;
    blt->bY     = 229;
    blt->bZ     = 2000;

    blt->cX     = 10;
    blt->cY     = 229;
    blt->cZ     = 100;          //triggers triangleArea and triangleAreaInv calculations

    blt->aIt0   = 255;
    blt->aIt1   = 0;
    blt->aIt2   = 0;

    blt->bIt0   = 0;
    blt->bIt1   = 255;
    blt->bIt2   = 0;

    blt->cIt0   = 0;
    blt->cIt1   = 0;
    blt->cIt2   = 255;

    hwTriangleArea = blt->triangleArea;

    blt->command = 0x0510;      

    printf( "hw triangleArea: %d\n", hwTriangleArea );

    pa.x2D      = 160;
    pa.y2D      = 10;

    pb.x2D      = 310;
    pb.y2D      = 229;

    pc.x2D      = 10; 
    pc.y2D      = 229;

    swTriangleArea = gouraudEdge( &pc, &pb, &pa );
    printf( "sw triangleArea: %d\n\n", swTriangleArea );

    hwTriangleAreaInv = blt->triangleAreaInv;

    printf( "hw triangleAreaInv: %d\n", hwTriangleAreaInv );
    
    swTriangleAreaInv = 0xffffffff / swTriangleArea;

    printf( "sw triangleAreaInv: %d\n", swTriangleAreaInv );



    printf( "done - press Pause to reboot\n" );


    do
    {
        waitKey();
        
    }while( 1 );
    

} 
