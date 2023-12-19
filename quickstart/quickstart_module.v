module quickstart_module(out, clk, reset);

output reg out;
input wire clk, reset;

always @ (posedge clk)
    if (reset)
        out <= 0;
    else
        out <= ~out;

endmodule
