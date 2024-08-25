#include "emul.h"


ulong rvReset( emContext_t *ctx )
{
   if( ctx == NULL )
   {
      return 1;
   }

   ctx->pc        = 0;
   ctx->regs[0]   = 0;

   ctx->sregs = ( long* ) &ctx->regs[0];

   return 0;
}


ulong rvStep( emContext_t *ctx )
{
   ulong rv;
   ulong iDecAux;
   ulong instruction;
   ulong i;
   ulong j;

   //fetch instruction

   ctx->instruction  = ctx->fetchInstruction( ctx->pc );
   
   instruction       = ctx->instruction;


   //advance pc
   ctx->pc += 4;

   //decode instruction

   //common

   ctx->opcode = instruction & 0b1111111;
   ctx->rd     = ( instruction >> 7 ) & 0b11111;
   ctx->funct3 = ( instruction >> 12 ) & 0b111;
   ctx->rs1    = ( instruction >> 15 ) & 0b11111;
   ctx->rs2    = ( instruction >> 20 ) & 0b11111;

   //R-type

   ctx->rtFunct7  = ( instruction >> 25 ) & 0b1111111;

   //I-type

   ctx->itImm     = ( instruction >> 20 ) & 0b111111111111;

   if( ctx->itImm & 0b1000000000000 )
   {
      ctx->itsImm = ctx->itImm | 0b11111111111111111111000000000000;
   }
   else
   {
      ctx->itsImm = ctx->itImm;      
   }

   //S-type

   ctx->stImm     = ( instruction >> 7 ) & 0b11111;
   iDecAux        = ( instruction >> 25 ) & 0b1111111;
   ctx->stImm     |= iDecAux << 5;

   //B-type

   iDecAux        = ( instruction >> 7 ) & 0b1;
   ctx->btImm     = iDecAux << 11;
   iDecAux        = ( instruction >> 8 ) & 0b1111;
   ctx->btImm     |= iDecAux << 1;
   iDecAux        = ( instruction >> 25 ) & 0b111111;
   ctx->btImm     |= iDecAux << 5;
   iDecAux        = ( instruction >> 31 ) & 0b1;
   ctx->btImm     |= iDecAux << 12;

   //U-type

   ctx->utImm     = instruction & 0b11111111111111111111000000000000;

   //J-type

   //33222222222211111111110000000000
   //10987654321098765432109876543210
   //21000000000111111111rrrrrooooooo
   //00987654321198765432dddddccccccc
  
   iDecAux        = ( instruction >> 12 ) & 0b11111111;
   ctx->jtImm     = iDecAux << 12;

   iDecAux        = ( instruction >> 20 ) & 0b1;
   ctx->jtImm     |= iDecAux << 11;

   iDecAux        = ( instruction >> 21 ) & 0b1111111111;
   ctx->jtImm     |= iDecAux << 1;
   
   iDecAux        = ( instruction >> 31 ) & 0b1;
   ctx->jtImm     |= iDecAux << 20;



   //decode opcodes


   rv = _RVEMUL_UNDEFINED_INSTRUCTION;

   switch( ctx->opcode )
   {

      //RV32I

      //R - type
      case 0b0110011:


         //RV32M
         if( ctx->rtFunct7 == 0x01 )
         {
            switch( ctx->funct3 )
            {

            case 0x0:

//               sprintf( outputBuffer, "mul   %s, %s, %s", regDName, regS1Name, regS2Name );
               break;

            case 0x1:

//               sprintf( outputBuffer, "mulh  %s, %s, %s", regDName, regS1Name, regS2Name );
               break;

            case 0x2:

//               sprintf( outputBuffer, "mulsu %s, %s, %s", regDName, regS1Name, regS2Name );
               break;

            case 0x3:

//               sprintf( outputBuffer, "mulu  %s, %s, %s", regDName, regS1Name, regS2Name );
               break;

            case 0x4:

//               sprintf( outputBuffer, "div   %s, %s, %s", regDName, regS1Name, regS2Name );
               break;

            case 0x5:

//               sprintf( outputBuffer, "divu  %s, %s, %s", regDName, regS1Name, regS2Name );
               break;

            case 0x6:

//               sprintf( outputBuffer, "rem   %s, %s, %s", regDName, regS1Name, regS2Name );
               break;
 
             case 0x7:

//               sprintf( outputBuffer, "remu  %s, %s, %s", regDName, regS1Name, regS2Name );
               break;

           }
         }
         else
         {
            //RV32I
            
            switch( ctx->funct3 )
            {
               case 0x0:

                  if( ctx->rtFunct7 == 0x00 )
                  {


//                   add   rd, rs1, rs2

                     rv = _RVEMUL_OK;

                     if( ctx->rd )
                     {
                        ctx->regs[ctx->rd] = ctx->regs[ctx->rs1] + ctx->regs[ctx->rs2];
                     }

                  }else if( ctx->rtFunct7 == 0x20 )
                  {

//                   sub   rd, rs1, rs2

                     rv = _RVEMUL_OK;

                     if( ctx->rd )
                     {
                        ctx->regs[ctx->rd] = ctx->regs[ctx->rs1] - ctx->regs[ctx->rs2];
                     }
                  }

                  break;

               case 0x4:

                  if( ctx->rtFunct7 == 0x00 )
                  {

//                   xor   rd, rs1, rs2

                     rv = _RVEMUL_OK;

                     if( ctx->rd )
                     {
                        ctx->regs[ctx->rd] = ctx->regs[ctx->rs1] ^ ctx->regs[ctx->rs2];
                     }
                  }

                  break;

               case 0x6:

                  if( ctx->rtFunct7 == 0x00 )
                  {

//                   or    rd, rs1, rs2

                     rv = _RVEMUL_OK;

                     if( ctx->rd )
                     {
                        ctx->regs[ctx->rd] = ctx->regs[ctx->rs1] | ctx->regs[ctx->rs2];
                     }

                  }

                  break;

               case 0x7:

                  if( ctx->rtFunct7 == 0x00 )
                  {

//                   and   rd, rs1, rs2

                     rv = _RVEMUL_OK;

                     if( ctx->rd )
                     {
                        ctx->regs[ctx->rd] = ctx->regs[ctx->rs1] & ctx->regs[ctx->rs2];
                     }
                  }

                  break;

               case 0x1:

                  if( ctx->rtFunct7 == 0x00 )
                  {

//                   sll   rd, rs1, rs2
                     rv = _RVEMUL_OK;

                     if( ctx->rd )
                     {
                        ctx->regs[ctx->rd] = ctx->regs[ctx->rs1] << ( ctx->regs[ctx->rs2] & 0x3f );
                     }

                  }

                  break;

               case 0x5:

                  if( ctx->rtFunct7 == 0x00 )
                  {

//                   srl   rd, rs1, rs2

                     rv = _RVEMUL_OK;

                     if( ctx->rd )
                     {
                        ctx->regs[ctx->rd] = ctx->regs[ctx->rs1] >> ( ctx->regs[ctx->rs2] & 0x3f );
                     }

                  }else if( ctx->rtFunct7 == 0x20 )
                  {

//                   sra   rd, rs1, rs2

                     rv = _RVEMUL_OK;

                     if( ctx->rd )
                     {
                        if( ctx->regs[ctx->rs1] & 0x80000000 )
                        {
                           //extend sign bit
                           ctx->regs[ctx->rd] = ctx->regs[ctx->rs1];

                           for( i = 0; i < ( ctx->regs[ctx->rs2] & 0x3f ); i++ )
                           {
                              ctx->regs[ctx->rd] >>=  1;
                              ctx->regs[ctx->rd] |=   0x8000000;
                           }
                        }
                        else
                        {
                           ctx->regs[ctx->rd] = ctx->regs[ctx->rs1] >> ctx->regs[ctx->rs2];
                        }
                     }
                  }

                  break;

               case 0x2:

                  if( ctx->rtFunct7 == 0x00 )
                  {

//                   slt   rd, rs1, rs2

                     rv = _RVEMUL_OK;

                     if( ctx->rd )
                     {

                        if( ctx->sregs[ctx->rs1] < ctx->sregs[ctx->rs2] )
                        {
                           ctx->regs[ctx->rd] = 1;
                        }
                        else
                        {
                           ctx->regs[ctx->rd] = 0;
                        }
                     }

                  }

                  break;

               case 0x3:

                  if( ctx->rtFunct7 == 0x00 )
                  {

//                   sltu  rd, rs1, rs2

                     rv = _RVEMUL_OK;

                     if( ctx->rd )
                     {

                        if( ctx->regs[ctx->rs1] < ctx->regs[ctx->rs2] )
                        {
                           ctx->regs[ctx->rd] = 1;
                        }
                        else
                        {
                           ctx->regs[ctx->rd] = 0;
                        }
                     }
                  }
            
                  break;

            }
         }
         break;

      //I - type

      case 0b0010011:
        
 
         switch( ctx-> funct3 )
         {
            case 0x0:

//             addi  rd, rs1, imm
               
               rv = _RVEMUL_OK;

               if( ctx->rd )
               {
                  ctx->regs[ctx->rd] = ctx->regs[ctx->rs1] + ctx->itsImm;
               }

               break;

            case 0x4:

//             xori  rd, rs1, imm

               rv = _RVEMUL_OK;

               if( ctx->rd )
               {
                  ctx->regs[ctx->rd] = ctx->regs[ctx->rs1] ^ ctx->itsImm;
               }

               break;

            case 0x6:

//             ori   rd, rs1, imm

               rv = _RVEMUL_OK;

               if( ctx->rd )
               {
                  ctx->regs[ctx->rd] = ctx->regs[ctx->rs1] | ctx->itsImm;
               }

               break;

            case 0x7:

//             andi  rd, rs1, imm

               rv = _RVEMUL_OK;

               if( ctx->rd )
               {
                  ctx->regs[ctx->rd] = ctx->regs[ctx->rs1] & ctx->itsImm;
               }

               break;

            case 0x1:

               //todo: check if itImm(11 downto 5) are zeroes

//             slli  rd, rs1, imm

               rv = _RVEMUL_OK;

               if( ctx->rd )
               {
                  ctx->regs[ctx->rd] = ctx->regs[ctx->rs1] << ( ctx->itImm & 0x1f );
               }

               break;

            case 0x5:

                  //todo: do a proper check
                  if( ctx->itImm & 0xfff0 )
                  {

//                   srai  rd, rs1, imm

                     rv = _RVEMUL_OK;

                     if( ctx->rd )
                     {
                        if( ctx->regs[ctx->rs1] & 0x80000000 )
                        {
                           //extend sign bit
                           ctx->regs[ctx->rd] = ctx->regs[ctx->rs1];

                           for( i = 0; i < ( ctx->itImm & 0x1f ); i++ )
                           {
                              ctx->regs[ctx->rd] >>=  1;
                              ctx->regs[ctx->rd] |=   0x8000000;
                           }
                        }
                        else
                        {
                           ctx->regs[ctx->rd] = ctx->regs[ctx->rs1] >> ( ctx->itImm & 0x1f );
                        }
                     }

                  }
                  else
                  {

//                   srli  rd, rs1, imm
 
                     rv = _RVEMUL_OK;

                     if( ctx->rd )
                     {
                        ctx->regs[ctx->rd] = ctx->regs[ctx->rs1] >> ( ctx->itImm & 0x1f );
                     }
                  }

               break;

            case 0x2:

//             slti  rd, rs1, imm

               rv = _RVEMUL_OK;

               if( ctx->rd )
               {

                  if( ctx->sregs[ctx->rs1] < ctx->itsImm )
                  {
                     ctx->regs[ctx->rd] = 1;
                  }
                  else
                  {
                     ctx->regs[ctx->rd] = 0;
                  }
               }

               break;

            case 0x3:

//             sltiu rd, rs1, imm

               rv = _RVEMUL_OK;

               if( ctx->rd )
               {

                  if( ctx->regs[ctx->rs1] < ctx->itImm )
                  {
                     ctx->regs[ctx->rd] = 1;
                  }
                  else
                  {
                     ctx->regs[ctx->rd] = 0;
                  }
               }

               break;
         }

      break;

      //I - type

      case 0b0000011:
        

         switch( ctx->funct3 )
         {

            case 0x0:

//             lb    rd, imm( rs1 )

               if( ctx->rd )
               {

                  i = ctx->regs[ ctx->rs1 ];
                  i += ctx->itsImm;

                  j = ctx->fetchData( i & 0xfffffffc );

                  switch( i & 3 )
                  {
                     case 0:  // 0 - 7

                        j  &= 0xff;

                        if( j & 0x80 )
                        {
                           j |= 0xffffff80;
                        }

                        ctx->regs[ ctx->rd ]  = j;

                        break;

                     case 1: // 8 - 15

                        j  >>= 8;
                        j  &= 0xff;

                        if( j & 0x80 )
                        {
                           j |= 0xffffff80;
                        }

                        ctx->regs[ ctx->rd ]  = j;

                        break;

                     case 2: // 16 - 23

                        j  >>= 16;
                        j  &= 0xff;

                        if( j & 0x80 )
                        {
                           j |= 0xffffff80;
                        }

                        ctx->regs[ ctx->rd ]  = j;

                        break;

                     case 3: // 24 - 31

                        j  >>= 24;
                        j  &= 0xff;

                        if( j & 0x80 )
                        {
                           j |= 0xffffff80;
                        }

                        ctx->regs[ ctx->rd ]  = j;

                        break;
                  }
               }

               break;

            case 0x1:

//             lh    rd, imm( rs1 )

               if( ctx->rd )
               {

                  i = ctx->regs[ ctx->rs1 ];
                  i += ctx->itsImm;

                  j = ctx->fetchData( i & 0xfffffffe );

                  switch( i & 1 )
                  {
                     case 0:  // 0 - 15

                        j  &= 0xffff;

                        if( j & 0x8000 )
                        {
                           j |= 0xffff8000;
                        }

                        ctx->regs[ ctx->rd ]  = j;

                        break;

                     case 1: // 16 - 31

                        j  >>= 16;
                        j  &= 0xffff;

                        if( j & 0x8000 )
                        {
                           j |= 0xffff8000;
                        }

                        ctx->regs[ ctx->rd ]  = j;

                        break;

                  }
               }
               break;

            case 0x2:

//             lw    rd, imm( rs1 )

               if( ctx->rd )
               {

                  i = ctx->regs[ ctx->rs1 ];
                  i += ctx->itsImm;

                  ctx->regs[ ctx->rd ] = ctx->fetchData( i );

               }

               break;

            case 0x4:

//             lbu   rd, imm( rs1 )

               if( ctx->rd )
               {

                  i = ctx->regs[ ctx->rs1 ];
                  i += ctx->itsImm;

                  j = ctx->fetchData( i & 0xfffffffc );

                  switch( i & 3 )
                  {
                     case 0:  // 0 - 7

                        j  &= 0xff;

                        ctx->regs[ ctx->rd ]  = j;

                        break;

                     case 1: // 8 - 15

                        j  >>= 8;
                        j  &= 0xff;

                        ctx->regs[ ctx->rd ]  = j;

                        break;

                     case 2: // 16 - 23

                        j  >>= 16;
                        j  &= 0xff;

                        ctx->regs[ ctx->rd ]  = j;

                        break;

                     case 3: // 24 - 31

                        j  >>= 24;
                        j  &= 0xff;

                        ctx->regs[ ctx->rd ]  = j;

                        break;
                  }
               }
               break;

            case 0x5:

//             lhu   rd, imm( rs1 )

               if( ctx->rd )
               {

                  i = ctx->regs[ ctx->rs1 ];
                  i += ctx->itsImm;

                  j = ctx->fetchData( i & 0xfffffffe );

                  switch( i & 1 )
                  {
                     case 0:  // 0 - 15

                        j  &= 0xffff;


                        ctx->regs[ ctx->rd ]  = j;

                        break;

                     case 1: // 16 - 31

                        j  >>= 16;
                        j  &= 0xffff;

                        ctx->regs[ ctx->rd ]  = j;

                        break;

                  }
               }
               break;
         }
         break;

      //S - type

      case 0b0100011:
        

         switch( ctx->funct3 )
         {

            case 0x0:

//                  sprintf( outputBuffer, "sb    %s, %s( %s )", regS2Name, immValue, regS1Name );

                  break;

            case 0x1:

//                  sprintf( outputBuffer, "sh    %s, %s( %s )", regS2Name, immValue, regS1Name );

                  break;

            case 0x2:

//                  sprintf( outputBuffer, "sw    %s, %s( %s )", regS2Name, immValue, regS1Name );

                  break;
         }

         break; 

      //B - type
      case 0b1100011:
        
         switch( ctx->funct3 )
         {

            case 0x0:

//                  sprintf( outputBuffer, "beq   %s, %s, %s", regS1Name, regS2Name, immValue );

                  break;

            case 0x1:

  //                sprintf( outputBuffer, "bne   %s, %s, %s", regS1Name, regS2Name, immValue );

                  break;

            case 0x4:

//                  sprintf( outputBuffer, "blt   %s, %s, %s", regS1Name, regS2Name, immValue );

                  break;

            case 0x5:

//                  sprintf( outputBuffer, "bge   %s, %s, %s", regS1Name, regS2Name, immValue );

                  break;

            case 0x6:

                  //todo, check if imm is decoded properly for 'u' versions
//                  sprintf( outputBuffer, "bltu  %s, %s, %s", regS1Name, regS2Name, immValue );

                  break;

            case 0x7:

//                  sprintf( outputBuffer, "bgeu  %s, %s, %s", regS1Name, regS2Name, immValue );

                  break;
         }

         break;

      //J - type
      case 0b1101111:


//         sprintf( outputBuffer, "jal   %s, %s", regDName, immValue );

         break;

      //I - type

      case 0b1100111:


         if( ctx->funct3 == 0x0 )
         {
         
//            sprintf( outputBuffer, "jalr  %s, %s, %s", regDName, regS1Name, immValue );

         }
         break;

      //U - type
      case 0b0110111:

  
//       lui   rd, imm

         if( ctx->rd )
         {

            ctx->regs[ ctx->rd ] = ctx->utImm;

         }
         break;

      //U - type
      case 0b0010111:


//         sprintf( outputBuffer, "auipc %s, %d [ 0x%x ]", regDName, ctx->utImm >> 12, ctx->utImm );

         break;

      //I - type
      case 0b1110011:

         if( ctx->funct3 == 0x0 )
         {
            if( ctx->itImm == 0x0 )
            {
               
//               strcpy( outputBuffer, "ecall" );

            }else if( ctx->itImm == 0x1)
            {

//             ebreak
               rv = _RVEMUL_EBREAK;

            }
         }

         break;
 

   }


   return 0;
}