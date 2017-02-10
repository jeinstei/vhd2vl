// File generic.vhd translated with vhd2vl v2.5 VHDL to Verilog RTL translator
// vhd2vl settings:
//  * Verilog Module Declaration Style: 1995

// vhd2vl is Free (libre) Software:
//   Copyright (C) 2001 Vincenzo Liguori - Ocean Logic Pty Ltd
//     http://www.ocean-logic.com
//   Modifications Copyright (C) 2006 Mark Gonzales - PMC Sierra Inc
//   Modifications (C) 2010 Shankar Giri
//   Modifications Copyright (C) 2002, 2005, 2008-2010, 2015 Larry Doolittle - LBNL
//     http://doolittle.icarus.com/~larry/vhd2vl/
//
//   vhd2vl comes with ABSOLUTELY NO WARRANTY.  Always check the resulting
//   Verilog for correctness, ideally with a formal verification tool.
//
//   You are welcome to redistribute vhd2vl under certain conditions.
//   See the license (GPLv2) file included with the source for details.

// The result of translation follows.  Its copyright status should be
// considered unchanged from the original VHDL.

// no timescale needed

module test(
reset,
sysclk,
a,
b,
enf,
load,
qtd,
base
);

parameter [7:0] dog_width=8'b10101100;
parameter [31:0] bus_width=32;
input reset, sysclk;
input [bus_width:0] a, b, enf, load, qtd, base;

wire reset;
wire sysclk;
wire [bus_width:0] a;
wire [bus_width:0] b;
wire [bus_width:0] enf;
wire [bus_width:0] load;
wire [bus_width:0] qtd;
wire [bus_width:0] base;


wire [1 + 1:0] foo;
reg [9:0] code; wire [9:0] code1;
wire [324:401] egg;
wire [bus_width * 3 - 1:bus_width * 4] baz;
wire [31:0] complex;

  // Example of with statement
  always @(*) begin
    case(foo[2:0])
      3'b000,3'b110 : code[9:2] <= {3'b110,egg[325:329]};
      3'b101 : code[9:2] <= 8'b11100010;
      3'b010 : code[9:2] <= {8{1'b1}};
      3'b011 : code[9:2] <= {8{1'b0}};
      default : code[9:2] <= a + b + 1'b1;
    endcase
  end

  assign code1[1:0] = a[6:5] ^ ({a[4],b[6]});
  assign foo = {(((1 + 1))-((0))+1){1'b0}};
  assign egg = {78{1'b0}};
  assign baz = {(((bus_width * 4))-((bus_width * 3 - 1))+1){1'b1}};
  assign complex = {enf,(3'b110 * load),qtd[3:0],base,5'b11001};

endmodule
