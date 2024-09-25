#include "usbHID.h"
#include "osUIEvents.h"
#include "gfDrawing.h"

static uint8_t    activeKeys[4];
static uint8_t    shiftState;

static uint32_t   lastPressedKeyRepeatTime;
static uint8_t    lastPressedKeyCode;

static int32_t    mouseX;
static int32_t    mouseY;
static int32_t    mouseButtons;
static int32_t    prvMouseButtons;
static uint8_t    mouseEventsEnabled;
static uint8_t    mousePointerVisible;

const char HIDkeys[] = {
    0x0, '-', 0x0, 0x00,
    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i',
    'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r',
    's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
    '1', '2', '3', '4', '5', '6', '7', '8', '9', '0',
    _KEYCODE_ENTER, _KEYCODE_ESC, _KEYCODE_BACKSPACE, // DEL
    _KEYCODE_TAB, // TAB
    ' ', // SPACE
    '-', '=', '[', ']', '\\', 0x00, ';', '\'', '`', ',', '.', '/', 
    _KEYCODE_CAPSLOCK, 
    _KEYCODE_F1, _KEYCODE_F2, _KEYCODE_F3, _KEYCODE_F4, _KEYCODE_F5, _KEYCODE_F6, _KEYCODE_F7, _KEYCODE_F8, _KEYCODE_F9, _KEYCODE_F10, _KEYCODE_F11, _KEYCODE_F12,
    _KEYCODE_PRTSCR, _KEYCODE_SCRLOCK, _KEYCODE_PAUSE, _KEYCODE_INSERT, _KEYCODE_HOME , _KEYCODE_PGUP, _KEYCODE_DELETE, _KEYCODE_END, _KEYCODE_PGDOWN, 
    _KEYCODE_RIGHT, // R_ARROW
    _KEYCODE_LEFT, // L_ARROW
    _KEYCODE_DOWN, // D_ARROW
    _KEYCODE_UP, // U_ARROW
};

const char HIDKeysShifted[] = {
    0x0, 0x0, '-', 0x0,
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I',
    'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
    'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
    '!', '@', '#', '$', '%', '^', '&', '*', '(', ')',
    _KEYCODE_ENTER, _KEYCODE_ESC, _KEYCODE_BACKSPACE, 
    _KEYCODE_TAB, // TAB
    ' ', // SPACE
    '_', '+', '{', '}', '|', 0x0, ':', '"', '~', '<', '>', '?', 
    _KEYCODE_CAPSLOCK, 
    _KEYCODE_F1, _KEYCODE_F2, _KEYCODE_F3, _KEYCODE_F4, _KEYCODE_F5, _KEYCODE_F6, _KEYCODE_F7, _KEYCODE_F8, _KEYCODE_F9, _KEYCODE_F10, _KEYCODE_F11, _KEYCODE_F12,
    _KEYCODE_PRTSCR, _KEYCODE_SCRLOCK, _KEYCODE_PAUSE, _KEYCODE_INSERT, _KEYCODE_HOME, _KEYCODE_PGUP, _KEYCODE_DELETE, _KEYCODE_END, _KEYCODE_PGDOWN, 
    _KEYCODE_RIGHT, // R_ARROW
    _KEYCODE_LEFT, // L_ARROW
    _KEYCODE_DOWN, // D_ARROW
    _KEYCODE_UP, // U_ARROW
};


static uint32_t findInArray( uint8_t element, uint8_t *array, int arrayLength )
{
  int i;

  for( i = 0; i < arrayLength; i++ )
  {
    if( array[i] == element )
    {
      return i;
    }
  }

  return -1;
}

uint32_t usbHIDInit()
{
   int i;

   for( i = 0 ; i < sizeof( activeKeys ); i++ )
   {
      activeKeys[i] = 0;
   }

   shiftState                 = 0;
   lastPressedKeyRepeatTime   = 0xffffffff;
   lastPressedKeyCode         = 0;

   mouseX                     = 0;
   mouseY                     = 0;
   mouseButtons               = 0;
   prvMouseButtons            = 0;
   mouseEventsEnabled         = 0;
   
   usbHIDSetMousePointerVisibility( 0 );


   return 0;
}

