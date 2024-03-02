LIBRARY ieee;                           -- Standard library
USE ieee.std_logic_1164.ALL;            -- Use the standard logic package

-- Define the entity for the testbench. There are no ports as this is a top-level entity.
ENTITY testbench IS
END testbench;

-- Define the architecture of the testbench
ARCHITECTURE behavior OF testbench IS 

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT function_F
    PORT(
         X : IN  std_logic;            -- Input X
         Y : IN  std_logic;            -- Input Y
         Z : IN  std_logic;            -- Input Z
         F : OUT std_logic             -- Output F
        );
    END COMPONENT;
    
   --Inputs as signals
   signal X : std_logic := '0';        -- Initial value of X
   signal Y : std_logic := '0';        -- Initial value of Y
   signal Z : std_logic := '0';        -- Initial value of Z

   --Output as signal
   signal F : std_logic;               -- Output F, no initial value

BEGIN 

    -- Instantiate the Unit Under Test (UUT)
   uut: function_F PORT MAP (
          X => X,
          Y => Y,
          Z => Z,
          F => F
        );

   -- Stimulus process to simulate the inputs and observe the outputs
   stim_proc: process
   begin		
      -- Stimulus 1: Set X=0, Y=0, Z=0 and wait for 100 ns
      X <= '0'; Y <= '0'; Z <= '0';
      wait for 100 ns;

      -- Stimulus 2: Set X=0, Y=0, Z=1 and wait for 100 ns
      X <= '0'; Y <= '0'; Z <= '1';
      wait for 100 ns;
      -- ...

      wait; -- Wait indefinitely; the simulation will stop here
   end process;

END;
