#include "gfBitmap.h"
#include "gfDrawing.h"
#include "osAlloc.h"
#include "osFile.h"


#if defined( _GFXLIB_RISCV_FATFS ) || defined( _GFXLIB_SDL )

#include "bsp.h"

#endif

ulong gfDisplayBitmap( tgfBitmap *bmp )
{
   
   #if defined( _GFXLIB_RISCV_FATFS )
   
   //bsp->dmaDisplayPointerStart = ( ulong )( ( ulong )bmp->buffer - _SYSTEM_MEMORY_BASE ) / 4;
   sdrdma->ch3DmaPointerStart = ( ulong )( ( ulong )bmp->buffer - _SYSTEM_MEMORY_BASE ) / 4;
   
   #endif

   #if defined( _GFXLIB_SDL )

   bsp->dmaDisplayPointerStart = bmp->buffer;

   #endif


   return 0;
}


ulong gfLoadBitmapFS( tgfBitmap *dest, char *fileName )
{
   tosFile file;
   uchar buf[4];
   ushort *bmpBufferUS;
   ushort tmp;
   
   int      i;

   if( !dest )
   {
      return 1;
   }

   if (! osFOpen( &file, fileName, OS_FILE_READ ) )
   {

      osFRead( &file, buf, 2, NULL );

      dest->width = buf[0];
      dest->width |= ( buf[1] << 8 );
      dest->rowWidth = dest->width;

      osFRead( &file, buf, 2, NULL );

      dest->height = buf[0];
      dest->height |= ( buf[1] << 8 );

      osFRead( &file, buf, 2, NULL );

      dest->flags = buf[0];
      dest->flags |= ( buf[1] << 8 );

      osFRead( &file, buf, 2, NULL );

      dest->transparentColor = buf[0];
      dest->transparentColor |= ( buf[1] << 8 );

      osFRead( &file, buf, 1, NULL );

      if( buf[0] != 12 )
      {

         osFClose( &file );
         return 2;
      }


      osFRead( &file, buf, 3, NULL );

      for( i = 0; i < 3 ; i++ )
      {
         if( buf[i] != 0 )
         {
            osFClose( &file );
            return 2;

         }
      }

      dest->buffer = osAlloc( dest->rowWidth * dest->height * 2, OS_ALLOC_MEMF_CHIP );

      if( dest->buffer == NULL )
      {
         osFClose( &file );
         return 3;

      }

      osFRead( &file, (uchar*)dest->buffer, (ulong)( dest->rowWidth * dest->height * 2 ), NULL );

      #ifdef _GFXLIB_BIG_ENDIAN
      if( ! ( dest->flags & GF_BITMAP_FLAG_BIG_ENDIAN ) )
      #else
      if( dest->flags & GF_BITMAP_FLAG_BIG_ENDIAN )
      #endif
      {
         bmpBufferUS = (ushort*)dest->buffer;
         
         //not compatible bitmap, swap bytes
         for( i = 0; i < dest->rowWidth * dest->height; i++ )
         {
            tmp = bmpBufferUS[ i ];
            
            //swap bytes
            bmpBufferUS[ i ] = ( tmp >> 8 ) & 0xff | ( tmp & 0xff ) << 8;
         
         }
      }
      else
      {
         //mc68k bitmap
         
      }
      osFClose( &file );
   }
   else
   {
      return 1;
   }

   return 0;
}


