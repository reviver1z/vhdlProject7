-- Importing the IEEE library for standard logic elements.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Definition of the entity posedge_ff. It's the interface of the flip-flop.
entity posedge_ff is
    -- Declaration of the ports (inputs and outputs).
    Port ( clk : in STD_LOGIC;       -- Input clock signal
           rst : in STD_LOGIC;       -- Input asynchronous reset
           enable : in STD_LOGIC;    -- Input enable signal
           D : in STD_LOGIC;         -- Input data
           Q : out STD_LOGIC);       -- Output Q representing the state of the flip-flop
end posedge_ff;

-- Behavioral architecture definition for the posedge_ff.
architecture Behavioral of posedge_ff is
begin
    -- Process block triggered by changes in 'clk' or 'rst'.
    process(clk, rst)
    begin
        if rst = '1' then            -- Check if reset is high.
            Q <= '0';                 -- If reset is active, set Q to 0, regardless of the clock.
        elsif rising_edge(clk) and enable = '1' then  -- Check for rising edge of the clock and if enable is active.
            Q <= D;                   -- On rising edge and when enabled, Q takes the value of D (input data).
        end if;
    end process;
end Behavioral;
