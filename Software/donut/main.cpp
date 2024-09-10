/*
    Donut code from: https://github.com/akhileshthite/3d-donut.git
*/

#include "main.h"

#include "../gfxLib/bsp.h"
#include "../gfxLib/gfFont.h"
#include "../gfxLib/osUIEvents.h"

#include <stdio.h>
#include <math.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>

extern tgfTextOverlay   con;


#define R(mul,shift,x,y) \
  _=x; \
  x -= mul*y>>shift; \
  y += mul*_>>shift; \
  _ = 3145728-x*x-y*y>>11; \
  x = x*_>>10; \
  y = y*_>>10;

int8_t b[1760], z[1760];

int main()
{
    int rv;
    int sA=1024,cA=0,sB=1024,cB=0,_;


    bspInit();
    setVideoMode( _VIDEOMODE_TEXT80_ONLY );
 
    con.textAttributes = 0x0a;
    

    toCls( &con );

    do 
    {
        toSetCursorPos( &con, 0, 0 );

        memset(b, 32, 1760);  // text buffer
        memset(z, 127, 1760);   // z buffer
        
        int sj=0, cj=1024;
        
        for (int j = 0; j < 90; j++) 
        {
          int si = 0, ci = 1024;  // sine and cosine of angle i
          
          for (int i = 0; i < 324; i++) 
          {
          
            int R1 = 1, R2 = 2048, K2 = 5120*1024;

            int x0 = R1*cj + R2,
                x1 = ci*x0 >> 10,
                x2 = cA*sj >> 10,
                x3 = si*x0 >> 10,
                x4 = R1*x2 - (sA*x3 >> 10),
                x5 = sA*sj >> 10,
                x6 = K2 + R1*1024*x5 + cA*x3,
                x7 = cj*si >> 10,
                x = 40 + 30*(cB*x1 - sB*x4)/x6,
                y = 12 + 15*(cB*x4 + sB*x1)/x6,
                N = (-cA*x7 - cB*((-sA*x7>>10) + x2) - ci*(cj*sB >> 10) >> 10) - x5 >> 7;

            int o = x + 80 * y;
            int8_t zz = (x6-K2)>>15;
            
            if (22 > y && y > 0 && x > 0 && 80 > x && zz < z[o]) 
            {
              z[o] = zz;
              b[o] = ".,-~:;=!*#$@"[N > 0 ? N : 0];
            }

            R(5, 8, ci, si)  // rotate i
          
          }

          R(9, 7, cj, sj)  // rotate j
        }

        for (int k = 0; k < 1760; k++ )
        {
          toPrintF( &con, (char*)"%c", k % 80 ? b[k] : 10 );
        }


        R(5, 7, cA, sA);
        R(5, 8, cB, sB);

    }while( 1 );

}


/*

//Float version

float z[1760];
char b[1760];


int main()
{
    int rv;
    float A = 0, B = 0;
    float i, j;
    int k;
    float c;
    float d;
    float e;
    float f;
    float g;
    float h;
    float D;
    float l;
    float m;
    float n;
    float t;
    int x;
    int y;
    int o;
    int N;

    bspInit();
    setVideoMode( _VIDEOMODE_TEXT80_ONLY );
 
    con.textAttributes = 0x0a;
    

    toCls( &con );

    do 
    {
        toSetCursorPos( &con, 0, 0 );

        memset( b, 32, 1760 );
        memset( z, 0, 7040 );


        e = sin(A);
        g = cos(A);
        m = cos(B);
        n = sin(B);

        for( j=0; j < 6.28; j += 0.2 ) 
        {
            d = cos(j);
            f = sin(j);

            for( i=0; i < 6.28; i += 0.1 ) 
            {
                c = sin(i);

                
                h = d + 2;
                D = 1 / (c * h * e + f * g + 5);
                
                l = cos(i);
                
                t = c * h * g - f * e;
                x = 40 + 30 * D * (l * h * m - t * n);
                y = 12 + 15 * D * (l * h * n + t * m);
                o = x + 80 * y;
                
                N = 8 * ((f * e - c * d * g) * m - c * d * e - f * g - l * d * n);
    
                if( 22 > y && y > 0 && x > 0 && 80 > x && D > z[o] ) 
                {
                    z[o] = D;
                    b[o] = ".,-~:;=!*#$@"[N > 0 ? N : 0];
                }
            }
        }

        for(k = 0; k < 1760; k++) 
        {
            toPrintF( &con, (char*)"%c", b[k] ); 
        }

        A += 0.07;
        B += 0.02;

            
    }while( 1 );


    asm(
        "ebreak\n"
        );


    do{}while( 1 );
}

*/ 