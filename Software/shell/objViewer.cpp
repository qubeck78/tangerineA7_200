
#include <cstring>
#include <math.h> 

#include "objViewer.h"

extern BSP_T 				*bsp; 
extern tgfTextOverlay		 con;
extern tgfBitmap		 	 screen;
extern tgfBitmap			 background;
extern tgfBitmap		 	 screen2;
extern tgfBitmap		 	 zBuffer; 
extern tgfBitmap			 texture; 

float						 sinT[360];
float 						 cosT[360];  
uint8_t						 lightT[100];

int							 sincosLightTablesValid;

tgfPoint3D 		 	 		*points;
tgfTriangle3D    	 		*triangles;

int 				 		 numTriangles;
int 				 		 numPoints; 
int 				 		 rotation; 
int							 rotationCounter;
tgfPoint3D 					 cam;

uint16_t						 rendererType;

char 						 buf[512];


int objvInit()
{
	int rv;

	rv = 0;

	sincosLightTablesValid	= 0;
	numPoints				= 0;
	numTriangles			= 0;
	points					= NULL;
	triangles				= NULL;

	texture.buffer			= NULL;
	texture.width			= 0;
	texture.height			= 0;

	return rv;

}


int objvLoadOBJFS( char *fileName, float scaleFactor, tgfBitmap *texture )
{
	tosFile	in;
	char 	lineBuf[256];
	uint32_t 	objNumPoints;
	uint32_t 	objNumTriangles;
	float   x;
	float	y;
	float	z;
	uint16_t  lineIdx;
	uint16_t  lineLen;
	uint32_t   p1;
	uint32_t   p2;
	uint32_t   p3;
	uint32_t   t1;
	uint32_t   t2;
	uint32_t   t3;

	float   *tx;
	float   *ty;
	uint32_t   objNumTexturePoints;
	uint32_t   texturePointIdx;


	objNumPoints 		= 0;
	objNumTriangles 	= 0;
	objNumTexturePoints = 0;

	tx                  = NULL;
	ty                  = NULL;

	if( osFOpen( &in, fileName, OS_FILE_READ ) )
	{
		return 1;
	}

	while( !osFGetS( &in, (uint8_t*)lineBuf, sizeof( lineBuf ) ) )
	{

		lineLen = strlen( lineBuf );

		if( lineLen > 2 )
		{
			if( ( lineBuf[0] == 'v' ) && ( lineBuf[1] == ' ' ) )
			{
				objNumPoints++;
			}

			if( ( lineBuf[0] == 'v' ) && ( lineBuf[1] == 't' ) && ( lineBuf[2] == ' ' ) )
			{
				objNumTexturePoints++;
			}

			if( ( lineBuf[0] == 'f' ) && ( lineBuf[1] == ' ' ) )
			{
				objNumTriangles++;
			}
		}
	}
	osFClose( &in );

	if( objNumPoints == 0 )
	{
		return 2;
	}
	if( objNumTriangles == 0 )
	{
		return 3;
	}

	numPoints 		= 0;
	numTriangles	= 0;
	texturePointIdx = 0;

	points 		= (tgfPoint3D*)osAlloc( sizeof( tgfPoint3D ) * ( objNumPoints + 1 ), OS_ALLOC_MEMF_CHIP );
	triangles 	= (tgfTriangle3D*)osAlloc( sizeof( tgfTriangle3D ) * ( objNumTriangles + 1 ), OS_ALLOC_MEMF_CHIP );

	if( objNumTexturePoints > 0 )
	{
		tx = (float*)osAlloc( sizeof( float ) * ( objNumTexturePoints + 1 ), OS_ALLOC_MEMF_CHIP );
		ty = (float*)osAlloc( sizeof( float ) * ( objNumTexturePoints + 1 ), OS_ALLOC_MEMF_CHIP );
	}

	if( osFOpen( &in, fileName, OS_FILE_READ ) )
	{
		return 1;
	}

	while( !osFGetS( &in, (uint8_t*)lineBuf, sizeof( lineBuf ) ) )
	{

		lineLen = strlen( lineBuf );

		if( lineLen > 2 )
		{
			if( ( lineBuf[0] == 'v' ) && ( lineBuf[1] == ' ' ) )
			{

				 lineIdx = 2;
				 x = atof( &lineBuf[lineIdx] );

				 //find space
				 while( lineIdx < lineLen )
				 {
					if( lineBuf[ lineIdx++ ] == ' ' )
					{
						break;
					}
				 }

				 y = atof( &lineBuf[lineIdx] );
				 //find space
				 while( lineIdx < lineLen )
				 {
					if( lineBuf[ lineIdx++ ] == ' ' )
					{
						break;
					}
				 }
				 z = atof( &lineBuf[lineIdx] );

				 points[numPoints].x3D = x * scaleFactor;
				 points[numPoints].y3D = y * scaleFactor;
				 points[numPoints].z3D = z * scaleFactor;

				 points[numPoints].r = randomNumber() % 0xff;
				 points[numPoints].g = randomNumber() % 0xff;
				 points[numPoints++].b = randomNumber() % 0xff;

			}

			if( ( lineBuf[0] == 'v' ) && ( lineBuf[1] == 't' ) && ( lineBuf[2] == ' ' )  )
			{

				 lineIdx = 3;
				 x = atof( &lineBuf[lineIdx] );

				 //find space
				 while( lineIdx < lineLen )
				 {
					if( lineBuf[ lineIdx++ ] == ' ' )
					{
						break;
					}
				 }

				 y = atof( &lineBuf[lineIdx] );
				 //find space
				 while( lineIdx < lineLen )
				 {
					if( lineBuf[ lineIdx++ ] == ' ' )
					{
						break;
					}
				 }

				 tx[ texturePointIdx ] = x;
				 ty[ texturePointIdx++ ] = y;
			}


			if( ( lineBuf[0] == 'f' ) && ( lineBuf[1] == ' ' ) )
			{
				 lineIdx = 2;
				 p1 = atoi( &lineBuf[lineIdx] );

				 if( objNumTexturePoints > 0 )
				 {
					//find '/'
					while( lineIdx < lineLen )
					{
						if( lineBuf[ lineIdx++ ] == '/' )
						{
							break;
						}
					}
					t1 = atoi( &lineBuf[lineIdx] );
				 }

				 //find space
				 while( lineIdx < lineLen )
				 {
					if( lineBuf[ lineIdx++ ] == ' ' )
					{
						break;
					}
				 }

				 p2 = atoi( &lineBuf[lineIdx] );

				 if( objNumTexturePoints > 0 )
				 {
					//find '/'
					while( lineIdx < lineLen )
					{
						if( lineBuf[ lineIdx++ ] == '/' )
						{
							break;
						}
					}
					t2 = atoi( &lineBuf[lineIdx] );
				 }

				 //find space
				 while( lineIdx < lineLen )
				 {
					if( lineBuf[ lineIdx++ ] == ' ' )
					{
						break;
					}
				 }

				 p3 = atoi( &lineBuf[lineIdx] );

				 if( objNumTexturePoints > 0 )
				 {
					//find '/'
					while( lineIdx < lineLen )
					{
						if( lineBuf[ lineIdx++ ] == '/' )
						{
							break;
						}
					}

					t3 = atoi( &lineBuf[lineIdx] );
				 }


				 triangles[ numTriangles ].a = &points[ p1 - 1 ];
				 triangles[ numTriangles ].b = &points[ p2 - 1 ];
				 triangles[ numTriangles ].c = &points[ p3 - 1 ];

				 if( texture != NULL )
				 {
					if( objNumTexturePoints > 0 )
					{
						//texture coords are present in file
						triangles[ numTriangles].aTx2D = 255.0f * tx[ t1 - 1 ];
						triangles[ numTriangles].bTx2D = 255.0f * tx[ t2 - 1 ];
						triangles[ numTriangles].cTx2D = 255.0f * tx[ t3 - 1 ];

						triangles[ numTriangles].aTy2D = 255.0f * ty[ t1 - 1 ];
						triangles[ numTriangles].bTy2D = 255.0f * ty[ t2 - 1 ];
						triangles[ numTriangles].cTy2D = 255.0f * ty[ t3 - 1 ];

					}
					else
					{
						//random texture coords
						triangles[ numTriangles].aTx2D = (float)(randomNumber() & 255 );
						triangles[ numTriangles].bTx2D = (float)(randomNumber() & 255 );
						triangles[ numTriangles].cTx2D = (float)(randomNumber() & 255 );

						triangles[ numTriangles].aTy2D = (float)(randomNumber() & 255 );
						triangles[ numTriangles].bTy2D = (float)(randomNumber() & 255 );
						triangles[ numTriangles].cTy2D = (float)(randomNumber() & 255 );

					}
					triangles[ numTriangles++ ].texture = texture;

				 }
				 else
				 {
					triangles[ numTriangles++ ].texture = NULL;
				 }
			}
		}
	}
	osFClose( &in );

	if( tx != NULL )
	{
		osFree( tx );
		tx = NULL;
	}
	if( ty != NULL )
	{
		osFree( ty );
		ty = NULL;
	}

	return 0;
} 