ulong gfBlitBitmap( tgfBitmap *dest, tgfBitmap *src, short x, short y )
{
   short cx,cy,bw,bh,sx,sy;

   ushort *fbSrc;
   ushort *fbDest;
   ushort srcColor;



   if(( dest == NULL) || ( src == NULL ))
   {
      return 1;
   }

   bw = src->width;
   bh = src->height;
   sx = 0;
   sy = 0;


   //clip src bitmap if coordinates are negative
   if( x < 0 )
   {
      sx = -x;
      bw -= sx;
      x = 0;
   }

   if( y < 0 )
   {
      sy = -y;
      bh -= sy;
      y = 0;
   }


   //clip src width if exceeds sise of dest bitmap
   if( ( bw + x ) >= dest->width )
   {
      bw = dest->width - x;
   }

   if( bw <= 0 )
   {
      return 0;
   }

   if( ( bh + y ) >= dest->height )
   {
      bh = dest->height - y;
   }

   if( bh <= 0 )
   {
      return 0;
   }

   if( src->flags & GF_BITMAP_FLAG_TRANSPARENT )
   {

      #if defined ( _GFXLIB_RISCV_FATFS ) && defined ( _GFXLIB_HW_BLITTER_2D )
         
         //use blitter
      
         //use blitter
      
         blt->saAddress       = (ulong)src->buffer + ( sy * ( src->rowWidth << 1 ) + ( sx << 1 ) );
         blt->saRowWidth      = src->rowWidth;
         blt->saWidth         = bw;
         blt->saHeight        = bh;

         blt->daAddress       = (ulong)dest->buffer + ( y * ( dest->rowWidth << 1 ) + ( x << 1 ) );
         blt->daRowWidth      = dest->rowWidth;
         blt->daWidth         = bw;
         blt->daHeight        = bh;

         blt->input0          = src->transparentColor;
         
         blt->command         = 0x0201;
         
         while( ! ( blt->command & 1 ) );

      #else
         
         for( cy = 0; cy < bh; cy++ )
         {
            fbSrc = &(( ushort* )src->buffer)[ ( ( cy + sy ) * src->rowWidth ) + sx ];
            fbDest = &(( ushort* )dest->buffer)[ ( ( cy + y ) * dest->rowWidth ) + x ];

            for( cx = 0; cx < bw; cx++ )
            {
               srcColor = *fbSrc++;

               if( srcColor != src->transparentColor )
               {
                  *fbDest++ = srcColor;
               }else{
                  fbDest++;
               }

            }
         }
      #endif
   }else{

      #if defined ( _GFXLIB_RISCV_FATFS ) && defined ( _GFXLIB_HW_BLITTER_2D )

         //use blitter
      
         blt->saAddress       = (ulong)src->buffer + ( sy * ( src->rowWidth << 1 ) + ( sx << 1 ) );
         blt->saRowWidth      = src->rowWidth;
         blt->saWidth         = bw;
         blt->saHeight        = bh;

         blt->daAddress       = (ulong)dest->buffer + ( y * ( dest->rowWidth << 1 ) + ( x << 1 ) );
         blt->daRowWidth      = dest->rowWidth;
         blt->daWidth         = bw;
         blt->daHeight        = bh;

         blt->command         = 0x0200;
         
         while( ! ( blt->command & 1 ) );

      #else
         for( cy = 0; cy < bh; cy++ )
         {
            fbSrc = &(( ushort* )src->buffer)[ ( ( cy + sy ) * src->rowWidth ) + sx ];
            fbDest = &(( ushort* )dest->buffer)[ ( ( cy + y ) * dest->rowWidth ) + x ];

            for( cx = 0; cx < bw; cx++ )
            {
               *fbDest++ = *fbSrc++;
            }
         }
      #endif

   }

    return 0;
}

