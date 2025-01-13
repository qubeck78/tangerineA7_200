#ifndef _OSSERIAL_H
#define _OSSERIAL_H

#ifdef __cplusplus
extern "C" 
{
#endif

#include "gfTypes.h"

uint32_t osSerialOpen( uint32_t serialNum, uint32_t baudRate );
uint32_t osSerialClose( uint32_t serialNum );
int32_t  osSerialGetC( uint32_t serialNum );
uint32_t osSerialClearRxFifo( uint32_t serialNum );
uint32_t osSerialPutC( uint32_t serialNum, uint8_t c );
uint32_t osSerialGetS( uint32_t serialNum, char *buf, uint32_t maxLength, uint32_t timeoutMs );
uint32_t osSerialPrint( uint32_t serialNum, char *buf );

#ifdef __cplusplus
}
#endif

#endif
