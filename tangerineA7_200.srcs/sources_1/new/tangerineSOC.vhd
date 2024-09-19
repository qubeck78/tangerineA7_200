----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/19/2024 11:33:27 PM
-- Design Name: 
-- Module Name: tangerineSOC - Behavioral
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

--https://nandland.com/common-vhdl-conversions/#Numeric-Integer-To-Std_Logic_Vector

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;   


library UNISIM;
use UNISIM.VComponents.all;

entity tangerineSOC is
Port ( 
    
    --reset, clocks 
    reset:          in  std_logic;
    
    mainClock:      in  std_logic;
    mainClockPs:    in  std_logic;
    mainClockD2:    in  std_logic;    
    pixelClock:     in  std_logic;
    usbClock:       in  std_logic;    
    
    --vga
    vgaRed:         out std_logic_vector( 7 downto 0 );
    vgaGreen:       out std_logic_vector( 7 downto 0 );
    vgaBlue:        out std_logic_vector( 7 downto 0 );
    vgaHS:          out std_logic;
    vgaVS:          out std_logic;
    vgaDE:          out std_logic;
    
    --uart
    uartTX:         out std_logic;
    uartRX:         in  std_logic;
    
    --usb 1 - keyboard
    usb1dm:     inout   std_logic;
    usb1dp:     inout   std_logic;
    
    --usb2 - mouse
    usb2dm:     inout   std_logic;
    usb2dp:     inout   std_logic;

    --sd card
    sdMciDat:       inout   std_logic_vector( 3 downto 0 );	
    sdMciCmd:	    out  std_logic;	
    sdMciClk:	    out  std_logic;	 
        
    --sdram
    sdramA:     out     std_logic_vector( 12 downto 0 );
    sdramBA:    out     std_logic_vector( 1 downto 0 );
    sdramD:     inout   std_logic_vector( 31 downto 0 );
    sdramCKE:   out     std_logic;
    sdramCLK:   out     std_logic;
    sdramDQM:   out     std_logic_vector( 3 downto 0 );
    sdramCAS:   out     std_logic;
    sdramRAS:   out     std_logic;
    sdramWE:    out     std_logic;
    sdramCS:    out     std_logic;    

    --buttons
    buttons:        in  std_logic_vector( 1 downto 0 );
    
    --leds
    leds:           out std_logic_vector( 1 downto 0 )
);
end tangerineSOC;

architecture Behavioral of tangerineSOC is

--components

-- font rom
component fontPROM
  port (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) 
  );
end component; 

-- system RAM: bootloader, stack, text mode video memory
component systemRam
  port (
    clka:   IN STD_LOGIC;
    wea:    IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    addra:  IN STD_LOGIC_VECTOR(12 DOWNTO 0);
    dina:   IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    douta:  OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    clkb:   IN STD_LOGIC;
    web:    IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    addrb:  IN STD_LOGIC_VECTOR(12 DOWNTO 0);
    dinb:   IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    doutb:  OUT STD_LOGIC_VECTOR(31 DOWNTO 0) 
  );
end component; 

COMPONENT fastRam
  PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) 
  );
END COMPONENT;

-- text mode pixel and sync gen
component pixelGenTxt
    port(
        --reset
        reset:          in  std_logic;
        pgClock:        in  std_logic;
        pgVSync:        out std_logic;
        pgHSync:        out std_logic;
        pgDe:           out std_logic;
        pgR:            out std_logic_vector( 7 downto 0 );
        pgG:            out std_logic_vector( 7 downto 0 );
        pgB:            out std_logic_vector( 7 downto 0 );

        fontRomA:       out std_logic_vector( 10 downto 0 );
        fontRomDout:    in  std_logic_vector( 7 downto 0 );

        videoRamBA:     out std_logic_vector( 13 downto 0 );
        videoRamBDout:  in  std_logic_vector( 15 downto 0 );
        
        pgXCount:       out std_logic_vector( 11 downto 0 );
        pgYCount:       out std_logic_vector( 11 downto 0 );
        pgDeX:          out std_logic;
        pgDeY:          out std_logic;
        pgPreFetchLine: out std_logic;
        pgFetchEnable:  out std_logic;
    
        pgVideoMode:      in  std_logic_vector( 1 downto 0 )
    );
end component;

-- gfx pixel gen
component pixelGenGfx is
port(
   reset:            in  std_logic;
   pggClock:         in  std_logic;
   pggR:             out std_logic_vector( 7 downto 0 );
   pggG:             out std_logic_vector( 7 downto 0 );
   pggB:             out std_logic_vector( 7 downto 0 );

    --gfx buffer ram
   gfxBufRamDOut:    in  std_logic_vector( 31 downto 0 );
   gfxBufRamRdA:     out std_logic_vector( 8 downto 0 );

   --2 dma requests
   pggDMARequest:    out std_logic_vector( 1 downto 0 );
   
   --sync gen outputs
   pgVSync:          in  std_logic;
   pgHSync:          in  std_logic;
   pgDe:             in  std_logic;
   pgXCount:         in  std_logic_vector( 11 downto 0 );
   pgYCount:         in  std_logic_vector( 11 downto 0 );
   pgDeX:            in  std_logic;
   pgDeY:            in  std_logic;
   pgPreFetchLine:   in  std_logic;
   pgFetchEnable:    in  std_logic;

   pgVideoMode:      in  std_logic_vector( 1 downto 0 );
   pgEnabled:        in  std_logic

   );
