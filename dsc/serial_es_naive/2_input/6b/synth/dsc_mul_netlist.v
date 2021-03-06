
// Generated by Cadence Encounter(R) RTL Compiler RC14.28 - v14.20-s067_1

// Verification Directory fv/dsc_mul 

module det_stoch_mul(a, b, y);
  input a, b;
  output y;
  wire a, b;
  wire y;
  AND2X1 g8(.A (b), .B (a), .Y (y));
endmodule

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
  INVX1 g19(.A (e), .Y (n_11));
  INVX1 g18(.A (e_14), .Y (n_10));
  OAI21X1 g141(.A (n_11), .B (n_2), .C (n_4), .Y (a_gt_b));
  AOI21X1 g142(.A (e_13), .B (n_8), .C (agt), .Y (n_9));
  OAI21X1 g143(.A (n_10), .B (n_1), .C (n_3), .Y (n_8));
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

module counter_WIDTH12(out, clk, en, rst, overflow);
  input clk, en, rst;
  output [11:0] out;
  output overflow;
  wire clk, en, rst;
  wire [11:0] out;
  wire overflow;
  wire n_0, n_2, n_3, n_4, n_5, n_6, n_7, n_8;
  wire n_9, n_10, n_11, n_12, n_13, n_14, n_15, n_16;
  wire n_17, n_18, n_19, n_20, n_21, n_22, n_23, n_24;
  wire n_25, n_26, n_27, n_28, n_29, n_30, n_31, n_32;
  wire n_33, n_34, n_35, n_36, n_37, n_38, n_39, n_41;
  wire n_42, n_45, n_46, n_47, n_48, n_49, n_50, n_51;
  wire n_52, n_53, n_54, n_55, n_56, n_58, n_74, n_75;
  INVX1 g50(.A (rst), .Y (n_58));
  DFFSR \out_reg[11] (.R (n_58), .S (1'b1), .CLK (clk), .D (n_75), .Q
       (n_56));
  DFFSR \out_reg[10] (.R (n_58), .S (1'b1), .CLK (clk), .D (n_42), .Q
       (n_55));
  INVX1 g203(.A (n_41), .Y (n_42));
  MUX2X1 g204(.A (n_39), .B (out[10]), .S (en), .Y (n_41));
  DFFSR \out_reg[9] (.R (n_58), .S (1'b1), .CLK (clk), .D (n_37), .Q
       (n_54));
  HAX1 g207(.A (out[10]), .B (n_34), .YC (n_38), .YS (n_39));
  INVX1 g208(.A (n_36), .Y (n_37));
  MUX2X1 g209(.A (n_35), .B (out[9]), .S (en), .Y (n_36));
  DFFSR \out_reg[8] (.R (n_58), .S (1'b1), .CLK (clk), .D (n_33), .Q
       (n_53));
  HAX1 g211(.A (out[9]), .B (n_30), .YC (n_34), .YS (n_35));
  INVX1 g212(.A (n_32), .Y (n_33));
  MUX2X1 g213(.A (n_31), .B (out[8]), .S (en), .Y (n_32));
  DFFSR \out_reg[7] (.R (n_58), .S (1'b1), .CLK (clk), .D (n_29), .Q
       (n_52));
  HAX1 g215(.A (out[8]), .B (n_26), .YC (n_30), .YS (n_31));
  INVX1 g216(.A (n_28), .Y (n_29));
  MUX2X1 g217(.A (n_27), .B (out[7]), .S (en), .Y (n_28));
  DFFSR \out_reg[6] (.R (n_58), .S (1'b1), .CLK (clk), .D (n_25), .Q
       (n_51));
  HAX1 g219(.A (out[7]), .B (n_22), .YC (n_26), .YS (n_27));
  INVX1 g220(.A (n_24), .Y (n_25));
  MUX2X1 g221(.A (n_23), .B (out[6]), .S (en), .Y (n_24));
  DFFSR \out_reg[5] (.R (n_58), .S (1'b1), .CLK (clk), .D (n_21), .Q
       (n_50));
  HAX1 g223(.A (out[6]), .B (n_18), .YC (n_22), .YS (n_23));
  INVX1 g224(.A (n_20), .Y (n_21));
  MUX2X1 g225(.A (n_19), .B (out[5]), .S (en), .Y (n_20));
  DFFSR \out_reg[4] (.R (n_58), .S (1'b1), .CLK (clk), .D (n_17), .Q
       (n_49));
  HAX1 g227(.A (out[5]), .B (n_14), .YC (n_18), .YS (n_19));
  INVX1 g228(.A (n_16), .Y (n_17));
  MUX2X1 g229(.A (n_15), .B (out[4]), .S (en), .Y (n_16));
  DFFSR \out_reg[3] (.R (n_58), .S (1'b1), .CLK (clk), .D (n_13), .Q
       (n_48));
  HAX1 g231(.A (out[4]), .B (n_10), .YC (n_14), .YS (n_15));
  INVX1 g232(.A (n_12), .Y (n_13));
  MUX2X1 g233(.A (n_11), .B (out[3]), .S (en), .Y (n_12));
  DFFSR \out_reg[2] (.R (n_58), .S (1'b1), .CLK (clk), .D (n_9), .Q
       (n_47));
  HAX1 g235(.A (out[3]), .B (n_6), .YC (n_10), .YS (n_11));
  INVX1 g236(.A (n_8), .Y (n_9));
  MUX2X1 g237(.A (n_7), .B (out[2]), .S (en), .Y (n_8));
  DFFSR \out_reg[1] (.R (n_58), .S (1'b1), .CLK (clk), .D (n_5), .Q
       (n_46));
  HAX1 g239(.A (out[2]), .B (n_2), .YC (n_6), .YS (n_7));
  INVX1 g240(.A (n_4), .Y (n_5));
  MUX2X1 g241(.A (n_3), .B (out[1]), .S (en), .Y (n_4));
  DFFSR \out_reg[0] (.R (n_58), .S (1'b1), .CLK (clk), .D (n_0), .Q
       (n_45));
  HAX1 g243(.A (out[1]), .B (out[0]), .YC (n_2), .YS (n_3));
  BUFX2 drc_bufs317(.A (n_56), .Y (out[11]));
  BUFX2 drc_bufs318(.A (n_45), .Y (out[0]));
  BUFX2 drc_bufs319(.A (n_46), .Y (out[1]));
  BUFX2 drc_bufs320(.A (n_47), .Y (out[2]));
  BUFX2 drc_bufs321(.A (n_48), .Y (out[3]));
  BUFX2 drc_bufs322(.A (n_49), .Y (out[4]));
  BUFX2 drc_bufs323(.A (n_50), .Y (out[5]));
  BUFX2 drc_bufs324(.A (n_51), .Y (out[6]));
  BUFX2 drc_bufs325(.A (n_52), .Y (out[7]));
  BUFX2 drc_bufs326(.A (n_53), .Y (out[8]));
  BUFX2 drc_bufs327(.A (n_54), .Y (out[9]));
  BUFX2 drc_bufs328(.A (n_55), .Y (out[10]));
  XOR2X1 g2(.A (en), .B (out[0]), .Y (n_0));
  XOR2X1 g341(.A (n_74), .B (out[11]), .Y (n_75));
  AND2X1 g3(.A (en), .B (n_38), .Y (n_74));
endmodule

module dsc_mul(a, b, z, clk, rst, en, ov);
  input [5:0] a, b;
  input clk, rst, en;
  output [11:0] z;
  output ov;
  wire [5:0] a, b;
  wire clk, rst, en;
  wire [11:0] z;
  wire ov;
  wire ctr_ov_a, ctr_ov_b, dummy_ov, n_0, sn_out_a, sn_out_b,
       sn_out_mul;
  det_stoch_mul mul(.a (sn_out_a), .b (sn_out_b), .y (sn_out_mul));
  prg_6b prg_a(.clk (clk), .rst (rst), .en (en), .bin_in (a), .sn_out
       (sn_out_a), .ctr_overflow (ctr_ov_a));
  prg_6b_1 prg_b(.clk (ctr_ov_a), .rst (rst), .en (en), .bin_in (b),
       .sn_out (sn_out_b), .ctr_overflow (ctr_ov_b));
  counter_WIDTH12 stoch2bin_out(.out (z), .clk (clk), .en (sn_out_mul),
       .rst (rst), .overflow (dummy_ov));
  OR2X1 g4(.A (ctr_ov_b), .B (n_0), .Y (ov));
  INVX1 g5(.A (sn_out_b), .Y (n_0));
endmodule

