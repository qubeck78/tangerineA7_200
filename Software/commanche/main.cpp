#include "main.h"
#include <cstring>
#include <climits>
#include <math.h>

#include "../gfxLib/bsp.h"
#include "../gfxLib/osAlloc.h"
#include "../gfxLib/osFile.h"
#include "../gfxLib/gfBitmap.h"
#include "../gfxLib/gfDrawing.h"
#include "../gfxLib/gfFont.h"
#include "../gfxLib/osUIEvents.h"


extern tgfTextOverlay        con;

extern BSP_T        *bsp;
tgfBitmap            screen1;
tgfBitmap            screen2;
tgfBitmap            textureMap;
uchar               *heightMap;
tosFile              in;


struct 
{
      float x;       // x position on the map
      float y;       // y position on the map
      short height;  // height of the camera
      float angle;   // direction of the camera
      short horizon; // horizon position (look up and down)
      float distance; // distance of map
} camera = { 256, 256, 40, 0.1, 50, 100 };

char buf[128];

int animLeds( int j )
{   
      switch( j % 2 )
      {
         case 0:
            bsp->gpoPort |= 0x00f0;
            bsp->gpoPort ^= 0x0040;
         
            break;

         case 1:

            bsp->gpoPort |= 0x00f0;
            bsp->gpoPort ^= 0x0080;
         
            break;
      }
      
   return 0;
} 


int commanche( tgfBitmap *screen )
{

   int     screenwidth = 320;
   float   screenwidthf = screenwidth;
   
   int     screenheight = 200;

   int     mapwidthperiod = 512 - 1;
   int     mapheightperiod = 512 - 1;
   int     mapshift = 9;
   long    mapoffset;
   float   deltaz = 1.5f;
   short   y;
   short   x;
   float   z;
   float   invz;
   short   heightonscreen;
   ushort  color;
   long    cameraoffs;
   float   sinang;
   float   cosang;
   float   plx;
   float   ply;
   float   prx;
   float   pry;
   float   dx;
   float   dy;
   
   short    bw;
   short    bh;

   long    linvz;
   short   hiddeny[ 320 ];

   long    lplx;
   long    lply;
   long    ldx;
   long    ldy;
   float   cosangz;
   float   sinangz;
   
   gfFillRect( screen, 0, 0, screenwidth, screenheight, 0 );

   sinang      = (float)sin( camera.angle );
   cosang      = (float)cos( camera.angle );
   cameraoffs  = ( ( ((int)camera.y) & mapwidthperiod ) << mapshift ) + ( ((int)camera.x) & mapheightperiod );

   // Collision detection. Don't fly below the surface.
   if( ( heightMap[ cameraoffs ] + 10.0f ) > camera.height )
   {
      camera.height = heightMap[ cameraoffs ] + 10.0f;
   }

   for( x = 0; x < screenwidth; x++ )
   {
      hiddeny[ x ] = screenheight;
   }

   // Draw from front to back
   for( z = 1.0f; z < camera.distance; z += deltaz )
   {
      // 90 degree field of view
      
      cosangz  = cosang * z;
      sinangz  = sinang * z;

      
/*    plx =  -cosang * z - sinang * z;
      ply =   sinang * z - cosang * z;
      prx =   cosang * z - sinang * z;
      pry =  -sinang * z - cosang * z;
*/      

      plx =  ( -cosangz ) - sinangz;
      ply =   sinangz - cosangz;
      prx =   cosangz - sinangz;
      pry =  ( -sinangz ) - cosangz;
      
      dx = ( prx - plx ) / screenwidth;
      dy = ( pry - ply ) / screenheight;

      
      plx += camera.x;
      ply += camera.y;

//      invz = 1.0f / z * 100.0f;
//      invz = 100.0f / z;
      
//      linvz = invz * 256;
//      linvz = 25600 / (long)z;
      linvz = 12800 / (long)z;
   
   
      lplx  = plx * 256;
      lply  = ply * 256;
      ldx   = dx * 256;
      ldy   = dy * 256;
      
      
      for( x = 0; x < screenwidth; x++ )
      {
//          mapoffset = ( ( ((long)ply) & mapwidthperiod ) << mapshift ) + ( ((long)plx) & mapheightperiod );

         mapoffset = ( ( ( lply >> 8 ) & mapwidthperiod ) << mapshift ) + ( ( lplx >> 8 ) & mapheightperiod );
         
         heightonscreen = (short)( ( ( ( camera.height - heightMap[ mapoffset ] ) * linvz ) >> 8 ) + camera.horizon );
         
         if( heightonscreen < 0 )
         {
            heightonscreen = 0;
         }

         color = ((ushort *)textureMap.buffer)[ mapoffset ];
         
         if( heightonscreen < hiddeny[x] )
         {                
            
            //draw strip

            gfFillRect( screen, x, heightonscreen, x, hiddeny[x], color );

            hiddeny[ x ] = heightonscreen;
 
         }
         

         //plx += dx;
         //ply += dy;
         
         lplx += ldx;
         lply += ldy;
         
      }

      
      deltaz += 0.0025f;

   }

   return 0;
}

