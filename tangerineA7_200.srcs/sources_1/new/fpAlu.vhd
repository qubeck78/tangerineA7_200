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

--components
COMPONENT fpAddSub
  PORT (
    aclk : IN STD_LOGIC;
    s_axis_a_tvalid : IN STD_LOGIC;
    s_axis_a_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axis_b_tvalid : IN STD_LOGIC;
    s_axis_b_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axis_operation_tvalid : IN STD_LOGIC;
    s_axis_operation_tdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axis_result_tvalid : OUT STD_LOGIC;
    m_axis_result_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) 
  );
END COMPONENT; 


COMPONENT fpMul
  PORT (
    aclk : IN STD_LOGIC;
    s_axis_a_tvalid : IN STD_LOGIC;
    s_axis_a_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axis_b_tvalid : IN STD_LOGIC;
    s_axis_b_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_result_tvalid : OUT STD_LOGIC;
    m_axis_result_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) 
  );
END COMPONENT; 

COMPONENT fpDiv
  PORT (
    aclk : IN STD_LOGIC;
    s_axis_a_tvalid : IN STD_LOGIC;
    s_axis_a_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axis_b_tvalid : IN STD_LOGIC;
    s_axis_b_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_result_tvalid : OUT STD_LOGIC;
    m_axis_result_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) 
  );
END COMPONENT; 

--signals

--registers signals
type    regState_T is ( rsWaitForRegAccess, rsWaitForResult, rsWaitForBusCycleEnd );
signal  regState:       regState_T;

--alu signals

signal trigger:     std_logic;
signal command:     std_logic_vector( 31 downto 0 );
signal fA:          std_logic_vector( 31 downto 0 );
signal fB:          std_logic_vector( 31 downto 0 );
signal fC:          std_logic_vector( 31 downto 0 );
signal fResult:     std_logic_vector( 31 downto 0 );

--fp components signals
signal fpAddSubValid:   std_logic;
signal fpAddSubDout:    std_logic_vector( 31 downto 0 );

signal fpMulValid:      std_logic;
signal fpMulDout:       std_logic_vector( 31 downto 0 );

signal fpDivValid:      std_logic;
signal fpDivDout:       std_logic_vector( 31 downto 0 );

signal fpReady:         std_logic;

begin


registers: process( all )
   begin

      if rising_edge( clock ) then
      
         if reset = '1' then
         
            
            ready               <= '0';  
            regState            <= rsWaitForRegAccess;           
       
            trigger             <= '0';     
            fa                  <= ( others => '0' );
            fb                  <= ( others => '0' );
            fc                  <= ( others => '0' );
            command             <= ( others => '0' );
            
            fpReady             <= '1';
            
         else
         
            trigger             <= '0';     

            case command( 7 downto 0 ) is
            
                when x"01" =>
                
                    if fpAddSubValid = '1' then
                    
                        fpReady <= '1';
                        
                    end if;
                    
                when x"02" =>
                
                    if fpMulValid = '1' then
                    
                        fpReady <= '1';
                        
                    end if;

                when x"03" =>
                
                    if fpDivValid = '1' then
                    
                        fpReady <= '1';
                        
                    end if;

                when others =>
                
                    fpReady <= '1';
                    
            end case;
            

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
                        
                            regState <= rsWaitForBusCycleEnd;

                        --0x04 r- component version                       
                        when x"01" =>
                     
                            dout  <= x"20241228";
                        
                            ready <= '1';
                            
                            regState <= rsWaitForBusCycleEnd;

                        --0x08 rw command                       
                        when x"02" =>
                     
                            dout  <= command;
                        
                            if wr = '1' then
                            
                                command <= din;
                                trigger <= '1';     
                                fpReady <= '0';
                                               
                            end if;
                            
                            ready <= '1';
                            
                            regState <= rsWaitForBusCycleEnd;

                        --0x0c rw fA                       
                        when x"03" =>
                     
                            dout  <= fA;
                        
                            if wr = '1' then
                            
                                fA <= din;
                            
                            end if;
                            
                            ready <= '1';

                            regState <= rsWaitForBusCycleEnd;

                        --0x10 rw fB                       
                        when x"04" =>
                     
                            dout  <= fB;
                        
                            if wr = '1' then
                            
                                fB <= din;
                            
                            end if;
                            
                            ready <= '1';

                            regState <= rsWaitForBusCycleEnd;

                        --0x14 rw fC                       
                        when x"05" =>
                     
                            dout  <= fC;
                        
                            if wr = '1' then
                            
                                fC <= din;
                            
                            end if;
                            
                            ready <= '1';

                            regState <= rsWaitForBusCycleEnd;

                        --0x18 r- fResult                       
                        when x"06" =>
                     
                            if fpReady = '1' then
                            
                                dout  <= fResult;
                                                    
                                ready <= '1';
                            
                                regState <= rsWaitForBusCycleEnd;

                            else
                            
                                regState <= rsWaitForResult;
                            
                            end if;
                            
                        when others =>
                        
                            dout  <= ( others => '0' );
                            ready <= '1';
                            
                            regState <= rsWaitForBusCycleEnd;
                           
                     end case; -- a( 7 downto 0 ) is
                     
                  
                  end if; -- ce = '1';
            
                when rsWaitForResult =>
                
                    if fpReady = '1' then
                    
                        dout  <= fResult;
                                            
                        ready <= '1';
                    
                        regState <= rsWaitForBusCycleEnd;
        
                    end if;
                             
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


fresult <= fpAddSubDout when command( 7 downto 0 ) = x"01" else 
           fpMulDout    when command( 7 downto 0 ) = x"02" else 
           fpDivDout    when command( 7 downto 0 ) = x"03" else 
            
           ( others => '0' );

fpAddSubInst:fpAddSub
port map(
    aclk                    => clock,
    s_axis_a_tvalid         => trigger,
    s_axis_a_tdata          => fA,
    s_axis_b_tvalid         => trigger,
    s_axis_b_tdata          => fB,
    s_axis_operation_tvalid => trigger,
    s_axis_operation_tdata  => "0000000" & command( 31 ),
    m_axis_result_tvalid    => fpAddSubValid,
    m_axis_result_tdata     => fpAddSubDout
  );
      
fpMulinst:fpMul
port map(
    aclk                    => clock,
    s_axis_a_tvalid         => trigger,
    s_axis_a_tdata          => fA,
    s_axis_b_tvalid         => trigger,
    s_axis_b_tdata          => fB,
    m_axis_result_tvalid    => fpMulValid,
    m_axis_result_tdata     => fpMulDout
  );

fpDivInst:fpDiv
port map(
    aclk                    => clock,
    s_axis_a_tvalid         => trigger,
    s_axis_a_tdata          => fA,
    s_axis_b_tvalid         => trigger,
    s_axis_b_tdata          => fB,
    m_axis_result_tvalid    => fpDivValid,
    m_axis_result_tdata     => fpDivDout 
  );

end behavior;
