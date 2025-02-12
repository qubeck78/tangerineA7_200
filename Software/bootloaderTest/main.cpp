#include "main.h"
#include <cstring>
#include <climits>

#include "../gfxLib/bsp.h"

BSP_T             *bsp     = ( BSP_T *)            0xf0000000; //registers base address 

#define TEXTATTR 0x7f00

uint16_t *displayRam;
uint32_t  screenIndex;

char buf[128];

uint32_t random_state = 3242323459;

uint32_t randomNumber()
{
    uint32_t r = random_state;

    r ^= r << 13;
    r ^= r >> 17;
    r ^= r << 5;

    random_state = r;

    return r;
} 


uint32_t print( char *buf )
{
   char     c;
   uint32_t i;

   i = 0;

   while( c = buf[ i++ ] )
   {  

      if( c == 13 )
      {

      }else if( c == 10 )
      {
         screenIndex -= screenIndex % 80;
         screenIndex += 80;
         if( screenIndex >= 2400 )
         {
            screenIndex = 0;
         }  
      }
      else
      {
         displayRam[ screenIndex++ ] = TEXTATTR | c;
      }
   }

   return 0;
}

 
int main()
{
   uint32_t          i;
   volatile uint32_t j;
   uint32_t          k;

   
   //80 column txt mode only
   bsp->videoMuxMode = 0x04; 

   displayRam = ( unsigned short * )0x5a80;
   
   screenIndex = 0;  

   
   
   for( i = 0; i < 2400 ; i++ )
   {
     displayRam[i] = TEXTATTR;
   }

   print( (char*) "\n" );   
   print( (char*) "        |.\\__/.|    (~\\ \n" );
   print( (char*) "        | O O  |     ) ) \n" );
   print( (char*) "      _.|  T   |_   ( (  \n" );   
   print( (char*) "   .-- ((---- ((-------. \n" );
   print( (char*) "   |  RISC-V           | \n" );
   print( (char*) "   |  tangerine A7_200 | \n" );
   print( (char*) "   |                   | \n" );
   print( (char*) "   |  Bootloader test  | \n" );
   print( (char*) "   `-------------------` \n" );

   k = 0;
   do
   {
      
      screenIndex = 80 * 10;

      for( i = 0; i < 80; i++ )
      {


         if( k < 80 )
         {
            if( i <= k )
            {
               print( (char*)"#" );
            }
            else
            {
               print( (char*)" " );
            }
         }
         else
         {
            if( i <= ( k - 80 ) )
            {
               print( (char*)" " );
            }
            else
            {
               print( (char*)"#" );
            }


         }
      }  

      k++;

      if( k >= 160 )
      {
         k = 0;
      }

   
      for( j = 0; j < 10000; j++ );

      if( k == 0 )
      {
         for( i = 1200; i < 2400 ; i++ )
         {
            displayRam[i] = randomNumber();
         }
      }

   }while( 1 );

} 
