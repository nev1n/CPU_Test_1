--TB for Muller C mechanism
library ieee;
use ieee.std_logic_1164.all;

entity mullerclat_TB is
end mullerclat_TB;

architecture behaviour_mullerclat_TB of mullerclat_TB is
	
	constant clk_del_time			: time := 10 ns;	
	signal clk						: std_logic := '0';
	signal clk_del, reset			: std_logic;
	signal simIn, simOut, simErr	: std_logic;	
begin
	
	 reset <= '1', '0' after 2 ns;
	
	Clock:
		clk 	<= not clk after 20 ns;
		clk_del <= clk'delayed(clk_del_time); 

	UUT_MullerCLatchBlock:
		entity work.mullerclat generic map (0 ns, 0 ns, 0 ns) port map (clk, reset, simIn, simOut,simErr );		

	simIn <= '0', '1' after 15 ns, '0' after 25 ns, 
			'1' after 59 ns, '0' after 65 ns, 
			'1' after 90 ns, '0' after 101 ns, 
			'1' after 139 ns, '0' after 141 ns; 	
	
	-- stimuli: process is
	-- begin
	
		-- simIn <= '1';
		-- wait for 10 ns;
		
		-- simIn <= '0';
		-- wait for 10 ns;
		
	-- end process;
	-- simIn <= '1';

	end behaviour_mullerclat_TB;