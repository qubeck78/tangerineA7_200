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

--pixel alpha channel calculation
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

--bounding box calculation
component boundingBox is
port( 
   --reset
    reset:                          in  std_logic;
    clock:                          in  std_logic;
    
    bbXMinReg:                      in  std_logic_vector( 15 downto 0 );
    bbXMaxReg:                      in  std_logic_vector( 15 downto 0 );
    bbYMinReg:                      in  std_logic_vector( 15 downto 0 );
    bbYMaxReg:                      in  std_logic_vector( 15 downto 0 );

    aXReg:                          in  std_logic_vector( 15 downto 0 );
    aYReg:                          in  std_logic_vector( 15 downto 0 );

    bXReg:                          in  std_logic_vector( 15 downto 0 );
    bYReg:                          in  std_logic_vector( 15 downto 0 );

    cXReg:                          in  std_logic_vector( 15 downto 0 );
    cYReg:                          in  std_logic_vector( 15 downto 0 );
    
    bbXMinOut:                      out std_logic_vector( 15 downto 0 );
    bbXMaxOut:                      out std_logic_vector( 15 downto 0 );
    bbYMinOut:                      out std_logic_vector( 15 downto 0 );
    bbYMaxOut:                      out std_logic_vector( 15 downto 0 );
    bbWidthOut:                     out std_logic_vector( 15 downto 0 );
    bbHeightOut:                    out std_logic_vector( 15 downto 0 )

);
end component;

--triangle edge calculation for gouraud
component gouraudEdge is
port(
   --reset
    reset:                          in  std_logic;
    clock:                          in  std_logic;
   
    e1_x:                           in std_logic_vector( 15 downto 0 );
    e1_y:                           in std_logic_vector( 15 downto 0 );
    
    e2_x:                           in std_logic_vector( 15 downto 0 );
    e2_y:                           in std_logic_vector( 15 downto 0 );

    p_x:                            in std_logic_vector( 15 downto 0 );
    p_y:                            in std_logic_vector( 15 downto 0 );

    
    edge:                           out std_logic_vector( 31 downto 0 )
);
end component;

-- 0xffffffff / triangle area calculation
component triangleAreaDivisor is
port(

    reset:              in  std_logic;
    clock:              in  std_logic;
    
    trigger:            in  std_logic;
    triangleArea:       in  std_logic_vector( 31 downto 0 );

    triangleAreaInv:    out std_logic_vector( 31 downto 0 );
    ready:              out std_logic

);
end component;

--weight calculation
component gouraudWeight is
port(
   --reset
    reset:                          in  std_logic;
    clock:                          in  std_logic;
    
    edge:                           in std_logic_vector( 31 downto 0 );
    areaInv:                        in std_logic_vector( 31 downto 0 );
    
    weight:                         out std_logic_vector( 15 downto 0 )

);
end component;

--gouraud iterator
component gouraudIterator is
port(
   --reset
    reset:                          in  std_logic;
    clock:                          in  std_logic;
       
    weightCB:                       in  std_logic_vector( 15 downto 0 );
    weightAC:                       in  std_logic_vector( 15 downto 0 );
    weightBA:                       in  std_logic_vector( 15 downto 0 );

    valA:                           in  std_logic_vector( 7 downto 0 );
    valB:                           in  std_logic_vector( 7 downto 0 );
    valC:                           in  std_logic_vector( 7 downto 0 );

    valOut:                         out std_logic_vector( 7 downto 0 )
);
end component;

component gouraudIterator16 is
port(
   --reset
    reset:                          in  std_logic;
    clock:                          in  std_logic;
       
    weightCB:                       in  std_logic_vector( 15 downto 0 );
    weightAC:                       in  std_logic_vector( 15 downto 0 );
    weightBA:                       in  std_logic_vector( 15 downto 0 );

    valA:                           in  std_logic_vector( 15 downto 0 );
    valB:                           in  std_logic_vector( 15 downto 0 );
    valC:                           in  std_logic_vector( 15 downto 0 );

    valOut:                         out std_logic_vector( 15 downto 0 )
);
end component;

--texture shader ( light )
component textureShader is
port(
   --reset
    reset:                          in  std_logic;
    clock:                          in  std_logic;
       
    colorIn:                        in  std_logic_vector( 15 downto 0 );
    lightIn:                        in  std_logic_vector( 4 downto 0 );
    colorOut:                       out std_logic_vector( 15 downto 0 )
);
end component;

--signals

--registers signals

type regState_T is ( rsWaitForRegAccess, rsWaitForBusCycleEnd );
signal  regState:       regState_T;

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
                        bsScaleCopy0, bsScaleCopy1, bsScaleCopy2, bsScaleCopy3, bsScaleCopy4, bsScaleCopy5,
                        bsTriangle0, bsTriangleGouraud, bsTriangleZBuffer0, bsTriangleZBuffer1,
                        bsTriangleTextured0, bsTriangleTextured1, bsTriangleTextured2, 
                        bsSubRead0, bsSubRead1, bsSubRead2, bsSubWrite0, bsSubWrite1, bsSubWrite2, bsSubWrite3 );

signal  bltState:       bltState_t;
signal  bltReturnState: bltState_t;

--blitter command trigger

signal  bltRun:         std_logic;
signal  bltReady:       std_logic;

--subRead
signal  dmaReadAddr:    std_logic_vector( 24 downto 0 );
signal  dmaReadData:    std_logic_vector( 31 downto 0 );

--subWrite
signal  dmaWriteAddr:   std_logic_vector( 24 downto 0 );
signal  dmaWriteData:   std_logic_vector( 31 downto 0 );


--counters
signal  counterX:       std_logic_vector( 15 downto 0 );
signal  counterXMax:    std_logic_vector( 15 downto 0 );
signal  counterY:       std_logic_vector( 15 downto 0 );

