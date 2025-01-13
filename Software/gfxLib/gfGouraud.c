#include "gfGouraud.h"
#include "gfDrawing.h"
#include <stdlib.h>

#if defined( _GFXLIB_RISCV_FATFS ) || defined( _GFXLIB_MC68K_FATFS )

#include "bsp.h"

extern BSP_T *bsp;

#endif

//https://austinmorlan.com/posts/drawing_a_triangle/


int32_t inline gfGouraudEdge( tgfPoint3D *e1, tgfPoint3D *e2, tgfPoint3D *p )
{
   tgfPoint3D a,b;

/*float Edge(Point v0, Point v1, Point p)
{
   // Vector from edge origin to test point
   Vector a = p - v0;

   // Vector from edge origin to edge end
   Vector b = v1 - v0;

   // 2D cross product
   // Zero: Point is on edge
   // Positive: Point is right of edge
   // Negative: Point is left of edge
   return a.x * b.y - a.y * b.x;
}*/


   a.x2D = p->x2D - e1->x2D;
   a.y2D = p->y2D - e1->y2D;

   b.x2D = e2->x2D - e1->x2D;
   b.y2D = e2->y2D - e1->y2D;

   return ( ( a.x2D * b.y2D ) - ( a.y2D * b.x2D ) );
}


uint32_t  gfGouraudDrawTriangleBlt( tgfBitmap *bmp, tgfTriangle3D *triangle )
{
   #if defined( _GFXLIB_RISCV_FATFS ) && defined( _GFXLIB_HW_BLITTER_3D )

   blt->daAddress  = (uint32_t)bmp->buffer;
   blt->bbXMin = 0;
   blt->bbXMax = 319;
   blt->bbYMin = 0;
   blt->bbYMax = 239;

   //pass triangle coordinates/texture coordinates to gouraud hardware

   blt->aX     = triangle->a->x2D;
   blt->aY     = triangle->a->y2D;
   blt->aZ     = triangle->a->z2D;

   blt->bX     = triangle->b->x2D;
   blt->bY     = triangle->b->y2D;
   blt->bZ     = triangle->b->z2D;

   blt->cX     = triangle->c->x2D;
   blt->cY     = triangle->c->y2D;
   blt->cZ     = triangle->c->z2D;          //triggers triangleArea and triangleAreaInv calculations

   blt->aIt0   = triangle->a->r;
   blt->aIt1   = triangle->a->g;
   blt->aIt2   = triangle->a->b;

   blt->bIt0   = triangle->b->r;
   blt->bIt1   = triangle->b->g;
   blt->bIt2   = triangle->b->b;

   blt->cIt0   = triangle->c->r;
   blt->cIt1   = triangle->c->g;
   blt->cIt2   = triangle->c->b;

   if( blt->triangleArea > 0 )
   {
      //triangle facing front

      //run ( gouraud triangle )
      blt->command = 0x0500;

      //wait until complete
      do{}while( ! ( blt->command & 1 ) );

   }

   return 0;

   #else

   return 1;

   #endif
}


uint32_t gfGouraudDrawTriangleZBufferBlt( tgfBitmap *bmp, tgfBitmap *zBuffer, tgfTriangle3D *triangle )
{

   #if defined( _GFXLIB_RISCV_FATFS ) && defined( _GFXLIB_HW_BLITTER_3D )

   blt->daAddress  = (uint32_t)bmp->buffer;
   blt->dbAddress  = (uint32_t)zBuffer->buffer;
   blt->bbXMin = 0;
   blt->bbXMax = 319;
   blt->bbYMin = 0;
   blt->bbYMax = 239;

   //pass triangle coordinates/texture coordinates to gouraud hardware

   blt->aX     = triangle->a->x2D;
   blt->aY     = triangle->a->y2D;
   blt->aZ     = triangle->a->z2D;

   blt->bX     = triangle->b->x2D;
   blt->bY     = triangle->b->y2D;
   blt->bZ     = triangle->b->z2D;

   blt->cX     = triangle->c->x2D;
   blt->cY     = triangle->c->y2D;
   blt->cZ     = triangle->c->z2D;          //triggers triangleArea and triangleAreaInv calculations

   blt->aIt0   = triangle->a->r;
   blt->aIt1   = triangle->a->g;
   blt->aIt2   = triangle->a->b;

   blt->bIt0   = triangle->b->r;
   blt->bIt1   = triangle->b->g;
   blt->bIt2   = triangle->b->b;

   blt->cIt0   = triangle->c->r;
   blt->cIt1   = triangle->c->g;
   blt->cIt2   = triangle->c->b;

   if( blt->triangleArea > 0 )
   {
      //triangle facing front

      //run ( gouraud triangle with z-buffer )
      blt->command = 0x0510;

      //wait until complete
      do{}while( ! ( blt->command & 1 ) );

   }

   return 0;

   #else

   return 1;

   #endif
}

