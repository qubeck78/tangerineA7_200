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

#include "../gfxLib/ff.h" 


#define texWidth 256
#define texHeight 256
#define screenWidth 320
#define screenHeight 200


//Make the tables twice as big as the screen. The center of the buffers is now the position (w,h).

#define tableRowSize ( screenWidth * 2 )
int *distanceTable;
int *angleTable;

void *allocPtr;

extern tgfTextOverlay    con;

tgfBitmap             screen1;
tgfBitmap             texture;


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

ulong init()
{
   ulong rv;
   int   x;
   int   y;
   int   w = screenWidth;
   int   h = screenHeight;

   rv = 0;

   bspInit();
      
   
   setVideoMode( _VIDEOMODE_320_TEXT80_OVER_GFX );
   
   //alloc screen buffers
   screen1.width        = 320;
   screen1.rowWidth     = 512;

   screen1.height       = 240;
   
   screen1.flags        = 0;
   screen1.transparentColor= 0;
   screen1.buffer          = osAlloc( screen1.rowWidth * screen1.height * 2, OS_ALLOC_MEMF_CHIP ); //osAlloc( 320 * 240 * 2 );
   
   if( screen1.buffer == NULL )
   {
      toPrint( &con, (char*)"\nCan't alloc screen1\n" );
      do{}while( 1 );
   } 
   
   //display first buffer
   gfDisplayBitmap( &screen1 );


   gfFillRect( &screen1, 0, 0, screen1.width - 1, screen1.height - 1 , gfColor( 0, 0, 0 ) ); 
   
   con.textAttributes = 0x8f;

   //init events queue
   osUIEventsInit();   

   //init filesystem
   rv = osFInit();


   if( rv )
   {
      toPrint( &con, ( char* )"SD init error!" );
      
      do{
      }while( 1 );      
   }

   rv = gfLoadBitmapFS( &texture, (char*)"0:demos/tunnel.gbm" );

   if( rv )
   {
      toPrint( &con, ( char* )"Can't load 0:/demos/tunnel.gbm\n" );

      do{
      }while( 1 );

   }
   toPrint( &con, ( char* )"Calculating tables\n" );

   distanceTable = (int*)osAlloc( ( screenWidth * 2 * screenHeight * 2 ) * 4, OS_ALLOC_MEMF_CHIP );
   angleTable = (int*)osAlloc( ( screenWidth * 2 * screenHeight * 2 ) * 4, OS_ALLOC_MEMF_CHIP );

  //generate non-linear transformation table, now for the bigger buffers (twice as big)
  for( y = 0; y < h * 2; y++)
  {
      for( x = 0; x < w * 2; x++)
      {
         int angle, distance;
         float ratio = 32.0;

         //these formulas are changed to work with the new center of the tables
         distance = (int)(ratio * texHeight / sqrt((float)((x - w) * (x - w) + (y - h) * (y - h)))) % texHeight;
         angle = (int)(0.5 * texWidth * atan2((float)(y - h), (float)(x - w)) / 3.1416);

         distanceTable[ x + y * tableRowSize ] = distance;
         angleTable[ x + y * tableRowSize ] = angle;
      }   

      toPrint( &con, ( char* )"." );
   }

   con.textAttributes = 0x0f;
   toCls( &con );

   return rv;
}

ulong tunnel( tgfBitmap *bmp, float animation )
{
   ushort color;
   ulong     tx;
   ulong     ty;
   int       x;
   int       y;
   int       w = screenWidth;
   int       h = screenHeight;
   int       shiftX;
   int       shiftY;
   int       shiftLookX;
   int       shiftLookY;

   ushort   *bmpPtr;

   //calculate the shift values out of the animation value
   shiftX   = (int)( texWidth * 1.0 * animation );
   shiftY   = (int)( texHeight * 0.25 * animation );
 
   //calculate the look values out of the animation value
   //by using sine functions, it'll alternate between looking left/right and up/down
   //make sure that x + shiftLookX never goes outside the dimensions of the table, same for y
   shiftLookX  = w / 2 + (int)( w / 2 * sin( animation ) );
   shiftLookY  = h / 2 + (int)( h / 2 * sin( animation * 2.0 ) );

   bmpPtr = (ushort*)bmp->buffer;
   bmpPtr += 512 * 20;

   for( y = 0; y < h; y++ )
   {
      for( x = 0; x < w; x++ )
      {
         //get the texel from the texture by using the tables, shifted with the animation variable
         //now, x and y are shifted as well with the "look" animation values

         tx = (ulong)(distanceTable[ ( x + shiftLookX ) + ( y + shiftLookY ) * tableRowSize] + shiftX )  % texWidth;
         ty = (ulong)(angleTable[ ( x + shiftLookX ) + ( y + shiftLookY ) * tableRowSize ] + shiftY ) % texHeight;

         *bmpPtr++ = ((ushort*)texture.buffer)[ tx + ty * texture.rowWidth ];

      }

      //row width - 512 pixels
      bmpPtr += 192;
   }
    return 0;  
}
int main()
{
   int         i;
   int         rv;
   
   tosUIEvent  event; 
   float       animation;
   
   init();

   animation = 0.0f;

   do
   {

      animation += 1.0f / 60.0f;

      tunnel( &screen1, animation );

      if( !osGetUIEvent( &event ) )
      { 
         if( event.type == OS_EVENT_TYPE_KEYBOARD_KEYPRESS )
         {
            switch( event.arg1 )
            {
               case _KEYCODE_PAUSE:

                  reboot();
                  break;  
            }
         }
      }
   
   }while( 1 );
   

} 


// Port of tunnel tutorial code by Lode Vandevenne 
// https://lodev.org/cgtutor/tunnel.html
// See end of file for license
//    /Mattias Gustavsson
//https://github.com/mattiasgustavsson/dos-like/blob/main/source/tunnel.c


/*
Lode's Computer Graphics Tutorial
Legal Stuff
This tutorial (including all the separate articles) is Copyright (c) 2004-2007 by Lode Vandevenne. All rights reserved. Do not copy/translate any of the content of this tutorial to a site/book/whatever without my permission.

Some photos are taken from the free photo archive at morguefile.com. These are of course copyright by the authors and contributers of Morguefile. A thank you goes to the photographers!

The source code of QuickCG and all the source code of the examples given in this tutorial and all its articles is released under the following license:

Copyright (c) 2004-2007, Lode Vandevenne

All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