--data pointers ( for multiple source / destination modes )
signal  dpSa:           std_logic_vector( 24 downto 0 );
signal  dpSb:           std_logic_vector( 24 downto 0 );
signal  dpSc:           std_logic_vector( 24 downto 0 );
signal  dpDa:           std_logic_vector( 24 downto 0 );
signal  dpDb:           std_logic_vector( 24 downto 0 );


--pixel alpha
signal  paColorInA:     std_logic_vector( 15 downto 0 );
signal  paColorInB:     std_logic_vector( 15 downto 0 );
signal  paAlpha:        std_logic_vector( 4 downto 0 );
signal  paColorOut:     std_logic_vector( 15 downto 0 );


--scaler
signal  scSx:           std_logic_vector( 31 downto 0 );
signal  scSy:           std_logic_vector( 31 downto 0 );

--3d
--bounding box
signal  bbXMinReg:      std_logic_vector( 15 downto 0 );
signal  bbXMaxReg:      std_logic_vector( 15 downto 0 );
signal  bbYMinReg:      std_logic_vector( 15 downto 0 );
signal  bbYMaxReg:      std_logic_vector( 15 downto 0 );

--triangle vertices
signal  aXReg:          std_logic_vector( 15 downto 0 );
signal  aYReg:          std_logic_vector( 15 downto 0 );
signal  aZReg:          std_logic_vector( 15 downto 0 );
signal  aIt0Reg:        std_logic_vector( 7 downto 0 );
signal  aIt1Reg:        std_logic_vector( 7 downto 0 );
signal  aIt2Reg:        std_logic_vector( 7 downto 0 );

signal  bXReg:          std_logic_vector( 15 downto 0 );
signal  bYReg:          std_logic_vector( 15 downto 0 );
signal  bZReg:          std_logic_vector( 15 downto 0 );
signal  bIt0Reg:        std_logic_vector( 7 downto 0 );
signal  bIt1Reg:        std_logic_vector( 7 downto 0 );
signal  bIt2Reg:        std_logic_vector( 7 downto 0 );

signal  cXReg:          std_logic_vector( 15 downto 0 );
signal  cYReg:          std_logic_vector( 15 downto 0 );
signal  cZReg:          std_logic_vector( 15 downto 0 );
signal  cIt0Reg:        std_logic_vector( 7 downto 0 );
signal  cIt1Reg:        std_logic_vector( 7 downto 0 );
signal  cIt2Reg:        std_logic_vector( 7 downto 0 );

--triangle bounding box ( calculated )
signal  triangleBBXMin:     std_logic_vector( 15 downto 0 );
signal  triangleBBXMax:     std_logic_vector( 15 downto 0 );
signal  triangleBBYMin:     std_logic_vector( 15 downto 0 );
signal  triangleBBYMax:     std_logic_vector( 15 downto 0 );
signal  triangleBBWidth:    std_logic_vector( 15 downto 0 );
signal  triangleBBHeight:    std_logic_vector( 15 downto 0 );

--triangle area
signal  triangleArea:   std_logic_vector( 31 downto 0 );

--0xffffffff / triangleArea
signal triangleAreaInv:         std_logic_vector( 31 downto 0 );
signal triangleAreaDivTrigger:  std_logic;
signal triangleAreaInvValid:    std_logic;

--counter for determining triangleArea/triangleAreaInv valid result time ( max 63 cycles )
signal triangleAreaCalcCnt: std_logic_vector( 5 downto 0 );

--triangle pixel coordinates
signal  triangleCX:     std_logic_vector( 15 downto 0 );
signal  triangleCY:     std_logic_vector( 15 downto 0 );

--triangle cx/cy to edges
signal  triangleEBA:        std_logic_vector( 31 downto 0 );
signal  triangleECB:        std_logic_vector( 31 downto 0 );
signal  triangleEAC:        std_logic_vector( 31 downto 0 );
signal  triangleECounter:   std_logic_vector( 3 downto 0 );

--triangle weights for current CX/CY
signal  triangleWBA:        std_logic_vector( 15 downto 0 );
signal  triangleWCB:        std_logic_vector( 15 downto 0 );
signal  triangleWAC:        std_logic_vector( 15 downto 0 );

--triangle iterator outputs

signal  triangleIt0Out:     std_logic_vector( 7 downto 0 );
signal  triangleIt1Out:     std_logic_vector( 7 downto 0 );
signal  triangleIt2Out:     std_logic_vector( 7 downto 0 );

signal  triangleIt3Out:     std_logic_vector( 15 downto 0 );

signal  triangleITCounter:  std_logic_vector( 3 downto 0 );