uint32_t gfGouraudDrawTexturedTriangleZBufferBlt( tgfBitmap *bmp, tgfBitmap *zBuffer, tgfTriangle3D *triangle )
{

   #if defined( _GFXLIB_RISCV_FATFS ) && defined( _GFXLIB_HW_BLITTER_3D )

   blt->daAddress  = (uint32_t)bmp->buffer;
   blt->dbAddress  = (uint32_t)zBuffer->buffer;
   blt->bbXMin = 0;
   blt->bbXMax = 319;
   blt->bbYMin = 0;
   blt->bbYMax = 239;

   //pass triangle coordinates/texture coordinates to gouraud hardware
   
   blt->aX     = triangle->a->x2D;
   blt->aY     = triangle->a->y2D;
   blt->aZ     = triangle->a->z2D;

   blt->bX     = triangle->b->x2D;
   blt->bY     = triangle->b->y2D;
   blt->bZ     = triangle->b->z2D;

   blt->cX     = triangle->c->x2D;
   blt->cY     = triangle->c->y2D;
   blt->cZ     = triangle->c->z2D;          //triggers triangleArea and triangleAreaInv calculations

   blt->aIt0   = triangle->aTx2D;
   blt->aIt1   = triangle->aTy2D;
   blt->aIt2   = triangle->a->r;

   blt->bIt0   = triangle->bTx2D;
   blt->bIt1   = triangle->bTy2D;
   blt->bIt2   = triangle->b->r;

   blt->cIt0   = triangle->cTx2D;
   blt->cIt1   = triangle->cTy2D;
   blt->cIt2   = triangle->c->r;

   if( blt->triangleArea > 0 )
   {
      //triangle facing front

      //set texture address
      blt->saAddress  = (uint32_t)triangle->texture->buffer;

      //run ( textured, shaded triangle with z-buffer )
      blt->command = 0x0520;

   }

   return 0;

   #else

   return  1;

   #endif

}

uint32_t gfGouraudDrawTriangle( tgfBitmap *bmp, tgfTriangle3D *triangle )
{
   int16_t        x;
   int16_t        y;

   int16_t        xMin;
   int16_t        xMax;
   int16_t        yMin;
   int16_t        yMax;

   int32_t        eba;
   int32_t        ecb;
   int32_t        eac;

   int32_t        areal;
   uint32_t       areaInv;

   int32_t        wbal;
   int32_t        wcbl;
   int32_t        wacl;

   int32_t        r;
   int32_t        g;
   int32_t        b;
   
   tgfPoint3D     p;

   uint16_t      *bmpPtr;



   xMin = bmp->width - 1;
   yMin = bmp->height - 1;
   xMax = 0;
   yMax = 0;

   if( triangle->a->x2D > xMax )
   {
      xMax = triangle->a->x2D;
   }
   if( triangle->b->x2D > xMax )
   {
      xMax = triangle->b->x2D;
   }
   if( triangle->c->x2D > xMax )
   {
      xMax = triangle->c->x2D;
   }

   if( triangle->a->x2D < xMin )
   {
      xMin = triangle->a->x2D;
   }
   if( triangle->b->x2D < xMin )
   {
      xMin = triangle->b->x2D;
   }
   if( triangle->c->x2D < xMin )
   {
      xMin = triangle->c->x2D;
   }

   if( triangle->a->y2D > yMax )
   {
      yMax = triangle->a->y2D;
   }
   if( triangle->b->y2D > yMax )
   {
      yMax = triangle->b->y2D;
   }
   if( triangle->c->y2D > yMax )
   {
      yMax = triangle->c->y2D;
   }

   if( triangle->a->y2D < yMin )
   {
      yMin = triangle->a->y2D;
   }
   if( triangle->b->y2D < yMin )
   {
      yMin = triangle->b->y2D;
   }
   if( triangle->c->y2D < yMin )
   {
      yMin = triangle->c->y2D;
   }


  if( xMin < 0 )
  {
   xMin = 0;
  }
  if( yMin < 0 )
  {
   yMin = 0;
  }

  if ( xMax >= bmp->width )
  {
   xMax = bmp->width - 1;
  }
  if ( yMax >= bmp->height )
  {
   yMax = bmp->height - 1;
  }

  if ( xMin >= bmp->width )
  {
   xMin = bmp->width - 1;
  }
  if ( yMin >= bmp->height )
  {
   yMin = bmp->height - 1;
  }


   areal = gfGouraudEdge( triangle->c, triangle->b, triangle->a );

   if( areal > 0 )
   {

      areaInv = 0xffffffff / areal;

      for( y = yMin; y <= yMax; y++ )
      {

         bmpPtr = NULL;

         for( x = xMin; x <= xMax; x++ )
         {

            p.x2D = x;
            p.y2D = y;

            eba = gfGouraudEdge( triangle->b, triangle->a, &p );
            ecb = gfGouraudEdge( triangle->c, triangle->b, &p );
            eac = gfGouraudEdge( triangle->a, triangle->c, &p );

            //check if point inside triangle

            if( ( eba >= 0 ) && ( ecb >= 0 ) && ( eac >= 0 ) )
            {
//               wbal = ( eba << 8 ) / areal;
//               wcbl = ( ecb << 8 ) / areal;
//               wacl = ( eac << 8 ) / areal;

               wbal = ( eba * areaInv ) >> 20;  //24
               wcbl = ( ecb * areaInv ) >> 20;
               wacl = ( eac * areaInv ) >> 20;

               r = ( ( wcbl * (int32_t)triangle->a->r ) + ( wacl * (int32_t)triangle->b->r ) + ( wbal * (int32_t)triangle->c->r ) ) >> 12;   //8
               g = ( ( wcbl * (int32_t)triangle->a->g ) + ( wacl * (int32_t)triangle->b->g ) + ( wbal * (int32_t)triangle->c->g ) ) >> 12;
               b = ( ( wcbl * (int32_t)triangle->a->b ) + ( wacl * (int32_t)triangle->b->b ) + ( wbal * (int32_t)triangle->c->b ) ) >> 12;

               if( !bmpPtr )
               {
                     //pixel not yet drawn in this line
                  bmpPtr = &((uint16_t*)( bmp->buffer ))[ x + ( y * bmp->rowWidth ) ];
               }

               *bmpPtr++ = gfColor( r, g, b );
            
            }
            else
            {
               if( bmpPtr )
               {
                  //finished drawing this line, go to next one
                  break;
               }
            }
         }
      }
   }

   return 0;
}


