
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity nekoRv is
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
end nekoRv;

architecture Behavioral of nekoRv is

begin


end Behavioral;
