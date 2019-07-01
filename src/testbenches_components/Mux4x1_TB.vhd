
library ieee;
use ieee.std_logic_1164.all;

entity MUX2x1_TB is 
end MUX2x1_TB;

architecture behaviour_MUX2x1_TB of MUX2x1_TB is
  
  signal simulated_A        : std_logic := '0';
  signal simulated_B        : std_logic := '0';
  signal simulated_Sel      : std_logic := '0';
  signal simulated_Out      : std_logic;
  
  
  component MUX2x1 is
    port (
      Input1      : in std_logic;
      Input2      : in std_logic;
      SelectLine  : in std_logic;
      Output      : out std_logic
    );
end component MUX2x1;

begin
  
  MUX2x1_INSTANCE : MUX2x1
    port map(
      Input1      => simulated_A,
      Input2      => simulated_B,
      SelectLine  => simulated_Sel,
      Output      => simulated_Out 
    );
    
  process is
  begin
    simulated_A       <= '0';
    simulated_B       <= '0';
    simulated_Sel     <= '0';
    wait for 10 ns;
    
    simulated_A       <= '0';
    simulated_B       <= '0';
    simulated_Sel     <= '1';
    wait for 10 ns;
    
    simulated_A       <= '0';
    simulated_B       <= '1';
    simulated_Sel     <= '0';
    wait for 10 ns;
    
    simulated_A       <= '0';
    simulated_B       <= '1';
    simulated_Sel     <= '1';
    wait for 10 ns;
    
    simulated_A       <= '1';
    simulated_B       <= '0';
    simulated_Sel     <= '0';
    wait for 10 ns;
    
    simulated_A       <= '1';
    simulated_B       <= '0';
    simulated_Sel     <= '1';
    wait for 10 ns;
    
    simulated_A       <= '1';
    simulated_B       <= '1';
    simulated_Sel     <= '0';
    wait for 10 ns;
    
    simulated_A       <= '1';
    simulated_B       <= '1';
    simulated_Sel     <= '1';
    wait for 10 ns;
  end process;  

  
end behaviour_MUX2x1_TB;