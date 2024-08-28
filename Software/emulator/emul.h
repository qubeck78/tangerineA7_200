#ifndef _EMUL_H
#define _EMUL_H

#include "../gfxLib/gftypes.h"

#define _RVEMUL_OK                        0
#define _RVEMUL_UNDEFINED_INSTRUCTION     1

#define _RVEMUL_EBREAK                    256

typedef struct _emContext_t
{

   //memory interface callback functions

                                 //addr
   ulong    ( *fetchInstruction )( ulong );

                           //addr
   ulong    ( *fetchData )( ulong );

                           //addr  mask   data
   ulong    ( *storeData )( ulong, uchar, ulong );

   ulong    pc;

   ulong    regs[32];
   long     *sregs;

   //instruction counter;

   ulong    instrCounter;

   //instruction decoder

   ulong     instruction;

   
}emContext_t;


ulong rvReset( emContext_t *ctx );
ulong rvStep( emContext_t *ctx );


#endif
