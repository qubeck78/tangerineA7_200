#ifndef _GFFONT_H
#define _GFFONT_H

#ifdef __cplusplus
extern "C" 
{
#endif


#include "gfTypes.h"
#include "gfBitmap.h"

#define GF_FONT_TYPE_MONO_BITMAP_FIXED_WIDTH	0x0001
#define GF_FONT_TYPE_MONO_BITMAP_VAR_WIDTH   	0x0002
#define GF_FONT_TYPE_ALPHA4_BITMAP_FIXED_WIDTH	0x0003
#define GF_FONT_TYPE_ALPHA4_BITMAP_VAR_WIDTH   	0x0004


#define GF_FONT_FLAG_TRANSPARENT  		1
#define GF_FONT_FLAG_ALPHA_BACKGROUND	2

typedef struct _tgfFont
{
	uint16_t   type;
	uint16_t   flags;

	uint16_t   width;
	uint16_t   height;

	uint16_t   charColor;
	uint16_t   backgroundColor;

	uint8_t    firstChar;
	uint8_t    lastChar;

	uint8_t   *charWidths;
	void    *charBuffer;

}tgfFont;

#define GF_TEXT_OVERLAY_TYPE_SOFTWARE       0x0000
#define GF_TEXT_OVERLAY_TYPE_HARDWARE       0x8000

#define GF_TEXT_OVERLAY_FLAG_SHOW_CURSOR    0x0001
typedef struct _tgfTextOverlay
{
	uint16_t   type;
	uint16_t   flags;

	uint16_t   width;
	uint16_t   height;

	uint16_t   cursX;
	uint16_t   cursY;
	uint8_t    textAttributes;

	tgfFont *font;

	uint8_t   *textBuffer;
	
}tgfTextOverlay;



uint32_t gfLoadFontFS( tgfFont *dest, char *fileName );

int16_t gfPutChar( tgfBitmap *bmp, tgfFont *font, int16_t x, int16_t y, char c );
int16_t gfPutString( tgfBitmap *bmp, tgfFont *font, int16_t x, int16_t y, char *string );

uint32_t gfDrawTextOverlay( tgfBitmap *bmp, tgfTextOverlay *textOverlay, int16_t x, int16_t y );

uint32_t toSetCursorPos( tgfTextOverlay *overlay, uint16_t cursX, uint16_t cursY );
uint32_t toCls( tgfTextOverlay *overlay );
uint32_t toScrollUp( tgfTextOverlay *overlay );
uint32_t toPrint( tgfTextOverlay *overlay, char *string );
uint32_t toPrintF( tgfTextOverlay *overlay, char *format, ... );


#ifdef __cplusplus
}
#endif

#endif
