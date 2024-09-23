
#ifndef _FILEOPERATIONS_H
#define _FILEOPERATIONS_H

#include "../gfxLib/gftypes.h"
#include "shellUI.h"

uint32_t pathSelectParentDirectory( char* path );
char* pathFindExtension( char* fileName );
uint32_t pathGetSelectedFileFromSelector( tselector *selector, char *fileName );

uint32_t remountSD( void );
uint32_t deleteFile( char *fileName );
uint32_t copyFile( char *fromFileName, char *toFileName, char *dialogTitle );
uint32_t createDir( char *path );
uint32_t moveFile( char *fromFileName, char *toFileName );
uint32_t renameFile( char *path, char *fileName );
uint32_t downloadFile( char *path );


#endif

