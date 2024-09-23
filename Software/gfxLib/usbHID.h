#ifndef _USBHID_H
#define _USBHID_H

#include "bsp.h"

#include "../gfxLib/osUIEvents.h"

//1000ms key repeat delay
#define USBHID_KEYREPEAT_DELAY   1000

//8 keypresses per second while repeating last pressed key
#define USBHID_KEYREPEAT_RATE    128


uint32_t usbHIDInit( void );
uint32_t usbHIDHandleEvents( void );

#endif