ulong gfBlitBitmapSrcRect( tgfBitmap *dest, tgfBitmap *src, short sx, short sy, short bw, short bh, short x, short y )
{
   short cx,cy;

   ushort *fbSrc;
   ushort *fbDest;
   ushort srcColor;



   if(( dest == NULL) || ( src == NULL ))
   {
      return 1;
   }


   /*bw = src->width;
   bh = src->height;
   sx = 0;
   sy = 0;
   */

   //clip src bitmap if coordinates are negative
   if( x < 0 )
   {
      sx += -x;
      bw -= -x;
      x = 0;
   }

   if( y < 0 )
   {
      sy += -y;
      bh -= -y;
      y = 0;
   }


   //clip src width if exceeds sise of dest bitmap
   if( ( bw + x ) >= dest->width )
   {
      bw = dest->width - x;
   }

   if( bw <= 0 )
   {
      return 0;
   }

   if( ( bh + y ) >= dest->height )
   {
      bh = dest->height - y;
   }

   if( bh <= 0 )
   {
      return 0;
   }

   if( src->flags & GF_BITMAP_FLAG_TRANSPARENT )
   {

      #if defined ( _GFXLIB_RISCV_FATFS ) && defined ( _GFXLIB_HW_BLITTER_2D )
         
         //use blitter
      
         //use blitter
      
         blt->saAddress       = (ulong)src->buffer + ( sy * ( src->rowWidth << 1 ) + ( sx << 1 ) );
         blt->saRowWidth      = src->rowWidth;
         blt->saWidth         = bw;
         blt->saHeight        = bh;

         blt->daAddress       = (ulong)dest->buffer + ( y * ( dest->rowWidth << 1 ) + ( x << 1 ) );
         blt->daRowWidth      = dest->rowWidth;
         blt->daWidth         = bw;
         blt->daHeight        = bh;

         blt->input0          = src->transparentColor;
         
         blt->command         = 0x0201;
         
         while( ! ( blt->command & 1 ) );

      #else
         
         for( cy = 0; cy < bh; cy++ )
         {
            fbSrc = &(( ushort* )src->buffer)[ ( ( cy + sy ) * src->rowWidth ) + sx ];
            fbDest = &(( ushort* )dest->buffer)[ ( ( cy + y ) * dest->rowWidth ) + x ];

            for( cx = 0; cx < bw; cx++ )
            {
               srcColor = *fbSrc++;

               if( srcColor != src->transparentColor )
               {
                  *fbDest++ = srcColor;
               }else{
                  fbDest++;
               }

            }
         }
      #endif
   }else{

      #if defined ( _GFXLIB_RISCV_FATFS ) && defined ( _GFXLIB_HW_BLITTER_2D )

         //use blitter
      
         blt->saAddress       = (ulong)src->buffer + ( sy * ( src->rowWidth << 1 ) + ( sx << 1 ) );
         blt->saRowWidth      = src->rowWidth;
         blt->saWidth         = bw;
         blt->saHeight        = bh;

         blt->daAddress       = (ulong)dest->buffer + ( y * ( dest->rowWidth << 1 ) + ( x << 1 ) );
         blt->daRowWidth      = dest->rowWidth;
         blt->daWidth         = bw;
         blt->daHeight        = bh;

         blt->command         = 0x0200;
         
         while( ! ( blt->command & 1 ) );

      #else
         for( cy = 0; cy < bh; cy++ )
         {
            fbSrc = &(( ushort* )src->buffer)[ ( ( cy + sy ) * src->rowWidth ) + sx ];
            fbDest = &(( ushort* )dest->buffer)[ ( ( cy + y ) * dest->rowWidth ) + x ];

            for( cx = 0; cx < bw; cx++ )
            {
               *fbDest++ = *fbSrc++;
            }
         }
      #endif

   }

    return 0;
}



