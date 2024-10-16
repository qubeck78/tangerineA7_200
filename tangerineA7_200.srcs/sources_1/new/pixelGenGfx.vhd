library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity pixelGenGfx is

port(
    
    --cpu interface
    reset:            in  std_logic;
    clock:            in  std_logic;
    
    a:                in  std_logic_vector( 15 downto 0 );
    din:              in  std_logic_vector( 31 downto 0 );
    dout:             out std_logic_vector( 31 downto 0 );
    
    ce:               in  std_logic;
    wr:               in  std_logic;
    dataMask:         in  std_logic_vector( 3 downto 0 );
    
    ready:            out std_logic;
    
    --pixel clock
    pggClock:         in  std_logic;
   
    --video out
    pggR:             out std_logic_vector( 7 downto 0 );
    pggG:             out std_logic_vector( 7 downto 0 );
    pggB:             out std_logic_vector( 7 downto 0 );

    --gfx buffer ram
    gfxBufRamDOut:    in  std_logic_vector( 31 downto 0 );
    gfxBufRamRdA:     out std_logic_vector( 8 downto 0 );

    --2 dma requests
    pggDMARequest:    out std_logic_vector( 1 downto 0 );
   
    --sync gen inputs
    pgVSync:          in  std_logic;
    pgHSync:          in  std_logic;
    pgDe:             in  std_logic;
    pgXCount:         in  std_logic_vector( 11 downto 0 );
    pgYCount:         in  std_logic_vector( 11 downto 0 );
    pgDeX:            in  std_logic;
    pgDeY:            in  std_logic;
    pgPreFetchLine:   in  std_logic;
    pgFetchEnable:    in  std_logic;
   
    -- 00 : 320x240x16
    -- 01 : 640x480x16
    -- 10 : 320x240x8 ( palette )
    pgVideoMode:      in  std_logic_vector( 1 downto 0 );
   
    pgEnabled:        in  std_logic
);

end pixelGenGfx;

architecture behavior of pixelGenGfx is

--components

component gfxPaletteRam is
port(
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(23 DOWNTO 0);
    clkb : IN STD_LOGIC;
    web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addrb : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    dinb : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
    doutb : OUT STD_LOGIC_VECTOR(23 DOWNTO 0)
);
end component;


--signals

type pggState_T is ( mDisabled,
                     m1pre0, m1pre1, m1pre2, m1pre3, m1pre4, m1pre5, m1pre6, m1p0, m1p1, m1p2, m1p3, m1post0, m1post1, m1post2, m1post3, m1hblank,
                     m2pre0, m2pre1, m2pre2, m2pre3, m2pre4, m2pre5, m2pre6, m2p0, m2p1, m2hblank,
                     m3pre0, m3pre1, m3pre2, m3pre3, m3pre4, m3pre5, m3pre6, m3p0, m3p1, m3p2, m3p3, m3p4, m3p5, m3p6, m3p7, m3post0, m3post1, 
                     m3post2, m3post3, m3hblank
);

signal pggState:                 pggState_T;
signal pggGfxBufAddressCounter:  std_logic_vector( 8 downto 0 );
signal pggLineCounter:           std_logic_vector( 1 downto 0 );
signal pggPixelData:             std_logic_vector( 31 downto 0 );

--registers 
type   regState_T       is ( rsWaitForRegAccess, rsWaitForBusCycleEnd, rsPaletteRamAccess1, rsPaletteRamAccess2 );
signal regState:        regState_T;


--palette dpram, cpu side

signal paletteRamAddrB:     std_logic_vector( 7 downto 0 );
signal paletteRamWeB:       std_logic;
signal paletteRamDInB:      std_logic_vector( 23 downto 0 );
signal paletteRamDOutB:     std_logic_vector( 23 downto 0 );

--palette dpram pixel gen side
signal paletteRamAddrA:     std_logic_vector( 7 downto 0 );
signal paletteRamDOutA:     std_logic_vector( 23 downto 0 );


begin

