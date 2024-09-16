----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/23/2024 01:55:24 PM
-- Design Name: 
-- Module Name: blitter - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity blitter is
port( 
    
    --reset, clocks

    reset:          in      std_logic;
    clock:          in      std_logic;

   --bus interface ( registers )

    a:                  in      std_logic_vector( 15 downto 0 );
    din:                in      std_logic_vector( 31 downto 0 );
    dout:               out     std_logic_vector( 31 downto 0 );
    ce:                 in      std_logic;
    wr:                 in      std_logic;
    dataMask:           in      std_logic_vector( 3 downto 0 );
    ready:              out     std_logic;

    --dma interface
    
    bltDmaRequest:      out     std_logic;
    bltDmaReady:        in      std_logic;
    bltDmaWordSize:     out     std_logic;
    bltA:               out     std_logic_vector( 24 downto 0 );
    bltDin:             in      std_logic_vector( 31 downto 0 );
    bltDout:            out     std_logic_vector( 31 downto 0 );
    bltWr:              out     std_logic
    
);
end blitter;

architecture Behavioral of blitter is

--components

-- pixel alpha channel calculator

component pixelAlpha is
port(

    reset:      in  std_logic;
    clock:      in  std_logic;
	 	 
    colorInA:   in  std_logic_vector( 15 downto 0 );
    colorInB:   in  std_logic_vector( 15 downto 0 );
    alpha:      in  std_logic_vector( 4 downto 0 );
    colorOut:   out std_logic_vector( 15 downto 0 )

);
end component;


--signals

--registers signals

type regState_T is ( rsWaitForRegAccess, rsWaitForBusCycleEnd );
signal regState:        regState_T;

--command/status

signal  commandReg:     std_logic_vector( 31 downto 0 );

--general purpose registers

signal  input0Reg:      std_logic_vector( 31 downto 0 );
signal  input1Reg:      std_logic_vector( 31 downto 0 );
signal  input2Reg:      std_logic_vector( 31 downto 0 );
signal  input3Reg:      std_logic_vector( 31 downto 0 );


--sources

signal  saAddressReg:   std_logic_vector( 31 downto 0 );
signal  saRowWidthReg:  std_logic_vector( 15 downto 0 );
signal  saWidthReg:     std_logic_vector( 15 downto 0 );
signal  saHeightReg:    std_logic_vector( 15 downto 0 );

signal  sbAddressReg:   std_logic_vector( 31 downto 0 );
signal  sbRowWidthReg:  std_logic_vector( 15 downto 0 );

signal  scAddressReg:   std_logic_vector( 31 downto 0 );
signal  scRowWidthReg:  std_logic_vector( 15 downto 0 );

--destinations

signal  daAddressReg:   std_logic_vector( 31 downto 0 );
signal  daRowWidthReg:  std_logic_vector( 15 downto 0 );
signal  daWidthReg:     std_logic_vector( 15 downto 0 );
signal  daHeightReg:    std_logic_vector( 15 downto 0 );

signal  dbAddressReg:   std_logic_vector( 31 downto 0 );
signal  dbRowWidthReg:  std_logic_vector( 15 downto 0 );

--calculated registers

signal  saColAdd:       std_logic_vector( 15 downto 0 );
signal  sbColAdd:       std_logic_vector( 15 downto 0 );
signal  scColAdd:       std_logic_vector( 15 downto 0 );
signal  daColAdd:       std_logic_vector( 15 downto 0 );
signal  dbColAdd:       std_logic_vector( 15 downto 0 );

--fsm

type    bltState_t is ( bsIdle, 
                        bsFill0, bsFill1,
                        bsCopy0, bsCopy1, bsCopy2, 
                        bsAlphaCopy0, bsAlphaCopy1, bsAlphaCopy2, bsAlphaCopy3, bsAlphaCopy4, bsAlphaCopy5,  
                        bsSubRead0, bsSubRead1, bsSubRead2, bsSubWrite0, bsSubWrite1, bsSubWrite2, bsSubWrite3 );

signal  bltState:       bltState_t;
signal  bltReturnState: bltState_t;

