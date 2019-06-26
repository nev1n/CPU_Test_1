--SlackMonitor

library ieee;
use ieee.std_logic_1164.all;

entity SlackMonitor is 
	port (
		clk				:	in std_logic;
		reset			:	in std_logic;
		data_in			:	in std_logic;
		captureEnable	:	in std_logic;
		data_out		:	in std_logic;
		slack_val		:	out std_logic_vector(3 downto 0);
		warning			:	out std_logic
		);
end SlackMonitor;

architecture behaviour_1 of SlackMonitor is

	signal delay2,delay3,delay4	:	std_logic;
	signal slack_val_war		:	std_logic;	 	
begin
	
	
	
	Level1Dff	:	entity work.Dff port map (captureEnable, reset, data_in, slack_val_war);
	slack_val(0) <= slack_val_war;
	
	Level2delay	:	entity work.DelayElement port map(captureEnable, delay2);
	Level2Dff	:	entity work.Dff port map (delay2, reset, data_in, slack_val(1));
	
	Level3delay	:	entity work.DelayElement port map(delay2, delay3);
	Level3Dff	:	entity work.Dff port map (delay3, reset, data_in, slack_val(2));
	
	Level4delay	:	entity work.DelayElement port map(delay3, delay4);
	Level4Dff	:	entity work.Dff port map (delay4, reset, data_in, slack_val(3));
	
	 
	-- warning generation with first slack val. Can this be dynamic?
	warning <= data_out xor slack_val_war;
	
end architecture behaviour_1;
