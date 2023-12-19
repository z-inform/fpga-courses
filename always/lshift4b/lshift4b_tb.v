`include "lshift4b.v"

module tb;
  reg clk, rstn, d;
  wire [3:0] out;
  integer i;
  lshift4b u0 ( .d(d), .clk(clk), .rstn(rstn), .out(out));
  always #10 clk = ~clk;
  initial
  begin
    $dumpfile("build/lshift4b.vcd");
    $dumpvars;
    {clk, rstn, d} <= 0;
    #10 rstn <= 1;
    for (i = 0; i < 20; i=i+1)
    begin
      @(posedge clk) d <= $random;
    end
    #10 $finish;
  end
endmodule