--texture shader
signal tsColorOut:          std_logic_vector( 15 downto 0 );

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
        
        bbXMinReg       <= ( others => '0' );
        bbYMinReg       <= ( others => '0' );
        
        --319
        bbXMaxReg       <= x"013f";
        
        --239
        bbYMaxReg       <= x"00ef";

        aXReg           <= ( others => '0' );
        aYReg           <= ( others => '0' );
        aZReg           <= ( others => '0' );
        aIt0Reg         <= ( others => '0' );
        aIt1Reg         <= ( others => '0' );
        aIt2Reg         <= ( others => '0' );

        bXReg           <= ( others => '0' );
        bYReg           <= ( others => '0' );
        bZReg           <= ( others => '0' );
        bIt0Reg         <= ( others => '0' );
        bIt1Reg         <= ( others => '0' );
        bIt2Reg         <= ( others => '0' );

        cXReg           <= ( others => '0' );
        cYReg           <= ( others => '0' );
        cZReg           <= ( others => '0' );
        cIt0Reg         <= ( others => '0' );
        cIt1Reg         <= ( others => '0' );
        cIt2Reg         <= ( others => '0' );

        
        --clear command trigger 
        bltRun                  <= '0';
        
        --clear triangle area calc clock
        triangleAreaCalcCnt     <= ( others => '0' );
        
        --clear 0xffffffff/triangleArea div trigger
        triangleAreaDivTrigger  <= '0';
        
    elsif rising_edge( clock ) then
      
        --clear command trigger
        
        bltRun          <= '0';

        --decrease triangle area calc time clock
        
        if triangleAreaCalcCnt /= "000000"  then
        
            triangleAreaCalcCnt <= std_logic_vector( unsigned( triangleAreaCalcCnt ) - 1 );
            
        end if;

        --trigger divisor when area is calculated
        --37 - 4 = 33
        if triangleAreaCalcCnt = "100001" then
        
            triangleAreaDivTrigger <= '1';
            
        else
        
            triangleAreaDivTrigger <= '0';
            
        end if;
            
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
                 
                            dout    <= x"20241225";
                    
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

                       --0x54 rw bbXMinReg
                       when x"15" =>
                       
                            ready   <= '1';
                            dout    <= x"0000" & bbXMinReg;
                            
                            if wr = '1' then
                            
                                bbXMinReg   <= din( 15 downto 0 );
                                
                            end if;

                       --0x58 rw bbXMaxReg
                       when x"16" =>
                       
                            ready   <= '1';
                            dout    <= x"0000" & bbXMaxReg;
                            
                            if wr = '1' then
                            
                                bbXMaxReg   <= din( 15 downto 0 );
                                
                            end if;
                            
                       --0x5c rw bbYMinReg
                       when x"17" =>
                       
                            ready   <= '1';
                            dout    <= x"0000" & bbYMinReg;
                            
                            if wr = '1' then
                            
                                bbYMinReg   <= din( 15 downto 0 );
                                
                            end if;

                       --0x60 rw bbYMaxReg
                       when x"18" =>
                       
                            ready   <= '1';
                            dout    <= x"0000" & bbYMaxReg;
                            
                            if wr = '1' then
                            
                                bbYMaxReg   <= din( 15 downto 0 );
                                
                            end if;

                       --0x64 rw aXReg
                       when x"19" =>
                       
                            ready   <= '1';
                            dout    <= x"0000" & aXReg;
                            
                            if wr = '1' then
                            
                                aXReg   <= din( 15 downto 0 );
                                
                            end if;
                       
                       --0x68 rw aYReg
                       when x"1a" =>
                       
                            ready   <= '1';
                            dout    <= x"0000" & aYReg;
                            
                            if wr = '1' then
                            
                                aYReg   <= din( 15 downto 0 );
                                
                            end if;

                       --0x6c rw aZReg
                       when x"1b" =>
                       
                            ready   <= '1';
                            dout    <= x"0000" & aZReg;
                            
                            if wr = '1' then
                            
                                aZReg   <= din( 15 downto 0 );
                                
                            end if;

                       --0x70 rw aIt0
                       when x"1c" =>
                       
                            ready   <= '1';
                            dout    <= x"000000" & aIt0Reg;
                            
                            if wr = '1' then
                            
                                aIt0Reg   <= din( 7 downto 0 );
                                
                            end if;

                       --0x74 rw aIt1
                       when x"1d" =>
                       
                            ready   <= '1';
                            dout    <= x"000000" & aIt1Reg;
                            
                            if wr = '1' then
                            
                                aIt1Reg   <= din( 7 downto 0 );
                                
                            end if;

                       --0x78 rw aIt2
                       when x"1e" =>
                       
                            ready   <= '1';
                            dout    <= x"000000" & aIt2Reg;
                            
                            if wr = '1' then
                            
                                aIt2Reg   <= din( 7 downto 0 );
                                
                            end if;

                       --0x7c rw bXReg
                       when x"1f" =>
                       
                            ready   <= '1';
                            dout    <= x"0000" & bXReg;
                            
                            if wr = '1' then
                            
                                bXReg   <= din( 15 downto 0 );
                                
                            end if;
                       
                       --0x80 rw bYReg
                       when x"20" =>
                       
                            ready   <= '1';
                            dout    <= x"0000" & bYReg;
                            
                            if wr = '1' then
                            
                                bYReg   <= din( 15 downto 0 );
                                
                            end if;

                       --0x84 rw bZReg
                       when x"21" =>
                       
                            ready   <= '1';
                            dout    <= x"0000" & bZReg;
                            
                            if wr = '1' then
                            
                                bZReg   <= din( 15 downto 0 );
                                
                            end if;

                       --0x88 rw bIt0
                       when x"22" =>
                       
                            ready   <= '1';
                            dout    <= x"000000" & bIt0Reg;
                            
                            if wr = '1' then
                            
                                bIt0Reg   <= din( 7 downto 0 );
                                
                            end if;

                       --0x8c rw bIt1
                       when x"23" =>
                       
                            ready   <= '1';
                            dout    <= x"000000" & bIt1Reg;
                            
                            if wr = '1' then
                            
                                bIt1Reg   <= din( 7 downto 0 );
                                
                            end if;

                       --0x90 rw bIt2
                       when x"24" =>
                       
                            ready   <= '1';
                            dout    <= x"000000" & bIt2Reg;
                            
                            if wr = '1' then
                            
                                bIt2Reg   <= din( 7 downto 0 );
                                
                            end if;

                       --0x94 rw cXReg
                       when x"25" =>
                       
                            ready   <= '1';
                            dout    <= x"0000" & cXReg;
                            
                            if wr = '1' then
                            
                                cXReg   <= din( 15 downto 0 );
                                
                            end if;
                       
                       --0x98 rw cYReg
                       when x"26" =>
                       
                            ready   <= '1';
                            dout    <= x"0000" & cYReg;
                            
                            if wr = '1' then
                            
                                cYReg   <= din( 15 downto 0 );
                                
                            end if;

                       --0x9c rw cZReg
                       when x"27" =>
                       
                            ready   <= '1';
                            dout    <= x"0000" & cZReg;
                            
                            if wr = '1' then
                            
                                cZReg   <= din( 15 downto 0 );
                                
                                --set triangle area calc counter
                                --edge      - 3  clocks
                                --divisor   - 34 clocks (tbd)
                                --total     - 37 clocks to triangleAreaInv to be valid
                                
                                triangleAreaCalcCnt <= "100101";
                                
                            end if;

                       --0xa0 rw cIt0
                       when x"28" =>
                       
                            ready   <= '1';
                            dout    <= x"000000" & cIt0Reg;
                            
                            if wr = '1' then
                            
                                cIt0Reg   <= din( 7 downto 0 );
                                
                            end if;

                       --0xa4 rw cIt1
                       when x"29" =>
                       
                            ready   <= '1';
                            dout    <= x"000000" & cIt1Reg;
                            
                            if wr = '1' then
                            
                                cIt1Reg   <= din( 7 downto 0 );
                                
                            end if;
 
                       --0xa8 rw cIt2
                       when x"2a" =>
                       
                            ready   <= '1';
                            dout    <= x"000000" & cIt2Reg;
                            
                            if wr = '1' then
                            
                                cIt2Reg   <= din( 7 downto 0 );
                                
                            end if;

                       --0xac r- triangleArea
                       when x"2b" =>

                            ready   <= '1';
                            dout    <= triangleArea;
     
                       --0xb0 r- triangleAreaInv
                       when x"2c" =>

                            ready   <= '1';
                            dout    <= triangleAreaInv;
                                              
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

