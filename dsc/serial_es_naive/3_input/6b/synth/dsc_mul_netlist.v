
// Generated by Cadence Encounter(R) RTL Compiler RC14.28 - v14.20-s067_1

// Verification Directory fv/dsc_mul 

module comp_1b(a, b, equal, a_larger);
  input a, b;
  output equal, a_larger;
  wire a, b;
  wire equal, a_larger;
  wire n_1;
  AND2X1 g14(.A (n_1), .B (a), .Y (a_larger));
  INVX1 g15(.A (b), .Y (n_1));
endmodule

module comp_1b_1(a, b, equal, a_larger);
  input a, b;
  output equal, a_larger;
  wire a, b;
  wire equal, a_larger;
  wire n_0;
  HAX1 g27(.A (a), .B (n_0), .YC (a_larger), .YS (equal));
  INVX1 g28(.A (b), .Y (n_0));
endmodule

module comp_1b_2(a, b, equal, a_larger);
  input a, b;
  output equal, a_larger;
  wire a, b;
  wire equal, a_larger;
  wire n_0;
  HAX1 g27(.A (a), .B (n_0), .YC (a_larger), .YS (equal));
  INVX1 g28(.A (b), .Y (n_0));
endmodule

module comp_1b_3(a, b, equal, a_larger);
  input a, b;
  output equal, a_larger;
  wire a, b;
  wire equal, a_larger;
  wire n_0;
  HAX1 g27(.A (a), .B (n_0), .YC (a_larger), .YS (equal));
  INVX1 g28(.A (b), .Y (n_0));
endmodule

module comp_1b_4(a, b, equal, a_larger);
  input a, b;
  output equal, a_larger;
  wire a, b;
  wire equal, a_larger;
  wire n_0;
  HAX1 g27(.A (a), .B (n_0), .YC (a_larger), .YS (equal));
  INVX1 g28(.A (b), .Y (n_0));
endmodule

module comp_1b_5(a, b, equal, a_larger);
  input a, b;
  output equal, a_larger;
  wire a, b;
  wire equal, a_larger;
  wire n_0;
  HAX1 g27(.A (a), .B (n_0), .YC (a_larger), .YS (equal));
  INVX1 g28(.A (b), .Y (n_0));
endmodule

module comp_6b(a_gt_b, a, b);
  input [5:0] a, b;
  output a_gt_b;
  wire [5:0] a, b;
  wire a_gt_b;
  wire UNCONNECTED, agt, agt_17, agt_19, agt_22, agt_25, agt_28, e;
  wire e_13, e_14, e_15, e_16, n_0, n_1, n_2, n_3;
  wire n_4, n_5, n_6, n_7, n_8, n_9, n_10, n_11;
  comp_1b comp0(.a (a[0]), .b (b[0]), .equal (UNCONNECTED), .a_larger
       (agt_28));
  comp_1b_1 comp1(.a (a[1]), .b (b[1]), .equal (e_16), .a_larger
       (agt_25));
  comp_1b_2 comp2(.a (a[2]), .b (b[2]), .equal (e_15), .a_larger
       (agt_22));
  comp_1b_3 comp3(.a (a[3]), .b (b[3]), .equal (e_14), .a_larger
       (agt_19));
  comp_1b_4 comp4(.a (a[4]), .b (b[4]), .equal (e_13), .a_larger (agt));
  comp_1b_5 comp5(.a (a[5]), .b (b[5]), .equal (e), .a_larger (agt_17));
  INVX1 g18(.A (e_14), .Y (n_11));
  INVX1 g19(.A (e), .Y (n_10));
  OAI21X1 g141(.A (n_10), .B (n_2), .C (n_4), .Y (a_gt_b));
  AOI21X1 g142(.A (e_13), .B (n_8), .C (agt), .Y (n_9));
  OAI21X1 g143(.A (n_11), .B (n_1), .C (n_3), .Y (n_8));
  AOI21X1 g144(.A (e_15), .B (n_6), .C (agt_22), .Y (n_7));
  INVX1 g145(.A (n_0), .Y (n_6));
  AOI21X1 g146(.A (agt_28), .B (e_16), .C (agt_25), .Y (n_5));
  INVX1 g147(.A (agt_17), .Y (n_4));
  INVX1 g148(.A (agt_19), .Y (n_3));
  BUFX2 drc_bufs(.A (n_9), .Y (n_2));
  BUFX2 drc_bufs149(.A (n_7), .Y (n_1));
  BUFX2 drc_bufs150(.A (n_5), .Y (n_0));
endmodule

