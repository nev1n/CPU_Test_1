library ieee;
use ieee.std_logic_1164.all;

entity Dff_TB is
end Dff_TB;

architecture Behaviour_Dff_TB of Dff_TB is
	
	constant PERIOD             : time := 100 ns;
	constant RESET_DELAY        : time := 200 ns;
	constant SIMULATION_TIME    : time := 1000 ns;
	
	signal clk				: std_logic;
	signal reset			: std_logic;
	signal simulated_A		: std_logic := '0';
	signal simulated_Outp	: std_logic;

begin

	clk_process: process
	begin
		loop
			clk <= '0';
			wait for PERIOD/2;
			clk <= '1';
			wait for PERIOD/2;
			assert now < SIMULATION_TIME
				report "End of Simulation!"
				severity failure; -- throw failure to break simulation
		end loop;
	end process;

	reset <= '1', '0' after RESET_DELAY;	

	Dff_uut: 
	entity work.Dff generic map(20 ns, 15 ns, 50 ns) port map (clk, reset, simulated_A, simulated_Outp);
	
	stimuli: process is
	begin
	
		simulated_A       <= '1';
		wait for 10 ns;
		
		simulated_A       <= '0';
		wait for 10 ns;
		
	end process;
	
	
end Behaviour_Dff_TB;