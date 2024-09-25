#ifndef _GFJPEG_H
#define _GFJPEG_H

#include "gfTypes.h"
#include "picojpeg.h"

#include "gfDrawing.h"
#include "gfBitmap.h"
#include "osAlloc.h"
#include "osFile.h"


uint32_t gfJPEGDecode( uint8_t *jpegBuf, uint32_t jpegBufSize, tgfBitmap *bmp );
uint32_t gfLoadJPEGFS( tgfBitmap *bmp, char *jpegFileName );



#endif
