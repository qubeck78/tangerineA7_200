
#include "modPlayer.h"

#include <cstdio>

//HxCModPlayer
//https://github.com/jfdelnero/HxCModPlayer

//sdl audio
////https://gist.github.com/armornick/3447121

#include "hxcmod.h"

#include "../gfxLib/bsp.h"

#include "../gfxLib/osAlloc.h"
#include "../gfxLib/osFile.h"
#include "../gfxLib/gfFont.h"
#include "../gfxLib/osUIEvents.h"


#include "shellUI.h"


modcontext  modctx;
short      *audioData;
uint32_t       audioDataLength;
short      *audioDataL;
short      *audioDataH;
short      *audioModData;
uint32_t       audioModDataLength;

uint32_t mpInit()
{
   uint32_t rv;

   rv = 0;

   //config audio
   
   //i2s freq 48kHz @ 100Mhz base clock
   aud->i2sClockConfig  = 0x00410020;

   //fifo read div to 2 ( 24kHz frequency )
   aud->fifoReadConfig  = 0x1;

   //stop dma
   aud->audioDmaConfig  = 0x00;

   //alloc audio buffer
   audioDataLength      = 16384;   //8K samples

   audioData            = (short*)osAlloc( audioDataLength * 2, OS_ALLOC_MEMF_CHIP ); 

   audioDataL           = &audioData[0];
   audioDataH           = &audioData[audioDataLength / 4];

   //init hxcmod
   hxcmod_init( &modctx );

   //config hxcmod
   hxcmod_setcfg( &modctx, 48000 / 2, 0, 0 );

   return rv;
}

uint32_t mpPlay( char *fileName )
{
   uint32_t    rv;
   tosUIEvent  event; 
   tosFile     in;
   uint32_t    nbr;
   uint32_t    audioDmaStatus;
   uint32_t    quitPlayer;
   char        buf[60];
   uint32_t    i;
   uint32_t    j;


   //init hxcmod
   hxcmod_init( &modctx );

   //config hxcmod
   hxcmod_setcfg( &modctx, 48000 / 2, 0, 0 );


   uiDrawInfoWindow( (char*)"Loading", fileName, _UI_INFO_WINDOW_BUTTONS_NONE );


   audioModDataLength = osFSize( fileName );

   if( audioModDataLength  == 0 )
   {
      return 1;
   }

   audioModData = (short*)osAlloc( audioModDataLength, OS_ALLOC_MEMF_CHIP );

   if( !audioModData )
   {
      return 1;
   }

   if( osFOpen( &in, fileName, OS_FILE_READ ) )
   {

      osFree( audioModData );
      audioModData = NULL;

      return 1;

   }

   osFRead( &in, (uint8_t*)audioModData, audioModDataLength, &nbr );

   osFClose( &in );

   hxcmod_load( &modctx, (void*)audioModData, audioModDataLength  );

   //pre-fill lower part of the buffer
   //length in samples ( 16-bit) -> half of the buffer
   hxcmod_fillbuffer( &modctx, audioDataL, audioDataLength / 8, NULL ); 



   //play audio buffer :)
   aud->audioDmaPointer = ( (uint32_t)audioData - _SYSTEM_MEMORY_BASE ) / 4;
   aud->audioDmaLength  = ( audioDataLength / 4 ) - 1;      //32 bit tranfer, 2 samples per count ( l + r )
   aud->audioDmaConfig  = 0x04 | 0x02;                      //start dma transfer, looping enabled, mode: stereo 


   quitPlayer = 0;

   do
   {


      if( modctx.song.length > 0 )
      {
         j =  modctx.tablepos * 40 / modctx.song.length;
      }
      else
      {
         j = 0;
      }

      strcpy( buf, "" );
      for( i = 0; i < 40; i++ )
      {
         if( i >= j )
         {
            strcat( buf, "\xb0" );
         }
         else
         {
            strcat( buf, "\xb1" );
         }
      }

      uiDrawInfoWindow( fileName, buf, _UI_INFO_WINDOW_BUTTONS_NONE );

      do
      {
         audioDmaStatus = aud->audioDmaStatus;
      }while( audioDmaStatus & 2 );

      //lower part of buffer is played, fill upper
      hxcmod_fillbuffer( &modctx, audioDataH, audioDataLength / 8, NULL );

      do
      {
         audioDmaStatus = aud->audioDmaStatus;
      }while( ( ! (audioDmaStatus & 2 ) ) );

      //upper part of buffer is played, fill lower
      hxcmod_fillbuffer( &modctx, audioDataL, audioDataLength / 8, NULL );

   
      while( !osGetUIEvent( &event ) )
      { 
         if( event.type == OS_EVENT_TYPE_KEYBOARD_KEYPRESS )
         {

               aud->audioDmaConfig  = 0x00;  //stop audio dma                  
               quitPlayer = 1;

         }
      }

   }while( !quitPlayer );

   osFree( audioModData );
   audioModData = NULL;

   return 0;
}
