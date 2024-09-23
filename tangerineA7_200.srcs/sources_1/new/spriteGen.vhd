----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/20/2024 10:11:07 AM
-- Design Name: 
-- Module Name: spriteGen - Behavioral
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity spriteGen is
port (

    --cpu interface
    reset:      in  std_logic;
    clock:      in  std_logic;
    
    a:          in  std_logic_vector( 15 downto 0 );
    din:        in  std_logic_vector( 31 downto 0 );
    dout:       out std_logic_vector( 31 downto 0 );
    
    ce:         in  std_logic;
    wr:         in  std_logic;
    dataMask:   in  std_logic_vector( 3 downto 0 );
    
    ready:      out std_logic;
    
    --sync gen inputs
    pgDe:       in  std_logic;
    pgXCount:   in  std_logic_vector( 11 downto 0 );
    pgYCount:   in  std_logic_vector( 11 downto 0 );
    
    --video out
    sgClock:    in  std_logic;
    pgVSync:    in  std_logic;
    pgHSync:    in  std_logic;
    sgR:        out std_logic_vector( 7 downto 0 );
    sgG:        out std_logic_vector( 7 downto 0 );
    sgB:        out std_logic_vector( 7 downto 0 )
    
);
end spriteGen;

architecture Behavioral of spriteGen is

--components

component spriteDPRam is
port(
    clka:   IN STD_LOGIC;
    wea:    IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    addra:  IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    dina:   IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    douta:  OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    
    clkb:   IN STD_LOGIC;
    web:    IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    addrb:  IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    dinb:   IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    doutb:  OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
);
end component;

--signals

--sprite dual port ram
signal spRamAddrA:      std_logic_vector( 9 downto 0 );
signal spRamDOutA:      std_logic_vector( 15 downto 0 );

signal spRamAddrB:      std_logic_vector( 8 downto 0 );
signal spRamWeB:        std_logic;
signal spRamDataMaskB:  std_logic_vector( 3 downto 0 );
signal spRamDInB:       std_logic_vector( 31 downto 0 );
signal spRamDOutB:      std_logic_vector( 31 downto 0 );

--registers 
type   regState_T       is ( rsWaitForRegAccess, rsWaitForBusCycleEnd, rsSpriteDpRamAccess1, rsSpriteDpRamAccess2 );
signal regState:        regState_T;

--sprite position
signal spriteX:         std_logic_vector( 11 downto 0 );
signal spriteY:         std_logic_vector( 11 downto 0 );

--sprite counters
signal spriteXCount:    std_logic_vector( 5 downto 0 );
signal spriteYCount:    std_logic_vector( 5 downto 0 );
signal spriteInYRegion: std_logic;
signal pgHSyncPrv:      std_logic;
signal pgVSyncPrv:      std_logic;

type   sgState_T        is ( sgLeft, sgSprite, sgRight );
signal sgState:         sgState_T;


begin


registers: process( all )
begin

   if rising_edge( clock ) then
   
      if reset = '1' then
      
        ready       <= '0';  
        regState    <= rsWaitForRegAccess;
         
        --sprite dpram
        spRamAddrB      <= ( others => '0' );
        spRamWeB        <= '0';
        spRamDataMaskB  <= ( others => '0' );        
        spRamDInB       <= ( others => '0' );
         
        --sprite position
        
        spriteX         <= ( others => '0' );
        spriteY         <= ( others => '0' );
        
        
      else
              
        case regState is
        
        when rsWaitForRegAccess =>
        
            ready <= '0';
            
            if ce = '1' then
            
                --cpu wants to access registers
                
                if a( 15 ) = '0' then
                
                    --sprite regs access
                    
                    case a( 7 downto 0 ) is
                    
                        --0x00 r- id                      
                        when x"00" =>
                    
                            dout  <= x"80000006";   -- sprite gen id
                    
                            ready <= '1';
                    
                        --0x04 r- component version                       
                        when x"01" =>
                    
                            dout  <= x"20240923";
                    
                            ready <= '1';
                    
                        --0x08 rw spriteX
                        when x"02" =>
                        
                            dout <= x"00000" & spriteX;
                            
                            if wr = '1' then
                            
                                spriteX <= din( 11 downto 0 );
                                
                            end if;
                            
                            ready <= '1';
                            
                        --0x0c rw spriteY
                        when x"03" =>
                        
                            dout <= x"00000" & spriteY;
                            
                            if wr = '1' then
                            
                                spriteY <= din( 11 downto 0 );
                                
                            end if;
                            
                            ready <= '1';
                    
                        when others =>
                    
                            dout  <= ( others =>'0' );
                            ready <= '1';
                            
                    end case; --a
                    
                    regState <= rsWaitForBusCycleEnd;
                    
                else   --a( 15 ) = '1'
                    
                    --sprite dpram access
                    
                    spRamAddrB       <= a( 8 downto 0 );
                    spRamDInB        <= din;
                    spRamDataMaskB   <= dataMask;
  
                    if wr = '1' then
  
                        spRamWeB    <= '1';
  
                    else
  
                        spRamWeB    <= '0';
  
                    end if;
                      
                   regState <=  rsSpriteDpRamAccess1;
                    
                              
                end if; --a( 15 ) = '0' or '1'
                
            end if; --ce = '1'                
            
        when rsWaitForBusCycleEnd =>        
            
            --wait for bus cycle to end
            if ce = '0' then
            
                regState <= rsWaitForRegAccess;
                ready <= '0';
                
            end if;
            
        when rsSpriteDpRamAccess1 =>
        
            spRamWeB    <= '0';

            regState <= rsSpriteDpRamAccess2;

        when rsSpriteDpRamAccess2 =>

            ready       <= '1';
            
            dout        <= spRamDOutB;
        
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

