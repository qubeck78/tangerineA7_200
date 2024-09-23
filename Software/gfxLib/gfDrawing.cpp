#include "gfDrawing.h"
#include <math.h>

//http://members.chello.at/easyfilter/bresenham.html

#if defined ( _GFXLIB_RISCV_FATFS )

#include "bsp.h"

extern BSP_T *bsp;   //registers

#endif


uint32_t gfPlot( tgfBitmap *bmp, int16_t x, int16_t y, uint16_t color )
{
   uint16_t  *fb;

   if( bmp == NULL ) return 1;
   if( x < 0 ) return 1;
   if( y < 0 ) return 1;
   if( x >= bmp->width )   return 1;
   if( y >= bmp->height )  return 1;

   fb = (uint16_t *)bmp->buffer;
   fb[ x + ( bmp->rowWidth * y ) ] = color;

   return 0;
}

uint16_t gfGetPixel( tgfBitmap *bmp, int16_t x, int16_t y )
{
   uint16_t  *fb;

   if( bmp == NULL ) return 0;
   if( x < 0 ) return 0;
   if( y < 0 ) return 0;
   if( x >= bmp->width )   return 0;
   if( y >= bmp->height )  return 0;

   fb = (uint16_t *)bmp->buffer;
   return fb[ x + ( bmp->rowWidth * y ) ];
}

uint32_t gfPlotA( tgfBitmap *bmp, int16_t x, int16_t y, uint16_t color, uint8_t alpha )
{
   uint16_t  *fb;
   uint16_t  basePixelColor;
   uint32_t    r, g, b;

   if( bmp == NULL ) return 1;
   if( x < 0 ) return 1;
   if( y < 0 ) return 1;
   if( x >= bmp->width )   return 1;
   if( y >= bmp->height )  return 1;

   fb = (uint16_t *)bmp->buffer;



   basePixelColor = fb[ x + ( bmp->rowWidth * y ) ];

   r = gfColorGetR( basePixelColor ) * ( 255 - alpha );
   g = gfColorGetG( basePixelColor ) * ( 255 - alpha );
   b = gfColorGetB( basePixelColor ) * ( 255 - alpha );

   r += gfColorGetR( color ) * alpha;
   g += gfColorGetG( color ) * alpha;
   b += gfColorGetB( color ) * alpha;

   r = r >> 8;
   g = g >> 8;
    b = b >> 8;

   fb[ x + ( bmp->rowWidth * y ) ] = gfColor( r, g, b );

   return 0;
}


uint32_t gfPlotA2C( tgfBitmap *bmp, int16_t x, int16_t y, uint16_t color1, uint16_t color2, uint8_t alpha )
{
   uint16_t  *fb;
   uint32_t    r, g, b;

   if( bmp == NULL ) return 1;
   if( x < 0 ) return 1;
   if( y < 0 ) return 1;
   if( x >= bmp->width )   return 1;
   if( y >= bmp->height )  return 1;

   fb = (uint16_t *)bmp->buffer;


   r = gfColorGetR( color2 ) * ( 255 - alpha );
   g = gfColorGetG( color2 ) * ( 255 - alpha );
   b = gfColorGetB( color2 ) * ( 255 - alpha );

   r += gfColorGetR( color1 ) * alpha;
   g += gfColorGetG( color1 ) * alpha;
   b += gfColorGetB( color1 ) * alpha;

   r = r >> 8;
   g = g >> 8;
   b = b >> 8;

   fb[ x + ( bmp->rowWidth * y ) ] = gfColor( r, g, b );

   return 0;

}


uint32_t gfLine( tgfBitmap *bmp, int16_t x1, int16_t y1, int16_t x2, int16_t y2, uint16_t color )
{

   int16_t dx;
   int16_t dy;
   int16_t   sx;
   int16_t   sy;
   int16_t   err;
   int16_t   e2;

   dx = gfAbs( x2 - x1 );
   sx =  x1<x2 ? 1: -1;

   dy = -gfAbs( y2 - y1 );
   sy = y1<y2 ? 1: -1;

   err = dx + dy;

   for( ;; )
   {
      gfPlot( bmp, x1, y1, color );

      if( ( x1 == x2 ) && ( y1 == y2 ) )
      {
         break;
      }

      e2 = 2 * err;

      if( e2 >= dy )
      {
         err += dy;
         x1 += sx;
      }

      if( e2 <= dx )
      {
         err += dx;
         y1 += sy;
      }

   }

   return 0;
}

