-- Importing the IEEE library for standard logic elements.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Testbench entity, it has no ports as it's a top-level entity in simulation.
entity counter_4bit_tb is
-- Empty entity as this is a testbench.
end counter_4bit_tb;

-- Architecture of the testbench. No need for a Behavioral/Structural distinction here, but using Behavioral as a convention.
architecture Behavioral of counter_4bit_tb is

    -- Signal declaration for the testbench
    signal tb_clk : STD_LOGIC := '0';           -- Testbench clock signal, initialized to '0'
    signal tb_rst : STD_LOGIC := '1';           -- Testbench reset signal, initialized to '1' (active)
    signal tb_count : STD_LOGIC_VECTOR(3 downto 0); -- Testbench count signal to observe the counter output

    -- Component declaration of the counter we're testing.
    component counter_4bit
        Port ( clk : in STD_LOGIC;
               rst : in STD_LOGIC;
               count : out STD_LOGIC_VECTOR(3 downto 0));
    end component;

begin

    -- Instantiating the counter component and connecting it to the testbench signals.
    uut: counter_4bit Port Map (
        clk => tb_clk,
        rst => tb_rst,
        count => tb_count
    );

    -- Clock process to generate a clock signal.
    clk_process :process
    begin
        tb_clk <= '0'; wait for 10 ns;  -- Clock low for 10 ns
        tb_clk <= '1'; wait for 10 ns;  -- Clock high for 10 ns
        -- This creates a 20 ns clock period.
    end process;

    -- Test process to define the test scenario.
    stim_proc: process
    begin       
        -- Reset the counter initially
        tb_rst <= '1'; wait for 20 ns;
        tb_rst <= '0'; wait for 20 ns;

        -- Let the counter run for some time
        wait for 200 ns;

        -- Assert and check the expected values at specific times, here as an example
        -- assert tb_count = "expected_value" report "Test failed" severity error;

        -- Apply reset in the middle of operation to see if it correctly resets the counter
        tb_rst <= '1'; wait for 20 ns;
        tb_rst <= '0'; wait for 100 ns;

        -- Finish the simulation
        wait;
    end process;

end Behavioral;