spriteGenMain: process( all )

begin

    if rising_edge( sgClock ) then
    
        if reset = '1' then
        
            spRamAddrA      <= ( others => '0' );
            sgR             <= ( others => '0' ); 
            sgG             <= ( others => '0' );
            sgB             <= ( others => '0' );
        
            spriteXCount    <= "100000";
            spriteYCount    <= "100000";
            spriteInYRegion <= '0';
       
            sgState         <= sgLeft;
            pgHSyncPrv      <= '0';
            pgVSyncPrv      <= '0';
                 
        else
            
            pgHSyncPrv  <= pgHSync;
            pgVSyncPrv  <= pgVSync;
        
        
            if pgVSyncPrv = '1' and pgVSync = '0' then
            
                spRamAddrA <= ( others => '0' );

                spriteYCount    <= "100000";
                    
            end if;
                
            if pgHSyncPrv= '1' and pgHSync = '0' then
            
                sgState         <= sgLeft;
            
                spriteXCount    <= "011111";

                if ( unsigned( pgYCount ) >= unsigned( spriteY ) ) and spriteYCount /= "000000" then
                
                    spriteInYRegion <= '1';
                
                else
                
                    spriteInYRegion <= '0';
                
                end if;
                
            
            end if;

                        
            case sgState is
            
                when sgLeft =>
                    
                    sgR             <= ( others => '0' );
                    sgG             <= ( others => '0' );
                    sgB             <= ( others => '0' );

    
                    if ( spriteInYRegion = '1' ) and ( unsigned( pgXCount ) >= unsigned( spriteX ) ) then
                    
                        spriteYCount    <= std_logic_vector( unsigned( spriteYCount ) - 1 ); 
                        spRamAddrA      <= std_logic_vector( unsigned( spRamAddrA ) + 1 );
                        
                        sgState <= sgSprite;
                
                    end if;
                    
                when sgSprite =>
    
    
                    spriteXCount    <= std_logic_vector( unsigned( spriteXCount ) - 1 );

                    sgR             <= spRamDOutA( 15 downto 11 ) & "000";                   
                    sgG             <= spRamDOutA( 10 downto 5  ) & "00"; 
                    sgB             <= spRamDOutA( 4  downto 0  ) & "000";
    
                    
                    if spriteXCount = "000000" then
                        
                        sgState         <= sgRight;
    
                    else
    
                        spRamAddrA      <= std_logic_vector( unsigned( spRamAddrA ) + 1 );
                                            
                    end if;    
                
                when sgRight =>
    
                    sgR             <= ( others => '0' );
                    sgG             <= ( others => '0' );
                    sgB             <= ( others => '0' );
                    
            
            end case; --sgState is
                     
        end if;
    
    end if;
    


end process;


--place sprite dpram
spriteDPRamInst:spriteDPRam
port map(
    clka    => sgClock,
    wea     => "00",
    addra   => spRamAddrA,
    dina    => ( others => '0' ),
    douta   => spRamDOutA,
    
    clkb    => clock,
    web(0)  => spRamWeB and spRamDataMaskB( 0 ),
    web(1)  => spRamWeB and spRamDataMaskB( 1 ),
    web(2)  => spRamWeB and spRamDataMaskB( 2 ),
    web(3)  => spRamWeB and spRamDataMaskB( 3 ),
    addrb   => spRamAddrB,
    dinb    => spRamDInB,
    doutb   => spRamDOutB
);

end Behavioral;