uint32_t gfGouraudDrawTriangleZBuffer( tgfBitmap *bmp, tgfBitmap *zBuffer, tgfTriangle3D *triangle )
{
   int16_t        x;
   int16_t        y;

   int16_t        xMin;
   int16_t        xMax;
   int16_t        yMin;
   int16_t        yMax;

   int32_t        eba;
   int32_t        ecb;
   int32_t        eac;

   int32_t        areal;
   uint32_t       areaInv;

   int32_t        wbal;
   int32_t        wcbl;
   int32_t        wacl;

   int32_t        r;
   int32_t        g;
   int32_t        b;
   uint32_t       cz;

   tgfPoint3D     p;

   uint16_t      *bmpPtr;
   uint16_t      *zBufPtr;



   xMin = bmp->width - 1;
   yMin = bmp->height - 1;
   xMax = 0;
   yMax = 0;

   if( triangle->a->x2D > xMax )
   {
      xMax = triangle->a->x2D;
   }
   if( triangle->b->x2D > xMax )
   {
      xMax = triangle->b->x2D;
   }
   if( triangle->c->x2D > xMax )
   {
      xMax = triangle->c->x2D;
   }

   if( triangle->a->x2D < xMin )
   {
      xMin = triangle->a->x2D;
   }
   if( triangle->b->x2D < xMin )
   {
      xMin = triangle->b->x2D;
   }
   if( triangle->c->x2D < xMin )
   {
      xMin = triangle->c->x2D;
   }

   if( triangle->a->y2D > yMax )
   {
      yMax = triangle->a->y2D;
   }
   if( triangle->b->y2D > yMax )
   {
      yMax = triangle->b->y2D;
   }
   if( triangle->c->y2D > yMax )
   {
      yMax = triangle->c->y2D;
   }

   if( triangle->a->y2D < yMin )
   {
      yMin = triangle->a->y2D;
   }
   if( triangle->b->y2D < yMin )
   {
      yMin = triangle->b->y2D;
   }
   if( triangle->c->y2D < yMin )
   {
      yMin = triangle->c->y2D;
   }


  if( xMin < 0 )
  {
   xMin = 0;
  }
  if( yMin < 0 )
  {
   yMin = 0;
  }

  if ( xMax >= bmp->width )
  {
   xMax = bmp->width - 1;
  }
  if ( yMax >= bmp->height )
  {
   yMax = bmp->height - 1;
  }

  if ( xMin >= bmp->width )
  {
   xMin = bmp->width - 1;
  }
  if ( yMin >= bmp->height )
  {
   yMin = bmp->height - 1;
  }


   areal = gfGouraudEdge( triangle->c, triangle->b, triangle->a );

   if( areal > 0 )
   {

      areaInv = 0xffffffff / areal;

      for( y = yMin; y <= yMax; y++ )
      {

         bmpPtr = NULL;
         zBufPtr = &((uint16_t*)( zBuffer->buffer ))[ ( y * zBuffer->rowWidth ) ];

         for( x = xMin; x <= xMax; x++ )
         {

            p.x2D = x;
            p.y2D = y;

            eba = gfGouraudEdge( triangle->b, triangle->a, &p );
            ecb = gfGouraudEdge( triangle->c, triangle->b, &p );
            eac = gfGouraudEdge( triangle->a, triangle->c, &p );

            //check if point inside triangle

            if( ( eba >= 0 ) && ( ecb >= 0 ) && ( eac >= 0 ) )
            {
//               wbal = ( eba << 8 ) / areal;
//               wcbl = ( ecb << 8 ) / areal;
//               wacl = ( eac << 8 ) / areal;

               wbal = ( eba * areaInv ) >> 20;  //24
               wcbl = ( ecb * areaInv ) >> 20;
               wacl = ( eac * areaInv ) >> 20;

               r = ( ( wcbl * (int32_t)triangle->a->r ) + ( wacl * (int32_t)triangle->b->r ) + ( wbal * (int32_t)triangle->c->r ) ) >> 12;   //8
               g = ( ( wcbl * (int32_t)triangle->a->g ) + ( wacl * (int32_t)triangle->b->g ) + ( wbal * (int32_t)triangle->c->g ) ) >> 12;
               b = ( ( wcbl * (int32_t)triangle->a->b ) + ( wacl * (int32_t)triangle->b->b ) + ( wbal * (int32_t)triangle->c->b ) ) >> 12;

               cz = ( ( wcbl * ( int32_t )triangle->a->z2D ) + ( wacl * ( int32_t )triangle->b->z2D ) + ( wbal * ( int32_t )triangle->c->z2D ) ) >> 12;



               if( !bmpPtr )
                  {
                     //pixel not yet drawn in this line
                  bmpPtr = &((uint16_t*)( bmp->buffer ))[ x + ( y * bmp->rowWidth ) ];
               }


                    //current pixel is closer than existing one
               if( cz <= zBufPtr[x] )
               {
                  zBufPtr[x] = cz;
                  *bmpPtr++ = gfColor( r, g, b );
               }
               else
               {
                        bmpPtr++;
                    }
            }
            else
            {
               if( bmpPtr )
               {
                  //finished drawing this line, go to next one
                  break;
               }
            }
         }
      }
   }

   return 0;
}

