#ifndef _OSUIEVENTS_H
#define _OSUIEVENTS_H

#ifdef __cplusplus
extern "C" 
{
#endif

#include "gfTypes.h"

#define OS_EVENT_TYPE_USB_MS_CONNECT      0x0001
#define OS_EVENT_TYPE_USB_MS_DISCONNECT   0x0002

#define OS_EVENT_TYPE_KEYBOARD_KEYPRESS   0x0101
#define OS_EVENT_TYPE_KEYBOARD_KEYDOWN    0x0102
#define OS_EVENT_TYPE_KEYBOARD_KEYRELEASE 0x0103

#define OS_EVENT_TYPE_MOUSE_MOVE          0x0201
#define OS_EVENT_TYPE_MOUSE_KEYDOWN       0x0202
#define OS_EVENT_TYPE_MOUSE_KEYRELEASE    0x0203

#define SST_SHIFT     1
#define SST_CONTROL   2
#define SST_ALT       4

#define _KEYCODE_RIGHT     0x01
#define _KEYCODE_LEFT      0x02
#define _KEYCODE_DOWN      0x03
#define _KEYCODE_UP        0x04

#define _KEYCODE_BACKSPACE 0x08
#define _KEYCODE_TAB       0x09
#define _KEYCODE_ENTER     0x0a

#define _KEYCODE_ESC       0x1b

#define _KEYCODE_DELETE    0x7f
#define _KEYCODE_F1        0x80
#define _KEYCODE_F2        0x81
#define _KEYCODE_F3        0x82
#define _KEYCODE_F4        0x83
#define _KEYCODE_F5        0x84
#define _KEYCODE_F6        0x85
#define _KEYCODE_F7        0x86
#define _KEYCODE_F8        0x87
#define _KEYCODE_F9        0x88
#define _KEYCODE_F10       0x89
#define _KEYCODE_F11       0x8a
#define _KEYCODE_F12       0x8b
#define _KEYCODE_PGUP      0x8c
#define _KEYCODE_PGDOWN    0x8d
#define _KEYCODE_END       0x8e
#define _KEYCODE_INSERT    0x8f
#define _KEYCODE_HOME      0x90
#define _KEYCODE_CAPSLOCK  0x91
#define _KEYCODE_PRTSCR    0x92
#define _KEYCODE_SCRLOCK   0x93
#define _KEYCODE_PAUSE     0x94

typedef struct _tosUIEvent
{
   uint16_t type;
   uint32_t   arg1;
   uint32_t   arg2;
   uint32_t arg3;
   void    *obj;

}tosUIEvent;

//Store up to 32 user interaction events
#define OS_UI_EVENT_QUEUE_DEPTH     32

typedef struct _tosUIEventQueue
{
    volatile uint16_t     lock;

   volatile tosUIEvent  queue[OS_UI_EVENT_QUEUE_DEPTH];

   volatile uint32_t      rdIdx;
   volatile uint32_t      wrIdx;
    volatile uint16_t     elementCount;

}tosUIEventQueue;



uint32_t osUIEventsInit( void );


uint32_t osPutUIEvent( tosUIEvent *event );

uint32_t osGetUIEvent( tosUIEvent *event );


#ifdef __cplusplus
}
#endif

#endif