end component; 
 
-- risc-v cpu :)

component nekoRv is
port( 
    
    clk:                in  std_logic;
    reset:              in  std_logic;
    
    a:                  out std_logic_vector( 31 downto 0 );
    din:                in  std_logic_vector( 31 downto 0 );
    dout:               out std_logic_vector( 31 downto 0 );
    
    be:                 out std_logic;
    ready:              in  std_logic;
    wr:                 out std_logic;
    dataMask:           out std_logic_vector( 3 downto 0 );
    
    instrFetchCycle:    out std_logic
    
);
end component;

-- UART
component UART
    port(
      --cpu interface
      reset:            in    std_logic;
      clock:            in    std_logic;
      a:                in    std_logic_vector( 15 downto 0 );
      din:              in    std_logic_vector( 31 downto 0 );
      dout:             out   std_logic_vector( 31 downto 0 );
      
      ce:               in    std_logic;
      wr:               in    std_logic;
      dataMask:         in    std_logic_vector( 3 downto 0 );
      
      ready:            out   std_logic;
      
      --uart interface
      uartTXD:          out std_logic;
      uartRXD:          in  std_logic
    );
end component; 

-- SPI
component SPI is
port(

   --cpu interface
   reset:      in  std_logic;
   clock:      in  std_logic;

   a:          in    std_logic_vector( 15 downto 0 );
   din:        in    std_logic_vector( 31 downto 0 );
   dout:       out   std_logic_vector( 31 downto 0 );
   
   ce:         in    std_logic;
   wr:         in    std_logic;
   dataMask:   in    std_logic_vector( 3 downto 0 );
   
   ready:      out   std_logic;
   
   --spi interface
   sclk:       out std_logic;
   mosi:       out std_logic;
   miso:       in  std_logic
   
);
end component;

-- usb host
component usbHost is
port(

   --cpu interface
   reset:            in    std_logic;
   clock:            in    std_logic;
   a:                in    std_logic_vector( 15 downto 0 );
   din:              in    std_logic_vector( 31 downto 0 );
   dout:             out   std_logic_vector( 31 downto 0 );
   
   ce:               in    std_logic;
   wr:               in    std_logic;
   dataMask:         in    std_logic_vector( 3 downto 0 );
   
   ready:            out   std_logic;
   
   --usb phy clock (12MHz)
   usbHClk:          in    std_logic;
   
   --usb interfaces
   --keyboard
   usbH0Dp:          inout std_logic;     
   usbH0Dm:          inout std_logic;      

   --mouse
   usbH1Dp:          inout std_logic;     
   usbH1Dm:          inout std_logic      

);
end component; 

--SDRAM controller and DMA

component sdramDMA is
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
    
    --ch0 - CPU, lowest priority: 3
    
    ch0A:           in  std_logic_vector( 23 downto 0 );
    ch0Din:         in  std_logic_vector( 31 downto 0 );
    ch0Dout:        out std_logic_vector( 31 downto 0 );
   
    ch0Ce:          in  std_logic;
    ch0Wr:          in  std_logic;
    ch0DataMask:    in  std_logic_vector( 3 downto 0 );
    ch0InstrCycle:  in  std_logic;

    ch0Ready:       out std_logic; 
    
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
end component;

