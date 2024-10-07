

--  nekoRV32IM

--  Risc-V32IM core

--  Copyright (c) 2024, Michal‚ Kubecki - qubeck78@wp.pl

--  Supplied under BSD-3 Clause license ( see LICENSE file )


--  Note: While not enforced by the license, I kindly request that any application 
--  using this software includes "Michal Kubecki - qubeck78@wp.pl" in its about 
--  or credits section as a token of appreciation for the open-source contribution.


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity nekoRv is
generic
(
    genInitialPC:       std_logic_vector( 31 downto 0 ) := x"00000000";
    genInitialSP:       std_logic_vector( 31 downto 0 ) := x"00005a80";
);

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

type    rvState_T is ( rvsIFetch0, rvsIFetch1Decode, rvsMemRead0, rvsMemRead1, rvsMemWrite0, rvsMemWrite1, rvsIExecute0, 
                        rvsIExecute1Mul, rvsIExecute1Div, rvsIExecute2Div );

signal  rvState:        rvState_T;

type    rvRegisters_T is array( 0 to 31 ) of std_logic_vector( 31 downto 0 );
signal  regs:           rvRegisters_T;

signal  pc:             std_logic_vector( 31 downto 0 );

--instruction decoder

signal  opcode:         std_logic_vector( 6 downto 0 );
signal  rdNum:          std_logic_vector( 4 downto 0 );
signal  funct3:         std_logic_vector( 2 downto 0 );
signal  funct7:         std_logic_vector( 6 downto 0 );


signal  itImm:          std_logic_vector( 31 downto 0 );
signal  stImm:          std_logic_vector( 31 downto 0 );
signal  btImm:          std_logic_vector( 31 downto 0 );
signal  utImm:          std_logic_vector( 31 downto 0 );
signal  jtImm:          std_logic_vector( 31 downto 0 );

--registers

signal  rs1Val:         std_logic_vector( 31 downto 0 );
signal  rs2Val:         std_logic_vector( 31 downto 0 );
signal  rdVal:          std_logic_vector( 31 downto 0 );
signal  rdWrite:        std_logic;


--data fetch

signal  dataFetchAddr:  std_logic_vector( 31 downto 0 );
signal  dataStoreAddr:  std_logic_vector( 31 downto 0 );

--multiplier

signal  resultMul:      std_logic_vector( 63 downto 0 );
signal  resultMulsu:    std_logic_vector( 65 downto 0 );
signal  resultMuluu:    std_logic_vector( 63 downto 0 );

--divider
signal  divI:           std_logic_vector( 7 downto 0 );
signal  divN:           std_logic_vector( 31 downto 0 );
signal  divD:           std_logic_vector( 31 downto 0 );
signal  divQ:           std_logic_vector( 31 downto 0 );
signal  divR:           std_logic_vector( 31 downto 0 );
signal  divQSign:       std_logic;
signal  divRSign:       std_logic;

begin

registers: process( all )

begin

    if reset = '1' then

      regs(0)         <= ( others => '0' );
      regs(2)         <= genInitialSP;

    elsif rising_edge( clk ) then
    
        if rdWrite = '1' and rdNum /= "00000" then
        
            regs( to_integer( unsigned ( rdNum ) ) ) <= rdVal;
    
        end if;
        
    end if;
    


end process;



rvMain: process( all )

--shifter variables

variable    shiftCount: std_logic_vector( 4 downto 0 );
variable    shiftLV:    std_logic;

--divider variables
variable    divRVar:    std_logic_vector( 31 downto 0 );

