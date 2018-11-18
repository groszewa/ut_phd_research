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



               







   