int objvCalc3d( tgfBitmap *pscr )
{

	int 		 i;
	float 		 xp,yp,zp;
	uint32_t		 light;

	uint16_t		 screenw2;
	uint16_t 		 screenh2;
	uint16_t		 rotation360;
	
	short		 z3DTs;
	float		 cosRotation;
	float		 sinRotation;
	
	tgfPoint3D	*point;


	rotation360 = rotation % 360;
	

	screenw2 = pscr->width / 2;
	screenh2 = pscr->height / 2;
	
	
	for( i = 0 ; i < numPoints; i++ )
	{

		point = &points[i];

		
		//refresh non-transformed coordinates

		point->x3DT = point->x3D;
		point->y3DT = point->y3D;
		point->z3DT = point->z3D;

		//rotation X - yZ
	
		sinRotation = sinT[ rotation360 ];
		cosRotation = cosT[ rotation360 ];


		//yp = points[i].y3DT * cosT[rotation360] - points[i].z3DT * sinT[rotation360];
		yp = ffSub( ffMul( point->y3DT, cosRotation ), ffMul( point->z3DT, sinRotation) );

		//zp = points[i].y3DT * sinT[rotation360] + points[i].z3DT * cosT[rotation360];
		zp = ffAdd( ffMul( point->y3DT, sinRotation ), ffMul( point->z3DT, cosRotation ) );

		point->y3DT = yp;
		point->z3DT = zp;

		//rotation Y - xz

		//xp = points[i].x3DT * cosT[rotation360] - points[i].z3DT * sinT[rotation360];
		xp = ffSub( ffMul( point->x3DT, cosRotation ), ffMul ( point->z3DT, sinRotation ) );
				

		//zp = points[i].x3DT * sinT[rotation360] + points[i].z3DT * cosT[rotation360];
		zp = ffAdd( ffMul( point->x3DT, sinRotation ), ffMul( point->z3DT, cosRotation ) );
		
		
		point->x3DT = xp;
		point->z3DT = zp;

		//rotation Z -xy

		//xp = points[i].x3DT * cosT[rotation360] - points[i].y3DT * sinT[rotation360];
		xp = ffSub( ffMul( point->x3DT, cosRotation ), ffMul( point->y3DT, sinRotation) );
		
	
		//yp = points[i].x3DT * sinT[rotation360] + points[i].y3DT * cosT[rotation360];
		yp = ffAdd( ffMul( point->x3DT, sinRotation ), ffMul( point->y3DT, cosRotation ) );
		
		point->x3DT = xp;
		point->y3DT = yp;

		
		//light
		z3DTs = ( short )point->z3DT + 50;

		if( z3DTs < 0 )
		{
			light = 16;
		}
		else if( z3DTs >= 100 )
		{
			light = 255;
		}
		else
		{
			light = lightT[ z3DTs ];
		}

		point->r = light;
		point->g = light;
		point->b = light;

		//cam

		//points[i].x3DT = points[i].x3DT + cam.x3D;
		point->x3DT = ffAdd( point->x3DT, cam.x3D );
		
		//points[i].y3DT = points[i].y3DT + cam.y3D;		
		point->y3DT = ffAdd( point->y3DT, cam.y3D );
		
		//points[i].z3DT = points[i].z3DT + cam.z3D;
		point->z3DT = ffAdd( point->z3DT, cam.z3D );


		//perspective and clipping

		z3DTs = (short)point->z3DT;
		

		//clip offscreen (z) points
        //           znear               zfar
		if(( z3DTs < -450 ) && ( z3DTs > -3500 ) )
		{
			//points[i].x2D = points[i].x3DT * 400  / ( points[i].z3DT + 400 );
			point->x2D = ffDiv( ffMul( point->x3DT, 400.0f ) , ffAdd( point->z3DT, 400.0f ) );
		
			//points[i].y2D = points[i].y3DT * 400 / ( points[i].z3DT + 400 );

			point->y2D = ffDiv( ffMul( point->y3DT, 400.0f ) , ffAdd( point->z3DT, 400.0f ) );

			point->x2D += screenw2;
			point->y2D += screenh2;

		
			//points[i].z2D = -points[i].z3DT;

			point->z2D = ffMul( point->z3DT, -4.0f );

		}
		else
		{
			point->z2D = 0;  //point is off-camera
		}

	}

	return 0;
} 

