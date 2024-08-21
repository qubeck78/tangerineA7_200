----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/07/2024 09:58:31 AM
-- Design Name: 
-- Module Name: sdramDMA - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

--default sdram clock phase shift - 205


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity sdramDMA is
port(
    
    --reset, clocks
    reset:              in      std_logic;
    
    cpuClock:           in      std_logic;
    sdramClock:         in      std_logic;
    sdramClockPs:       in      std_logic;


   --bus interface ( registers )

    a:                  in      std_logic_vector( 15 downto 0 );
    din:                in      std_logic_vector( 31 downto 0 );
    dout:               out     std_logic_vector( 31 downto 0 );
    ce:                 in      std_logic;
    wr:                 in      std_logic;
    dataMask:           in      std_logic_vector( 3 downto 0 );
    ready:              out     std_logic;
    
    --ch0 - CPU, lowest priority: 3
    
    ch0A:               in      std_logic_vector( 23 downto 0 );
    ch0Din:             in      std_logic_vector( 31 downto 0 );
    ch0Dout:            out     std_logic_vector( 31 downto 0 );
   
    ch0Ce:              in      std_logic;
    ch0Wr:              in      std_logic;
    ch0DataMask:        in      std_logic_vector( 3 downto 0 );
    ch0InstrCycle:      in      std_logic;

    ch0Ready:           out     std_logic; 
    
    --ch1 - blitter, priority: 2
    ch1DmaRequest:      in      std_logic;
    ch1DmaReady:        out     std_logic;
    ch1DmaWordSize:     in      std_logic;
    ch1A:               in      std_logic_vector( 24 downto 0 );
    ch1Din:             in      std_logic_vector( 31 downto 0 );
    ch1Dout:            out     std_logic_vector( 31 downto 0 );
    ch1Wr:              in      std_logic;
    
    --ch2 - audio, read only priority: 1
    ch2DmaRequest:      in      std_logic;
    ch2DmaReady:        out     std_logic;
    ch2A:               in      std_logic_vector( 23 downto 0 );
    ch2Dout:            out     std_logic_vector( 31 downto 0 );
    
    --ch3 - gfx display, highest priority: 0
    
    ch3DmaRequest:      in      std_logic_vector( 1 downto 0 );
    ch3DmaPointerReset: in      std_logic;
    
    ch3BufClk:          in      std_logic;
    ch3BufDout:         out     std_logic_vector( 31 downto 0 );
    ch3BufA:            in      std_logic_vector( 8 downto 0 );

    --sdram
    sdramA:             out     std_logic_vector( 12 downto 0 );
    sdramBA:            out     std_logic_vector( 1 downto 0 );
    sdramD:             inout   std_logic_vector( 31 downto 0 );
    sdramCKE:           out     std_logic;
    sdramCLK:           out     std_logic;
    sdramDQM:           out     std_logic_vector( 3 downto 0 );
    sdramCAS:           out     std_logic;
    sdramRAS:           out     std_logic;
    sdramWE:            out     std_logic;
    sdramCS:            out     std_logic  

);
end sdramDMA;

architecture Behavioral of sdramDMA is

--components