--blitter command trigger

signal  bltRun:         std_logic;
signal  bltReady:       std_logic;

--subRead
signal dmaReadAddr:     std_logic_vector( 24 downto 0 );
signal dmaReadData:     std_logic_vector( 31 downto 0 );

--subWrite
signal dmaWriteAddr:    std_logic_vector( 24 downto 0 );
signal dmaWriteData:    std_logic_vector( 31 downto 0 );


--counters
signal counterX:        std_logic_vector( 15 downto 0 );
signal counterXMax:     std_logic_vector( 15 downto 0 );
signal counterY:        std_logic_vector( 15 downto 0 );

--data pointers ( for multiple source / destination modes )
signal dpSa:            std_logic_vector( 24 downto 0 );
signal dpSb:            std_logic_vector( 24 downto 0 );
signal dpSc:            std_logic_vector( 24 downto 0 );
signal dpDa:            std_logic_vector( 24 downto 0 );
signal dpDb:            std_logic_vector( 24 downto 0 );


--pixel alpha
signal paColorInA:      std_logic_vector( 15 downto 0 );
signal paColorInB:      std_logic_vector( 15 downto 0 );
signal paAlpha:         std_logic_vector( 4 downto 0 );
signal paColorOut:      std_logic_vector( 15 downto 0 );

begin  
        
 
registers: process( all )

