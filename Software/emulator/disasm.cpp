
#include <cstdio>
#include <cstring>
#include "disasm.h"
#include "memio.h"

uint32_t nameRegister( uint32_t r, char *outputBuffer )
{

   outputBuffer[0] = 0;

   if( r > 31 )
   {
      return 1;
   }

   if( r == 0 )
   {
      strcpy( outputBuffer, "zero" );
   }
   else if( r == 1 )
   {
      strcpy( outputBuffer, "ra" );
   }
   else if( r == 2 )
   {
      strcpy( outputBuffer, "sp" );
   }
   else if( r == 3 )
   {
      strcpy( outputBuffer, "gp" );      
   }
   else if( r == 4 )
   {
      strcpy( outputBuffer, "tp" );            
   }
   else if( ( r > 4 ) && ( r < 8 ) )
   {
      sprintf( outputBuffer, "t%d", r - 5 );      
   }
   else if( r == 8 )
   {
      strcpy( outputBuffer, "s0" );
   }
   else if( r == 9 )
   {
      strcpy( outputBuffer, "s1" );
   }
   else if( ( r > 9 ) && ( r < 18 ) )
   {
      sprintf( outputBuffer, "a%d", r - 10 );            
   }
   else if( ( r > 17 ) && ( r < 28 ) )
   {
      sprintf( outputBuffer, "s%d", r - 16 );            
   }
    else if( r > 27 ) 
   {
      sprintf( outputBuffer, "t%d", r - 25 );            
   }

   return 0;
}

static uint32_t decodeIStypeImm( uint32_t imm, char *outputBuffer )
{
   short  extImm;

   outputBuffer[0] = 0;

   if( imm & 0b100000000000 )
   {
      extImm = 0b1111100000000000 | imm;
   }
   else
   {
      extImm = imm;      
   }

   sprintf( outputBuffer, "%d", extImm );

   return 0;
}

static uint32_t decodeBtypeImm( uint32_t imm, uint32_t pc, char *outputBuffer )
{
   short  extImm;

   outputBuffer[0] = 0;

   if( imm & 0b1000000000000 )
   {
      extImm = 0b1111000000000000 | imm;
   }
   else
   {
      extImm = imm;      
   }


   sprintf( outputBuffer, "0x%x", pc + extImm );

   return 0;
}

static uint32_t decodeJtypeImm( uint32_t imm, uint32_t pc, char *outputBuffer )
{
   long  extImm;

   outputBuffer[0] = 0;

   if( imm & 0b100000000000000000000 )
   {
      extImm =  0b11111111111100000000000000000000 | imm;
   }
   else
   {
      extImm = imm;      
   }


   sprintf( outputBuffer, "0x%x", pc + extImm );

   return 0;
}