ulong gfBlitBitmapA( tgfBitmap *dest, tgfBitmap *src, short x, short y, uchar alpha )
{
   short cx,cy,bw,bh,sx,sy;

   ushort *fbSrc;
   ushort srcColor;


   if(( dest == NULL) || ( src == NULL ))
   {
      return 1;
   }

   bw = src->width;
   bh = src->height;
   sx = 0;
   sy = 0;


   //clip src bitmap if coordinates are negative
   if( x < 0 )
   {
      sx = -x;
      bw -= sx;
      x = 0;
   }

   if( y < 0 )
   {
      sy = -y;
      bh -= sy;
      y = 0;
   }


   //clip src width if exceeds sise of dest bitmap
   if( ( bw + x ) >= dest->width )
   {
      bw = dest->width - x;
   }

   if( bw <= 0 )
   {
      return 0;
   }

   if( ( bh + y ) >= dest->height )
   {
      bh = dest->height - y;
   }

   if( bh <= 0 )
   {
      return 0;
   }

   if( src->flags & GF_BITMAP_FLAG_TRANSPARENT )
   {

      #if  defined ( _GFXLIB_RISCV_FATFS ) && defined ( _GFXLIB_HW_BLITTER_2D )
         

         //use blitter
      
         blt->saAddress       = (ulong)src->buffer + ( sy * ( src->rowWidth << 1 ) + ( sx << 1 ) );
         blt->saRowWidth      = src->rowWidth;
         blt->saWidth         = bw;
         blt->saHeight        = bh;

         blt->sbAddress       = (ulong)dest->buffer + ( y * ( dest->rowWidth << 1 ) + ( x << 1 ) );
         blt->sbRowWidth      = dest->rowWidth;

         blt->daAddress       = (ulong)dest->buffer + ( y * ( dest->rowWidth << 1 ) + ( x << 1 ) );
         blt->daRowWidth      = dest->rowWidth;
         blt->daWidth         = bw;
         blt->daHeight        = bh;

         blt->input0          = ( alpha >> 3 );
         blt->input1          = src->transparentColor;
         blt->command         = 0x0301;
         
         while( ! ( blt->command & 1 ) );

      #else


      for( cy = 0; cy < bh; cy++ )
      {
         fbSrc = &(( ushort* )src->buffer)[ ( ( cy + sy ) * src->rowWidth ) + sx ];

         for( cx = 0; cx < bw; cx++ )
         {
            srcColor = *fbSrc++;

            if( srcColor != src->transparentColor )
            {
               gfPlotA( dest, cx + x, cy + y, srcColor, alpha );
            }

         }
      }
      
      #endif

   }else{


      #if  defined ( _GFXLIB_RISCV_FATFS ) && defined ( _GFXLIB_HW_BLITTER_2D )
               
         //use blitter
      
         blt->saAddress       = (ulong)src->buffer + ( sy * ( src->rowWidth << 1 ) + ( sx << 1 ) );
         blt->saRowWidth      = src->rowWidth;
         blt->saWidth         = bw;
         blt->saHeight        = bh;

         blt->sbAddress       = (ulong)dest->buffer + ( y * ( dest->rowWidth << 1 ) + ( x << 1 ) );
         blt->sbRowWidth      = dest->rowWidth;

         blt->daAddress       = (ulong)dest->buffer + ( y * ( dest->rowWidth << 1 ) + ( x << 1 ) );
         blt->daRowWidth      = dest->rowWidth;
         blt->daWidth         = bw;
         blt->daHeight        = bh;

         blt->input0          = ( alpha >> 3 );

         blt->command         = 0x0300;
         
         while( ! ( blt->command & 1 ) );

      #else


      for( cy = 0; cy < bh; cy++ )
      {
         fbSrc = &(( ushort* )src->buffer)[ ( ( cy + sy ) * src->rowWidth ) + sx ];

         for( cx = 0; cx < bw; cx++ )
         {
            gfPlotA( dest, cx + x, cy + y, *fbSrc++, alpha );
         }
      }

      #endif
   }

   return 0;
}