begin

     
    if reset = '1' then

        --cpu bus
        ready           <= '0';  
                   
        --clear registers
        commandReg      <= ( others => '0' );
        input0Reg       <= ( others => '0' );
        input1Reg       <= ( others => '0' );
        input2Reg       <= ( others => '0' );
        input3Reg       <= ( others => '0' );
        saAddressReg    <= ( others => '0' );
        saRowWidthReg   <= ( others => '0' );
        saWidthReg      <= ( others => '0' );
        saHeightReg     <= ( others => '0' );
        sbAddressReg    <= ( others => '0' );
        sbRowWidthReg   <= ( others => '0' );
        scAddressReg    <= ( others => '0' );
        scRowWidthReg   <= ( others => '0' );
        daAddressReg    <= ( others => '0' );
        daRowWidthReg   <= ( others => '0' );
        daWidthReg      <= ( others => '0' );
        daHeightReg     <= ( others => '0' );
        dbAddressReg    <= ( others => '0' );
        dbRowWidthReg   <= ( others => '0' );
        
        --clear command trigger
        
        bltRun          <= '0';
        
    elsif rising_edge( clock ) then
      
        --clear command trigger
        
        bltRun          <= '0';

        case regState is
  
            when rsWaitForRegAccess =>
        
                if ce = '1' then
              
                    --cpu wants to access registers
              
                    ready <= '0';
                 
                    case a( 7 downto 0 ) is
                 
                        --0x00 r- id                      
                        when x"00" =>
                 
                            ready   <= '1';

                            dout    <= x"80000005";   -- blitter id
                                        
                        --0x04 r- component version                       
                        when x"01" =>

                            ready   <= '1';
                 
                            dout    <= x"20240916";
                    
                        --0x08 rw commandReg
                        when x"02" =>

                            ready   <= '1';
                            
                            dout    <= x"0000000" & "000" & bltReady;
                            
                            if wr = '1' then
                            
                                commandReg    <= din;
                                
                                --set command trigger
        
                                bltRun          <= '1';

                            end if;

                        --0x0c rw input0Reg
                        when x"03" =>

                            ready   <= '1';

                            dout    <= input0Reg;
                            
                            if wr = '1' then
                            
                                input0Reg   <= din;
                                
                            end if;
                            
                        --0x10 rw input1Reg
                        when x"04" =>

                            ready   <= '1';

                            dout    <= input1Reg;
                            
                            if wr = '1' then
                            
                                input1Reg   <= din;
                                
                            end if;

                        --0x14 rw input2Reg
                        when x"05" =>

                            ready   <= '1';

                            dout    <= input2Reg;
                            
                            if wr = '1' then
                            
                                input2Reg   <= din;
                                
                            end if;

                        --0x18 rw input3Reg
                        when x"06" =>

                            ready   <= '1';

                            dout    <= input3Reg;
                            
                            if wr = '1' then
                            
                                input3Reg   <= din;
                                
                            end if;

                        --0x1c rw saAddressReg
                        when x"07" =>
                        
                            ready   <= '1';

                            dout    <= saAddressReg;
                            
                            
                            if wr = '1' then
                            
                                saAddressReg    <= din;
                                
                            end if;
                            
                        --0x20 rw saRowWidthReg
                        when x"08" =>
                        
                            ready   <= '1';

                            dout    <= x"0000" & saRowWidthReg;
                            
                            
                            if wr = '1' then
                            
                                saRowWidthReg    <= din( 15 downto 0 );
                                
                            end if;

                        --0x24 rw saWidthReg
                        when x"09" =>
                        
                            ready   <= '1';

                            dout    <= x"0000" & saWidthReg;
                            
                            
                            if wr = '1' then
                            
                                saWidthReg    <= din( 15 downto 0 );
                                
                            end if;

                        --0x28 rw saHeightReg
                        when x"0a" =>
                        
                            ready   <= '1';

                            dout    <= x"0000" & saHeightReg;
                            
                            
                            if wr = '1' then
                            
                                saHeightReg    <= din( 15 downto 0 );
                                
                            end if;
                            
                        --0x2c rw sbAddressReg
                        when x"0b" =>
                        
                            ready   <= '1';

                            dout    <= sbAddressReg;
                            
                            
                            if wr = '1' then
                            
                                sbAddressReg    <= din;
                                
                            end if;

                        --0x30 rw sbRowWidthReg
                        when x"0c" =>
                        
                            ready   <= '1';

                            dout    <= x"0000" & sbRowWidthReg;
                            
                            
                            if wr = '1' then
                            
                                sbRowWidthReg    <= din( 15 downto 0 );
                                
                            end if;
                            
                        --0x34 rw scAddressReg
                        when x"0d" =>
                        
                            ready   <= '1';

                            dout    <= scAddressReg;
                                                        
                            if wr = '1' then
                            
                                scAddressReg    <= din;
                                
                            end if;

                        --0x38 rw scRowWidthReg
                        when x"0e" =>
                        
                            ready   <= '1';

                            dout    <= x"0000" & scRowWidthReg;
                                                        
                            if wr = '1' then
                            
                                scRowWidthReg    <= din( 15 downto 0 );
                                
                            end if;

                        --0x3c rw daAddressReg
                        when x"0f" =>
                        
                            ready   <= '1';

                            dout    <= daAddressReg;
                                                       
                            if wr = '1' then
                            
                                daAddressReg    <= din;
                                
                            end if;

                        --0x40 rw daRowWidthReg
                        when x"10" =>
                        
                            dout    <= x"0000" & daRowWidthReg;
                            
                            ready   <= '1';
                            
                            if wr = '1' then
                            
                                daRowWidthReg    <= din( 15 downto 0 );
                                
                            end if;

                        --0x44 rw daWidthReg
                        when x"11" =>
                        
                            ready   <= '1';

                            dout    <= x"0000" & daWidthReg;
                                                        
                            if wr = '1' then
                            
                                daWidthReg    <= din( 15 downto 0 );
                                
                            end if;

                        --0x48 rw daHeightReg
                        when x"12" =>
                        
                            ready   <= '1';

                            dout    <= x"0000" & daHeightReg;
                                                        
                            if wr = '1' then
                            
                                daHeightReg    <= din( 15 downto 0 );
                                
                            end if;

                        --0x4c rw daHeightReg
                        when x"13" =>
                        
                            ready   <= '1';

                            dout    <= dbAddressReg;
                                                        
                            if wr = '1' then
                            
                                dbAddressReg    <= din;
                                
                            end if;

                        --0x50 rw dbRowWidthReg
                        when x"14" =>
                        
                            ready   <= '1';

                            dout    <= x"0000" & dbRowWidthReg;
                                                        
                            if wr = '1' then
                            
                                dbRowWidthReg    <= din( 15 downto 0 );
                                
                            end if;

                        
                       when others =>
                       
                            ready <= '1';
                            
                    end case;
                                         
                    regState <= rsWaitForBusCycleEnd;
              
                end if; -- ce = '1';
              
            when rsWaitForBusCycleEnd =>
           
                --wait for bus cycle to end
                if ce = '0' then
              
                    regState <= rsWaitForRegAccess;
                    ready <= '0';
                 
                end if;
              
            when others =>
           
                regState <= rsWaitForRegAccess;
              
        end case; --regState is

    end if; --reset = '1', rising_edge( clock )
         
