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
#include "../gfxLib/gfGouraud.h"
#include "../gfxLib/gfJPEG.h"
#include "../gfxLib/osUIEvents.h"
#include "../gfxLib/usbHID.h" 
#include "../gfxLib/ff.h" 

#define SLIDESHOW_ALPHA_ANIMATION

extern BSP_T                *bsp;


extern tgfTextOverlay        con;
tgfBitmap                    screen;
tgfBitmap                    background;
tgfBitmap                    fileBmp;
tgfBitmap                    cursor;

char                         buf[ 128 ];
char                         lfnBuf[ 512 + 16];

tosDir                       dir;
tosDirItem                   dirItem;

uint32_t                     numDirEntries;


extern "C" void *malloc( size_t size )
{
    return osAlloc( size, OS_ALLOC_MEMF_CHIP ); 
}

extern "C" void free( void *mem )
{
    osFree( mem ); 
}

extern "C" void* realloc( void *oldmem, size_t bytes )
{
    return osRealloc( oldmem, bytes, OS_ALLOC_MEMF_CHIP );
}


uint32_t getNumEntries()
{
    uint32_t rv;
    uint32_t numEntries;

    #ifdef _GFXLIB_SDL

    rv = osDirOpen( &dir, (char*)"./img" );

    #else

    rv = osDirOpen( &dir, (char*)"0:img" );
    
    #endif

    printf( "Dir open\n" );

    numEntries = 0;

    do
    {
        rv = osDirRead( &dir, &dirItem );

        if( rv ) 
        {
            break; // Error or end of dir
        }

        printf( "%s\n", dirItem.name );

        numEntries++;

    }while( 1 );

    osDirClose( &dir );

    printf( "%d entries\n", numEntries );

    return numEntries;
}

uint32_t getEntry( uint32_t entryNumber )
{
    uint32_t i;
    uint32_t rv;
    
    #ifdef _GFXLIB_SDL

    rv = osDirOpen( &dir, (char*)"./img" );

    #else

    rv = osDirOpen( &dir, (char*)"0:img" );
    
    #endif


    for( i = 0; i < entryNumber; i++ )
    {

        osDirRead( &dir, &dirItem );

    }

    osDirClose( &dir );

    return 0;
}


uint32_t slideshow()
{
    uint32_t        rv;
    uint32_t        i;
    int16_t         x;
    int16_t         y;
    char            extension[8];
    tosUIEvent      event;
    

    do{
        
        getEntry( randomNumber() % numDirEntries );

            
        if ( dirItem.type != OS_DIRITEM_DIR )
        {

            i = strlen( dirItem.name );
        
            if( i >= 4 )
            {
                extension[0] = dirItem.name[ i - 4 ];
                extension[1] = dirItem.name[ i - 3 ];
                extension[2] = dirItem.name[ i - 2 ];
                extension[3] = dirItem.name[ i - 1 ];
                extension[4] = 0;
                
                if( ( strcmp( extension, ".jpg" ) == 0 ) || ( strcmp( extension, ".gbm" ) == 0 ) )
                {
                
                    
                    strcpy( buf, "img/" );
                    strcat( buf, dirItem.name );

                    con.textAttributes = 0x0f;
                    toCls( &con );
                    con.textAttributes  = 0x8f;

                    printf( "Loading:%s\n", dirItem.name );

                    if( dirItem.name[ i - 3 ] == 'g' )
                    {
                        gfLoadBitmapFS( &fileBmp, buf );
                    }
                    else
                    {
                        gfLoadJPEGFS( &fileBmp, buf );                      
                    }
                    

                    if( screen.width > 512 )
                    {                       
                        x  = ((uint32_t)randomNumber() ) % 320;
                        y  = ((uint32_t)randomNumber() ) % 240;
                        
                    }
                    else
                    {
                    
                        x = ( screen.width / 2 ) - ( fileBmp.width / 2);
                        y = ( screen.height / 2 ) - ( fileBmp.height / 2 );
                    }



                    #ifdef SLIDESHOW_ALPHA_ANIMATION

                    background.width            = fileBmp.width;
                    background.height           = fileBmp.height;
                    background.rowWidth         = background.width;
                    background.flags            = 0;
                    background.transparentColor = 0;
                    background.buffer           = osAlloc( background.rowWidth * background.height * 2, OS_ALLOC_MEMF_CHIP );

                    gfBlitBitmapSrcRect( &background, &screen, x, y, background.width, background.height, 0, 0 );
  

                    for( i = 0; i < 256; i += 8 )
                    {       
                        do{}while( ! bsp->videoVSync ); 
                        gfBlitBitmapA2Src( &screen, &fileBmp, &background, x, y, i );
                    }

                    osFree( background.buffer );                    
                    background.buffer   = NULL;

                    #endif
                    
                    gfBlitBitmap( &screen, &fileBmp, x, y );

                    osFree( fileBmp.buffer );
                    
                    fileBmp.buffer          = NULL;
                    con.textAttributes      = 0x0f;
                    
                    toCls( &con );
                    con.textAttributes      = 0x8f;
                    
                    printf( "%s %d\n", dirItem.name, dirItem.size );
                    
                    for( i = 0; i < 500; i++ )
                    {
                        delayMs( 20 );
                                        
                        if( !osGetUIEvent( &event ) )
                        { 
                            if( event.type == OS_EVENT_TYPE_KEYBOARD_KEYPRESS )
                            {
                                switch( event.arg1 )
                                {
                                
                                    case _KEYCODE_PAUSE:

                                        reboot();
                                        break; 

                                    case _KEYCODE_F1:

                                        break;

                                    default:

                                        //exit delay loop
                                        i = 500;
                                        break;
                                }
                            }

                        }
                    }
                }
            }
        }
            
    }while( 1 );

}


int main()
{
    uint32_t    i;
    uint32_t    rv;


    bspInit();
        

    
    setVideoMode( _VIDEOMODE_640_TEXT80_OVER_GFX );

    //alloc screen buffers
    screen.width            = 640;
    screen.rowWidth         = 1024;
    screen.height           = 480;


    toCls( &con );
    printf( "tangerineRISC-V SOC Slideshow B20241017\n\n" );

    
    screen.flags            = 0;
    screen.transparentColor = 0;

    screen.buffer           = osAlloc( screen.rowWidth * screen.height * 2, OS_ALLOC_MEMF_CHIP ); 
    
    if( screen.buffer == NULL )
    {
        printf( "\nERROR: Can't alloc screen\n" );
        do{}while( 1 );
    } 
        
    
    //display first buffer
    
    gfDisplayBitmap( &screen );

    gfFillRect( &screen, 0, 0, screen.width - 1, screen.height - 1 , gfColor( 0, 0, 0 ) ); 


    //init events queue
    osUIEventsInit();  

    //init filesystem
    rv = osFInit();


    if( rv )
    {
        toPrint( &con, ( char* )"SD init error!" );
        
        do{
        }while( 1 );        
    }
    else
    {
        toPrint( &con, ( char* )"SD init ok\n" );
    }

    gfLoadBitmapFS( &cursor, (char*)"0:/sys/cursor.gbm" );
    usbHIDSetMousePointerShape( &cursor );

    usbHIDSetMousePointerVisibility( 1 );        

    toPrint( &con, (char*)"Scanning /img directory\n" );

    numDirEntries = getNumEntries();


    if( numDirEntries )
    {
        slideshow();
    }

    reboot();
} 
