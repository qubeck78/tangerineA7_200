#include "main.h"
#include <cstring>
#include <climits>

#include "../gfxLib/bsp.h"

BSP_T                   *bsp     = ( BSP_T *)                  0xf0000000; //registers base address 
_SDRAMDMA_REGISTERS_T   *sdrdma  = ( _SDRAMDMA_REGISTERS_T * ) 0xf0800000;

uint16_t   textAttr = 0x8f00;

uint16_t *displayRam;
int screenIndex;

char buf[128];

unsigned int random_state = 3242323459;

uint32_t randomNumber()
{
    unsigned int r = random_state;

    r ^= r << 13;
    r ^= r >> 17;
    r ^= r << 5;

    random_state = r;

    return r;
} 


uint32_t print( char *buf )
{
   char c;
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
      }
      else
      {
         displayRam[ screenIndex++ ] = textAttr | c;
      }

      if( screenIndex >= 2400 )
      {
         screenIndex = 0;
      }  

   }


   return 0;
}


void hexDigit(char *string,char digit)
{
    digit &= 0x0f;
    
    if( digit<10 )
    {
        string[0] = digit + '0';
        string[1] = 0;
    }
    else
    {
        string[0] = digit + 'a' - 10;
        string[1] = 0;
    }
}

void itoaHex2Digits( uint32_t value, char* str )
{
    hexDigit(&str[0], ( value >> 4 ) & 0x0f );
    hexDigit(&str[1], ( value ) & 0x0f );
}

void itoaHex4Digits( uint32_t value, char* str )
{
    hexDigit(&str[4], ( value >> 12 ) & 0x0f );
    hexDigit(&str[5], ( value >> 8 ) & 0x0f );

    hexDigit(&str[6], ( value >> 4) & 0x0f );
    hexDigit(&str[7], ( value ) & 0x0f );
}


void itoaHex8Digits( uint32_t value, char* str )
{
    hexDigit(&str[0], ( value >> 28 ) & 0x0f );
    hexDigit(&str[1], ( value >> 24 ) & 0x0f );

    hexDigit(&str[2], ( value >> 20 ) & 0x0f );
    hexDigit(&str[3], ( value >> 16 ) & 0x0f );

    hexDigit(&str[4], ( value >> 12 ) & 0x0f );
    hexDigit(&str[5], ( value >> 8 ) & 0x0f );

    hexDigit(&str[6], ( value >> 4) & 0x0f );
    hexDigit(&str[7], ( value ) & 0x0f );
}

uint32_t getTicks()
{
    return bsp->tickTimerValue;
}

void delayMsTest( uint32_t delay )
{
/*    long startMs;
    
    startMs = bsp->tickTimerValue;

    
    while(  ( startMs + delay ) > bsp->tickTimerValue  );
*/
    unsigned long startMs;
    
    startMs = bsp->tickTimerValue;
    
    while( bsp->tickTimerValue < ( startMs + delay ) );

}
 

uint32_t testSDRAM()
{
   char            buf[256];

   uint32_t           i;
   uint32_t          *sdram;
   uint32_t           length;
   uint32_t           rvl;
   uint32_t           cvl;

   sdram = ( uint32_t * ) 0x20000000;


//   length = 512 * 240 / 2;
//   length = 262144;
//   length = 8192;

   length = 1048576;

   print( ( char* ) "\nFill 0xffffffff: " );

   for( i = 0 ; i < length; i++ )
   {
      sdram[i] = 0xffffffff;
   }


   for( i = 0 ; i < length; i++ )
   {
      rvl = sdram[i];

      if ( rvl != 0xffffffff )
      {
         itoaHex8Digits( i, buf );
         print( buf );
         print( (char*) "V" );
         itoaHex8Digits( rvl, buf );
         print( buf );

         rvl = sdram[i];

         if ( rvl != 0xffffffff )
         {

            print( (char*) "V2" );
            itoaHex8Digits( rvl, buf );
            print( buf );

         }

         print( (char*) " " );      
         print( (char*) " " );      

         break;
      }
   }

   //delayMs( 1000 );


   print( ( char* ) "\nFill 0x0: " );

   for( i = 0 ; i < length; i++ )
   {
      sdram[i] = 0;
   }


   for( i = 0 ; i < length; i++ )
   {
      rvl = sdram[i];

      if ( rvl != 0 )
      {
         itoaHex8Digits( i, buf );
         print( buf );
         print( (char*) "V" );
         itoaHex8Digits( rvl, buf );
         print( buf );

         rvl = sdram[i];
         if ( rvl != 0 )
         {

            print( (char*) "V2" );
            itoaHex8Digits( rvl, buf );
            print( buf );

         }

         print( (char*) " " );      

         break;
      }
   }

   //delayMs( 1000 );


   print( ( char* ) "\nFill random: " );

   random_state = 0x12ad91;

   for( i = 0 ; i < length; i++ )
   {
      sdram[i] = randomNumber();
   }


   random_state = 0x12ad91;

   for( i = 0 ; i < length; i++ )
   {
      rvl = sdram[i];
      cvl = randomNumber();

      if ( rvl != cvl )
      {
         itoaHex8Digits( i, buf );
         print( buf );
         print( (char*) "V" );
         itoaHex8Digits( rvl, buf );
         print( buf );
         print( (char*) "C" );
         itoaHex8Digits( cvl, buf );
         print( buf );
         print( (char*) " " );      

         break;
      }
   }

   print( (char*)"\ndone\n" );

   delayMsTest( 10000 );

   return 0;
}


int main()
{
   int            i;
   volatile int   j;
   int            k;
   char           buf[256];


   //80 column txt mode only
   //bsp->videoMuxMode = 0x04; 

   //80 column txt over gfx 320x240
   bsp->videoMuxMode = _VIDEOMODE_320_TEXT80_OVER_GFX;

   displayRam = ( unsigned short * )0x6d40;
   
   screenIndex = 0;  
   

   for( i = 0; i < 2400 ; i++ )
   {
     displayRam[i] = 0;
   }

   print( (char*) "\n" );   
   print( (char*) "        |.\\__/.|    (~\\ \n" );
   print( (char*) "        | O O  |     ) ) \n" );
   print( (char*) "      _.|  T   |_   ( (  \n" );   
   print( (char*) "   .-- ((---- ((-------. \n" );
   print( (char*) "   |  tangerine A7_200 | \n" );
   print( (char*) "   |  sdramDMA test    | \n" );
   print( (char*) "   `-------------------` \n" );

   print( (char*) "Main is located at 0x" );
   itoaHex8Digits( (int)main, buf );
   print( buf );
   print( (char*) "\n" );

   print( (char*) "Checking sdramDMA version: " );

   itoaHex8Digits( sdrdma->id, buf );
   
   print( buf );

   print( (char*)"." );


   itoaHex8Digits( sdrdma->version, buf );
   
   print( buf );

   if( ( sdrdma->id == 0x80000003 ) && ( sdrdma->version >= 0x20240807 ) )
   {
      print( (char*)" ok\n" );
   }
   else
   {
      print( (char*)" ERROR\n" );
      do
      {
      }
      while( 1 );
   }


   do
   {
      screenIndex = 80 * 10;

      testSDRAM();

   }while( 1 );

   
   do
   {
      for( i = 0; i < 80; i++ )
      {

         screenIndex = 80 * 29 + i;
         
         print( (char*)"*" );

         if( i == 0 )
         {
            screenIndex = 80 * 29 + 79;            
         }
         else
         {
            screenIndex = 80 * 29 + i - 1;                        
         }

         print( (char*)" " );

         delayMs( 10000 );
      }

   }while( 1 );




} 