-- 1-bit Logic Unit

library ieee;
use ieee.std_logic_1164.all;

entity LOGIC is
  port (
    A         : in std_logic;
    B         : in std_logic;
    AndOut    : out std_logic;
    OrOut     : out std_logic
  );
end LOGIC;

architecture rtl_LOGIC of LOGIC is
  
begin
  
AndOut <= A and B;
OrOut  <= A or B;

end rtl_LOGIC;