ulong gfBlitBitmapA2Src( tgfBitmap *dest, tgfBitmap *src1, tgfBitmap *src2, short x, short y, uchar alpha )
{
   short cx,cy,bw,bh,sx,sy;

   ushort *fbSrc1;
   ushort *fbSrc2;
   ushort srcColor1;
   ushort srcColor2;


   if( ( dest == NULL) || ( src1 == NULL ) || ( src2 == NULL ) )
   {
      return 1;
   }

   bw = src1->width;
   bh = src1->height;
   sx = 0;
   sy = 0;


   //clip src bitmap if coordinates are negative
   if( x < 0 )
   {
      sx = -x;
      bw -= sx;
      x = 0;
   }

   if( y < 0 )
   {
      sy = -y;
      bh -= sy;
      y = 0;
   }


   //clip src width if exceeds sise of dest bitmap
   if( ( bw + x ) >= dest->width )
   {
      bw = dest->width - x;
   }

   if( bw <= 0 )
   {
      return 0;
   }

   if( ( bh + y ) >= dest->height )
   {
      bh = dest->height - y;
   }

   if( bh <= 0 )
   {
      return 0;
   }

   if( src1->flags & GF_BITMAP_FLAG_TRANSPARENT )
   {

      #if  defined ( _GFXLIB_RISCV_FATFS ) && defined ( _GFXLIB_HW_BLITTER_2D )
         
         
         //use blitter
      
         blt->saAddress       = (ulong)src1->buffer + ( sy * ( src1->rowWidth << 1 ) + ( sx << 1 ) );
         blt->saRowWidth      = src1->rowWidth;
         blt->saWidth         = bw;
         blt->saHeight        = bh;

         blt->sbAddress       = (ulong)src2->buffer + ( sy * ( src2->rowWidth << 1 ) + ( sx << 1 ) );
         blt->sbRowWidth      = src2->rowWidth;

         blt->daAddress       = (ulong)dest->buffer + ( y * ( dest->rowWidth << 1 ) + ( x << 1 ) );
         blt->daRowWidth      = dest->rowWidth;
         blt->daWidth         = bw;
         blt->daHeight        = bh;

         blt->input0          = ( alpha >> 3 );
         blt->input1          = src1->transparentColor;
         blt->command         = 0x0301;
         
         while( ! ( blt->command & 1 ) );

      #else


      for( cy = 0; cy < bh; cy++ )
      {
         fbSrc1 = &(( ushort* )src1->buffer)[ ( ( cy + sy ) * src1->rowWidth ) + sx ];
         fbSrc2 = &(( ushort* )src2->buffer)[ ( ( cy + sy ) * src2->rowWidth ) + sx ];

         for( cx = 0; cx < bw; cx++ )
         {
            srcColor1 = *fbSrc1++;
            srcColor2 = *fbSrc2++;

            if( srcColor1 != src1->transparentColor )
            {
               gfPlotA2C( dest, cx + x, cy + y, srcColor1, srcColor2, alpha );
            }

         }
      }
      
      #endif

   }else{


      #if  defined ( _GFXLIB_RISCV_FATFS ) && defined ( _GFXLIB_HW_BLITTER_2D )
               
         //use blitter
      
         blt->saAddress       = (ulong)src1->buffer + ( sy * ( src1->rowWidth << 1 ) + ( sx << 1 ) );
         blt->saRowWidth      = src1->rowWidth;
         blt->saWidth         = bw;
         blt->saHeight        = bh;

         blt->sbAddress       = (ulong)src2->buffer + ( sy * ( src2->rowWidth << 1 ) + ( sx << 1 ) );
         blt->sbRowWidth      = src2->rowWidth;

         blt->daAddress       = (ulong)dest->buffer + ( y * ( dest->rowWidth << 1 ) + ( x << 1 ) );
         blt->daRowWidth      = dest->rowWidth;
         blt->daWidth         = bw;
         blt->daHeight        = bh;

         blt->input0          = ( alpha >> 3 );

         blt->command         = 0x0300;
         
         while( ! ( blt->command & 1 ) );

      #else


      for( cy = 0; cy < bh; cy++ )
      {
         fbSrc1 = &(( ushort* )src1->buffer)[ ( ( cy + sy ) * src1->rowWidth ) + sx ];
         fbSrc2 = &(( ushort* )src2->buffer)[ ( ( cy + sy ) * src2->rowWidth ) + sx ];

         for( cx = 0; cx < bw; cx++ )
         {
            gfPlotA2C( dest, cx + x, cy + y, *fbSrc1++, *fbSrc2++, alpha );
         }
      }

      #endif
   }

   return 0;
}