module counter_WIDTH6(out, clk, en, rst, overflow);
  input clk, en, rst;
  output [5:0] out;
  output overflow;
  wire clk, en, rst;
  wire [5:0] out;
  wire overflow;
  wire n_0, n_9, n_10, n_11, n_12, n_13, n_14, n_15;
  wire n_16, n_17, n_18, n_19, n_20, n_21, n_22, n_23;
  wire n_24, n_25, n_26, n_27, n_28, n_29, n_30, n_31;
  wire n_35, n_36, n_37, n_38, n_39, n_40;
  DFFSR \out_reg[5] (.R (n_9), .S (1'b1), .CLK (clk), .D (n_29), .Q
       (n_35));
  DFFSR overflow_reg(.R (n_9), .S (1'b1), .CLK (clk), .D (n_31), .Q
       (overflow));
  INVX1 g93(.A (n_30), .Y (n_31));
  MUX2X1 g94(.A (n_26), .B (overflow), .S (en), .Y (n_30));
  INVX1 g95(.A (n_28), .Y (n_29));
  MUX2X1 g96(.A (n_27), .B (out[5]), .S (en), .Y (n_28));
  DFFSR \out_reg[4] (.R (n_9), .S (1'b1), .CLK (clk), .D (n_25), .Q
       (n_36));
  HAX1 g98(.A (out[5]), .B (n_22), .YC (n_26), .YS (n_27));
  INVX1 g99(.A (n_24), .Y (n_25));
  MUX2X1 g100(.A (n_23), .B (out[4]), .S (en), .Y (n_24));
  DFFSR \out_reg[3] (.R (n_9), .S (1'b1), .CLK (clk), .D (n_21), .Q
       (n_37));
  HAX1 g102(.A (out[4]), .B (n_18), .YC (n_22), .YS (n_23));
  INVX1 g103(.A (n_20), .Y (n_21));
  MUX2X1 g104(.A (n_19), .B (out[3]), .S (en), .Y (n_20));
  DFFSR \out_reg[2] (.R (n_9), .S (1'b1), .CLK (clk), .D (n_17), .Q
       (n_38));
  HAX1 g106(.A (out[3]), .B (n_14), .YC (n_18), .YS (n_19));
  INVX1 g107(.A (n_16), .Y (n_17));
  MUX2X1 g108(.A (n_15), .B (out[2]), .S (en), .Y (n_16));
  DFFSR \out_reg[1] (.R (n_9), .S (1'b1), .CLK (clk), .D (n_13), .Q
       (n_39));
  HAX1 g110(.A (out[2]), .B (n_10), .YC (n_14), .YS (n_15));
  INVX1 g111(.A (n_12), .Y (n_13));
  MUX2X1 g112(.A (n_11), .B (out[1]), .S (en), .Y (n_12));
  DFFSR \out_reg[0] (.R (n_9), .S (1'b1), .CLK (clk), .D (n_0), .Q
       (n_40));
  HAX1 g114(.A (out[1]), .B (out[0]), .YC (n_10), .YS (n_11));
  INVX1 g128(.A (rst), .Y (n_9));
  BUFX2 drc_bufs157(.A (n_40), .Y (out[0]));
  BUFX2 drc_bufs159(.A (n_35), .Y (out[5]));
  BUFX2 drc_bufs160(.A (n_36), .Y (out[4]));
  BUFX2 drc_bufs161(.A (n_37), .Y (out[3]));
  BUFX2 drc_bufs162(.A (n_38), .Y (out[2]));
  BUFX2 drc_bufs163(.A (n_39), .Y (out[1]));
  XOR2X1 g2(.A (en), .B (out[0]), .Y (n_0));
endmodule

module prg_6b(clk, rst, en, bin_in, sn_out, ctr_overflow);
  input clk, rst, en;
  input [5:0] bin_in;
  output sn_out, ctr_overflow;
  wire clk, rst, en;
  wire [5:0] bin_in;
  wire sn_out, ctr_overflow;
  wire [5:0] ctr4_out;
  comp_6b comp6(.a_gt_b (sn_out), .a (bin_in), .b (ctr4_out));
  counter_WIDTH6 ctr4(.out (ctr4_out), .clk (clk), .en (en), .rst
       (rst), .overflow (ctr_overflow));
endmodule

module comp_1b_6(a, b, equal, a_larger);
  input a, b;
  output equal, a_larger;
  wire a, b;
  wire equal, a_larger;
  wire n_1;
  AND2X1 g14(.A (n_1), .B (a), .Y (a_larger));
  INVX1 g15(.A (b), .Y (n_1));
endmodule

module comp_1b_7(a, b, equal, a_larger);
  input a, b;
  output equal, a_larger;
  wire a, b;
  wire equal, a_larger;
  wire n_0;
  HAX1 g27(.A (a), .B (n_0), .YC (a_larger), .YS (equal));
  INVX1 g28(.A (b), .Y (n_0));
endmodule

module comp_1b_8(a, b, equal, a_larger);
  input a, b;
  output equal, a_larger;
  wire a, b;
  wire equal, a_larger;
  wire n_0;
  HAX1 g27(.A (a), .B (n_0), .YC (a_larger), .YS (equal));
  INVX1 g28(.A (b), .Y (n_0));
endmodule

module comp_1b_9(a, b, equal, a_larger);
  input a, b;
  output equal, a_larger;
  wire a, b;
  wire equal, a_larger;
  wire n_0;
  HAX1 g27(.A (a), .B (n_0), .YC (a_larger), .YS (equal));
  INVX1 g28(.A (b), .Y (n_0));
endmodule

module comp_1b_10(a, b, equal, a_larger);
  input a, b;
  output equal, a_larger;
  wire a, b;
  wire equal, a_larger;
  wire n_0;
  HAX1 g27(.A (a), .B (n_0), .YC (a_larger), .YS (equal));
  INVX1 g28(.A (b), .Y (n_0));
endmodule

module comp_1b_11(a, b, equal, a_larger);
  input a, b;
  output equal, a_larger;
  wire a, b;
  wire equal, a_larger;
  wire n_0;
  HAX1 g27(.A (a), .B (n_0), .YC (a_larger), .YS (equal));
  INVX1 g28(.A (b), .Y (n_0));
endmodule

module comp_6b_1(a_gt_b, a, b);
  input [5:0] a, b;
  output a_gt_b;
  wire [5:0] a, b;
  wire a_gt_b;
  wire UNCONNECTED0, agt, agt_17, agt_19, agt_22, agt_25, agt_28, e;
  wire e_13, e_14, e_15, e_16, n_0, n_1, n_2, n_3;
  wire n_4, n_5, n_6, n_7, n_8, n_9, n_10, n_11;
  comp_1b_6 comp0(.a (a[0]), .b (b[0]), .equal (UNCONNECTED0),
       .a_larger (agt_28));
  comp_1b_7 comp1(.a (a[1]), .b (b[1]), .equal (e_16), .a_larger
       (agt_25));
  comp_1b_8 comp2(.a (a[2]), .b (b[2]), .equal (e_15), .a_larger
       (agt_22));
  comp_1b_9 comp3(.a (a[3]), .b (b[3]), .equal (e_14), .a_larger
       (agt_19));
  comp_1b_10 comp4(.a (a[4]), .b (b[4]), .equal (e_13), .a_larger
       (agt));
  comp_1b_11 comp5(.a (a[5]), .b (b[5]), .equal (e), .a_larger
       (agt_17));
  INVX1 g19(.A (e_14), .Y (n_11));
  INVX1 g18(.A (e), .Y (n_10));
  OAI21X1 g141(.A (n_10), .B (n_2), .C (n_4), .Y (a_gt_b));
  AOI21X1 g142(.A (e_13), .B (n_8), .C (agt), .Y (n_9));
  OAI21X1 g143(.A (n_11), .B (n_1), .C (n_3), .Y (n_8));
  AOI21X1 g144(.A (e_15), .B (n_6), .C (agt_22), .Y (n_7));
  INVX1 g145(.A (n_0), .Y (n_6));
  AOI21X1 g146(.A (agt_28), .B (e_16), .C (agt_25), .Y (n_5));
  INVX1 g147(.A (agt_17), .Y (n_4));
  INVX1 g148(.A (agt_19), .Y (n_3));
  BUFX2 drc_bufs(.A (n_9), .Y (n_2));
  BUFX2 drc_bufs149(.A (n_7), .Y (n_1));
  BUFX2 drc_bufs150(.A (n_5), .Y (n_0));
endmodule

module counter_WIDTH6_1(out, clk, en, rst, overflow);
  input clk, en, rst;
  output [5:0] out;
  output overflow;
  wire clk, en, rst;
  wire [5:0] out;
  wire overflow;
  wire n_0, n_9, n_10, n_11, n_12, n_13, n_14, n_15;
  wire n_16, n_17, n_18, n_19, n_20, n_21, n_22, n_23;
  wire n_24, n_25, n_26, n_27, n_28, n_29, n_30, n_31;
  wire n_35, n_36, n_37, n_38, n_39, n_40;
  DFFSR \out_reg[5] (.R (n_9), .S (1'b1), .CLK (clk), .D (n_29), .Q
       (n_35));
  DFFSR overflow_reg(.R (n_9), .S (1'b1), .CLK (clk), .D (n_31), .Q
       (overflow));
  INVX1 g181(.A (n_30), .Y (n_31));
  MUX2X1 g182(.A (n_26), .B (overflow), .S (en), .Y (n_30));
  INVX1 g183(.A (n_28), .Y (n_29));
  MUX2X1 g184(.A (n_27), .B (out[5]), .S (en), .Y (n_28));
  DFFSR \out_reg[4] (.R (n_9), .S (1'b1), .CLK (clk), .D (n_25), .Q
       (n_36));
  HAX1 g186(.A (out[5]), .B (n_22), .YC (n_26), .YS (n_27));
  INVX1 g187(.A (n_24), .Y (n_25));
  MUX2X1 g188(.A (n_23), .B (out[4]), .S (en), .Y (n_24));
  DFFSR \out_reg[3] (.R (n_9), .S (1'b1), .CLK (clk), .D (n_21), .Q
       (n_37));
  HAX1 g190(.A (out[4]), .B (n_18), .YC (n_22), .YS (n_23));
  INVX1 g191(.A (n_20), .Y (n_21));
  MUX2X1 g192(.A (n_19), .B (out[3]), .S (en), .Y (n_20));
  DFFSR \out_reg[2] (.R (n_9), .S (1'b1), .CLK (clk), .D (n_17), .Q
       (n_38));
  HAX1 g194(.A (out[3]), .B (n_14), .YC (n_18), .YS (n_19));
  INVX1 g195(.A (n_16), .Y (n_17));
  MUX2X1 g196(.A (n_15), .B (out[2]), .S (en), .Y (n_16));
  DFFSR \out_reg[1] (.R (n_9), .S (1'b1), .CLK (clk), .D (n_13), .Q
       (n_39));
  HAX1 g198(.A (out[2]), .B (n_10), .YC (n_14), .YS (n_15));
  INVX1 g199(.A (n_12), .Y (n_13));
  MUX2X1 g200(.A (n_11), .B (out[1]), .S (en), .Y (n_12));
  DFFSR \out_reg[0] (.R (n_9), .S (1'b1), .CLK (clk), .D (n_0), .Q
       (n_40));
  HAX1 g202(.A (out[1]), .B (out[0]), .YC (n_10), .YS (n_11));
  INVX1 g216(.A (rst), .Y (n_9));
  BUFX2 drc_bufs245(.A (n_40), .Y (out[0]));
  BUFX2 drc_bufs247(.A (n_35), .Y (out[5]));
  BUFX2 drc_bufs248(.A (n_36), .Y (out[4]));
  BUFX2 drc_bufs249(.A (n_37), .Y (out[3]));
  BUFX2 drc_bufs250(.A (n_38), .Y (out[2]));
  BUFX2 drc_bufs251(.A (n_39), .Y (out[1]));
  XOR2X1 g2(.A (en), .B (out[0]), .Y (n_0));
endmodule

module prg_6b_1(clk, rst, en, bin_in, sn_out, ctr_overflow);
  input clk, rst, en;
  input [5:0] bin_in;
  output sn_out, ctr_overflow;
  wire clk, rst, en;
  wire [5:0] bin_in;
  wire sn_out, ctr_overflow;
  wire [5:0] ctr4_out;
  comp_6b_1 comp6(.a_gt_b (sn_out), .a (bin_in), .b (ctr4_out));
  counter_WIDTH6_1 ctr4(.out (ctr4_out), .clk (clk), .en (en), .rst
       (rst), .overflow (ctr_overflow));
endmodule

module comp_1b_12(a, b, equal, a_larger);
  input a, b;
  output equal, a_larger;
  wire a, b;
  wire equal, a_larger;
  wire n_1;
  AND2X1 g14(.A (n_1), .B (a), .Y (a_larger));
  INVX1 g15(.A (b), .Y (n_1));
endmodule

module comp_1b_13(a, b, equal, a_larger);
  input a, b;
  output equal, a_larger;
  wire a, b;
  wire equal, a_larger;
  wire n_0;
  HAX1 g27(.A (a), .B (n_0), .YC (a_larger), .YS (equal));
  INVX1 g28(.A (b), .Y (n_0));
endmodule

module comp_1b_14(a, b, equal, a_larger);
  input a, b;
  output equal, a_larger;
  wire a, b;
  wire equal, a_larger;
  wire n_0;
  HAX1 g27(.A (a), .B (n_0), .YC (a_larger), .YS (equal));
  INVX1 g28(.A (b), .Y (n_0));
endmodule

module comp_1b_15(a, b, equal, a_larger);
  input a, b;
  output equal, a_larger;
  wire a, b;
  wire equal, a_larger;
  wire n_0;
  HAX1 g27(.A (a), .B (n_0), .YC (a_larger), .YS (equal));
  INVX1 g28(.A (b), .Y (n_0));
endmodule

module comp_1b_16(a, b, equal, a_larger);
  input a, b;
  output equal, a_larger;
  wire a, b;
  wire equal, a_larger;
  wire n_0;
  HAX1 g27(.A (a), .B (n_0), .YC (a_larger), .YS (equal));
  INVX1 g28(.A (b), .Y (n_0));
endmodule

module comp_1b_17(a, b, equal, a_larger);
  input a, b;
  output equal, a_larger;
  wire a, b;
  wire equal, a_larger;
  wire n_0;
  HAX1 g27(.A (a), .B (n_0), .YC (a_larger), .YS (equal));
  INVX1 g28(.A (b), .Y (n_0));
endmodule

module comp_6b_2(a_gt_b, a, b);
  input [5:0] a, b;
  output a_gt_b;
  wire [5:0] a, b;
  wire a_gt_b;
  wire UNCONNECTED1, agt, agt_17, agt_19, agt_22, agt_25, agt_28, e;
  wire e_13, e_14, e_15, e_16, n_0, n_1, n_2, n_3;
  wire n_4, n_5, n_6, n_7, n_8, n_9, n_10, n_11;
  comp_1b_12 comp0(.a (a[0]), .b (b[0]), .equal (UNCONNECTED1),
       .a_larger (agt_28));
  comp_1b_13 comp1(.a (a[1]), .b (b[1]), .equal (e_16), .a_larger
       (agt_25));
  comp_1b_14 comp2(.a (a[2]), .b (b[2]), .equal (e_15), .a_larger
       (agt_22));
  comp_1b_15 comp3(.a (a[3]), .b (b[3]), .equal (e_14), .a_larger
       (agt_19));
  comp_1b_16 comp4(.a (a[4]), .b (b[4]), .equal (e_13), .a_larger
       (agt));
  comp_1b_17 comp5(.a (a[5]), .b (b[5]), .equal (e), .a_larger
       (agt_17));
  INVX1 g18(.A (e_14), .Y (n_11));
  INVX1 g19(.A (e), .Y (n_10));
  OAI21X1 g141(.A (n_10), .B (n_2), .C (n_4), .Y (a_gt_b));
  AOI21X1 g142(.A (e_13), .B (n_8), .C (agt), .Y (n_9));
  OAI21X1 g143(.A (n_11), .B (n_1), .C (n_3), .Y (n_8));
  AOI21X1 g144(.A (e_15), .B (n_6), .C (agt_22), .Y (n_7));
  INVX1 g145(.A (n_0), .Y (n_6));
  AOI21X1 g146(.A (agt_28), .B (e_16), .C (agt_25), .Y (n_5));
  INVX1 g147(.A (agt_17), .Y (n_4));
  INVX1 g148(.A (agt_19), .Y (n_3));
  BUFX2 drc_bufs(.A (n_9), .Y (n_2));
  BUFX2 drc_bufs149(.A (n_7), .Y (n_1));
  BUFX2 drc_bufs150(.A (n_5), .Y (n_0));
endmodule

module counter_WIDTH6_2(out, clk, en, rst, overflow);
  input clk, en, rst;
  output [5:0] out;
  output overflow;
  wire clk, en, rst;
  wire [5:0] out;
  wire overflow;
  wire n_0, n_9, n_10, n_11, n_12, n_13, n_14, n_15;
  wire n_16, n_17, n_18, n_19, n_20, n_21, n_22, n_23;
  wire n_24, n_25, n_26, n_27, n_28, n_29, n_30, n_31;
  wire n_33, n_35, n_36, n_37, n_38, n_39, n_40;
  DFFSR \out_reg[5] (.R (n_9), .S (1'b1), .CLK (clk), .D (n_29), .Q
       (n_35));
  DFFSR overflow_reg(.R (n_9), .S (1'b1), .CLK (clk), .D (n_31), .Q
       (n_33));
  INVX1 g181(.A (n_30), .Y (n_31));
  MUX2X1 g182(.A (n_26), .B (overflow), .S (en), .Y (n_30));
  INVX1 g183(.A (n_28), .Y (n_29));
  MUX2X1 g184(.A (n_27), .B (out[5]), .S (en), .Y (n_28));
  DFFSR \out_reg[4] (.R (n_9), .S (1'b1), .CLK (clk), .D (n_25), .Q
       (n_36));
  HAX1 g186(.A (out[5]), .B (n_22), .YC (n_26), .YS (n_27));
  INVX1 g187(.A (n_24), .Y (n_25));
  MUX2X1 g188(.A (n_23), .B (out[4]), .S (en), .Y (n_24));
  DFFSR \out_reg[3] (.R (n_9), .S (1'b1), .CLK (clk), .D (n_21), .Q
       (n_37));
  HAX1 g190(.A (out[4]), .B (n_18), .YC (n_22), .YS (n_23));
  INVX1 g191(.A (n_20), .Y (n_21));
  MUX2X1 g192(.A (n_19), .B (out[3]), .S (en), .Y (n_20));
  DFFSR \out_reg[2] (.R (n_9), .S (1'b1), .CLK (clk), .D (n_17), .Q
       (n_38));
  HAX1 g194(.A (out[3]), .B (n_14), .YC (n_18), .YS (n_19));
  INVX1 g195(.A (n_16), .Y (n_17));
  MUX2X1 g196(.A (n_15), .B (out[2]), .S (en), .Y (n_16));
  DFFSR \out_reg[1] (.R (n_9), .S (1'b1), .CLK (clk), .D (n_13), .Q
       (n_39));
  HAX1 g198(.A (out[2]), .B (n_10), .YC (n_14), .YS (n_15));
  INVX1 g199(.A (n_12), .Y (n_13));
  MUX2X1 g200(.A (n_11), .B (out[1]), .S (en), .Y (n_12));
  DFFSR \out_reg[0] (.R (n_9), .S (1'b1), .CLK (clk), .D (n_0), .Q
       (n_40));
  HAX1 g202(.A (out[1]), .B (out[0]), .YC (n_10), .YS (n_11));
  INVX1 g216(.A (rst), .Y (n_9));
  BUFX2 drc_bufs245(.A (n_40), .Y (out[0]));
  BUFX2 drc_bufs246(.A (n_33), .Y (overflow));
  BUFX2 drc_bufs247(.A (n_35), .Y (out[5]));
  BUFX2 drc_bufs248(.A (n_36), .Y (out[4]));
  BUFX2 drc_bufs249(.A (n_37), .Y (out[3]));
  BUFX2 drc_bufs250(.A (n_38), .Y (out[2]));
  BUFX2 drc_bufs251(.A (n_39), .Y (out[1]));
  XOR2X1 g2(.A (en), .B (out[0]), .Y (n_0));
endmodule

module prg_6b_2(clk, rst, en, bin_in, sn_out, ctr_overflow);
  input clk, rst, en;
  input [5:0] bin_in;
  output sn_out, ctr_overflow;
  wire clk, rst, en;
  wire [5:0] bin_in;
  wire sn_out, ctr_overflow;
  wire [5:0] ctr4_out;
  comp_6b_2 comp6(.a_gt_b (sn_out), .a (bin_in), .b (ctr4_out));
  counter_WIDTH6_2 ctr4(.out (ctr4_out), .clk (clk), .en (en), .rst
       (rst), .overflow (ctr_overflow));
endmodule

module increment_unsigned(A, CI, Z);
  input [17:0] A;
  input CI;
  output [17:0] Z;
  wire [17:0] A;
  wire CI;
  wire [17:0] Z;
  wire n_1, n_3, n_5, n_7, n_9, n_11, n_13, n_15;
  wire n_17, n_19, n_21, n_23, n_25, n_27, n_29, n_31;
  XOR2X1 g119(.A (n_31), .B (A[17]), .Y (Z[17]));
  HAX1 g120(.A (A[16]), .B (n_29), .YC (n_31), .YS (Z[16]));
  HAX1 g121(.A (A[15]), .B (n_27), .YC (n_29), .YS (Z[15]));
  HAX1 g122(.A (A[14]), .B (n_25), .YC (n_27), .YS (Z[14]));
  HAX1 g123(.A (A[13]), .B (n_23), .YC (n_25), .YS (Z[13]));
  HAX1 g124(.A (A[12]), .B (n_21), .YC (n_23), .YS (Z[12]));
  HAX1 g125(.A (A[11]), .B (n_19), .YC (n_21), .YS (Z[11]));
  HAX1 g126(.A (A[10]), .B (n_17), .YC (n_19), .YS (Z[10]));
  HAX1 g127(.A (A[9]), .B (n_15), .YC (n_17), .YS (Z[9]));
  HAX1 g128(.A (A[8]), .B (n_13), .YC (n_15), .YS (Z[8]));
  HAX1 g129(.A (A[7]), .B (n_11), .YC (n_13), .YS (Z[7]));
  HAX1 g130(.A (A[6]), .B (n_9), .YC (n_11), .YS (Z[6]));
  HAX1 g131(.A (A[5]), .B (n_7), .YC (n_9), .YS (Z[5]));
  HAX1 g132(.A (A[4]), .B (n_5), .YC (n_7), .YS (Z[4]));
  HAX1 g133(.A (A[3]), .B (n_3), .YC (n_5), .YS (Z[3]));
  HAX1 g134(.A (A[2]), .B (n_1), .YC (n_3), .YS (Z[2]));
  HAX1 g135(.A (A[0]), .B (A[1]), .YC (n_1), .YS (Z[1]));
endmodule

module counter_WIDTH18(out, clk, en, rst, overflow);
  input clk, en, rst;
  output [17:0] out;
  output overflow;
  wire clk, en, rst;
  wire [17:0] out;
  wire overflow;
  wire UNCONNECTED2, n_0, n_2, n_3, n_4, n_5, n_6, n_7;
  wire n_8, n_9, n_10, n_11, n_12, n_13, n_14, n_15;
  wire n_16, n_17, n_18, n_19, n_20, n_21, n_22, n_23;
  wire n_24, n_25, n_26, n_27, n_28, n_29, n_30, n_31;
  wire n_32, n_33, n_34, n_35, n_36, n_37, n_38, n_39;
  wire n_40, n_41, n_42, n_43, n_44, n_45, n_46, n_47;
  wire n_48, n_49, n_50, n_51, n_52, n_53, n_56, n_76;
  wire n_77, n_78, n_79, n_80, n_81, n_82, n_83, n_84;
  wire n_85, n_86, n_87, n_88, n_89, n_90, n_91, n_92;
  increment_unsigned inc_add_36_16_1(.A (out), .CI (1'b1), .Z ({n_76,
       n_77, n_78, n_79, n_80, n_81, n_82, n_83, n_84, n_85, n_86,
       n_87, n_88, n_89, n_90, n_91, n_92, UNCONNECTED2}));
  INVX1 g40(.A (rst), .Y (n_56));
  DFFSR \out_reg[10] (.R (n_56), .S (1'b1), .CLK (clk), .D (n_30), .Q
       (n_46));
  DFFSR \out_reg[15] (.R (n_56), .S (1'b1), .CLK (clk), .D (n_35), .Q
       (n_51));
  DFFSR \out_reg[16] (.R (n_56), .S (1'b1), .CLK (clk), .D (n_34), .Q
       (n_52));
  DFFSR \out_reg[17] (.R (n_56), .S (1'b1), .CLK (clk), .D (n_33), .Q
       (n_53));
  DFFSR \out_reg[1] (.R (n_56), .S (1'b1), .CLK (clk), .D (n_32), .Q
       (n_37));
  DFFSR \out_reg[2] (.R (n_56), .S (1'b1), .CLK (clk), .D (n_31), .Q
       (n_38));
  DFFSR \out_reg[3] (.R (n_56), .S (1'b1), .CLK (clk), .D (n_29), .Q
       (n_39));
  DFFSR \out_reg[4] (.R (n_56), .S (1'b1), .CLK (clk), .D (n_28), .Q
       (n_40));
  DFFSR \out_reg[5] (.R (n_56), .S (1'b1), .CLK (clk), .D (n_27), .Q
       (n_41));
  DFFSR \out_reg[11] (.R (n_56), .S (1'b1), .CLK (clk), .D (n_15), .Q
       (n_47));
  DFFSR \out_reg[12] (.R (n_56), .S (1'b1), .CLK (clk), .D (n_12), .Q
       (n_48));
  DFFSR \out_reg[6] (.R (n_56), .S (1'b1), .CLK (clk), .D (n_17), .Q
       (n_42));
  DFFSR \out_reg[7] (.R (n_56), .S (1'b1), .CLK (clk), .D (n_16), .Q
       (n_43));
  DFFSR \out_reg[8] (.R (n_56), .S (1'b1), .CLK (clk), .D (n_14), .Q
       (n_44));
  DFFSR \out_reg[9] (.R (n_56), .S (1'b1), .CLK (clk), .D (n_13), .Q
       (n_45));
  DFFSR \out_reg[13] (.R (n_56), .S (1'b1), .CLK (clk), .D (n_11), .Q
       (n_49));
  DFFSR \out_reg[14] (.R (n_56), .S (1'b1), .CLK (clk), .D (n_10), .Q
       (n_50));
  DFFSR \out_reg[0] (.R (n_56), .S (1'b1), .CLK (clk), .D (n_0), .Q
       (n_36));
  INVX1 g58(.A (n_26), .Y (n_35));
  INVX1 g59(.A (n_25), .Y (n_34));
  INVX1 g60(.A (n_24), .Y (n_33));
  INVX1 g61(.A (n_23), .Y (n_32));
  INVX1 g62(.A (n_22), .Y (n_31));
  INVX1 g63(.A (n_21), .Y (n_30));
  INVX1 g64(.A (n_20), .Y (n_29));
  INVX1 g65(.A (n_19), .Y (n_28));
  INVX1 g66(.A (n_18), .Y (n_27));
  MUX2X1 g67(.A (n_78), .B (out[15]), .S (en), .Y (n_26));
  MUX2X1 g68(.A (n_77), .B (out[16]), .S (en), .Y (n_25));
  MUX2X1 g69(.A (n_76), .B (out[17]), .S (en), .Y (n_24));
  MUX2X1 g70(.A (n_92), .B (out[1]), .S (en), .Y (n_23));
  MUX2X1 g71(.A (n_91), .B (out[2]), .S (en), .Y (n_22));
  MUX2X1 g72(.A (n_83), .B (out[10]), .S (en), .Y (n_21));
  MUX2X1 g73(.A (n_90), .B (out[3]), .S (en), .Y (n_20));
  MUX2X1 g74(.A (n_89), .B (out[4]), .S (en), .Y (n_19));
  MUX2X1 g75(.A (n_88), .B (out[5]), .S (en), .Y (n_18));
  INVX1 g76(.A (n_9), .Y (n_17));
  INVX1 g77(.A (n_8), .Y (n_16));
  INVX1 g78(.A (n_7), .Y (n_15));
  INVX1 g79(.A (n_6), .Y (n_14));
  INVX1 g80(.A (n_5), .Y (n_13));
  INVX1 g81(.A (n_4), .Y (n_12));
  INVX1 g82(.A (n_3), .Y (n_11));
  INVX1 g83(.A (n_2), .Y (n_10));
  MUX2X1 g84(.A (n_87), .B (out[6]), .S (en), .Y (n_9));
  MUX2X1 g85(.A (n_86), .B (out[7]), .S (en), .Y (n_8));
  MUX2X1 g86(.A (n_82), .B (out[11]), .S (en), .Y (n_7));
  MUX2X1 g87(.A (n_85), .B (out[8]), .S (en), .Y (n_6));
  MUX2X1 g88(.A (n_84), .B (out[9]), .S (en), .Y (n_5));
  MUX2X1 g89(.A (n_81), .B (out[12]), .S (en), .Y (n_4));
  MUX2X1 g90(.A (n_80), .B (out[13]), .S (en), .Y (n_3));
  MUX2X1 g91(.A (n_79), .B (out[14]), .S (en), .Y (n_2));
  BUFX2 drc_bufs166(.A (n_53), .Y (out[17]));
  BUFX2 drc_bufs167(.A (n_36), .Y (out[0]));
  BUFX2 drc_bufs168(.A (n_37), .Y (out[1]));
  BUFX2 drc_bufs169(.A (n_38), .Y (out[2]));
  BUFX2 drc_bufs170(.A (n_39), .Y (out[3]));
  BUFX2 drc_bufs171(.A (n_40), .Y (out[4]));
  BUFX2 drc_bufs172(.A (n_41), .Y (out[5]));
  BUFX2 drc_bufs173(.A (n_42), .Y (out[6]));
  BUFX2 drc_bufs174(.A (n_43), .Y (out[7]));
  BUFX2 drc_bufs175(.A (n_44), .Y (out[8]));
  BUFX2 drc_bufs176(.A (n_45), .Y (out[9]));
  BUFX2 drc_bufs177(.A (n_46), .Y (out[10]));
  BUFX2 drc_bufs178(.A (n_47), .Y (out[11]));
  BUFX2 drc_bufs179(.A (n_48), .Y (out[12]));
  BUFX2 drc_bufs180(.A (n_49), .Y (out[13]));
  BUFX2 drc_bufs181(.A (n_50), .Y (out[14]));
  BUFX2 drc_bufs182(.A (n_51), .Y (out[15]));
  BUFX2 drc_bufs183(.A (n_52), .Y (out[16]));
  XOR2X1 g2(.A (en), .B (out[0]), .Y (n_0));
endmodule

module dsc_mul(a, b, c, z, clk, rst, en, ov);
  input [5:0] a, b, c;
  input clk, rst, en;
  output [17:0] z;
  output ov;
  wire [5:0] a, b, c;
  wire clk, rst, en;
  wire [17:0] z;
  wire ov;
  wire ctr_ov_a, ctr_ov_b, ctr_ov_c, dummy_ov, n_0, n_1, sn_out_a,
       sn_out_b;
  wire sn_out_c, sn_out_mul;
  prg_6b prg_a(.clk (clk), .rst (rst), .en (en), .bin_in (a), .sn_out
       (sn_out_a), .ctr_overflow (ctr_ov_a));
  prg_6b_1 prg_b(.clk (ctr_ov_a), .rst (rst), .en (en), .bin_in (b),
       .sn_out (sn_out_b), .ctr_overflow (ctr_ov_b));
  prg_6b_2 prg_c(.clk (ctr_ov_b), .rst (rst), .en (en), .bin_in (c),
       .sn_out (sn_out_c), .ctr_overflow (ctr_ov_c));
  counter_WIDTH18 stoch2bin_out(.out (z), .clk (clk), .en (sn_out_mul),
       .rst (rst), .overflow (dummy_ov));
  AND2X1 g27(.A (sn_out_c), .B (n_1), .Y (sn_out_mul));
  OR2X1 g28(.A (ctr_ov_c), .B (n_0), .Y (ov));
  AND2X1 g29(.A (sn_out_a), .B (sn_out_b), .Y (n_1));
  INVX1 g30(.A (sn_out_c), .Y (n_0));
endmodule

