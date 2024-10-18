#ifndef _GFLIBINTERFACE_H
#define _GFLIBINTERFACE_H

#include <stdint.h>
#include <sys/types.h>
#include <unistd.h>

#ifdef __cplusplus

#define _extc extern "C" 

#else

#define _extc 

#endif

#define O_RDONLY  1
#define O_BINARY  2

int32_t gfLibInterfaceInit( void *pframeBuffer );


_extc void *gfAlloc( uint32_t size );
_extc void *gfReAlloc( void *memPtr, uint32_t size );
_extc int gfOpen( const char *fileName, int flags );
_extc int gfClose( int fd );
_extc int gfRead( int fd, void *buffer, size_t size );
_extc uint32_t gfFileLength( const char *fileName );
_extc uint32_t gfFSeek( int fd, uint32_t offset, uint32_t whence );
_extc uint32_t gfGetFrameTimerValue( void );
_extc uint32_t gfSetPaletteEntry( uint32_t entry, uint32_t rgb );
_extc uint32_t gfClsConsole( void );
_extc uint32_t gfRenderScreen( uint8_t *fb, uint32_t screenWidth, uint32_t screenHeight );
_extc uint32_t gfWaitVBL( void );
_extc uint32_t gfGetKey( void );

#endif
