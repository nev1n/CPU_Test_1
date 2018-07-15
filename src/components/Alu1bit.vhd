--  1 bit ALU based on the Computer Organization and Design of David A.Patterson and John L.Hennessy - RISC V edition, Appendix A
--  Set (into first ALU1bit block), Overflow, Zero detect would be in the final ALU implementation, ie the 32/64 bit ALU module (with a ripple carry design)

library ieee;
use ieee.std_logic_1164.all;

entity ALU1bit is
  port (
    A         : in std_logic;
    B         : in std_logic;
    Ainvert   : in std_logic;
    Binvert   : in std_logic;
    CarryIn   : in std_logic;
    Less      : in std_logic;
    Operation : in std_logic_vector(1 downto 0);
    
    Result    : out std_logic;
    CarryOut  : out std_logic
  );
end ALU1bit;

architecture struct_ALU1bit of ALU1bit is
  
  signal a_not_intermediate           :std_logic;
  signal b_not_intermediate           :std_logic;
  signal ainvert_intermediate         :std_logic;
  signal binvert_intermediate         :std_logic;
  signal logic_and_out_intermediate   :std_logic;
  signal logic_or_out_intermediate    :std_logic;
  signal adder_sum_out_intermediate   :std_logic;
  
  component MUX2x1 is
    port (
      Input1      : in std_logic;
      Input2      : in std_logic;
      SelectLine  : in std_logic;
      Output      : out std_logic
    );
  end component MUX2x1;

  component MUX4x1 is
    port (
      Input1      : in std_logic;
      Input2      : in std_logic;
      Input3      : in std_logic;
      Input4      : in std_logic;
      SelectLine  : in std_logic_vector(1 downto 0);
      Output      : out std_logic
    );
  end component MUX4x1;

  component LOGIC is
      port (
        A         : in std_logic;
        B         : in std_logic;
        AndOut    : out std_logic;
        OrOut     : out std_logic
      );
    end component LOGIC;
  
  component ADDER is 
      port (
        A         : in std_logic;
        B         : in std_logic;
        CarryIn   : in std_logic;
        Sum       : out std_logic;
        CarryOut  : out std_logic
      );
    end component ADDER;
    
   
   
    
begin
  
  --Stage 0
  a_not_intermediate <=  not A;
  b_not_intermediate <=  not B;
  
  --Stage 1
  AINVERT_MUX2x1  : MUX2x1
    port map (
      Input1      =>  A,
      Input2      =>  a_not_intermediate,    
      SelectLine  =>  Ainvert,
      Output      =>  ainvert_intermediate           --signal to 1st and gate
    );
  
  BINVERT_MUX2x1  : MUX2x1
    port map (
      Input1      =>  B,
      Input2      =>  b_not_intermediate,  
      SelectLine  =>  Binvert,  
      Output      =>  binvert_intermediate
    );
  
  --Stage 2  
  LOGIC_BLOCK  : LOGIC
    port map(
        A         =>  ainvert_intermediate,          
        B         =>  binvert_intermediate,        
        AndOut    =>  logic_and_out_intermediate,   
        OrOut     =>  logic_or_out_intermediate
    ); 
    
  ADDER_BLOCK  : ADDER
    port map(
      A         =>  ainvert_intermediate,          
      B         =>  binvert_intermediate,        
      CarryIn   =>  CarryIn,   
      Sum       =>  adder_sum_out_intermediate,      
      CarryOut  =>  CarryOut
    );
  
  --Stage 3  
  OPERATION_MUX   : MUX4x1
    port map(
      Input1      =>  logic_and_out_intermediate,       
      Input2      =>  logic_or_out_intermediate,
      Input3      =>  adder_sum_out_intermediate, 
      Input4      =>  Less, 
      SelectLine  =>  Operation,
      Output      =>  Result      
    );
        
   
end struct_ALU1bit; 