-- Nearly useless stub, it's here to support genericmap.vhd
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

entity dsp is generic(
  rst_val   : std_logic := '0';
  thing_size: integer := 201;
  bus_width : integer := 24
);
    port(
      -- Inputs
      clk, rstn : in std_logic;
      en, start : in std_logic;
      param : in std_logic_vector(7 downto 0);
      addr : in std_logic_vector(2 downto 0);
      din : in std_logic_vector(bus_width-1 downto 0);
      we : in std_logic;
      memdin : out std_logic_vector(13 downto 0);
      -- Outputs
      dout : out std_logic_vector(bus_width-1 downto 0);
      memaddr : out std_logic_vector(5 downto 0);
      memdout : out std_logic_vector(13 downto 0)
      );
end;

architecture rtl of dsp is
    signal foo : std_logic;
begin
    process(clk) begin
       dout <= std_logic_vector(to_unsigned(1,bus_width));
    end process;
end rtl;
