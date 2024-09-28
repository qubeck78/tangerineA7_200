#include "gfAudio.h"


uint32_t gfAudioInit()
{
   if( aud->id != 0x80000007 )
   {
      return 1;
   }

   //stop dma
   aud->audioDmaConfig  = 0x00;

   return 0;
}

uint32_t gfAudioConfigure( uint32_t samplingRate, uint32_t samplingRateDivisor )
{

   samplingRateDivisor &= 0xff;

   if( samplingRateDivisor == 0 )
   {
      return 1;
   }

   aud->fifoReadConfig = samplingRateDivisor - 1;

   switch( samplingRate )
   {

      case GF_AUDIO_SAMPLING_RATE_48000:

         //i2s freq 48kHz @ 100Mhz base clock ( base freq: 1536000 Hz )
         aud->i2sClockConfig  = 0x00410020;

         break;

      case GF_AUDIO_SAMPLING_RATE_44100:

         //i2s freq 44.1kHz @ 100Mhz base clock ( base freq: 1411200 Hz )
         aud->i2sClockConfig  = 0x00470023;

         break;

      default:

         return 1;
   }

   return 0;
}

uint32_t gfAudioStopDMA()
{
   aud->audioDmaConfig  = 0;
   return 0;
}

uint32_t gfAudioPlayDMA( int16_t *buffer, uint32_t length, uint32_t format, uint32_t flags )
{
   uint32_t dmaConfig;

   length = ( length >> 2 );   //32-bit transfer, 2 samples per count ( l + r for stereo, or 2 mono )

   if( length == 0 )
   {
      aud->audioDmaConfig  = 0;
      return 1;
   }

   length -= 1;
   

   dmaConfig = 0;

   if( flags & GF_AUDIO_FLAG_DMA_LOOP )
   {
      dmaConfig |= 0x04;
   }

   aud->audioDmaPointer = ( uint32_t )buffer;
   aud->audioDmaLength = length;

   switch( format )
   {

      case GF_AUDIO_FORMAT_MONO_16BIT:

         dmaConfig |= 0x01;
         break;

      case GF_AUDIO_FORMAT_STEREO_16BIT:

         dmaConfig |= 0x02;
         break;

      default:
         return 1;
   
   }

   aud->audioDmaConfig = dmaConfig;


   return 0;
}


