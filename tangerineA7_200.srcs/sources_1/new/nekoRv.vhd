
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

type    rvState_T is ( rvsIFetch0, rvsIFetch1Decode, rvsMemRead0, rvsMemWrite0, rvvsMemWrite1, rvsIExecute0, rvsIExecute1, rvsIExecute2 );
signal  rvState:        rvState_T;

type    rvRegisters_T is array( 0 to 31 ) of std_logic_vector( 31 downto 0 );
signal  regs:           rvRegisters_T;

signal  pc:             std_logic_vector( 31 downto 0 );

--instruction decoder

signal  opcode:         std_logic_vector( 6 downto 0 );
signal  rdNum:          std_logic_vector( 4 downto 0 );
signal  funct3:         std_logic_vector( 2 downto 0 );
signal  funct7:         std_logic_vector( 6 downto 0 );

signal  rs1Val:         std_logic_vector( 31 downto 0 );
signal  rs2Val:         std_logic_vector( 31 downto 0 );

signal  itImm:          std_logic_vector( 31 downto 0 );
signal  stImm:          std_logic_vector( 31 downto 0 );
signal  btImm:          std_logic_vector( 31 downto 0 );
signal  utImm:          std_logic_vector( 31 downto 0 );
signal  jtImm:          std_logic_vector( 31 downto 0 );

--data fetch

signal  dataFetchAddr:  std_logic_vector( 31 downto 0 );
signal  dataStoreAddr:  std_logic_vector( 31 downto 0 );


begin


rvMain: process( all )

variable    itImmVar:   std_logic_vector( 31 downto 0 );
variable    stImmVar:   std_logic_vector( 31 downto 0 );
variable    shiftCount: std_logic_vector( 4 downto 0 );
variable    shiftLV:    std_logic;