variable scRowAddressVar: unsigned( 31 downto 0 );

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
        
        --triangle edge counter
        if triangleECounter /= x"0" then
        
            triangleECounter <= std_logic_vector( unsigned( triangleECounter ) - 1 );
            
        end if;   

        --iterator value counter
        if triangleITCounter /= x"0" then
        
            triangleITCounter   <= std_logic_vector( unsigned( triangleITCounter ) - 1 );

        end if;
    
        case bltState is
        
            when bsIdle =>
        
                --ready, waiting for command
                bltReady    <= '1';    
        
                if bltRun = '1' then
                
                    bltReady    <= '0';    

                    case commandReg( 15 downto 8 ) is
                        
                        --fill rectangle ( input0Reg => da )
                        when x"01" =>
                        
                            --16bit transfer
                            bltDmaWordSize  <= '0';

                            --translate address to word based, omit high address bits
                            dpDa           <= daAddressReg( 25 downto 1 );

                            --calc transfer size
                            counterXMax     <= daWidthReg;
                            counterX        <= daWidthReg;
        
                            counterY        <= std_logic_vector( unsigned( daHeightReg ) - 1 );
             
                            bltState        <= bsFill0;       
                        
                        --copy rectangle ( sa => da )
                        when x"02" =>

                            --16bit transfer
                            bltDmaWordSize  <= '0';

                            --translate addresses to word based, omit high address bits
                            dpSa            <= saAddressReg( 25 downto 1 );
                            dpDa            <= daAddressReg( 25 downto 1 );

                            --calc transfer size
                            counterXMax     <= daWidthReg;
                            counterX        <= daWidthReg;
        
                            counterY        <= std_logic_vector( unsigned( daHeightReg ) - 1 );
             
                            bltState        <= bsCopy0;       

                        --copy rectangle with alpha ( sa alpha sb => da )
                        when x"03" =>
    
                            --16bit transfer
                            bltDmaWordSize  <= '0';

                            paAlpha         <= input0Reg( 4 downto 0 );
    
                            --translate addresses to word based, omit high address bits
                            --use data pointers for sources( multiple sources )
                            
                            dpSa            <= saAddressReg( 25 downto 1 );
                            dpSb            <= sbAddressReg( 25 downto 1 );

                            dpDa            <= daAddressReg( 25 downto 1 );

                            --calc transfer size
                            counterXMax     <= daWidthReg;
                            counterX        <= daWidthReg;
        
                            counterY        <= std_logic_vector( unsigned( daHeightReg ) - 1 );
                            
                            bltState        <= bsAlphaCopy0; 

                        --scale copy rectangle ( sa scale => da )
                        --input0Reg - sourceDeltaX
                        --input1Reg - sourceDeltaY
                        
                        when x"04" =>

                            --16bit transfer
                            bltDmaWordSize  <= '0';

                            --translate addresses to word based, omit high address bits
                            dmaReadAddr     <= saAddressReg( 25 downto 1 );
                            dpDa            <= daAddressReg( 25 downto 1 );

                            --calc transfer size
                            counterXMax     <= daWidthReg;
                            counterX        <= daWidthReg;
        
                            counterY        <= std_logic_vector( unsigned( daHeightReg ) - 1 );

                            --row address
                            dpSa            <= saAddressReg( 25 downto 1 );
                            scSx            <= ( others => '0' );
                            scSy            <= input1Reg;   --delta y 
                            
                            bltState        <= bsScaleCopy0;
                            
                        --draw triangle
                        when x"05" =>
                                                    
                            --16bit transfer
                            bltDmaWordSize  <= '0';

                            --translate addresses to word based, omit high address bits
                            --texture
                            dpSa                <= saAddressReg( 25 downto 1 );
                            
                            --framebuffer
                            dpDa                <= daAddressReg( 25 downto 1 );

                            --z-buffer
                            dpDb                <= dbAddressReg( 25 downto 1 );

                            triangleCX          <= triangleBBXMin;
                            triangleCY          <= triangleBBYMin;
                            
                            --CX/CY to edge valid counter
                            triangleECounter    <= x"4";
                            
                            counterX            <= triangleBBWidth;
                            counterY            <= triangleBBHeight;
                            
                            --triangleAddrOffset  <= triangleBBYMin & triangleBBXMin( 8 downto 0 );
                            
                            if triangleBBWidth = x"0000" or triangleBBHeight = x"0000" then
                                
                                bltState    <= bsIdle;
                                
                            else
                            
                                bltState            <= bsTriangle0;
                                
                            end if;
                            
                        --fill rectangle 32 bit ( input0Reg => da )
                        when x"11" =>
                        
                            --32bit transfer
                            bltDmaWordSize  <= '1';

                            --translate address to word based, omit high address bits
                            dpDa           <= '0' & daAddressReg( 25 downto 2 );

                            --calc transfer size
                            counterXMax     <= daWidthReg;
                            counterX        <= daWidthReg;
        
                            counterY        <= std_logic_vector( unsigned( daHeightReg ) - 1 );
             
                            bltState        <= bsFill0;       

                        --copy rectangle 32 bit ( sa => da )
                        when x"12" =>

                            --32bit transfer
                            bltDmaWordSize  <= '1';

                            --translate addresses to word based, omit high address bits
                            dpSa            <= '0' & saAddressReg( 25 downto 2 );
                            dpDa            <= '0' & daAddressReg( 25 downto 2 );

                            --calc transfer size
                            counterXMax     <= daWidthReg;
                            counterX        <= daWidthReg;
        
                            counterY        <= std_logic_vector( unsigned( daHeightReg ) - 1 );
             
                            bltState        <= bsCopy0;       

                        when others =>
                    
                    end case;
                
                end if;
              
            when bsFill0 =>
                
                
                if counterX /= x"0000" then

                    --early write
                    bltA            <= dpDa;
                    bltDOut         <= input0Reg;

                    bltWr           <= '1';
                    bltDmaRequest   <= '1';

                    bltReturnState  <= bsFill1;
                    bltState        <= bsSubWrite1;
            
                else
                
                    --end of row
                    if counterY /= x"0000" then
                    
                        counterY    <= std_logic_vector( unsigned( counterY ) - 1 );
                        counterX    <= counterXMax;
                        dpDa        <= std_logic_vector( unsigned( dpDa ) + unsigned( daColAdd ) );
                    
                    else
                    
                        bltState        <= bsIdle;
                    
                    end if;              
                
                end if;
                
            when bsFill1 =>
            
                counterX    <= std_logic_vector( unsigned( counterX ) - 1 );
                dpDa        <= std_logic_vector( unsigned( dpDa ) + 1 );
                
                bltState    <= bsFill0;
        
            when bsCopy0 =>
                                
                if counterX /= x"0000" then
                
                    bltReturnState  <= bsCopy1;

                    --early read
                    bltA            <= dpSa;
                    bltWr           <= '0';
                    bltDmaRequest   <= '1';
                    bltState        <= bsSubRead1;
                    
                    
                else
                
                    --end of row
                    if counterY /= x"0000" then
                    
                        counterY        <= std_logic_vector( unsigned( counterY ) - 1 );
                        counterX        <= counterXMax;

                        dpSa            <= std_logic_vector( unsigned( dpSa ) + unsigned( saColAdd ) );
                        dpDa            <= std_logic_vector( unsigned( dpDa ) + unsigned( daColAdd ) );
                    
                    else
                    
                        bltState        <= bsIdle;
                    
                    end if;              
                
                end if;

            when bsCopy1 =>

                --copy mode
                case commandReg( 7 downto 0 ) is
                
                    --copy
                    when x"00" =>
                    

                        --early write
                        bltA            <= dpDa;
                        bltDOut         <= dmaReadData;

                        bltWr           <= '1';
                        bltDmaRequest   <= '1';

                        bltReturnState  <= bsCopy2;
                        bltState        <= bsSubWrite1;
                        
                    --mask copy
                    when x"01" =>
                               
                        --check if color matches mask
                        if dmaReadData( 15 downto 0 ) = input0Reg( 15 downto 0 ) then

                            --skip write
                            bltState        <= bsCopy2;
                            
                        else

                            --early write
                            bltA            <= dpDa;
                            bltDOut         <= dmaReadData;

                            bltWr           <= '1';
                            bltDmaRequest   <= '1';
    
                            bltReturnState  <= bsCopy2;
                            bltState        <= bsSubWrite1;
                                                        
                        end if;       
                                        
                    when others =>

                        --early write
                        bltA            <= dpDa;
                        bltDOut         <= dmaReadData;

                        bltWr           <= '1';
                        bltDmaRequest   <= '1';

                        bltReturnState  <= bsCopy2;
                        bltState        <= bsSubWrite1;
                                
                
                end case;
                

            when bsCopy2 =>
            
                counterX        <= std_logic_vector( unsigned( counterX ) - 1 );
                dpSa            <= std_logic_vector( unsigned( dpSa ) + 1 );
                dpDa            <= std_logic_vector( unsigned( dpDa ) + 1 );
                
                bltState        <= bsCopy0;


            when bsScaleCopy0 =>
                                
                if counterX /= x"0000" then
                
                    --scSc += deltaX
                    scSx            <= std_logic_vector( unsigned( scSx ) + unsigned( input0Reg ) );
                
                    bltReturnState  <= bsScaleCopy4;
                    bltState        <= bsSubRead0;
                    
                else
                
                    --end of row
                    if counterY /= x"0000" then
                    
                        counterY        <= std_logic_vector( unsigned( counterY ) - 1 );
                        counterX        <= counterXMax;

                        scRowAddressVar := unsigned( saAddressReg( 25 downto 1 ) ) + ( unsigned( saWidthReg ) * unsigned( scSy( 31 downto 16 ) ) ) ;
                        dpSa            <= std_logic_vector( scRowAddressVar( 24 downto 0 ) );
                        
                        scSx            <= ( others => '0' );
                        
                        
                        dpDa            <= std_logic_vector( unsigned( dpDa ) + unsigned( daColAdd ) );
                    
                        bltState        <= bsScaleCopy1;    --waitstates
                    else
                    
                        bltState        <= bsIdle;
                    
                    end if;              
                
                end if;

            when bsScaleCopy1 =>

                bltState    <= bsScaleCopy2;
                
            when bsScaleCopy2 =>
            
                bltState    <= bsScaleCopy3;

            when bsScaleCopy3 =>
            
                --scSy += deltaY
                scSy        <= std_logic_vector( unsigned( scSy ) + unsigned( input1Reg ) );
                
                dmaReadAddr <=  dpSa;
                
                --read data
                bltState    <= bsScaleCopy0;
                
             when bsScaleCopy4 =>
             
                --scale copy mode
                case commandReg( 7 downto 0 ) is
                    
                    
                    --scale copy
                    when x"00" =>
                    

                        --early write
                        bltA            <= dpDa;
                        bltDOut         <= dmaReadData;

                        bltWr           <= '1';
                        bltDmaRequest   <= '1';

                        bltReturnState  <= bsScaleCopy5;
                        bltState        <= bsSubWrite1;
                                            
                    --masked scale copy
                    when x"01" =>
                               
                        --check if color matches mask
                        if dmaReadData( 15 downto 0 ) = input2Reg( 15 downto 0 ) then

                            --skip write
                            bltState        <= bsScaleCopy5;
                            
                        else

                            --early write
                            
                            bltA            <= dpDa;
                            bltDOut         <= dmaReadData;
    
                            bltWr           <= '1';
                            bltDmaRequest   <= '1';
    
                            bltReturnState  <= bsScaleCopy5;
                            bltState        <= bsSubWrite1;
                                
                        end if;       
                    
                    when others =>

                        --early write
                            
                        bltA            <= dpDa;
                        bltDOut         <= dmaReadData;
    
                        bltWr           <= '1';
                        bltDmaRequest   <= '1';
    
                        bltReturnState  <= bsScaleCopy5;
                        bltState        <= bsSubWrite1;                    
                
                end case;
                                      
            when bsScaleCopy5 =>
            
                dmaReadAddr     <= std_logic_vector( unsigned( dpSa ) + unsigned( scSx( 31 downto 16 ) ) );
                dpDa            <= std_logic_vector( unsigned( dpDa ) + 1 );
                counterX        <= std_logic_vector( unsigned( counterX ) - 1 );
                
                bltState        <= bsScaleCopy0;            
            
            when bsAlphaCopy0 =>
            
                if counterX /= x"0000" then
                
                    --early read
                    bltA            <= dpSa;
                    bltWr           <= '0';
                    bltDmaRequest   <= '1';
                    bltState        <= bsSubRead1;
                    bltReturnState  <= bsAlphaCopy1;
                    
                else
                
                    --end of row
                    if counterY /= x"0000" then
                    
                        counterY        <= std_logic_vector( unsigned( counterY ) - 1 );
                        counterX        <= counterXMax;

                        dpSa            <= std_logic_vector( unsigned( dpSa ) + unsigned( saColAdd ) );
                        dpSb            <= std_logic_vector( unsigned( dpSb ) + unsigned( sbColAdd ) );
                        dpDa            <= std_logic_vector( unsigned( dpDa ) + unsigned( daColAdd ) );
                    
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
                        
                        --early read
                        bltA            <= dpSb;
                        bltWr           <= '0';
                        bltDmaRequest   <= '1';
                        bltState        <= bsSubRead1;
                        bltReturnState  <= bsAlphaCopy2;
                                    
                    --alpha mask copy
                    when x"01" =>
                        
                        --check if color matches mask
                        if dmaReadData( 15 downto 0 ) = input1Reg( 15 downto 0 ) then

                            --skip read and write
                            bltState        <= bsAlphaCopy5;
                            
                        else

                            --continue with reading second source                            
                                                        
                            --early read
                            bltA            <= dpSb;
                            bltWr           <= '0';
                            bltDmaRequest   <= '1';
                            bltState        <= bsSubRead1;
                            bltReturnState  <= bsAlphaCopy2;
                                        
                        end if;       
                                        
                    when others =>

                        --early read
                        bltA            <= dpSb;
                        bltWr           <= '0';
                        bltDmaRequest   <= '1';
                        bltState        <= bsSubRead1;
                        bltReturnState  <= bsAlphaCopy2;
                    
                end case;          
                
          
            when bsAlphaCopy2 =>

                paColorInB      <= dmaReadData( 15 downto 0 );
                bltState        <= bsAlphaCopy3;

            when bsAlphaCopy3 =>
                bltState        <= bsAlphaCopy4;

            when bsAlphaCopy4 =>

                --early write
                bltA            <= dpDa;
                bltDOut         <= x"0000" & paColorOut;

                bltWr           <= '1';
                bltDmaRequest   <= '1';

                bltReturnState  <= bsAlphaCopy5;
                bltState        <= bsSubWrite1;

                
            when bsAlphaCopy5 =>

                counterX        <= std_logic_vector( unsigned( counterX ) - 1 );
                dpSa            <= std_logic_vector( unsigned( dpSa ) + 1 );
                dpSb            <= std_logic_vector( unsigned( dpSb ) + 1 );
                dpDa            <= std_logic_vector( unsigned( dpDa ) + 1 );
                
                bltState        <= bsAlphaCopy0;
               
            
            -- triangle
            
            when bsTriangle0 =>
            
                --end if line
                if counterX = x"0000" then
                                  
                    counterX    <= triangleBBWidth;
                    
                    triangleCX  <= triangleBBXMin;
                    triangleCY  <= std_logic_vector( unsigned( triangleCY ) + 1 );
                    
                    --CX/CY to edge valid counter
                    triangleECounter    <= x"4";                    

                    --CX/CY to iterator value counter
                    triangleITCounter   <= x"7";

                    if counterY = x"0000" then
                    
                        --triangle drawn                        
                        bltState    <= bsIdle;                
                
                    else
                    
                        counterY    <= std_logic_vector( unsigned( counterY ) - 1 );
                        
                    end if;
                                    
                else
                
                    if triangleECounter = x"0" then
                    
                        --edge ready
   
                        --decrease x counter                 
                        counterX    <= std_logic_vector( unsigned( counterX ) - 1 );
                        
                        if triangleEBA( 31 ) = '0' and triangleECB( 31 ) = '0' and triangleEAC( 31 ) = '0' then
                        
                            --check what kind of triangle we are drawing
                            
                            if commandReg( 7 downto 4 ) = x"0" then

                                    bltState    <= bsTriangleGouraud;

                            else

                                    bltState    <= bsTriangleZBuffer0;
                            
                            end if;
                            
                        else
                    
                            --next pixel
                            triangleCX  <= std_logic_vector( unsigned( triangleCX ) + 1 );
        
                            --CX/CY to edge valid counter
                            triangleECounter    <= x"4";                    
                        
                            --CX/CY to iterator value counter
                            triangleITCounter   <= x"7";
                            
                        end if;
                        
                   end if;

                end if;
                
            when bsTriangleZBuffer0 =>
            
                --read z buffer
                --dpDb
                --early read
                bltA            <= std_logic_vector( unsigned( dpDb )  + unsigned( triangleCY & triangleCX( 8 downto 0 ) ) );
                bltWr           <= '0';
                bltDmaRequest   <= '1';
                bltReturnState  <= bsTriangleZBuffer1;                

                bltState        <= bsSubRead1;


            when bsTriangleZBuffer1 =>
                
                if triangleITCounter = x"0" then
                
                    if unsigned( triangleIt3Out ) < unsigned( dmaReadData( 15 downto 0 ) ) then      
                 
                        --write new depth to z-buffer and draw pixel
                        
                        --early write
                        bltDOut         <= x"0000" &  triangleIt3Out;
        
                        bltWr           <= '1';
                        bltDmaRequest   <= '1';
        
                        --check what kind of triangle we are drawing
                        
                        if commandReg( 7 downto 4 ) = x"1" then
                        
                            --gouraud triangle
                                
                            bltReturnState  <= bsTriangleGouraud;
                            
                        else
                        
                            --textured triangle
                            bltReturnState  <= bsTriangleTextured0;
                        
                        end if;
                        
                        bltState        <= bsSubWrite1;
                     
                                    
                    else
                 
                        --do not draw pixel
                        
                        --next pixel
                        triangleCX  <= std_logic_vector( unsigned( triangleCX ) + 1 );
            
                        --CX/CY to edge valid counter
                        triangleECounter    <= x"4";
                                        
                        --CX/CY to iterator value counter
                        triangleITCounter   <= x"7";
                            
                        bltState            <= bsTriangle0;
                        
                    end if;
                
                end if;
                
            when bsTriangleGouraud =>
            
                if triangleITCounter = x"0" then
                
                    --next pixel
                    triangleCX  <= std_logic_vector( unsigned( triangleCX ) + 1 );
        
                    --CX/CY to edge valid counter
                    triangleECounter    <= x"4";
                                    
                    --CX/CY to iterator value counter
                    triangleITCounter   <= x"7";
                    
                    --early write
                    bltA            <= std_logic_vector( unsigned( dpDa )  + unsigned( triangleCY & triangleCX( 8 downto 0 ) ) );
                    bltDOut         <= x"0000" &  triangleIt0Out( 7 downto 3 ) & triangleIt1Out( 7 downto 2 ) & triangleIt2Out( 7 downto 3 );
    
                    bltWr           <= '1';
                    bltDmaRequest   <= '1';
    
                    bltReturnState  <= bsTriangle0;
                    bltState        <= bsSubWrite1;
                    
                end if;
                      
            when bsTriangleTextured0 =>

                if triangleITCounter = x"0" then
            
                    --read texture
                    --dpSa
                    --early read
                    bltA            <= std_logic_vector( unsigned( dpSa )  + unsigned( triangleIt1Out( 7 downto 0 ) & triangleIt0Out( 7 downto 0 ) ) );
                    bltWr           <= '0';
                    bltDmaRequest   <= '1';
                    bltReturnState  <= bsTriangleTextured1;                
    
                    bltState        <= bsSubRead1;
                    
                end if;

            when bsTriangleTextured1 =>
                        
                --next pixel
                triangleCX  <= std_logic_vector( unsigned( triangleCX ) + 1 );
    
                --CX/CY to edge valid counter
                triangleECounter    <= x"4";
                                
                --CX/CY to iterator value counter
                triangleITCounter   <= x"7";
                
                --early write
                bltA            <= std_logic_vector( unsigned( dpDa )  + unsigned( triangleCY & triangleCX( 8 downto 0 ) ) );
                bltDOut         <= x"0000" & tsColorOut;    --dmaReadData( 15 downto 0 );
    
                bltWr           <= '1';
                bltDmaRequest   <= '1';
    
                bltReturnState  <= bsTriangle0;
                bltState        <= bsSubWrite1;
                
                            
            -- subroutines
            
            -- read subroutine
            when bsSubRead0 =>
                            
                bltA            <= dmaReadAddr;
                bltWr           <= '0';
                bltDmaRequest   <= '1';

                bltState        <= bsSubRead1;
                
                        
            when bsSubRead1 =>
            
                if bltDmaReady = '1' then
                
                    dmaReadData <= bltDin;

                    bltDmaRequest   <= '0';
                    bltState        <= bltReturnState;
                    
                end if;

            
            -- write subroutine       
            when bsSubWrite0 =>

                bltA            <= dmaWriteAddr;
                bltDOut         <= dmaWriteData;

                bltWr           <= '1';
                bltDmaRequest   <= '1';
    
                bltState        <= bsSubWrite1;                     
        
                
            when bsSubWrite1 =>
            
                if bltDmaReady = '1' then
                
                    bltDmaRequest   <= '0';
                    bltState        <= bltReturnState;
                    
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

