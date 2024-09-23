#ifndef _SHELLUI_H
#define _SHELLUI_H

#include "../gfxLib/gftypes.h"

#define _MAXFILENAMELENGTH 128

#define _SELECTOR_WINDOW_HEIGHT  25

#define _UI_INFO_WINDOW_BUTTONS_NONE   0
#define _UI_INFO_WINDOW_BUTTONS_YESNO  1
#define _UI_INFO_WINDOW_BUTTONS_OK     2
#define _UI_INFO_WINDOW_BUTTONS_CANCEL 3

typedef struct _tselector
{

   char     path[256];
   
   uint16_t   x;
   uint16_t   y;

   uint16_t   selectorActive;
   long     selectorWindowIdx;
   long     selectorCursorPos;
   long     selectorWindowHeight;
   char     selectorFileNames[_SELECTOR_WINDOW_HEIGHT][_MAXFILENAMELENGTH + 1];
   uint32_t    selectorFileLengths[_SELECTOR_WINDOW_HEIGHT];
   
}tselector;

uint32_t uiDrawStatusBar( void );
uint32_t uiDrawSelectorWindowFrame( tselector *selector );
uint32_t uiDrawSelectorWindowContents( tselector *selector );
uint32_t uiReadDirAndFillSelectorWindowContents( tselector *selector );
uint32_t uiDrawInfoWindow( char *title, char *contents, uint32_t buttons );

#endif

