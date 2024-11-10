#include "main.h"
#include <cstring>
#include <climits>
#include <cstdio>

#include "bsp.h"
#include "osAlloc.h"
#include "osFile.h"
#include "gfBitmap.h"
#include "gfDrawing.h"
#include "gfFont.h"
#include "osUIEvents.h"
#include "usbHID.h"

extern tgfTextOverlay   con;
tgfBitmap               screen;
tgfBitmap               background;
tgfBitmap               cursor;

volatile uint32_t       irqCounter = 0;


extern "C" void ___isrMain()
{

   bsp->mtimeCmp = bsp->mtime + ( 100000000 );

   irqCounter++;

}

static uint32_t waitKey()
{
   uint32_t    keyPressed;
   tosUIEvent  event; 

   keyPressed = 0;
   
   do
   {
      while( !osGetUIEvent( &event ) )
      { 
         if( event.type == OS_EVENT_TYPE_KEYBOARD_KEYPRESS )
         {
            keyPressed = 1;

            if( event.arg1 ==  _KEYCODE_PAUSE )
            {
               reboot();
            }
         }
      }

      delayMs( 10 );

   }while( !keyPressed );
   
   return 0;
}

int main()
{
   uint32_t    i;
   uint32_t    rv;
   uint64_t    mtm;

   tosUIEvent  event;
   
   bspInit();                                 

   setVideoMode( _VIDEOMODE_320_TEXT80_OVER_GFX );
   
   //alloc screen buffers
   screen.width            = 320;
   screen.rowWidth         = 512;
   screen.height           = 240;
   
   
   screen.flags            = 0;
   screen.transparentColor = 0;
   screen.buffer           = osAlloc( screen.rowWidth * screen.height * 2, OS_ALLOC_MEMF_CHIP );
   
   if( screen.buffer == NULL )
   {
      toPrint( &con, (char*)"\nCan't alloc screen\n" );
      do{}while( 1 );
   } 
      
   
   //display first buffer
   gfDisplayBitmap( &screen );

   gfFillRect( &screen, 0, 0, screen.width - 1, screen.height - 1 , gfColor( 0, 0, 0 ) ); 
   
   //init events queue
   rv = osUIEventsInit();   
   
   //init filesystem
   rv = osFInit();

   toPrintF( &con, (char*)"mtime IRQ test B20241110\n" );
   
/*   usbHIDSetMousePointerVisibility( 1 );
   usbHidSetMouseReporting( 1 );
*/


   __disable_irq();
   bsp->mtimeCmp = bsp->mtime + ( 100000000 );
   __enable_irq();
   
   do
   {
//      waitKey();

      delayMs( 10000 );

      mtm = bsp->mtime;

      toPrintF( &con, (char*)"IRQ counter: %d\n", irqCounter );
      toPrintF( &con, (char*)"mtimehi: %u\n", (uint32_t)( mtm >> 32 ) );
      toPrintF( &con, (char*)"mtimelo: %u\n", (uint32_t)( mtm & 0xffffffff ) );
      
   }while( 1 );
   
} 