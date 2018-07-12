-- Logic Unit test bench

library ieee;
use ieee.std_logic_1164.all;

entity LOGIC_TB is
end LOGIC_TB;

architecture behaviour_LOGIC_TB of LOGIC_TB is
  
  signal simulated_A        : std_logic := '0';
  signal simulated_B        : std_logic := '0';
  signal simulated_AndOut   : std_logic;
  signal simulated_OrOut    : std_logic;
  
  component LOGIC is
    port (
    A         : in std_logic;
    B         : in std_logic;
    AndOut    : out std_logic;
    OrOut     : out std_logic
    );
  end component LOGIC;

begin

  LOGIC_INSTANCE  : LOGIC
    port map(
        A         =>  simulated_A,          
        B         =>  simulated_B,        
        AndOut    =>  simulated_AndOut,   
        OrOut     =>  simulated_OrOut
    );
     
  process is
  begin
  
    simulated_A       <= '0';
    simulated_B       <= '0';
    wait for 10 ns;
    
    simulated_A       <= '0';
    simulated_B       <= '1';
    wait for 10 ns;
    
    simulated_A       <= '1';
    simulated_B       <= '0';
    wait for 10 ns;
    
    simulated_A       <= '1';
    simulated_B       <= '1';
    wait for 10 ns;
  end process;

end behaviour_LOGIC_TB;