registers: process( all )
begin

   if rising_edge( clock ) then
   
      if reset = '1' then
      
        ready       <= '0';  
        regState    <= rsWaitForRegAccess;
         
        --palette dpram
        paletteRamAddrB      <= ( others => '0' );
        paletteRamWeB        <= '0';
        paletteRamDInB       <= ( others => '0' );
         
        
        
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
                    
                            dout  <= x"80000008";   -- gfx pixel gen gen id
                    
                            ready <= '1';
                    
                        --0x04 r- component version                       
                        when x"01" =>
                    
                            dout  <= x"20241010";
                    
                            ready <= '1';
                                        
                        when others =>
                    
                            dout  <= ( others =>'0' );
                            ready <= '1';
                            
                    end case; --a
                    
                    regState <= rsWaitForBusCycleEnd;
                    
                else   --a( 15 ) = '1'
                    
                    --sprite dpram access
                    
                    paletteRamAddrB     <= a( 7 downto 0 );
                    paletteRamDInB      <= din( 23 downto 0 );
  
                    if wr = '1' then
  
                        paletteRamWeB    <= '1';
  
                    else
  
                        paletteRamWeB    <= '0';
  
                    end if;
                      
                   regState <=  rsPaletteRamAccess1;
                    
                              
                end if; --a( 15 ) = '0' or '1'
                
            end if; --ce = '1'                
            
        when rsWaitForBusCycleEnd =>        
            
            --wait for bus cycle to end
            if ce = '0' then
            
                regState <= rsWaitForRegAccess;
                ready <= '0';
                
            end if;
            
        when rsPaletteRamAccess1 =>
        
            paletteRamWeB   <= '0';

            regState <= rsPaletteRamAccess2;

        when rsPaletteRamAccess2 =>

            ready       <= '1';
            
            dout        <= x"00" & paletteRamDOutB;
        
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


pixelGenGfx: process( all )

begin

  if rising_edge( pggClock ) then

     if reset = '1' then

        pggState                <= m1pre0;
        pggGfxBufAddressCounter <= ( others => '0' );
        pggLineCounter          <= ( others => '0' );
        pggPixelData            <= ( others => '0' );            
        pggDMARequest           <= ( others => '0' );

        paletteRamAddrA         <= ( others => '0' );
        
     else
     
        case pggState is
            
           ----------------------------------------------
           --pixel gen gfx is disabled, 
           --no dma requests are generated
           when mDisabled =>

                pggR <= ( others => '0' );
                pggG <= ( others => '0' );
                pggB <= ( others => '0' );

                pggDMARequest  <= "00";

                if pgEnabled = '1' then

                    
                    -- pixel gen gfx has been enabled
                    -- select state according to gfx mode selected

                    case pgVideoMode is
                    
                        when "00" =>
                        
                            pggState <= m1pre0;
                            
                        when "01" =>
                        
                            pggState <= m2pre0;
                    
                        when "10" =>

                            pggState <= m3pre0;
                        
                        when others =>
                        
                            pggState <= mDisabled;
                        
                    end case;
                    

                end if;

           ----------------------------------------------
           --mode 1: 320x240x16
           --wait for fetch enable
           
           --7 prefetch states to match 8 clock cycles between fetch enable and display enable
           when m1pre0 =>             
           
              pggR <= ( others => '0' );
              pggG <= ( others => '0' );
              pggB <= ( others => '0' );

              
              --pass dma request for first displayed line
              if pgPreFetchLine = '1' then
              
                 --fill lower line
                 
                 pggDMARequest  <= "01";

                 --clear line counter for doubling lo-res lines
                 pggLineCounter <= ( others => '0' );
                 
              else
              
                 pggDMARequest  <= "00";
              
              end if;
              
           
              if pgFetchEnable = '1' then
                
                    --pre fetch first data
                    
                    --reset line buf address counter
                    pggGfxBufAddressCounter <= ( others => '0' );

                    pggState <= m1pre1;

             end if;
           
              --check if not disabled
              --switch mode if necesary               
              if pgEnabled = '0' or pgVideoMode /= "00" then

                 pggState    <= mDisabled;

              end if;

           when m1pre1 =>
              gfxBufRamRdA   <= pggLineCounter( 1 ) & pggGfxBufAddressCounter( 7 downto 0 );
              
              pggState <= m1pre2;
           
           when m1pre2 =>
              
              --dma requests
              if pggLineCounter( 0 ) = '0' then
              
                 if pggLineCounter( 1 ) = '0' then
              
                    --display lower buffer half, fill upper
                 
                    pggDMARequest  <= "10";
                 
                 else
                 
                    --display upper buffer half, fill lower
                 
                    pggDMARequest  <= "01";
                 
                 end if;
              
              end if;
              
              pggState <= m1pre3;
              
           when m1pre3 =>
           
              pggPixelData   <= gfxBufRamDOut;
              pggGfxBufAddressCounter <= pggGfxBufAddressCounter + 1;
              
              pggState <= m1pre4;
              
           when m1pre4 =>
           
              --clear dma request
              pggDMARequest  <= ( others => '0' );
           
              pggState <= m1pre5;
           
           when m1pre5 =>
           
              pggState <= m1pre6;
              
           when m1pre6 =>
           
           
              pggState <= m1p0;
              
           when m1p0 =>

              pggR     <= pggPixelData( 15 downto 11 ) & "000";
              pggG     <= pggPixelData( 10 downto 5  ) & "00";                  
              pggB     <= pggPixelData( 4  downto 0  ) & "000";
           
              gfxBufRamRdA   <= pggLineCounter( 1 ) & pggGfxBufAddressCounter( 7 downto 0 );
              
              pggState <= m1p1;
              
           when m1p1 =>
           
              pggGfxBufAddressCounter <= pggGfxBufAddressCounter + 1;
              
              pggState <= m1p2;

           when m1p2 =>
           
              pggR     <= pggPixelData( 31 downto 27 ) & "000";
              pggG     <= pggPixelData( 26 downto 21 ) & "00";                  
              pggB     <= pggPixelData( 20 downto 16 ) & "000";

                    
              pggState <= m1p3;

           when m1p3 =>
           
              pggPixelData <= gfxBufRamDOut;
           
              if pgFetchEnable = '1' then

                    pggState <= m1p0;

                else

                    pggState <= m1post0;

                end if;
                
                
           when m1post0 =>

