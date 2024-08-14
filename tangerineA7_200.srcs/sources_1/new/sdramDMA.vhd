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
    reset:          in      std_logic;
    
    cpuClock:       in      std_logic;
    sdramClock:     in      std_logic;
    sdramClockPs:   in      std_logic;


   --bus interface ( registers )

    a:              in      std_logic_vector( 15 downto 0 );
    din:            in      std_logic_vector( 31 downto 0 );
    dout:           out     std_logic_vector( 31 downto 0 );
    ce:             in      std_logic;
    wr:             in      std_logic;
    dataMask:       in      std_logic_vector( 3 downto 0 );
    ready:          out     std_logic;
    
    --ch0 - CPU, lowest priority: 0
    
    ch0A:           in  std_logic_vector( 23 downto 0 );
    ch0Din:         in  std_logic_vector( 31 downto 0 );
    ch0Dout:        out std_logic_vector( 31 downto 0 );
   
    ch0Ce:          in  std_logic;
    ch0Wr:          in  std_logic;
    ch0DataMask:    in  std_logic_vector( 3 downto 0 );
    ch0InstrCycle:  in  std_logic;

    ch0Ready:       out std_logic; 
    
    --ch1 - blitter, priority: 1
    
    --ch2 - audio, priority: 2
    
    --ch3 - gfx display, highest priority: 3


    --sdram
    sdramA:         out     std_logic_vector( 12 downto 0 );
    sdramBA:        out     std_logic_vector( 1 downto 0 );
    sdramD:         inout   std_logic_vector( 31 downto 0 );
    sdramCKE:       out     std_logic;
    sdramCLK:       out     std_logic;
    sdramDQM:       out     std_logic_vector( 3 downto 0 );
    sdramCAS:       out     std_logic;
    sdramRAS:       out     std_logic;
    sdramWE:        out     std_logic;
    sdramCS:        out     std_logic  

);
end sdramDMA;

architecture Behavioral of sdramDMA is

type regState_T is ( rsWaitForRegAccess, rsWaitForBusCycleEnd );

signal regState:    regState_T;

type sdcState_T is ( sdcIdle, sdcInit0, sdcInit1, sdcInit2, sdcInit3, sdcInit4, sdcInit5, sdcInit6,
	sdcCh0Read0, sdcCh0Read1, sdcCh0Read2, sdcCh0Read3, sdcCh0Read4, sdcCh0Read5, sdcCh0Read6, sdcCh0Read7, sdcCh0Read8, 
	sdcCh0Write0, sdcCh0Write1, sdcCh0Write2, sdcCh0Write3, sdcCh0Write4, sdcCh0Write5, sdcCh0Write6, sdcCh0Write7, sdcCh0Write8,
	sdcSubRefresh0, sdcSubRefresh1, sdcSubRefresh2, sdcSubRefresh3, sdcSubRefresh4, sdcSubRefresh5, sdcSubRefresh6
	);
	
signal sdcState:        sdcState_T;
signal sdcReturnState:  sdcState_T;

signal resetCounter:    std_logic_vector( 15 downto 0 );
signal refreshCounter:	std_logic_vector( 11 downto 0 );
signal refreshRequest:	std_logic;
signal refreshDone:		std_logic;

begin

--assign sdram clock

sdramCLK    <= sdramClockPs;


