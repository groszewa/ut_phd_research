
// Generated by Cadence Encounter(R) RTL Compiler v14.10-s022_1

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
  assign equal = 1'b0;
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

module comp_1b_6(a, b, equal, a_larger);
  input a, b;
  output equal, a_larger;
  wire a, b;
  wire equal, a_larger;
  wire n_0;
  HAX1 g27(.A (a), .B (n_0), .YC (a_larger), .YS (equal));
  INVX1 g28(.A (b), .Y (n_0));
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

module comp_8b(a_gt_b, a, b);
  input [7:0] a, b;
  output a_gt_b;
  wire [7:0] a, b;
  wire a_gt_b;
  wire UNCONNECTED, agt, agt_23, agt_25, agt_28, agt_31, agt_34, agt_37;
  wire agt_40, e, e_17, e_18, e_19, e_20, e_21, e_22;
  wire n_0, n_1, n_2, n_3, n_4, n_5, n_6, n_7;
  wire n_8, n_9, n_10, n_11, n_12, n_13, n_14, n_15;
  wire n_16;
  comp_1b comp0(.a (a[0]), .b (b[0]), .equal (UNCONNECTED), .a_larger
       (agt_40));
  comp_1b_1 comp1(.a (a[1]), .b (b[1]), .equal (e_22), .a_larger
       (agt_37));
  comp_1b_2 comp2(.a (a[2]), .b (b[2]), .equal (e_21), .a_larger
       (agt_34));
  comp_1b_3 comp3(.a (a[3]), .b (b[3]), .equal (e_20), .a_larger
       (agt_31));
  comp_1b_4 comp4(.a (a[4]), .b (b[4]), .equal (e_19), .a_larger
       (agt_28));
  comp_1b_5 comp5(.a (a[5]), .b (b[5]), .equal (e_18), .a_larger
       (agt_25));
  comp_1b_6 comp6(.a (a[6]), .b (b[6]), .equal (e_17), .a_larger (agt));
  comp_1b_7 comp7(.a (a[7]), .b (b[7]), .equal (e), .a_larger (agt_23));
  INVX1 g27(.A (e_18), .Y (n_16));
  INVX1 g26(.A (e_20), .Y (n_15));
  OAI21X1 g183(.A (n_7), .B (n_3), .C (n_5), .Y (a_gt_b));
  AOI21X1 g184(.A (e_17), .B (n_13), .C (agt), .Y (n_14));
  OAI21X1 g185(.A (n_16), .B (n_2), .C (n_6), .Y (n_13));
  AOI21X1 g186(.A (e_19), .B (n_11), .C (agt_28), .Y (n_12));
  OAI21X1 g187(.A (n_15), .B (n_1), .C (n_4), .Y (n_11));
  AOI21X1 g188(.A (e_21), .B (n_9), .C (agt_34), .Y (n_10));
  INVX1 g189(.A (n_0), .Y (n_9));
  AOI21X1 g190(.A (agt_40), .B (e_22), .C (agt_37), .Y (n_8));
  INVX1 g191(.A (e), .Y (n_7));
  INVX1 g192(.A (agt_25), .Y (n_6));
  INVX1 g193(.A (agt_23), .Y (n_5));
  INVX1 g194(.A (agt_31), .Y (n_4));
  BUFX2 drc_bufs(.A (n_14), .Y (n_3));
  BUFX2 drc_bufs195(.A (n_12), .Y (n_2));
  BUFX2 drc_bufs196(.A (n_10), .Y (n_1));
  BUFX2 drc_bufs197(.A (n_8), .Y (n_0));
endmodule

