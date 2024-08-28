#ifndef _MEMIO_H
#define _MEMIO_H

#include "../gfxLib/gftypes.h"

ulong mioInit( void );

ulong fetchInstruction( ulong addr );
ulong fetchData( ulong addr );
ulong storeData( ulong addr, uchar mask, ulong data );

#endif