--blitter
component blitter is
port( 
    
    --reset, clocks

    reset:              in      std_logic;
    clock:              in      std_logic;

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
end component;


--signals

-- video mux signals
signal vmMode:          std_logic_vector( 15 downto 0 );
   
-- txt pixel gen signals
signal pgClock:          std_logic;
signal pgVSync:          std_logic;
signal pgHSync:          std_logic;
signal pgDe:             std_logic;
signal pgR:              std_logic_vector( 7 downto 0 );
signal pgG:              std_logic_vector( 7 downto 0 );
signal pgB:              std_logic_vector( 7 downto 0 ); 
signal pgXCount:         std_logic_vector( 11 downto 0 );
signal pgYCount:         std_logic_vector( 11 downto 0 );
signal pgDeX:            std_logic;
signal pgDeY:            std_logic;
signal pgPreFetchLine:   std_logic;
signal pgFetchEnable:    std_logic;
signal videoRamBDout:    std_logic_vector( 15 downto 0 );
signal videoRamBA:       std_logic_vector( 13 downto 0 ); 

-- vsync signal synchronised to cpu clock domain
signal   pgVSyncClkD2:     std_logic;

-- gfx pixel gen signals
signal   pgEnabled:             std_logic;
signal   pggR:                  std_logic_vector( 7 downto 0 );
signal   pggG:                  std_logic_vector( 7 downto 0 );
signal   pggB:                  std_logic_vector( 7 downto 0 ); 
signal   pggDMARequest:         std_logic_vector( 1 downto 0 );
signal   pggDMARequestClkD2:    std_logic_vector( 1 downto 0 );


--font rom signals
signal fontRomA:        std_logic_vector( 10 downto 0 );
signal fontRomDout:     std_logic_vector( 7 downto 0 );


--system ram signals

signal  systemRAMCE:                std_logic;
signal  systemRamReady:             std_logic;
signal  systemRamDoutForCPU:        std_logic_vector( 31 downto 0 );
signal  systemRamDoutForPixelGen:   std_logic_vector( 31 downto 0 );
signal  systemRamDataIn:            std_logic_vector( 31 downto 0 );
signal  systemRamWr:                std_logic; 

--fast ram signals
signal  fastRAMCE:                std_logic;
signal  fastRamReady:             std_logic;
signal  fastRamDoutForCPU:        std_logic_vector( 31 downto 0 );


--cpu signals
signal cpuClock:        std_logic;
signal cpuResetn:       std_logic;
signal cpuAOut:         std_logic_vector( 29 downto 0 );
signal cpuDOut:         std_logic_vector( 31 downto 0 );

signal cpuMemValid:		std_logic;
signal cpuMemInstr:		std_logic; 
signal cpuMemReady:		std_logic;
signal cpuAOutFull:		std_logic_vector( 31 downto 0 );
signal cpuWrStrobe:		std_logic_vector( 3 downto 0 );
signal cpuDin:			std_logic_vector( 31 downto 0 );

signal cpuWr:			std_logic;
signal cpuDataMask:		std_logic_vector( 3 downto 0 );

--cpu resetgen
signal cpuResetGenCounter:  std_logic_vector( 15 downto 0 ); 

-- gpo signals
signal   gpoRegister:      std_logic_vector( 31 downto 0 );

-- registers signals
signal   registersClock:      std_logic;

type     regState_T is ( rsWaitForRegAccess, rsWaitForBusCycleEnd );
signal   registerState:       regState_T;

signal   registersCE:         std_logic;
signal   registersDoutForCPU: std_logic_vector( 31 downto 0 ); 
signal   registersReady:      std_logic;

-- tick timer signals
signal   tickTimerClock:            std_logic;
signal   tickTimerReset:            std_logic;
signal   tickTimerPrescalerCounter: std_logic_vector( 31 downto 0 );
signal   tickTimerCounter:          std_logic_vector( 31 downto 0 );

constant tickTimerPrescalerValue:   integer:=   50000 - 1;  --1ms tick timer @50MHz
 
-- frameTimer signals
signal   frameTimerClock:        std_logic;
signal   frameTimerReset:        std_logic;
signal   frameTimerPgPrvVSync:   std_logic;
signal   frameTimerValue:        std_logic_vector( 31 downto 0 );

-- uart signals
signal   uartClock:           std_logic;

signal   uartCE:              std_logic;
signal   uartDoutForCPU:      std_logic_vector( 31 downto 0 );
signal   uartReady:           std_logic;

signal   uartTxd:             std_logic;
signal   uartRxd:             std_logic; 

-- SPI signals
signal   spiClock:         std_logic;
signal   spiCE:            std_logic;
signal   spiDoutForCPU:    std_logic_vector( 31 downto 0 );
signal   spiReady:         std_logic;

signal   spiSClk:          std_logic;
signal   spiMOSI:          std_logic;
signal   spiMISO:          std_logic; 

-- sdram DMA signals

--registers

signal  sdramDmaRegsCE:         std_logic;
signal  sdramDmaRegsReady:      std_logic;
signal  sdramDmaRegsDoutForCPU: std_logic_vector( 31 downto 0 );

--ch0 CPU

signal  sdramDMACE:              std_logic;
signal  sdramDMADoutForCPU:      std_logic_vector( 31 downto 0 );
signal  sdramDMAReady:           std_logic;

--ch1 blitter

signal  ch1DmaRequest:          std_logic;
signal  ch1DmaReady:            std_logic;
signal  ch1DmaWordSize:         std_logic;
signal  ch1A:                   std_logic_vector( 24 downto 0 );
signal  ch1Din:                 std_logic_vector( 31 downto 0 );
signal  ch1Dout:                std_logic_vector( 31 downto 0 );
signal  ch1Wr:                  std_logic;

--ch2 

--ch3 gfx pixel gen

signal  gfxBufRamDOut:          std_logic_vector( 31 downto 0 );
signal  gfxBufRamRdA:           std_logic_vector( 8 downto 0 );

-- usb host signals
signal   usbHostClock:           std_logic;
signal   usbHostCE:              std_logic;
signal   usbHostReady:           std_logic;
signal   usbHostDoutForCPU:      std_logic_vector( 31 downto 0 );

-- usb phy clock ( 12 MHz )
signal   usbHClk:                std_logic; 


-- blitter signals

signal  blitterClock:           std_logic;
signal  blitterRegsDoutForCPU:  std_logic_vector( 31 downto 0 );
signal  blitterRegsCE:          std_logic;
signal  blitterRegsReady:       std_logic;

begin

-- assign clocks

cpuClock            <= mainClock;
pgClock             <= pixelClock;

registersClock      <= mainClock;
uartClock           <= mainClock;
tickTimerClock      <= mainClockD2;
frameTimerClock     <= mainClock;
spiClock            <= mainClockD2;

usbHostClock        <= mainClock;
usbHClk             <= usbClock;

blitterClock        <= mainClock;


--no need to sync now

pgVSyncClkD2        <= pgVSync;
pggDMARequestClkD2  <= pggDMARequest;

-- leds

 leds    <=  gpoRegister( 7 downto 6 );       

-- fill unused ports, signals


-- place text mode font rom ( 2048 x 8 )

fontPromInst: fontProm 
port map(
    clka    => pgClock,
    addra   => fontRomA,
    douta   => fontRomDout
);

-- place system RAM ( 8192 x 32 )
   
systemRamInst: systemRam
port map(

    clka        => cpuClock,    --fpgaCpuMemoryClock,
    wea(0)      => cpuWrStrobe(0) and systemRAMCE,
    wea(1)      => cpuWrStrobe(1) and systemRAMCE,
    wea(2)      => cpuWrStrobe(2) and systemRAMCE,
    wea(3)      => cpuWrStrobe(3) and systemRAMCE,
    addra       => cpuAOut( 12 downto 0 ),
    dina        => cpuDOut,
    douta       => systemRamDoutForCPU,
    
    clkb        => pgClock,
    web         => "0000",
    addrb       => videoRamBA( 13 downto 1 ),
    dinb        => ( others => '0' ),
    doutb       => systemRamDoutForPixelGen

);

systemRamAccess:process( all )
begin

    if reset = '1' then
    
        systemRamReady <= '0';
        
    elsif rising_edge( cpuClock ) then
    
        systemRamReady <= systemRamCE;
    
    end if;

end process;

   
videoRamBDout   <= systemRamDoutForPixelGen( 15 downto 0 ) when videoRamBA( 0 ) = '0' else systemRamDoutForPixelGen( 31 downto 16 ); 

fastRamInst:fastRam 
port map(
    clka        => cpuClock,
    wea(0)      => cpuWrStrobe(0) and fastRamCE,
    wea(1)      => cpuWrStrobe(1) and fastRamCE,
    wea(2)      => cpuWrStrobe(2) and fastRamCE,
    wea(3)      => cpuWrStrobe(3) and fastRamCE,
    addra       => cpuAOut( 17 downto 0 ),
    dina        => cpuDOut,
    douta       => fastRamDoutForCpu 
);

fastRamAccess:process( all )
begin

    if reset = '1' then
    
        fastRamReady <= '0';
        
    elsif rising_edge( cpuClock ) then
    
        fastRamReady <= fastRamCE;
    
    end if;

end process;

 
 
--Place txt pixel gen

pixelGenInst: pixelGenTxt
port map(
    reset           => reset,
    pgClock         => pgClock,

    pgVSync         => pgVSync,
    pgHSync         => pgHSync,
    pgDe            => pgDe,
    pgR             => pgR,
    pgG             => pgG,
    pgB             => pgB,

    fontRomA        => fontRomA,
    fontRomDout     => fontRomDout,

    videoRamBA      => videoRamBA,
    videoRamBDout   => videoRamBDout,
        
    pgXCount        => pgXCount,
    pgYCount        => pgYCount,
    pgDeX           => pgDeX,
    pgDeY           => pgDeY,
    pgPreFetchLine  => pgPreFetchLine,
    pgFetchEnable   => pgFetchEnable,
      
    pgVideoMode     => vmMode( 3 downto 2 )
        
);   


-- place gfx pixel gen

pgEnabled   <= '1' when vmMode( 1 downto 0 ) /= "00" else '0';

pixelGenGfxInst: pixelGenGfx
port map(
    reset             => reset,
    pggClock          => pgClock,

    pggR              => pggR,
    pggG              => pggG,
    pggB              => pggB,

    --gfx buffer ram
    gfxBufRamDOut     => gfxBufRamDOut,
    gfxBufRamRdA      => gfxBufRamRdA,

    --2 dma requests
    pggDMARequest     => pggDMARequest,

    --sync gen outputs
    pgVSync           => pgVSync,
    pgHSync           => pgHSync,
    pgDe              => pgDe,
    pgXCount          => pgXCount,
    pgYCount          => pgYCount,
    pgDeX             => pgDeX,
    pgDeY             => pgDeY,
    pgPreFetchLine    => pgPreFetchLine,
    pgFetchEnable     => pgFetchEnable,

    pgVideoMode       => vmMode( 5 downto 4 ),
    pgEnabled         => pgEnabled
); 

--VideoMux process ( mix text with gfx )

videoMux: process( all )

begin

if rising_edge( pgClock ) then

    if reset = '1' then

        vgaHS    <= '0';
        vgaVS    <= '0';
        vgaDE    <= '0';
        
        vgaRed		<= ( others => '0' );
        vgaGreen    <= ( others => '0' );
        vgaBlue     <= ( others => '0' );

    else
    
        case vmMode( 1 downto 0 ) is
        
            --text mode
            when "00" =>
            
                vgaHS    <= pgHSync;
                vgaVS    <= pgVSync;
                vgaDE    <= pgDe;
                
                vgaRed		<= pgR( 7 downto 3 ) & "000";
                vgaGreen    <= pgG( 7 downto 2 ) & "00";
                vgaBlue     <= pgB( 7 downto 3 ) & "000";
            
            --gfx mode
            when "01"	=>
            
                vgaHS    <= pgHSync;
                vgaVS    <= pgVSync;
                vgaDE    <= pgDe;
                
                vgaRed		<= pggR( 7 downto 3 ) & "000";
                vgaGreen    <= pggG( 7 downto 2 ) & "00";
                vgaBlue     <= pggB( 7 downto 3 ) & "000";

            --text over gfx mode
            when "10" =>
            
                vgaHS     <= pgHSync;
                vgaVS     <= pgVSync;
                vgaDE     <= pgDe;

                if	pgR = x"00" and pgG = x"00" and pgB = x"00" then
                    
                    vgaRed      <= pggR( 7 downto 3 ) & "000";
                    vgaGreen    <= pggG( 7 downto 2 ) & "00";
                    vgaBlue     <= pggB( 7 downto 3 ) & "000";
                    
                --gray color -> dim background
                elsif pgR = x"80" and pgG = x"80" and pgB = x"80" then
            
                    vgaRed      <= "0" & pggR( 7 downto 4 ) & "000";
                    vgaGreen    <= "0" & pggG( 7 downto 2 ) & "0";
                    vgaBlue     <= "0" & pggB( 7 downto 4 ) & "000";
                    
                else

                    vgaRed      <= pgR( 7 downto 3 ) & "000";
                    vgaGreen    <= pgG( 7 downto 2 ) & "00";
                    vgaBlue     <= pgB( 7 downto 3 ) & "000";
                
                end if;

            --gfx over text mode
            when "11" =>
            
                vgaHS        <= pgHSync;
                vgaVS        <= pgVSync;
                vgaDE        <= pgDe;


                if	pggR = x"00" and pggG = x"00" and pggB = x"00" then
                    
                    vgaRed      <= pgR( 7 downto 3 ) & "000";
                    vgaGreen    <= pgG( 7 downto 2 ) & "00";
                    vgaBlue     <= pgB( 7 downto 3 ) & "000";
                    
                else

                    vgaRed      <= pggR( 7 downto 3 ) & "000";
                    vgaGreen    <= pggG( 7 downto 2 ) & "00";
                    vgaBlue     <= pggB( 7 downto 3 ) & "000";
                    
                end if;

            when others =>
            
        end case;
    
    end if;

end if;

end process;  


-- place nekoRv
   
-- bus signals
    cpuAOut           <= cpuAOutFull( 31 downto 2 );

-- chip selects
    systemRAMCE     <= '1' when ( cpuMemValid = '1' ) and cpuAOutFull( 31 downto 20 ) = x"000" else '0';

    sdramDMACE      <= '1' when ( cpuMemValid = '1'  ) and cpuAOutFull( 31 downto 28 ) = x"2" else '0';
    fastRamCE       <= '1' when ( cpuMemValid = '1'  ) and cpuAOutFull( 31 downto 28 ) = x"3" else '0';
         
    registersCE     <= '1' when ( cpuMemValid = '1' ) and cpuAOutFull( 31 downto 20 ) = x"f00" else '0';

--    fpAluCE           <= '1' when ( cpuMemValid = '1' ) and cpuAOutFull( 31 downto 20 ) = x"f01" else '0';
   
    blitterRegsCE   <= '1' when ( cpuMemValid = '1' ) and cpuAOutFull( 31 downto 20 ) = x"f02" else '0';
    
    usbHostCE       <= '1' when ( cpuMemValid = '1' ) and cpuAOutFull( 31 downto 20 ) = x"f03" else '0';

    uartCE            <= '1' when ( cpuMemValid = '1' ) and cpuAOutFull( 31 downto 20 ) = x"f04" else '0';

    spiCE             <= '1' when ( cpuMemValid = '1' ) and cpuAOutFull( 31 downto 20 ) = x"f05" else '0';

--    i2sCE             <= '1' when ( cpuMemValid = '1' ) and cpuAOutFull( 31 downto 20 ) = x"f06" else '0';

--    flashSpiCE        <= '1' when ( cpuMemValid = '1' ) and cpuAOutFull( 31 downto 20 ) = x"f07" else '0';
    
    sdramDmaRegsCE      <= '1' when ( cpuMemValid = '1' ) and cpuAOutFull( 31 downto 20 ) = x"f08" else '0';
    
-- bus slaves ready signals mux
   cpuMemReady       <= systemRamReady when systemRAMCE = '1'
                        else uartReady when uartCE = '1' 
                        else spiReady when spiCE = '1' 
                        else usbHostReady when usbHostCE = '1' 
                        else registersReady when registersCE = '1' 
                        else sdramDMAReady when sdramDMACE = '1' 
                        else fastRamReady when fastRamCE = '1' 
                        else blitterRegsReady when blitterRegsCE = '1' 
--                        else fpAluReady when fpAluCE = '1' 
--                        else i2sReady when i2sCE = '1' 
--                        else flashSpiReady when flashSpiCE = '1'
                        else sdramDmaRegsReady when sdramDmaRegsCE = '1'  
                        else '1';


-- bus slaves data outputs mux
   cpuDin            <= systemRamDoutForCPU                       when cpuAOutFull( 31 downto 20 ) = x"000" else 
                        registersDoutForCPU                       when cpuAOutFull( 31 downto 20 ) = x"f00" else
                        sdramDMADoutForCPU                        when cpuAOutFull( 31 downto 28 ) = x"2"  else
                        fastRamDoutForCPU                         when cpuAOutFull( 31 downto 28 ) = x"3"  else
--                        fpAluDoutForCPU                           when cpuAOutFull( 31 downto 20 ) = x"f01" else
                        blitterRegsDoutForCPU                     when cpuAOutFull( 31 downto 20 ) = x"f02" else
                        usbHostDoutForCPU                         when cpuAOutFull( 31 downto 20 ) = x"f03" else 
                        uartDoutForCPU                            when cpuAOutFull( 31 downto 20 ) = x"f04" else
                        spiDoutForCPU                             when cpuAOutFull( 31 downto 20 ) = x"f05" else
--                        i2sDoutForCPU                             when cpuAOutFull( 31 downto 20 ) = x"f06" else 
--                        flashSpiDoutForCPU                        when cpuAOutFull( 31 downto 20 ) = x"f07" else  
                        sdramDmaRegsDoutForCPU                      when cpuAOutFull( 31 downto 20 ) = x"f08" else                        
                        x"00000000";

-- the CPU
  
nekoRvInst:nekoRv 
port map( 
    
    clk             => cpuClock,
    reset           => not cpuResetn,
    
    a               => cpuAOutFull,
    din             => cpuDin,
    dout            => cpuDOut,
    
    be              => cpuMemValid,
    ready           => cpuMemReady,
    wr              => cpuWr,
    dataMask        => cpuDataMask,
    
    instrFetchCycle => cpuMemInstr
);
  
--emulate cpuWrStrobe
cpuWrStrobe       <=  cpuDataMask when cpuWr = '1' else "0000";


--cpu resetgen process
cpuResetGen: process( all )

begin
    
    if reset = '1' then

        cpuResetn           <= '0';
        cpuResetGenCounter  <= x"ffff";

    else

        if rising_edge( cpuClock ) then

            if cpuResetGenCounter /= x"0000" then

                cpuResetn           <= '0';
                cpuResetGenCounter  <= std_logic_vector( unsigned( cpuResetGenCounter ) - 1 );
                
            else

                cpuResetn           <= '1';

            end if;
        end if;
    end if;

end process;

--registers process
registers: process( all )

begin
   
   if rising_edge( registersClock ) then
   
      if reset = '1' then
      
        registersDoutForCPU  <= ( others => '0' );
         
         --default register values
        vmMode          <= x"0000";
        gpoRegister     <= x"0000" & "0000000101111111";             --turn on last LED, tang flash CS high by default
         
        tickTimerReset  <= '0';
                  
        registerState   <= rsWaitForRegAccess;
        frameTimerReset <= '0';
        registersReady  <= '0';
        
      else
      
         tickTimerReset             <= '0';
         frameTimerReset            <= '0';
         
         case registerState is
         
            when rsWaitForRegAccess =>
                  
               registersReady <= '0';
               
               if registersCE = '1' then
        
                  registersReady <= '1';
                            
                  case cpuAOut( 7 downto 0 ) is
               
                     --0x00 r- id                      
                     when x"00" =>
                     
                        registersDoutForCPU  <= x"80000000";   -- root regs id
                                                
                     --0x04 r- component version                       
                     when x"01" =>
                     
                        registersDoutForCPU  <= x"20240919";
                        
                     --rw 0xf0000008 - videoMuxMode
                     when x"02" =>
               
                        registersDoutForCPU  <= x"0000" & vmMode;
                        
                        if cpuWr = '1' then
                        
                           vmMode   <= cpuDOut( 15 downto 0 );
                        
                        end if;
               
                     --rw 0xf000000c - videoVSync
                     when x"03" =>
               
                        registersDoutForCPU  <= x"0000" & x"000" & "000" & pgVSync;

                     --rw 0xf0000010 
                     when x"04" =>
               
                        registersDoutForCPU  <= ( others => '0' );
                                 
                     --rw 0xf0000014 - gpoPort
                     when x"05" =>
               
                        registersDoutForCPU  <= gpoRegister;
                        
                        if cpuWr = '1' then
                        
                           gpoRegister <= cpuDOut( 31 downto 0 );
                        
                        end if;
                        
                     ---w 0xf0000018 - tickTimerConfig
                     when x"06" =>
                                 
                        if cpuWr = '1' then
                        
                           tickTimerReset <= cpuDOut( 0 );
                        
                        end if;  
                        
                     --r- 0xf000001c - tickTimerValue
                     when x"07" =>
                              
                        registersDoutForCPU  <= tickTimerCounter;
                           
                              
                              
                     --rw 0xf0000020 - frameTimer (write resets timer)
                     when x"08" =>
                     
                        registersDoutForCPU  <= frameTimerValue;
                     
                        if cpuWr = '1' then
                           
                              frameTimerReset <= '1';
                              
                        end if;
                                             

                     when others =>

                        registersDoutForCPU  <= ( others => '0' );
                     
                  end case; --cpuAOut( 7 downto 0 ) is
               
                  registerState  <= rsWaitForBusCycleEnd;
               
               end if; --registersCE = '1'
         
            when rsWaitForBusCycleEnd =>
                     
               --wait for bus cycle to end
               if registersCE = '0' then

                  registersReady <= '0';
               
                  registerState <= rsWaitForRegAccess;
                  
               end if;
         
            when others =>

               registerState <= rsWaitForRegAccess;
            
         end case;   --registerState is
         
      end if; --! reset = '1'
         
   end if; --rising_edge( registersClock )
   

end process;  

--Place UART

uartTX      <= uartTXD;
uartRXD     <= uartRX;

UARTInst: UART
port map(
  reset    => reset,
  clock    => uartClock,     
  
  a        => cpuAOut( 15 downto 0 ),
  din      => cpuDOut,
  dout     => uartDoutForCPU,
  ce       => uartCE,
  wr       => cpuWr,
  dataMask => cpuDataMask,
  ready    => uartReady,        
    
  uartTXD  => uartTXD,
  uartRXD  => uartRXD
  
);  

-- place SD card SPI   

sdMciClk    <= spiSClk;
sdMciDat(3) <= gpoRegister( 0 ); --cs
sdMciCmd    <= spiMOSI;
spiMISO     <= sdMciDat( 0 );


sdMciDat(2 downto 0 )   <= "ZZZ";

   
SPIInst:SPI
port map(

   --cpu interface
   reset       => reset,
   clock       => spiClock,

   a           => cpuAOut( 15 downto 0 ),
   din         => cpuDOut,
   dout        => spiDoutForCPU,
   
   ce          => spiCE,
   wr          => cpuWr,
   dataMask    => cpuDataMask,
   
   ready       => spiReady,
   
   --spi interface
   sclk        => spiSClk,
   mosi        => spiMOSI,
   miso        => spiMISO
   
); 

-- place usb host
-- usb0 - keyboard
-- usb1 - mouse

usbHostInst: usbHost
port map(

  --cpu interface
  reset          => reset,
  clock          => usbHostClock,
  a              => cpuAOut( 15 downto 0 ),
  din            => cpuDOut,
  dout           => usbHostDoutForCpu,
  
  ce             => usbHostCE,
  wr             => cpuWr,
  dataMask       => cpuDataMask,
  
  ready          => usbHostReady,
  
  --usb phy clock (12MHz)
  usbHClk        => usbHClk,
  
  --usb interfaces
   --keyboard
  usbH0Dp        => usb1dp,
  usbH0Dm        => usb1dm,   

   --mouse
   usbH1Dp       => usb2dp,     
   usbH1Dm       => usb2dm      

);


-- place sdram DMA controller

sdramDMAInst:sdramDMA
port map(
    
    --reset, clocks
    reset           => reset,
    
    cpuClock        => cpuClock,
    sdramClock      => mainClock,
    sdramClockPs    => mainClockPs,


   --bus interface ( registers )

    a               => cpuAOut( 15 downto 0 ),
    din             => cpuDOut,
    dout            => sdramDmaRegsDoutForCPU,
    ce              => sdramDmaRegsCE,
    wr              => cpuWr,
    dataMask        => cpuDataMask,
    ready           => sdramDmaRegsReady,
    
    --ch0 - CPU, lowest priority: 3
    
    ch0A            => cpuAOut( 23 downto 0 ),
    ch0Din          => cpuDOut,
    ch0Dout         => sdramDMADoutForCPU,
   
    ch0Ce           => sdramDMACE,
    ch0Wr           => cpuWr,
    ch0DataMask     => cpuDataMask,
    ch0InstrCycle   => cpuMemInstr,

    ch0Ready        => sdramDMAReady,
        
    --ch1 - blitter, priority: 2
    
    ch1DmaRequest   => ch1DmaRequest,
    ch1DmaReady     => ch1DmaReady,
    ch1DmaWordSize  => ch1DmaWordSize,
    ch1A            => ch1A,
    ch1Din          => ch1Din,
    ch1Dout         => ch1Dout,
    ch1Wr           => ch1Wr,
    
    --ch2 - audio, priority: 1

    ch2DmaRequest   => '0',
    --ch2DmaReady:        out     std_logic;
    ch2A            => ( others => '0' ),
    --ch2Dout:            out     std_logic_vector( 31 downto 0 );
    
    --ch3 - gfx display, highest priority: 0
    
    ch3DmaRequest       => pggDmaRequestClkD2,
    ch3DmaPointerReset  => pgVSyncClkD2,
    
    ch3BufClk           => not pixelClock,
    ch3BufDout          => gfxBufRamDOut,
    ch3BufA             => gfxBufRamRdA,
    
    --sdram
    sdramA          => sdramA,
    sdramBA         => sdramBA,
    sdramD          => sdramD,
    sdramCKE        => sdramCKE,
    sdramCLK        => sdramCLK,
    sdramDQM        => sdramDQM,
    sdramCAS        => sdramCAS,
    sdramRAS        => sdramRAS,
    sdramWE         => sdramWE,
    sdramCS         => sdramCS  
);

-- place blitter

blitterInst:blitter
port map( 
    
    --reset, clocks

    reset           => reset,
    clock           => blitterClock,

   --bus interface ( registers )

    a               => cpuAOut( 15 downto 0 ),
    din             => cpuDOut,
    dout            => blitterRegsDoutForCPU,
    ce              => blitterRegsCE,
    wr              => cpuWr,
    dataMask        => cpuDataMask,
    ready           => blitterRegsReady,

    --dma interface ( ch1 )
    
    bltDmaRequest   => ch1DmaRequest,
    bltDmaReady     => ch1DmaReady,
    bltDmaWordSize  => ch1DmaWordSize,
    bltA            => ch1A,
    bltDin          => ch1DOut,
    bltDout         => ch1DIn,
    bltWr           => ch1Wr
    
);

-- tick timer process
tickTimer: process( all )
begin

   if rising_edge( tickTimerClock ) then
   
      if reset = '1' then
         
         tickTimerPrescalerCounter  <= ( others => '0' );
         tickTimerCounter           <= ( others => '0' );
         
      
      else
      
         if tickTimerPrescalerCounter /= x"00000000" then
            
            tickTimerPrescalerCounter <= std_logic_vector( unsigned( tickTimerPrescalerCounter ) - 1 );
            
         else
         
            --tickTimerPrescalerCounter <= conv_std_logic_vector( tickTimerPrescalerValue, tickTimerPrescalerCounter'length );
            tickTimerPrescalerCounter <= std_logic_vector( to_unsigned( tickTimerPrescalerValue, tickTimerPrescalerCounter'length ) );
            
            tickTimerCounter <= std_logic_vector( unsigned( tickTimerCounter ) + 1 );
         
         end if;
      
         if tickTimerReset = '1' then

            tickTimerPrescalerCounter  <= ( others => '0' );
            tickTimerCounter           <= ( others => '0' );
         
         end if;
         
      
      end if;  --reset = '1'
   
   
   end if; --rising_edge( tickTimerClock )

end process;   

-- frame timer process
frameTimerProcess: process( all )
begin
   
   if rising_edge( frameTimerClock ) then

      if frameTimerReset = '1' then
      
         frameTimerValue <= ( others => '0' );
         
      else
      
         frameTimerPgPrvVSync <= pgVSyncClkD2;
         
         
         if frameTimerPgPrvVSync = '0' and pgVSyncClkD2 = '1' then
      
            frameTimerValue <= std_logic_vector( unsigned( frameTimerValue ) + 1 );
            
         end if;
      
      end if;
   
   end if; -- rising_edge( frameTimerClock )
end process; 

end Behavioral;
