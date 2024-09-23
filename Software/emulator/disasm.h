#ifndef _DISASM_H
#define _DISASM_H

#include "../gfxLib/gftypes.h"

typedef struct _dsContext_t
{
   uint32_t    *codeBuf;
   uint32_t     codeBufIdx;
   uint32_t     codeBufStartPc;

   //instruction decoder

   uint32_t     instruction;
   uint32_t     pc;

   //Common
   uint8_t    opcode;
   uint8_t    rd;
   uint8_t    funct3;
   uint8_t    rs1;
   uint8_t    rs2;

   //R-type
   uint8_t    rtFunct7;

   //I-type
   uint32_t    itImm;

   //S-type
   uint32_t    stImm;

   //B-type
   uint32_t    btImm;

   //U-type
   uint32_t    utImm;

   //J-type
   uint32_t    jtImm;

}dsContext_t;

uint32_t nameRegister( uint32_t r, char *outputBuffer );
uint32_t dsDisassemble( dsContext_t *ctx, char *outputBuffer );

#endif
