#ifndef _MEMIO_H
#define _MEMIO_H

#include "../gfxLib/gftypes.h"

uint32_t mioInit( void );

uint32_t fetchInstruction( uint32_t addr );
uint32_t fetchData( uint32_t addr );
uint32_t storeData( uint32_t addr, uint8_t mask, uint32_t data );

#endif
