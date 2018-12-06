`timescale 1 ns / 100 ps



module counter #(
    //Top level block parameters
    parameter WIDTH = 4
) (
	out,
	clk,
    en,
	rst,
    overflow
);

   

//Output ports
output reg [WIDTH-1:0] out;
output reg          overflow;
   

//Input ports
input clk;
input rst;
input en;
   



always @(posedge clk or posedge rst) begin
  if (rst) begin
    out <= 0;
    overflow <= 0;
  end else if (en) begin
    out <= out + 1;
    //overflow <= (out == 2 ** WIDTH -1);  
    overflow <= &out;
     
  end
end
endmodule // counter



module counter_by2 #(
    //Top level block parameters
    parameter WIDTH = 4
) (
	out,
	clk,
    en,
	rst,
    overflow
);

   

//Output ports
output reg [WIDTH-1:0] out;
output reg          overflow;
   

//Input ports
input clk;
input rst;
input en;
   



always @(posedge clk or posedge rst) begin
  if (rst) begin
    out <= 0;
    overflow <= 0;
  end else if (en) begin
    out <= out + 2;
    //overflow <= (out == 2 ** WIDTH -1);  
    overflow <= (&out[WIDTH-1:1] & !out[0]);
     
  end
end
endmodule // counter_by2






module shift_reg_rotate_4b_full (                         
    clk,
	scan_in,
    wrap_mode,
    en,
    rst,
    shiftreg_out
);


   input    scan_in,wrap_mode,rst,en,clk;
   output  [15:0] shiftreg_out;
   

   reg [15:0]    shiftreg;

   wire          si_int;
   

   always @(posedge clk or posedge rst) begin
     if (rst) begin
       shiftreg <= 0;
     end else if (en) begin
       shiftreg <= {shiftreg[14:0],si_int};
     end
   end
   

   assign si_int = ((~wrap_mode) & (scan_in)) | ((wrap_mode) & (shiftreg[15]));
   assign shiftreg_out = shiftreg;
   

endmodule // shift_reg_rotate_4b_full




////module comparator2 (
////	y,
////	a,
////    b
////);
////
////   output       y;
////   input  [1:0] a,b;
////
////   assign y = (a[1] & ~b[1]) | (a[0] & ~b[1] & ~b[0]) | (a[1] & a[0] & ~b[0]);
////   
////
////endmodule // comparator2


module comp_1b (
	a,
    b,
    equal,
    a_larger
);

   output       equal,a_larger;
   input        a,b;

   assign equal    = (a  & b) | (~a & ~b);
   assign a_larger = (a  & ~b);
   

endmodule // comp_1b


              
module comp_2b (
	a_gt_b,
	a,
    b
);

   output       a_gt_b;
   input  [1:0] a,b;

   wire [1:0]   e,agt;

   comp_1b comp0(.a(a[0]),.b(b[0]),.equal(e[0]),.a_larger(agt[0]));
   comp_1b comp1(.a(a[1]),.b(b[1]),.equal(e[1]),.a_larger(agt[1]));

   assign a_gt_b = agt[1] | (agt[0] & e[1]);
   

endmodule // comp_2b



module comp_4b (
	a_gt_b,
	a,
    b
);

   output       a_gt_b;
   input  [3:0] a,b;

   wire [3:0]   e,agt;

   comp_1b comp0(.a(a[0]),.b(b[0]),.equal(e[0]),.a_larger(agt[0]));
   comp_1b comp1(.a(a[1]),.b(b[1]),.equal(e[1]),.a_larger(agt[1]));
   comp_1b comp2(.a(a[2]),.b(b[2]),.equal(e[2]),.a_larger(agt[2]));
   comp_1b comp3(.a(a[3]),.b(b[3]),.equal(e[3]),.a_larger(agt[3]));

   assign a_gt_b = agt[3] | (agt[2] & e[3]) | (agt[1] & e[3] & e[2]) | (agt[0] & e[3] & e[2] & e[1]);
   

endmodule // comp_4b


module comp_8b (
	a_gt_b,
	a,
    b
);

   output       a_gt_b;
   input  [7:0] a,b;

   wire [7:0]   e,agt;

   wire         e76,e75,e74,e73,e72,e71;
   

   comp_1b comp0(.a(a[0]),.b(b[0]),.equal(e[0]),.a_larger(agt[0]));
   comp_1b comp1(.a(a[1]),.b(b[1]),.equal(e[1]),.a_larger(agt[1]));
   comp_1b comp2(.a(a[2]),.b(b[2]),.equal(e[2]),.a_larger(agt[2]));
   comp_1b comp3(.a(a[3]),.b(b[3]),.equal(e[3]),.a_larger(agt[3]));
   comp_1b comp4(.a(a[4]),.b(b[4]),.equal(e[4]),.a_larger(agt[4]));
   comp_1b comp5(.a(a[5]),.b(b[5]),.equal(e[5]),.a_larger(agt[5]));
   comp_1b comp6(.a(a[6]),.b(b[6]),.equal(e[6]),.a_larger(agt[6]));
   comp_1b comp7(.a(a[7]),.b(b[7]),.equal(e[7]),.a_larger(agt[7]));

   assign e76 = e[7] & e[6];
   assign e75 = e76  & e[5];
   assign e74 = e75  & e[4];
   assign e73 = e74  & e[3];
   assign e72 = e73  & e[2];
   assign e71 = e72  & e[1];
   
   assign a_gt_b = agt[7] | (agt[6] & e[7]) | (agt[5] & e76) | (agt[4] & e75) | (agt[3] & e74) | (agt[2] & e73) | (agt[1] & e72) | (agt[0] & e71);
   

endmodule // comp_8b


module prg_4b (
	clk,
    rst,
    en,
    bin_in,
    sn_out,
    ctr_overflow  
);

   input       clk,rst,en;
   input [3:0] bin_in;
   output      sn_out,ctr_overflow;

   wire [3:0]  ctr4_out;
   
   

counter #(
   .WIDTH (4)
) ctr4 (
  .clk(clk),
  .rst(rst),
  .en(en),
  .out(ctr4_out),
  .overflow(ctr_overflow)
);


comp_4b     comp4 (.a(bin_in), .b(ctr4_out), .a_gt_b(sn_out));

endmodule // prg_4b


module prg_4b_dual (
	clk,
    rst,
    en,
    bin_in_a,
    bin_in_b,
    sn_out_a,
    sn_out_b,                
    ctr_overflow  
);

   input       clk,rst,en;
   input [3:0] bin_in_a,bin_in_b;
   output      sn_out_a,sn_out_b,ctr_overflow;

   wire [3:0]  ctr4_out;
   
   

counter #(
   .WIDTH (4)
) ctr4 (
  .clk(clk),
  .rst(rst),
  .en(en),
  .out(ctr4_out),
  .overflow(ctr_overflow)
);


comp_4b     comp4_a (.a(bin_in_a), .b(ctr4_out), .a_gt_b(sn_out_a));
comp_4b     comp4_b (.a(bin_in_b), .b(ctr4_out), .a_gt_b(sn_out_b));
   

endmodule // prg_4b_dual



module prg_4b_max (
	clk,
    rst,
    en,
    bin_in_a,
    bin_in_b,
    sn_out,
    ctr_overflow  
);

   input       clk,rst,en;
   input [3:0] bin_in_a,bin_in_b;
   output      sn_out,ctr_overflow;

   wire        sn_out_a,sn_out_b;
   
   
   



prg_4b_dual     prg_ab (.clk(clk),.rst(rst),.en(en), 
                        .bin_in_a(bin_in_a),
                        .bin_in_b(bin_in_b),
                        .sn_out_a(sn_out_a),
                        .sn_out_b(sn_out_b),
                        .ctr_overflow(ctr_overflow));
   
dsc_max       max_gate (.a(sn_out_a), .b(sn_out_b), .y(sn_out));
   
  
endmodule // prg_4b_max



module prg_4b_min (
	clk,
    rst,
    en,
    bin_in_a,
    bin_in_b,
    sn_out,
    ctr_overflow  
);

   input       clk,rst,en;
   input [3:0] bin_in_a,bin_in_b;
   output      sn_out,ctr_overflow;

   wire        sn_out_a,sn_out_b;
   
   
   



prg_4b_dual     prg_ab (.clk(clk),.rst(rst),.en(en), 
                        .bin_in_a(bin_in_a),
                        .bin_in_b(bin_in_b),
                        .sn_out_a(sn_out_a),
                        .sn_out_b(sn_out_b),
                        .ctr_overflow(ctr_overflow));
   
dsc_min       min_gate (.a(sn_out_a), .b(sn_out_b), .y(sn_out));
   
   

endmodule // prg_4b_min




module prg_4b_by2 (
	clk,
    rst,
    en,
    bin_in,
    sn_out0,
    sn_out1,
    ctr_overflow  
);

   input       clk,rst,en;
   input [3:0] bin_in;
   output      sn_out0,sn_out1,ctr_overflow;

   wire [3:0]  ctr4_out,ctr4_out_plus1;
   
   

counter_by2 #(
   .WIDTH (4)
) ctr4 (
  .clk(clk),
  .rst(rst),
  .en(en),
  .out(ctr4_out),
  .overflow(ctr_overflow)
);

assign ctr4_out_plus1 = ctr4_out + 1;
   


comp_4b     comp4_0 (.a(bin_in), .b(ctr4_out),       .a_gt_b(sn_out0));
comp_4b     comp4_1 (.a(bin_in), .b(ctr4_out_plus1), .a_gt_b(sn_out1));
   

endmodule // prg_4b_by2




module det_stoch_mul (
	a,
    b,
    y
);

   input a,b;
   output y;

   assign y = a & b;

endmodule // det_stoch_mul

module dsc_min (
	a,
    b,
    y
);

   input a,b;
   output y;

   assign y = a & b;

endmodule // dsc_min


module dsc_max (
	a,
    b,
    y
);

   input a,b;
   output y;

   assign y = a | b;

endmodule // dsc_min


module par_sr_mul #(
    //Top level block parameters
    parameter WIDTH = 16
) (           
	a,
    b,
    y
);

   input  [WIDTH-1:0] a,b;
   output [WIDTH-1:0] y;

   assign y = a & b;

endmodule // par_sr_mul

module par_mul_ms_4lane (           
	as0,
    as1,                        
    bs0,
    bs1,                                
    y
);

   input   as0,as1,bs0,bs1;
   output [3:0] y;

   assign y[0] = as0 & bs0;
   assign y[1] = as0 & bs1;
   assign y[2] = as1 & bs0;
   assign y[3] = as1 & bs1;
   

endmodule // par_mul_ms_4lane







module ctr_out_bank_16b (
	clk,
    rst,
    mul_in,
    bin_out
);

   input clk,rst;
   input [15:0] mul_in;
   output [7:0] bin_out;
   
   wire  [3:0] ctr0,ctr1,ctr2,ctr3,ctr4,ctr5,ctr6,ctr7,ctr8,ctr9,ctr10,ctr11,ctr12,ctr13,ctr14,ctr15;

   wire [15:0]  unused;
   
   
   counter #( .WIDTH (4) )
   stoch2bin_0 (
   .clk(clk),
   .rst(rst),
   .en(mul_in[0]),
   .out(ctr0),
   .overflow(unused[0])
   );

   counter #( .WIDTH (4) )
   stoch2bin_1 (
   .clk(clk),
   .rst(rst),
   .en(mul_in[1]),
   .out(ctr1),
   .overflow(unused[1])
   );


   counter #( .WIDTH (4) )
   stoch2bin_2 (
   .clk(clk),
   .rst(rst),
   .en(mul_in[2]),
   .out(ctr2),
   .overflow(unused[2])
   );

   counter #( .WIDTH (4) )
   stoch2bin_3 (
   .clk(clk),
   .rst(rst),
   .en(mul_in[3]),
   .out(ctr3),
   .overflow(unused[3])
   );

   counter #( .WIDTH (4) )
   stoch2bin_4 (
   .clk(clk),
   .rst(rst),
   .en(mul_in[4]),
   .out(ctr4),
   .overflow(unused[4])
   );

   counter #( .WIDTH (4) )
   stoch2bin_5 (
   .clk(clk),
   .rst(rst),
   .en(mul_in[5]),
   .out(ctr5),
   .overflow(unused[5])
   );

   counter #( .WIDTH (4) )
   stoch2bin_6 (
   .clk(clk),
   .rst(rst),
   .en(mul_in[6]),
   .out(ctr6),
   .overflow(unused[6])
   );

   counter #( .WIDTH (4) )
   stoch2bin_7 (
   .clk(clk),
   .rst(rst),
   .en(mul_in[7]),
   .out(ctr7),
   .overflow(unused[7])
   );
 
   counter #( .WIDTH (4) )
   stoch2bin_8 (
   .clk(clk),
   .rst(rst),
   .en(mul_in[8]),
   .out(ctr8),
   .overflow(unused[8])
   );

   counter #( .WIDTH (4) )
   stoch2bin_9 (
   .clk(clk),
   .rst(rst),
   .en(mul_in[9]),
   .out(ctr9),
   .overflow(unused[9])
   );

   counter #( .WIDTH (4) )
   stoch2bin_10 (
   .clk(clk),
   .rst(rst),
   .en(mul_in[10]),
   .out(ctr10),
   .overflow(unused[10])
   );

   counter #( .WIDTH (4) )
   stoch2bin_11 (
   .clk(clk),
   .rst(rst),
   .en(mul_in[11]),
   .out(ctr11),
   .overflow(unused[11])
   );

   counter #( .WIDTH (4) )
   stoch2bin_12 (
   .clk(clk),
   .rst(rst),
   .en(mul_in[12]),
   .out(ctr12),
   .overflow(unused[12])
   );

   counter #( .WIDTH (4) )
   stoch2bin_13 (
   .clk(clk),
   .rst(rst),
   .en(mul_in[13]),
   .out(ctr13),
   .overflow(unused[13])
   );

   counter #( .WIDTH (4) )
   stoch2bin_14 (
   .clk(clk),
   .rst(rst),
   .en(mul_in[14]),
   .out(ctr14),
   .overflow(unused[14])
   );

   counter #( .WIDTH (4) )
   stoch2bin_15 (
   .clk(clk),
   .rst(rst),
   .en(mul_in[15]),
   .out(ctr15),
   .overflow(unused[15])
   );

   assign bin_out = ctr0 + ctr1 + ctr2 + ctr3 + ctr4 + ctr5 + ctr6 + ctr7 + ctr8 + ctr9 + ctr10 + ctr11 + ctr12 + ctr13 + ctr14 + ctr15;
   

       

endmodule // ctr_out_bank_16b


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

module par_ctr_4b (
  a,
  y
);

   input  [3:0] a;
   output [2:0] y;

   wire         w1,w2,ha0_cout;

   FA fa0 (.a(a[1]),.b(a[2]),.cin(a[3]),.s(w1),.cout(w2));

   HA ha0 (.a(a[0]),.b(w1),.s(y[0]),.cout(ha0_cout));

   HA ha1 (.a(ha0_cout),.b(w2),.s(y[1]),.cout(y[2]));
   
   
   
endmodule // par_ctr_4b

 
module counter_input #(
    //Top level block parameters
    parameter CTR_WIDTH = 4,
    parameter INPUT_WIDTH = 4
) (
	out,
    data_in,
	clk,
    en,
	rst,
    overflow
);

   

//Output ports
output reg [CTR_WIDTH-1:0] out;
output reg          overflow;
   

//Input ports
input clk;
input rst;
input en;
input [INPUT_WIDTH-1:0] data_in;
   
   



always @(posedge clk or posedge rst) begin
  if (rst) begin
    out <= 0;
    overflow <= 0;
  end else if (en) begin
    out <= out + data_in;
    //overflow <= (out == 2 ** WIDTH -1);  
    overflow <= &out;
     
  end
end
endmodule // counter_input


         
module par_accum_4b_4lanes (
  clk,
  rst,
  data_in,
  bin_out,
  overflow                     
);

   input clk, rst;
   input [3:0] data_in;
   output [7:0] bin_out;
   output       overflow;
   

   wire [2:0]   par_acc_int;

   wire         ctr_en;

   

   par_ctr_4b par_ctr (
     .a(data_in),
     .y(par_acc_int)                   
   );

   //any of the bits of accumulator being 1 will trigger increment
   assign ctr_en = |par_acc_int;
   

   counter_input #(.CTR_WIDTH(8), .INPUT_WIDTH(3))
   stoch2bin_out(
     .clk(clk),
     .rst(rst),
     .en(ctr_en),  
     .data_in(par_acc_int),
     .out(bin_out),
     .overflow(overflow)          
     );
   
   
   

endmodule // par_accum_4b_4lanes

                  
        
               







   