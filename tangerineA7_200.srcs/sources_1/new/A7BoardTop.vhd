----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/04/2024 09:48:20 PM
-- Design Name: 
-- Module Name: A7BoardTop - Behavioral
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

--clear ip cache: Project settings/IP/button 'clear cache'

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity A7BoardTop is
port( 
 
    --on board clock, 50MHz
    sysClk50:   in      std_logic;
    
    --buttons ( active low )
    buttons:    in      std_logic_vector( 1 downto 0 );
    
    --leds
    leds:       out     std_logic_vector( 1 downto 0 );

    --hdmi
    hdmiClkP:   out     std_logic;
    hdmiClkN:   out     std_logic;
    
    hdmiDP:     out     std_logic_vector( 2 downto 0 );
    hdmiDN:     out     std_logic_vector( 2 downto 0 );
    
    --rs232
    rs232Txd:   out     std_logic;
    rs232Rxd:   in      std_logic;
    
    --usb 1 - keyboard
    usb1dm:     inout   std_logic;
    usb1dp:     inout   std_logic;
    
    --usb2 - mouse
    usb2dm:     inout   std_logic;
    usb2dp:     inout   std_logic;
    
    --sd
    sdCardDat:  inout   std_logic_vector( 3 downto 0 );
    sdCardCmd:  out     std_logic;
    sdCardClk:  out     std_logic;
    
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
    sdramCS:    out     std_logic        

);
end A7BoardTop;

architecture Behavioral of A7BoardTop is

--components

--main pll

component clk_wiz_0
port
 (
  -- Clock out ports
  clk25:            out    std_logic;
  clk25ps:          out    std_logic;
  clk125:           out    std_logic;
  clk125ps:         out    std_logic;
  clk50:            out    std_logic;
  clk100:           out    std_logic;
  clk100ps:         out    std_logic;

  -- Status and control signals
  resetn:           in     std_logic;
  locked:           out    std_logic;

 -- Clock in ports
  clk_in1:          in     std_logic
 );
end component; 

--dvi encoder
component dvid
port(
    clk:        in  std_logic;
    clk_n:      in  std_logic;
    clk_pixel:  in  std_logic;
    red_p:      in  std_logic_vector(7 downto 0);
    green_p:    in  std_logic_vector(7 downto 0);
    blue_p:     in  std_logic_vector(7 downto 0);
    blank:      in  std_logic;
    hsync:      in  std_logic;
    vsync:      in  std_logic;          
    red_s:      out std_logic;
    green_s:    out std_logic;
    blue_s:     out std_logic;
    clock_s:    out std_logic
);
end component;  

