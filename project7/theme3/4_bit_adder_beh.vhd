library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all; -- Necessary for arithmetic operations on std_logic_vector

entity bit_adder_beh is
    port(
        a, b : in std_logic_vector(3 downto 0); -- 4-bit inputs
        sum : out std_logic_vector(3 downto 0); -- 4-bit output for sum
        carry : out std_logic                   -- Output for carry
    );
end bit_adder_beh;

architecture behavioral of bit_adder_beh is
begin
    process(a, b)
        variable temp_sum : std_logic_vector(4 downto 0); -- Includes the 1-bit carry
    begin 
        temp_sum := ('0' & a) + ('0' & b); -- Perform addition
        sum <= temp_sum(3 downto 0);       -- Assign lower 4 bits to sum
        carry <= temp_sum(4);              -- Assign the 5th bit to carry
    end process;
end architecture behavioral;