component gfxBufRam is
  Port ( 
    clka : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 8 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 31 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clkb : in STD_LOGIC;
    web : in STD_LOGIC_VECTOR ( 0 to 0 );
    addrb : in STD_LOGIC_VECTOR ( 8 downto 0 );
    dinb : in STD_LOGIC_VECTOR ( 31 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
end component;


--signals

type regState_T is ( rsWaitForRegAccess, rsWaitForBusCycleEnd );

signal regState:    regState_T;

type sdcState_T is ( sdcIdle, sdcInit0, sdcInit1, sdcInit2, sdcInit3, sdcInit4, sdcInit5, sdcInit6,

	sdcCh0Read0, sdcCh0Read1, sdcCh0Read2, sdcCh0Read3, sdcCh0Read4, sdcCh0Read5, sdcCh0Read6, sdcCh0Read7, sdcCh0Read8, 
	sdcCh0Write0, sdcCh0Write1, sdcCh0Write2, sdcCh0Write3, sdcCh0Write4, sdcCh0Write5, sdcCh0Write6, sdcCh0Write7, sdcCh0Write8,

	sdcCh1Read0, sdcCh1Read1, sdcCh1Read2, sdcCh1Read3, sdcCh1Read4, sdcCh1Read5, sdcCh1Read6, sdcCh1Read7, sdcCh1Read8, 
	sdcCh1Write0, sdcCh1Write1, sdcCh1Write2, sdcCh1Write3, sdcCh1Write4, sdcCh1Write5, sdcCh1Write6, sdcCh1Write7, sdcCh1Write8,

	sdcCh3Read0, sdcCh3Read1, sdcCh3Read2, sdcCh3Read3, sdcCh3Read4, sdcCh3Read5, sdcCh3Read6, sdcCh3Read7, sdcCh3Read8, 

	sdcSubRefresh0, sdcSubRefresh1, sdcSubRefresh2, sdcSubRefresh3, sdcSubRefresh4, sdcSubRefresh5, sdcSubRefresh6

	);
	
signal sdcState:        sdcState_T;
signal sdcReturnState:  sdcState_T;

signal resetCounter:    std_logic_vector( 15 downto 0 );
signal refreshCounter:	std_logic_vector( 11 downto 0 );
signal refreshRequest:	std_logic;
signal refreshDone:		std_logic;

signal sdramDInLatched: std_logic_vector( 31 downto 0 );


--ch3 signals
signal ch3DmaRequestLatched:    std_logic_vector( 1 downto 0 );
signal ch3DmaPointerStart:      std_logic_vector( 23 downto 0 );
signal ch3DmaPointer:           std_logic_vector( 23 downto 0 );

signal ch3BufRamDin:            std_logic_vector( 31 downto 0 );
signal ch3BufRamWrA:            std_logic_vector( 8 downto 0 );
signal ch3BufRamWr:             std_logic;
signal ch3TransferCounter:      std_logic_vector( 7 downto 0 );
signal ch3DmaBufPointer:        std_logic_vector( 8 downto 0 );

signal ch3DmaRequest0Modulo:    std_logic_vector( 7 downto 0 );
signal ch3DmaRequest1Modulo:    std_logic_vector( 7 downto 0 );


begin

--assign sdram clock

sdramCLK    <= sdramClockPs;


registers: process( all )
begin

   if rising_edge( cpuClock ) then
   
      if reset = '1' then
            
         ready                  <= '0';  
         regState               <= rsWaitForRegAccess;
         ch3DmaPointerStart     <= ( others => '0' );
         ch3DmaRequest0Modulo   <= x"60";
         ch3DmaRequest1Modulo   <= x"60";
         
      else
      
         
         case regState is
   
            when rsWaitForRegAccess =>
         
               if ce = '1' then
               
                  --cpu wants to access registers
               
                  ready <= '0';
                  
                  case a( 7 downto 0 ) is
                  
                     --0x00 r- id                      
                     when x"00" =>
                     
                        dout  <= x"80000003";   -- sdram DMA id
                        
                        ready <= '1';
                        
                     --0x04 r- component version                       
                     when x"01" =>
                     
                        dout  <= x"20240820";
                        
                        ready <= '1';

                     --0x08 rw ch3 dma pointer start                       
                     when x"02" =>
                     
                        dout  <= x"00" & ch3DmaPointerStart;
                        
                        if wr = '1' then
                        
                            ch3DmaPointerStart  <= din( 23 downto 0 );
                            
                        end if;
                        
                        ready <= '1';
                    
                    --0x0c rw ch3 dma request 0 modulo
                    when x"03" =>
                    
                        dout <= x"000000" & ch3DmaRequest0Modulo;

                        if wr = '1' then
                            
                            ch3DmaRequest0Modulo <= din( 7 downto 0 );
                            
                        end if;
                       
                        ready <= '1';

                    --0x10 rw ch3 dma request 1 modulo
                    when x"04" =>
                    
                        dout <= x"000000" & ch3DmaRequest1Modulo;

                        if wr = '1' then
                            
                            ch3DmaRequest1Modulo <= din( 7 downto 0 );
                            
                        end if;
                       
                        ready <= '1';
                        
                     when others =>
                     
                        dout  <= ( others =>'0' );
                        ready <= '1';
                  
                  end case; --a
               
                  regState <= rsWaitForBusCycleEnd;
               
               end if; --ce = '1'
                        
            
            when rsWaitForBusCycleEnd =>
            
               --wait for bus cycle to end
               if ce = '0' then
               
                  regState <= rsWaitForRegAccess;
                  ready <= '0';
                  
               end if;
               
            when others =>
            
               regState <= rsWaitForRegAccess;
         
         end case; --state
   
      end if; --reset = '1'
   
   end if; --rising_edge( clock )

end process;


refreshGuard: process( all )
begin
	
	if reset = '1' then
	
		refreshCounter	<= ( others => '0' );
		refreshRequest	<= '0';
		
	else
	
		if rising_edge( sdramClock ) then
		
		
			if refreshDone = '0' then
			
				if refreshCounter = x"000" then
		
					refreshRequest	<= '1';
		
				else
		
					refreshCounter	<= refreshCounter - 1;
		
				end if;
	
	
			else  --refreshDone = '1' 
			
				refreshRequest	<= '0';
				refreshCounter	<= x"320";		-- 8us @ 100Mhz
			
			end if;
			
		end if;
	
	end if;

end process;

sdramDataLatcher: process( all )
begin

    if rising_edge( sdramClockPs ) then
    
        sdramDInLatched <= sdramD;
        
    end if;

end process;


sdramDMAMain: process( all )
begin

    if reset = '1' then

        sdcState        <= sdcInit0;
        sdcReturnState  <= sdcIdle;
		
        resetCounter    <= x"ffff";
        refreshDone     <= '0';
        
        sdramCKE        <= '1';
        sdramDQM        <= ( others => '1' );
        sdramBa         <= "11";
		
        sdramA          <= ( others => '0' );
        sdramD          <= ( others => 'Z' );
		
        sdramCS         <= '0';
        sdramRAS        <= '1';
        sdramCAS        <= '1';
        sdramWe         <= '1';
		
        ch0Ready        <= '0';
        ch0Dout         <= ( others => '0' );
   
        ch1DmaReady     <= '1';
        ch1Dout         <= ( others => '0' );
   
        ch3DmaRequestLatched    <= ( others => '0' );
        ch3DmaPointer           <= ( others => '0' );

        ch3BufRamDin            <= ( others => '0' );
        ch3BufRamWrA            <= ( others => '0' );
        ch3BufRamWr             <= '0';
        ch3TransferCounter      <= ( others => '0' );
        ch3DmaBufPointer        <= ( others => '0' );

        
    else
        
        if rising_edge( sdramClock ) then

            --latch ch3 dma requests
            if ch3DmaRequest( 0 ) = '1' then
             
                ch3DmaRequestLatched( 0 ) <= '1';
        
            end if;
  
            if ch3DmaRequest( 1 ) = '1' then
             
                ch3DmaRequestLatched( 1 ) <= '1';
                
            end if;
     
             --reset ch3 dma pointer if requested
            if ch3DmaPointerReset = '1' then
             
                ch3DmaPointer  <= ch3DmaPointerStart;
                
            end if;
        
            case sdcState is

                when sdcIdle =>

                    ch0Ready	<= '0';
                    ch1DmaReady	<= '1';

                    --nop
                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS    <= '1';
                    sdramWe     <= '1';	
			
                    --check refresh request

                    if refreshRequest = '1' then

                        --refresh request

                        ch0Ready        <= '0';
                        
                        --call refresh
                        sdcReturnState  <= sdcIdle;
                        sdcState        <= sdcSubRefresh0;
								
                    else    --refreshRequest = 0

                        --normal operation

                        --check ch3 access
                        if ch3DmaRequestLatched( 0 ) = '1' then

                            ch3DmaBufPointer    <= "000000000";                       
                            ch3TransferCounter  <= x"9f";           --160 long words
                            
                            sdcState            <= sdcCh3Read0;
                        
                        elsif ch3DmaRequestLatched( 1 ) = '1' then

                            ch3DmaBufPointer    <= "100000000";                       
                            ch3TransferCounter  <= x"9f";           --160 long words
                            
                            sdcState            <= sdcCh3Read0;
                            
                        --check ch1 access
                        elsif ch1DmaRequest = '1' then

                            ch1DmaReady <= '0';
                            
                            if ch1DmaWordSize = '0' then
                                
                                --16 bit transfer
                                
                                --row / bank address ( ch1 adr max downto 9 )
                                
                                sdramBA     <= ch1A( 24 downto 23 );
                                sdramA      <= ch1A( 22 downto 10 );
                                
                                
                            else --ch1DmaWordSize = '1'

                                --32 bit transfer
                            
                                --row / bank address ( cpu adr max downto 8 )
                                
                                sdramBA     <= ch1A( 23 downto 22 );
                                sdramA      <= ch1A( 21 downto 9 );
                            
                            end if; --ch1DmaWordSize = '0' or '1'
                                
                            --bank/row activation
            
                            sdramDQM    <= ( others => '0' );
            
            
                            --row select, read, auto precharge
                                       
                            sdramCS     <= '0';
                            sdramRAS    <= '0';
                            sdramCAS    <= '1';
                            sdramWE     <= '1';

                            if ch1Wr = '1' then
                                
                                --write
                                --put data on sdram data bus
                                
                                if ch1DmaWordSize = '0' then                                
                                
                                    --16 bit access
                                    
                                    sdramD      <= ch1Din( 15 downto 0 ) & ch1Din( 15 downto 0 );
                                
                                else

                                    --32 bit access
                                    
                                    sdramD      <= ch1Din;
                                
                                end if;
                            
                                --switch to next state
                            
                                sdcState <= sdcCh1Write0;
                            
                            else --ch1Wr = '0'
                            
                                --read
                            
                                --sdram data bus in
                                sdramD      <= ( others => 'Z' );

                                --switch to next state

                                sdcState <= sdcCh1Read0;

                            end if; --ch1Wr = '1' or '0'

                        --check ch0 access					
                        elsif ch0Ce = '1' then


                            if ch0Wr = '1' then

                                --write
                                --bank/row activation
                
                                sdramDQM    <= ( others => '0' );
                                               
                                --put data on bus
                                sdramD      <= ch0Din;
                                 
                                --row select, read, auto precharge
                                
                                --row / bank address ( cpu adr max downto 8 )
                
                              
                                sdramBA     <= ch0A( 23 downto 22 );
                                sdramA      <= ch0A( 21 downto 9 );
                
                                sdramCS     <= '0';
                                sdramRAS    <= '0';
                                sdramCAS    <= '1';
                                sdramWE     <= '1';
            
                                sdcState    <= sdcCh0Write0;

                            else --ch0Wr = '0'
 
                                --read
 
                                --bank/row activation
                
                                sdramDQM    <= ( others => '0' );
                
                                --sdram data bus in
                                sdramD      <= ( others => 'Z' );
                
                                --row select, read, auto precharge
                                
                                --row / bank address ( cpu adr max downto 8 )
                                
                                sdramBA     <= ch0A( 23 downto 22 );
                                sdramA      <= ch0A( 21 downto 9 );
                
                                sdramCS     <= '0';
                                sdramRAS    <= '0';
                                sdramCAS    <= '1';
                                sdramWE     <= '1';
            
                                   
                                sdcState    <= sdcCh0Read0;
                            
                            end if; --ch0Wr = '1' or '0'
                    
                        end if; --ch0Ce = '1'
                    
                    end if; -- refreshRequest = '1' or '0'

                --ch1 blitter ( 16 / 32 bit )
                
                when sdcCh1Read0 =>
                
                    --nop
                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS	<= '1';
                    sdramWE 	<= '1';

                    sdcState    <= sdcCh1Read1;
                    
                when sdcCh1Read1 =>
                
                    --nop
                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS	<= '1';
                    sdramWE 	<= '1';

                    sdcState    <= sdcCh1Read2;
                    
                when sdcCh1Read2 =>

                    --column select, read

                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS    <= '0';
                    sdramWE     <= '1';

                    --auto precharge

                    sdramA( 12 downto 9 )   <= "0010";

                    --column address ( both cpu and sdram addresses are in longwords )
                    --a0-a8 - column address (word)
                    --cpu addresses in longwords

                    if ch1DmaWordSize = '0' then
                        
                        --16 bit
                        sdramA( 8 downto 0 )    <= ch1A( 9 downto 1 );

                    else
                    
                        --32 bit
                        
                        sdramA( 8 downto 0 )    <= ch1A( 8 downto 0 );
                    
                    end if;
                    
                    sdcState    <= sdcCh1Read3;

                when sdcCh1Read3 =>

                    -- cas latency 1
                
                    --nop
                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS	<= '1';
                    sdramWE 	<= '1';

                    
                    sdcState    <= sdcCh1Read4;
				
                when sdcCh1Read4 =>
                
                    -- cas latency 2 
                
                    --nop
                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS    <= '1';
                    sdramWE     <= '1';

                    sdcState    <= sdcCh1Read5;

               when sdcCh1Read5 =>
                
                    --data latch latency 
                    --nop
                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS    <= '1';
                    sdramWE     <= '1';

                    
                    sdcState    <= sdcCh1Read6;
                    
                when sdcCh1Read6 => 
                
                    if ch1DmaWordSize = '0' then
                        
                        --16 bit                                    
                        if ch1A( 0 ) = '0' then
                        
                            ch1Dout     <= x"0000" & sdramDInLatched( 15 downto 0 ) ;
                        
                        else
                        
                            ch1Dout     <= x"0000" & sdramDInLatched( 31 downto 16 ) ;
                        
                        end if;
                
                    else
                    
                        --32 bit
                        ch1Dout     <= sdramDInLatched;

                    end if;
                    
                    --nop
                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS    <= '1';
                    sdramWE     <= '1';

               --notify blitter, data is ready
                    
                    ch1DmaReady <= '1';

                    sdcState    <= sdcCh1Read7;
                    
                when sdcCh1Read7 =>           
                    
                    if ch1DmaRequest = '0' then
                    
                        sdcState <= sdcIdle;
                        
                    end if;
                    
                    
                --ch3 pixelGenGfx buffer fetch ( 160 32-bit words )

                when sdcCh3Read0 =>
                
                    --bank/row activation
    
                    sdramDQM    <= ( others => '0' );
    
                    --sdram data bus in
                    sdramD      <= ( others => 'Z' );
    
                    --row select, read, auto precharge
                    
                    --row / bank address ( cpu adr max downto 8 )
    
                    
                    sdramBA     <= ch3DmaPointer( 23 downto 22 );
                    sdramA      <= ch3DmaPointer( 21 downto 9 );
    
                    sdramCS     <= '0';
                    sdramRAS    <= '0';
                    sdramCAS    <= '1';
                    sdramWE     <= '1';     
                               
                    sdcState    <= sdcCh3Read1;

                when sdcCh3Read1 =>
 
                     --nop
                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS	<= '1';
                    sdramWE 	<= '1';
                                   
                    sdcState    <= sdcCh3Read2;

                when sdcCh3Read2 =>

                    --nop
                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS	<= '1';
                    sdramWE 	<= '1';
                                    
                    sdcState    <= sdcCh3Read3;

                when sdcCh3Read3 =>
                
                     --column select, read

                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS    <= '0';
                    sdramWE     <= '1';

                     if ch3TransferCounter /= 0 then
                        
                        --leave row open 
                        
                        sdramA( 12 downto 9 )   <= "0000";
                    
                    else --ch3TransfterCounter == 0 
                    
                        --auto precharge

                        sdramA( 12 downto 9 )   <= "0010";
                    
                    end if;
                    
                        
                    --column address ( both cpu and sdram addresses are in longwords )
                    --a0-a8 - column address (word)
                    --cpu addresses in longwords

                    sdramA( 8 downto 0 )    <= ch3DmaPointer( 8 downto 0 );

                    ch3DmaPointer           <= ch3DmaPointer + 1;

                    --prepare ch3 buf address
                    
                    ch3BufRamWrA            <= ch3DmaBufPointer;
                    ch3DmaBufPointer        <= ch3DmaBufPointer + 1;

                    ch3BufRamWr             <= '0';
                    
                    sdcState    <= sdcCh3Read4;

                when sdcCh3Read4 =>

                    --cas latency 1
                    
                    --nop
                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS	<= '1';
                    sdramWE 	<= '1';
                                    
                    sdcState    <= sdcCh3Read5;

                when sdcCh3Read5 =>

                    --cas latency 2
                    
                    --nop
                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS	<= '1';
                    sdramWE 	<= '1';
                                    
                    sdcState    <= sdcCh3Read6;

                when sdcCh3Read6 =>

                    ch3BufRamDin    <= sdramD;
                    ch3BufRamWr     <= '1';
                    
                    --nop
                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS	<= '1';
                    sdramWE 	<= '1';

                    
                    if ch3TransferCounter /= 0 then
                    
                        ch3TransferCounter  <= ch3TransferCounter - 1;
                        
                        sdcState    <= sdcCh3Read3;
                        
                    else
                    
                        sdcState    <= sdcCh3Read7;
                       
                   end if;
                   
                when sdcCh3Read7 =>
                    
                    --nop
                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS	<= '1';
                    sdramWE 	<= '1';
                         
                     
                    --ch3DmaPointer           <= ch3DmaPointer + 96;
                    if ch3DmaRequestLatched( 0 ) = '1' then
                    
                        ch3DmaPointer <= ch3DmaPointer + ch3DmaRequest0Modulo;
                    
                    else

                        ch3DmaPointer <= ch3DmaPointer + ch3DmaRequest1Modulo;
                        
                    end if;
                                   
                    ch3DmaRequestLatched( 0 )   <= '0';
                    ch3DmaRequestLatched( 1 )   <= '0';

                    sdcState    <= sdcCh3Read8;

                when sdcCh3Read8 =>
                    
                    --nop
                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS	<= '1';
                    sdramWE 	<= '1';
                          
                    sdcState    <= sdcIdle;


                when sdcCh0Read0 =>
                
                    --nop
                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS	<= '1';
                    sdramWE 	<= '1';

    
                    sdcState <= sdcCh0Read1;        

                when sdcCh0Read1 =>
                
                    --nop
                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS	<= '1';
                    sdramWE 	<= '1';

                    sdcState <= sdcCh0Read2;        

                when sdcCh0Read2 =>
                
                    --column select, read

                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS    <= '0';
                    sdramWE     <= '1';

                    --auto precharge

                    sdramA( 12 downto 9 )   <= "0010";

                    --column address ( both cpu and sdram addresses are in longwords )
                    --a0-a8 - column address (word)
                    --cpu addresses in longwords

                    sdramA( 8 downto 0 )    <= ch0A( 8 downto 0 );

                    sdcState <= sdcCh0Read3;        

                when sdcCh0Read3 =>

                    -- cas latency 1
                
                    --nop
                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS	<= '1';
                    sdramWE 	<= '1';

                    
                    sdcState                <= sdcCh0Read4;
				
                when sdcCh0Read4 =>
                
                    -- cas latency 2 
                
                    --nop
                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS    <= '1';
                    sdramWE     <= '1';


                    sdcState    <= sdcCh0Read5;

               when sdcCh0Read5 =>
                
                    --data latch latency 
                    --nop
                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS    <= '1';
                    sdramWE     <= '1';

                    
                    sdcState    <= sdcCh0Read6;

                when sdcCh0Read6 =>

                    ch0Dout     <= sdramDInLatched;

                    --nop
                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS    <= '1';
                    sdramWE     <= '1';

               --notify CPU, data is ready
                    
                    ch0Ready    <= '1';

                    if ch0CE = '0' then
                
                        ch0Ready    <= '0';
                        sdcState    <= sdcIdle;
                    
                    else
                    
                        sdcState    <= sdcCh0Read6;
                    
                    end if;
                                   

                when sdcCh0Write0 =>
                
                    --nop
                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS	<= '1';
                    sdramWE 	<= '1';
    
                    sdcState <= sdcCh0Write1;        

                when sdcCh0Write1 =>
                
                    --nop
                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS	<= '1';
                    sdramWE 	<= '1';

                    sdcState <= sdcCh0Write2;        

                when sdcCh0Write2 =>
                
                    --write
                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS	<= '0';
                    sdramWE 	<= '0';

                    --auto precharge

                    sdramA( 12 downto 9 )   <= "0010";

                    --column address ( both cpu and sdram addresses are in longwords )
                    --a0-a8 - column address (word)
                    --cpu addresses in longwords

                    sdramA( 8 downto 0 )    <= ch0A( 8 downto 0 );
                    

                    sdramDQM( 0 ) <= not ch0DataMask( 0 );
                    sdramDQM( 1 ) <= not ch0DataMask( 1 );
                    sdramDQM( 2 ) <= not ch0DataMask( 2 );
                    sdramDQM( 3 ) <= not ch0DataMask( 3 );

                    sdcState <= sdcCh0Write3;        

                when sdcCh0Write3 =>
                
                    --nop
                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS	<= '1';
                    sdramWE 	<= '1';
                    
                    sdcState <= sdcCh0Write4;        
                    
                when sdcCh0Write4 =>
                    
                    --sdram data bus in
                    sdramD      <= ( others => 'Z' );
                                        --nop
                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS	<= '1';
                    sdramWE 	<= '1';

                    sdcState <= sdcCh0Write5;        

                when sdcCh0Write5 =>

                    --nop
                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS	<= '1';
                    sdramWE 	<= '1';


                    sdcState <= sdcCh0Write6;        

                when sdcCh0Write6 =>

                    --notify cpu that data has been written
                    ch0Ready    <= '1';

                    --nop
                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS	<= '1';
                    sdramWE 	<= '1';

                    if ch0CE = '0' then
                        
                        ch0Ready    <= '0';
                        sdcState    <= sdcIdle;
                        
                    end if;

                    
                when sdcInit0 =>

                    if resetCounter /= x"0000" then
                    
                        resetCounter <= resetCounter - 1;
                    
                    else
                    
                        sdcState <= sdcInit1;
                    
                    end if;
			
                when sdcInit1 =>
    
                    --precharge all banks
    
                    sdramCS         <= '0';
                    sdramRAS        <= '0';
                    sdramCAS        <= '1';
                    sdramWe         <= '0';
    
                    sdramBA         <= "00";
                    sdramA( 10 )    <= '1';
    
                    sdcState        <= sdcInit2;
    
                when sdcInit2 =>
                
                    --nop
                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS    <= '1';
                    sdramWe     <= '1';
            
                    --call refresh
                    sdcState        <= sdcSubRefresh0;
                    sdcReturnState  <= sdcInit3;
                    
                when sdcInit3 =>
     
                    --nop
                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS    <= '1';
                    sdramWe     <= '1';
                    
                    --call refresh
                    sdcState        <= sdcSubRefresh0;
                    sdcReturnState  <= sdcInit4;
                
                when sdcInit4 =>
    
                    --mode register set
    
                    sdramCS     <= '0';
                    sdramRAS    <= '0';
                    sdramCAS    <= '0';
                    sdramWe     <= '0';
    
                    sdramBa     <= "00";
                    
                    --burst lenght = 1
                    --addressing mode = sequential
                    --cas latency = 2
                    
    
                    sdramA      <=  "000" & '0' & "00" & "010" & '0' & "000";
                    sdcState    <= sdcInit5;
                    
                when sdcInit5 =>
    
                    sdramCS     <= '1';
                    sdcState    <= sdcInit6;
    
                when sdcInit6 =>
    
                    --nop
                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS    <= '1';
                    sdramWe     <= '1';
                                
                    sdcState    <= sdcIdle;
                    
                --refresh subroutine
    
                when sdcSubRefresh0 =>
    
                    --auto refresh
                    sdramCS     <= '0';
                    sdramRAS    <= '0';
                    sdramCAS    <= '0';
                    sdramWe     <= '1';
    
                    sdcState    <= sdcSubRefresh1;
    
                when sdcSubRefresh1 =>
    
                    --clear refreshCounter
    
                    refreshDone		<= '1';
    
                    --nop
                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS    <= '1';
                    sdramWe     <= '1';
    
                    sdcState    <= sdcSubRefresh2;
    
                when sdcSubRefresh2 =>
    
                    --nop
                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS    <= '1';
                    sdramWe     <= '1';
    
                    sdcState    <= sdcSubRefresh3;
    
                when sdcSubRefresh3 =>
    
                    refreshDone		<= '0';
                    
                    --nop
                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS    <= '1';
                    sdramWe     <= '1';
    
                    sdcState    <= sdcSubRefresh4;
    
                when sdcSubRefresh4 =>
    
                    --nop
                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS    <= '1';
                    sdramWe     <= '1';
    
                    sdcState    <= sdcSubRefresh5;
    
                when sdcSubRefresh5 =>
    
                    --nop
                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS    <= '1';
                    sdramWe     <= '1';
    
                    sdcState    <= sdcReturnState;
                    
                when others =>
    
                    sdcState	<= sdcIdle;
                    
            end case; --sdcState is
        
        
        
        end if; --rising_edge( sdramClock )
        
    end if; --reset = '1' or '0'

end process;


--place gfx buf ram ( ch3 )
gfxBufRamInst:gfxBufRam
port map( 
    clka    => ch3BufClk,
    wea(0)  => '0',
    addra   => ch3BufA,
    dina    => ( others => '0' ),
    douta   => ch3BufDout,

    clkb    => sdramClock,
    web(0)  => ch3BufRamWr,
    addrb   => ch3BufRamWrA,
    dinb    => ch3BufRamDin
    --doutb   => 
  );


end Behavioral;
