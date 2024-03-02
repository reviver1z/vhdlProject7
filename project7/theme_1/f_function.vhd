library ieee; --standard library
use ieee.std_logic_1164.all; --Use the standard logic package 

--Define the entity for the function F
entity f_function is
port(
x:in std_logic; --Input x
y:in std_logic; --Input y
z:in std_logic; --Input z
f:out std_logic); --Output z
end f_function;

--Define the architecture of the function:
architecture Behavioral of f_function is
begin 
--Implementation of the function: F=('X+Y)*(X+'Y)*(X+Z')
F<=(NOT X OR Y) AND (X OR NOT Y) AND (X OR NOT Z);
end Behavioral;