--the SOC
component tangerineSOC is
Port ( 
    
    --reset, clocks 
    reset:          in  std_logic;
    
    pixelClock:     in  std_logic;
    pixelClockPs:   in  std_logic;
    cpuClock:       in  std_logic;
    chipsetClock:   in  std_logic;
    chipsetClockPs: in  std_logic;
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
end component; 

--signals

--global resets

signal  reset:              std_logic;
signal  resetn:             std_logic;

--clocks
signal  clk25:              std_logic;
signal  clk25ps:            std_logic;
signal  clk125:             std_logic;
signal  clk125ps:           std_logic;
signal  clk50:              std_logic;
signal  clk100:             std_logic;
signal  clk100ps:           std_logic;

--HDMI conn signals ( single ended )

signal  hdmiPixelClock:     std_logic;
signal  hdmiEncodedData:    std_logic_vector( 2 downto 0 );

--tangerine SOC signals

--clocks
signal  cpuClock:           std_logic;
signal  chipsetClock:       std_logic;
signal  chipsetClockps:     std_logic;
signal  vgaPixelClock:      std_logic;
signal  vgaPixelClockps:    std_logic;
signal  vgaPixelClockx5:    std_logic;
signal  vgaPixelClockx5ps:  std_logic;


--vga
signal  vgaRed:             std_logic_vector( 7 downto 0 );
signal  vgaGreen:           std_logic_vector( 7 downto 0 );
signal  vgaBlue:            std_logic_vector( 7 downto 0 );
signal  vgaHSync:           std_logic;
signal  vgaVSync:           std_logic;
signal  vgaDisplayEnable:   std_logic; 

begin

--global reset ( from clk_wiz_0 )

    reset   <= not resetn;

--assign clocks

    vgaPixelClockx5     <= clk125;
    vgaPixelClockx5ps   <= clk125ps;
    vgaPixelClock       <= clk25;
    vgaPixelClockps     <= clk25ps;

    cpuClock            <= clk50;
    chipsetClock        <= clk100;
    chipsetClockps      <= clk100ps;

--drive unassigned signals


--drive unused pins


--place pll
clk_wiz_0Inst:clk_wiz_0
port map
 (
  -- Clock out ports
  clk25             => clk25,
  clk25ps           => clk25ps,
  clk125            => clk125,
  clk125ps          => clk125ps,
  clk50             => clk50,
  clk100            => clk100,
  clk100ps          => clk100ps,

  -- Status and control signals
  resetn            =>  buttons(0),
  locked            =>  resetn,

 -- Clock in ports
  clk_in1           =>  sysClk50
 );

--place diff buffers

OBUFDS_blue:    OBUFDS port map ( O  => hdmiDP(0), OB => hdmiDN(0), I  => hdmiEncodedData(0) );
OBUFDS_green:   OBUFDS port map ( O  => hdmiDP(1), OB => hdmiDN(1), I  => hdmiEncodedData(1) );
OBUFDS_red:     OBUFDS port map ( O  => hdmiDP(2), OB => hdmiDN(2), I  => hdmiEncodedData(2) );
OBUFDS_clock:   OBUFDS port map ( O  => hdmiClkP, OB => hdmiClkN, I  => hdmiPixelClock );  

--place dvi encoder

dvidInst: dvid 
port map(

    --inputs ( vga, clocks )
    clk       => vgaPixelClockx5,
    clk_n     => vgaPixelClockx5ps, 
    clk_pixel => vgaPixelClock,
    red_p     => vgaRed,
    green_p   => vgaGreen,
    blue_p    => vgaBlue,
    blank     => not vgaDisplayEnable,
    hsync     => vgaHSync,
    vsync     => vgaVSync,
    
    --outputs ( hdmi )  
    red_s     => hdmiEncodedData(2),
    green_s   => hdmiEncodedData(1),
    blue_s    => hdmiEncodedData(0),
    clock_s   => hdmiPixelClock
    
    );  

 --place SOC
tangerineSOCInst:tangerineSOC
port map( 
    
    --reset, clocks 
    reset               => reset,
    
    pixelClock          => vgaPixelClock,
    pixelClockPs        => vgaPixelClockps,
    cpuClock            => cpuClock,
    chipsetClock        => chipsetClock,
    chipsetClockPs      => chipsetClockps,
    usbClock            => '0',
    
    
    --vga
    vgaRed              => vgaRed,
    vgaGreen            => vgaGreen,
    vgaBlue             => vgaBlue,
    vgaHS               => vgaHSync,
    vgaVS               => vgaVSync,
    vgaDE               => vgaDisplayEnable,
    
    --uart
    uartTX              => rs232Txd,
    uartRX              => rs232Rxd,

    --sd card
    sdMciDat            => sdCardDat,
    sdMciCmd            => sdCardCmd,
    sdMciClk            => sdCardClk,

    --usb 1 - keyboard
    usb1dm              => usb1dm,
    usb1dp              => usb1dp,
    
    --usb2 - mouse
    usb2dm              => usb2dm,
    usb2dp              => usb2dp,

    --sdram
    sdramA              => sdramA,
    sdramBA             => sdramBA,
    sdramD              => sdramD,
    sdramCKE            => sdramCKE,
    sdramCLK            => sdramCLK,
    sdramDQM            => sdramDQM,
    sdramCAS            => sdramCAS,
    sdramRAS            => sdramRAS,
    sdramWE             => sdramWE,
    sdramCS             => sdramCS,
        
    --buttons
    buttons             => buttons,
    
    --leds
    leds                => leds
); 
    
end Behavioral;
