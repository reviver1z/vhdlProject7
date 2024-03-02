-- Importing the IEEE library for standard logic elements.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Definition of the entity negedge_ff. It's the interface of the flip-flop.
entity flip_flop_a is
    -- Declaration of the ports (inputs and outputs).
    Port ( clk : in STD_LOGIC;       -- Input clock signal
           rst : in STD_LOGIC;       -- Input synchronous reset
           D : in STD_LOGIC;         -- Input data
           Q : out STD_LOGIC);       -- Output Q representing the state of the flip-flop
end flip_flop_a;

-- Behavioral architecture definition for the negedge_ff.
architecture Behavioral of flip_flop_a is
begin
    -- Process block triggered by changes in 'clk' or 'rst'.
    process(clk, rst)
    begin
        if rst = '1' then           -- Check if reset is high.
            Q <= '0';                -- If reset is active, set Q to 0.
        elsif falling_edge(clk) then -- Check for falling edge of the clock.
            Q <= D;                  -- On falling edge, Q takes the value of D (input data).
        end if;
    end process;
end Behavioral;