int objvDisplayObj( tgfBitmap *pscr )
{
	int 			 i;
	tgfTriangle3D	*triangle;

	

	//copy background to screen buffer
	gfBlitBitmap( pscr, &background, 0, 0 );

	//calc point cloud
	objvCalc3d( pscr );

	//clear zbuffer
	gfFillRect( &zBuffer, 0, 0, 319, 239, 0xffff );


	//draw scene

	switch( rendererType )
	{
		
		case 0:

			#ifdef _GFXLIB_HW_BLITTER_3D

			//bounding box calculated in hw

			blt->bltTransferWidth	= 320;			//screen size
			blt->bltTransferHeight	= 240;
			blt->bltDstModulo		= 512;			//screen modulo

			blt->bltDstAddress 				= ( uint32_t )(( ( uint32_t )pscr->buffer - _SYSTEM_MEMORY_BASE ) / 2);
			blt->bltGouraudZBufferAddress	= ( uint32_t )(( ( uint32_t )zBuffer.buffer - _SYSTEM_MEMORY_BASE ) / 2);

			for( i = 0 ; i < numTriangles; i++ )
			{


				triangle = &triangles[i];

				//clip offscreen (Z) triangles
				if( ( triangle->a->z2D > 0 ) && ( triangle->b->z2D > 0 ) && ( triangle->c->z2D > 0 ) )
				{

					//wait until blit complete
					do{}while( ! ( blt->bltStatus & 1 ) );

					//pass triangle coordinates/texture coordinates to gouraud hardware
					
					blt->c0CX = triangle->c->x2D;
					blt->c0CY = triangle->c->y2D;
					blt->c0CZ = triangle->c->z2D;
					
					blt->c0BX = triangle->b->x2D;
					blt->c0BY = triangle->b->y2D;
					blt->c0BZ = triangle->b->z2D;
					
					blt->c0AX = triangle->a->x2D;
					blt->c0AY = triangle->a->y2D;
					blt->c0AZ = triangle->a->z2D;
					
					blt->c0it0A = triangle->aTx2D;
					blt->c0it0B = triangle->bTx2D;
					blt->c0it0C = triangle->cTx2D;

					blt->c0it1A = triangle->aTy2D;
					blt->c0it1B = triangle->bTy2D;
					blt->c0it1C = triangle->cTy2D;
					
					blt->c0it2A = triangle->a->r;
					blt->c0it2B = triangle->b->r;
					blt->c0it2C = triangle->c->r;

					if( blt->c0Area > 0 )
					{
						//triangle facing front
					
						//config blitter to draw textured triangle using gouraud iterators
						
						blt->bltConfig0			= 0x1405;		//blitter mode: 
																//textured RGB triangle with light on iterator 2, 
																//texture size 256x256 px
																//zbuffer enabled
																//
																//trigger bounding box calc
						

						//set texture address
						blt->bltSrcAddress 		= ( uint32_t )(( ( uint32_t )triangle->texture->buffer - _SYSTEM_MEMORY_BASE ) / 2);
				
						blt->bltStatus			= 0x1;			//run			
						
					}
				}
			}
			//wait until last blit complete
			do{}while( ! ( blt->bltStatus & 1 ) );

			#endif
			
			break;

		case 1:

			#ifdef _GFXLIB_HW_BLITTER_3D

			for( i = 0 ; i < numTriangles; i++ )
			{
				//clip offscreen (Z) triangles
				if( ( triangles[i].a->z2D > 0 ) && ( triangles[i].b->z2D > 0 ) && ( triangles[i].c->z2D > 0 ) )
				{
					gfGouraudDrawTriangleZBufferBlt( pscr, &zBuffer, &triangles[i] );
				}
			}

			#endif			
			break;

		case 2:

			for( i = 0 ; i < numTriangles; i++ )
			{
				//clip offscreen (Z) triangles
				if( ( triangles[i].a->z2D > 0 ) && ( triangles[i].b->z2D > 0 ) && ( triangles[i].c->z2D > 0 ) )
				{
					gfGouraudDrawTexturedTriangleZBuffer( pscr, &zBuffer, &triangles[i] );
				}
			}

			break;
				
		case 3:
			
			for( i = 0 ; i < numTriangles; i++ )
			{
				//clip offscreen (Z) triangles
				if( ( triangles[i].a->z2D > 0 ) && ( triangles[i].b->z2D > 0 ) && ( triangles[i].c->z2D > 0 ) )
				{
					gfGouraudDrawTriangleZBuffer( pscr, &zBuffer, &triangles[i] );
					//gfGouraudDrawTexturedTriangleFloat( pscr, &triangles[i] );
				}
			}

			break;
			
	}	
	
	return 0;
} 



