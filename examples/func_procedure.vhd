library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity func_procedure is
    port (
    clk : in std_logic
    );
end entity func_procedure;

architecture rtl of func_procedure is

   procedure proc_test (x, y : in std_logic;
                        signal sigz : in std_logic_vector(1 downto 0);
                        signal z : out std_logic_vector(3 downto 0)) is
     variable zz : natural := 15;
     variable xx, yy : unsigned(3 downto 0);
   begin
     xx := to_unsigned(zz, 4);
     yy := x & x & x & x;
     z <= std_logic_vector((xx and yy) and (x & y & x & y));
   end procedure proc_test;

   procedure proc1_test (z, x : in std_logic;
                         signal sigz : in std_logic_vector(1 downto 0);
                         signal y : out std_logic_vector(3 downto 0)) is
     variable zz : natural := 15;
     variable xx, yy : unsigned(3 downto 0);
   begin
     xx := to_unsigned(zz, 4);
     yy := z & z & z & z;
     y <= std_logic_vector((xx and yy) and (x & z & x & z));
   end proc1_test;
   
    procedure proc2_test (x, y : in std_logic := '1';
                        signal sigz : in std_logic_vector(1 downto 0);
                        signal z : out std_logic_vector(3 downto 0)) is
     variable zz : natural := 15;
     variable xx, yy : unsigned(3 downto 0);
   begin
     xx := to_unsigned(zz, 4);
     yy := x & x & x & x;
     z <= std_logic_vector((xx and yy) and (x & y & x & y));
   end procedure proc2_test;

   --! Bit width calculator from stackoverflow.com/questions/12750007/
   --! vhdl-use-the-length-of-an-integer-generic-to-determine-number-of-select-lines
   function f_log2 (x : POSITIVE) return NATURAL is
      variable i : NATURAL;
   begin
      for i in 0 to x loop
         i := i + 1;
      end loop;
      return i;
   end function f_log2;

	-- ADC data storage
	constant ADC_NUM_WORDS : positive := f_log2(4);

 begin


end rtl;