uint32_t gfCircle( tgfBitmap *bmp, int16_t xm, int16_t ym, int16_t r, uint16_t color )
{
   int16_t x = -r;
   int16_t y = 0;
   int16_t err = 2 - 2 * r; /* II. Quadrant */

   do
   {
     gfPlot( bmp, xm - x, ym + y, color ); /*   I. Quadrant */
     gfPlot( bmp, xm - y, ym - x, color ); /*  II. Quadrant */
     gfPlot( bmp, xm + x, ym - y, color ); /* III. Quadrant */
     gfPlot( bmp, xm + y, ym + x, color ); /*  IV. Quadrant */

     r = err;

     if(r <= y )
     {
      err += ++y * 2 + 1;           /* e_xy+e_y < 0 */
     }

     if(r > x || err > y )
     {
      err += ++x * 2 + 1; /* e_xy+e_x > 0 or no 2nd y-step */
     }

   }while( x < 0 );

   return 0;
}

uint32_t gfEllipse( tgfBitmap *bmp, int16_t x1, int16_t y1, int16_t x2, int16_t y2, uint16_t color )
{

   int32_t a = gfAbs( x2 - x1 );
   int32_t b = gfAbs( y2 - y1 );
   int32_t b1 = b & 1; /* values of diameter */

   int32_t dx = 4 * ( 1 - a )* b * b;
   int32_t dy = 4 * ( b1 + 1 ) * a * a; /* error increment */
   int32_t err = dx + dy + ( b1 * a * a );
   int32_t e2; /* error of 1.step */

   if( x1 > x2 )
   {

      x1 = x2;
      x2 += a;

   } /* if called with swapped points */



   if( y1 > y2 )
   {
      y1 = y2; /* .. exchange them */
   }

   y1 += ( b + 1 ) / 2;
   y2 = y1 - b1;   /* starting pixel */

   a *= 8 * a;
   b1 = 8 * b * b;

   do
   {
      gfPlot( bmp, x2, y1, color ); /*   I. Quadrant */
      gfPlot( bmp, x1, y1, color ); /*  II. Quadrant */
      gfPlot( bmp, x1, y2, color ); /* III. Quadrant */
      gfPlot( bmp, x2, y2, color ); /*  IV. Quadrant */

      e2 = 2 * err;
      if( e2 <= dy )
      {
         y1++;
         y2--;
         //err += dy += a;

         dy += a;
         err +=  dy;

      }  /* y step */

      if( ( e2 >= dx ) || ( 2 * err > dy ) )
      {
         x1++;
         x2--;

         //err += dx += b1;
         dx += b1;
         err += dx;
      } /* x step */

   }while( x1 <= x2);

   while( ( y1 - y2 ) < b )
   {  /* too early stop of flat ellipses a=1 */
      gfPlot( bmp, x1 - 1, y1, color ); /* -> finish tip of ellipse */
      gfPlot( bmp, x2 + 1, y1++, color );
      gfPlot( bmp, x1 - 1, y2, color );
      gfPlot( bmp, x2 + 1, y2--, color );
   }


   return 0;
}


uint32_t gfFillRect( tgfBitmap *bmp, int16_t x1, int16_t y1, int16_t x2, int16_t y2, uint16_t color )
{
   int16_t     x;
   int16_t     y;
   uint16_t   *fb;
   int16_t     bw;
   int16_t     bh;
   
   if( !bmp ) return 1;

   if( x1 < 0 ) x1 = 0;
   if( y1 < 0 ) y1 = 0;
   if( x2 < 0 ) x2 = 0;
   if( y2 < 0 ) y2 = 0;

   if( x1 >= bmp->width ) x1 = bmp->width - 1;
   if( y1 >= bmp->height ) y1 = bmp->height - 1;
   if( x2 >= bmp->width ) x2 = bmp->width - 1;
   if( y2 >= bmp->height ) y2 = bmp->height - 1;

   if( y1 > y2 )
   {
      x = y2;
      y2 = y1;
      y1 = x;
   }

   if( x1 > x2 )
   {
      x = x2;
      x2 = x1;
      x1 = x;
   }

   

   #if defined ( _GFXLIB_RISCV_FATFS ) && defined ( _GFXLIB_HW_BLITTER_2D )
   
      //use blitter
      
      bw = x2 - x1 + 1;
      bh = y2 - y1 + 1;
      
      blt->daAddress       = (uint32_t)bmp->buffer + ( y1 * ( bmp->rowWidth << 1 ) + ( x1 << 1 ) );
      blt->daRowWidth      = bmp->rowWidth;
      blt->daWidth         = bw;
      blt->daHeight        = bh;
      blt->input0          = color;

      blt->command         = 0x0100;
      
      while( ! ( blt->command & 1 ) );

   #else

   for( y = y1; y <= y2; y++ )
   {
      fb = &((uint16_t*)bmp->buffer)[ y * bmp->rowWidth + x1 ];

      for( x = x1; x <= x2; x++ )
      {
         *fb++ = color;
      }
   }
   
   #endif
   return 0;
}

