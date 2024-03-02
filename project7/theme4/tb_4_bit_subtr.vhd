-- Include the IEEE library for standard logic components.
library ieee;
-- Use the standard logic 1164 package for basic logic and signal types.
use ieee.std_logic_1164.all;

-- Declare the entity for the testbench. It doesn't have ports as it's a top-level entity.
entity tb_fourbitsubtractor is
end tb_fourbitsubtractor;

-- Define the architecture (behavior) of the testbench.
architecture behavior of tb_fourbitsubtractor is 
    -- Component declaration for the 4-bit subtractor.
    component fourbitsubtractor
        port( a : in  std_logic_vector(3 downto 0);
              b : in  std_logic_vector(3 downto 0);
              borrowin : in  std_logic;
              diff : out  std_logic_vector(3 downto 0);
              borrowout : out  std_logic);
    end component;

    -- Inputs for the UUT (Unit Under Test)
    signal a : std_logic_vector(3 downto 0) := (others => '0');
    signal b : std_logic_vector(3 downto 0) := (others => '0');
    signal borrowin : std_logic := '0';

    -- Outputs for the UUT
    signal diff : std_logic_vector(3 downto 0);
    signal borrowout : std_logic;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: fourbitsubtractor port map (a => a, b => b, borrowin => borrowin, diff => diff, borrowout => borrowout);

    -- Testbench process to apply test vectors
    stim_proc: process
    begin	
        -- Test case 1
        a <= "0101"; b <= "0011"; borrowin <= '0';  -- Set inputs
        wait for 100 ns;  -- Wait 100 ns to observe the behavior
        
        -- Test case 2
        a <= "1000"; b <= "0111"; borrowin <= '1';  -- Change inputs
        wait for 100 ns;  -- Wait another 100 ns
        
       
        -- Finish the simulation
        wait;
    end process;
end behavior;