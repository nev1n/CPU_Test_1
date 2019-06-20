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
    in_1         	: in std_logic;
    in_2         	: in std_logic;
    out_1		: out std_logic
    );
  end component MullerC;

begin

  MullerC_INSTANCE  : MullerC
    port map(
        in_1         =>  simulated_A,          
        in_2         =>  simulated_B,        
        out_1      =>  simulated_Outp
    );
     
  process is
  begin
	--inputs 00 test
    simulated_A       <= '0';
    simulated_B       <= '0';
    wait for 10 ns;
    
    simulated_A       <= '0';
    simulated_B       <= '1';
    wait for 10 ns;
    
    simulated_A       <= '1';
    simulated_B       <= '0';
    wait for 10 ns;
    
	-- inputs 11 test
    simulated_A       <= '1';
    simulated_B       <= '1';
    wait for 10 ns;
	
	simulated_A       <= '1';
    simulated_B       <= '0';
    wait for 10 ns;
	
	simulated_A       <= '0';
    simulated_B       <= '1';
    wait for 10 ns;
	
	--final
	simulated_A       <= '0';
    simulated_B       <= '0';
    wait for 10 ns;
	
	
  end process;

end behaviour_MullerC_TB;