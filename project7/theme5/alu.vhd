library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--Definition of entity:
entity alu is
port(
a,b:in std_logic_vector(7 downto 0); --8 bit inputs
aluop:in std_logic_vector(2 downto 0);--operation code
enable:in std_logic; --operation enable
clear:in std_logic; --asychronous clear
result: out std_logic_vector(7 downto 0); --result
zero:out std_logic);--zero output
end alu;

--Definition of architecture:
architecture behavioral of alu is
signal temp_result:std_logic_vector(7 downto 0);
begin
process(a,b,aluop,enable,clear)
begin
if clear='1'then
--Asychronous clear:
temp_result<=(others=>'0');
elsif enable='1'then
--Cases>>
case aluop is
when "000" => --ADDITION
temp_result <= std_logic_vector(unsigned(a) + unsigned(b));
when "001" =>  --SUBTRACTION 
temp_result <= std_logic_vector(unsigned(a) - unsigned(b));
when "010" => --AND 
temp_result <= a and b;
when "011" => -- OR
temp_result <= a or b;
when "100" => -- NOT
temp_result <= not a;
when others=>
temp_result<=(others=>'X'); --Unknown: Operator 
end case;
end if;
end process;
--Check for zero result after it:
zero<='1' when temp_result = "00000000" else '0';

--Assign the temporary result to the actual result
result<=temp_result;
end behavioral;