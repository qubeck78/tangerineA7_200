#include "gfLibInterface.h"

#include "../gfxLib/bsp.h"
#include "../gfxLib/osAlloc.h"
#include "../gfxLib/osFile.h"
#include "../gfxLib/gfFont.h"
#include "../gfxLib/osUIEvents.h"

#include <cstdio>

static tosFile              fileStruct;
static uint32_t             fileOpen;
static volatile uint32_t   *paletteRegisters;
static uint32_t            *frameBuffer;
extern tgfTextOverlay       con;

int32_t gfLibInterfaceInit( void *pframeBuffer )
{
   fileOpen = 0;
   paletteRegisters = (volatile uint32_t*)( 0xf0920000 );

   if( pframeBuffer == NULL )
   {
      printf( "ERROR: gfLibInterfaceInit: pframeBuffer is NULL!\n" );
      return 1;
   }

   frameBuffer = ( uint32_t* )pframeBuffer;

   return 0;
}


_extc void *gfAlloc( uint32_t size )
{
   return osAlloc( size, OS_ALLOC_MEMF_CHIP ); 
}

_extc void *gfReAlloc( void *memPtr, uint32_t size )
{
   return osRealloc( memPtr, size, OS_ALLOC_MEMF_CHIP );
}

_extc int gfOpen( const char *fileName, int flags )
{
   if( fileOpen )
   {
      printf( "ERROR: gfOpen tries to open more than one file.\n" );
      return -1;
   }

   printf( "osFOpen: \"%s\"\n", (char*)fileName );
   
   if( !osFOpen( &fileStruct, ( char* )fileName, OS_FILE_READ ) )
   {
      fileOpen = 1;
      return 1;
   }

   return -1;
}

_extc int gfClose( int fd )
{
   if( fileOpen )
   {
      osFClose( &fileStruct );
      fileOpen = 0;
   }

   return 0;
}

_extc int gfRead( int fd, void *buffer, size_t size )
{
   uint32_t nbr;

   if( !fileOpen )
   {
      printf( "ERROR: gfRead without open file\n" );
      
      return 0;
   }

   osFRead( &fileStruct, ( uint8_t* )buffer, (uint32_t)size, &nbr );

   return nbr;
}

_extc uint32_t gfFileLength( const char *fileName )
{
   return osFSize( ( char* ) fileName );
}

_extc uint32_t gfFSeek( int fd, uint32_t offset, uint32_t whence )
{
   if( whence != SEEK_SET )
   {
      printf( "ERROR: gfFseek with offset definition:%d\n", whence );
      return 1;
   }

   if( !fileOpen )
   {
      printf( "ERROR: gfFseek without file open\n" );
      return 1;
   }

   osFSeek( &fileStruct, offset, OS_SEEK_SET );

   return 0;
}

_extc uint32_t gfGetFrameTimerValue( void )
{
   return bsp->frameTimer;
}

_extc uint32_t gfSetPaletteEntry( uint32_t entry, uint32_t rgb )
{
   paletteRegisters[ entry & 0xff ] = rgb;

   return 0;
}

_extc uint32_t gfClsConsole()
{

   con.textAttributes = 0x0f;
   toCls( &con );

   con.textAttributes = 0x8f;

   return 0;
}

_extc uint32_t gfRenderScreen( uint8_t *fb, uint32_t screenWidth, uint32_t screenHeight )
{
   uint32_t x;
   uint32_t y;

   uint32_t *fbs;
   uint32_t *fbd;

   fbs = (uint32_t*)fb;
   fbd = frameBuffer;


   for( y = 0; y < 200; y++ )
   {
      for( x = 0; x < 80; x++ )
      {
         *fbd++ = *fbs++;
      }

      fbd += 48;  
   }

   return 0;
}

_extc uint32_t gfWaitVBL( void )
{

   return 0;
}

_extc uint32_t gfGetKey( void )
{
   tosUIEvent  event;
   uint32_t    keyRelease;


   keyRelease = 0;

   if( !osGetUIEvent( &event ) )
   { 
      if(( event.type == OS_EVENT_TYPE_KEYBOARD_KEYPRESS ) || ( event.type == OS_EVENT_TYPE_KEYBOARD_KEYRELEASE ) )
      {

         if( event.type == OS_EVENT_TYPE_KEYBOARD_KEYRELEASE )
         {
            keyRelease = 0x80000000;
         }

         switch( event.arg1 )
         {

            case _KEYCODE_ENTER:

               return 13 | keyRelease;
               break;

            case _KEYCODE_UP:

               return 0xad | keyRelease;
               break;

            case _KEYCODE_DOWN:

               return 0xaf | keyRelease;
               break;

            case _KEYCODE_LEFT:

               return 0xac | keyRelease;
               break;

            case _KEYCODE_RIGHT:

               return 0xae | keyRelease;
               break;

            case _KEYCODE_F1:

                break;

            default:

               return ( event.arg1 | keyRelease );
               break;
         }
      }

   }


   return 0;
}