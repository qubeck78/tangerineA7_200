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

char buf[256];


//sw  fp - 136035ms
//hw  fp -  39763ms
//hw2 fp -  15979ms

int animLeds( int j )
{   

    #if defined( _GFXLIB_RISCV_FATFS )
        switch( j % 2 )
        {
            case 0:
                bsp->gpoPort |= 0x00f0;
                bsp->gpoPort ^= 0x0010;
            
                break;

            case 1:

                bsp->gpoPort |= 0x00f0;
                bsp->gpoPort ^= 0x0020;
            
                break;

        }

    #endif      
    return 0;
} 


//mandelbrot browser: https://mandel.gart.nz/
uint32_t mandelbrot( tgfBitmap *bmp, float xmin, float ymin, float dx, float dy )
{
    uint32_t    x;
    uint32_t    y;
    
    float       ci;
    float       cr;
    float       zr;
    float       zi;
    float       zrr;
    float       zii;
    float       zri;
    
    int32_t     iter;
    
    uint16_t    r;
    uint16_t    g;
    uint16_t    b;
    
    ci = ymin;
    
    for( y = 0; y < bmp->height; y++ )
    {
    
        animLeds( y );
        
        cr = xmin;
        
        for( x = 0; x < bmp->width; x++ )
        {
        
            zr = cr;
            zi = ci;
            
            iter = 32;
            
            while( iter > 0 )
            {
            
                zrr = zr * zr;
                zii = zi * zi;
                zri = 2.0 * ( zr * zi );
                
                zr = zrr - zii + cr;
                zi = zri + ci;
                
                if( zrr + zii > 4.0 )
                {
                    break;
                }
                iter--;
            
            }
        
            if( iter == 0 )
            {
                r = 0;
                g = 0;
                b = 0;
            }
            else
            {
        
                r = ( 32 - iter ) << 3;
                g = 0;
                b = r;
            }
            gfPlot( bmp, x, y, gfColor( r, g, b ) );
            
            cr += dx;
            
        }
        
        ci += dy;
    }

    return 0;
}

uint32_t ffMandelbrot( tgfBitmap *bmp, uint16_t colorMask, float xmin, float ymin, float dx, float dy )
{
    uint32_t    x;
    uint32_t    y;
    
    float       ci;
    float       cr;
    float       zr;
    float       zi;
    float       zrr;
    float       zii;
    float       zri;
    
    float       zrmzi;
    
    int32_t     iter;
    uint16_t    color;
    
    uint16_t    r;
    uint16_t    g;
    uint16_t    b;
    
    
    if( ( colorMask & 3 ) == 0 )
    {
        colorMask = 1;
    }
    
    ci = ymin;
    
    for( y = 0; y < bmp->height; y++ )
    {
        //animLeds( y );
        
        cr = xmin;
        
        for( x = 0; x < bmp->width; x++ )
        {
        
            zr = cr;
            zi = ci;
            
            iter = 32;
            
            while( iter > 0 )
            {
            
                zrr = ffMul( zr, zr );
                //zrr = zr * zr;
                zii = ffMul( zi, zi );
                
                //zii = zi * zi;
            
                zrmzi   = ffMul( zr, zi );
                zri     = ffMul( 2.0f, zrmzi );
                
                //zri = 2.0f * ( zr * zi );
                
                zr      = ffSub( zrr, zii );
                zr      = ffAdd( zr, cr );
                
                //zr = zrr - zii + cr;
                
                zi      = ffAdd( zri, ci );
                //zi = zri + ci;
                
                if( ffAdd( zrr, zii ) > 4.0f )
//              if( zrr + zii > 4.0f )
                {
                    break;
                }
                iter--;
            
            }
        
            if( iter == 0 )
            {
                color = 0;
            }
            else
            {
                color = ( 32 - iter ) << 3;
            }

            if( colorMask & 1 )
            {
                r = color;
            }
            else
            {
                r = 0;
            }
            
            if( colorMask & 2 )
            {
                g = color;
            }
            else
            {
                g = 0;
            }
            
            if( colorMask & 4 )
            {
                b = color;
            }
            else
            {
                b = 0;
            }

            gfPlot( bmp, x, y, gfColor( r, g, b ) );

            cr = ffAdd( cr, dx );
            //cr += dx;
            
        }
        
        ci = ffAdd( ci, dy );
        //ci += dy;
    }

    return 0;
}

int main()
{
    uint32_t    i;
    uint32_t    rv;
    uint32_t    startTicks;
    uint32_t    endTicks;
    tosUIEvent  event; 

    bspInit();
    
    setVideoMode( _VIDEOMODE_640_TEXT80_OVER_GFX );
    
    //alloc screen buffers
    screen.width            = 640;
    screen.rowWidth         = 1024;
    screen.height           = 480;
    
    
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
   // osUIEventsInit();   
    
    toPrintF( &con, (char*)"Mandelbrot set example\n" );

    startTicks = getTicks();

    ffMandelbrot( &screen, 7, -2.0f, -1.0f, 0.00425f, 0.00425f );

    endTicks = getTicks();

    toPrintF( &con,  (char*)"Time: %d ms\n", (uint32_t)( endTicks - startTicks ) );
    

    delayMs( 30000 );

    con.textAttributes = 0x0f;

    toCls( &con );

    con.textAttributes = 0x8f;
      

    do
    {
        ffMandelbrot( &screen, ( randomNumber() >> 7 ) & 7, -1.7f + ((uint32_t)randomNumber() ) / 3294967296.0f ,  -1.7f + ((uint32_t)randomNumber() ) / 3294967296.0f , 0.001f, 0.001f );

/*        while( !osGetUIEvent( &event ) )
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
*/

        delayMs( 1000 );
        
    }while( 1 );
    

} 