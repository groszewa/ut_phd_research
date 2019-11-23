//use custom CLOG2 macro which is synthesizable
`define CLOG2(x)  \
	(x<=1)    ? 0   : \
	(x<=2)    ? 1   : \
	(x<=4)    ? 2   : \
	(x<=8)    ? 3   : \
	(x<=16)   ? 4   : \
	(x<=32)   ? 5   : \
	(x<=64)   ? 6   : \
	(x<=128)  ? 7   : \
	(x<=256)  ? 8   : \
	(x<=512)  ? 9   : \
	(x<=1024) ? 10  : -1

//basic counter parametrized
module counter #(parameter WIDTH=4, parameter STRIDE=1) (
    clk,
    en,
	rst,
	overflow,
	countval
);

	output reg [WIDTH-1:0] countval;
	output reg             overflow;

	input clk,rst,en;

	always @(posedge clk or posedge rst) begin
		if(rst) begin
			countval <= 0;
			overflow <= 0;
		end else if (en) begin
			countval <= countval + STRIDE;
			overflow <= (&countval[WIDTH-1:`CLOG2(STRIDE)]);
		end // else if (en)
	end //always
endmodule // counter


//SNG used for DSC (counter instead of LFSR)
module sng_dsc #(parameter WIDTH=4, parameter STRIDE=1) (
	clk,
	rst,
	en,
	bin_in,
	sn_out,
	ctr_overflow
);

input 			  clk,rst,en;
input [WIDTH-1:0] bin_in;

output sn_out,ctr_overflow;

wire [WIDTH-1:0] ctr_out;

counter #(.WIDTH(WIDTH), .STRIDE(STRIDE)) ctr (
	.clk(clk),
	.rst(rst),
	.en(en),
	.countval(ctr_out),
	.overflow(ctr_overflow)
);

assign sn_out = (bin_in > ctr_out);

endmodule //sng_dsc

