----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/14/2024 08:45:58 PM
-- Design Name: 
-- Module Name: triangleAreaDivisor - Behavioral
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

entity triangleAreaDivisor is
port(

    reset:              in  std_logic;
    clock:              in  std_logic;
    
    trigger:            in  std_logic;
    triangleArea:       in  std_logic_vector( 31 downto 0 );

    triangleAreaInv:    out std_logic_vector( 31 downto 0 );
    ready:              out std_logic

);
end triangleAreaDivisor;

architecture behavioral of triangleAreaDivisor is

signal    n:    std_logic_vector( 31 downto 0 );
signal    d:    std_logic_vector( 31 downto 0 );

signal    q:    std_logic_vector( 31 downto 0 );
signal    r:    std_logic_vector( 31 downto 0 );

signal    i:    std_logic_vector( 7 downto 0 ); 

type divState_t is ( dsCalc, dsReady );
  
signal divState:  divState_t; 

begin

areaDiv: process( all )

variable rvar:  std_logic_vector( 31 downto 0 ); 

begin

  if reset = '1' then
  
    divState <= dsReady;
    
    
  elsif rising_edge( clock ) then

    if trigger = '1' then

        q <= ( others => '0' );
        r <= ( others => '0' );
    
        i <= x"1f"; --31
        
                 
        n <= x"ffffffff";       
        d <= triangleArea;
          
        divState <= dsCalc;
    
    end if;


    case divState is
      
      when dsCalc =>
      
        ready <= '0';
      
        rvar := r( 30 downto 0 ) & n( to_integer( unsigned( i ) ) );
        
        if signed( rvar ) >= signed( d ) then
          
            rvar := std_logic_vector( unsigned( rvar ) - unsigned( d ) );
            q( to_integer( unsigned( i ) ) ) <= '1';
            
        end if;
        
        r <= rvar;
        
        if i = x"00" then
          
            divState <= dsReady;
            
        else
          
           i <= std_logic_vector( unsigned( i ) - 1 );
           
        end if;
      
        when dsReady =>
      
            ready <= '1';
         
            triangleAreaInv <= q;
             
      
        when others =>
                         
            divState <= dsReady;
          
    end case;
    

  end if; 

end process;


end behavioral;
