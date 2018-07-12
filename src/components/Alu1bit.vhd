--1 bit ALU

library ieee;
use ieee.std_logic_1164.all;

entity ALU1bit is
  port (
    A         : in std_logic;
    B         : in std_logic;
    Result    : out std_logic
  );
end ALU1bit;
