library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu_tb is
end alu_tb;

architecture behavioral of alu_tb is
    signal a, b, result: std_logic_vector(7 downto 0);
    signal aluop: std_logic_vector(2 downto 0);
    signal enable, clear, zero: std_logic;

    component alu is
        port(
            a, b: in std_logic_vector(7 downto 0);
            aluop: in std_logic_vector(2 downto 0);
            enable, clear: in std_logic;
            result: out std_logic_vector(7 downto 0);
            zero: out std_logic
        );
    end component;

begin
    uut: alu port map(a => a, b => b, aluop => aluop, enable => enable, clear => clear, result => result, zero => zero);

    tb: process
    begin
        -- Initialize signals
        a <= "00000000";
        b <= "00000000";
        aluop <= "000";
        enable <= '0';
        clear <= '0';
        wait for 10 ns;

        -- Test case 1: Addition
        a <= "00000001";
        b <= "00000001";
        aluop <= "000";
        enable <= '1';
        wait for 10 ns;

        -- Test case 2: Subtraction
        a <= "00000010";
        b <= "00000001";
        aluop <= "001";
        wait for 10 ns;

        -- Add more test cases as needed

        -- End of testbench
        wait;
    end process tb;
end behavioral;