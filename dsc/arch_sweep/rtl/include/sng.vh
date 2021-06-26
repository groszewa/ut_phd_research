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

module comparator #(parameter WIDTH=4, parameter NUM_INPUTS=1) (bin, reference, result);
   input [WIDTH-1:0] bin, reference;
   output            result;

   assign result = (bin > reference);

endmodule // comparator


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

//module dsc_max #(parameter NUM_INPUTS) (
//    data_in,
//    data_out
//    );
//   
//    input [NUM_INPUTS-1:0] data_in;
//    output                 data_out;
//    assign data_out = |data_in;
//endmodule // dsc_max
  
//module dsc_min #(parameter NUM_INPUTS) (data_in,data_out);
//   input [NUM_INPUTS-1:0] data_in;
//   output                 data_out;
//   assign data_out = &data_in;
//endmodule // dsc_min

module sng_dsc_max #(parameter WIDTH=4, parameter NUM_INPUTS=1) (
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
   
//dsc_max #(.NUM_INPUTS(NUM_INPUTS)) max_gate(.in(sn_out_pre),.out(sn_out));
   assign sn_out = |sn_out_pre; 
   
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
   
  //dsc_min #(.NUM_INPUTS(NUM_INPUTS)) min_gate(.in(sn_out_pre),.out(sn_out)); 
   assign sn_out = &sn_out_pre;
 
endmodule //sng_dsc_min

module sng_dsc_mid_of3 #(parameter WIDTH=4, parameter NUM_INPUTS=1) (
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
wire               ab_max, ab_min, abminc_max;
   
   
sng_dsc_multi #(.WIDTH(WIDTH),.NUM_INPUTS(NUM_INPUTS)) sng_multi (
.clk(clk),
.rst(rst),
.en(en),
.bin_in(bin_in),
.sn_out(sn_out_pre),
.ctr_overflow(ctr_overflow)                                                                 
);
   
  //dsc_min #(.NUM_INPUTS(NUM_INPUTS)) min_gate(.in(sn_out_pre),.out(sn_out)); 
   assign ab_max = sn_out_pre[0] | sn_out_pre[1];
   assign ab_min = sn_out_pre[0] & sn_out_pre[1];
   assign abminc_max = ab_min | sn_out_pre[2];
   assign sn_out = ab_max & abminc_max;
 
endmodule //sng_dsc_mid_of3

module sng_dsc_second_smallest_of4 #(parameter WIDTH=4, parameter NUM_INPUTS=1) (
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
wire               ab_max, ab_min, cd_max, cd_min;
wire               stage1_max, stage1_min;
   
   
   
sng_dsc_multi #(.WIDTH(WIDTH),.NUM_INPUTS(NUM_INPUTS)) sng_multi (
.clk(clk),
.rst(rst),
.en(en),
.bin_in(bin_in),
.sn_out(sn_out_pre),
.ctr_overflow(ctr_overflow)                                                                 
);
   
  //dsc_min #(.NUM_INPUTS(NUM_INPUTS)) min_gate(.in(sn_out_pre),.out(sn_out)); 
   assign ab_max = sn_out_pre[0] | sn_out_pre[1];
   assign ab_min = sn_out_pre[0] & sn_out_pre[1];
   assign cd_max = sn_out_pre[2] | sn_out_pre[3];
   assign cd_min = sn_out_pre[2] & sn_out_pre[3];

   assign stage1_min = ab_max & cd_max;
   assign stage1_max = ab_min | cd_min;
   
   assign sn_out = stage1_max & stage1_min;
 
endmodule //sng_dsc_second_smallest_of4

module sng_dsc_second_largest_of4 #(parameter WIDTH=4, parameter NUM_INPUTS=1) (
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
wire               ab_max, ab_min, cd_max, cd_min;
wire               stage1_max, stage1_min;
   
   
   
sng_dsc_multi #(.WIDTH(WIDTH),.NUM_INPUTS(NUM_INPUTS)) sng_multi (
.clk(clk),
.rst(rst),
.en(en),
.bin_in(bin_in),
.sn_out(sn_out_pre),
.ctr_overflow(ctr_overflow)                                                                 
);
   
  //dsc_min #(.NUM_INPUTS(NUM_INPUTS)) min_gate(.in(sn_out_pre),.out(sn_out)); 
   assign ab_max = sn_out_pre[0] | sn_out_pre[1];
   assign ab_min = sn_out_pre[0] & sn_out_pre[1];
   assign cd_max = sn_out_pre[2] | sn_out_pre[3];
   assign cd_min = sn_out_pre[2] & sn_out_pre[3];

   assign stage1_min = ab_max & cd_max;
   assign stage1_max = ab_min | cd_min;
   
   assign sn_out = stage1_max | stage1_min;
 
