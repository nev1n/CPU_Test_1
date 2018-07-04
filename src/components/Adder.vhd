--based on VHDL implementation @ https://www.nandland.com/vhdl/modules/module-full-adder.html

library ieee;
use ieee.std_logic_1164.all;

entity ADDER is
  port (
    A         : in std_logic;
    B         : in std_logic;
    CarryIn   : in std_logic;
    Sum       : out std_logic;
    CarryOut  : out std_logic
  );
end Adder;

architecture rtl_ADDER of ADDER is
  
  signal sum_intermediate_1   : std_logic;
  signal carry_intermediate_1 : std_logic;
  signal carry_intermediate_2 : std_logic; 
  
begin
  
  --Stage 1
  sum_intermediate_1 <= A xor B;
  
  --Stage 2
  carry_intermediate_1  <= sum_intermediate_1 and CarryIn;
  carry_intermediate_2  <= A and B;  
  
  --Stage 3
  Sum       <= sum_intermediate_1 xor CarryIn;
  CarryOut  <= carry_intermediate_1 or carry_intermediate_2;
  
end rtl_ADDER;  