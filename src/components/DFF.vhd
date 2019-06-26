library ieee;
use ieee.std_logic_1164.all;

entity Dff is
	generic (
		setup	:	time := 0 ns;
		hold	:	time := 0 ns;
		delay	:	time := 0 ns
	);
	port (
		clk		:	in std_logic;
		reset	:	in std_logic;
		d 		:	in std_logic;
		q		:	out std_logic
	);
end Dff;

architecture behaviour of Dff is
begin

	process (clk, reset)
		variable result	: std_logic;				-- result is variable ':='
	--	variable delay	: time := 0 ns; 
	begin
		if(reset = '1') then
			result := '0';			
		elsif rising_edge(clk) then
			result := d;
		end if;		
	q <= result after delay;
	end process;

end architecture;
	