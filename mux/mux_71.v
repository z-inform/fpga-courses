module mux_71 (a, b, c, d, e, f, g, select, out);
	input a, b, c, d, e, f, g;
	input [2:0] select;
	output out;
	
	wire [6:0] in = {g, f, e, d, c, b, a};
	assign out = in[select];
endmodule