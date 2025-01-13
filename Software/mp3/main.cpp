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
#include "gfAudio.h"
#include "osUIEvents.h"
#include "mp3dec.h"

extern BSP_T                *bsp;
extern tgfTextOverlay        con;

tosFile                      in;



extern "C" void *malloc( size_t size )
{
    printf( "malloc: %d\n", size );

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
    uint32_t         i;
    uint32_t         rv;
    uint32_t         nbr;

    MP3FrameInfo     mp3FrameInfo;
    HMP3Decoder      hMP3Decoder; 
    char             mp3FileName[256];

    uint32_t         mp3Size;
    int              bytesLeft;
    int16_t         *audioBuffer;
    uint8_t         *mp3Buffer;
    uint8_t         *currentMp3;
    int32_t          offset;
    uint32_t         frameSize;

    bspInit();
        
    
    //setVideoMode( _VIDEOMODE_320_TEXT80_OVER_GFX );
    setVideoMode( _VIDEOMODE_TEXT80_ONLY );

    con.textAttributes = 0x0f;

    toCls( &con );
    printf( "MP3 B20250106\n\n" );

    
    //init events queue
    osUIEventsInit();  

    //init filesystem
    rv = osFInit();
    if( rv )
    {
        printf( "SD init error! - press pause to reboot\n" );
        
        do{
            
            waitKey();

        }while( 1 );        
    }


    audioBuffer = ( int16_t * )osAlloc( 65536, OS_ALLOC_MEMF_CHIP );

    if( !audioBuffer )
    {
        printf( "can't alloc audio buffer - press pause to reboot\n" );
        
        do{
            
            waitKey();

        }while( 1 );        

    }

    hMP3Decoder = MP3InitDecoder();
    
    if( !hMP3Decoder )
    {
        printf( "Can't init mp3 decoder - press pause to reboot\n" );

        do{
            
            waitKey();

        }while( 1 );        
    }


    gfAudioInit();


    strcpy( mp3FileName, "0:/snd/interloper2.mp3" );
//    strcpy( mp3FileName, "0:/snd/pika.mp3" );
//    strcpy( mp3FileName, "0:/snd/starfish.mp3" );

    mp3Size = osFSize( mp3FileName );

    if( !mp3Size )
    {
        printf( "Can't get size of %s - press pause to reboot\n", mp3FileName );

        do{
            
            waitKey();

        }while( 1 );        

    }

    mp3Buffer   = (uint8_t*) osAlloc( mp3Size, OS_ALLOC_MEMF_CHIP );
    

    if( !mp3Buffer )
    {
        printf( "Can't alloc %d bytes for mp3 - press pause to reboot\n" );

        do{
            
            waitKey();

        }while( 1 );        

    }

    printf( "Loading\n" );

    if( osFOpen( &in, mp3FileName, OS_FILE_READ ) )
    {
        printf( "Can't open %s - press pause to reboot\n", mp3FileName );

        do{
            
            waitKey();

        }while( 1 );                
    }

    nbr = 0;

    osFRead( &in, mp3Buffer, mp3Size, &nbr );

    osFClose( &in );

    printf( "Playing %s\n", mp3FileName );


    bytesLeft       = mp3Size;
    currentMp3      = mp3Buffer;

    //decode first frame

    offset = MP3FindSyncWord( currentMp3, bytesLeft ) ;

    //todo check if offset < 0

    currentMp3  += offset;
    bytesLeft   -= offset;

    MP3Decode( hMP3Decoder,&currentMp3, &bytesLeft, &audioBuffer[0], 0 );
    MP3GetLastFrameInfo( hMP3Decoder, &mp3FrameInfo );

    frameSize = mp3FrameInfo.outputSamps;   

    gfAudioConfigure( GF_AUDIO_SAMPLING_RATE_44100, 2 );
    gfAudioPlayDMA( audioBuffer, frameSize * 4, GF_AUDIO_FORMAT_STEREO_16BIT, GF_AUDIO_FLAG_DMA_LOOP );

    while( bytesLeft > 0 )
    {

        do{
        }while( gfAudioDMAStatus() & GF_AUDIO_DMA_STATUS_SECOND_HALF );


        //lower part of buffer is played, fill upper

        offset = MP3FindSyncWord( currentMp3, bytesLeft ) ;
        
        if (offset < 0) 
        {
            break;
        }

        currentMp3  += offset;
        bytesLeft   -= offset;
 
        MP3Decode( hMP3Decoder,&currentMp3, &bytesLeft, &audioBuffer[frameSize], 0 );


        do{
        }while( ! ( gfAudioDMAStatus() & GF_AUDIO_DMA_STATUS_SECOND_HALF ) );

        //upper part of buffer is played, fill lower

        offset = MP3FindSyncWord( currentMp3, bytesLeft ) ;
        
        if (offset < 0) 
        {
            break;
        }

        currentMp3  += offset;
        bytesLeft   -= offset;
 
        MP3Decode( hMP3Decoder,&currentMp3, &bytesLeft, &audioBuffer[0], 0 );
    }

    printf( "done\n" );

    gfAudioStopDMA();

    do{
        waitKey();
        

    }while( 1 );


} 
