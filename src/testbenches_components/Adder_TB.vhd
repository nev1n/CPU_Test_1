-- Test Bench for Adder Unit

library ieee;
use ieee.std_logic_1164.all;

entity ADDER_TB is 
end ADDER_TB;

architecture behaviour_ADDER_TB of ADDER_TB is
  
  signal simulated_A        : std_logic := '0';
  signal simulated_B        : std_logic := '0';
  signal simulated_CarryIn  : std_logic := '0';
  signal simulated_Sum      : std_logic;
  signal simulated_CarryOut : std_logic;
  
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
  
  ADDER_INSTANCE  : ADDER
    port map(
      A         =>  simulated_A,          
      B         =>  simulated_B,        
      CarryIn   =>  simulated_CarryIn,   
      Sum       =>  simulated_Sum,      
      CarryOut  =>  simulated_CarryOut
    );
    
  process is
  begin
    simulated_A       <= '0';
    simulated_B       <= '0';
    simulated_CarryIn <= '0';
    wait for 10 ns;
    
    simulated_A       <= '0';
    simulated_B       <= '0';
    simulated_CarryIn <= '1';
    wait for 10 ns;
    
    simulated_A       <= '0';
    simulated_B       <= '1';
    simulated_CarryIn <= '0';
    wait for 10 ns;
    
    simulated_A       <= '0';
    simulated_B       <= '1';
    simulated_CarryIn <= '1';
    wait for 10 ns;
    
    simulated_A       <= '1';
    simulated_B       <= '0';
    simulated_CarryIn <= '0';
    wait for 10 ns;
    
    simulated_A       <= '1';
    simulated_B       <= '0';
    simulated_CarryIn <= '1';
    wait for 10 ns;
    
    simulated_A       <= '1';
    simulated_B       <= '1';
    simulated_CarryIn <= '0';
    wait for 10 ns;
    
    simulated_A       <= '1';
    simulated_B       <= '1';
    simulated_CarryIn <= '1';
    wait for 10 ns;
  end process;

end behaviour_ADDER_TB;
    
      
  
      
    