#ifndef _USBHID_H
#define _USBHID_H

#ifdef __cplusplus
extern "C" 
{
#endif

#include "bsp.h"
#include "gfBitmap.h"

//1000ms key repeat delay
#define USBHID_KEYREPEAT_DELAY   1000

//8 keypresses per second while repeating last pressed key
#define USBHID_KEYREPEAT_RATE    128


uint32_t usbHIDInit( void );
uint32_t usbHIDSetMousePointerShape( tgfBitmap *pointerBitmap );
uint32_t usbHIDSetMousePointerVisibility( uint32_t visible );
uint32_t usbHidSetMouseReporting( uint32_t enable );

uint32_t usbHIDGetMouse( uint32_t *pmouseX, uint32_t *pmouseY, uint32_t *pmouseButtons );

uint32_t usbHIDHandleEvents( void );


#ifdef __cplusplus
}
#endif

#endif