uint32_t dsDisassemble( dsContext_t *ctx, char *outputBuffer )
{
   uint32_t pc;
   uint32_t instruction;
   uint32_t iDecAux;

   char  regDName[8];
   char  regS1Name[8];
   char  regS2Name[8];
   char  immValue[32];

   if( outputBuffer == NULL )
   {
      return 1;
   }
   if( ctx == NULL )
   {
      return 1;
   }

   
   outputBuffer[0] = 0;


   ctx->pc           = ctx->codeBufStartPc + ( ctx->codeBufIdx * 4 );   

   instruction       = fetchData( ctx->pc );

   ctx->instruction  = instruction;
   ctx->codeBufIdx   += 1;


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

   switch( ctx->opcode )
   {

      //RV32I

      //R - type
      case 0b0110011:

         nameRegister( ctx->rd,  regDName );
         nameRegister( ctx->rs1, regS1Name );
         nameRegister( ctx->rs2, regS2Name );

         //RV32M
         if( ctx->rtFunct7 == 0x01 )
         {
            switch( ctx->funct3 )
            {

            case 0x0:

               sprintf( outputBuffer, "mul   %s, %s, %s", regDName, regS1Name, regS2Name );
               break;

            case 0x1:

               sprintf( outputBuffer, "mulh  %s, %s, %s", regDName, regS1Name, regS2Name );
               break;

            case 0x2:

               sprintf( outputBuffer, "mulsu %s, %s, %s", regDName, regS1Name, regS2Name );
               break;

            case 0x3:

               sprintf( outputBuffer, "mulu  %s, %s, %s", regDName, regS1Name, regS2Name );
               break;

            case 0x4:

               sprintf( outputBuffer, "div   %s, %s, %s", regDName, regS1Name, regS2Name );
               break;

            case 0x5:

               sprintf( outputBuffer, "divu  %s, %s, %s", regDName, regS1Name, regS2Name );
               break;

            case 0x6:

               sprintf( outputBuffer, "rem   %s, %s, %s", regDName, regS1Name, regS2Name );
               break;
 
             case 0x7:

               sprintf( outputBuffer, "remu  %s, %s, %s", regDName, regS1Name, regS2Name );
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

                     sprintf( outputBuffer, "add   %s, %s, %s", regDName, regS1Name, regS2Name );

                  }else if( ctx->rtFunct7 == 0x20 )
                  {

                     sprintf( outputBuffer, "sub   %s, %s, %s", regDName, regS1Name, regS2Name );

                  }

                  break;

               case 0x4:

                  if( ctx->rtFunct7 == 0x00 )
                  {

                     sprintf( outputBuffer, "xor   %s, %s, %s", regDName, regS1Name, regS2Name );

                  }

                  break;

               case 0x6:

                  if( ctx->rtFunct7 == 0x00 )
                  {

                     sprintf( outputBuffer, "or    %s, %s, %s", regDName, regS1Name, regS2Name );

                  }

                  break;

               case 0x7:

                  if( ctx->rtFunct7 == 0x00 )
                  {

                     sprintf( outputBuffer, "and   %s, %s, %s", regDName, regS1Name, regS2Name );

                  }

                  break;

               case 0x1:

                  if( ctx->rtFunct7 == 0x00 )
                  {

                     sprintf( outputBuffer, "sll   %s, %s, %s", regDName, regS1Name, regS2Name );

                  }

                  break;

               case 0x5:

                  if( ctx->rtFunct7 == 0x00 )
                  {

                     sprintf( outputBuffer, "srl   %s, %s, %s", regDName, regS1Name, regS2Name );

                  }else if( ctx->rtFunct7 == 0x20 )
                  {

                     sprintf( outputBuffer, "sra   %s, %s, %s", regDName, regS1Name, regS2Name );

                  }

                  break;

               case 0x2:

                  if( ctx->rtFunct7 == 0x00 )
                  {

                     sprintf( outputBuffer, "slt   %s, %s, %s", regDName, regS1Name, regS2Name );

                  }

                  break;

               case 0x3:

                  if( ctx->rtFunct7 == 0x00 )
                  {

                     sprintf( outputBuffer, "sltu  %s, %s, %s", regDName, regS1Name, regS2Name );

                  }
            
                  break;

            }
         }
         break;

      //I - type

      case 0b0010011:
        
         nameRegister( ctx->rd,  regDName );
         nameRegister( ctx->rs1, regS1Name );
         decodeIStypeImm( ctx->itImm, immValue );
 
         switch( ctx-> funct3 )
         {
            case 0x0:

                  sprintf( outputBuffer, "addi  %s, %s, %s", regDName, regS1Name, immValue );

               break;

            case 0x4:

                  sprintf( outputBuffer, "xori  %s, %s, %s", regDName, regS1Name, immValue );

               break;

            case 0x6:

                  sprintf( outputBuffer, "ori   %s, %s, %s", regDName, regS1Name, immValue );

               break;

            case 0x7:

                  sprintf( outputBuffer, "andi  %s, %s, %s", regDName, regS1Name, immValue );

               break;

            case 0x1:

                  //todo: check if itImm(11 downto 5) are zeroes

                  sprintf( outputBuffer, "slli  %s, %s, %d", regDName, regS1Name, ctx->itImm & 0xf );

               break;

            case 0x5:

                  //todo: do a proper check
                  if( ctx->itImm & 0xffe0 )
                  {
                     sprintf( outputBuffer, "srai  %s, %s, %d", regDName, regS1Name, ctx->itImm & 0xf );
                  }
                  else
                  {
                     sprintf( outputBuffer, "srli  %s, %s, %d", regDName, regS1Name, ctx->itImm & 0xf );
                  }

               break;

            case 0x2:

                  sprintf( outputBuffer, "slti  %s, %s, %s", regDName, regS1Name, immValue );

               break;

            case 0x3:

                  sprintf( outputBuffer, "sltiu %s, %s, %s", regDName, regS1Name, immValue );

               break;
         }

      break;

      //I - type

      case 0b0000011:
        
         nameRegister( ctx->rd,  regDName );
         nameRegister( ctx->rs1, regS1Name );
         decodeIStypeImm( ctx->itImm, immValue );

         switch( ctx->funct3 )
         {

            case 0x0:

                  sprintf( outputBuffer, "lb    %s, %s( %s )", regDName, immValue, regS1Name );

                  break;

            case 0x1:

                  sprintf( outputBuffer, "lh    %s, %s( %s )", regDName, immValue, regS1Name );

                  break;

            case 0x2:

                  sprintf( outputBuffer, "lw    %s, %s( %s )", regDName, immValue, regS1Name );

                  break;

            case 0x4:

                  sprintf( outputBuffer, "lbu   %s, %s( %s )", regDName, immValue, regS1Name );

                  break;

            case 0x5:

                  sprintf( outputBuffer, "lhu   %s, %s( %s )", regDName, immValue, regS1Name );

                  break;
         }
         break;

      //S - type

      case 0b0100011:
        
         nameRegister( ctx->rs1, regS1Name );
         nameRegister( ctx->rs2, regS2Name );
         decodeIStypeImm( ctx->stImm, immValue );

         switch( ctx->funct3 )
         {

            case 0x0:

                  sprintf( outputBuffer, "sb    %s, %s( %s )", regS2Name, immValue, regS1Name );

                  break;

            case 0x1:

                  sprintf( outputBuffer, "sh    %s, %s( %s )", regS2Name, immValue, regS1Name );

                  break;

            case 0x2:

                  sprintf( outputBuffer, "sw    %s, %s( %s )", regS2Name, immValue, regS1Name );

                  break;
         }

         break; 

      //B - type
      case 0b1100011:
        
         nameRegister( ctx->rs1, regS1Name );
         nameRegister( ctx->rs2, regS2Name );
         decodeBtypeImm( ctx->btImm, ctx->pc, immValue );

         switch( ctx->funct3 )
         {

            case 0x0:

                  sprintf( outputBuffer, "beq   %s, %s, %s", regS1Name, regS2Name, immValue );

                  break;

            case 0x1:

                  sprintf( outputBuffer, "bne   %s, %s, %s", regS1Name, regS2Name, immValue );

                  break;

            case 0x4:

                  sprintf( outputBuffer, "blt   %s, %s, %s", regS1Name, regS2Name, immValue );

                  break;

            case 0x5:

                  sprintf( outputBuffer, "bge   %s, %s, %s", regS1Name, regS2Name, immValue );

                  break;

            case 0x6:

                  //todo, check if imm is decoded properly for 'u' versions
                  sprintf( outputBuffer, "bltu  %s, %s, %s", regS1Name, regS2Name, immValue );

                  break;

            case 0x7:

                  sprintf( outputBuffer, "bgeu  %s, %s, %s", regS1Name, regS2Name, immValue );

                  break;
         }

         break;

      //J - type
      case 0b1101111:

         nameRegister( ctx->rd,  regDName );
         decodeJtypeImm( ctx->jtImm, ctx->pc, immValue );

         sprintf( outputBuffer, "jal   %s, %s", regDName, immValue );

         break;

      //I - type

      case 0b1100111:

         nameRegister( ctx->rd,  regDName );
         nameRegister( ctx->rs1, regS1Name );
         decodeIStypeImm( ctx->itImm, immValue );

         if( ctx->funct3 == 0x0 )
         {
         
            sprintf( outputBuffer, "jalr  %s, %s, %s", regDName, regS1Name, immValue );

         }
         break;

      //U - type
      case 0b0110111:

         nameRegister( ctx->rd,  regDName );

         sprintf( outputBuffer, "lui   %s, %d [ 0x%x ]", regDName, ctx->utImm >> 12, ctx->utImm );

         break;

      //U - type
      case 0b0010111:

         nameRegister( ctx->rd,  regDName );

         sprintf( outputBuffer, "auipc %s, %d [ 0x%x ]", regDName, ctx->utImm >> 12, ctx->utImm );

         break;

      //I - type
      case 0b1110011:

         if( ctx->funct3 == 0x0 )
         {
            if( ctx->itImm == 0x0 )
            {
               
               strcpy( outputBuffer, "ecall" );

            }else if( ctx->itImm == 0x1)
            {

               strcpy( outputBuffer, "ebreak" );

            }
         }

         break;
 

   }


   return 0;
}