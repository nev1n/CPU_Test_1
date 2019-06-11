-- Logic Unit test bench

library ieee;
use ieee.std_logic_1164.all;

entity MullerC_TB is
end MullerC_TB;

architecture behaviour_MullerC_TB of MullerC_TB is
  
  signal simulated_A        : std_logic := '0';
  signal simulated_B        : std_logic := '0';
  signal simulated_Outp 	    : std_logic;
  
  component MullerC is
    port (
    A         	: in std_logic;
    B         	: in std_logic;
    Outp		: out std_logic
    );
  end component MullerC;

begin

  MullerC_INSTANCE  : MullerC
    port map(
        A         =>  simulated_A,          
        B         =>  simulated_B,        
        Outp      =>  simulated_Outp
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

end behaviour_MullerC_TB;