library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

--entity bit_subtr:
entity bit_subtr is 
port(
a:in std_logic_vector(3 downto 0); --4 bit input 
b:in std_logic_vector(3 downto 0); --4 bit input 
borrowin:in std_logic; -- a single bit for incoming borrow
diff:out std_logic_vector(3 downto 0); --output 'diff', the 4 bit difference result;
borrowout:out std_logic);
end bit_subtr;

--architecture behavioral:
architecture behavioral of bit_subtr is
begin
--Begin the description in a process:
process(a,b,borrowin)
variable temp:std_logic_vector(4 downto 0);--Temporary variable to hold values
begin
--Calculate the difference and the borrow:
temp:=('0'&a)-('0'&b) - borrowin;
diff<=temp(3 downto 0); --Assign them
borrowout<=temp(4); --Assign 1 bit to borrowout
end process;
end behavioral;