--place bounding box calculator
boundingBoxInst:boundingBox
port map( 

    reset       => reset,
    clock       => clock,
    
    bbXMinReg   => bbXMinReg,
    bbXMaxReg   => bbXMaxReg,
    bbYMinReg   => bbYMinReg,
    bbYMaxReg   => bbYMaxReg,

    aXReg       => aXReg,
    aYReg       => aYReg,

    bXReg       => bXReg,
    bYReg       => bYReg,

    cXReg       => cXReg,
    cYReg       => cYReg,
    
    bbXMinOut   => triangleBBXMin,
    bbXMaxOut   => triangleBBXMax,
    bbYMinOut   => triangleBBYMin,
    bbYMaxOut   => triangleBBYMax,
    bbWidthOut  => triangleBBWidth,
    bbHeightOut => triangleBBHeight

    
);

--gouraud edges

--area

gouraudEdgeAreaInst:gouraudEdge
port map(
    reset       => reset,
    clock       => clock,
   
    e1_x        => cXReg,
    e1_y        => cYReg,
    
    e2_x        => bXReg,
    e2_y        => bYReg,

    p_x         => aXReg,
    p_y         => aYReg,
  
    edge        => triangleArea
);

--eba
gouraudEBAInst:gouraudEdge
port map(
    reset       => reset,
    clock       => clock,
   
    e1_x        => bXReg,
    e1_y        => bYReg,
    
    e2_x        => aXReg,
    e2_y        => aYReg,

    p_x         => triangleCX,
    p_y         => triangleCY,
  
    edge        => triangleEBA
);

