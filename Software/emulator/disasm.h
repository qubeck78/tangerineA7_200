#ifndef _DISASM_H
#define _DISASM_H

#include "../gfxLib/gftypes.h"

typedef struct _dsContext_t
{
   ulong    *codeBuf;
   ulong     codeBufIdx;
   ulong     codeBufStartPc;

   //instruction decoder

   ulong     instruction;
   ulong     pc;

   //Common
   uchar    opcode;
   uchar    rd;
   uchar    funct3;
   uchar    rs1;
   uchar    rs2;

   //R-type
   uchar    rtFunct7;

   //I-type
   ulong    itImm;

   //S-type
   ulong    stImm;

   //B-type
   ulong    btImm;

   //U-type
   ulong    utImm;

   //J-type
   ulong    jtImm;

}dsContext_t;

ulong nameRegister( ulong r, char *outputBuffer );
ulong dsDisassemble( dsContext_t *ctx, char *outputBuffer );

#endif
