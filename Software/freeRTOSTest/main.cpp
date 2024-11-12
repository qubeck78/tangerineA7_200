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

#include "FreeRTOS.h"
#include "task.h"

extern tgfTextOverlay    con;
tgfBitmap                screen;

tgfBitmap                background;
tgfBitmap                cursor;

TaskHandle_t            mainTaskHandle;
TaskHandle_t            secondTaskHandle;

char static getKey()
{
   uint32_t    keyPressed;
   tosUIEvent  event; 
   
   do
   {
      while( !osGetUIEvent( &event ) )
      { 
         if( event.type == OS_EVENT_TYPE_KEYBOARD_KEYPRESS )
         {

            if( event.arg1 == _KEYCODE_PAUSE )
            {
               reboot();
            }
            else
            {
               return event.arg1;
            }
         }
      }

      delayMs( 10 );

   }while( 1 );

   return 0;
}

uint32_t drawBackground()
{
   uint32_t    x;
   uint32_t    y;
   uint32_t    i;

   uint16_t    *fb;

   fb = ( uint16_t* )screen.buffer;

   for( y = 0; y < 240; y++ )
   {
      for( x = 0; x < 320; x++ )
      {
         
         i = ( randomNumber() & 31 ) + 8;

         *fb++ =  gfColor( i, i, i );
      }

      fb += 192;
   }

   return 0;
}

void secondTask( void *pvParameters )
{
   uint32_t    x;
   uint32_t    y;
   uint32_t    i;
   uint16_t    *fb;


   do
   {

      fb = ( uint16_t* )screen.buffer;
      fb = &fb[ 120 * 512 ];

      for( y = 0; y < 64; y++ )
      {
         for( x = 0; x < 320; x++ )
         {
            
            i = ( randomNumber() & 255 );

            *fb++ =  gfColor( i, i, 0 );
         }

         fb += 192;
      }
   
    vTaskDelay( 10 );

   }while( 1 );

}

void mainTask( void *pvParameters )
{
   uint32_t    x;
   uint32_t    y;
   uint32_t    i;
   uint16_t    *fb;


   xTaskCreate( secondTask,
      "second",
      1024,
      NULL,
      tskIDLE_PRIORITY + 2,
      &secondTaskHandle );

   printf( "second task handle (lower bar):%x\n", (int)secondTaskHandle );
   
   do
   {

      fb = ( uint16_t* )screen.buffer;

      for( y = 0; y < 64; y++ )
      {
         for( x = 0; x < 320; x++ )
         {
            
            i = ( randomNumber() & 255 );

            *fb++ =  gfColor( 0, 0, i );
         }

         fb += 192;
      }


      toSetCursorPos( &con, 0, 5 );
      printf("xTaskGetTickCount() %d\n",xTaskGetTickCount() );

      vTaskDelay( 10 );
      
   }while( 1 );

}

//TODO: check whether mret should restore irq enable status
//   xPortSysTickHandler
//   xTaskIncrementTick();

int main()
{
   uint32_t    i;
   uint32_t    rv;
   char        c;

   tosUIEvent  event;
   
   __disable_irq();
   bsp->mtimeCmp = 0xffffffffffffffff;

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
   drawBackground();

   
   //init events queue
   rv = osUIEventsInit();   
   
   //init filesystem
   rv = osFInit();

   con.textAttributes = 0x0d;

   printf( "freeRTOS test B20241112, FreeRTOSv202406.01-LTS\n\n" );
   
/*   usbHIDSetMousePointerVisibility( 1 );
   usbHidSetMouseReporting( 1 );
*/


   xTaskCreate( mainTask,
      "main",
      1024,    //stack
      NULL,
      tskIDLE_PRIORITY + 2,
      &mainTaskHandle );

   printf( "mainTask handle (upper bar):%x\n", (int)mainTaskHandle );

   
   getKey();



   //clear pending irqs
   asm volatile( "csrrwi zero, 0x344, 0" );

   vTaskStartScheduler();

   do
   {      
   }while( 1 );
   
} 