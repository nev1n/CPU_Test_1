-- 2 to 1 mux (Single bit)
-- based on VHDL implementation @ https://www.nandland.com/vhdl/modules/mux-multiplexor-in-fpga-vhdl-verilog.html

library ieee;
use ieee.std_logic_1164.all;

entity MUX2x1 is
  port (
    Input1      : in std_logic;
    Input2      : in std_logic;
    SelectLine  : in std_logic;
    Output      : out std_logic
    );
end entity MUX2x1;

architecture rtl_MUX2x1 of MUX2x1 is
begin
  Output <= Input1 when SelectLine = '0' else Input2;
end rtl_MUX2x1;