--ecb
gouraudECBInst:gouraudEdge
port map(
    reset       => reset,
    clock       => clock,
   
    e1_x        => cXReg,
    e1_y        => cYReg,
    
    e2_x        => bXReg,
    e2_y        => bYReg,

    p_x         => triangleCX,
    p_y         => triangleCY,
  
    edge        => triangleECB
);

--eac
gouraudEACInst:gouraudEdge
port map(
    reset       => reset,
    clock       => clock,
   
    e1_x        => aXReg,
    e1_y        => aYReg,
    
    e2_x        => cXReg,
    e2_y        => cYReg,

    p_x         => triangleCX,
    p_y         => triangleCY,
  
    edge        => triangleEAC
);

-- 0xffffffff / triangle area

triangleAreaDivisorInst:triangleAreaDivisor
port map(

    reset               => reset,
    clock               => clock,
    
    trigger             => triangleAreaDivTrigger,
    triangleArea        => triangleArea,

    triangleAreaInv     => triangleAreaInv,
    ready               => triangleAreaInvValid

);

-- weight calculation
gouraudWeightBAInst: gouraudWeight
port map(

   --reset
    reset   => reset,
    clock   => clock,
    
    edge    => triangleEBA,
    areaInv => triangleAreaInv,
    weight  => triangleWBA
);