--                RiscV
              pggR     <= pggPixelData( 15 downto 11 ) & "000";
              pggG     <= pggPixelData( 10 downto 5  ) & "00";                  
              pggB     <= pggPixelData( 4  downto 0  ) & "000";

              pggState <= m1post1;
              
           when m1post1 =>
           
              pggState <= m1post2;
              
           when m1post2 =>

--                RiscV
              pggR     <= pggPixelData( 31 downto 27 ) & "000";
              pggG     <= pggPixelData( 26 downto 21 ) & "00";                  
              pggB     <= pggPixelData( 20 downto 16 ) & "000";


              pggState <= m1post3;
              
           when m1post3 =>

              pggState <= m1hblank;
           
           when m1hblank =>
           
              --inc line counter
              pggLineCounter <= pggLineCounter + 1;
           
              pggR <= ( others => '0' );
              pggG <= ( others => '0' );
              pggB <= ( others => '0' );
              
              pggState <= m1pre0;

           
           ----------------------------------------------
           --mode 2: 640x480x16
           
           --wait for fetch enable
           --7 prefetch states to match 8 clock cycles between fetch enable and display enable
           when m2pre0 =>
           
              pggR <= ( others => '0' );
              pggG <= ( others => '0' );
              pggB <= ( others => '0' );

              
              --pass dma request for first displayed line
              if pgPreFetchLine = '1' then
              
                 --fill lower line
                 
                 pggDMARequest  <= "01";
                 
              else
              
                 pggDMARequest  <= "00";
              
              end if;

              --reset line buf address counter
              pggGfxBufAddressCounter <= ( others => '0' );
              
           
              if pgFetchEnable = '1' then
                
                    --pre fetch first data
                    pggState <= m2pre1;

             end if;


              --check if not disabled
              --switch mode if necesary               
              if pgEnabled = '0' or pgVideoMode /= "01" then

                 pggState    <= mDisabled;

              end if;
           
           when m2pre1 =>

              gfxBufRamRdA            <= pggGfxBufAddressCounter;
              pggGfxBufAddressCounter <= pggGfxBufAddressCounter + 1;
              
              pggState <= m2pre2;
           
           when m2pre2 =>
              
              --dma requests
              
              --display lower buffer half, fill upper
                 
              pggDMARequest  <= "10";
                                   
              pggState <= m2pre3;
              
           when m2pre3 =>
           
              pggPixelData            <= gfxBufRamDOut;   
              gfxBufRamRdA            <= pggGfxBufAddressCounter;

              pggState <= m2pre4;
              
           when m2pre4 =>
           
              --clear dma request
              pggDMARequest  <= ( others => '0' );
           
              pggState <= m2pre5;
           
           when m2pre5 =>
           
              pggState <= m2pre6;
              
           when m2pre6 =>
           
           
              pggState <= m2p0;
              
           when m2p0 =>
           
