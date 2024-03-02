library ieee;
use ieee.std_logic_1164.all;            -- Using standard logic types
use ieee.std_logic_unsigned.all;        -- Using unsigned arithmetic operations for the adder

-- Define the entity for the testbench. There are no ports as this is a top-level entity.
entity tb_four_bit_adder is
end entity tb_four_bit_adder;

-- Define the architecture of the testbench
architecture behavior of tb_four_bit_adder is 
    -- Component Declaration for the Unit Under Test (UUT)
    component four_bit_adder
        port(
            a, b : in  std_logic_vector(3 downto 0);  -- Define 4-bit inputs a and b
            sum : out std_logic_vector(3 downto 0);   -- Define 4-bit output for the sum 
            carry_out : out std_logic                 -- Define output for the carry out
        );
    end component;
    
    -- Inputs as signals
    signal a, b : std_logic_vector(3 downto 0);  -- Signals to hold inputs a and b
    -- Outputs as signals
    signal sum : std_logic_vector(3 downto 0);   -- Signal to hold the output sum
    signal carry_out : std_logic;                -- Signal to hold the carry out

begin 
    -- Instantiate the Unit Under Test (UUT)
    uut: four_bit_adder port map (
          a => a,
          b => b,
          sum => sum,
          carry_out => carry_out
        );

    -- Stimulus process to simulate the inputs and observe the outputs
    stim_proc: process
    begin		
        -- Example test case 1: Adding 1 (0001) and 3 (0011)
        a <= "0001"; b <= "0011";  
        wait for 100 ns;

        -- Example test case 2: Adding 4 (0100) and 5 (0101)
        a <= "0100"; b <= "0101";  
        wait for 100 ns;

        wait; -- Wait indefinitely; the simulation will stop here
    end process;
end architecture behavior;