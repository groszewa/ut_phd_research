`ifndef __SNG__
`define __SNG__

`include "counters.vh"
`include "lfsr.vh"

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

output [STRIDE-1:0] sn_out;
output              ctr_overflow;

wire [WIDTH-1:0] ctr_out;

counter #(.WIDTH(WIDTH), .STRIDE(STRIDE)) ctr (
	.clk(clk),
	.rst(rst),
	.en(en),
	.countval(ctr_out),
	.overflow(ctr_overflow)
);

assign sn_out[0] = (bin_in > ctr_out);
   
if (STRIDE>1) begin
   assign sn_out[1] = (bin_in > (ctr_out+1));
end
if (STRIDE>2) begin
   assign sn_out[2] = (bin_in > (ctr_out+2));
   assign sn_out[3] = (bin_in > (ctr_out+3));   
end 
   
endmodule //sng_dsc

//LFSR used for SC computation
module sng_sc_8bit #(parameter FLAVOR=0) (
	clk,
	rst,
	en,
	bin_in,
	sn_out,
	ctr_overflow
);

input 			  clk,rst,en;
input [3:0] bin_in;

output [0:0] sn_out;
output              ctr_overflow;

wire [3:0] ctr_out;

lfsr16 #(.FLAVOR(FLAVOR)) ctr (
	.clk(clk),
	.rst(rst),
	.en(en),
	.countval(ctr_out),
	.overflow(ctr_overflow)
);

assign sn_out[0] = (bin_in > ctr_out[3:0]);
   
   
endmodule // sng_sc_8bit


`endif
