`timescale 1 ms / 1 ms

module wait_test(
input wire clk
);




reg A; reg B;
reg G0; reg G1;
wire [31:0] int1 = 0;
wire [31:0] int2 = 1;
wire flt1 = 1.0;
wire [5:0] sig1 = 1'b0;
wire [5:0] sig2 = 1'b0;
wire [5:0] sig3 = 1'b0;

  always begin
      WAIT STATEMENT // wait();
  end

    always begin
      G0 <= 1'b1;
    G1 <= 1'b0;
    WAIT STATEMENT // wait();
  end

    always begin
      wait (clk == 1'b1);
  end

    always begin
      #50;
    #50;
  end

    always begin
    end

    always begin
      @(A, B);
    A <= 1'b1;
    B <= 1'b0;
    @(A, B);
    A <= 1'b0;
    B <= 1'b1;
  end

  
endmodule