uint32_t gfGouraudDrawTexturedTriangleZBuffer( tgfBitmap *bmp, tgfBitmap *zBuffer, tgfTriangle3D *triangle )
{

   int16_t      x;
   int16_t      y;
   uint16_t     r;
   uint16_t     g;
   uint16_t     b;
   uint16_t     texturePixel;

   int16_t      xMin;
   int16_t      xMax;
   int16_t      yMin;
   int16_t      yMax;

   int32_t      eba;
   int32_t      ecb;
   int32_t      eac;

   int32_t      areal;
   uint32_t     areaInv;

   int32_t      wbal;
   int32_t      wcbl;
   int32_t      wacl;

   uint8_t      tx;
   uint8_t      ty;
   uint8_t      tl;

   uint32_t     cz;

   uint16_t    *bmpPtr;
   uint16_t    *zBufPtr;

   uint32_t     insideTriangle;

   tgfPoint3D   p;

   xMin = bmp->width - 1;
   yMin = bmp->height - 1;
   xMax = 0;
   yMax = 0;

   if( triangle->a->x2D > xMax )
   {
      xMax = triangle->a->x2D;
   }
   if( triangle->b->x2D > xMax )
   {
      xMax = triangle->b->x2D;
   }
   if( triangle->c->x2D > xMax )
   {
      xMax = triangle->c->x2D;
   }

   if( triangle->a->x2D < xMin )
   {
      xMin = triangle->a->x2D;
   }
   if( triangle->b->x2D < xMin )
   {
      xMin = triangle->b->x2D;
   }
   if( triangle->c->x2D < xMin )
   {
      xMin = triangle->c->x2D;
   }

   if( triangle->a->y2D > yMax )
   {
      yMax = triangle->a->y2D;
   }
   if( triangle->b->y2D > yMax )
   {
      yMax = triangle->b->y2D;
   }
   if( triangle->c->y2D > yMax )
   {
      yMax = triangle->c->y2D;
   }

   if( triangle->a->y2D < yMin )
   {
      yMin = triangle->a->y2D;
   }
   if( triangle->b->y2D < yMin )
   {
      yMin = triangle->b->y2D;
   }
   if( triangle->c->y2D < yMin )
   {
      yMin = triangle->c->y2D;
   }

   if( xMin < 0 )
   {
      xMin = 0;
   }
   if( yMin < 0 )
   {
      yMin = 0;
   }
   if( xMax < 0 )
   {
      xMax = 0;
   }
   if( yMax < 0 )
   {
      yMax = 0;
   }

   if( xMax >= bmp->width )
   {
      xMax = bmp->width - 1;
   }
   if( yMax >= bmp->height )
   {
      yMax = bmp->height - 1;
   }
   if( xMin >= bmp->width )
   {
      xMin = bmp->width - 1;
   }
   if( yMin >= bmp->height )
   {
      yMin = bmp->height - 1;
   }

   areal = gfGouraudEdge( triangle->c, triangle->b, triangle->a );


   if( areal > 0 )
   {
      //areaInv = 0x100000000 / areal;
      areaInv = 0xffffffff / areal;

      for( y = yMin; y <= yMax; y++ )
      {

         zBufPtr  = &((uint16_t*)( zBuffer->buffer ))[ ( y * zBuffer->rowWidth ) ];
         bmpPtr   = &((uint16_t*)( bmp->buffer ))[ ( y * bmp->rowWidth ) ];

         insideTriangle = 0;

         for( x = xMin; x <= xMax; x++ )
         {

            p.x2D = x;
            p.y2D = y;

            eba = gfGouraudEdge( triangle->b, triangle->a, &p );
            ecb = gfGouraudEdge( triangle->c, triangle->b, &p );
            eac = gfGouraudEdge( triangle->a, triangle->c, &p );

            //check if point inside triangle

            if( ( eba >= 0 ) && ( ecb >= 0 ) && ( eac >= 0 ) )
            {

               insideTriangle = 1;
               //wbal = ( eba << 8 ) / areal;
               //wcbl = ( ecb << 8 ) / areal;
               //wacl = ( eac << 8 ) / areal;
             

               wbal = ( eba * areaInv ) >> 20; //24
               wcbl = ( ecb * areaInv ) >> 20;
               wacl = ( eac * areaInv ) >> 20;

               tx = ( ( wcbl * ( int32_t )triangle->aTx2D ) + ( wacl * ( int32_t )triangle->bTx2D ) + ( wbal * ( int32_t )triangle->cTx2D ) ) >> 12; //8
               ty = ( ( wcbl * ( int32_t )triangle->aTy2D ) + ( wacl * ( int32_t )triangle->bTy2D ) + ( wbal * ( int32_t )triangle->cTy2D ) ) >> 12;
               tl = ( ( wcbl * ( int32_t )triangle->a->r ) + ( wacl * ( int32_t )triangle->b->r ) + ( wbal * ( int32_t )triangle->c->r ) ) >> 12;

               cz = ( ( wcbl * ( int32_t )triangle->a->z2D ) + ( wacl * ( int32_t )triangle->b->z2D ) + ( wbal * ( int32_t )triangle->c->z2D ) ) >> 12;


               //current pixel is closer than existing one
               if( cz <= zBufPtr[x] )
               {
                  //gfPlotF( zBuffer, x, y, cz );
                  zBufPtr[x] = cz;

                  texturePixel = gfGetPixel( triangle->texture, tx, ty );

                  r = gfColorGetR( texturePixel ) * tl;
                  g = gfColorGetG( texturePixel ) * tl;
                  b = gfColorGetB( texturePixel ) * tl;


                  bmpPtr[x] = gfColor( r >> 8 , g >> 8 , b >> 8  );
                  //gfPlotF( bmp, x, y, gfColor( r >> 8 , g >> 8 , b >> 8  ) );

               }
            }
            else
            {
               if( insideTriangle )
               {
                  //    *
                  //   *  * #we are here, skip to the next line
                  //  *     *
                  // *********
                  break;
               }
            }
         }
      }
   }

   return 0;
}


