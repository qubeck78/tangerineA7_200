----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/02/2024 08:18:37 AM
-- Design Name: 
-- Module Name: boundingBox - Behavioral
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

entity boundingBox is
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
end boundingBox;

architecture Behavioral of boundingBox is

signal  bbXMinS1:   std_logic_vector( 15 downto 0 );
signal  bbXMinS2:   std_logic_vector( 15 downto 0 );
signal  bbXMinS3:   std_logic_vector( 15 downto 0 );

signal  bbXMaxS1:   std_logic_vector( 15 downto 0 );
signal  bbXMaxS2:   std_logic_vector( 15 downto 0 );
signal  bbXMaxS3:   std_logic_vector( 15 downto 0 );

signal  bbYMinS1:   std_logic_vector( 15 downto 0 );
signal  bbYMinS2:   std_logic_vector( 15 downto 0 );
signal  bbYMinS3:   std_logic_vector( 15 downto 0 );

signal  bbYMaxS1:   std_logic_vector( 15 downto 0 );
signal  bbYMaxS2:   std_logic_vector( 15 downto 0 );
signal  bbYMaxS3:   std_logic_vector( 15 downto 0 );

begin

bboxCalc: process( all )
begin

    if rising_edge( clock ) then
       
        --todo: detect if triangle coordinates are beyond bounding box
            
        --xmin
        if signed( bbXMaxReg ) < signed( aXReg ) then
        
            bbXMinS1 <= bbXMaxReg;
            
        else
        
            bbXMinS1 <= aXReg;
            
        end if;
        
        if signed( bbXMinS1 ) < signed( bXReg ) then
        
            bbXMinS2 <= bbXMinS1; 
       
        else
        
            bbXMinS2 <= bXReg;
            
        end if;
    
        if signed( bbXMinS2 ) < signed( cXReg ) then
        
            bbXMinS3 <= bbXMinS2; 
       
        else
        
            bbXMinS3 <= cXReg;
            
        end if;

        --xmax
        if signed( bbXMinReg ) > signed( aXReg ) then
        
            bbXMaxS1 <= bbXMinReg;
            
        else
        
            bbXMaxS1 <= aXReg;
            
        end if;
        
        if signed( bbXMaxS1 ) > signed( bXReg ) then
        
            bbXMaxS2 <= bbXMaxS1; 
       
        else
        
            bbXMaxS2 <= bXReg;
            
        end if;
    
        if signed( bbXMaxS2 ) > signed( cXReg ) then
        
            bbXMaxS3 <= bbXMaxS2; 
       
        else
        
            bbXMaxS3 <= cXReg;
            
        end if;
    

        --ymin
        if signed( bbYMaxReg ) < signed( aYReg ) then
        
            bbYMinS1 <= bbYMaxReg;
            
        else
        
            bbYMinS1 <= aYReg;
            
        end if;
        
        if signed( bbYMinS1 ) < signed( bYReg ) then
        
            bbYMinS2 <= bbYMinS1; 
       
        else
        
            bbYMinS2 <= bYReg;
            
        end if;
    
        if signed( bbYMinS2 ) < signed( cYReg ) then
        
            bbYMinS3 <= bbYMinS2; 
       
        else
        
            bbYMinS3 <= cYReg;
            
        end if;

        --ymax
        if signed( bbYMinReg ) > signed( aYReg ) then
        
            bbYMaxS1 <= bbYMinReg;
            
        else
        
            bbYMaxS1 <= aYReg;
            
        end if;
        
        if signed( bbYMaxS1 ) > signed( bYReg ) then
        
            bbYMaxS2 <= bbYMaxS1; 
       
        else
        
            bbYMaxS2 <= bYReg;
            
        end if;
    
        if signed( bbYMaxS2 ) > signed( cYReg ) then
        
            bbYMaxS3 <= bbYMaxS2; 
       
        else
        
            bbYMaxS3 <= cYReg;
            
        end if;
    
        --check if result in bounds
    
        --xmin
        if signed( bbXMinS3 ) < signed( bbXMinReg ) then
        
            bbXMinOut   <= bbXMinReg;
            
        else
        
            bbXMinOut   <= bbXMinS3;
            
        end if;    
    
        --ymin
        if signed( bbYMinS3 ) < signed( bbYMinReg ) then
        
            bbYMinOut   <= bbYMinReg;
            
        else
        
            bbYMinOut   <= bbYMinS3;
            
        end if;    


        --xmax 
        if signed( bbXMaxS3 ) > signed( bbXMaxReg ) then
        
            bbXMaxOut   <=  bbXMaxReg;
            
       else
       
            bbXMaxOut   <= bbXMaxS3;
            
       end if;
       
        --ymax 
        if signed( bbYMaxS3 ) > signed( bbYMaxReg ) then
        
            bbYMaxOut   <=  bbYMaxReg;
            
        else
       
            bbYMaxOut   <= bbYMaxS3;
            
        end if;


        --triangle width/height

        bbWidthOut  <= std_logic_vector( signed( bbXMaxOut ) - signed( bbXMinOut ) );
        bbHeightOut <= std_logic_vector( signed( bbYMaxOut ) - signed( bbYMinOut ) );

                 
    end if; --rising_edge( clock )

end process;


end Behavioral;
