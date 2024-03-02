-- Importing the IEEE library for standard logic elements and arithmetic operations.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;           -- Standard types and declarations
use IEEE.STD_LOGIC_ARITH.ALL;          -- Arithmetic operations for logic vectors
use IEEE.STD_LOGIC_UNSIGNED.ALL;       -- Additional operations for treating logic vectors as unsigned numbers

-- Definition of the entity counter_4bit. It represents the interface of the 4-bit counter.
entity counter_4bit is
    -- Declaration of the ports (inputs and outputs).
    Port ( clk : in STD_LOGIC;         -- Input clock signal
           rst : in STD_LOGIC;         -- Input asynchronous reset
           count : out STD_LOGIC_VECTOR(3 downto 0)); -- 4-bit output vector representing the count
end counter_4bit;

-- Behavioral architecture definition for the counter_4bit.
architecture Behavioral of counter_4bit is
begin
    -- Process block triggered by changes in 'clk' or 'rst'.
    process(clk, rst)
        -- Declaration of a variable 'cnt' to keep track of the count.
        variable cnt : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    begin
        if rst = '1' then               -- Check if reset is high.
            cnt := "0000";              -- If reset is active, set the count to 0.
        elsif rising_edge(clk) then     -- Check for rising edge of the clock.
            cnt := cnt + 1;             -- On each rising edge of the clock, increment the count.
        end if;
        count <= cnt;                   -- Assign the value of 'cnt' to the output 'count'.
    end process;
end Behavioral;