/*
//old triangle drawing procedures, for reference

//int, no hw
uint32_t  gfGouraudDrawTriangle( tgfBitmap *bmp, tgfTriangle3D *triangle )
{
   int16_t      x;
   int16_t     y;

   int16_t       xMin;
   int16_t       xMax;
   int16_t       yMin;
   int16_t       yMax;

   int32_t        eba;
   int32_t        ecb;
   int32_t        eac;

   int32_t     areal;

   int32_t     wbal;
   int32_t     wcbl;
   int32_t     wacl;

   int32_t       r;
   int32_t       g;
   int32_t       b;

   tgfPoint3D  p;

   uint16_t    *bmpPtr;


   xMin = bmp->width - 1;
   yMin = bmp->height - 1;
   xMax = 0;
   yMax = 0;

   if( triangle->a->x2D > xMax )
   {
      xMax = triangle->a->x2D;
   }
   if( triangle->b->x2D > xMax )
   {
      xMax = triangle->b->x2D;
   }
   if( triangle->c->x2D > xMax )
   {
      xMax = triangle->c->x2D;
   }

   if( triangle->a->x2D < xMin )
   {
      xMin = triangle->a->x2D;
   }
   if( triangle->b->x2D < xMin )
   {
      xMin = triangle->b->x2D;
   }
   if( triangle->c->x2D < xMin )
   {
      xMin = triangle->c->x2D;
   }

   if( triangle->a->y2D > yMax )
   {
      yMax = triangle->a->y2D;
   }
   if( triangle->b->y2D > yMax )
   {
      yMax = triangle->b->y2D;
   }
   if( triangle->c->y2D > yMax )
   {
      yMax = triangle->c->y2D;
   }

   if( triangle->a->y2D < yMin )
   {
      yMin = triangle->a->y2D;
   }
   if( triangle->b->y2D < yMin )
   {
      yMin = triangle->b->y2D;
   }
   if( triangle->c->y2D < yMin )
   {
      yMin = triangle->c->y2D;
   }


  if( xMin < 0 )
  {
   xMin = 0;
  }
  if( yMin < 0 )
  {
   yMin = 0;
  }

  if ( xMax >= bmp->width )
  {
   xMax = bmp->width - 1;
  }
  if ( yMax >= bmp->height )
  {
   yMax = bmp->height - 1;
  }

  if ( xMin >= bmp->width )
  {
   xMin = bmp->width - 1;
  }
  if ( yMin >= bmp->height )
  {
   yMin = bmp->height - 1;
  }


   areal = gfGouraudEdge( triangle->c, triangle->b, triangle->a );

   if( areal > 0 )
   {

      for( y = yMin; y <= yMax; y++ )
      {

         bmpPtr = NULL;

         for( x = xMin; x <= xMax; x++ )
         {

            p.x2D = x;
            p.y2D = y;

            eba = gfGouraudEdge( triangle->b, triangle->a, &p );
            ecb = gfGouraudEdge( triangle->c, triangle->b, &p );
            eac = gfGouraudEdge( triangle->a, triangle->c, &p );

            //check if point inside triangle

            if( ( eba >= 0 ) && ( ecb >= 0 ) && ( eac >= 0 ) )
            {
               wbal = ( eba << 8 ) / areal;
               wcbl = ( ecb << 8 ) / areal;
               wacl = ( eac << 8 ) / areal;

               r = ( ( wcbl * (int32_t)triangle->a->r ) + ( wacl * (int32_t)triangle->b->r ) + ( wbal * (int32_t)triangle->c->r ) ) >> 8;
               g = ( ( wcbl * (int32_t)triangle->a->g ) + ( wacl * (int32_t)triangle->b->g ) + ( wbal * (int32_t)triangle->c->g ) ) >> 8;
               b = ( ( wcbl * (int32_t)triangle->a->b ) + ( wacl * (int32_t)triangle->b->b ) + ( wbal * (int32_t)triangle->c->b ) ) >> 8;

               if( !bmpPtr )
               {
                  //pixel not yet drawn in this line
                  bmpPtr = &((uint16_t*)( bmp->buffer ))[ x + ( y * bmp-> width ) ];
               }

               *bmpPtr++ = gfColor( r, g, b );

            }
            else
            {
               if( bmpPtr )
               {
                  //finished drawing this line, go to next one
                  break;
               }
            }
         }
      }
   }

   return 0;
}

uint32_t gfGouraudDrawTriangleFloat( tgfBitmap *bmp, tgfTriangle3D *triangle )
{
   int16_t      x;
   int16_t     y;

   int16_t       xMin;
   int16_t       xMax;
   int16_t       yMin;
   int16_t       yMax;

   int32_t        eba;
   int32_t        ecb;
   int32_t        eac;

   float       area;

   float       wba;
   float       wcb;
   float       wac;

   int16_t       r;
   int16_t       g;
   int16_t       b;

   tgfPoint3D  p;


   xMin = bmp->width - 1;
   yMin = bmp->height - 1;
   xMax = 0;
   yMax = 0;

   if( triangle->a->x2D > xMax )
   {
      xMax = triangle->a->x2D;
   }
   if( triangle->b->x2D > xMax )
   {
      xMax = triangle->b->x2D;
   }
   if( triangle->c->x2D > xMax )
   {
      xMax = triangle->c->x2D;
   }

   if( triangle->a->x2D < xMin )
   {
      xMin = triangle->a->x2D;
   }
   if( triangle->b->x2D < xMin )
   {
      xMin = triangle->b->x2D;
   }
   if( triangle->c->x2D < xMin )
   {
      xMin = triangle->c->x2D;
   }

   if( triangle->a->y2D > yMax )
   {
      yMax = triangle->a->y2D;
   }
   if( triangle->b->y2D > yMax )
   {
      yMax = triangle->b->y2D;
   }
   if( triangle->c->y2D > yMax )
   {
      yMax = triangle->c->y2D;
   }

   if( triangle->a->y2D < yMin )
   {
      yMin = triangle->a->y2D;
   }
   if( triangle->b->y2D < yMin )
   {
      yMin = triangle->b->y2D;
   }
   if( triangle->c->y2D < yMin )
   {
      yMin = triangle->c->y2D;
   }

  if ( xMin < 0 )
  {
   xMin = 0;
  }
  if ( yMin < 0 )
  {
   yMin = 0;
  }
  if ( xMax >= bmp->width )
  {
   xMax = bmp->width - 1;
  }
  if ( yMax >= bmp->height )
  {
   yMax = bmp->height - 1;
  }
 if ( xMin >= bmp->width )
  {
   xMin = bmp->width - 1;
  }
  if ( yMin >= bmp->height )
  {
   yMin = bmp->height - 1;
  }

   area = gfGouraudEdge( triangle->c, triangle->b, triangle->a );

   if( area > 0 )
   for( y = yMin; y <= yMax; y++ )
   {
      for( x = xMin; x <= xMax; x++ )
      {

         p.x2D = x;
         p.y2D = y;

         eba = gfGouraudEdge( triangle->b, triangle->a, &p );
         ecb = gfGouraudEdge( triangle->c, triangle->b, &p );
         eac = gfGouraudEdge( triangle->a, triangle->c, &p );

         //check if point inside triangle

         if( ( eba >= 0 ) && ( ecb >= 0 ) && ( eac >= 0 ) )
         {

            wba = eba / area;
            wcb = ecb / area;
            wac = eac / area;

            r = ( wcb * ( float )triangle->a->r ) + ( wac * ( float )triangle->b->r ) + ( wba * ( float )triangle->c->r );
            g = ( wcb * ( float )triangle->a->g ) + ( wac * ( float )triangle->b->g ) + ( wba * ( float )triangle->c->g );
            b = ( wcb * ( float )triangle->a->b ) + ( wac * ( float )triangle->b->b ) + ( wba * ( float )triangle->c->b );


            gfPlotF( bmp, x, y, gfColor( r, g, b ) );

         }

      }
   }

   return 0;
}


uint32_t gfGouraudDrawTexturedTriangleFloat( tgfBitmap *bmp, tgfTriangle3D *triangle )
{

   int16_t       x;
   int16_t       y;

   int16_t       xMin;
   int16_t       xMax;
   int16_t       yMin;
   int16_t       yMax;

   int32_t        eba;
   int32_t        ecb;
   int32_t        eac;

   float       area;

   float       wba;
   float       wcb;
   float       wac;

   int16_t       tx;
   int16_t       ty;

   tgfPoint3D  p;

   xMin = bmp->width - 1;
   yMin = bmp->height - 1;
   xMax = 0;
   yMax = 0;

   if( triangle->a->x2D > xMax )
   {
      xMax = triangle->a->x2D;
   }
   if( triangle->b->x2D > xMax )
   {
      xMax = triangle->b->x2D;
   }
   if( triangle->c->x2D > xMax )
   {
      xMax = triangle->c->x2D;
   }

   if( triangle->a->x2D < xMin )
   {
      xMin = triangle->a->x2D;
   }
   if( triangle->b->x2D < xMin )
   {
      xMin = triangle->b->x2D;
   }
   if( triangle->c->x2D < xMin )
   {
      xMin = triangle->c->x2D;
   }

   if( triangle->a->y2D > yMax )
   {
      yMax = triangle->a->y2D;
   }
   if( triangle->b->y2D > yMax )
   {
      yMax = triangle->b->y2D;
   }
   if( triangle->c->y2D > yMax )
   {
      yMax = triangle->c->y2D;
   }

   if( triangle->a->y2D < yMin )
   {
      yMin = triangle->a->y2D;
   }
   if( triangle->b->y2D < yMin )
   {
      yMin = triangle->b->y2D;
   }
   if( triangle->c->y2D < yMin )
   {
      yMin = triangle->c->y2D;
   }

  if ( xMin < 0 )
  {
   xMin = 0;
  }
  if ( yMin < 0 )
  {
   yMin = 0;
  }
  if ( xMax >= bmp->width )
  {
   xMax = bmp->width - 1;
  }
  if ( yMax >= bmp->height )
  {
   yMax = bmp->height - 1;
  }
if ( xMin >= bmp->width )
  {
   xMin = bmp->width - 1;
  }
  if ( yMin >= bmp->height )
  {
   yMin = bmp->height - 1;
  }


   area = gfGouraudEdge( triangle->c, triangle->b, triangle->a );

   if( area > 0 )
   for( y = yMin; y <= yMax; y++ )
   {
      for( x = xMin; x <= xMax; x++ )
      {

         p.x2D = x;
         p.y2D = y;

         eba = gfGouraudEdge( triangle->b, triangle->a, &p );
         ecb = gfGouraudEdge( triangle->c, triangle->b, &p );
         eac = gfGouraudEdge( triangle->a, triangle->c, &p );

         //check if point inside triangle

         if( ( eba >= 0 ) && ( ecb >= 0 ) && ( eac >= 0 ) )
         {

            wba = eba / area;
            wcb = ecb / area;
            wac = eac / area;


            tx = ( wcb * ( float )triangle->aTx2D ) + ( wac * ( float )triangle->bTx2D ) + ( wba * ( float )triangle->cTx2D );
            ty = ( wcb * ( float )triangle->aTy2D ) + ( wac * ( float )triangle->bTy2D ) + ( wba * ( float )triangle->cTy2D );


            gfPlotF( bmp, x, y, gfGetPixel( triangle->texture, tx, ty ) );

         }

      }
   }

   return 0;


}

uint32_t gfGouraudDrawTexturedTriangle( tgfBitmap *bmp, tgfTriangle3D *triangle )
{

   int16_t         x;
   int16_t         y;
   uint16_t        r;
   uint16_t         g;
   uint16_t         b;
   unsigned int16_t   texturePixel;

   int16_t         xMin;
   int16_t         xMax;
   int16_t         yMin;
   int16_t         yMax;

   int32_t            eba;
   int32_t            ecb;
   int32_t            eac;

   int32_t         areal;
   unsigned int32_t   areaNorm;

   int32_t         wbal;
   int32_t         wcbl;
   int32_t         wacl;


   int16_t         tx;
   int16_t         ty;
   unsigned char   tl;

   uint16_t       *bmpPtr;

   tgfPoint3D      p;

   xMin = bmp->width - 1;
   yMin = bmp->height - 1;
   xMax = 0;
   yMax = 0;

   if( triangle->a->x2D > xMax )
   {
      xMax = triangle->a->x2D;
   }
   if( triangle->b->x2D > xMax )
   {
      xMax = triangle->b->x2D;
   }
   if( triangle->c->x2D > xMax )
   {
      xMax = triangle->c->x2D;
   }

   if( triangle->a->x2D < xMin )
   {
      xMin = triangle->a->x2D;
   }
   if( triangle->b->x2D < xMin )
   {
      xMin = triangle->b->x2D;
   }
   if( triangle->c->x2D < xMin )
   {
      xMin = triangle->c->x2D;
   }

   if( triangle->a->y2D > yMax )
   {
      yMax = triangle->a->y2D;
   }
   if( triangle->b->y2D > yMax )
   {
      yMax = triangle->b->y2D;
   }
   if( triangle->c->y2D > yMax )
   {
      yMax = triangle->c->y2D;
   }

   if( triangle->a->y2D < yMin )
   {
      yMin = triangle->a->y2D;
   }
   if( triangle->b->y2D < yMin )
   {
      yMin = triangle->b->y2D;
   }
   if( triangle->c->y2D < yMin )
   {
      yMin = triangle->c->y2D;
   }

  if ( xMin < 0 )
  {
   xMin = 0;
  }
  if ( yMin < 0 )
  {
   yMin = 0;
  }
  if ( xMax >= bmp->width )
  {
   xMax = bmp->width - 1;
  }
  if ( yMax >= bmp->height )
  {
   yMax = bmp->height - 1;
  }
 if ( xMin >= bmp->width )
  {
   xMin = bmp->width - 1;
  }
  if ( yMin >= bmp->height )
  {
   yMin = bmp->height - 1;
  }

   areal = gfGouraudEdge( triangle->c, triangle->b, triangle->a );



   if( areal > 0 )
   {
      //areaNorm = 0x100000000 / areal;
      areaNorm = 0xffffffff / areal;


   for( y = yMin; y <= yMax; y++ )
   {

      bmpPtr = NULL;

      for( x = xMin; x <= xMax; x++ )
      {

         p.x2D = x;
         p.y2D = y;

         eba = gfGouraudEdge( triangle->b, triangle->a, &p );
         ecb = gfGouraudEdge( triangle->c, triangle->b, &p );
         eac = gfGouraudEdge( triangle->a, triangle->c, &p );

         //check if point inside triangle

         if( ( eba >= 0 ) && ( ecb >= 0 ) && ( eac >= 0 ) )
         {


            //wbal = ( eba << 8 ) / areal;
            //wcbl = ( ecb << 8 ) / areal;
            //wacl = ( eac << 8 ) / areal;
             

            wbal = ( eba * areaNorm ) >> 24;
            wcbl = ( ecb * areaNorm ) >> 24;
            wacl = ( eac * areaNorm ) >> 24;


            tx = ( ( wcbl * ( int32_t )triangle->aTx2D ) + ( wacl * ( int32_t )triangle->bTx2D ) + ( wbal * ( int32_t )triangle->cTx2D ) ) >> 8;
            ty = ( ( wcbl * ( int32_t )triangle->aTy2D ) + ( wacl * ( int32_t )triangle->bTy2D ) + ( wbal * ( int32_t )triangle->cTy2D ) ) >> 8;
            tl = ( ( wcbl * ( int32_t )triangle->a->r ) + ( wacl * ( int32_t )triangle->b->r ) + ( wbal * ( int32_t )triangle->c->r ) ) >> 8;


            //gfPlotF( bmp, x, y, gfGetPixel( triangle->texture, tx, ty ) );

            if( !bmpPtr )
            {
               //pixel not yet drawn in this line
               bmpPtr = &((uint16_t*)( bmp->buffer ))[ x + ( y * bmp-> width ) ];
            }

            texturePixel = gfGetPixel( triangle->texture, tx, ty );

            r = gfColorGetR( texturePixel ) * tl;
            g = gfColorGetG( texturePixel ) * tl;
            b = gfColorGetB( texturePixel ) * tl;

            *bmpPtr++ = gfColor( r >> 8 , g >> 8 , b >> 8  );


         }
         else
         {
            if( bmpPtr )
            {
               //finished drawing this line, go to next one
               break;
            }
         }
      }
   }
   }
   return 0;

}


*/