endmodule //sng_dsc_second_largest_of4

module sng_dsc_second_smallest_of5 #(parameter WIDTH=4, parameter NUM_INPUTS=1) (
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
wire                  bc_max, bc_min, de_max, de_min;
wire                  stage1_max, stage1_min1, stage1_min2;
wire                  stage2_max, stage2_min;
sng_dsc_multi #(.WIDTH(WIDTH),.NUM_INPUTS(NUM_INPUTS)) sng_multi (
.clk(clk),
.rst(rst),
.en(en),
.bin_in(bin_in),
.sn_out(sn_out_pre),
.ctr_overflow(ctr_overflow)                                                                 
);
   assign bc_max = sn_out_pre[1] | sn_out_pre[2];
   assign bc_min = sn_out_pre[1] & sn_out_pre[2];
   assign de_max = sn_out_pre[3] | sn_out_pre[4];
   assign de_min = sn_out_pre[3] & sn_out_pre[4];

   assign stage1_max  = sn_out_pre[0] | bc_min;
   assign stage1_min1 = sn_out_pre[0] & bc_min;
   assign stage1_min2 = bc_max        & de_max;

   assign stage2_min  = stage1_max  & stage1_min2;
   assign stage2_max  = stage1_min1 | de_min;

   assign sn_out      = stage2_min & stage2_max;
 
endmodule //sng_dsc_second_smallest_of5

module sng_dsc_second_largest_of5 #(parameter WIDTH=4, parameter NUM_INPUTS=1) (
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
wire                  bc_max, bc_min, de_max, de_min;
wire                  stage1_max1, stage1_max2, stage1_min1, stage1_min2;
wire                  stage2_max1, stage2_max2, stage2_min;
wire                  stage3_max, stage3_min;
sng_dsc_multi #(.WIDTH(WIDTH),.NUM_INPUTS(NUM_INPUTS)) sng_multi (
.clk(clk),
.rst(rst),
.en(en),
.bin_in(bin_in),
.sn_out(sn_out_pre),
.ctr_overflow(ctr_overflow)                                                                 
);
   assign bc_max = sn_out_pre[1] | sn_out_pre[2];
   assign bc_min = sn_out_pre[1] & sn_out_pre[2];
   assign de_max = sn_out_pre[3] | sn_out_pre[4];
   assign de_min = sn_out_pre[3] & sn_out_pre[4];

   assign stage1_max1  = sn_out_pre[0] | bc_min;
   assign stage1_max2  = bc_max        | de_max;
   assign stage1_min1  = sn_out_pre[0] & bc_min;
   assign stage1_min2  = bc_max        & de_max;

   assign stage2_min   = stage1_max1  & stage1_min2;
   assign stage2_max1  = stage1_max1  | stage1_min2;
   assign stage2_max2  = stage1_min1  | de_min;

   assign stage3_min   = stage2_max1 & stage1_max2;
   assign stage3_max   = stage2_min  | stage2_max2;
   
   assign sn_out      = stage3_min | stage3_max;
   
endmodule //sng_dsc_second_largest_of5

module sng_dsc_mid_of5 #(parameter WIDTH=4, parameter NUM_INPUTS=1) (
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
wire                  bc_max, bc_min, de_max, de_min;
wire                  stage1_max1, stage1_max2, stage1_min1, stage1_min2;
wire                  stage2_max1, stage2_max2, stage2_min;
wire                  stage3_max, stage3_min;
sng_dsc_multi #(.WIDTH(WIDTH),.NUM_INPUTS(NUM_INPUTS)) sng_multi (
.clk(clk),
.rst(rst),
.en(en),
.bin_in(bin_in),
.sn_out(sn_out_pre),
.ctr_overflow(ctr_overflow)                                                                 
);
   assign bc_max = sn_out_pre[1] | sn_out_pre[2];
   assign bc_min = sn_out_pre[1] & sn_out_pre[2];
   assign de_max = sn_out_pre[3] | sn_out_pre[4];
   assign de_min = sn_out_pre[3] & sn_out_pre[4];

   assign stage1_max1  = sn_out_pre[0] | bc_min;
   assign stage1_max2  = bc_max        | de_max;
   assign stage1_min1  = sn_out_pre[0] & bc_min;
   assign stage1_min2  = bc_max        & de_max;

   assign stage2_min   = stage1_max1  & stage1_min2;
   assign stage2_max1  = stage1_max1  | stage1_min2;
   assign stage2_max2  = stage1_min1  | de_min;

   assign stage3_min   = stage2_max1 & stage1_max2;
   assign stage3_max   = stage2_min  | stage2_max2;
   
   assign sn_out      = stage3_min & stage3_max;
 
endmodule //sng_dsc_mid_of5


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