module counter_WIDTH8(out, clk, en, rst, overflow);
  input clk, en, rst;
  output [7:0] out;
  output overflow;
  wire clk, en, rst;
  wire [7:0] out;
  wire overflow;
  wire n_0, n_11, n_12, n_13, n_14, n_15, n_16, n_17;
  wire n_18, n_19, n_20, n_21, n_22, n_23, n_24, n_25;
  wire n_26, n_27, n_28, n_29, n_30, n_31, n_32, n_33;
  wire n_34, n_35, n_36, n_37, n_38, n_39, n_40, n_41;
  wire n_44, n_45, n_46, n_47, n_48, n_49, n_50, n_51;
  DFFSR \out_reg[7] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_41), .Q
       (n_44));
  DFFSR overflow_reg(.R (n_11), .S (1'b1), .CLK (clk), .D (n_39), .Q
       (overflow));
  INVX1 g143(.A (n_40), .Y (n_41));
  MUX2X1 g144(.A (n_37), .B (out[7]), .S (en), .Y (n_40));
  INVX1 g145(.A (n_38), .Y (n_39));
  MUX2X1 g146(.A (n_36), .B (overflow), .S (en), .Y (n_38));
  DFFSR \out_reg[6] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_35), .Q
       (n_45));
  HAX1 g148(.A (out[7]), .B (n_32), .YC (n_36), .YS (n_37));
  INVX1 g149(.A (n_34), .Y (n_35));
  MUX2X1 g150(.A (n_33), .B (out[6]), .S (en), .Y (n_34));
  DFFSR \out_reg[5] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_31), .Q
       (n_46));
  HAX1 g152(.A (out[6]), .B (n_28), .YC (n_32), .YS (n_33));
  INVX1 g153(.A (n_30), .Y (n_31));
  MUX2X1 g154(.A (n_29), .B (out[5]), .S (en), .Y (n_30));
  DFFSR \out_reg[4] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_27), .Q
       (n_47));
  HAX1 g156(.A (out[5]), .B (n_24), .YC (n_28), .YS (n_29));
  INVX1 g157(.A (n_26), .Y (n_27));
  MUX2X1 g158(.A (n_25), .B (out[4]), .S (en), .Y (n_26));
  DFFSR \out_reg[3] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_23), .Q
       (n_48));
  HAX1 g160(.A (out[4]), .B (n_20), .YC (n_24), .YS (n_25));
  INVX1 g161(.A (n_22), .Y (n_23));
  MUX2X1 g162(.A (n_21), .B (out[3]), .S (en), .Y (n_22));
  DFFSR \out_reg[2] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_19), .Q
       (n_49));
  HAX1 g164(.A (out[3]), .B (n_16), .YC (n_20), .YS (n_21));
  INVX1 g165(.A (n_18), .Y (n_19));
  MUX2X1 g166(.A (n_17), .B (out[2]), .S (en), .Y (n_18));
  DFFSR \out_reg[1] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_15), .Q
       (n_50));
  HAX1 g168(.A (out[2]), .B (n_12), .YC (n_16), .YS (n_17));
  INVX1 g169(.A (n_14), .Y (n_15));
  MUX2X1 g170(.A (n_13), .B (out[1]), .S (en), .Y (n_14));
  DFFSR \out_reg[0] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_0), .Q
       (n_51));
  HAX1 g172(.A (out[1]), .B (out[0]), .YC (n_12), .YS (n_13));
  INVX1 g190(.A (rst), .Y (n_11));
  BUFX2 drc_bufs227(.A (n_51), .Y (out[0]));
  BUFX2 drc_bufs229(.A (n_44), .Y (out[7]));
  BUFX2 drc_bufs230(.A (n_45), .Y (out[6]));
  BUFX2 drc_bufs231(.A (n_46), .Y (out[5]));
  BUFX2 drc_bufs232(.A (n_47), .Y (out[4]));
  BUFX2 drc_bufs233(.A (n_48), .Y (out[3]));
  BUFX2 drc_bufs234(.A (n_49), .Y (out[2]));
  BUFX2 drc_bufs235(.A (n_50), .Y (out[1]));
  XOR2X1 g2(.A (en), .B (out[0]), .Y (n_0));
endmodule

module prg_8b(clk, rst, en, bin_in, sn_out, ctr_overflow);
  input clk, rst, en;
  input [7:0] bin_in;
  output sn_out, ctr_overflow;
  wire clk, rst, en;
  wire [7:0] bin_in;
  wire sn_out, ctr_overflow;
  wire [7:0] ctr4_out;
  comp_8b comp8(.a_gt_b (sn_out), .a (bin_in), .b (ctr4_out));
  counter_WIDTH8 ctr4(.out (ctr4_out), .clk (clk), .en (en), .rst
       (rst), .overflow (ctr_overflow));
endmodule

module comp_1b_8(a, b, equal, a_larger);
  input a, b;
  output equal, a_larger;
  wire a, b;
  wire equal, a_larger;
  wire n_1;
  assign equal = 1'b0;
  AND2X1 g14(.A (n_1), .B (a), .Y (a_larger));
  INVX1 g15(.A (b), .Y (n_1));
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

module comp_1b_12(a, b, equal, a_larger);
  input a, b;
  output equal, a_larger;
  wire a, b;
  wire equal, a_larger;
  wire n_0;
  HAX1 g27(.A (a), .B (n_0), .YC (a_larger), .YS (equal));
  INVX1 g28(.A (b), .Y (n_0));
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