begin

    
        if reset = '1' then
        
            pc              <= genInitialPC;
               
            rvState         <= rvsIFetch0;
            rdWrite         <= '0';
            wr              <= '0';
            be              <= '1';
            InstrFetchCycle <= '1';
   
   
            wr              <= '0';
            be              <= '0';
            InstrFetchCycle <= '0';

            resultMul       <= ( others => '0' );
            resultMulsu     <= ( others => '0' );
            resultMuluu     <= ( others => '0' );
            
        elsif rising_edge( clk ) then

        
            case rvState is
            
                when rvsIFetch0 =>
                    
                    rdWrite         <= '0';

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
                        
                        itImm( 11 downto 0 )    <= din( 31 downto 20 );
                        itImm( 31 downto 12 )   <= ( others => din( 31 ) );
                                                
                         
                        stImm( 4 downto 0 )     <= din( 11 downto 7 );
                        stImm( 11 downto 5 )    <= din( 31 downto 25 );
                        stImm( 31 downto 12 )   <= ( others => din( 31 ) );
                        
                        
                        
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
                        
                        
                        rvState <= rvsIExecute0;
                        
                        
                     end if;
                
                when rvsIExecute0 =>                

                    --for lb/lh/lw...
                    --addr = rs1Val + itImm
                    
                    dataFetchAddr   <= std_logic_vector( signed( rs1Val ) + signed( itImm ) );
                    
                    --for sb/sh/sw
                    --addr = rs1Val + stImm
                    
                    dataStoreAddr   <= std_logic_vector( signed( rs1Val ) + signed( stImm ) );

                
                    --shifter ( multiple instructions )
                    
                    
                    if ( ( opcode = "0110011" ) and ( funct3 = "001" ) ) or ( ( opcode = "0010011" ) and ( funct3 = "001" ) ) then
                
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
                                
                                rdVal <= rs1Val;
                                
                            when "00001" =>
                            
                                rdVal <= rs1Val( 30 downto 0 ) & '0';
                            
                            when "00010" =>
                            
                                rdVal <= rs1Val( 29 downto 0 ) & "00";
                        
                            when "00011" =>
                            
                                rdVal <= rs1Val( 28 downto 0 ) & "000";

                            when "00100" =>
                            
                                rdVal <= rs1Val( 27 downto 0 ) & "0000";

                            when "00101" =>
                            
                                rdVal <= rs1Val( 26 downto 0 ) & "00000";

                            when "00110" =>
                            
                                rdVal <= rs1Val( 25 downto 0 ) & "000000";

                            when "00111" =>
                            
                                rdVal <= rs1Val( 24 downto 0 ) & "0000000";

                            when "01000" =>
                            
                                rdVal <= rs1Val( 23 downto 0 ) & "00000000";

                            when "01001" =>
                            
                                rdVal <= rs1Val( 22 downto 0 ) & "000000000";

                            when "01010" =>
                            
                                rdVal <= rs1Val( 21 downto 0 ) & "0000000000";

                            when "01011" =>
                            
                                rdVal <= rs1Val( 20 downto 0 ) & "00000000000";

                            when "01100" =>
                            
                                rdVal <= rs1Val( 19 downto 0 ) & "000000000000";

                            when "01101" =>
                            
                                rdVal <= rs1Val( 18 downto 0 ) & "0000000000000";

                            when "01110" =>
                            
                                rdVal <= rs1Val( 17 downto 0 ) & "00000000000000";

                            when "01111" =>
                            
                                rdVal <= rs1Val( 16 downto 0 ) & "000000000000000";

                            when "10000" =>
                            
                                rdVal <= rs1Val( 15 downto 0 ) & "0000000000000000";

                            when "10001" =>
                            
                                rdVal <= rs1Val( 14 downto 0 ) & "00000000000000000";
                                
                            when "10010" =>
                            
                                rdVal <= rs1Val( 13 downto 0 ) & "000000000000000000";
                                
                            when "10011" =>
                            
                                rdVal <= rs1Val( 12 downto 0 ) & "0000000000000000000";

                            when "10100" =>
                            
                                rdVal <= rs1Val( 11 downto 0 ) & "00000000000000000000";

                            when "10101" =>
                            
                                rdVal <= rs1Val( 10 downto 0 ) & "000000000000000000000";

                            when "10110" =>
                            
                                rdVal <= rs1Val( 9 downto 0 ) &  "0000000000000000000000";

                            when "10111" =>
                            
                                rdVal <= rs1Val( 8 downto 0 ) &  "00000000000000000000000";

                            when "11000" =>
                            
                                rdVal <= rs1Val( 7 downto 0 ) &  "000000000000000000000000";

                            when "11001" =>
                            
                                rdVal <= rs1Val( 6 downto 0 ) &  "0000000000000000000000000";

                            when "11010" =>
                            
                                rdVal <= rs1Val( 5 downto 0 ) &  "00000000000000000000000000";

                            when "11011" =>
                            
                                rdVal <= rs1Val( 4 downto 0 ) &  "000000000000000000000000000";

                            when "11100" =>
                            
                                rdVal <= rs1Val( 3 downto 0 ) &  "0000000000000000000000000000";

                            when "11101" =>
                            
                                rdVal <= rs1Val( 2 downto 0 ) &  "00000000000000000000000000000";

                            when "11110" =>
                            
                                rdVal <= rs1Val( 1 downto 0 ) &  "000000000000000000000000000000";

                            when "11111" =>
                            
                                rdVal <= rs1Val( 0 ) &  "0000000000000000000000000000000";
                                
                            when others =>
                            
                                rdVal <= rs1Val;
                                
                        end case;
                        
                        rdWrite <= '1';
                        
                    elsif ( ( opcode = "0110011" ) and ( funct3 = "101" ) ) or ( ( opcode = "0010011" ) and ( funct3 = "101" ) ) then

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
                                
                                rdVal <= rs1Val;
                                
                            when "00001" =>
                            
                                rdVal <= shiftLV & rs1Val( 31 downto 1 );

                            when "00010" =>
                            
                                rdVal <= shiftLV & shiftLV & rs1Val( 31 downto 2 );

                            when "00011" =>
                            
                                rdVal <= shiftLV & shiftLV & shiftLV & rs1Val( 31 downto 3 );

                            when "00100" =>
                            
                                rdVal <= shiftLV & shiftLV & shiftLV & shiftLV & rs1Val( 31 downto 4 );

                            when "00101" =>
                            
                                rdVal <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & rs1Val( 31 downto 5 );

                            when "00110" =>
                            
                                rdVal <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & rs1Val( 31 downto 6 );

                            when "00111" =>
                            
                                rdVal <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & rs1Val( 31 downto 7 );

                            when "01000" =>
                            
                                rdVal <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & rs1Val( 31 downto 8 );

                            when "01001" =>
                            
                                rdVal <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & rs1Val( 31 downto 9 );

                            when "01010" =>
                            
                                rdVal <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & rs1Val( 31 downto 10 );
                                    
                            when "01011" =>
                            
                                rdVal <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & rs1Val( 31 downto 11 );

                            when "01100" =>
                            
                                rdVal <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & rs1Val( 31 downto 12 );

                            when "01101" =>
                            
                                rdVal <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & rs1Val( 31 downto 13 );

                            when "01110" =>
                            
                                rdVal <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & rs1Val( 31 downto 14 );

                            when "01111" =>
                            
                                rdVal <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & rs1Val( 31 downto 15 );

                            when "10000" =>
                            
                                rdVal <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & rs1Val( 31 downto 16 );

                            when "10001" =>
                            
                                rdVal <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & rs1Val( 31 downto 17 );

                            when "10010" =>
                            
                                rdVal <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & rs1Val( 31 downto 18 );

                            when "10011" =>
                            
                                rdVal <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & rs1Val( 31 downto 19 );

                            when "10100" =>
                            
                                rdVal <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & rs1Val( 31 downto 20 );
                                    
                            when "10101" =>
                            
                                rdVal <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & rs1Val( 31 downto 21 );

                            when "10110" =>
                            
                                rdVal <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & rs1Val( 31 downto 22 );

                            when "10111" =>
                            
                                rdVal <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & rs1Val( 31 downto 23 );

                            when "11000" =>
                            
                                rdVal <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & rs1Val( 31 downto 24 );
                                    
                            when "11001" =>
                            
                                rdVal <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & rs1Val( 31 downto 25 );

                            when "11010" =>
                            
                                rdVal <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & rs1Val( 31 downto 26 );

                            when "11011" =>
                            
                                rdVal <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & rs1Val( 31 downto 27 );

                            when "11100" =>
                            
                                rdVal <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & rs1Val( 31 downto 28 );

                            when "11101" =>
                            
                                rdVal <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & rs1Val( 31 downto 29 );

                            when "11110" =>
                            
                                rdVal <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & rs1Val( 31 downto 30 );

                            when "11111" =>
                            
                                rdVal <= shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV & shiftLV 
                                    & shiftLV & shiftLV & shiftLV & rs1Val( 31 );

                            when others =>
                            
                                rdVal <= rs1Val;
                        
                        end case; --shiftCount is
                        
                        rdWrite <= '1';
                                                
                    end if;
                

                    --default next state
                    rvState <= rvsIFetch0;
                
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
                                           
                                        rdVal <= std_logic_vector( signed( rs1Val ) + signed( rs2Val ) );
                                        rdWrite <= '1';                                        
                                    
                                    --4
                                    when "100" =>
                                    
                                        --xor
                                        
                                        rdVal <= rs1Val xor rs2Val;
                                        rdWrite <= '1';
                                        
                                    --6
                                    when "110" =>
                                    
                                        --or
                                        
                                        rdVal <= rs1Val or rs2Val;
                                        rdWrite <= '1';
                                        
                                                                                                                      
                                    --7
                                    when "111" =>
                                    
                                        --and
                                        
                                        rdVal <= rs1Val and rs2Val;
                                        rdWrite <= '1';
                                        
                                                                                                                     

                                    --2
                                    when "010" =>
                                    
                                        --slt
                                        
                                        if signed( rs1Val ) < signed( rs2Val ) then
                                            
                                            rdVal <= x"00000001";

                                        else

                                            rdVal <= x"00000000";
                                            
                                        end if;
                                        
                                        rdWrite <= '1';

                                    when "011" =>
                                        --3
                                        --sltu
                                        
                                        if unsigned( rs1Val ) < unsigned( rs2Val ) then
                                        
                                            rdVal <= x"00000001";

                                        else

                                            rdVal <= x"00000000";
                                        
                                        end if;
                                        rdWrite <= '1';
                                        
                                    when others =>
                                
                            
                                end case;   --funct3 is
                                                        
                            elsif funct7 = "0100000" then
  
                                --funct7 = 0x20
                                
                                case funct3 is
                                
                                    when "000" =>
                                        --0                                    
                                        --sub                                  
                                        
                                        rdVal <= std_logic_vector( signed( rs1Val ) - signed( rs2Val ) );
                                        rdWrite <= '1';                                        
                                                                                                                      
                                    when others =>
                                
                            
                                end case;   --funct3 is
                    
                            elsif funct7 = "0000001" then
                            
                                --funct7 = 0x01

                                case funct3 is 

                                    when "000" | "001" | "010" | "011" =>
                                        
                                        
                                        --0     1       2       3
                                        --mul   mulh    mulsu   mulu
                                        resultMul       <= std_logic_vector( signed( rs1Val ) * signed( rs2Val ) );
                                        resultMulsu     <= std_logic_vector( signed( rs1Val(31) & rs1Val ) * signed( '0' & rs2Val ) );
                                        resultMuluu     <= std_logic_vector( unsigned( rs1Val ) * unsigned( rs2Val ) );

                                        rvState         <= rvsIExecute1Mul;
                                        
                                    when "100" | "101" | "110" | "111" =>

                                        --4     5       6       7
                                        --div   divu    rem     remu
                                        
                                        divQ    <= ( others => '0' );
                                        divR    <= ( others => '0' );
    
                                        divI    <= x"1f"; --31

                                        if funct3 = "101" or funct3 = "111" then
                                        
                                            --divu/remu
                                        
                                            divN        <= rs1Val;
                                            divD        <= rs2Val;
                                            
                                            divQSign    <= '0';
                                            divRSign    <= '0';
                                            
                                        else
                                        
                                            --div/rem
            
                                            if rs1Val( 31 ) = '1' then
                                            
                                                divN    <= std_logic_vector( unsigned ( -signed( rs1Val ) ) );
                                                
                                            else
                                                
                                                divN    <= rs1Val;
                                                
                                            end if;
                                            
                                            if rs2Val( 31 ) = '1' then
                                            
                                                divD    <= std_logic_vector( unsigned ( -signed( rs2Val ) ) );
                                                
                                            else
                                                
                                                divD    <= rs2Val;
                                                
                                            end if;
                                            
                                            divQSign <= rs1Val( 31 ) xor rs2Val( 31 );
                                            divRSign <= rs1Val( 31 );                        
                                        
                                        end if;
                        
                                        rvState         <= rvsIExecute1Div;

                                    when others =>


                                end case; --funct3 is
                    
                            end if; --funct7 = 0x00 0x01 or 0x20

                        when "0010011" =>
                        
                            --I type
                        
                            case funct3 is
                            
                                --0
                                when "000" =>
                                
                                    --addi
                                    
                                    rdVal <= std_logic_vector( signed( rs1Val ) + signed( itImm ) );
                                    rdWrite <= '1';
                                                                        
                               
                                --4
                                when "100" =>

                                    --xori
                                    
                                    rdVal <= std_logic_vector( unsigned( rs1Val ) xor unsigned( itImm ) );
                                    rdWrite <= '1';
                                    
                            
                                --6
                                when "110" =>
                                    
                                    --ori
                                    
                                    rdVal <= std_logic_vector( unsigned( rs1Val ) or unsigned( itImm ) );
                                    rdWrite <= '1';
                                    
                                   
                                --7
                                when "111" =>
                                    
                                    --andi
                                    
                                    rdVal <= std_logic_vector( unsigned( rs1Val ) and unsigned( itImm ) );
                                    rdWrite <= '1';
                                    
                                --2
                                when "010" =>

                                    --slti
                                    
                                    if signed( rs1Val ) < signed( itImm ) then
                                    
                                        rdVal <= x"00000001";

                                    else

                                        rdVal <= x"00000000";
                                    
                                    end if;
                                    rdWrite <= '1';

                                
                                --3
                                when "011" =>

                                    --sltiu
                                    
                                    if unsigned( rs1Val ) < unsigned( itImm ) then
                                        
                                        rdVal <= x"00000001";

                                    else

                                        rdVal <= x"00000000";
                                        
                                    end if;
                                    rdWrite <= '1';
                                        
                                
                                when others => --funct3 is
                                
                                    
                            end case; --funct3 is 
                        
                        when "0000011" =>
                            --I type
                            
                            --data load addr not ready yet
                            case funct3 is
                            
                                when "000" | "001" | "010" | "100" | "101" =>

                                    --0     1   2   4   5                                    
                                    --lb    lh  lw  lbu lhu

                                                                                                               
                                    rvState <= rvsMemRead0;    
                                                                    
                                when others =>
                                                              
                            end case; --funct3 is
                        
                        when "0100011" =>
                        
                            --S type
                             
                            --data store addr not ready yet
                            
                            case funct3 is
                                
                                when "000" | "001" | "010" =>
                                    
                                    rvState <= rvsMemWrite0;
                                        
                                when others =>
                                    
                                    
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
                                    
                                                           
                                when "001" =>
                                    --1
                                
                                    --bne
                                    if rs1Val /= rs2Val then
                                    
                                        pc <= std_logic_vector( signed( pc ) + signed( btImm ) - 4 );
                                    
                                    end if;
                                    
                            
                                when "100" =>
                                    --4
                                
                                    --blt
                                    if signed( rs1Val ) < signed( rs2Val ) then
                                    
                                        pc <= std_logic_vector( signed( pc ) + signed( btImm ) - 4 );
                                    
                                    end if;
                                    

                                when "101" =>
                                    --5
                                
                                    --bge
                                    if signed( rs1Val ) >= signed( rs2Val ) then
                                    
                                        pc <= std_logic_vector( signed( pc ) + signed( btImm ) - 4 );
                                    
                                    end if;
                                    

                                when "110" =>
                                    --6
                                
                                    --bltu
                                    if unsigned( rs1Val ) < unsigned( rs2Val ) then
                                    
                                        pc <= std_logic_vector( signed( pc ) + signed( btImm ) - 4 );
                                    
                                    end if;
                                    


                                when "111" =>
                                    --7
                                
                                    --bgeu
                                    if unsigned( rs1Val ) >= unsigned( rs2Val ) then
                                    
                                        pc <= std_logic_vector( signed( pc ) + signed( btImm ) - 4 );
                                    
                                    end if;
                                    

                                when others => --funct3 is
                                
                                    
                            end case; --funct3 is 
                                
                        when "1101111" =>
                            
                            --J type
                            
                            --jal
                            
                            rdVal   <= pc;
                            rdWrite <= '1';
                                
                            
                            pc <= std_logic_vector( signed( pc ) + signed( jtImm ) - 4 );

                    
                        when "1100111" =>
                            --I type
                            
                            --jalr
                            
                            
                            rdVal <=  pc;
                            rdWrite <= '1';
                                
                            
                            pc <= std_logic_vector( signed( rs1Val ) + signed( itImm ) );

                            
                        when "0110111" =>
                            --U type
                            
                            --lui
                             
                            
                            rdVal <= utImm; 
                            rdWrite <= '1';
                                
                       
                        when "0010111" =>
                            --U type
                            
                            --auipc
                             
                            
                            rdVal <= std_logic_vector( signed( pc ) + signed( utImm ) - 4 );
                            rdWrite <= '1';
                                
                            
                        when others => --opcode is
                        

                    end case; -- opcode is

                when rvsMemRead0 =>
                
                    --0     1   2   4   5                                    
                    --lb    lh  lw  lbu lhu
                                                        
                    a               <= dataFetchAddr( 31 downto 2 ) & "00";
                    dataMask        <= "1111";
                    wr              <= '0';
                    instrFetchCycle <= '0';
                    be              <= '1';                                
                       
                    rvState         <= rvsMemRead1;
                    
                
                when rvsMemRead1 => --rvState is
                
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
                                        
                                            rdVal( 7 downto 0 ) <= din( 7 downto 0 );
                                            rdVal( 31 downto 8 ) <= ( others => din( 7 ) );
                                                                                    
                                        when "01" =>
                                            --1
                                        
                                            rdVal( 7 downto 0 ) <= din( 15 downto 8 );
                                            rdVal( 31 downto 8 ) <= ( others => din( 15 ) );

                                        when "10" =>
                                            --2
                                        
                                            rdVal( 7 downto 0 ) <= din( 23 downto 16 );
                                            rdVal( 31 downto 8 ) <= ( others => din( 23 ) );

                                        when "11" =>
                                            --3
                                        
                                            rdVal( 7 downto 0 ) <= din( 31 downto 24 );
                                            rdVal( 31 downto 8 ) <= ( others => din( 31 ) );
                                        
                                        when others =>
                                          
                                    end case; --dataFetchA1_0 is

                                    rdWrite <= '1';
                                    
                                when "001" =>
                                
                                    --1
                                    --lh
                                    
                                    if dataFetchAddr( 1 ) = '0' then
                                    --0 
                                        rdVal( 15 downto 0 ) <= din( 15 downto 0 );
                                        rdVal( 31 downto 16 ) <= ( others => din( 15 ) );
                                    
                                    else
                                    --1
                                        rdVal( 15 downto 0 ) <= din( 31 downto 16 );
                                        rdVal( 31 downto 16 ) <= ( others => din( 31 ) );
                                    
                                    end if; --dataFetchA1_0(1) = '0' or '1'

                                    rdWrite <= '1';
                                    
                                when "010" =>
                                
                                    --2
                                    --lw
                                    rdVal( 31 downto 0 ) <= din( 31 downto 0 );
                                    rdWrite <= '1';
                                    
                               when "100" =>
                                
                                    --4
                                    --lbu
                                    
                                    case dataFetchAddr( 1 downto 0 ) is
                                    
                                        when "00" =>
                                            --0
                                        
                                            rdVal( 7 downto 0 ) <= din( 7 downto 0 );
                                            rdVal( 31 downto 8 ) <= ( others => '0' );
                                                                                    
                                        when "01" =>
                                            --1
                                        
                                            rdVal( 7 downto 0 ) <= din( 15 downto 8 );
                                            rdVal( 31 downto 8 ) <= ( others => '0' );

                                        when "10" =>
                                            --2
                                        
                                            rdVal( 7 downto 0 ) <= din( 23 downto 16 );
                                            rdVal( 31 downto 8 ) <= ( others => '0' );

                                        when "11" =>
                                            --3
                                        
                                            rdVal( 7 downto 0 ) <= din( 31 downto 24 );
                                            rdVal( 31 downto 8 ) <= ( others => '0' );
                                        
                                        when others =>
                                        
                                    end case; --dataFetchA1_0 is
                                    rdWrite <= '1';
                                    
                               when "101" =>
                               
                                    --5
                                    --lhu     
                                                               
                                    if dataFetchAddr( 1 ) = '0' then
                                    --0 
                                        rdVal( 15 downto 0 ) <= din( 15 downto 0 );
                                        rdVal( 31 downto 16 ) <= ( others => '0' );
                                    
                                    else
                                    --1
                                        rdVal( 15 downto 0 ) <= din( 31 downto 16 );
                                        rdVal( 31 downto 16 ) <= ( others => '0' );
                                    
                                    end if; --dataFetchA1_0(1) = '0' or '1'
                                    rdWrite <= '1';
                    
                               when others =>
                                
                           end case; --funct3 is
                    
                        end if; --opcode = "0000011"
                    
                        rvState <= rvsIFetch0;
                    
                    end if; --ready = '1'

                when rvsMemWrite0 =>
                
                        --S type
                         
                        case funct3 is
                        
                            when "000" =>
                                ---0
                                --sb
                                
                                a   <= dataStoreAddr( 31 downto 2 ) & "00";
                                                                    
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
                                    
                                    when others =>
                                    
                                end case; --dataStoreAddr( 1 downto 0 ) is
                                
                                wr              <= '1';
                                be              <= '1';
                                instrFetchCycle <= '0';
                                
                                rvState <=      rvsMemWrite1;

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
                                
                                rvState <=      rvsMemWrite1;
                                                                    
                            when "010" =>
                                --2
                                --sw
                                
                                a               <= dataStoreAddr( 31 downto 2 ) & "00";
                                dout            <= rs2Val;
                                dataMask        <= "1111";
                                
                                wr              <= '1';
                                be              <= '1';
                                instrFetchCycle <= '0';
                                
                                rvState <=      rvsMemWrite1;
                                
                            when others =>
                                
                                rvState <= rvsIFetch0;
                                
                        end case; --funct3 is
            
                
                when rvsMemWrite1 =>
                
                    if ready = '1' then
                    
                        be      <= '0';
                        wr      <= '0';
                        
                        rvState <= rvsIFetch0;
                        
                    end if;                
                
                when rvsIExecute1Mul =>
                
                    case funct3 is 

                        when "000"  =>
                                        
                            --0
                            --mul
                            
                            rdVal   <= resultMul( 31 downto 0 );
                            rdWrite <= '1';
                            
                        when "001" =>
                        
                            --1
                            --mulh

                            rdVal   <= resultMul( 63 downto 32 );
                            rdWrite <= '1';
                            
                        when "010" =>
                        
                            --2
                            --mulsu

                            rdVal   <= resultMulsu( 63 downto 32 );
                            rdWrite <= '1';
                            
                            
                        when "011" =>
                        
                            --3
                            --mulu

                            rdVal   <= resultMuluu( 63 downto 32 );
                            rdWrite <= '1';
                                        
                        when others =>
                        
                    end case;   --funct3 is
                                                          
                    rvState <= rvsIFetch0;
                
                when rvsIExecute1Div =>

                    divRVar := divR( 30 downto 0 ) & divN( to_integer( unsigned( divI ) ) );
        
                    if signed( divRvar ) >= signed( divD ) then
          
                        divRVar := std_logic_vector( unsigned( divRVar ) - unsigned( divD ) );
                        
                        divQ( to_integer( unsigned( divI ) ) ) <= '1';
            
                    end if;
        
                    divR <= divRVar;
        
                    if divI = x"00" then
          
                        rvState <= rvsIExecute2Div;
            
                    else
          
                        divI <= std_logic_vector( unsigned( divI ) - 1 );
           
                    end if;
                    
                when rvsIExecute2Div =>
                    
                    
                    case funct3 is
                    
                        when "100" =>
                        --4
                        --div

                            if divQSign = '1' then
                            
                                rdVal   <= std_logic_vector( unsigned( -signed( divQ ) ) );
                                rdWrite <= '1';
                            
                            else
                            
                                rdVal   <= divQ;
                                rdWrite <= '1';
                            
                            end if;                        
                        
                        
                        when "101" =>
                            --5
                            --divu
                            
                            rdVal   <= divQ;
                            rdWrite <= '1';
                            
                        when "110" =>
                            --6
                            --rem
                               
                            if divRSign = '1' then
                            
                                rdVal   <= std_logic_vector( unsigned( -signed( divR ) ) );
                                rdWrite <= '1';
                            
                            else
                            
                                rdVal   <= divR;
                                rdWrite <= '1';
                                
                            end if;
                                                 
                        when "111" =>
                            --7
                            --remu
                            
                            rdVal   <= divR;
                            rdWrite <= '1';

                        when others =>
                                            
                    end case;
                    

                    rvState <= rvsIFetch0;

                when others => --rvState is
                
                    rvState <= rvsIFetch0;
                    
            end case; --rvState is
            
        
        end if; --reset = '1' or '0', rising_edge( clk )
    
    
end process;




end Behavioral;