ulong gfBlitScaledBitmap( tgfBitmap *dest, tgfBitmap *src, short x, short y, short w, short h )
{
   short  cx;
   short  cy;
   short  bw;
   short  bh;
   ulong  sx;
   ulong  sy;


   ulong  deltaX;
   ulong  deltaY;
   ulong  sourceX;
   ulong  sourceY;

   ushort   *fbSrc;
   ushort   *fbDest;
   ushort    pixel;


   if(( dest == NULL) || ( src == NULL ))
   {
      return 1;
   }

   bw = w;
   bh = h;

   sx = 0;
   sy = 0;

   //calc scale deltas
   deltaX = ( (ulong)( src->width  ) << 16 ) / w;
   deltaY = ( (ulong)( src->height ) << 16 ) / h;


   //clip source bitmap if x or y negative

   //clip src bitmap if coordinates are negative

   if( x < 0 )
   {
      sx = -x;
      bw -= sx;
      sx *= deltaX;

      x = 0;
   }

   if( y < 0 )
   {
      sy = -y;
      bh -= sy;
      sy *= deltaY;

      y = 0;
   }



   //clip src width if exceeds sise of dest bitmap
   
   if( ( bw + x ) >= dest->width )
   {
      bw = dest->width - x;
   }

   if( bw <= 0 )
   {
      return 0;
   }

   if( ( bh + y ) >= dest->height )
   {
      bh = dest->height - y;
   }

   if( bh <= 0 )
   {
      return 0;
   }

   sourceY = sy;

   #if defined ( _GFXLIB_RISCV_FATFS ) && defined ( _GFXLIB_HW_BLITTER_2D )
      //use blitter

      blt->saAddress       = (ulong)src->buffer + ( ( sy >> 16 ) * ( src->rowWidth << 1 ) + ( sx >> 15 ) );
      blt->saRowWidth      = src->rowWidth;
      blt->saWidth         = src->width;
      blt->saHeight        = src->height;

      blt->daAddress       = (ulong)dest->buffer + ( y * ( dest->rowWidth << 1 ) + ( x << 1 ) );
      blt->daRowWidth      = dest->rowWidth;
      blt->daWidth         = bw;
      blt->daHeight        = bh;

      blt->input0          = deltaX;
      blt->input1          = deltaY;
      blt->input2          = src->transparentColor;

      if( src->flags & GF_BITMAP_FLAG_TRANSPARENT )
      {
         //scaled copy with mask
         blt->command         = 0x0401;
      }
      else
      {
         //scaled copy
         blt->command         = 0x0400;
      }
      
      while( ! ( blt->command & 1 ) );
   
   #else

      if( src->flags & GF_BITMAP_FLAG_TRANSPARENT )
      {

         for( cy = 0; cy < bh; cy++ )
         {
            sourceX = sx;

            fbSrc = &(( ushort* )src->buffer)[ ( ( sourceY >> 16 ) * src->rowWidth ) ];
            fbDest = &(( ushort* )dest->buffer)[ ( ( cy + y ) * dest->rowWidth ) + x ];

            sourceY += deltaY;

            for( cx = 0; cx < bw; cx++ )
            {

               pixel =  fbSrc[ ( sourceX >> 16 ) ];

               if( pixel != src->transparentColor )
               {
                  *fbDest++ = pixel;
               }
               else
               {
                  fbDest++;
               }
               
               sourceX += deltaX;
            }
         }

      }
      else
      {

         for( cy = 0; cy < bh; cy++ )
         {
            sourceX = sx;

            fbSrc = &(( ushort* )src->buffer)[ ( ( sourceY >> 16 ) * src->rowWidth ) ];
            fbDest = &(( ushort* )dest->buffer)[ ( ( cy + y ) * dest->rowWidth ) + x ];

            sourceY += deltaY;

            for( cx = 0; cx < bw; cx++ )
            {

               *fbDest++ = fbSrc[ ( sourceX >> 16 ) ];

               sourceX += deltaX;
            }
         }

      }
   
   #endif

   return 0;
}
