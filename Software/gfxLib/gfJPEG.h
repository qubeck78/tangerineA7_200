#ifndef _GFJPEG_H
#define _GFJPEG_H

#ifdef __cplusplus
extern "C" 
{
#endif

#include "gfTypes.h"
#include "picojpeg.h"

#include "gfDrawing.h"
#include "gfBitmap.h"
#include "osAlloc.h"
#include "osFile.h"


uint32_t gfJPEGDecode( uint8_t *jpegBuf, uint32_t jpegBufSize, tgfBitmap *bmp );
uint32_t gfLoadJPEGFS( tgfBitmap *bmp, char *jpegFileName );


#ifdef __cplusplus
}
#endif

#endif
