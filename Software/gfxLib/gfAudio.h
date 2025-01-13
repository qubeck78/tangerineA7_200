#ifndef _GFAUDIO_H
#define _GFAUDIO_H

#ifdef __cplusplus
extern "C" 
{
#endif

#include "gfTypes.h"

#include "bsp.h"

#define GF_AUDIO_FORMAT_MONO_16BIT        1
#define GF_AUDIO_FORMAT_STEREO_16BIT      2

#define GF_AUDIO_SAMPLING_RATE_48000      48000
#define GF_AUDIO_SAMPLING_RATE_44100      44100

#define GF_AUDIO_FLAG_DMA_LOOP            1

#define GF_AUDIO_DMA_STATUS_FINISHED      1
#define GF_AUDIO_DMA_STATUS_SECOND_HALF   2

uint32_t gfAudioInit( void );
uint32_t gfAudioConfigure( uint32_t samplingRate, uint32_t samplingRateDivisor );
uint32_t gfAudioStopDMA( void );
uint32_t gfAudioPlayDMA( int16_t *buffer, uint32_t length, uint32_t format, uint32_t flags );

uint32_t inline gfAudioDMAStatus( void )
{
      return aud->audioDmaStatus;
}

#ifdef __cplusplus
}
#endif


#endif