module comp_8b_1(a_gt_b, a, b);
  input [7:0] a, b;
  output a_gt_b;
  wire [7:0] a, b;
  wire a_gt_b;
  wire UNCONNECTED0, agt, agt_23, agt_25, agt_28, agt_31, agt_34,
       agt_37;
  wire agt_40, e, e_17, e_18, e_19, e_20, e_21, e_22;
  wire n_0, n_1, n_2, n_3, n_4, n_5, n_6, n_7;
  wire n_8, n_9, n_10, n_11, n_12, n_13, n_14, n_15;
  wire n_16;
  comp_1b_8 comp0(.a (a[0]), .b (b[0]), .equal (UNCONNECTED0),
       .a_larger (agt_40));
  comp_1b_9 comp1(.a (a[1]), .b (b[1]), .equal (e_22), .a_larger
       (agt_37));
  comp_1b_10 comp2(.a (a[2]), .b (b[2]), .equal (e_21), .a_larger
       (agt_34));
  comp_1b_11 comp3(.a (a[3]), .b (b[3]), .equal (e_20), .a_larger
       (agt_31));
  comp_1b_12 comp4(.a (a[4]), .b (b[4]), .equal (e_19), .a_larger
       (agt_28));
  comp_1b_13 comp5(.a (a[5]), .b (b[5]), .equal (e_18), .a_larger
       (agt_25));
  comp_1b_14 comp6(.a (a[6]), .b (b[6]), .equal (e_17), .a_larger
       (agt));
  comp_1b_15 comp7(.a (a[7]), .b (b[7]), .equal (e), .a_larger
       (agt_23));
  INVX1 g27(.A (e_20), .Y (n_16));
  INVX1 g26(.A (e_18), .Y (n_15));
  INVX1 g28(.A (e), .Y (n_14));
  OAI21X1 g183(.A (n_14), .B (n_3), .C (n_5), .Y (a_gt_b));
  AOI21X1 g184(.A (e_17), .B (n_12), .C (agt), .Y (n_13));
  OAI21X1 g185(.A (n_15), .B (n_2), .C (n_6), .Y (n_12));
  AOI21X1 g186(.A (e_19), .B (n_10), .C (agt_28), .Y (n_11));
  OAI21X1 g187(.A (n_16), .B (n_1), .C (n_4), .Y (n_10));
  AOI21X1 g188(.A (e_21), .B (n_8), .C (agt_34), .Y (n_9));
  INVX1 g189(.A (n_0), .Y (n_8));
  AOI21X1 g190(.A (agt_40), .B (e_22), .C (agt_37), .Y (n_7));
  INVX1 g191(.A (agt_25), .Y (n_6));
  INVX1 g192(.A (agt_23), .Y (n_5));
  INVX1 g193(.A (agt_31), .Y (n_4));
  BUFX2 drc_bufs(.A (n_13), .Y (n_3));
  BUFX2 drc_bufs194(.A (n_11), .Y (n_2));
  BUFX2 drc_bufs195(.A (n_9), .Y (n_1));
  BUFX2 drc_bufs196(.A (n_7), .Y (n_0));
endmodule

