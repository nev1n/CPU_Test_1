--TB for razor block
library ieee;
use ieee.std_logic_1164.all;

entity razor_TB is
end razor_TB;

architecture behaviour_razor_TB of razor_TB is
	
	constant clk_del_time			: time := 1 ns;	
	signal clk						: std_logic := '0';
	signal clk_del, reset			: std_logic;
	signal simIn, simOut, simErr	: std_logic;	
begin
	
	-- reset <= '1', '0' after 2 ns;
	
	Clock:
		clk 	<= not clk after 10 ns;
		clk_del <= clk'delayed(clk_del_time); 

	UUT_Razorff:
		entity work.razor generic map (0 ns, 0 ns, 0 ns) port map (clk, clk_del, reset, simIn, simOut,simErr );		

	
	reset <= '1', '0' after 3 ns ;		
		
	-- simIn <= '0', '1' after 15 ns, '0' after 25 ns, 
			-- '1' after 59 ns, '0' after 65 ns, 
			-- '1' after 90 ns, '0' after 101 ns, 
			-- '1' after 139 ns, '0' after 141 ns; 	
	
	stimuli: process is
	begin
	
		simIn <= '0';
		--wait for 61 ns;
		wait for 7 ns;
		
		simIn <= '1';
		--wait for 121 ns;
		wait for 27 ns;
		
		simIn <= '0';
		--wait for 121 ns;
		wait for 34 ns;
		
		simIn <= '1';
		--wait for 121 ns;
		wait for 10 ns;
		
		simIn <= '0';
		
		wait; -- wait forever
		
		
		
	end process;
	-- simIn <= '1';

	end behaviour_razor_TB;