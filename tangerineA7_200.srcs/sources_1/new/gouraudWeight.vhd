library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity gouraudWeight is

port(
   --reset
    reset:                          in  std_logic;
    clock:                          in  std_logic;
    
    edge:                           in std_logic_vector( 31 downto 0 );
    areaInv:                        in std_logic_vector( 31 downto 0 );
    
    weight:                         out std_logic_vector( 15 downto 0 )

);

end gouraudWeight;

architecture behavior of gouraudWeight is


begin

gweight: process( all )

variable    edgeMulAreaInv: std_logic_vector( 63 downto 0 );

begin

    if rising_edge( clock ) then

        -- wbal = ( eba * areaNorm ) >> 20; 
        
        edgeMulAreaInv := std_logic_vector( unsigned( edge ) * unsigned( areaInv ) );

        weight <= "0000" & edgeMulAreaInv( 31 downto 20 );
        
    end if;
    
end process;
    

   
end behavior;
