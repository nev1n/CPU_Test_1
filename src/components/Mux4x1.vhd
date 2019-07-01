-- 4 to 1 mux (Single bit)
-- based on VHDL implementation @ https://www.nandland.com/vhdl/modules/mux-multiplexor-in-fpga-vhdl-verilog.html

library ieee;
use ieee.std_logic_1164.all;

entity MUX4x1 is
  port (
    Input1      : in std_logic;
    Input2      : in std_logic;
    Input3      : in std_logic;
    Input4      : in std_logic;
    SelectLine  : in std_logic_vector(1 downto 0);
    Output      : out std_logic
    );
end entity MUX4x1;

architecture rtl_MUX4x1 of MUX4x1 is
begin
  with SelectLine select
    Output <= Input1 when "00",
              Input2 when "01",
              Input1 when "10",
              Input4 when others; 
end rtl_MUX4x1;