int objvView( char* fileName )
{
	int 		rv;
	int			i;
	tosUIEvent	event;
	uint16_t		exitMainLoop;
	uint16_t		lightCalc;

	rv = 0;

	con.textAttributes = 0x0f;
	toCls( &con );

	gfBlitBitmap( &screen, &background, 0, 0 );
	gfBlitBitmap( &screen2, &background, 0, 0 );



	if( !sincosLightTablesValid )
	{
		
		for( i = 0; i < 360; i++ )
		{
			sinT[i] = sin( i * ( 3.14159 / 180 ) );
			cosT[i] = cos( i * ( 3.14159 / 180 ) ); 			
		}


		for( i = 0; i < 100; i++ )
		{
			lightCalc = i * 2.5f;

			if( lightCalc < 16 )
			{
				lightCalc = 16;
			}
			else if( lightCalc > 255 )
			{
				lightCalc = 255;
			}

			lightT[ i ] = lightCalc;
		}

		sincosLightTablesValid = 1;
	}

	toPrintF( &con, (char*)"Loading %s\n ", fileName );


	strcpy( buf, fileName );

	i = strlen( buf );

	buf[i - 3] = 'g';
	buf[i - 2] = 'b';
	buf[i - 1] = 'm';

	rv = gfLoadBitmapFS( &texture, buf ); 
 	
 	if( rv )
 	{
 		#ifdef _GFXLIB_RISCV_FATFS
		gfLoadBitmapFS( &texture, (char*) "0:/obj/deftexture.gbm" ); 
		#endif
		#ifdef _GFXLIB_SDL
		gfLoadBitmapFS( &texture, (char*) "deftexture.gbm" ); 
		#endif


	}

	
	rv = objvLoadOBJFS( fileName, 2, &texture );
	
	cam.x3D = 0.0f;
	cam.y3D = 0.0f;
	cam.z3D = -1000.0f;


	if( rv )
	{
		//free texture

		osFree( (void*)texture.buffer );

		texture.buffer	= NULL;
		texture.width	= 0;
		texture.height	= 0;

		return rv;
	}

	toCls( &con );
	toPrintF( &con, (char*)"%s\n", fileName );
	toPrintF( &con, ( char* )"P%d/T%d\n", numPoints, numTriangles ); 
	
	bsp->frameTimer = 0; 
	rotation = 0;


	exitMainLoop = 0;

	#ifdef _GFXLIB_HW_BLITTER_3D
	rendererType = 0;
	#else
	rendererType = 2;
	#endif

	
	do
	{
					
		gfDisplayBitmap( &screen2 );
		do{}while( ! bsp->videoVSync );

		rotation = (int)bsp->frameTimer;		

		objvDisplayObj( &screen );


		gfDisplayBitmap( &screen );
		do{}while( ! bsp->videoVSync );

		rotation = (int)bsp->frameTimer;		

		objvDisplayObj( &screen2 );	 

		
		while( !osGetUIEvent( &event ) )
		{

			if( event.type == OS_EVENT_TYPE_KEYBOARD_KEYPRESS )
			{
				switch( event.arg1 )
				{
					case 27:
						
						exitMainLoop = 1;
						
						break;

					case _KEYCODE_F1:
						
						rendererType++;

						if( rendererType > 3 )
						{
							#ifdef _GFXLIB_HW_BLITTER_3D
							rendererType = 0;
							#else
							rendererType = 2;
							#endif
						}

						break;

					case _KEYCODE_PGUP:

						cam.z3D += 100;

						break;

					case _KEYCODE_PGDOWN:

						cam.z3D -= 100;

						break;

				}
			}
		}
			
	}while( !exitMainLoop );


	osFree( (void*)points );
	osFree( (void*)triangles );
	osFree( (void*)texture.buffer );

	numPoints 		= 0;
	numTriangles 	= 0;
	texture.buffer	= NULL;
	texture.width	= 0;
	texture.height	= 0;

	return rv;
}