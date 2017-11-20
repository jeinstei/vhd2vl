// File ../examples/func_procedure.vhd translated with vhd2vl v3.0 VHDL to Verilog RTL translator
// vhd2vl settings:
//  * Verilog Module Declaration Style: 2001

// vhd2vl is Free (libre) Software:
//   Copyright (C) 2001 Vincenzo Liguori - Ocean Logic Pty Ltd
//     http://www.ocean-logic.com
//   Modifications Copyright (C) 2006 Mark Gonzales - PMC Sierra Inc
//   Modifications (C) 2010 Shankar Giri
//   Modifications Copyright (C) 2002, 2005, 2008-2010, 2015 Larry Doolittle - LBNL
//     http://doolittle.icarus.com/~larry/vhd2vl/
//   Modifications (C) 2017 Rodrigo A. Melo
//
//   vhd2vl comes with ABSOLUTELY NO WARRANTY.  Always check the resulting
//   Verilog for correctness, ideally with a formal verification tool.
//
//   You are welcome to redistribute vhd2vl under certain conditions.
//   See the license (GPLv2) file included with the source for details.

// The result of translation follows.  Its copyright status should be
// considered unchanged from the original VHDL.

// no timescale needed

module func_procedure(
input wire clk
);




task proc_test;
input x, y;
input [1:0] sigz;
output reg [3:0] z;
    reg [31:0] zz = 15;
    reg [3:0] xx, yy;
begin
  xx = zz;
  yy = {x,x,x,x};
  z <= (xx & yy) & ({x,y,x,y});
endtask

task proc1_test;
input z, x;
input [1:0] sigz;
output reg [3:0] y;
    reg [31:0] zz = 15;
    reg [3:0] xx, yy;
begin
  xx = zz;
  yy = {z,z,z,z};
  y <= (xx & yy) & ({x,z,x,z});
endtask

task proc2_test;
input x, y;
input [1:0] sigz;
output reg [3:0] z;
    reg [31:0] zz = 15;
    reg [3:0] xx, yy;
begin
  xx = zz;
  yy = {x,x,x,x};
  z <= (xx & yy) & ({x,y,x,y});
endtask
  //! Bit width calculator from stackoverflow.com/questions/12750007/
//! vhdl-use-the-length-of-an-integer-generic-to-determine-number-of-select-lines
function  [31:0] f_log2;
input [31:0] x;
    reg [31:0] i;
begin
for (i=0; i <= x; i = i + 1) begin
  i = i + 1;
end
FUNCTIONNAME = i;
endfunction

  // ADC data storage
parameter ADC_NUM_WORDS = f_log2[4];


endmodule
