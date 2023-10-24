module mux_71_tb;
	reg a, b, c, d, e, f, g;
	reg [2:0] select;
	wire out;
	integer i;
	
	mux_71 testable ( .a(a), .b(b), .c(c), .e(e), .d(d), .f(f), .g(g), .select(select), .out(out));
	
	initial begin
		select <= 0;
		a <= 1;
		b <= 1;
		c <= 0;
		d <= 0;
		e <= 1;
		f <= 1;
		g <= 1;
		
		for (i = 1; i < 8; i = i + 1) begin
			#5
			select <= i;
		end
	end
endmodule