static uint32_t usbHIDRxMain( uint32_t rxData )
{
   uint8_t       shf;
   uint8_t       keys[3];
   int         i;
   int         pos;
   tosUIEvent  event;
   
   shf      = ( rxData >> 24 ) & 0xff;
   keys[2]  = ( rxData >> 16 ) & 0xff;
   keys[1]  = ( rxData >> 8 ) & 0xff;
   keys[0]  = ( rxData ) & 0xff;
   
   //check shift state
   
   if(( shf & 0x02 ) || ( shf & 0x20 ))
   {
      shiftState |= SST_SHIFT;
   }
   else
   {
      shiftState &= ( SST_SHIFT ^ 0xff );
   }
   
   if( shf & 0x01 )
   {
      shiftState |= SST_CONTROL;
   }
   else
   {
      shiftState &= ( SST_CONTROL ^ 0xff );
   }
     
   if( ( shf & 0x04 ) || ( shf & 0x40 ) )
   {
      shiftState |= SST_ALT;
   }
   else
   {
      shiftState &= ( SST_ALT ^ 0xff );
   }
   
   //check for key release
   for( i = 0; i < sizeof( activeKeys ); i++ )
   {
      if( activeKeys[i] != 0 )
      {
         //check if still pressed
         pos = findInArray( activeKeys[i], keys, sizeof( keys ) );
         
         if( pos == -1 )
         {
            
            //key has been released

            //generate keyrelease event
            event.type  = OS_EVENT_TYPE_KEYBOARD_KEYRELEASE;
            
            if( shiftState & SST_SHIFT )
            {
               event.arg1  = HIDKeysShifted[ activeKeys[i] ];
            }
            else
            {
               event.arg1  = HIDkeys[ activeKeys[i] ];               
            }
            event.arg2  = shiftState;
            event.arg3  = activeKeys[i];
            event.obj   = NULL;
            
            osPutUIEvent( &event );

            //check if that was last pressed key (for key repeat)
            if( activeKeys[i] == lastPressedKeyCode )
            {
               //clear last pressed key
               lastPressedKeyCode         = 0;
               lastPressedKeyRepeatTime   = 0xffffffff;
            }

            activeKeys[i] = 0;

         }
      }
   }
   
   //check for key press
   for( i = 0; i < sizeof( keys ); i++ )
   {
      if( keys[i] != 0 )
      {
         //we have a scancode
      
         //check if already pressed
         pos = findInArray( keys[i], activeKeys, sizeof( activeKeys ) );
      
         if( pos == -1 )
         {
            //key is not in activekeys, so we have a keydown event

            //store key value
            //find empty slot
            pos = findInArray( 0, activeKeys, sizeof( activeKeys ) );
            if( pos == -1 )
            {
               //error - not free slots, abort
            }
            else
            {
               //save key code
               activeKeys[pos] = keys[i];

               //generate keypress event
               event.type  = OS_EVENT_TYPE_KEYBOARD_KEYPRESS;
               
               if( shiftState & SST_SHIFT )
               {
                  event.arg1  = HIDKeysShifted[ keys[i] ];
               }
               else
               {
                  event.arg1  = HIDkeys[ keys[i] ];               
               }
               event.arg2  = shiftState;
               event.arg3  = keys[i];
               event.obj   = NULL;
               
               osPutUIEvent( &event );

               //store last pressed key code/time

               lastPressedKeyRepeatTime   = getTicks() + USBHID_KEYREPEAT_DELAY;
               lastPressedKeyCode         = keys[i];

            }     
      
         }
      }
   }
   

   return 0;
}

static uint32_t usbHIDKeyRepeatCheck()
{
   tosUIEvent  event;
 
   //do we have last pressed key?
   if( lastPressedKeyCode != 0 )
   {
      //check for key repeat timeout

      if( getTicks() >= lastPressedKeyRepeatTime )
      {

         lastPressedKeyRepeatTime   = getTicks() + USBHID_KEYREPEAT_RATE;

         //generate keypress event
         event.type  = OS_EVENT_TYPE_KEYBOARD_KEYPRESS;
         
         if( shiftState & SST_SHIFT )
         {
            event.arg1  = HIDKeysShifted[ lastPressedKeyCode ];
         }
         else
         {
            event.arg1  = HIDkeys[ lastPressedKeyCode ];               
         }
         event.arg2  = shiftState;
         event.arg3  = lastPressedKeyCode;
         event.obj   = NULL;
         
         osPutUIEvent( &event );

      }
   }

   return 0;
}

