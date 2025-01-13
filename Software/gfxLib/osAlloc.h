#ifndef _OSALLOC_H
#define _OSALLOC_H

#ifdef __cplusplus
extern "C" 
{
#endif

#include "gfTypes.h"

#define _OS_ALLOC_NUM_NODES         2

#define _OS_ALLOC_BLOCK_SIZE     256

#define _OS_ALLOC_BLOCK_FREE     0x00

#define _OS_ALLOC_LAST_BLOCK_TAKEN  0x80
#define _OS_ALLOC_BLOCK_TAKEN       0x81


#define _OS_ALLOC_NODE_DISABLED     0x00

#define OS_ALLOC_MEMF_ANY        0x03
#define OS_ALLOC_MEMF_CHIP       0x01
#define OS_ALLOC_MEMF_FAST       0x02



typedef struct _tosAllocMemoryNode
{
   uint32_t flags;

   uint8_t *blockBitmap;
   uint32_t blockBitmapSize;

   void     *allocStart;
   void     *allocEnd;

   uint32_t  totalBlocksNum;
   
}tosAllocMemoryNode;

typedef struct _tosAllocMemoryNodes
{
   tosAllocMemoryNode   nodes[_OS_ALLOC_NUM_NODES];
}tosAllocMemoryNodes;


uint32_t  osAllocInit();
uint32_t  osAllocAddNode( uint32_t nodeNumber, void *allocStart, uint32_t memorySize, uint32_t nodeFlags );
uint32_t  osAllocGetAllocatedMemSize( void *allocMemPtr );

void     *osAlloc( uint32_t size, uint32_t memFlags );
uint32_t  osFree( void *allocMemPtr );
void     *osRealloc( void *allocMemPtr, uint32_t sizeNew, uint32_t memFlagsNew );


#ifdef __cplusplus
}
#endif

#endif