module counter_WIDTH8_1(out, clk, en, rst, overflow);
  input clk, en, rst;
  output [7:0] out;
  output overflow;
  wire clk, en, rst;
  wire [7:0] out;
  wire overflow;
  wire n_0, n_11, n_12, n_13, n_14, n_15, n_16, n_17;
  wire n_18, n_19, n_20, n_21, n_22, n_23, n_24, n_25;
  wire n_26, n_27, n_28, n_29, n_30, n_31, n_32, n_33;
  wire n_34, n_35, n_36, n_37, n_38, n_39, n_40, n_41;
  wire n_42, n_44, n_45, n_46, n_47, n_48, n_49, n_50;
  wire n_51;
  DFFSR \out_reg[7] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_41), .Q
       (n_44));
  DFFSR overflow_reg(.R (n_11), .S (1'b1), .CLK (clk), .D (n_39), .Q
       (n_42));
  INVX1 g220(.A (n_40), .Y (n_41));
  MUX2X1 g221(.A (n_37), .B (out[7]), .S (en), .Y (n_40));
  INVX1 g222(.A (n_38), .Y (n_39));
  MUX2X1 g223(.A (n_36), .B (overflow), .S (en), .Y (n_38));
  DFFSR \out_reg[6] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_35), .Q
       (n_45));
  HAX1 g225(.A (out[7]), .B (n_32), .YC (n_36), .YS (n_37));
  INVX1 g226(.A (n_34), .Y (n_35));
  MUX2X1 g227(.A (n_33), .B (out[6]), .S (en), .Y (n_34));
  DFFSR \out_reg[5] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_31), .Q
       (n_46));
  HAX1 g229(.A (out[6]), .B (n_28), .YC (n_32), .YS (n_33));
  INVX1 g230(.A (n_30), .Y (n_31));
  MUX2X1 g231(.A (n_29), .B (out[5]), .S (en), .Y (n_30));
  DFFSR \out_reg[4] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_27), .Q
       (n_47));
  HAX1 g233(.A (out[5]), .B (n_24), .YC (n_28), .YS (n_29));
  INVX1 g234(.A (n_26), .Y (n_27));
  MUX2X1 g235(.A (n_25), .B (out[4]), .S (en), .Y (n_26));
  DFFSR \out_reg[3] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_23), .Q
       (n_48));
  HAX1 g237(.A (out[4]), .B (n_20), .YC (n_24), .YS (n_25));
  INVX1 g238(.A (n_22), .Y (n_23));
  MUX2X1 g239(.A (n_21), .B (out[3]), .S (en), .Y (n_22));
  DFFSR \out_reg[2] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_19), .Q
       (n_49));
  HAX1 g241(.A (out[3]), .B (n_16), .YC (n_20), .YS (n_21));
  INVX1 g242(.A (n_18), .Y (n_19));
  MUX2X1 g243(.A (n_17), .B (out[2]), .S (en), .Y (n_18));
  DFFSR \out_reg[1] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_15), .Q
       (n_50));
  HAX1 g245(.A (out[2]), .B (n_12), .YC (n_16), .YS (n_17));
  INVX1 g246(.A (n_14), .Y (n_15));
  MUX2X1 g247(.A (n_13), .B (out[1]), .S (en), .Y (n_14));
  DFFSR \out_reg[0] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_0), .Q
       (n_51));
  HAX1 g249(.A (out[1]), .B (out[0]), .YC (n_12), .YS (n_13));
  INVX1 g267(.A (rst), .Y (n_11));
  BUFX2 drc_bufs304(.A (n_51), .Y (out[0]));
  BUFX2 drc_bufs305(.A (n_42), .Y (overflow));
  BUFX2 drc_bufs306(.A (n_44), .Y (out[7]));
  BUFX2 drc_bufs307(.A (n_45), .Y (out[6]));
  BUFX2 drc_bufs308(.A (n_46), .Y (out[5]));
  BUFX2 drc_bufs309(.A (n_47), .Y (out[4]));
  BUFX2 drc_bufs310(.A (n_48), .Y (out[3]));
  BUFX2 drc_bufs311(.A (n_49), .Y (out[2]));
  BUFX2 drc_bufs312(.A (n_50), .Y (out[1]));
  XOR2X1 g2(.A (en), .B (out[0]), .Y (n_0));
endmodule

module prg_8b_1(clk, rst, en, bin_in, sn_out, ctr_overflow);
  input clk, rst, en;
  input [7:0] bin_in;
  output sn_out, ctr_overflow;
  wire clk, rst, en;
  wire [7:0] bin_in;
  wire sn_out, ctr_overflow;
  wire [7:0] ctr4_out;
  comp_8b_1 comp8(.a_gt_b (sn_out), .a (bin_in), .b (ctr4_out));
  counter_WIDTH8_1 ctr4(.out (ctr4_out), .clk (clk), .en (en), .rst
       (rst), .overflow (ctr_overflow));
endmodule

