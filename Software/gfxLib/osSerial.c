
#include "osSerial.h"

#ifdef _GFXLIB_RISCV_FATFS

#include "bsp.h"


extern _UART_REGISTERS_T   *uart0;

#endif


uint32_t osSerialOpen( uint32_t serialNum, uint32_t baudRate )
{

   return 0;
}

uint32_t osSerialClose( uint32_t serialNum )
{

   return 0;
}


int32_t  osSerialGetC( uint32_t serialNum )
{
   #ifdef _GFXLIB_RISCV_FATFS

      if ( uart0->uartStatus & 1 )
      {           
         return uart0->uartData;
      }
      else
      {
         return -1;
      }

   #endif

   return -1;
}

uint32_t osSerialClearRxFifo( uint32_t serialNum )
{
   while( osSerialGetC( serialNum ) != -1 );

   return 0;
}

uint32_t osSerialPutC( uint32_t serialNum, uint8_t c )
{
   #ifdef _GFXLIB_RISCV_FATFS

      while( ! ( uart0->uartStatus & 2 ) );
   
      uart0->uartData = (unsigned short)c;

      return 0;

   #endif

   return 1;

}

uint32_t osSerialGetS( uint32_t serialNum, char *buf, uint32_t maxLength, uint32_t timeoutMs )
{
   uint32_t idx;   
   char  c;
   int32_t  rv;
   uint32_t startTicks;

   idx = 0;
   
   if( buf == NULL ) return 1;

   buf[0] = 0;

   startTicks = getTicks();

   do
   {

      do
      {
         
         rv = osSerialGetC( serialNum );

         if( getTicks() > startTicks + timeoutMs )
         {

            //timeout
            return 2;

         }

      }while( rv == -1 );

      c = (char) rv & 0xff;

      if( ( c != 13 ) && ( c != 10 ) )
      {
         if( idx < ( maxLength - 1 ) )
         {
            buf[idx++]  = c;
            buf[idx]    = 0;
         }
         else
         {
            //buffer overflow
            return 3;
         }
      }
      
   }while( c != 10 );

   return 0;
}

uint32_t osSerialPrint( uint32_t serialNum, char *buf )
{
   char c;

   if( buf == NULL ) 
   {
      return 1;
   }

   while( c = *buf++ )
   {
      osSerialPutC( serialNum, c );
   }

   return 0;

}