
#include "memio.h"
#include "../gfxLib/gfFont.h"


static uint8_t rvStack[32768];
uint32_t *rvStackL;
static uint32_t *txtModeRam;

extern tgfTextOverlay    con;

uint32_t mioInit()
{

   uint32_t i;

   rvStackL    = (uint32_t*) &rvStack[0];
   txtModeRam  = (uint32_t*) 0x6d40;

   for( i = 0; i < 32768; i++ )
   {
      rvStack[i] = 0;
   }

   return 0;
}

uint32_t fetchInstruction( uint32_t addr )
{

   return fetchData( addr );
}

uint32_t fetchData( uint32_t addr )
{
   uint32_t *loadPtr;

   //stack / boot area
   if( addr < 0x6d40 )
   {
      return rvStackL[ addr >> 2 ];
   }

   //text mode ram
   else if( addr < 0x8000 )
   {
      return txtModeRam[ ( addr - 0x6d40 ) >> 2 ];
   }

   //dma ram ( 8MB )
   else if( ( addr >= 0x20000000 ) && ( addr < 0x20800000 ) )
   {
      loadPtr = (uint32_t*)addr;
      return *loadPtr;

   }
   //registers
   else if( addr >= 0xf0000000 )
   {
      
      loadPtr = (uint32_t*)addr;
      
      return *loadPtr;
   }

   return 0;
}


uint32_t storeData( uint32_t addr, uint8_t mask, uint32_t data )
{
   uint32_t *storePtr;
   uint32_t rb;

   storePtr = NULL;

//   toPrintF( &con, (char*)"WR %08X, %08X, %01X ", addr, data, mask );

   //stack / boot area
   if( addr < 0x6d40 )
   {
      storePtr = (uint32_t*) &rvStackL[ addr >> 2 ];
   }

   //text mode ram
   else if( addr < 0x8000 )
   {
      storePtr = &txtModeRam[ ( addr - 0x6d40 ) >> 2 ];
   }

   //dma ram ( 8MB )
   else if( ( addr >= 0x20000000 ) && ( addr < 0x20800000 ) )
   {
      storePtr = (uint32_t*)addr;
   }

   //registers
   else if( addr >= 0xf0000000 )
   {
      storePtr = (uint32_t*)addr;
   }

   if( storePtr )
   {
      rb = *storePtr;

      if( mask & 1)
      {
         //0-7
         rb &= 0xffffff00;
         rb |= data & 0xff;
      }
      
      if( mask & 2)
      {
         //8-15
         rb &= 0xffff00ff;
         rb |= data & 0xff00;
      }

      if( mask & 4)
      {
         //16-23
         rb &= 0xff00ffff;
         rb |= data & 0xff0000;
      }

      if( mask & 8)
      {
         //24-32
         rb &= 0x00ffffff;
         rb |= data & 0xff000000;
      }

      *storePtr = rb;
   }

   return 0;
}