end process;


blitterMain: process( all )

begin

    if reset = '1' then

        --fsm
        bltState        <= bsIdle;
        bltReturnState  <= bsIdle;
        bltReady        <= '0';

        --dma    
        bltDmaRequest   <= '0';
        bltDmaWordSize  <= '0';
        bltA            <= ( others => '0' );
        bltDout         <= ( others => '0' );
        bltWr           <= '0';            

        --subRead
        dmaReadAddr     <= ( others => '0' );
        dmaReadData     <= ( others => '0' );
        
        --subWrite
        dmaWriteAddr    <= ( others => '0' );
        dmaWriteData    <= ( others => '0' );

        --counters
        counterX        <= ( others => '0' );
        counterXMax     <= ( others => '0' );
        counterY        <= ( others => '0' );

        --data pointers ( for multiple source / destination modes )
        dpSa            <= ( others => '0' );
        dpSb            <= ( others => '0' );
        dpSc            <= ( others => '0' );
        dpDa            <= ( others => '0' );
        dpDb            <= ( others => '0' );
            
        --pixel alpha
        paColorInA      <= ( others => '0' );
        paColorInB      <= ( others => '0' );
        paAlpha         <= ( others => '0' );
    
    elsif rising_edge( clock ) then
    
        --calculate things :)
        saColAdd    <= std_logic_vector( unsigned( saRowWidthReg ) - unsigned( saWidthReg ) );
        sbColAdd    <= std_logic_vector( unsigned( sbRowWidthReg ) - unsigned( saWidthReg ) );
        scColAdd    <= std_logic_vector( unsigned( scRowWidthReg ) - unsigned( saWidthReg ) );
        
        daColAdd    <= std_logic_vector( unsigned( daRowWidthReg ) - unsigned( daWidthReg ) );
        dbColAdd    <= std_logic_vector( unsigned( dbRowWidthReg ) - unsigned( daWidthReg ) );
           
    
        case bltState is
        
            when bsIdle =>
        
                --ready, waiting for command
                bltReady    <= '1';    
        
                if bltRun = '1' then
                
                    bltReady    <= '0';    

                    case commandReg( 15 downto 8 ) is
                        
                        --fill rectangle ( input0Reg => da )
                        when x"01" =>
                        
                            --translate address to word based, omit high address bits
                            dmaWriteAddr    <= daAddressReg( 25 downto 1 );

                            --calc transfer size
                            counterXMax     <= daWidthReg;
                            counterX        <= daWidthReg;
        
                            counterY        <= std_logic_vector( unsigned( daHeightReg ) - 1 );
             
                            bltState        <= bsFill0;       
                        
                        --copy rectangle ( sa => da )
                        when x"02" =>

                            --translate addresses to word based, omit high address bits
                            dmaReadAddr     <= saAddressReg( 25 downto 1 );
                            dmaWriteAddr    <= daAddressReg( 25 downto 1 );

                            --calc transfer size
                            counterXMax     <= daWidthReg;
                            counterX        <= daWidthReg;
        
                            counterY        <= std_logic_vector( unsigned( daHeightReg ) - 1 );
             
                            bltState        <= bsCopy0;       

                        --copy rectangle with alpha ( sa alpha sb => da )
                        when x"03" =>
    
                            paAlpha         <= input0Reg( 4 downto 0 );
    
                            --translate addresses to word based, omit high address bits
                            --use data pointers for sources( multiple sources )
                            
                            dpSa            <= saAddressReg( 25 downto 1 );
                            dpSb            <= sbAddressReg( 25 downto 1 );

                            dmaWriteAddr    <= daAddressReg( 25 downto 1 );

                            --calc transfer size
                            counterXMax     <= daWidthReg;
                            counterX        <= daWidthReg;
        
                            counterY        <= std_logic_vector( unsigned( daHeightReg ) - 1 );
                            
                            bltState        <= bsAlphaCopy0; 

                        when others =>
                    
                    end case;
                
                end if;
              
            when bsFill0 =>
                
                dmaWriteData    <= input0Reg;
                
                if counterX /= x"0000" then
                
                    bltReturnState  <= bsFill1;
                    bltState        <= bsSubWrite0;
                    
                else
                
                    --end of row
                    if counterY /= x"0000" then
                    
                        counterY        <= std_logic_vector( unsigned( counterY ) - 1 );
                        counterX        <= counterXMax;
                        dmaWriteAddr    <= std_logic_vector( unsigned( dmaWriteAddr ) + unsigned( daColAdd ) );
                    
                    else
                    
                        bltState        <= bsIdle;
                    
                    end if;              
                
                end if;
                
            when bsFill1 =>
            
                counterX        <= std_logic_vector( unsigned( counterX ) - 1 );
                dmaWriteAddr    <= std_logic_vector( unsigned( dmaWriteAddr ) + 1 );
                
                bltState        <= bsFill0;
        
            when bsCopy0 =>
                                
                if counterX /= x"0000" then
                
                    bltReturnState  <= bsCopy1;
                    bltState        <= bsSubRead0;
                    
                else
                
                    --end of row
                    if counterY /= x"0000" then
                    
                        counterY        <= std_logic_vector( unsigned( counterY ) - 1 );
                        counterX        <= counterXMax;

                        dmaReadAddr     <= std_logic_vector( unsigned( dmaReadAddr ) + unsigned( saColAdd ) );
                        dmaWriteAddr    <= std_logic_vector( unsigned( dmaWriteAddr ) + unsigned( daColAdd ) );
                    
                    else
                    
                        bltState        <= bsIdle;
                    
                    end if;              
                
                end if;

            when bsCopy1 =>

                --copy mode
                case commandReg( 7 downto 0 ) is
                
                    --copy
                    when x"00" =>
                    
                        dmaWriteData    <= dmaReadData;
                
                        bltReturnState  <= bsCopy2;
                        bltState        <= bsSubWrite0;
                        
                    --mask copy
                    when x"01" =>
                               
                        --check if color matches mask
                        if dmaReadData( 15 downto 0 ) = input0Reg( 15 downto 0 ) then

                            --skip write
                            bltState        <= bsCopy2;
                            
                        else

                            --write
                            dmaWriteData    <= dmaReadData;
                            
                            bltReturnState  <= bsCopy2;
                            bltState        <= bsSubWrite0;
                            
                        end if;       
                                        
                    when others =>
                    
                        dmaWriteData    <= dmaReadData;
                        
                        bltReturnState  <= bsCopy2;
                        bltState        <= bsSubWrite0;
                                
                
                end case;
                

            when bsCopy2 =>
            
                counterX        <= std_logic_vector( unsigned( counterX ) - 1 );
                dmaReadAddr     <= std_logic_vector( unsigned( dmaReadAddr ) + 1 );
                dmaWriteAddr    <= std_logic_vector( unsigned( dmaWriteAddr ) + 1 );
                
                bltState        <= bsCopy0;
            
            
            when bsAlphaCopy0 =>
            
                if counterX /= x"0000" then
                
                    dmaReadAddr     <= dpSa;
                    bltReturnState  <= bsAlphaCopy1;
                    bltState        <= bsSubRead0;
                    
                else
                
                    --end of row
                    if counterY /= x"0000" then
                    
                        counterY        <= std_logic_vector( unsigned( counterY ) - 1 );
                        counterX        <= counterXMax;

                        dpSa            <= std_logic_vector( unsigned( dpSa ) + unsigned( saColAdd ) );
                        dpSb            <= std_logic_vector( unsigned( dpSb ) + unsigned( sbColAdd ) );
                        dmaWriteAddr    <= std_logic_vector( unsigned( dmaWriteAddr ) + unsigned( daColAdd ) );
                    
                    else
                    
                        bltState        <= bsIdle;
                    
                    end if;              
                
                end if;
           
            when bsAlphaCopy1 =>

                paColorInA      <= dmaReadData( 15 downto 0 );
                dmaReadAddr     <= dpSb;
   
                --alpha copy mode
                case commandReg( 7 downto 0 ) is
                
                    --alpha copy
                    when x"00" =>
                                       
                        bltReturnState  <= bsAlphaCopy2;
                        bltState        <= bsSubRead0;
                                
                    --alpha mask copy
                    when x"01" =>
                        
                        --check if color matches mask
                        if dmaReadData( 15 downto 0 ) = input1Reg( 15 downto 0 ) then

                            --skip read and write
                            bltState        <= bsAlphaCopy5;
                            
                        else

                            --continue                            
                            bltReturnState  <= bsAlphaCopy2;
                            bltState        <= bsSubRead0;
                                
                        end if;       
                                        
                    when others =>
                    
                        bltReturnState  <= bsAlphaCopy2;
                        bltState        <= bsSubRead0;
                        
                end case;          
                
          
            when bsAlphaCopy2 =>

                paColorInB      <= dmaReadData( 15 downto 0 );
                bltState        <= bsAlphaCopy3;

            when bsAlphaCopy3 =>
                bltState        <= bsAlphaCopy4;

            when bsAlphaCopy4 =>

                dmaWriteData    <= x"0000" & paColorOut;
                
                bltReturnState  <= bsAlphaCopy5;
                bltState        <= bsSubWrite0;
                
            when bsAlphaCopy5 =>

                counterX        <= std_logic_vector( unsigned( counterX ) - 1 );
                dpSa            <= std_logic_vector( unsigned( dpSa ) + 1 );
                dpSb            <= std_logic_vector( unsigned( dpSb ) + 1 );
                dmaWriteAddr    <= std_logic_vector( unsigned( dmaWriteAddr ) + 1 );
                
                bltState        <= bsAlphaCopy0;
               
            
            -- subroutines
            
            -- read subroutine
            when bsSubRead0 =>
            
                if bltDmaReady = '1' then
                
                    bltA            <= dmaReadAddr;
                    bltWr           <= '0';
                    bltDmaRequest   <= '1';
    
                    bltState        <= bsSubRead1;
                    
                end if;
                        
            when bsSubRead1 =>
            
                if bltDmaReady = '0' then
                
                    bltDmaRequest   <= '0';
                    bltState        <= bsSubRead2;
                    
                end if;

            when bsSubRead2 =>
            
                if bltDmaReady = '1' then
                    
                    dmaReadData <= bltDin;
                    
                    bltState    <= bltReturnState;
                    
                end if;
            
            -- write subroutine       
            when bsSubWrite0 =>

                if bltDmaReady = '1' then
                
                    bltA            <= dmaWriteAddr;
                    bltDOut         <= dmaWriteData;

                    bltWr           <= '1';
                    bltDmaRequest   <= '1';
        
                    bltState        <= bsSubWrite1;                     
            
                end if;
                
            when bsSubWrite1 =>
            
                if bltDmaReady = '0' then
                
                    bltDmaRequest   <= '0';
                    bltState        <= bsSubWrite2;
                    
                end if;
                
            when bsSubWrite2 =>
            
                if bltDmaReady = '1' then
                
                    bltState    <= bltReturnState;
                    
                end if;
                               
            when others =>
                
                bltState    <= bsIdle;
                        
       end case; --bltState is
        
    end if; -- reset = '1', rising_edge( clock )   

end process;

-- place pixel alpha

pixelAlphaInst: pixelAlpha
port map(

    reset       => reset,
    clock       => clock,
	 	 
    colorInA    => paColorInA,
    colorInB    => paColorInB,
    alpha       => paAlpha,
    colorOut    => paColorOut

);
    
end Behavioral;
