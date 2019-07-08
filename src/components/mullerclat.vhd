--The muller corrector

library ieee;
use ieee.std_logic_1164.all;

entity mullerclat is
	port (
		clk					:	in std_logic;
		reset				:	in std_logic;
		Combout_in			:	in std_logic;
		Mc_out				:	out std_logic;	
		Or_tree_fault_bit	:	out std_logic
	);
end mullerclat;

architecture behaviour of mullerclat is
	
	signal dff1_out_sig, dff2_out_sig	:	std_logic;

begin
	Dff1:
		entity work.Dff generic map (20 ns, 15 ns, 50 ns) port map (clk, reset, Combout_in, dff1_out_sig);
	Dff2:
		entity work.Dff generic map (20 ns, 15 ns, 50 ns) port map (clk, reset, Combout_in, dff2_out_sig);
	MC:
		entity work.MullerC port map (dff1_out_sig, dff2_out_sig, Mc_out);
	
	Or_tree_fault_bit <= dff1_out_sig xor dff2_out_sig;
	
end behaviour;
