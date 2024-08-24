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

    reset:              in      std_logic;
    blitterClock:       in      std_logic;

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

begin

    ready           <= '1';
    dout            <= ( others => '0' );
    
    bltDmaRequest   <= '0';
    bltDmaWordSize  <= '0';
    bltA            <= ( others => '0' );
    bltDout         <= ( others => '0' );
    bltWr           <= '0';
    
end Behavioral;
