#ifndef _GFBITMAP_H
#define _GFBITMAP_H

#include "gfTypes.h"


#define GF_BITMAP_FLAG_TRANSPARENT  1
#define GF_BITMAP_FLAG_BIG_ENDIAN   2

typedef struct _tgfBitmap
{
	//Bitmap width
	ushort   width;

	//Total bitmap width ( with optional margin to align rows in memory )
	ushort	 rowWidth;
	
	//Bitma[] height
	ushort   height;

	//Flags
	ushort   flags;

	//Transparent color
	ushort   transparentColor;

	//Graphics data buffer pointer
	void    *buffer;

}tgfBitmap;


ulong gfDisplayBitmap( tgfBitmap *bmp );

ulong gfLoadBitmapFS( tgfBitmap *dest, char *fileName );

ulong gfBlitBitmap( tgfBitmap *dest, tgfBitmap *src, short x, short y );
ulong gfBlitBitmapSrcRect( tgfBitmap *dest, tgfBitmap *src, short sx, short sy, short bw, short bh, short x, short y );
ulong gfBlitBitmapA( tgfBitmap *dest, tgfBitmap *src, short x, short y, uchar alpha );
ulong gfBlitBitmapA2Src( tgfBitmap *dest, tgfBitmap *src1, tgfBitmap *src2, short x, short y, uchar alpha );
ulong gfBlitScaledBitmap( tgfBitmap *dest, tgfBitmap *src, short x, short y, short w, short h );




#endif