int main()
{
   ulong           i;
   ulong           rv;
   
   tosUIEvent      event;
   ulong           keyStatus;

   bspInit();
      
   setVideoMode( _VIDEOMODE_320_TEXT80_OVER_GFX );

   toPrint( &con, (char*)"tangyRiscVSOC Commanche B20240917\n" );
   toPrint( &con, (char*)"Map loading..." );

   //alloc screen buffers
   screen1.width           = 320;
   screen1.rowWidth        = 512;
   screen1.height          = 240;
   screen2.width           = 320;
   screen2.rowWidth        = 512;
   screen2.height          = 240;
   
   
   screen1.flags           = 0;
   screen1.transparentColor = 0;
   screen1.buffer           = osAlloc( screen1.rowWidth * screen1.height * 2, OS_ALLOC_MEMF_CHIP );  
   
   if( screen1.buffer == NULL )
   {
      toPrint( &con, (char*)"\nCan't alloc screen 1\n" );
      do{}while( 1 );
   } 
      
   screen2.flags           = 0;
   screen2.transparentColor = 0;
   screen2.buffer           = osAlloc( screen2.rowWidth * screen2.height * 2, OS_ALLOC_MEMF_CHIP ); 
   
   if( screen2.buffer == NULL )
   {
      toPrint( &con, (char*)"\nCan't alloc screen 2\n" );
      do{}while( 1 );
   } 
   
   //display first buffer
   gfDisplayBitmap( &screen1 );

   gfFillRect( &screen1, 0, 0, screen1.width - 1, screen1.height - 1 , gfColor( 0, 0, 0 ) ); 
   gfFillRect( &screen2, 0, 0, screen1.width - 1, screen1.height - 1 , gfColor( 0, 0, 0 ) ); 
   
   //init filesystem
   rv = osFInit();

   //init events queue
   osUIEventsInit();   

   rv = gfLoadBitmapFS( &textureMap, (char*)"ctexture.gbm" );

   if( rv )
   {
      toPrint( &con, (char*)"\nError, copy ctexture.gbm file to sd-card\n" );
   }

   heightMap = (uchar*)osAlloc( 262144, OS_ALLOC_MEMF_CHIP );

   if( !osFOpen( &in, (char*)"cheight.raw" , OS_FILE_READ ) )
   {
      osFRead( &in, (uchar*)heightMap, 262144, NULL );
      osFClose( &in );
   }
   else
   {
      toPrint( &con, (char*)"\nError, copy cheight.raw file to sd-card\n" );
   }
   
   i = 0;


   toPrint( &con, (char*)"done\n" );
      
   keyStatus = 0;

   do
   {   
      animLeds( i++ );
      
if( !osGetUIEvent( &event ) )
      {

         if( event.type == OS_EVENT_TYPE_KEYBOARD_KEYPRESS )
         {
            switch( event.arg1 )
            {
               case _KEYCODE_UP:
               
                  keyStatus |= 1;

               break;

               case _KEYCODE_DOWN:

                  keyStatus |= 2;

                  break;

               case _KEYCODE_RIGHT:

                  keyStatus |= 4;

               break;

               case _KEYCODE_LEFT:

                  keyStatus |= 8;

               break;
         
               case _KEYCODE_PGUP:

                  break;

               case _KEYCODE_PGDOWN:

                  break;

          case _KEYCODE_PAUSE:

              reboot();
              break;

            }
         }else if( event.type == OS_EVENT_TYPE_KEYBOARD_KEYRELEASE )
         {
            switch( event.arg1 )
            {
               case _KEYCODE_UP:
               
                  keyStatus &= 1 ^ 0xffffffff;

               break;

               case _KEYCODE_DOWN:

                  keyStatus &= 2 ^ 0xffffffff;

                  break;

               case _KEYCODE_RIGHT:

                  keyStatus &= 4 ^ 0xffffffff;

               break;

               case _KEYCODE_LEFT:

                  keyStatus &= 8 ^ 0xffffffff;

               break;
            }
         }  
      }



      if( keyStatus & 8 )
      {
         //left
         camera.angle += 0.1;

      }else if( keyStatus & 4 )
      {
         //right
         camera.angle -= 0.1;

      }

      if( keyStatus & 1 )
      {
         //up
         camera.height += 1;

      }else if( keyStatus & 2 )
      {
         //down

         if( camera.height > 0 )
         {
            camera.height -= 1;
         }

      }

      camera.x -= (float)sin( camera.angle ) * 1.1f;
      camera.y -= (float)cos( camera.angle ) * 1.1f;

      if( i & 1 )
      {
         gfDisplayBitmap( &screen2 );
         
         do{}while( ! bsp->videoVSync );
         
         commanche( &screen1 );
      }
      else
      {

         gfDisplayBitmap( &screen1 );
         
         do{}while( ! bsp->videoVSync );

         commanche( &screen2 );
      }

      
   }while( 1 ); 
   
} 