uint32_t usbHIDSetMousePointerShape( tgfBitmap *pointerBitmap )
{
   uint16_t *spriteRam;
   uint32_t  x;
   uint32_t  y;

   if( pointerBitmap == NULL )
   {
      return 1;
   }


   spriteRam = ( uint16_t* )( 0xf0120000 );

   for( y = 0; y < 32; y++ )
   {
      for( x = 0; x < 32; x++ )
      {
         *spriteRam++ = gfGetPixel( pointerBitmap, x, y );
      }
   }

   return 0;
}
uint32_t usbHIDSetMousePointerVisibility( uint32_t visible )
{
   if( visible )
   {
      
      spriteGen->spriteX   = mouseX + 47; 
      spriteGen->spriteY   = mouseY + 33;
      mousePointerVisible  = 1;

   }
   else
   {

      spriteGen->spriteX   = 0; 
      spriteGen->spriteY   = 0;
      mousePointerVisible  = 0;

   }

   return 0;
}

uint32_t usbHidSetMouseReporting( uint32_t enable )
{
   if( enable )
   {
      mouseEventsEnabled   = 1;
   }
   else
   {
      mouseEventsEnabled   = 0;
   }

   return 0;
}

uint32_t usbHIDGetMouse( uint32_t *pmouseX, uint32_t *pmouseY, uint32_t *pmouseButtons )
{
   if( pmouseX )
   {
      *pmouseX = mouseX;
   }

   if( pmouseY )
   {
      *pmouseY = mouseY;
   }

   if( pmouseButtons )
   {
      *pmouseButtons = mouseButtons;
   }

   return 0;
}
uint32_t usbHIDHandleEvents( void )
{
   uint32_t    currKeys;
   uint32_t    lastKeys;
   
   int32_t     mouseDx;
   int32_t     mouseDy;

   tosUIEvent  event;


   prvMouseButtons   = mouseButtons;
   mouseDx           = usbhost->usbHidMouseX;
   mouseDy           = usbhost->usbHidMouseY;
   mouseButtons      = usbhost->usbHidMouseButtons;


   if( mouseDx | mouseDy )
   {
      mouseX   += mouseDx;
      mouseY   += mouseDy;

      if( mouseX < 0 )
      {
         mouseX = 0;
      }
      
      if( mouseY < 0 )
      {
         mouseY = 0;
      }

      if( mouseX > 639 )
      {
         mouseX = 639;
      }
      
      if( mouseY > 479 )
      {
         mouseY = 479;
      }

      if( mousePointerVisible )
      {
         spriteGen->spriteX = mouseX + 47; 
         spriteGen->spriteY = mouseY + 33;
      }

      if( mouseEventsEnabled )
      {
         //generate mouse move event
         event.type  = OS_EVENT_TYPE_MOUSE_MOVE;
         
         event.arg1  = mouseButtons;    
         event.arg2  = mouseX;
         event.arg3  = mouseY;
         event.obj   = NULL;
         
         osPutUIEvent( &event );

      }

   }

   if( mouseEventsEnabled )
   {
      if( mouseButtons != prvMouseButtons )
      {
         if( ( !( prvMouseButtons & 1 ) && ( mouseButtons & 1 ) ) || ( !( prvMouseButtons & 2 ) && ( mouseButtons & 2 ) ) )
         {
            //keydown lmb or rmb

            //generate mouse key press event
            event.type  = OS_EVENT_TYPE_MOUSE_KEYDOWN;
            
            event.arg1  = mouseButtons;    
            event.arg2  = mouseX;
            event.arg3  = mouseY;
            event.obj   = NULL;
            
            osPutUIEvent( &event );
         }

         if( ( ( prvMouseButtons & 1 ) && !( mouseButtons & 1 ) ) || ( ( prvMouseButtons & 2 ) && !( mouseButtons & 2 ) ) )
         {
            //keyup lmb or rmb

            //generate mouse key press event
            event.type  = OS_EVENT_TYPE_MOUSE_KEYRELEASE;
            
            event.arg1  = mouseButtons;    
            event.arg2  = mouseX;
            event.arg3  = mouseY;
            event.obj   = NULL;
            
            osPutUIEvent( &event );
         }

      }
   }

   if( ! ( usbhost->usbHidKeyboardStatus & 1 ) )
   {
      while( ! ( usbhost->usbHidKeyboardStatus & 1 ))
      {
         currKeys = usbhost->usbHidKeyboardData;
         usbHIDRxMain( currKeys );
      }
   }
   else
   {
      //do keyrepeat check
      usbHIDKeyRepeatCheck();

   }   
   return 0;
}

