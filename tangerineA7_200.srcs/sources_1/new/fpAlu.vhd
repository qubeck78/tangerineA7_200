library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fpAlu is
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
   
   ready:            out   std_logic
   
);
end fpAlu;


architecture behavior of fpAlu is


--signals

--registers signals
type    regState_T is ( rsWaitForRegAccess, rsWaitForBusCycleEnd );
signal  regState:       regState_T;


begin


registers: process( all )
   begin

      if rising_edge( clock ) then
      
         if reset = '1' then
         
            
            ready               <= '0';  
            regState            <= rsWaitForRegAccess;           
            
         else
         
            case regState is
      
                when rsWaitForRegAccess =>
            
                    if ce = '1' then
                  
                    --cpu wants to access registers
                  
                    ready <= '0';
                     
                    case a( 7 downto 0 ) is
                     
                        --0x00 r- id                      
                        when x"00" =>
                     
                            dout  <= x"80000009";   -- fpalu id
                        
                            ready <= '1';
                        
                        --0x04 r- component version                       
                        when x"01" =>
                     
                            dout  <= x"20241227";
                        
                            ready <= '1';
                            
                            
                        when others =>
                        
                           dout  <= ( others => '0' );
                           ready <= '1';
                           
                     end case; -- a( 7 downto 0 ) is
                     
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

         end if; --reset = '1'
   
      end if;--rising_edge( clock )
         
   end process;
      
     

end behavior;
