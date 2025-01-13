#ifndef _GFBITMAP_H
#define _GFBITMAP_H

#ifdef __cplusplus
extern "C" 
{
#endif

#include "gfTypes.h"


#define GF_BITMAP_FLAG_TRANSPARENT  1
#define GF_BITMAP_FLAG_BIG_ENDIAN   2

typedef struct _tgfBitmap
{
	//Bitmap width
	uint16_t   width;

	//Total bitmap width ( with optional margin to align rows in memory )
	uint16_t	 rowWidth;
	
	//Bitma[] height
	uint16_t   height;

	//Flags
	uint16_t   flags;

	//Transparent color
	uint16_t   transparentColor;

	//Graphics data buffer pointer
	void    *buffer;

}tgfBitmap;


uint32_t gfDisplayBitmap( tgfBitmap *bmp );

uint32_t gfLoadBitmapFS( tgfBitmap *dest, char *fileName );

uint32_t gfBlitBitmap( tgfBitmap *dest, tgfBitmap *src, int16_t x, int16_t y );
uint32_t gfBlitBitmapSrcRect( tgfBitmap *dest, tgfBitmap *src, int16_t sx, int16_t sy, int16_t bw, int16_t bh, int16_t x, int16_t y );
uint32_t gfBlitBitmapA( tgfBitmap *dest, tgfBitmap *src, int16_t x, int16_t y, uint8_t alpha );
uint32_t gfBlitBitmapA2Src( tgfBitmap *dest, tgfBitmap *src1, tgfBitmap *src2, int16_t x, int16_t y, uint8_t alpha );
uint32_t gfBlitScaledBitmap( tgfBitmap *dest, tgfBitmap *src, int16_t x, int16_t y, int16_t w, int16_t h );



#ifdef __cplusplus
}
#endif

#endif
