MEMORY 
{						         

/*dma ram*/
/*		 ram 	: ORIGIN = 0x21780000, LENGTH = 0x0007ffff
		 eram   : ORIGIN = 0x21800000, LENGTH = 0
*/


/*system ram*/
		ram 	: ORIGIN = 0x00002000, LENGTH = 0x00005fff
		eram   	: ORIGIN = 0x00008000, LENGTH = 0 


}

SECTIONS
{

        .text :
	{
	    __text_start = . ;

	    *(.text)

	_etext = . ;
	__data_rom_start = ALIGN ( 4 ) ;
        } > ram

        .data :
	{
	_sdata = . ;
	__data_start = . ;

        *(.data)

	_edata = . ;
	edata = ALIGN( 0x10 ) ;
        } > ram

	.eram :
	{
	__ramend = . ;
	} > eram
}
