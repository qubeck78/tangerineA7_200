#ifndef _OSFILE_H
#define _OSFILE_H

#ifdef __cplusplus
extern "C" 
{
#endif


#include "gfTypes.h"
#include <string.h>


#ifdef _GFXLIB_SDL

  #include <stdio.h>
   #include <dirent.h>

#endif

#ifdef _GFXLIB_ESP32_FFAT

  #include "FS.h"
  #include "FFat.h"

#endif

#ifdef _GFXLIB_STM32_FATFS

   /* FatFs includes component */
   #include "ff_gen_drv.h"
   #include "usbh_diskio.h"

#endif

#ifdef _GFXLIB_MC68K_FATFS

   /* FatFs includes component */

   #include "../ff.h"

#endif
#ifdef _GFXLIB_RISCV_FATFS

   /* FatFs includes component */

   #include "ff.h"
   #include "diskio.h"

#endif

#define OS_FILE_READ   1
#define OS_FILE_WRITE  2
#define OS_FILE_APPEND 4


#define OS_DIRITEM_NONE 0
#define OS_DIRITEM_FILE 1
#define OS_DIRITEM_DIR  2

#define OS_SEEK_SET     0
#define OS_SEEK_CUR     1
#define OS_SEEK_END     2

typedef struct _tosFile
{

#ifdef _GFXLIB_SDL
   FILE *fd;
#endif

#ifdef _GFXLIB_ESP32_FFAT
   File fd;
#endif

#if defined( _GFXLIB_STM32_FATFS ) || defined( _GFXLIB_MC68K_FATFS ) || defined( _GFXLIB_RISCV_FATFS )
   FIL   fd;
#endif

}tosFile;

typedef struct _tosDir
{

   char   dirPath[256];

#ifdef _GFXLIB_SDL

   DIR   *dd;

#endif

#if defined( _GFXLIB_STM32_FATFS ) || defined( _GFXLIB_MC68K_FATFS ) || defined( _GFXLIB_RISCV_FATFS )

   DIR    dd; 

#endif


}tosDir;

typedef struct _tosDirItem
{
   
   char  name[256];
   char  type;
   uint32_t size;

}tosDirItem;


uint32_t osFInit( void );
uint32_t osFOpen( tosFile *file, char *path, uint32_t mode );
uint32_t osFClose( tosFile *file );
uint32_t osFWrite( tosFile *file, uint8_t *buffer, uint32_t numBytesToWrite );
uint32_t osFRead( tosFile *file, uint8_t *buffer, uint32_t numBytesToRead, uint32_t *numBytesRead );
uint32_t osFGetS( tosFile *file, uint8_t *buffer, uint32_t maxLength );
uint32_t osFSeek( tosFile *file, int32_t offset, uint32_t whence );

uint32_t osDirOpen( tosDir *dir, char *path );
uint32_t osDirClose( tosDir *dir );
uint32_t osDirRead( tosDir *dir, tosDirItem *dirItem );

uint32_t osFSize( char *path );
uint32_t osFDelete( char *path );
uint32_t osMkDir( char *path );
uint32_t osRename( char *pathOld, char *pathNew );

#ifdef __cplusplus
}
#endif

#endif

