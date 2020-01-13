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

//counter which counts by user specified input, do not need stride for this
module counter_input #(parameter WIDTH=4) (
    clk,
    en,
	rst,
    data_in,
	overflow,
	countval
);

	output reg [WIDTH-1:0] countval;
	output reg             overflow;

	input clk,rst,en;
    input [WIDTH-1:0] data_in;
   

	always @(posedge clk or posedge rst) begin
		if(rst) begin
			countval <= 0;
			overflow <= 0;
		end else if (en) begin
			countval <= countval + data_in;
			overflow <= &countval;
		end // else if (en)
	end //always
endmodule // counter_input

module FA (
  a,
  b,
  cin,
  s,
  cout
);
   input a,b,cin;
   output s,cout;

   wire   xor_int, and0_int, and1_int;

   assign xor_int = a ^ b;
   assign and0_int = xor_int & cin;
   assign and1_int = a & b;
   
   

   assign s = xor_int^cin;
   assign cout = and0_int | and1_int;
   

endmodule // FA

module HA (
  a,
  b,
  s,
  cout
);

   input a,b;
   output s,cout;

   assign s = a ^ b;
   assign cout = a & b;
   

endmodule // HA


//FIXME - parametrize this
module parallel_ctr_4in (
  a,
  y
);

   input  [3:0] a;
   output [2:0] y;

   wire         w1,w2,ha0_cout;

   FA fa0 (.a(a[1]),.b(a[2]),.cin(a[3]),.s(w1),.cout(w2));

   HA ha0 (.a(a[0]),.b(w1),.s(y[0]),.cout(ha0_cout));

   HA ha1 (.a(ha0_cout),.b(w2),.s(y[1]),.cout(y[2]));
   
   
   
endmodule // parallel_ctr_4inputs

//FIXME - parametrize this
module par_acc_4lanes #(parameter WIDTH=4) (
  clk,
  rst,
  data_in,
  countval,
  overflow                     
);

   input clk, rst;
   input [3:0] data_in;
   output [WIDTH-1:0] countval;
   output       overflow;
   

   wire [2:0]   par_acc_int;

   wire         ctr_en;

   

   parallel_ctr_4in par_ctr (
     .a(data_in),
     .y(par_acc_int)                   
   );

   //any of the bits of accumulator being 1 will trigger increment
   assign ctr_en = |par_acc_int;
   

   counter_input #(.WIDTH(WIDTH)) ctr (
     .clk(clk),
     .rst(rst),
     .en(ctr_en),
     .data_in(par_acc_int),  
     .countval(countval),
     .overflow(overflow)                     
     );
   
endmodule // par_acc_4lanes


module par_acc_8lanes #(parameter WIDTH=4) (
  clk,
  rst,
  data_in,
  countval,
  overflow                     
);

   input clk, rst;
   input [7:0] data_in;
   output [WIDTH-1:0] countval;
   output       overflow;
   

   wire [2:0]   par_acc_int0, par_acc_int1;
   wire [3:0]   par_acc_int;
   

   wire         ctr_en;

   

   parallel_ctr_4in par_ctr0 (
     .a(data_in[7:4]),
     .y(par_acc_int0)                   
   );
                              
   parallel_ctr_4in par_ctr1 (
     .a(data_in[3:0]),
     .y(par_acc_int1)                   
   );

   assign par_acc_int = par_acc_int0 + par_acc_int1;                           
                             

   //any of the bits of accumulator being 1 will trigger increment
   assign ctr_en = |par_acc_int;
   

   counter_input #(.WIDTH(WIDTH)) ctr (
     .clk(clk),
     .rst(rst),
     .en(ctr_en),
     .data_in(par_acc_int),  
     .countval(countval),
     .overflow(overflow)                     
     );
   
endmodule // par_acc_8lanes


module par_acc_16lanes #(parameter WIDTH=4) (
  clk,
  rst,
  data_in,
  countval,
  overflow                     
);

   input clk, rst;
   input [15:0] data_in;
   output [WIDTH-1:0] countval;
   output       overflow;
   

   wire [2:0]   par_acc_int0, par_acc_int1, par_acc_int2, par_acc_int3;
   wire [5:0]   par_acc_int;
   

   wire         ctr_en;

   

   parallel_ctr_4in par_ctr0 (
     .a(data_in[15:12]),
     .y(par_acc_int0)                   
   );
                              
   parallel_ctr_4in par_ctr1 (
     .a(data_in[11:8]),
     .y(par_acc_int1)                   
   );
   
   parallel_ctr_4in par_ctr2 (
     .a(data_in[7:4]),
     .y(par_acc_int2)                   
   );
                              
   parallel_ctr_4in par_ctr3 (
     .a(data_in[3:0]),
     .y(par_acc_int3)                   
   );
   

   assign par_acc_int = par_acc_int0 + par_acc_int1 + par_acc_int2 + par_acc_int3;                           
                             

   //any of the bits of accumulator being 1 will trigger increment
   assign ctr_en = |par_acc_int;
   

   counter_input #(.WIDTH(WIDTH)) ctr (
     .clk(clk),
     .rst(rst),
     .en(ctr_en),
     .data_in(par_acc_int),  
     .countval(countval),
     .overflow(overflow)                     
     );
   
endmodule // par_acc_16lanes


module par_acc_32lanes #(parameter WIDTH=4) (
  clk,
  rst,
  data_in,
  countval,
  overflow                     
);

   input clk, rst;
   input [31:0] data_in;
   output [WIDTH-1:0] countval;
   output       overflow;
   

   wire [2:0]   par_acc_int0, par_acc_int1, par_acc_int2, par_acc_int3;
   wire [2:0]   par_acc_int4, par_acc_int5, par_acc_int6, par_acc_int7;
   
   wire [6:0]   par_acc_int;
   

   wire         ctr_en;

   

   parallel_ctr_4in par_ctr0 (
     .a(data_in[31:28]),
     .y(par_acc_int0)                   
   );
                              
   parallel_ctr_4in par_ctr1 (
     .a(data_in[27:24]),
     .y(par_acc_int1)                   
   );
   
   parallel_ctr_4in par_ctr2 (
     .a(data_in[23:20]),
     .y(par_acc_int2)                   
   );
                              
   parallel_ctr_4in par_ctr3 (
     .a(data_in[19:16]),
     .y(par_acc_int3)                   
   );
   parallel_ctr_4in par_ctr4 (
     .a(data_in[15:12]),
     .y(par_acc_int4)                   
   );
                              
   parallel_ctr_4in par_ctr5 (
     .a(data_in[11:8]),
     .y(par_acc_int5)                   
   );
   
   parallel_ctr_4in par_ctr6 (
     .a(data_in[7:4]),
     .y(par_acc_int6)                   
   );
                              
   parallel_ctr_4in par_ctr7 (
     .a(data_in[3:0]),
     .y(par_acc_int7)                   
   );

   
   

   assign par_acc_int = par_acc_int0 + par_acc_int1 + par_acc_int2 + par_acc_int3 + par_acc_int4 + par_acc_int5 + par_acc_int6 + par_acc_int7;                           
                             

   //any of the bits of accumulator being 1 will trigger increment
   assign ctr_en = |par_acc_int;
   

   counter_input #(.WIDTH(WIDTH)) ctr (
     .clk(clk),
     .rst(rst),
     .en(ctr_en),
     .data_in(par_acc_int),  
     .countval(countval),
     .overflow(overflow)                     
     );
   
endmodule // par_acc_32lanes






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