registers: process( all )
begin

   if rising_edge( cpuClock ) then
   
      if reset = '1' then
            
         ready                <= '0';  
         regState             <= rsWaitForRegAccess;
         
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
                     
                        dout  <= x"20240813";
                        
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
        
    else
        
        if rising_edge( sdramClock ) then
        
            case sdcState is

                when sdcIdle =>

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

                        --check ch0 access
					
                        if ch0Ce = '1' then

                            ch0Ready	<= '0';

                            --


                            if ch0Wr = '1' then

                                --write

                                sdcState    <= sdcCh0Write0;

                            else --ch0Wr = '0'
 
                                --read
						
                                sdcState    <= sdcCh0Read0;
                            
                            end if; --ch0Wr = '1' or '0'
                    
                        end if; --ch0Ce = '1'
                    
                    end if; -- refreshRequest = '1' or '0'


                when sdcCh0Read0 =>
                

                    --bank/row activation
    
                    sdramDQM    <= ( others => '0' );
    
                    --sdram data bus in
                    sdramD      <= ( others => 'Z' );
    
                    --row select, read, auto precharge
                    
                    --row / bank address ( cpu adr max downto 8 )
    
                    --todo, adjust for 32bit sdram
                    sdramBA     <= ch0A( 23 downto 22 );
                    sdramA      <= ch0A( 21 downto 9 );
    
                    sdramCS     <= '0';
                    sdramRAS    <= '0';
                    sdramCAS    <= '1';
                    sdramWE     <= '1';
    
                    sdcState <= sdcCh0Read1;        

                when sdcCh0Read1 =>
                
                    --nop
                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS	<= '1';
                    sdramWE 	<= '1';

                    sdcState <= sdcCh0Read2;        

                when sdcCh0Read2 =>
                
                    --nop
                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS	<= '1';
                    sdramWE 	<= '1';

                    sdcState <= sdcCh0Read3;        

                when sdcCh0Read3 =>

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
                    
                    sdcState                <= sdcCh0Read4;
				
                when sdcCh0Read4 =>
                
                    -- cas latency 1
                
                    --nop
                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS    <= '1';
                    sdramWE     <= '1';

                    sdcState    <= sdcCh0Read5;

               when sdcCh0Read5 =>
                
                    -- cas latency 2
                
                    --nop
                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS    <= '1';
                    sdramWE     <= '1';

                    sdcState    <= sdcCh0Read6;

                when sdcCh0Read6 =>

                    ch0Dout     <= sdramD;
                    
                    --nop
                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS    <= '1';
                    sdramWE     <= '1';

                    --notify CPU, data is ready
                    ch0Ready    <= '1';
                    
                    sdcState    <= sdcCh0Read7;

                when sdcCh0Read7 =>
                
                    --nop
                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS    <= '1';
                    sdramWE     <= '1';

                    if ch0CE = '0' then
                    
                        ch0Ready    <= '0';
                        sdcState    <= sdcIdle;
                        
                    end if;

                when sdcCh0Write0 =>
                
--    ch0A:           in  std_logic_vector( 23 downto 0 );
--    ch0Din:         in  std_logic_vector( 31 downto 0 );
--    ch0Dout:        out std_logic_vector( 31 downto 0 );
   
--    ch0Ce:          in  std_logic;
--    ch0Wr:          in  std_logic;
--    ch0DataMask:    in  std_logic_vector( 3 downto 0 );
--    ch0InstrCycle:  in  std_logic;

--    ch0Ready:       out std_logic; 

                    --bank/row activation
    
                    sdramDQM    <= ( others => '0' );
    
                    --sdram data bus in
 --                   sdramD      <= ( others => 'Z' );
                    
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
    
                    sdcState <= sdcCh0Write1;        

                when sdcCh0Write1 =>
                
                    --nop
                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS	<= '1';
                    sdramWE 	<= '1';

                    sdcState <= sdcCh0Write2;        

                when sdcCh0Write2 =>
                
                    --nop
                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS	<= '1';
                    sdramWE 	<= '1';

                    sdcState <= sdcCh0Write3;        

                when sdcCh0Write3 =>
                
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
                    
                    sdcState <= sdcCh0Write4;        
                    
                when sdcCh0Write4 =>

                    --notify cpu that data has been written
                    ch0Ready    <= '1';
                    
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

                    --nop
                    sdramCS     <= '0';
                    sdramRAS    <= '1';
                    sdramCAS	<= '1';
                    sdramWE 	<= '1';

                    if ch0CE = '0' then
                        
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
                    --burst read and burst write
    
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



end Behavioral;
