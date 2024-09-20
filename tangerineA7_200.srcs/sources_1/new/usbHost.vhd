library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity usbHost is

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
   
   --usb clock (12MHz)
   usbHClk:          in    std_logic;
   
   --usb interfaces
   --keyboard
   usbH0Dp:          inout std_logic;     
   usbH0Dm:          inout std_logic;      

   --mouse
   usbH1Dp:          inout std_logic;     
   usbH1Dm:          inout std_logic      

);
end usbHost;


architecture behavior of usbHost is

-- components

-- usb hid host
component usb_hid_host is
port(
    usbclk:         in std_logic;                       --12MHz clock
    usbrst_n:       in std_logic;                       --reset
    usb_dm:         inout std_logic; 
    usb_dp:         inout std_logic;                    --USB D- and D+
    typ:            out std_logic_vector( 1 downto 0 ); --device type. 0: no device, 1: keyboard, 2: mouse, 3: gamepad
    
    reportPulse:    out std_logic;                      --pulse after report received from device. 
                                                        --key_*, mouse_*, game_* valid depending on typ
    conerr:         out std_logic;                      --connection or protocol error

    --keyboard
    key_modifiers:  out std_logic_vector( 7 downto 0 );
    key1:           out std_logic_vector( 7 downto 0 );
    key2:           out std_logic_vector( 7 downto 0 );
    key3:           out std_logic_vector( 7 downto 0 );
    key4:           out std_logic_vector( 7 downto 0 );

    --mouse
    mouse_btn:      out std_logic_vector( 7 downto 0 ); --{5'bx, middle, right, left}
    mouse_dx:       out std_logic_vector( 7 downto 0 ); --signed 8-bit, cleared after `report` pulse
    mouse_dy:       out std_logic_vector( 7 downto 0 ); --signed 8-bit, cleared after `report` pulse

    --gamepad 
    game_l:         out std_logic;
    game_r:         out std_logic;
    game_u:         out std_logic;
    game_d:         out std_logic;                      --left right up down
    game_a:         out std_logic;
    game_b:         out std_logic;
    game_x:         out std_logic;
    game_y:         out std_logic;
    game_sel:       out std_logic;
    game_sta:       out std_logic;                      --buttons

    --debug
    dbg_hid_report: out std_logic_vector( 63 downto 0 ) --last HID report
);
end component; 


COMPONENT keyboardFifo
  PORT (
    rst : IN STD_LOGIC;
    wr_clk : IN STD_LOGIC;
    rd_clk : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC;
    wr_rst_busy : OUT STD_LOGIC;
    rd_rst_busy : OUT STD_LOGIC 
  );
END COMPONENT; 

--signals

--registers signals
type usbhRegState_T is ( usbhrWaitForRegAccess, usbhrWaitForBusCycleEnd );
signal usbhRegState:       usbhRegState_T;

--usb host signals

signal usbH0Type:          std_logic_vector( 1 downto 0 );
signal usbH0ReportPulse:   std_logic;
signal usbH0KeyModifiers:  std_logic_vector( 7 downto 0 );
signal usbH0Key1:          std_logic_vector( 7 downto 0 );
signal usbH0Key2:          std_logic_vector( 7 downto 0 );
signal usbH0Key3:          std_logic_vector( 7 downto 0 );
signal usbH0Key4:          std_logic_vector( 7 downto 0 );

signal usbH1Type:          std_logic_vector( 1 downto 0 );
signal usbH1ReportPulse:   std_logic;
signal usbH1MouseBtn:      std_logic_vector( 7 downto 0 );
signal usbH1MouseDx:       std_logic_vector( 7 downto 0 );
signal usbH1MouseDy:       std_logic_vector( 7 downto 0 );

--keyboard fifo sync signals
type fifoHidKeyboardSyncState_T is ( fksIdle, fksWaitForPulseRelease );
type fifoHidMouseSyncState_T is ( fmsIdle, fmsWaitForPulseRelease, fmsCalcMousePosition );
signal fifoHidKeyboardSyncState:    fifoHidKeyboardSyncState_T;
signal fifoHidMouseSyncState:       fifoHidMouseSyncState_T;



--keyboard fifo signals
signal fifoHidKeyboardRdEn:     std_logic;
signal fifoHidKeyboardWrEn:     std_logic;
signal fifoHidKeyboardDataOut:  std_logic_vector( 31 downto 0 );
signal fifoHidKeyboardDataIn:   std_logic_vector( 31 downto 0 );
signal fifoHidKeyboardEmpty:    std_logic;
signal fifoHidKeyboardFull:     std_logic; 

--mouse signals

signal hidMouseX:               std_logic_vector( 31 downto 0 );
signal hidMouseY:               std_logic_vector( 31 downto 0 );

signal hidMouseXReset:          std_logic;
signal hidMouseYReset:          std_logic;

signal hidMouseButtons:         std_logic_vector( 7 downto 0 );

signal usbH1MouseDxLatched:     std_logic_vector( 7 downto 0 );
signal usbH1MouseDyLatched:     std_logic_vector( 7 downto 0 );

begin


registers: process( all )
   begin

      if rising_edge( clock ) then
      
         if reset = '1' then
         
            fifoHidKeyboardRdEn <= '0';
                        
            hidMouseXReset      <= '0';
            hidMouseYReset      <= '0';
            
            ready               <= '0';  
            usbhRegState        <= usbhrWaitForRegAccess;           
            
         else
         
         
            fifoHidKeyboardRdEn <= '0';
            
            hidMouseXReset      <= '0';
            hidMouseYReset      <= '0';

            case usbhRegState is
      
                when usbhrWaitForRegAccess =>
            
                    if ce = '1' then
                  
                    --cpu wants to access registers
                  
                    ready <= '0';
                     
                    case a( 7 downto 0 ) is
                     
                        --0x00 r- id                      
                        when x"00" =>
                     
                            dout  <= x"80000004";   -- usb hid host id
                        
                            ready <= '1';
                        
                        --0x04 r- component version                       
                        when x"01" =>
                     
                            dout  <= x"20240920";
                        
                            ready <= '1';
                            
                        --0x08 r- usbHidKeyboardStatus                     
                        when x"02" =>
                        
                           dout <= x"0000000" & "00" & fifoHidKeyboardFull & fifoHidKeyboardEmpty;

                           ready <= '1';

                        --0x0c r- usbHidKeyboardData                    
                        when x"03" =>
                        
                           dout                 <= fifoHidKeyboardDataOut;
                           fifoHidKeyboardRdEn  <= '1'; 

                           ready                <= '1';                       

                        --0x10 r- usbHidMouseX
                        when x"04" =>
                                                    
                            dout            <= hidMouseX;
                            hidMouseXReset  <= '1';

                            ready           <= '1';
                        
                        --0x14 r- usbHidMouseY    
                        when x"05" =>
                        
                            dout            <= hidMouseY;
                            hidMouseYReset  <= '1';
                        
                            ready           <= '1';
                            
                        --0x18 r- usbHidMouseButtons
                        when x"06" =>
                            
                            dout    <= x"000000" & hidMouseButtons;
                            ready   <= '1';
                            
                        when others =>
                        
                           dout  <= ( others => '0' );
                           ready <= '1';
                           
                     end case; -- a( 7 downto 0 ) is
                     
                     usbhRegState <= usbhrWaitForBusCycleEnd;
                  
                  end if; -- ce = '1';
                  
               when usbhrWaitForBusCycleEnd =>
               
                  --wait for bus cycle to end
                  if ce = '0' then
                  
                     usbhRegState <= usbhrWaitForRegAccess;
                     ready <= '0';
                     
                  end if;
                  
               when others =>
               
                  usbhRegState <= usbhrWaitForRegAccess;
                  
            end case; --usbhRegState is

         end if; --reset = '1'
   
      end if;--rising_edge( clock )
         
   end process;
      
      
--usb keyboard fifo sync process
fifoHidKeyboardSync: process( all )
begin
    if rising_edge( clock ) then

        if reset = '1' then

            fifoHidKeyboardWrEn         <= '0';
            fifoHidKeyboardDataIn       <= ( others => '0' );
            fifoHidKeyboardSyncState    <= fksIdle;
        else
            
           
            case fifoHidKeyboardSyncState is

                when fksIdle =>
                    
                    fifoHidKeyboardWrEn         <= '0';

                    fifoHidKeyboardDataIn       <= usbH0KeyModifiers & usbH0Key3 & usbH0Key2 & usbH0Key1;

                    if usbH0ReportPulse = '1' and usbH0Type = "01" then
                        fifoHidKeyboardSyncState  <= fksWaitForPulseRelease;
                        fifoHidKeyboardWrEn       <= '1';
                    end if;

                when fksWaitForPulseRelease =>

                    fifoHidKeyboardWrEn         <= '0';

                    if usbH0ReportPulse = '0' then
                        fifoHidKeyboardSyncState  <= fksIdle;
                    end if;
               
               when others =>
                  
                  fifoHidKeyboardSyncState  <= fksIdle;
            
            end case;

        end if;

    end if;

end process;  


--type fifoHidMouseSyncState_T is ( fmsIdle, fmsWaitForPulseRelease, fmsCalcMousePosition );
--signal fifoHidKeyboardSyncState:    fifoHidKeyboardSyncState_T;

--usb mouse sync process
fifoHidMouseSync: process( all )
begin
    if rising_edge( clock ) then

        if reset = '1' then
            
            hidMouseButtons         <= ( others => '0' );
            usbH1MouseDxLatched     <= ( others => '0' );
            usbH1MouseDyLatched     <= ( others => '0' );
            
            hidMouseX           <= ( others => '0' );
            hidMouseY           <= ( others => '0' );
            hidMouseButtons     <= ( others => '0' );
        
            fifoHidMouseSyncState   <= fmsIdle;

        else
            
            if hidMouseXReset  = '1' then
                
                hidMouseX           <= ( others => '0' );
            
            end if;

            if hidMouseYReset  = '1' then
                
                hidMouseY           <= ( others => '0' );
            
            end if;

            case fifoHidMouseSyncState is

                when fmsIdle =>
                    
                    if usbH1ReportPulse = '1' and usbH1Type = "10" then
                    
                        hidMouseButtons         <= usbH1MouseBtn;
                        usbH1MouseDxLatched     <= usbH1MouseDx;
                        usbH1MouseDyLatched     <= usbH1MouseDy;
                    
                        fifoHidMouseSyncState   <= fmsWaitForPulseRelease;
                    end if;

                when fmsWaitForPulseRelease =>

                    if usbH1ReportPulse = '0' then
                        
                        fifoHidMouseSyncState  <= fmsCalcMousePosition;
                        
                    end if;

                when fmsCalcMousePosition =>
               
                    hidMouseX               <= std_logic_vector( signed( hidMouseX ) + signed( usbH1MouseDxLatched ) );
                    hidMouseY               <= std_logic_vector( signed( hidMouseY ) + signed( usbH1MouseDyLatched ) );
                      
                    fifoHidMouseSyncState   <= fmsIdle;

               when others =>
                  
                    fifoHidMouseSyncState   <= fmsIdle;
            
            end case;

        end if;

    end if;

end process;  


-- place usb host0
usb_hid_host0Inst:usb_hid_host
port map(
    usbclk          => usbHClk,
    usbrst_n        => not reset,
    usb_dm          => usbH0Dm, 
    usb_dp          => usbh0Dp,
    typ             => usbH0Type,
    
    reportPulse     => usbH0ReportPulse,

    --keyboard
    key_modifiers   => usbH0KeyModifiers,
    key1            => usbH0Key1,
    key2            => usbH0Key2,
    key3            => usbH0Key3,
    key4            => usbH0Key4

    --conerr:         out std_logic;                      --connection or protocol error

    --mouse
    --mouse_btn       => usbH0MouseBtn,
    --mouse_dx        => usbH0MouseDx,
    --mouse_dy        => usbH0MouseDy,

    ----debug
    --dbg_hid_report  => usbH0HidReport

);

-- place usb host1
usb_hid_host1Inst:usb_hid_host
port map(
    usbclk          => usbHClk,
    usbrst_n        => not reset,
    usb_dm          => usbH1Dm, 
    usb_dp          => usbh1Dp,
    typ             => usbH1Type,
    
    reportPulse     => usbH1ReportPulse,

    --keyboard
--    key_modifiers   => usbH0KeyModifiers,
--    key1            => usbH0Key1,
--    key2            => usbH0Key2,
--    key3            => usbH0Key3,
--    key4            => usbH0Key4

    --conerr:         out std_logic;                      --connection or protocol error

    --mouse
    mouse_btn       => usbH1MouseBtn,
    mouse_dx        => usbH1MouseDx,
    mouse_dy        => usbH1MouseDy

    ----debug
    --dbg_hid_report  => usbH0HidReport

);

--place keyboard fifo

keyboardFifoinst:keyboardFifo
port map(
    rst         => reset,
    wr_clk      => clock,
    rd_clk      => clock,
    din         => fifoHidKeyboardDataIn,
    wr_en       => fifoHidKeyboardWrEn,
    rd_en       => fifoHidKeyboardRdEn,
    dout        => fifoHidKeyboardDataOut,
    full        => fifoHidKeyboardFull,
    empty       => fifoHidKeyboardEmpty
);


end behavior;
