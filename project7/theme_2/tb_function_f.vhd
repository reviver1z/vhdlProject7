library ieee;
use ieee.std_logic_1164.all;

-- Define the entity for the testbench. There are no ports as this is a top-level entity.
entity testbench is
end entity testbench;

-- Define the architecture of the testbench
architecture behavior of testbench is 

    -- Component Declaration for the Unit Under Test (UUT)
    component function_F
    port(
         x : in  std_logic;
         y : in  std_logic;
         z : in  std_logic;
         f : out std_logic
        );
    end component;
    
   -- Inputs as signals
   signal x : std_logic := '0';
   signal y : std_logic := '0';
   signal z : std_logic := '0';

   -- Output as signal
   signal f : std_logic;

begin 

    -- Instantiate the Unit Under Test (UUT)
   uut: function_F port map (
          x => x,
          y => y,
          z => z,
          f => f
        );

   -- Stimulus process to simulate the inputs and observe the outputs
   stim_proc: process
   begin		
      -- Stimulus 1: Set X=0, Y=0, Z=0 and wait for 100 ns
      x <= '0'; y <= '0'; z <= '0';
      wait for 100 ns;

      -- Stimulus 2: Set X=0, Y=0, Z=1 and wait for 100 ns
      x <= '0'; y <= '0'; z <= '1';
      wait for 100 ns;
      -- ...

      wait; -- Wait indefinitely; the simulation will stop here
   end process;

end architecture behavior;