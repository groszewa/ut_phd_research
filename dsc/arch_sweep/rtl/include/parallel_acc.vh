`ifndef __PARALLEL_ACC__
`define __PARALLEL_ACC__

`include "adders.vh"

module parallel_ctr_2in (a,y);
   input  [1:0] a;
   output [1:0] y;
   
   HA ha0 (.a(a[0]), .b(a[1]), .s(y[0]), .cout(y[1]));
   
endmodule; // parallel_ctr_2in

module parallel_ctr_4in (a,y);

   input  [3:0] a;
   output [2:0] y;

   wire         w1,w2,ha0_cout;

   FA fa0 (.a(a[1]),.b(a[2]),.cin(a[3]),.s(w1),.cout(w2));
   HA ha0 (.a(a[0]),.b(w1),.s(y[0]),.cout(ha0_cout));
   HA ha1 (.a(ha0_cout),.b(w2),.s(y[1]),.cout(y[2]));
   
endmodule // parallel_ctr_4in

module parallel_ctr_8in (a,y);
   input  [7:0] a;
   output [3:0] y;
   wire [2:0]   p0_int, p1_int;
   parallel_ctr_4in p0(.a(a[7:4]),.y(p0_int));
   parallel_ctr_4in p1(.a(a[3:0]),.y(p1_int));
   assign y = p0_int + p1_int;
endmodule // parallel_ctr_8in

module parallel_ctr_16in (a,y);
   input  [15:0] a;
   output [4:0] y;
   wire [3:0]   p0_int, p1_int;
   parallel_ctr_8in p0(.a(a[15:8]),.y(p0_int));
   parallel_ctr_8in p1(.a(a[7 :0]),.y(p1_int));
   assign y = p0_int + p1_int;
endmodule // parallel_ctr_16in

module parallel_ctr_32in (a,y);
   input  [31:0] a;
   output [5:0] y;
   wire [4:0]   p0_int, p1_int;
   parallel_ctr_16in p0(.a(a[31:16]),.y(p0_int));
   parallel_ctr_16in p1(.a(a[15 :0]),.y(p1_int));
   assign y = p0_int + p1_int;
endmodule // parallel_ctr_32in

module parallel_ctr_64in (a,y);
   input  [63:0] a;
   output [6:0] y;
   wire [5:0]   p0_int, p1_int;
   parallel_ctr_32in p0(.a(a[63:32]),.y(p0_int));
   parallel_ctr_32in p1(.a(a[31 :0]),.y(p1_int));
   assign y = p0_int + p1_int;
endmodule // parallel_ctr_64in

module parallel_ctr_128in (a,y);
   input  [127:0] a;
   output [7:0] y;
   wire [6:0]   p0_int, p1_int;
   parallel_ctr_64in p0(.a(a[127:64]),.y(p0_int));
   parallel_ctr_64in p1(.a(a[63 :0]), .y(p1_int));
   assign y = p0_int + p1_int;
endmodule // parallel_ctr_128in

module parallel_ctr_256in (a,y);
   input  [255:0] a;
   output [8:0]   y;
   wire [7:0]   p0_int, p1_int;
   parallel_ctr_128in p0(.a(a[255:128]),.y(p0_int));
   parallel_ctr_128in p1(.a(a[127:0]),  .y(p1_int));
   assign y = p0_int + p1_int;
endmodule // parallel_ctr_256in

module parallel_ctr_512in (a,y);
   input  [511:0] a;
   output [9:0]   y;
   wire [8:0]   p0_int, p1_int;
   parallel_ctr_256in p0(.a(a[511:256]),.y(p0_int));
   parallel_ctr_256in p1(.a(a[255:0]),  .y(p1_int));
   assign y = p0_int + p1_int;
endmodule // parallel_ctr_512in

module parallel_ctr_1024in (a,y);
   input  [1023:0] a;
   output [10:0]   y;
   wire [9:0]   p0_int, p1_int;
   parallel_ctr_512in p0(.a(a[1023:512]),.y(p0_int));
   parallel_ctr_512in p1(.a(a[511:0]),   .y(p1_int));
   assign y = p0_int + p1_int;
endmodule // parallel_ctr_1024in

module parallel_ctr_2048in (a,y);
   input  [2047:0] a;
   output [11:0]   y;
   wire [10:0]   p0_int, p1_int;
   parallel_ctr_1024in p0(.a(a[2047:1024]),.y(p0_int));
   parallel_ctr_1024in p1(.a(a[1023:0]),   .y(p1_int));
   assign y = p0_int + p1_int;
endmodule // parallel_ctr_2048in

//FIXME - parametrize this
module par_acc_sat_2lanes #(parameter WIDTH=4) (
  clk,
  rst,
  data_in,
  countval,
  overflow                     
);

   input clk, rst;
   input [1:0] data_in;
   output [WIDTH-1:0] countval;
   output       overflow;
   

   wire [1:0]   par_acc_int;
   wire         ctr_en;

   parallel_ctr_2in par_ctr (
     .a(data_in),
     .y(par_acc_int)                   
   );

   //any of the bits of accumulator being 1 will trigger increment
   assign ctr_en = |par_acc_int;
   

   counter_input_sat #(.WIDTH(WIDTH)) ctr (
     .clk(clk),
     .rst(rst),
     .en(ctr_en),
     .data_in(par_acc_int),  
     .countval(countval),
     .overflow(overflow)                     
     );
   
endmodule // par_acc_sat_2lanes

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
   wire [3:0]   par_acc_int;
   wire         ctr_en;
   parallel_ctr_8in par_ctr (
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
   wire [5:0]   par_acc_int;
   wire         ctr_en;
   parallel_ctr_16in par_ctr (
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
   wire [6:0]   par_acc_int;
   wire         ctr_en;
   parallel_ctr_32in par_ctr (
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
endmodule // par_acc_32lanes

module par_acc_64lanes #(parameter WIDTH=4) (
  clk,
  rst,
  data_in,
  countval,
  overflow                     
);
   input clk, rst;
   input [63:0] data_in;
   output [WIDTH-1:0] countval;
   output       overflow;
   wire [7:0]   par_acc_int;
   wire         ctr_en;
   parallel_ctr_64in par_ctr (
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
endmodule // par_acc_64lanes

module par_acc_128lanes #(parameter WIDTH=4) (
  clk,
  rst,
  data_in,
  countval,
  overflow                     
);
   input clk, rst;
   input [127:0] data_in;
   output [WIDTH-1:0] countval;
   output       overflow;
   wire [8:0]   par_acc_int;
   wire         ctr_en;
   parallel_ctr_128in par_ctr (
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
endmodule // par_acc_128lanes

module par_acc_256lanes #(parameter WIDTH=4) (
  clk,
  rst,
  data_in,
  countval,
  overflow                     
);
   input clk, rst;
   input [255:0] data_in;
   output [WIDTH-1:0] countval;
   output       overflow;
   wire [9:0]   par_acc_int;
   wire         ctr_en;
   parallel_ctr_256in par_ctr (
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
endmodule // par_acc_256lanes


`endif