module counter_WIDTH16(out, clk, en, rst, overflow);
  input clk, en, rst;
  output [15:0] out;
  output overflow;
  wire clk, en, rst;
  wire [15:0] out;
  wire overflow;
  wire n_0, n_2, n_3, n_4, n_5, n_6, n_7, n_8;
  wire n_9, n_10, n_11, n_12, n_13, n_14, n_15, n_16;
  wire n_17, n_18, n_19, n_20, n_21, n_22, n_23, n_24;
  wire n_25, n_26, n_27, n_28, n_29, n_30, n_31, n_32;
  wire n_33, n_34, n_35, n_36, n_37, n_38, n_39, n_40;
  wire n_41, n_42, n_43, n_44, n_45, n_46, n_47, n_48;
  wire n_49, n_50, n_51, n_52, n_53, n_54, n_55, n_57;
  wire n_58, n_61, n_62, n_63, n_64, n_65, n_66, n_67;
  wire n_68, n_69, n_70, n_71, n_72, n_73, n_74, n_75;
  wire n_76, n_78, n_98, n_99;
  assign overflow = 1'b0;
  INVX1 g76(.A (rst), .Y (n_78));
  DFFSR \out_reg[15] (.R (n_78), .S (1'b1), .CLK (clk), .D (n_99), .Q
       (n_76));
  DFFSR \out_reg[14] (.R (n_78), .S (1'b1), .CLK (clk), .D (n_58), .Q
       (n_75));
  INVX1 g288(.A (n_57), .Y (n_58));
  MUX2X1 g289(.A (n_55), .B (out[14]), .S (en), .Y (n_57));
  DFFSR \out_reg[13] (.R (n_78), .S (1'b1), .CLK (clk), .D (n_53), .Q
       (n_74));
  HAX1 g292(.A (out[14]), .B (n_50), .YC (n_54), .YS (n_55));
  INVX1 g293(.A (n_52), .Y (n_53));
  MUX2X1 g294(.A (n_51), .B (out[13]), .S (en), .Y (n_52));
  DFFSR \out_reg[12] (.R (n_78), .S (1'b1), .CLK (clk), .D (n_49), .Q
       (n_73));
  HAX1 g296(.A (out[13]), .B (n_46), .YC (n_50), .YS (n_51));
  INVX1 g297(.A (n_48), .Y (n_49));
  MUX2X1 g298(.A (n_47), .B (out[12]), .S (en), .Y (n_48));
  DFFSR \out_reg[11] (.R (n_78), .S (1'b1), .CLK (clk), .D (n_45), .Q
       (n_72));
  HAX1 g300(.A (out[12]), .B (n_42), .YC (n_46), .YS (n_47));
  INVX1 g301(.A (n_44), .Y (n_45));
  MUX2X1 g302(.A (n_43), .B (out[11]), .S (en), .Y (n_44));
  DFFSR \out_reg[10] (.R (n_78), .S (1'b1), .CLK (clk), .D (n_41), .Q
       (n_71));
  HAX1 g304(.A (out[11]), .B (n_38), .YC (n_42), .YS (n_43));
  INVX1 g305(.A (n_40), .Y (n_41));
  MUX2X1 g306(.A (n_39), .B (out[10]), .S (en), .Y (n_40));
  DFFSR \out_reg[9] (.R (n_78), .S (1'b1), .CLK (clk), .D (n_37), .Q
       (n_70));
  HAX1 g308(.A (out[10]), .B (n_34), .YC (n_38), .YS (n_39));
  INVX1 g309(.A (n_36), .Y (n_37));
  MUX2X1 g310(.A (n_35), .B (out[9]), .S (en), .Y (n_36));
  DFFSR \out_reg[8] (.R (n_78), .S (1'b1), .CLK (clk), .D (n_33), .Q
       (n_69));
  HAX1 g312(.A (out[9]), .B (n_30), .YC (n_34), .YS (n_35));
  INVX1 g313(.A (n_32), .Y (n_33));
  MUX2X1 g314(.A (n_31), .B (out[8]), .S (en), .Y (n_32));
  DFFSR \out_reg[7] (.R (n_78), .S (1'b1), .CLK (clk), .D (n_29), .Q
       (n_68));
  HAX1 g316(.A (out[8]), .B (n_26), .YC (n_30), .YS (n_31));
  INVX1 g317(.A (n_28), .Y (n_29));
  MUX2X1 g318(.A (n_27), .B (out[7]), .S (en), .Y (n_28));
  DFFSR \out_reg[6] (.R (n_78), .S (1'b1), .CLK (clk), .D (n_25), .Q
       (n_67));
  HAX1 g320(.A (out[7]), .B (n_22), .YC (n_26), .YS (n_27));
  INVX1 g321(.A (n_24), .Y (n_25));
  MUX2X1 g322(.A (n_23), .B (out[6]), .S (en), .Y (n_24));
  DFFSR \out_reg[5] (.R (n_78), .S (1'b1), .CLK (clk), .D (n_21), .Q
       (n_66));
  HAX1 g324(.A (out[6]), .B (n_18), .YC (n_22), .YS (n_23));
  INVX1 g325(.A (n_20), .Y (n_21));
  MUX2X1 g326(.A (n_19), .B (out[5]), .S (en), .Y (n_20));
  DFFSR \out_reg[4] (.R (n_78), .S (1'b1), .CLK (clk), .D (n_17), .Q
       (n_65));
  HAX1 g328(.A (out[5]), .B (n_14), .YC (n_18), .YS (n_19));
  INVX1 g329(.A (n_16), .Y (n_17));
  MUX2X1 g330(.A (n_15), .B (out[4]), .S (en), .Y (n_16));
  DFFSR \out_reg[3] (.R (n_78), .S (1'b1), .CLK (clk), .D (n_13), .Q
       (n_64));
  HAX1 g332(.A (out[4]), .B (n_10), .YC (n_14), .YS (n_15));
  INVX1 g333(.A (n_12), .Y (n_13));
  MUX2X1 g334(.A (n_11), .B (out[3]), .S (en), .Y (n_12));
  DFFSR \out_reg[2] (.R (n_78), .S (1'b1), .CLK (clk), .D (n_9), .Q
       (n_63));
  HAX1 g336(.A (out[3]), .B (n_6), .YC (n_10), .YS (n_11));
  INVX1 g337(.A (n_8), .Y (n_9));
  MUX2X1 g338(.A (n_7), .B (out[2]), .S (en), .Y (n_8));
  DFFSR \out_reg[1] (.R (n_78), .S (1'b1), .CLK (clk), .D (n_5), .Q
       (n_62));
  HAX1 g340(.A (out[2]), .B (n_2), .YC (n_6), .YS (n_7));
  INVX1 g341(.A (n_4), .Y (n_5));
  MUX2X1 g342(.A (n_3), .B (out[1]), .S (en), .Y (n_4));
  DFFSR \out_reg[0] (.R (n_78), .S (1'b1), .CLK (clk), .D (n_0), .Q
       (n_61));
  HAX1 g344(.A (out[1]), .B (out[0]), .YC (n_2), .YS (n_3));
  BUFX2 drc_bufs442(.A (n_76), .Y (out[15]));
  BUFX2 drc_bufs443(.A (n_61), .Y (out[0]));
  BUFX2 drc_bufs444(.A (n_62), .Y (out[1]));
  BUFX2 drc_bufs445(.A (n_63), .Y (out[2]));
  BUFX2 drc_bufs446(.A (n_64), .Y (out[3]));
  BUFX2 drc_bufs447(.A (n_65), .Y (out[4]));
  BUFX2 drc_bufs448(.A (n_66), .Y (out[5]));
  BUFX2 drc_bufs449(.A (n_67), .Y (out[6]));
  BUFX2 drc_bufs450(.A (n_68), .Y (out[7]));
  BUFX2 drc_bufs451(.A (n_69), .Y (out[8]));
  BUFX2 drc_bufs452(.A (n_70), .Y (out[9]));
  BUFX2 drc_bufs453(.A (n_71), .Y (out[10]));
  BUFX2 drc_bufs454(.A (n_72), .Y (out[11]));
  BUFX2 drc_bufs455(.A (n_73), .Y (out[12]));
  BUFX2 drc_bufs456(.A (n_74), .Y (out[13]));
  BUFX2 drc_bufs457(.A (n_75), .Y (out[14]));
  XOR2X1 g2(.A (en), .B (out[0]), .Y (n_0));
  XOR2X1 g474(.A (n_98), .B (out[15]), .Y (n_99));
  AND2X1 g3(.A (en), .B (n_54), .Y (n_98));
endmodule

module dsc_mul(a, b, z, clk, rst, en, ov);
  input [7:0] a, b;
  input clk, rst, en;
  output [15:0] z;
  output ov;
  wire [7:0] a, b;
  wire clk, rst, en;
  wire [15:0] z;
  wire ov;
  wire ctr_ov_a, dummy_ov, sn_out_a, sn_out_b, sn_out_mul;
  det_stoch_mul mul(.a (sn_out_a), .b (sn_out_b), .y (sn_out_mul));
  prg_8b prg_a(.clk (clk), .rst (rst), .en (en), .bin_in (a), .sn_out
       (sn_out_a), .ctr_overflow (ctr_ov_a));
  prg_8b_1 prg_b(.clk (ctr_ov_a), .rst (rst), .en (en), .bin_in (b),
       .sn_out (sn_out_b), .ctr_overflow (ov));
  counter_WIDTH16 stoch2bin_out(.out (z), .clk (clk), .en (sn_out_mul),
       .rst (rst), .overflow (dummy_ov));
endmodule