begin

    if rising_edge( clk ) then
    
        if reset = '1' then
        
            pc              <= ( others => '0' );
            regs(0)         <= ( others => '0' );
            regs(2)         <= x"00006d40";
            
            rvState         <= rvsIFetch0;
            
        else
        
            case rvState is
            
                when rvsIFetch0 =>
                    
                    a               <= pc;
                    dataMask        <= "1111";
                    wr              <= '0';
                    be              <= '1';
                    InstrFetchCycle <= '1';
                                  
                    pc              <= std_logic_vector( unsigned(pc) + x"00000004" );
                      
                    rvState         <= rvsIFetch1Decode;
            
                when rvsIFetch1Decode =>
                
                    if ready = '1' then
                    
                        be              <= '0';
                        InstrFetchCycle <= '0';
                        
                        --din contains instruction, decode it
                     
                        opcode                  <= din( 6 downto 0 );
                        rdNum                   <= din( 11 downto 7 );
                        funct3                  <= din( 14 downto 12 );
                        funct7                  <= din( 31 downto 25 );
                        
                        itImmVar( 11 downto 0 ) := din( 31 downto 20 );
                        itImmVar( 31 downto 12) := ( others => din( 31 ) );
                         
                        itImm                   <= itImmVar;
                        
                         
                        stImmVar( 4 downto 0 )      := din( 11 downto 7 );
                        stImmVar( 11 downto 5 )     := din( 31 downto 25 );
                        stImmVar( 31 downto 12 )    := ( others => din( 31 ) );
                        
                        stImm                   <= stImmVar;
                        
                        
                        btImm( 12 )             <= din( 31 );
                        btImm( 10 downto 5 )    <= din( 30 downto 25 );
                        btImm( 4 downto 1 )     <= din( 11 downto 8 );
                        btImm( 11 )             <= din( 7 );
                        btImm( 0 )              <= '0';
                        btImm( 31 downto 13 )   <= ( others => din( 31 ) );
                        
                        utImm( 31 downto 12 )   <= din( 31 downto 12 );
                        utImm( 11 downto 0 )    <= ( others => '0' );
                        
                        jtImm( 0 )              <= '0';
                        jtImm( 20 )             <= din( 31 );
                        jtImm( 10 downto 1 )    <= din( 30 downto 21 );
                        jtImm( 11 )             <= din( 20 );
                        jtImm( 19 downto 12 )   <= din( 19 downto 12 );
                        jtImm( 31 downto 21 )   <= ( others => din( 31 ) );
                        
                        rs1Val  <= regs( to_integer( unsigned ( din( 19 downto 15 ) ) ) );
                        rs2Val  <= regs( to_integer( unsigned ( din( 24 downto 20 ) ) ) );
                        
                        --for lb/lh/lw...
                        --addr = rs1Val + itImm
                        
                        dataFetchAddr   <= std_logic_vector( signed( regs( to_integer( unsigned ( din( 19 downto 15 ) ) ) ) ) + signed( itImmVar ) );
                        
                        --for sb/sh/sw
                        --addr = rs1Val + stImm
                        
                        dataStoreAddr   <= std_logic_vector( signed( regs( to_integer( unsigned ( din( 19 downto 15 ) ) ) ) ) + signed( stImmVar ) );
                        
                        rvState <= rvsIExecute0;
                        
                        
                     end if;
                
                when rvsIExecute0 =>                
                
                    --shifter ( multiple instructions )
                    
                    
                    if ( opcode = "0110011" and funct3 = "001" ) or ( opcode = "0010011" and funct3 = "001" ) then
                
                        --sll, slli
                        if opcode = "0110011" then
                            --sll
                            
                            shiftCount  := rs2Val( 4 downto 0 );
                    
                        else
                            --slli
                            --I type
                            
                            shiftCount  := itImm( 4 downto 0 );
                        
                        end if;            
                
                        case shiftCount is
                        
                            when "00000" =>
                                
                                regs( to_integer( unsigned ( rdNum ) ) ) <= rs1Val;
                                
                            when "00001" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= rs1Val( 30 downto 0 ) & '0';
                            
                            when "00010" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= rs1Val( 29 downto 0 ) & "00";
                        
                            when "00011" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= rs1Val( 28 downto 0 ) & "000";

                            when "00100" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= rs1Val( 27 downto 0 ) & "0000";

                            when "00101" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= rs1Val( 26 downto 0 ) & "00000";

                            when "00110" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= rs1Val( 25 downto 0 ) & "000000";

                            when "00111" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= rs1Val( 24 downto 0 ) & "0000000";

                            when "01000" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= rs1Val( 23 downto 0 ) & "00000000";

                            when "01001" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= rs1Val( 22 downto 0 ) & "000000000";

                            when "01010" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= rs1Val( 21 downto 0 ) & "0000000000";

                            when "01011" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= rs1Val( 20 downto 0 ) & "00000000000";

                            when "01100" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= rs1Val( 19 downto 0 ) & "000000000000";

                            when "01101" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= rs1Val( 18 downto 0 ) & "0000000000000";

                            when "01110" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= rs1Val( 17 downto 0 ) & "00000000000000";

                            when "01111" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= rs1Val( 16 downto 0 ) & "000000000000000";

                            when "10000" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= rs1Val( 15 downto 0 ) & "0000000000000000";

                            when "10001" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= rs1Val( 14 downto 0 ) & "00000000000000000";
                                
                            when "10010" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= rs1Val( 13 downto 0 ) & "000000000000000000";
                                
                            when "10011" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= rs1Val( 12 downto 0 ) & "0000000000000000000";

                            when "10100" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= rs1Val( 11 downto 0 ) & "00000000000000000000";

                            when "10101" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= rs1Val( 10 downto 0 ) & "000000000000000000000";

                            when "10110" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= rs1Val( 9 downto 0 ) &  "0000000000000000000000";

                            when "10111" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= rs1Val( 8 downto 0 ) &  "00000000000000000000000";

                            when "11000" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= rs1Val( 7 downto 0 ) &  "000000000000000000000000";

                            when "11001" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= rs1Val( 6 downto 0 ) &  "0000000000000000000000000";

                            when "11010" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= rs1Val( 5 downto 0 ) &  "00000000000000000000000000";

                            when "11011" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= rs1Val( 4 downto 0 ) &  "000000000000000000000000000";

                            when "11100" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= rs1Val( 3 downto 0 ) &  "0000000000000000000000000000";

                            when "11101" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= rs1Val( 2 downto 0 ) &  "00000000000000000000000000000";

                            when "11110" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= rs1Val( 1 downto 0 ) &  "000000000000000000000000000000";

                            when "11111" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= rs1Val( 0 ) &  "0000000000000000000000000000000";
                        end case;
                        
                    elsif ( opcode = "0110011" and funct3 = "101" ) or ( opcode = "0010011" and funct3 = "101" ) then

                        --srl, sra, srli, srai
                        
                        if opcode = "0110011" then
                            --srl, sra
                            
                            shiftCount  := rs2Val( 4 downto 0 );
                    
                            --logical / arith shift
                            if funct7 = "0100000" then

                                --sra
                                shiftLV := rs1Val( 31 );

                            else

                                --srl
                                shiftLV := '0';
                                
                            end if;
                            
                        else
                        
                            --srli, srai
                            --I type
                            
                            shiftCount  := itImm( 4 downto 0 );
                        
                            --logical / arith shift
                            if itImm( 11 downto 5 ) = "0100000" then

                                --srai
                                shiftLV := rs1Val( 31 );

                            else

                                --srli
                                shiftLV := '0';
                                
                            end if;
                        
                        end if;            
                
                        

                        case shiftCount is
                        
                            when "00000" =>
                                
                                regs( to_integer( unsigned ( rdNum ) ) ) <= rs1Val;
                                
                            when "00001" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= shiftLV & rs1Val( 31 downto 1 );

                            when "00010" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= shiftLV & shiftLV & rs1Val( 31 downto 2 );

                            when "00011" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= shiftLV & shiftLV & shiftLV & rs1Val( 31 downto 3 );

                            when "00100" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= shiftLV & shiftLV & shiftLV & shiftLV & rs1Val( 31 downto 4 );

                            when "00101" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & rs1Val( 31 downto 5 );

                            when "00110" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & rs1Val( 31 downto 6 );

                            when "00111" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & rs1Val( 31 downto 7 );

                            when "01000" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & rs1Val( 31 downto 8 );

                            when "01001" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & rs1Val( 31 downto 9 );

                            when "01010" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & rs1Val( 31 downto 10 );
                                    
                            when "01011" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & rs1Val( 31 downto 11 );

                            when "01100" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & rs1Val( 31 downto 12 );

                            when "01101" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & rs1Val( 31 downto 13 );

                            when "01110" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & rs1Val( 31 downto 14 );

                            when "01111" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & rs1Val( 31 downto 15 );

                            when "10000" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & rs1Val( 31 downto 16 );

                            when "10001" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & rs1Val( 31 downto 17 );

                            when "10010" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & rs1Val( 31 downto 18 );

                            when "10011" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & rs1Val( 31 downto 19 );

                            when "10100" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & rs1Val( 31 downto 20 );
                                    
                            when "10101" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & rs1Val( 31 downto 21 );

                            when "10110" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & rs1Val( 31 downto 22 );

                            when "10111" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & rs1Val( 31 downto 23 );

                            when "11000" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & rs1Val( 31 downto 24 );
                                    
                            when "11001" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & rs1Val( 31 downto 25 );

                            when "11010" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & rs1Val( 31 downto 26 );

                            when "11011" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & rs1Val( 31 downto 27 );

                            when "11100" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & rs1Val( 31 downto 28 );

                            when "11101" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & rs1Val( 31 downto 29 );

                            when "11110" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & rs1Val( 31 downto 30 );

                            when "11111" =>
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & rs1Val( 31 );
                        
                        end case; --shiftCount is                        
                    end if;
                
                
                    --execute instruction
                    case opcode is
                    
                        --R type
                        
                        when "0110011" =>
                        
                            --group by funct7
                                                    
                            if funct7 = "0000000" then
                            
                                case funct3 is
                                
                                    --0
                                    when "000" =>

                                        --add
                                        
                                        if rdNum /= "00000" then
                                        
                                            regs( to_integer( unsigned ( rdNum ) ) ) <= std_logic_vector( unsigned( rs1Val ) + unsigned( rs2Val ) );
                                        
                                        end if;
                                        
                                        rvState <= rvsIFetch0;
                                    
                                    --4
                                    when "100" =>
                                    
                                        --xor
                                        if rdNum /= "00000" then
                                        
                                            regs( to_integer( unsigned ( rdNum ) ) ) <= rs1Val xor rs2Val;
                                        
                                        end if;
                                                                                                                       
                                        rvState <= rvsIFetch0;

                                    --6
                                    when "110" =>
                                    
                                        --or
                                        if rdNum /= "00000" then
                                        
                                            regs( to_integer( unsigned ( rdNum ) ) ) <= rs1Val or rs2Val;
                                        
                                        end if;
                                                                                                                       
                                        rvState <= rvsIFetch0;

                                    --7
                                    when "111" =>
                                    
                                        --and
                                        if rdNum /= "00000" then
                                        
                                            regs( to_integer( unsigned ( rdNum ) ) ) <= rs1Val and rs2Val;
                                        
                                        end if;
                                                                                                                       
                                        rvState <= rvsIFetch0;

                                    --2
                                    when "010" =>
                                    
                                        --slt
                                        if rdNum /= "00000" then
                                        
                                            if signed( rs1Val ) < signed( rs2Val ) then
                                            
                                                regs( to_integer( unsigned ( rdNum ) ) ) <= x"00000001";

                                            else

                                                regs( to_integer( unsigned ( rdNum ) ) ) <= x"00000000";
                                            
                                            end if;
                                            
                                        end if;
                                                                                                                       
                                        rvState <= rvsIFetch0;

                                    when others =>
                                
                                        rvState <= rvsIFetch0;
                            
                                end case;   --funct3 is
                                                        
                            elsif funct7 = "0100000" then
  
                                --funct7 = 0x20
                                
                                case funct3 is
                                
                                    when "000" =>
                                    
                                        --sub
                                    
                                        if rdNum /= "00000" then
                                        
                                            regs( to_integer( unsigned ( rdNum ) ) ) <= std_logic_vector( unsigned( rs1Val ) - unsigned( rs2Val ) );
                                        
                                        end if;
                                        
                                        rvState <= rvsIFetch0;
                                                                                  
                                    --2
                                    when "010" =>
                                    
                                        --sltu
                                        if rdNum /= "00000" then
                                        
                                            if unsigned( rs1Val ) < unsigned( rs2Val ) then
                                            
                                                regs( to_integer( unsigned ( rdNum ) ) ) <= x"00000001";

                                            else

                                                regs( to_integer( unsigned ( rdNum ) ) ) <= x"00000000";
                                            
                                            end if;
                                            
                                        end if;
                                                                                                                       
                                        rvState <= rvsIFetch0;

                                    when others =>
                                
                                        rvState <= rvsIFetch0;
                            
                                end case;   --funct3 is
                    
                            else
                            
                                rvState <= rvsIFetch0;                    
                    
                            end if; --funct7 = 0x00 or 0x20

                        when "0010011" =>
                        
                            --I type
                        
                            case funct3 is
                            
                                --0
                                when "000" =>
                                
                                    --addi
                                    if rdNum /= "00000" then
                                    
                                        regs( to_integer( unsigned ( rdNum ) ) ) <= std_logic_vector( signed( rs1Val ) + signed( itImm ) );
                                    
                                    end if;
                                    
                                    rvState <= rvsIFetch0;
                                
                                --4
                                when "100" =>

                                    --xori
                                    if rdNum /= "00000" then
                                    
                                        regs( to_integer( unsigned ( rdNum ) ) ) <= std_logic_vector( unsigned( rs1Val ) xor unsigned( itImm ) );
                                    
                                    end if;
                                    
                                    rvState <= rvsIFetch0;
                            
                                --6
                                when "110" =>
                                    
                                    --ori
                                    if rdNum /= "00000" then
                                    
                                        regs( to_integer( unsigned ( rdNum ) ) ) <= std_logic_vector( unsigned( rs1Val ) or unsigned( itImm ) );
                                    
                                    end if;
                                    
                                    rvState <= rvsIFetch0;

                                --7
                                when "111" =>
                                    
                                    --andi
                                    if rdNum /= "00000" then
                                    
                                        regs( to_integer( unsigned ( rdNum ) ) ) <= std_logic_vector( unsigned( rs1Val ) and unsigned( itImm ) );
                                    
                                    end if;
                                    
                                    rvState <= rvsIFetch0;
                            
                                --2
                                when "010" =>

                                    --slti
                                    if rdNum /= "00000" then
                                    
                                        if signed( rs1Val ) < signed( itImm ) then
                                        
                                            regs( to_integer( unsigned ( rdNum ) ) ) <= x"00000001";

                                        else

                                            regs( to_integer( unsigned ( rdNum ) ) ) <= x"00000000";
                                        
                                        end if;
                                        
                                    end if;
                                
                                    rvState <= rvsIFetch0;

                                --3
                                when "011" =>

                                    --sltiu
                                    if rdNum /= "00000" then
                                    
                                        if unsigned( rs1Val ) < unsigned( itImm ) then
                                        
                                            regs( to_integer( unsigned ( rdNum ) ) ) <= x"00000001";

                                        else

                                            regs( to_integer( unsigned ( rdNum ) ) ) <= x"00000000";
                                        
                                        end if;
                                        
                                    end if;
                                
                                    rvState <= rvsIFetch0;

                                when others => --funct3 is
                                
                                    rvState <= rvsIFetch0;
                                    
                            end case; --funct3 is 
                        
                        when "0000011" =>
                            --I type
                            
                            case funct3 is
                            
                                when "000" | "001" | "010" | "100" | "101" =>

                                    --0     1   2   4   5                                    
                                    --lb    lh  lw  lbu lhu
                                    
                                    a               <= dataFetchAddr( 31 downto 2 ) & "00";
                                    dataMask        <= "1111";
                                    wr              <= '0';
                                    instrFetchCycle <= '0';
                                    be              <= '1';                                
                                       
                                    rvState         <= rvsMemRead0;    
                                                                    
                                when others =>
                                    
                                    rvState <= rvsIFetch0;
                          
                            end case; --funct3 is
                        
                        when "0100011" =>
                        
                            --S type
                             
                            case funct3 is
                            
                                when "000" =>
                                    ---0
                                    --sb
                                    
                                    a               <= dataStoreAddr( 31 downto 2 ) & "00";
                                    
                                    dout            <= rs2Val( 7 downto 0 ) & rs2Val( 7 downto 0 ) & rs2Val( 7 downto 0 ) & rs2Val( 7 downto 0 );
                                    
                                    case dataStoreAddr( 1 downto 0 ) is
                                    
                                        when "00" =>

                                            dataMask        <= "0001";
                                        
                                        when "01" =>
                                        
                                            dataMask        <= "0010";
                                        
                                        when "10" =>

                                            dataMask        <= "0100";
                                        
                                        when "11" =>

                                            dataMask        <= "1000";
                                        
                                    end case; --dataStoreAddr( 1 downto 0 ) is
                                    
                                    wr              <= '1';
                                    be              <= '1';
                                    instrFetchCycle <= '0';
                                    
                                    rvState <=      rvsMemWrite0;

                                when "001" =>
                                    --1
                                    --sh

                                    a               <= dataStoreAddr( 31 downto 2 ) & "00";
                                    
                                    dout            <= rs2Val( 15 downto 0 ) & rs2Val( 15 downto 0 );
                                    
                                    if dataStoreAddr( 1 ) = '0' then
                                    
                                        dataMask        <= "0011";
                                    
                                    else

                                        dataMask        <= "1100";
                                    
                                    end if;
                                    
                                    
                                    wr              <= '1';
                                    be              <= '1';
                                    instrFetchCycle <= '0';
                                    
                                    rvState <=      rvsMemWrite0;
                                                                        
                                when "010" =>
                                    --2
                                    --sw
                                    
                                    a               <= dataStoreAddr( 31 downto 2 ) & "00";
                                    dout            <= rs2Val;
                                    dataMask        <= "1111";
                                    
                                    wr              <= '1';
                                    be              <= '1';
                                    instrFetchCycle <= '0';
                                    
                                    rvState <=      rvsMemWrite0;
                                    
                                when others =>
                                    
                                    rvState <= rvsIFetch0;
                                    
                            end case; --funct3 is
                            
                        when "1100011" =>
                        
                            --B type
                            
                            case funct3 is

                                when "000" =>
                                    --0
                                
                                    --beq
                                    if rs1Val = rs2Val then
                                    
                                        pc <= std_logic_vector( signed( pc ) + signed( btImm ) - 4 );
                                    
                                    end if;
                                    
                                    rvState <= rvsIFetch0;
                                                           
                                when "001" =>
                                    --1
                                
                                    --bne
                                    if rs1Val /= rs2Val then
                                    
                                        pc <= std_logic_vector( signed( pc ) + signed( btImm ) - 4 );
                                    
                                    end if;
                                    
                                    rvState <= rvsIFetch0;
                            
                                when "100" =>
                                    --4
                                
                                    --blt
                                    if signed( rs1Val ) < signed( rs2Val ) then
                                    
                                        pc <= std_logic_vector( signed( pc ) + signed( btImm ) - 4 );
                                    
                                    end if;
                                    
                                    rvState <= rvsIFetch0;

                                when "101" =>
                                    --5
                                
                                    --bge
                                    if signed( rs1Val ) >= signed( rs2Val ) then
                                    
                                        pc <= std_logic_vector( signed( pc ) + signed( btImm ) - 4 );
                                    
                                    end if;
                                    
                                    rvState <= rvsIFetch0;

                                when "110" =>
                                    --6
                                
                                    --bltu
                                    if unsigned( rs1Val ) < unsigned( rs2Val ) then
                                    
                                        pc <= std_logic_vector( signed( pc ) + signed( btImm ) - 4 );
                                    
                                    end if;
                                    
                                    rvState <= rvsIFetch0;


                                when "111" =>
                                    --7
                                
                                    --bgeu
                                    if unsigned( rs1Val ) >= unsigned( rs2Val ) then
                                    
                                        pc <= std_logic_vector( signed( pc ) + signed( btImm ) - 4 );
                                    
                                    end if;
                                    
                                    rvState <= rvsIFetch0;

                                when others => --funct3 is
                                
                                    rvState <= rvsIFetch0;
                                    
                            end case; --funct3 is 
                                
                        when "1101111" =>
                            
                            --J type
                            
                            --jal
                            if rdNum /= "00000" then
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= pc;
                                
                            end if;
                            
                            pc <= std_logic_vector( signed( pc ) + signed( jtImm ) - 4 );

                            rvState <= rvsIFetch0;
                    
                        when "1100111" =>
                            --I type
                            
                            --jalr
                            
                            if rdNum /= "00000" then
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <=  pc;
                                
                            end if;
                            
                            pc <= std_logic_vector( signed( rs1Val ) + signed( itImm ) );

                            rvState <= rvsIFetch0;
                            
                        when "0110111" =>
                            --U type
                            
                            --lui
                             
                            if rdNum /= "00000" then
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= utImm; 
                                
                            end if;

                            rvState <= rvsIFetch0;
                       
                        when "0010111" =>
                            --U type
                            
                            --auipc
                             
                            if rdNum /= "00000" then
                            
                                regs( to_integer( unsigned ( rdNum ) ) ) <= std_logic_vector( signed( pc ) + signed( utImm ) - 4 );
                                
                            end if;

                            rvState <= rvsIFetch0;
                            
                        when others => --opcode is
                        
                            rvState <= rvsIFetch0;

                    end case; -- opcode is
                
                
                when rvsMemRead0 => --rvState is
                
                    if ready = '1' then
                    
                        be  <= '0';
                    
                        if opcode = "0000011" then
                        
                            --I type
                            
                            case funct3 is
                            
                                when "000" => 
                                
                                    --0
                                    --lb
                               
                                    case dataFetchAddr( 1 downto 0 ) is
                                    
                                        when "00" =>
                                            --0
                                        
                                            regs( to_integer( unsigned ( rdNum ) ) )( 7 downto 0 ) <= din( 7 downto 0 );
                                            regs( to_integer( unsigned ( rdNum ) ) )( 31 downto 8 ) <= ( others => din( 7 ) );
                                                                                    
                                        when "01" =>
                                            --1
                                        
                                            regs( to_integer( unsigned ( rdNum ) ) )( 7 downto 0 ) <= din( 15 downto 8 );
                                            regs( to_integer( unsigned ( rdNum ) ) )( 31 downto 8 ) <= ( others => din( 15 ) );

                                        when "10" =>
                                            --2
                                        
                                            regs( to_integer( unsigned ( rdNum ) ) )( 7 downto 0 ) <= din( 23 downto 16 );
                                            regs( to_integer( unsigned ( rdNum ) ) )( 31 downto 8 ) <= ( others => din( 23 ) );

                                        when "11" =>
                                            --3
                                        
                                            regs( to_integer( unsigned ( rdNum ) ) )( 7 downto 0 ) <= din( 31 downto 24 );
                                            regs( to_integer( unsigned ( rdNum ) ) )( 31 downto 8 ) <= ( others => din( 31 ) );
                                        
                                    end case; --dataFetchA1_0 is
                                    
                                when "001" =>
                                
                                    --1
                                    --lh
                                    
                                    if dataFetchAddr( 1 ) = '0' then
                                    --0 
                                        regs( to_integer( unsigned ( rdNum ) ) )( 15 downto 0 ) <= din( 15 downto 0 );
                                        regs( to_integer( unsigned ( rdNum ) ) )( 31 downto 16 ) <= ( others => din( 15 ) );
                                    
                                    else
                                    --1
                                        regs( to_integer( unsigned ( rdNum ) ) )( 15 downto 0 ) <= din( 31 downto 16 );
                                        regs( to_integer( unsigned ( rdNum ) ) )( 31 downto 16 ) <= ( others => din( 31 ) );
                                    
                                    end if; --dataFetchA1_0(1) = '0' or '1'

                                    
                                when "010" =>
                                
                                    --2
                                    --lw
                                    regs( to_integer( unsigned ( rdNum ) ) )( 31 downto 0 ) <= din( 31 downto 0 );
                                    
                               when "100" =>
                                
                                    --4
                                    --lbu
                                    
                                    case dataFetchAddr( 1 downto 0 ) is
                                    
                                        when "00" =>
                                            --0
                                        
                                            regs( to_integer( unsigned ( rdNum ) ) )( 7 downto 0 ) <= din( 7 downto 0 );
                                            regs( to_integer( unsigned ( rdNum ) ) )( 31 downto 8 ) <= ( others => '0' );
                                                                                    
                                        when "01" =>
                                            --1
                                        
                                            regs( to_integer( unsigned ( rdNum ) ) )( 7 downto 0 ) <= din( 15 downto 8 );
                                            regs( to_integer( unsigned ( rdNum ) ) )( 31 downto 8 ) <= ( others => '0' );

                                        when "10" =>
                                            --2
                                        
                                            regs( to_integer( unsigned ( rdNum ) ) )( 7 downto 0 ) <= din( 23 downto 16 );
                                            regs( to_integer( unsigned ( rdNum ) ) )( 31 downto 8 ) <= ( others => '0' );

                                        when "11" =>
                                            --3
                                        
                                            regs( to_integer( unsigned ( rdNum ) ) )( 7 downto 0 ) <= din( 31 downto 24 );
                                            regs( to_integer( unsigned ( rdNum ) ) )( 31 downto 8 ) <= ( others => '0' );
                                        
                                    end case; --dataFetchA1_0 is
                                    
                               when "101" =>
                               
                                    --5
                                    --lhu     
                                                               
                                    if dataFetchAddr( 1 ) = '0' then
                                    --0 
                                        regs( to_integer( unsigned ( rdNum ) ) )( 15 downto 0 ) <= din( 15 downto 0 );
                                        regs( to_integer( unsigned ( rdNum ) ) )( 31 downto 16 ) <= ( others => '0' );
                                    
                                    else
                                    --1
                                        regs( to_integer( unsigned ( rdNum ) ) )( 15 downto 0 ) <= din( 31 downto 16 );
                                        regs( to_integer( unsigned ( rdNum ) ) )( 31 downto 16 ) <= ( others => '0' );
                                    
                                    end if; --dataFetchA1_0(1) = '0' or '1'
                    
                               when others =>
                                
                           end case; --funct3 is
                    
                        end if; --opcode = "0000011"
                    
                        rvState <= rvsIFetch0;
                    
                    end if; --ready = '1'
                
                when rvsMemWrite0 =>
                
                    if ready = '1' then
                    
                        be      <= '0';
                        rvState <= rvsIFetch0;
                        
                    end if;                
                    
                when others => --rvState is
                
                    rvState <= rvsIFetch0;
                    
            end case; --rvState is
            
        
        end if; --reset = '1' or '0'
    
    end if; --rising_edge( clk )
    
end process;




end Behavioral;
