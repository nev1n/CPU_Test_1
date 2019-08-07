library ieee;
use ieee.std_logic_1164.all;

entity Dff_neg is
	generic (
		setup	:	time := 3 ns;
		hold	:	time := 2 ns;
		delay	:	time := 4 ns
	);
	port (
		clk		:	in std_logic;
		reset	:	in std_logic;
		d 		:	in std_logic;
		q		:	out std_logic
	);
end Dff_neg;

architecture behaviour_time_assert of Dff_neg is
--based on architectural description prescribed Designer's Guide to VHDL (2nd edition), 
--Peter J Ashden, pg: 312
begin

	
	
	assignment: q <= d after delay when falling_edge(clk) and reset = '0' else 
				 '0' when reset = '1' ; --raph
	
	setup_time_check: process is
	begin
		wait until clk='0';
		assert d'last_event >= setup
			report "Setup Time Violation!";
	end process setup_time_check;
	
	hold_time_check: process is
	begin
		wait until clk'delayed(hold) = '0';
		assert d'last_event >= hold
			report "Hold Time Violation";
	end process hold_time_check;


end architecture behaviour_time_assert;	