gouraudWeightCBInst: gouraudWeight
port map(

   --reset
    reset   => reset,
    clock   => clock,
    
    edge    => triangleECB,
    areaInv => triangleAreaInv,
    weight  => triangleWCB
);

gouraudWeightACInst: gouraudWeight
port map(

   --reset
    reset   => reset,
    clock   => clock,
    
    edge    => triangleEAC,
    areaInv => triangleAreaInv,
    weight  => triangleWAC
);

--gouraud iterators ( 8-bit )

gouraudIterator0Inst:gouraudIterator
port map(

    reset       => reset,
    clock       => clock,
       
    weightCB    => triangleWCB,
    weightAC    => triangleWAC,
    weightBA    => triangleWBA,

    valA        => aIt0Reg,
    valB        => bIt0Reg,
    valC        => cIt0Reg,

    valOut      => triangleIt0Out
);

gouraudIterator1Inst:gouraudIterator
port map(

    reset       => reset,
    clock       => clock,
       
    weightCB    => triangleWCB,
    weightAC    => triangleWAC,
    weightBA    => triangleWBA,

    valA        => aIt1Reg,
    valB        => bIt1Reg,
    valC        => cIt1Reg,

    valOut      => triangleIt1Out
);

gouraudIterator2Inst:gouraudIterator
port map(

    reset       => reset,
    clock       => clock,
       
    weightCB    => triangleWCB,
    weightAC    => triangleWAC,
    weightBA    => triangleWBA,

    valA        => aIt2Reg,
    valB        => bIt2Reg,
    valC        => cIT2Reg,

    valOut      => triangleIt2Out
);

gouraudIterator3Inst:gouraudIterator16
port map(

    reset       => reset,
    clock       => clock,
       
    weightCB    => triangleWCB,
    weightAC    => triangleWAC,
    weightBA    => triangleWBA,

    valA        => aZReg,
    valB        => bZReg,
    valC        => cZReg,

    valOut      => triangleIt3Out
);

--texture shader ( light )
textureShaderInst:textureShader
port map(
    reset       => reset,
    clock       => clock,
       
    colorIn     => dmaReadData( 15 downto 0 ),
    lightIn     => triangleIt2Out( 7 downto 3 ),
    colorOut    => tsColorOut
);

    
end Behavioral;
