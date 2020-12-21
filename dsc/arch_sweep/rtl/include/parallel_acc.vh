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
   
endmodule // parallel_ctr_4inputs

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

`endif
