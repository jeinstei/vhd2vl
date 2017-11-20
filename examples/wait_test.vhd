library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity wait_test is
    port (
    clk : in std_logic
    );
end entity wait_test;

architecture rtl of wait_test is

signal A, B : std_logic;
signal G0, G1 : std_logic;

signal int1 : integer := 0;
signal int2 : positive := 1;
signal flt1 : real := 1.0;
signal sig1 : std_logic_vector(5 downto 0) := (others => '0');
signal sig2 : unsigned(5 downto 0) := (others => '0');
signal sig3 : signed(5 downto 0) := (others => '0');

begin

-- http://vhdl.renerta.com/mobile/source/vhd00081.htm

process
begin
wait;
end process;

G: process
begin
  G0 <= '1';
  G1 <= '0';
  wait;
end process G;

ena_proc : process
begin
wait until clk = '1';
end process;

time_wait : process
begin
wait for 50 ns;
end process;

BIN_COMP : process
begin
  wait on A, B until clk = '1';
end process BIN_COMP;


end architecture rtl;
