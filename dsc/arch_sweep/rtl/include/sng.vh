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

//SNG used for DSC (counter instead of LFSR)
module sng_dsc_multi #(parameter WIDTH=4, parameter NUM_INPUTS=1) (
	clk,
	rst,
	en,
	bin_in,
	sn_out,
	ctr_overflow
);


input 			  clk,rst,en;
input [WIDTH-1:0] bin_in [NUM_INPUTS-1:0];

output                  ctr_overflow;
output [NUM_INPUTS-1:0] sn_out;
           

wire [WIDTH-1:0] ctr_out;
   
   
counter #(.WIDTH(WIDTH), .STRIDE(1)) ctr (
	.clk(clk),
	.rst(rst),
	.en(en),
	.countval(ctr_out),
	.overflow(ctr_overflow)
);

   genvar        i;
   generate
      for(i=0;i<NUM_INPUTS;i++) begin
         assign sn_out[i] = (bin_in[i] > ctr_out);
      end
   endgenerate
   
endmodule //sng_dsc_multi

module dsc_max #(parameter NUM_INPUTS) (in,out);
   input [NUM_INPUTS-1:0] in;
   output                 out;
   assign out = |in;
endmodule // dsc_max
  
module dsc_min #(parameter NUM_INPUTS) (in,out);
   input [NUM_INPUTS-1:0] in;
   output                 out;
   assign out = &in;
endmodule // dsc_min

module sng_dsc_max #(parameter DATA_WIDTH=4, parameter NUM_INPUTS=1) (
	clk,
	rst,
	en,
	bin_in,
	sn_out,
	ctr_overflow
);


input 			  clk,rst,en;
input [DATA_WIDTH-1:0] bin_in [NUM_INPUTS-1:0];

output ctr_overflow;
output sn_out;
           
wire [NUM_INPUTS-1:0] sn_out_pre;
   
sng_dsc_multi #(.WIDTH(DATA_WIDTH),.NUM_INPUTS(NUM_INPUTS)) sng_multi (
.clk(clk),
.rst(rst),
.en(en),
.bin_in(bin_in),
.sn_out(sn_out_pre),
.ctr_overflow(ctr_overflow)                                                                 
);
   
dsc_max #(.NUM_INPUTS(NUM_INPUTS)) max_gate(.in(sn_out_pre),.out(sn_out));
   
   
endmodule //sng_dsc_max

module sng_dsc_min #(parameter WIDTH=4, parameter NUM_INPUTS=1) (
	clk,
	rst,
	en,
	bin_in,
	sn_out,
	ctr_overflow
);


input 			  clk,rst,en;
input [WIDTH-1:0] bin_in [NUM_INPUTS-1:0];

output ctr_overflow;
output sn_out;
           
wire [NUM_INPUTS-1:0] sn_out_pre;
   
sng_dsc_multi #(.WIDTH(WIDTH),.NUM_INPUTS(NUM_INPUTS)) sng_multi (
.clk(clk),
.rst(rst),
.en(en),
.bin_in(bin_in),
.sn_out(sn_out_pre),
.ctr_overflow(ctr_overflow)                                                                 
);
   
dsc_min #(.NUM_INPUTS(NUM_INPUTS)) min_gate(.in(sn_out_pre),.out(sn_out)); 
   
endmodule //sng_dsc_min


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
