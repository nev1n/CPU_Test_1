--Delay element

library ieee;
use ieee.std_logic_1164.all;

entity DelayElement is 
	generic (Delay	: time:= 1.0 ns);
	port (
		x	: in std_logic;
		y	: out std_logic
		);
end DelayElement;

architecture behaviour_1 of DelayElement is
begin

	y <= transport x after Delay; 

end architecture behaviour_1;	

--This architecture has some issues
-- architecture behaviour_2 of DelayElement is
-- begin

	-- y <= '1' after 1 ns when x <='1' else 
		-- '0' after 1 ns when x <='0';

-- end architecture behaviour_2;		
