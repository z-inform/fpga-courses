module nco_dither_lsfr (input clk, input rst, output [3:0] out);


reg [5:0] lsfr;


assign out = lsfr[5:2];

wire lsfr_next = lsfr[0] ^ lsfr [5] ^ lsfr[4] ^ lsfr[1];

always @(posedge clk) begin
    if (rst) begin

	    lsfr <= 6'b0101;
	end
	else
	begin
		lsfr <= {lsfr[4:0], lsfr_next};
		// above line equvivalent to below 2 lines
		// lsfr[5:1] <= lsfr[4:0];
		// lsfr[0] <= lsfr_next;
	end
end
endmodule
