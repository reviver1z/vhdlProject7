library ieee;
use ieee.std_logic_1164.all;

--Define the entity for the function_f
entity function_f is
port(
x:in std_logic; --Input x needed
y:in std_logic; --Input y needed 
z:in std_logic; --Input z needed 
f:out std_logic); --Output f needed
end entity function_f;

--Define the architecture (structural) of the function_f:
architecture structural of function_f is
--Signal declarations for intermediate values:
signal x_not,y_not,z_not:std_logic;
signal term1,term2,term3:std_logic;
begin 
--Creating the NOT operations:
x_not<=not x;
y_not<=not y;
z_not<=not z;
--Creatinjg the first term (X'+Y):
term1<=x_not or y;
--Creating the second term (X+Y'):
term2<=x or y_not;
--Creating the third term (X+Z'):
term3<=x or z_not;
--Final AND operation to combine the terms:
f<=term1 AND term2 AND term3;
end architecture structural;