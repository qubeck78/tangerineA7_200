#ifndef _GFDRAWING_H
#define _GFDRAWING_H

#ifdef __cplusplus
extern "C" 
{
#endif


#include "gfTypes.h"
#include "gfBitmap.h"

// B 4:0
// 76543210
//    76543

// G 10:5
// 1
// 09876543210
//    76543210
// 765432

// R 15:11
// 111111
// 5432109876543210
//         76543210
//         76543
// 76543

#define gfColor( r, g, b ) ( uint16_t )((((uint16_t)b >> 3) & 31 ) | (((uint16_t)g & 252 ) << 3 ) | (((uint16_t)r & 248 ) << 8 ))
#define gfColorGetR( color ) ( uint16_t )(( color >> 8) & 0xf8 )
#define gfColorGetG( color ) ( uint16_t )(( color >> 3) & 0xfc )
#define gfColorGetB( color ) ( uint16_t )(( color << 3) & 0xf8 )


uint32_t gfPlot( tgfBitmap *bmp, int16_t x, int16_t y, uint16_t color );
#define gfPlotF( bmp, x, y, color) (( uint16_t* ) bmp->buffer )[ x + ( bmp->rowWidth * y ) ] = color;
uint32_t gfPlotA( tgfBitmap *bmp, int16_t x, int16_t y, uint16_t color, uint8_t alpha );
uint32_t gfPlotA2C( tgfBitmap *bmp, int16_t x, int16_t y, uint16_t color1, uint16_t color2, uint8_t alpha );

uint16_t gfGetPixel( tgfBitmap *bmp, int16_t x, int16_t y );


uint32_t gfLine( tgfBitmap *bmp, int16_t x1, int16_t y1, int16_t x2, int16_t y2, uint16_t color );
uint32_t gfCircle( tgfBitmap *bmp, int16_t xm, int16_t ym, int16_t r, uint16_t color );
uint32_t gfEllipse( tgfBitmap *bmp, int16_t x1, int16_t y1, int16_t x2, int16_t y2, uint16_t color );
uint32_t gfFillRect( tgfBitmap *bmp, int16_t x1, int16_t y1, int16_t x2, int16_t y2, uint16_t color );

#ifdef __cplusplus
}
#endif

#endif
