
#include "memio.h"
#include "../gfxLib/gfFont.h"


static uchar rvStack[32768];
ulong *rvStackL;
static ulong *txtModeRam;

extern tgfTextOverlay    con;

ulong mioInit()
{

   ulong i;

   rvStackL    = (ulong*) &rvStack[0];
   txtModeRam  = (ulong*) 0x6d40;

   for( i = 0; i < 32768; i++ )
   {
      rvStack[i] = 0;
   }

   return 0;
}

ulong fetchInstruction( ulong addr )
{

   return fetchData( addr );
}

ulong fetchData( ulong addr )
{
   ulong *loadPtr;

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

   //fast ram ( 8MB )
   else if( ( addr >= 0x20000000 ) && ( addr < 0x20800000 ) )
   {
      loadPtr = (ulong*)addr;
      return *loadPtr;

   }
   //registers
   else if( addr >= 0xf0000000 )
   {
      
      loadPtr = (ulong*)addr;
      
      return *loadPtr;
   }

   return 0;
}


ulong storeData( ulong addr, uchar mask, ulong data )
{
   ulong *storePtr;
   ulong rb;

   storePtr = NULL;

//   toPrintF( &con, (char*)"WR %08X, %08X, %01X ", addr, data, mask );

   //stack / boot area
   if( addr < 0x6d40 )
   {
      storePtr = (ulong*) &rvStackL[ addr >> 2 ];
   }

   //text mode ram
   else if( addr < 0x8000 )
   {
      storePtr = &txtModeRam[ ( addr - 0x6d40 ) >> 2 ];
   }

   //fast ram ( 8MB )
   else if( ( addr >= 0x20000000 ) && ( addr < 0x20800000 ) )
   {
      storePtr = (ulong*)addr;
   }

   //registers
   else if( addr >= 0xf0000000 )
   {
      storePtr = (ulong*)addr;
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


