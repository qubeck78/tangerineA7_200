#include "main.h"
#include <cstring>
#include <climits>

#include "../gfxLib/bsp.h"

BSP_T                   *bsp     = ( BSP_T *)                  0xf0000000; //registers base address 
_SDRAMDMA_REGISTERS_T   *sdrdma  = ( _SDRAMDMA_REGISTERS_T * ) 0xf0800000;

#define TEXTATTR 0x0a00

unsigned short *displayRam;
int screenIndex;

char buf[128];

unsigned int random_state = 3242323459;

int randomNumber()
{
    unsigned int r = random_state;

    r ^= r << 13;
    r ^= r >> 17;
    r ^= r << 5;

    random_state = r;

    return r;
} 


int print( char *buf )
{
   char c;
   int i;

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
         displayRam[ screenIndex++ ] = TEXTATTR | c;
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

void itoaHex2Digits( int value, char* str )
{
    hexDigit(&str[0], ( value >> 4 ) & 0x0f );
    hexDigit(&str[1], ( value ) & 0x0f );
}

void itoaHex4Digits( int value, char* str )
{
    hexDigit(&str[4], ( value >> 12 ) & 0x0f );
    hexDigit(&str[5], ( value >> 8 ) & 0x0f );

    hexDigit(&str[6], ( value >> 4) & 0x0f );
    hexDigit(&str[7], ( value ) & 0x0f );
}


void itoaHex8Digits( int value, char* str )
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

ulong getTicks()
{
    return bsp->tickTimerValue;
}

void delayMs( unsigned long delay )
{
    unsigned long startMs;
    
    startMs = bsp->tickTimerValue;
    
    while( bsp->tickTimerValue < ( startMs + delay ) );
    
}
 

ulong testSDRAM()
{
   char            buf[256];

   ulong           i;
   ulong          *sdram;
   ulong           length;
   ulong           rvl;
   ulong           cvl;

   sdram = ( ulong * ) 0x20000000;


   length = 1048576;

   print( ( char* ) "Fill 0x0: " );

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
         print( (char*) " " );      
      }
   }

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
         print( (char*) " " );      
      }
   }


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
      }
   }

   print( (char*)"done\n" );


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
     displayRam[i] = TEXTATTR;
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


   testSDRAM();
   
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

         delayMs( 1000 );
      }

   }while( 1 );




} 