--                RISCV
              pggR     <= pggPixelData( 15 downto 11 ) & "000";
              pggG     <= pggPixelData( 10 downto 5  ) & "00";                  
              pggB     <= pggPixelData( 4  downto 0  ) & "000";          
              
              
              --display higher buffer half, fill lower
              --middle acreen is 48 + 640 / 2 = 368 - 1 px
              --adjust this when video timings changed 
              if pgXCount( 11 downto 1 ) = "00010110111" then

                 --fetch lowe buffer part
                 pggDMARequest           <= "01";

                 --switch data fetch address to higher buffer part
                 pggGfxBufAddressCounter <= "100000001";
                 gfxBufRamRdA            <= "100000000";
                 
              else
              
                 gfxBufRamRdA            <= pggGfxBufAddressCounter;
                 pggGfxBufAddressCounter <= pggGfxBufAddressCounter + 1;

                 pggDMARequest  <= "00";
              
              end if;
              
              pggState <= m2p1;

           when m2p1 =>
           
              pggR     <= pggPixelData( 31 downto 27 ) & "000";
              pggG     <= pggPixelData( 26 downto 21 ) & "00";                  
              pggB     <= pggPixelData( 20 downto 16 ) & "000";

              pggPixelData <= gfxBufRamDOut;
              
              if pgDeX = '1' then

                    pggState <= m2p0;

              else

                    pggState <= m2hblank;

              end if;
                
                
           
           when m2hblank =>
           
           
              pggR <= ( others => '0' );
              pggG <= ( others => '0' );
              pggB <= ( others => '0' );
              
              pggState <= m2pre0;
           
           ----------------------------------------------
           --mode 3: 320x240x8
           --wait for fetch enable
           
           --7 prefetch states to match 8 clock cycles between fetch enable and display enable
           when m3pre0 =>             
           
              pggR <= ( others => '0' );
              pggG <= ( others => '0' );
              pggB <= ( others => '0' );

              
              --pass dma request for first displayed line
              if pgPreFetchLine = '1' then
              
                 --fill lower line
                 
                 pggDMARequest  <= "01";

                 --clear line counter for doubling lo-res lines
                 pggLineCounter <= ( others => '0' );
                 
              else
              
                 pggDMARequest  <= "00";
              
              end if;
              
           
              if pgFetchEnable = '1' then
                
                    --pre fetch first data
                    
                    --reset line buf address counter
                    pggGfxBufAddressCounter <= ( others => '0' );

                    pggState <= m3pre1;

             end if;
           
              --check if not disabled
              --switch mode if necesary               
              if pgEnabled = '0' or pgVideoMode /= "10" then

                 pggState    <= mDisabled;

              end if;

           when m3pre1 =>
           
              gfxBufRamRdA   <= pggLineCounter( 1 ) & pggGfxBufAddressCounter( 7 downto 0 );
              
              pggState <= m3pre2;
           
           when m3pre2 =>
              
              --dma requests
              if pggLineCounter( 0 ) = '0' then
              
                 if pggLineCounter( 1 ) = '0' then
              
                    --display lower buffer half, fill upper
                 
                    pggDMARequest  <= "10";
                 
                 else
                 
                    --display upper buffer half, fill lower
                 
                    pggDMARequest  <= "01";
                 
                 end if;
              
              end if;
              
              pggState <= m3pre3;
              
           when m3pre3 =>
           
              pggPixelData   <= gfxBufRamDOut;
              pggGfxBufAddressCounter <= pggGfxBufAddressCounter + 1;
              
              pggState <= m3pre4;
              
           when m3pre4 =>
           
              --clear dma request
              pggDMARequest  <= ( others => '0' );
           
              paletteRamAddrA   <= pggPixelData( 7 downto 0 );
              
              pggState <= m3pre5;
           
           when m3pre5 =>
           
              pggState <= m3pre6;
              
           when m3pre6 =>
           
           
              pggState <= m3p0;
              
           when m3p0 =>


              paletteRamAddrA   <= pggPixelData( 15 downto 8 );

              --7-0
              pggR     <= paletteRamDOutA( 23 downto 16 );
              pggG     <= paletteRamDOutA( 15 downto 8  );                  
              pggB     <= paletteRamDOutA( 7  downto 0  );
           
              gfxBufRamRdA   <= pggLineCounter( 1 ) & pggGfxBufAddressCounter( 7 downto 0 );
              
              pggState <= m3p1;
              
           when m3p1 =>
           
              pggGfxBufAddressCounter <= pggGfxBufAddressCounter + 1;
              
              pggState <= m3p2;

           when m3p2 =>
           
              paletteRamAddrA   <= pggPixelData( 23 downto 16 );

              pggR     <= paletteRamDOutA( 23 downto 16 );
              pggG     <= paletteRamDOutA( 15 downto 8  );                  
              pggB     <= paletteRamDOutA( 7  downto 0  );

                    
              pggState <= m3p3;

           when m3p3 =>

              pggState <= m3p4;

           when m3p4 =>
           
              paletteRamAddrA   <= pggPixelData( 31 downto 24 );

              pggR     <= paletteRamDOutA( 23 downto 16 );
              pggG     <= paletteRamDOutA( 15 downto 8  );                  
              pggB     <= paletteRamDOutA( 7  downto 0  );

                    
              pggState <= m3p5;

           when m3p5 =>

              pggPixelData <= gfxBufRamDOut;

              pggState <= m3p6;

           when m3p6 =>
           
              paletteRamAddrA   <= pggPixelData( 7 downto 0 );

              pggR     <= paletteRamDOutA( 23 downto 16 );
              pggG     <= paletteRamDOutA( 15 downto 8  );                  
              pggB     <= paletteRamDOutA( 7  downto 0  );

                    
              pggState <= m3p7;

           when m3p7 =>
           
           
              if pgFetchEnable = '1' then

                    pggState <= m3p0;

                else

                    pggState <= m3post0;

                end if;
                
           --todo: adjust post states     
           when m3post0 =>

              pggR     <= ( others => '0' );
              pggG     <= ( others => '0' );                  
              pggB     <= ( others => '0' );

              pggState <= m3post1;
              
           when m3post1 =>
           
              pggState <= m3post2;
              
           when m3post2 =>

              pggState <= m3post3;
              
           when m3post3 =>

              pggState <= m3hblank;
           
           when m3hblank =>
           
              --inc line counter
              pggLineCounter <= pggLineCounter + 1;
                         
              pggState <= m3pre0;
           
           
           when others =>
           
              pggState <= m1pre0;
        
        end case;
     
     end if;
     
  end if;

end process;


--place palette ram

gfxPaletteRamInst:gfxPaletteRam
port map(

    --gfx pixel gen side
    clka    => pggClock,
    wea(0)  => '0',
    addra   => paletteRamAddrA,
    dina    => ( others => '0' ),
    douta   => paletteRamDOutA,

    --cpu side    
    clkb    => clock,
    web(0)  => paletteRamWeB,
    addrb   => paletteRamAddrB,
    dinb    => paletteRamDinB,
    doutb   => paletteRamDoutB
);


end behavior;
