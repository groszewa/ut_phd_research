
// Generated by Cadence Encounter(R) RTL Compiler RC14.28 - v14.20-s067_1

// Verification Directory fv/dsc_serial_mul 

module counter_WIDTH8_STRIDE1(clk, en, rst, overflow, countval);
  input clk, en, rst;
  output overflow;
  output [7:0] countval;
  wire clk, en, rst;
  wire overflow;
  wire [7:0] countval;
  wire n_0, n_11, n_12, n_13, n_14, n_15, n_16, n_17;
  wire n_18, n_19, n_20, n_21, n_22, n_23, n_24, n_25;
  wire n_26, n_27, n_28, n_29, n_30, n_31, n_32, n_33;
  wire n_34, n_35, n_36, n_37, n_38, n_39, n_40, n_41;
  wire n_44, n_45, n_46, n_47, n_48, n_49, n_50, n_51;
  DFFSR \countval_reg[7] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_41),
       .Q (n_44));
  DFFSR overflow_reg(.R (n_11), .S (1'b1), .CLK (clk), .D (n_39), .Q
       (overflow));
  INVX1 g142(.A (n_40), .Y (n_41));
  MUX2X1 g143(.A (n_37), .B (countval[7]), .S (en), .Y (n_40));
  INVX1 g144(.A (n_38), .Y (n_39));
  MUX2X1 g145(.A (n_36), .B (overflow), .S (en), .Y (n_38));
  DFFSR \countval_reg[6] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_35),
       .Q (n_45));
  HAX1 g147(.A (countval[7]), .B (n_32), .YC (n_36), .YS (n_37));
  INVX1 g148(.A (n_34), .Y (n_35));
  MUX2X1 g149(.A (n_33), .B (countval[6]), .S (en), .Y (n_34));
  DFFSR \countval_reg[5] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_31),
       .Q (n_46));
  HAX1 g151(.A (countval[6]), .B (n_28), .YC (n_32), .YS (n_33));
  INVX1 g152(.A (n_30), .Y (n_31));
  MUX2X1 g153(.A (n_29), .B (countval[5]), .S (en), .Y (n_30));
  DFFSR \countval_reg[4] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_27),
       .Q (n_47));
  HAX1 g155(.A (countval[5]), .B (n_24), .YC (n_28), .YS (n_29));
  INVX1 g156(.A (n_26), .Y (n_27));
  MUX2X1 g157(.A (n_25), .B (countval[4]), .S (en), .Y (n_26));
  DFFSR \countval_reg[3] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_23),
       .Q (n_48));
  HAX1 g159(.A (countval[4]), .B (n_20), .YC (n_24), .YS (n_25));
  INVX1 g160(.A (n_22), .Y (n_23));
  MUX2X1 g161(.A (n_21), .B (countval[3]), .S (en), .Y (n_22));
  DFFSR \countval_reg[2] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_19),
       .Q (n_49));
  HAX1 g163(.A (countval[3]), .B (n_16), .YC (n_20), .YS (n_21));
  INVX1 g164(.A (n_18), .Y (n_19));
  MUX2X1 g165(.A (n_17), .B (countval[2]), .S (en), .Y (n_18));
  DFFSR \countval_reg[1] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_15),
       .Q (n_50));
  HAX1 g167(.A (countval[2]), .B (n_12), .YC (n_16), .YS (n_17));
  INVX1 g168(.A (n_14), .Y (n_15));
  MUX2X1 g169(.A (n_13), .B (countval[1]), .S (en), .Y (n_14));
  DFFSR \countval_reg[0] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_0),
       .Q (n_51));
  HAX1 g171(.A (countval[1]), .B (countval[0]), .YC (n_12), .YS (n_13));
  INVX1 g189(.A (rst), .Y (n_11));
  BUFX2 drc_bufs226(.A (n_51), .Y (countval[0]));
  BUFX2 drc_bufs228(.A (n_44), .Y (countval[7]));
  BUFX2 drc_bufs229(.A (n_45), .Y (countval[6]));
  BUFX2 drc_bufs230(.A (n_46), .Y (countval[5]));
  BUFX2 drc_bufs231(.A (n_47), .Y (countval[4]));
  BUFX2 drc_bufs232(.A (n_48), .Y (countval[3]));
  BUFX2 drc_bufs233(.A (n_49), .Y (countval[2]));
  BUFX2 drc_bufs234(.A (n_50), .Y (countval[1]));
  XOR2X1 g2(.A (en), .B (countval[0]), .Y (n_0));
endmodule

module sng_dsc_WIDTH8_STRIDE1(clk, rst, en, bin_in, sn_out,
     ctr_overflow);
  input clk, rst, en;
  input [7:0] bin_in;
  output sn_out, ctr_overflow;
  wire clk, rst, en;
  wire [7:0] bin_in;
  wire sn_out, ctr_overflow;
  wire [7:0] ctr_out;
  wire n_0, n_1, n_2, n_3, n_4, n_5, n_6, n_7;
  wire n_8, n_9, n_10, n_11, n_12, n_13, n_14, n_15;
  wire n_16, n_17, n_18, n_19, n_20, n_21, n_22, n_23;
  wire n_24, n_25, n_26, n_27, n_28, n_29, n_30, n_31;
  counter_WIDTH8_STRIDE1 ctr(.clk (clk), .en (en), .rst (rst),
       .overflow (ctr_overflow), .countval (ctr_out));
  OAI21X1 g379(.A (n_12), .B (ctr_out[7]), .C (n_31), .Y (sn_out));
  INVX1 g380(.A (n_1), .Y (n_31));
  AOI22X1 g381(.A (n_29), .B (n_4), .C (n_12), .D (ctr_out[7]), .Y
       (n_30));
  OAI21X1 g382(.A (bin_in[6]), .B (n_9), .C (n_28), .Y (n_29));
  OAI21X1 g383(.A (n_11), .B (ctr_out[5]), .C (n_27), .Y (n_28));
  INVX1 g384(.A (n_2), .Y (n_27));
  AOI22X1 g385(.A (n_25), .B (n_3), .C (n_11), .D (ctr_out[5]), .Y
       (n_26));
  OAI21X1 g386(.A (bin_in[4]), .B (n_13), .C (n_24), .Y (n_25));
  OAI21X1 g387(.A (n_8), .B (ctr_out[3]), .C (n_23), .Y (n_24));
  INVX1 g388(.A (n_0), .Y (n_23));
  AOI22X1 g389(.A (n_21), .B (n_5), .C (n_8), .D (ctr_out[3]), .Y
       (n_22));
  OAI21X1 g390(.A (bin_in[2]), .B (n_10), .C (n_20), .Y (n_21));
  OAI21X1 g391(.A (n_7), .B (ctr_out[1]), .C (n_19), .Y (n_20));
  OAI21X1 g392(.A (bin_in[1]), .B (n_14), .C (n_15), .Y (n_19));
  NAND2X1 g393(.A (bin_in[2]), .B (n_10), .Y (n_18));
  NAND2X1 g394(.A (bin_in[6]), .B (n_9), .Y (n_17));
  NAND2X1 g395(.A (bin_in[4]), .B (n_13), .Y (n_16));
  AND2X1 g396(.A (n_6), .B (bin_in[0]), .Y (n_15));
  INVX1 g397(.A (ctr_out[1]), .Y (n_14));
  INVX1 g398(.A (ctr_out[4]), .Y (n_13));
  INVX1 g399(.A (bin_in[7]), .Y (n_12));
  INVX1 g400(.A (bin_in[5]), .Y (n_11));
  INVX1 g401(.A (ctr_out[2]), .Y (n_10));
  INVX1 g402(.A (ctr_out[6]), .Y (n_9));
  INVX1 g403(.A (bin_in[3]), .Y (n_8));
  INVX1 g404(.A (bin_in[1]), .Y (n_7));
  INVX1 g405(.A (ctr_out[0]), .Y (n_6));
  BUFX2 drc_bufs(.A (n_18), .Y (n_5));
  BUFX2 drc_bufs406(.A (n_17), .Y (n_4));
  BUFX2 drc_bufs407(.A (n_16), .Y (n_3));
  BUFX2 drc_bufs408(.A (n_26), .Y (n_2));
  BUFX2 drc_bufs409(.A (n_30), .Y (n_1));
  BUFX2 drc_bufs410(.A (n_22), .Y (n_0));
endmodule

module counter_WIDTH8_STRIDE1_1(clk, en, rst, overflow, countval);
  input clk, en, rst;
  output overflow;
  output [7:0] countval;
  wire clk, en, rst;
  wire overflow;
  wire [7:0] countval;
  wire n_0, n_11, n_12, n_13, n_14, n_15, n_16, n_17;
  wire n_18, n_19, n_20, n_21, n_22, n_23, n_24, n_25;
  wire n_26, n_27, n_28, n_29, n_30, n_31, n_32, n_33;
  wire n_34, n_35, n_36, n_37, n_38, n_39, n_40, n_41;
  wire n_44, n_45, n_46, n_47, n_48, n_49, n_50, n_51;
  DFFSR \countval_reg[7] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_41),
       .Q (n_44));
  DFFSR overflow_reg(.R (n_11), .S (1'b1), .CLK (clk), .D (n_39), .Q
       (overflow));
  INVX1 g218(.A (n_40), .Y (n_41));
  MUX2X1 g219(.A (n_37), .B (countval[7]), .S (en), .Y (n_40));
  INVX1 g220(.A (n_38), .Y (n_39));
  MUX2X1 g221(.A (n_36), .B (overflow), .S (en), .Y (n_38));
  DFFSR \countval_reg[6] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_35),
       .Q (n_45));
  HAX1 g223(.A (countval[7]), .B (n_32), .YC (n_36), .YS (n_37));
  INVX1 g224(.A (n_34), .Y (n_35));
  MUX2X1 g225(.A (n_33), .B (countval[6]), .S (en), .Y (n_34));
  DFFSR \countval_reg[5] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_31),
       .Q (n_46));
  HAX1 g227(.A (countval[6]), .B (n_28), .YC (n_32), .YS (n_33));
  INVX1 g228(.A (n_30), .Y (n_31));
  MUX2X1 g229(.A (n_29), .B (countval[5]), .S (en), .Y (n_30));
  DFFSR \countval_reg[4] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_27),
       .Q (n_47));
  HAX1 g231(.A (countval[5]), .B (n_24), .YC (n_28), .YS (n_29));
  INVX1 g232(.A (n_26), .Y (n_27));
  MUX2X1 g233(.A (n_25), .B (countval[4]), .S (en), .Y (n_26));
  DFFSR \countval_reg[3] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_23),
       .Q (n_48));
  HAX1 g235(.A (countval[4]), .B (n_20), .YC (n_24), .YS (n_25));
  INVX1 g236(.A (n_22), .Y (n_23));
  MUX2X1 g237(.A (n_21), .B (countval[3]), .S (en), .Y (n_22));
  DFFSR \countval_reg[2] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_19),
       .Q (n_49));
  HAX1 g239(.A (countval[3]), .B (n_16), .YC (n_20), .YS (n_21));
  INVX1 g240(.A (n_18), .Y (n_19));
  MUX2X1 g241(.A (n_17), .B (countval[2]), .S (en), .Y (n_18));
  DFFSR \countval_reg[1] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_15),
       .Q (n_50));
  HAX1 g243(.A (countval[2]), .B (n_12), .YC (n_16), .YS (n_17));
  INVX1 g244(.A (n_14), .Y (n_15));
  MUX2X1 g245(.A (n_13), .B (countval[1]), .S (en), .Y (n_14));
  DFFSR \countval_reg[0] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_0),
       .Q (n_51));
  HAX1 g247(.A (countval[1]), .B (countval[0]), .YC (n_12), .YS (n_13));
  INVX1 g265(.A (rst), .Y (n_11));
  BUFX2 drc_bufs302(.A (n_51), .Y (countval[0]));
  BUFX2 drc_bufs304(.A (n_44), .Y (countval[7]));
  BUFX2 drc_bufs305(.A (n_45), .Y (countval[6]));
  BUFX2 drc_bufs306(.A (n_46), .Y (countval[5]));
  BUFX2 drc_bufs307(.A (n_47), .Y (countval[4]));
  BUFX2 drc_bufs308(.A (n_48), .Y (countval[3]));
  BUFX2 drc_bufs309(.A (n_49), .Y (countval[2]));
  BUFX2 drc_bufs310(.A (n_50), .Y (countval[1]));
  XOR2X1 g2(.A (en), .B (countval[0]), .Y (n_0));
endmodule

module sng_dsc_WIDTH8_STRIDE1_1(clk, rst, en, bin_in, sn_out,
     ctr_overflow);
  input clk, rst, en;
  input [7:0] bin_in;
  output sn_out, ctr_overflow;
  wire clk, rst, en;
  wire [7:0] bin_in;
  wire sn_out, ctr_overflow;
  wire [7:0] ctr_out;
  wire n_0, n_1, n_2, n_3, n_4, n_5, n_6, n_7;
  wire n_8, n_9, n_10, n_11, n_12, n_13, n_14, n_15;
  wire n_16, n_17, n_18, n_19, n_20, n_21, n_22, n_23;
  wire n_24, n_25, n_26, n_27, n_28, n_29, n_30, n_31;
  counter_WIDTH8_STRIDE1_1 ctr(.clk (clk), .en (en), .rst (rst),
       .overflow (ctr_overflow), .countval (ctr_out));
  OAI21X1 g379(.A (n_12), .B (ctr_out[7]), .C (n_31), .Y (sn_out));
  INVX1 g380(.A (n_1), .Y (n_31));
  AOI22X1 g381(.A (n_29), .B (n_4), .C (n_12), .D (ctr_out[7]), .Y
       (n_30));
  OAI21X1 g382(.A (bin_in[6]), .B (n_9), .C (n_28), .Y (n_29));
  OAI21X1 g383(.A (n_11), .B (ctr_out[5]), .C (n_27), .Y (n_28));
  INVX1 g384(.A (n_2), .Y (n_27));
  AOI22X1 g385(.A (n_25), .B (n_3), .C (n_11), .D (ctr_out[5]), .Y
       (n_26));
  OAI21X1 g386(.A (bin_in[4]), .B (n_13), .C (n_24), .Y (n_25));
  OAI21X1 g387(.A (n_8), .B (ctr_out[3]), .C (n_23), .Y (n_24));
  INVX1 g388(.A (n_0), .Y (n_23));
  AOI22X1 g389(.A (n_21), .B (n_5), .C (n_8), .D (ctr_out[3]), .Y
       (n_22));
  OAI21X1 g390(.A (bin_in[2]), .B (n_10), .C (n_20), .Y (n_21));
  OAI21X1 g391(.A (n_7), .B (ctr_out[1]), .C (n_19), .Y (n_20));
  OAI21X1 g392(.A (bin_in[1]), .B (n_14), .C (n_15), .Y (n_19));
  NAND2X1 g393(.A (bin_in[2]), .B (n_10), .Y (n_18));
  NAND2X1 g394(.A (bin_in[6]), .B (n_9), .Y (n_17));
  NAND2X1 g395(.A (bin_in[4]), .B (n_13), .Y (n_16));
  AND2X1 g396(.A (n_6), .B (bin_in[0]), .Y (n_15));
  INVX1 g397(.A (ctr_out[1]), .Y (n_14));
  INVX1 g398(.A (ctr_out[4]), .Y (n_13));
  INVX1 g399(.A (bin_in[7]), .Y (n_12));
  INVX1 g400(.A (bin_in[5]), .Y (n_11));
  INVX1 g401(.A (ctr_out[2]), .Y (n_10));
  INVX1 g402(.A (ctr_out[6]), .Y (n_9));
  INVX1 g403(.A (bin_in[3]), .Y (n_8));
  INVX1 g404(.A (bin_in[1]), .Y (n_7));
  INVX1 g405(.A (ctr_out[0]), .Y (n_6));
  BUFX2 drc_bufs(.A (n_18), .Y (n_5));
  BUFX2 drc_bufs406(.A (n_17), .Y (n_4));
  BUFX2 drc_bufs407(.A (n_16), .Y (n_3));
  BUFX2 drc_bufs408(.A (n_26), .Y (n_2));
  BUFX2 drc_bufs409(.A (n_30), .Y (n_1));
  BUFX2 drc_bufs410(.A (n_22), .Y (n_0));
endmodule

module counter_WIDTH8_STRIDE1_2(clk, en, rst, overflow, countval);
  input clk, en, rst;
  output overflow;
  output [7:0] countval;
  wire clk, en, rst;
  wire overflow;
  wire [7:0] countval;
  wire n_0, n_11, n_12, n_13, n_14, n_15, n_16, n_17;
  wire n_18, n_19, n_20, n_21, n_22, n_23, n_24, n_25;
  wire n_26, n_27, n_28, n_29, n_30, n_31, n_32, n_33;
  wire n_34, n_35, n_36, n_37, n_38, n_39, n_40, n_41;
  wire n_44, n_45, n_46, n_47, n_48, n_49, n_50, n_51;
  DFFSR \countval_reg[7] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_41),
       .Q (n_44));
  DFFSR overflow_reg(.R (n_11), .S (1'b1), .CLK (clk), .D (n_39), .Q
       (overflow));
  INVX1 g218(.A (n_40), .Y (n_41));
  MUX2X1 g219(.A (n_37), .B (countval[7]), .S (en), .Y (n_40));
  INVX1 g220(.A (n_38), .Y (n_39));
  MUX2X1 g221(.A (n_36), .B (overflow), .S (en), .Y (n_38));
  DFFSR \countval_reg[6] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_35),
       .Q (n_45));
  HAX1 g223(.A (countval[7]), .B (n_32), .YC (n_36), .YS (n_37));
  INVX1 g224(.A (n_34), .Y (n_35));
  MUX2X1 g225(.A (n_33), .B (countval[6]), .S (en), .Y (n_34));
  DFFSR \countval_reg[5] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_31),
       .Q (n_46));
  HAX1 g227(.A (countval[6]), .B (n_28), .YC (n_32), .YS (n_33));
  INVX1 g228(.A (n_30), .Y (n_31));
  MUX2X1 g229(.A (n_29), .B (countval[5]), .S (en), .Y (n_30));
  DFFSR \countval_reg[4] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_27),
       .Q (n_47));
  HAX1 g231(.A (countval[5]), .B (n_24), .YC (n_28), .YS (n_29));
  INVX1 g232(.A (n_26), .Y (n_27));
  MUX2X1 g233(.A (n_25), .B (countval[4]), .S (en), .Y (n_26));
  DFFSR \countval_reg[3] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_23),
       .Q (n_48));
  HAX1 g235(.A (countval[4]), .B (n_20), .YC (n_24), .YS (n_25));
  INVX1 g236(.A (n_22), .Y (n_23));
  MUX2X1 g237(.A (n_21), .B (countval[3]), .S (en), .Y (n_22));
  DFFSR \countval_reg[2] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_19),
       .Q (n_49));
  HAX1 g239(.A (countval[3]), .B (n_16), .YC (n_20), .YS (n_21));
  INVX1 g240(.A (n_18), .Y (n_19));
  MUX2X1 g241(.A (n_17), .B (countval[2]), .S (en), .Y (n_18));
  DFFSR \countval_reg[1] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_15),
       .Q (n_50));
  HAX1 g243(.A (countval[2]), .B (n_12), .YC (n_16), .YS (n_17));
  INVX1 g244(.A (n_14), .Y (n_15));
  MUX2X1 g245(.A (n_13), .B (countval[1]), .S (en), .Y (n_14));
  DFFSR \countval_reg[0] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_0),
       .Q (n_51));
  HAX1 g247(.A (countval[1]), .B (countval[0]), .YC (n_12), .YS (n_13));
  INVX1 g265(.A (rst), .Y (n_11));
  BUFX2 drc_bufs302(.A (n_51), .Y (countval[0]));
  BUFX2 drc_bufs304(.A (n_44), .Y (countval[7]));
  BUFX2 drc_bufs305(.A (n_45), .Y (countval[6]));
  BUFX2 drc_bufs306(.A (n_46), .Y (countval[5]));
  BUFX2 drc_bufs307(.A (n_47), .Y (countval[4]));
  BUFX2 drc_bufs308(.A (n_48), .Y (countval[3]));
  BUFX2 drc_bufs309(.A (n_49), .Y (countval[2]));
  BUFX2 drc_bufs310(.A (n_50), .Y (countval[1]));
  XOR2X1 g2(.A (en), .B (countval[0]), .Y (n_0));
endmodule

module sng_dsc_WIDTH8_STRIDE1_2(clk, rst, en, bin_in, sn_out,
     ctr_overflow);
  input clk, rst, en;
  input [7:0] bin_in;
  output sn_out, ctr_overflow;
  wire clk, rst, en;
  wire [7:0] bin_in;
  wire sn_out, ctr_overflow;
  wire [7:0] ctr_out;
  wire n_0, n_1, n_2, n_3, n_4, n_5, n_6, n_7;
  wire n_8, n_9, n_10, n_11, n_12, n_13, n_14, n_15;
  wire n_16, n_17, n_18, n_19, n_20, n_21, n_22, n_23;
  wire n_24, n_25, n_26, n_27, n_28, n_29, n_30, n_31;
  counter_WIDTH8_STRIDE1_2 ctr(.clk (clk), .en (en), .rst (rst),
       .overflow (ctr_overflow), .countval (ctr_out));
  OAI21X1 g379(.A (n_12), .B (ctr_out[7]), .C (n_31), .Y (sn_out));
  INVX1 g380(.A (n_1), .Y (n_31));
  AOI22X1 g381(.A (n_29), .B (n_4), .C (n_12), .D (ctr_out[7]), .Y
       (n_30));
  OAI21X1 g382(.A (bin_in[6]), .B (n_9), .C (n_28), .Y (n_29));
  OAI21X1 g383(.A (n_11), .B (ctr_out[5]), .C (n_27), .Y (n_28));
  INVX1 g384(.A (n_2), .Y (n_27));
  AOI22X1 g385(.A (n_25), .B (n_3), .C (n_11), .D (ctr_out[5]), .Y
       (n_26));
  OAI21X1 g386(.A (bin_in[4]), .B (n_13), .C (n_24), .Y (n_25));
  OAI21X1 g387(.A (n_8), .B (ctr_out[3]), .C (n_23), .Y (n_24));
  INVX1 g388(.A (n_0), .Y (n_23));
  AOI22X1 g389(.A (n_21), .B (n_5), .C (n_8), .D (ctr_out[3]), .Y
       (n_22));
  OAI21X1 g390(.A (bin_in[2]), .B (n_10), .C (n_20), .Y (n_21));
  OAI21X1 g391(.A (n_7), .B (ctr_out[1]), .C (n_19), .Y (n_20));
  OAI21X1 g392(.A (bin_in[1]), .B (n_14), .C (n_15), .Y (n_19));
  NAND2X1 g393(.A (bin_in[2]), .B (n_10), .Y (n_18));
  NAND2X1 g394(.A (bin_in[6]), .B (n_9), .Y (n_17));
  NAND2X1 g395(.A (bin_in[4]), .B (n_13), .Y (n_16));
  AND2X1 g396(.A (n_6), .B (bin_in[0]), .Y (n_15));
  INVX1 g397(.A (ctr_out[1]), .Y (n_14));
  INVX1 g398(.A (ctr_out[4]), .Y (n_13));
  INVX1 g399(.A (bin_in[7]), .Y (n_12));
  INVX1 g400(.A (bin_in[5]), .Y (n_11));
  INVX1 g401(.A (ctr_out[2]), .Y (n_10));
  INVX1 g402(.A (ctr_out[6]), .Y (n_9));
  INVX1 g403(.A (bin_in[3]), .Y (n_8));
  INVX1 g404(.A (bin_in[1]), .Y (n_7));
  INVX1 g405(.A (ctr_out[0]), .Y (n_6));
  BUFX2 drc_bufs(.A (n_18), .Y (n_5));
  BUFX2 drc_bufs406(.A (n_17), .Y (n_4));
  BUFX2 drc_bufs407(.A (n_16), .Y (n_3));
  BUFX2 drc_bufs408(.A (n_26), .Y (n_2));
  BUFX2 drc_bufs409(.A (n_30), .Y (n_1));
  BUFX2 drc_bufs410(.A (n_22), .Y (n_0));
endmodule

module counter_WIDTH8_STRIDE1_3(clk, en, rst, overflow, countval);
  input clk, en, rst;
  output overflow;
  output [7:0] countval;
  wire clk, en, rst;
  wire overflow;
  wire [7:0] countval;
  wire n_0, n_11, n_12, n_13, n_14, n_15, n_16, n_17;
  wire n_18, n_19, n_20, n_21, n_22, n_23, n_24, n_25;
  wire n_26, n_27, n_28, n_29, n_30, n_31, n_32, n_33;
  wire n_34, n_35, n_36, n_37, n_38, n_39, n_40, n_41;
  wire n_42, n_44, n_45, n_46, n_47, n_48, n_49, n_50;
  wire n_51;
  DFFSR \countval_reg[7] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_41),
       .Q (n_44));
  DFFSR overflow_reg(.R (n_11), .S (1'b1), .CLK (clk), .D (n_39), .Q
       (n_42));
  INVX1 g142(.A (n_40), .Y (n_41));
  MUX2X1 g143(.A (n_37), .B (countval[7]), .S (en), .Y (n_40));
  INVX1 g144(.A (n_38), .Y (n_39));
  MUX2X1 g145(.A (n_36), .B (overflow), .S (en), .Y (n_38));
  DFFSR \countval_reg[6] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_35),
       .Q (n_45));
  HAX1 g147(.A (countval[7]), .B (n_32), .YC (n_36), .YS (n_37));
  INVX1 g148(.A (n_34), .Y (n_35));
  MUX2X1 g149(.A (n_33), .B (countval[6]), .S (en), .Y (n_34));
  DFFSR \countval_reg[5] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_31),
       .Q (n_46));
  HAX1 g151(.A (countval[6]), .B (n_28), .YC (n_32), .YS (n_33));
  INVX1 g152(.A (n_30), .Y (n_31));
  MUX2X1 g153(.A (n_29), .B (countval[5]), .S (en), .Y (n_30));
  DFFSR \countval_reg[4] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_27),
       .Q (n_47));
  HAX1 g155(.A (countval[5]), .B (n_24), .YC (n_28), .YS (n_29));
  INVX1 g156(.A (n_26), .Y (n_27));
  MUX2X1 g157(.A (n_25), .B (countval[4]), .S (en), .Y (n_26));
  DFFSR \countval_reg[3] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_23),
       .Q (n_48));
  HAX1 g159(.A (countval[4]), .B (n_20), .YC (n_24), .YS (n_25));
  INVX1 g160(.A (n_22), .Y (n_23));
  MUX2X1 g161(.A (n_21), .B (countval[3]), .S (en), .Y (n_22));
  DFFSR \countval_reg[2] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_19),
       .Q (n_49));
  HAX1 g163(.A (countval[3]), .B (n_16), .YC (n_20), .YS (n_21));
  INVX1 g164(.A (n_18), .Y (n_19));
  MUX2X1 g165(.A (n_17), .B (countval[2]), .S (en), .Y (n_18));
  DFFSR \countval_reg[1] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_15),
       .Q (n_50));
  HAX1 g167(.A (countval[2]), .B (n_12), .YC (n_16), .YS (n_17));
  INVX1 g168(.A (n_14), .Y (n_15));
  MUX2X1 g169(.A (n_13), .B (countval[1]), .S (en), .Y (n_14));
  DFFSR \countval_reg[0] (.R (n_11), .S (1'b1), .CLK (clk), .D (n_0),
       .Q (n_51));
  HAX1 g171(.A (countval[1]), .B (countval[0]), .YC (n_12), .YS (n_13));
  INVX1 g173(.A (rst), .Y (n_11));
  BUFX2 drc_bufs210(.A (n_51), .Y (countval[0]));
  BUFX2 drc_bufs211(.A (n_42), .Y (overflow));
  BUFX2 drc_bufs212(.A (n_44), .Y (countval[7]));
  BUFX2 drc_bufs213(.A (n_45), .Y (countval[6]));
  BUFX2 drc_bufs214(.A (n_46), .Y (countval[5]));
  BUFX2 drc_bufs215(.A (n_47), .Y (countval[4]));
  BUFX2 drc_bufs216(.A (n_48), .Y (countval[3]));
  BUFX2 drc_bufs217(.A (n_49), .Y (countval[2]));
  BUFX2 drc_bufs218(.A (n_50), .Y (countval[1]));
  XOR2X1 g2(.A (en), .B (countval[0]), .Y (n_0));
endmodule

module sng_dsc_WIDTH8_STRIDE1_3(clk, rst, en, bin_in, sn_out,
     ctr_overflow);
  input clk, rst, en;
  input [7:0] bin_in;
  output sn_out, ctr_overflow;
  wire clk, rst, en;
  wire [7:0] bin_in;
  wire sn_out, ctr_overflow;
  wire [7:0] ctr_out;
  wire n_0, n_1, n_2, n_3, n_4, n_5, n_6, n_7;
  wire n_8, n_9, n_10, n_11, n_12, n_13, n_14, n_15;
  wire n_16, n_17, n_18, n_19, n_20, n_21, n_22, n_23;
  wire n_24, n_25, n_26, n_27, n_28, n_29, n_30, n_31;
  counter_WIDTH8_STRIDE1_3 ctr(.clk (clk), .en (en), .rst (rst),
       .overflow (ctr_overflow), .countval (ctr_out));
  OAI21X1 g380(.A (ctr_out[7]), .B (n_12), .C (n_31), .Y (sn_out));
  INVX1 g381(.A (n_1), .Y (n_31));
  AOI22X1 g382(.A (n_29), .B (n_4), .C (ctr_out[7]), .D (n_12), .Y
       (n_30));
  OAI21X1 g383(.A (bin_in[6]), .B (n_9), .C (n_28), .Y (n_29));
  OAI21X1 g384(.A (ctr_out[5]), .B (n_11), .C (n_27), .Y (n_28));
  INVX1 g385(.A (n_2), .Y (n_27));
  AOI22X1 g386(.A (n_25), .B (n_3), .C (ctr_out[5]), .D (n_11), .Y
       (n_26));
  OAI21X1 g387(.A (bin_in[4]), .B (n_13), .C (n_24), .Y (n_25));
  OAI21X1 g388(.A (ctr_out[3]), .B (n_8), .C (n_23), .Y (n_24));
  INVX1 g389(.A (n_0), .Y (n_23));
  AOI22X1 g390(.A (n_21), .B (n_5), .C (ctr_out[3]), .D (n_8), .Y
       (n_22));
  OAI21X1 g391(.A (bin_in[2]), .B (n_10), .C (n_20), .Y (n_21));
  OAI21X1 g392(.A (ctr_out[1]), .B (n_7), .C (n_19), .Y (n_20));
  OAI21X1 g393(.A (bin_in[1]), .B (n_14), .C (n_15), .Y (n_19));
  NAND2X1 g394(.A (bin_in[2]), .B (n_10), .Y (n_18));
  NAND2X1 g395(.A (bin_in[6]), .B (n_9), .Y (n_17));
  NAND2X1 g396(.A (bin_in[4]), .B (n_13), .Y (n_16));
  AND2X1 g397(.A (n_6), .B (bin_in[0]), .Y (n_15));
  INVX1 g398(.A (ctr_out[1]), .Y (n_14));
  INVX1 g399(.A (ctr_out[4]), .Y (n_13));
  INVX1 g400(.A (bin_in[7]), .Y (n_12));
  INVX1 g401(.A (bin_in[5]), .Y (n_11));
  INVX1 g402(.A (ctr_out[2]), .Y (n_10));
  INVX1 g403(.A (ctr_out[6]), .Y (n_9));
  INVX1 g404(.A (bin_in[3]), .Y (n_8));
  INVX1 g405(.A (bin_in[1]), .Y (n_7));
  INVX1 g406(.A (ctr_out[0]), .Y (n_6));
  BUFX2 drc_bufs(.A (n_18), .Y (n_5));
  BUFX2 drc_bufs407(.A (n_17), .Y (n_4));
  BUFX2 drc_bufs408(.A (n_16), .Y (n_3));
  BUFX2 drc_bufs409(.A (n_26), .Y (n_2));
  BUFX2 drc_bufs410(.A (n_30), .Y (n_1));
  BUFX2 drc_bufs411(.A (n_22), .Y (n_0));
endmodule

module increment_unsigned(A, CI, Z);
  input [31:0] A;
  input CI;
  output [31:0] Z;
  wire [31:0] A;
  wire CI;
  wire [31:0] Z;
  wire n_1, n_3, n_5, n_7, n_9, n_11, n_13, n_15;
  wire n_17, n_19, n_21, n_23, n_25, n_27, n_29, n_31;
  wire n_33, n_35, n_37, n_39, n_41, n_43, n_45, n_47;
  wire n_49, n_51, n_53, n_55, n_57, n_59;
  XOR2X1 g217(.A (n_59), .B (A[31]), .Y (Z[31]));
  HAX1 g218(.A (A[30]), .B (n_57), .YC (n_59), .YS (Z[30]));
  HAX1 g219(.A (A[29]), .B (n_55), .YC (n_57), .YS (Z[29]));
  HAX1 g220(.A (A[28]), .B (n_53), .YC (n_55), .YS (Z[28]));
  HAX1 g221(.A (A[27]), .B (n_51), .YC (n_53), .YS (Z[27]));
  HAX1 g222(.A (A[26]), .B (n_49), .YC (n_51), .YS (Z[26]));
  HAX1 g223(.A (A[25]), .B (n_47), .YC (n_49), .YS (Z[25]));
  HAX1 g224(.A (A[24]), .B (n_45), .YC (n_47), .YS (Z[24]));
  HAX1 g225(.A (A[23]), .B (n_43), .YC (n_45), .YS (Z[23]));
  HAX1 g226(.A (A[22]), .B (n_41), .YC (n_43), .YS (Z[22]));
  HAX1 g227(.A (A[21]), .B (n_39), .YC (n_41), .YS (Z[21]));
  HAX1 g228(.A (A[20]), .B (n_37), .YC (n_39), .YS (Z[20]));
  HAX1 g229(.A (A[19]), .B (n_35), .YC (n_37), .YS (Z[19]));
  HAX1 g230(.A (A[18]), .B (n_33), .YC (n_35), .YS (Z[18]));
  HAX1 g231(.A (A[17]), .B (n_31), .YC (n_33), .YS (Z[17]));
  HAX1 g232(.A (A[16]), .B (n_29), .YC (n_31), .YS (Z[16]));
  HAX1 g233(.A (A[15]), .B (n_27), .YC (n_29), .YS (Z[15]));
  HAX1 g234(.A (A[14]), .B (n_25), .YC (n_27), .YS (Z[14]));
  HAX1 g235(.A (A[13]), .B (n_23), .YC (n_25), .YS (Z[13]));
  HAX1 g236(.A (A[12]), .B (n_21), .YC (n_23), .YS (Z[12]));
  HAX1 g237(.A (A[11]), .B (n_19), .YC (n_21), .YS (Z[11]));
  HAX1 g238(.A (A[10]), .B (n_17), .YC (n_19), .YS (Z[10]));
  HAX1 g239(.A (A[9]), .B (n_15), .YC (n_17), .YS (Z[9]));
  HAX1 g240(.A (A[8]), .B (n_13), .YC (n_15), .YS (Z[8]));
  HAX1 g241(.A (A[7]), .B (n_11), .YC (n_13), .YS (Z[7]));
  HAX1 g242(.A (A[6]), .B (n_9), .YC (n_11), .YS (Z[6]));
  HAX1 g243(.A (A[5]), .B (n_7), .YC (n_9), .YS (Z[5]));
  HAX1 g244(.A (A[4]), .B (n_5), .YC (n_7), .YS (Z[4]));
  HAX1 g245(.A (A[3]), .B (n_3), .YC (n_5), .YS (Z[3]));
  HAX1 g246(.A (A[2]), .B (n_1), .YC (n_3), .YS (Z[2]));
  HAX1 g247(.A (A[0]), .B (A[1]), .YC (n_1), .YS (Z[1]));
endmodule

module counter_WIDTH32_STRIDE1(clk, en, rst, overflow, countval);
  input clk, en, rst;
  output overflow;
  output [31:0] countval;
  wire clk, en, rst;
  wire overflow;
  wire [31:0] countval;
  wire UNCONNECTED, n_0, n_2, n_3, n_4, n_5, n_6, n_7;
  wire n_8, n_9, n_10, n_11, n_12, n_13, n_14, n_15;
  wire n_16, n_17, n_18, n_19, n_20, n_21, n_22, n_23;
  wire n_24, n_25, n_26, n_27, n_28, n_29, n_30, n_31;
  wire n_32, n_33, n_34, n_35, n_36, n_37, n_38, n_39;
  wire n_40, n_41, n_42, n_43, n_44, n_45, n_46, n_47;
  wire n_48, n_49, n_50, n_51, n_52, n_53, n_54, n_55;
  wire n_56, n_57, n_58, n_59, n_60, n_61, n_62, n_63;
  wire n_64, n_65, n_66, n_67, n_68, n_69, n_70, n_71;
  wire n_72, n_73, n_74, n_75, n_76, n_77, n_78, n_79;
  wire n_80, n_81, n_82, n_83, n_84, n_85, n_86, n_87;
  wire n_88, n_89, n_90, n_91, n_92, n_93, n_94, n_95;
  wire n_98, n_99, n_100, n_101, n_102, n_103, n_104, n_105;
  wire n_106, n_107, n_108, n_109, n_110, n_111, n_112, n_113;
  wire n_114, n_115, n_116, n_117, n_118, n_119, n_120, n_121;
  wire n_122, n_123, n_124, n_125, n_126, n_127, n_128, n_164;
  increment_unsigned inc_add_34_25_1(.A (countval), .CI (1'b1), .Z
       ({n_164, n_99, n_100, n_101, n_102, n_103, n_104, n_105, n_106,
       n_107, n_108, n_109, n_110, n_111, n_112, n_113, n_114, n_115,
       n_116, n_117, n_118, n_119, n_120, n_121, n_122, n_123, n_124,
       n_125, n_126, n_127, n_128, UNCONNECTED}));
  INVX1 g54(.A (rst), .Y (n_98));
  DFFSR \countval_reg[10] (.R (n_98), .S (1'b1), .CLK (clk), .D (n_58),
       .Q (n_74));
  DFFSR \countval_reg[11] (.R (n_98), .S (1'b1), .CLK (clk), .D (n_56),
       .Q (n_75));
  DFFSR \countval_reg[23] (.R (n_98), .S (1'b1), .CLK (clk), .D (n_63),
       .Q (n_87));
  DFFSR \countval_reg[24] (.R (n_98), .S (1'b1), .CLK (clk), .D (n_62),
       .Q (n_88));
  DFFSR \countval_reg[25] (.R (n_98), .S (1'b1), .CLK (clk), .D (n_61),
       .Q (n_89));
  DFFSR \countval_reg[26] (.R (n_98), .S (1'b1), .CLK (clk), .D (n_60),
       .Q (n_90));
  DFFSR \countval_reg[27] (.R (n_98), .S (1'b1), .CLK (clk), .D (n_59),
       .Q (n_91));
  DFFSR \countval_reg[28] (.R (n_98), .S (1'b1), .CLK (clk), .D (n_57),
       .Q (n_92));
  DFFSR \countval_reg[29] (.R (n_98), .S (1'b1), .CLK (clk), .D (n_55),
       .Q (n_93));
  DFFSR \countval_reg[2] (.R (n_98), .S (1'b1), .CLK (clk), .D (n_54),
       .Q (n_66));
  DFFSR \countval_reg[12] (.R (n_98), .S (1'b1), .CLK (clk), .D (n_51),
       .Q (n_76));
  DFFSR \countval_reg[13] (.R (n_98), .S (1'b1), .CLK (clk), .D (n_48),
       .Q (n_77));
  DFFSR \countval_reg[30] (.R (n_98), .S (1'b1), .CLK (clk), .D (n_53),
       .Q (n_94));
  DFFSR \countval_reg[31] (.R (n_98), .S (1'b1), .CLK (clk), .D (n_52),
       .Q (n_95));
  DFFSR \countval_reg[3] (.R (n_98), .S (1'b1), .CLK (clk), .D (n_50),
       .Q (n_67));
  DFFSR \countval_reg[4] (.R (n_98), .S (1'b1), .CLK (clk), .D (n_49),
       .Q (n_68));
  DFFSR \countval_reg[14] (.R (n_98), .S (1'b1), .CLK (clk), .D (n_31),
       .Q (n_78));
  DFFSR \countval_reg[5] (.R (n_98), .S (1'b1), .CLK (clk), .D (n_30),
       .Q (n_69));
  DFFSR \countval_reg[6] (.R (n_98), .S (1'b1), .CLK (clk), .D (n_29),
       .Q (n_70));
  DFFSR \countval_reg[15] (.R (n_98), .S (1'b1), .CLK (clk), .D (n_26),
       .Q (n_79));
  DFFSR \countval_reg[7] (.R (n_98), .S (1'b1), .CLK (clk), .D (n_28),
       .Q (n_71));
  DFFSR \countval_reg[8] (.R (n_98), .S (1'b1), .CLK (clk), .D (n_27),
       .Q (n_72));
  DFFSR \countval_reg[16] (.R (n_98), .S (1'b1), .CLK (clk), .D (n_25),
       .Q (n_80));
  DFFSR \countval_reg[17] (.R (n_98), .S (1'b1), .CLK (clk), .D (n_23),
       .Q (n_81));
  DFFSR \countval_reg[9] (.R (n_98), .S (1'b1), .CLK (clk), .D (n_24),
       .Q (n_73));
  DFFSR \countval_reg[18] (.R (n_98), .S (1'b1), .CLK (clk), .D (n_22),
       .Q (n_82));
  DFFSR \countval_reg[19] (.R (n_98), .S (1'b1), .CLK (clk), .D (n_21),
       .Q (n_83));
  DFFSR \countval_reg[1] (.R (n_98), .S (1'b1), .CLK (clk), .D (n_20),
       .Q (n_65));
  DFFSR \countval_reg[20] (.R (n_98), .S (1'b1), .CLK (clk), .D (n_19),
       .Q (n_84));
  DFFSR \countval_reg[21] (.R (n_98), .S (1'b1), .CLK (clk), .D (n_18),
       .Q (n_85));
  DFFSR \countval_reg[22] (.R (n_98), .S (1'b1), .CLK (clk), .D (n_17),
       .Q (n_86));
  DFFSR \countval_reg[0] (.R (n_98), .S (1'b1), .CLK (clk), .D (n_0),
       .Q (n_64));
  INVX1 g86(.A (n_47), .Y (n_63));
  INVX1 g87(.A (n_46), .Y (n_62));
  INVX1 g88(.A (n_45), .Y (n_61));
  INVX1 g89(.A (n_44), .Y (n_60));
  INVX1 g90(.A (n_43), .Y (n_59));
  INVX1 g91(.A (n_42), .Y (n_58));
  INVX1 g92(.A (n_41), .Y (n_57));
  INVX1 g93(.A (n_40), .Y (n_56));
  INVX1 g94(.A (n_39), .Y (n_55));
  INVX1 g95(.A (n_38), .Y (n_54));
  INVX1 g96(.A (n_37), .Y (n_53));
  INVX1 g97(.A (n_36), .Y (n_52));
  INVX1 g98(.A (n_35), .Y (n_51));
  INVX1 g99(.A (n_34), .Y (n_50));
  INVX1 g100(.A (n_33), .Y (n_49));
  INVX1 g101(.A (n_32), .Y (n_48));
  MUX2X1 g102(.A (n_106), .B (countval[23]), .S (en), .Y (n_47));
  MUX2X1 g103(.A (n_105), .B (countval[24]), .S (en), .Y (n_46));
  MUX2X1 g104(.A (n_104), .B (countval[25]), .S (en), .Y (n_45));
  MUX2X1 g105(.A (n_103), .B (countval[26]), .S (en), .Y (n_44));
  MUX2X1 g106(.A (n_102), .B (countval[27]), .S (en), .Y (n_43));
  MUX2X1 g107(.A (n_119), .B (countval[10]), .S (en), .Y (n_42));
  MUX2X1 g108(.A (n_101), .B (countval[28]), .S (en), .Y (n_41));
  MUX2X1 g109(.A (n_118), .B (countval[11]), .S (en), .Y (n_40));
  MUX2X1 g110(.A (n_100), .B (countval[29]), .S (en), .Y (n_39));
  MUX2X1 g111(.A (n_127), .B (countval[2]), .S (en), .Y (n_38));
  MUX2X1 g112(.A (n_99), .B (countval[30]), .S (en), .Y (n_37));
  MUX2X1 g113(.A (n_164), .B (countval[31]), .S (en), .Y (n_36));
  MUX2X1 g114(.A (n_117), .B (countval[12]), .S (en), .Y (n_35));
  MUX2X1 g115(.A (n_126), .B (countval[3]), .S (en), .Y (n_34));
  MUX2X1 g116(.A (n_125), .B (countval[4]), .S (en), .Y (n_33));
  MUX2X1 g117(.A (n_116), .B (countval[13]), .S (en), .Y (n_32));
  INVX1 g118(.A (n_16), .Y (n_31));
  INVX1 g119(.A (n_15), .Y (n_30));
  INVX1 g120(.A (n_14), .Y (n_29));
  INVX1 g121(.A (n_13), .Y (n_28));
  INVX1 g122(.A (n_12), .Y (n_27));
  INVX1 g123(.A (n_11), .Y (n_26));
  INVX1 g124(.A (n_10), .Y (n_25));
  INVX1 g125(.A (n_9), .Y (n_24));
  INVX1 g126(.A (n_8), .Y (n_23));
  INVX1 g127(.A (n_7), .Y (n_22));
  INVX1 g128(.A (n_6), .Y (n_21));
  INVX1 g129(.A (n_5), .Y (n_20));
  INVX1 g130(.A (n_4), .Y (n_19));
  INVX1 g131(.A (n_3), .Y (n_18));
  INVX1 g132(.A (n_2), .Y (n_17));
  MUX2X1 g133(.A (n_115), .B (countval[14]), .S (en), .Y (n_16));
  MUX2X1 g134(.A (n_124), .B (countval[5]), .S (en), .Y (n_15));
  MUX2X1 g135(.A (n_123), .B (countval[6]), .S (en), .Y (n_14));
  MUX2X1 g136(.A (n_122), .B (countval[7]), .S (en), .Y (n_13));
  MUX2X1 g137(.A (n_121), .B (countval[8]), .S (en), .Y (n_12));
  MUX2X1 g138(.A (n_114), .B (countval[15]), .S (en), .Y (n_11));
  MUX2X1 g139(.A (n_113), .B (countval[16]), .S (en), .Y (n_10));
  MUX2X1 g140(.A (n_120), .B (countval[9]), .S (en), .Y (n_9));
  MUX2X1 g141(.A (n_112), .B (countval[17]), .S (en), .Y (n_8));
  MUX2X1 g142(.A (n_111), .B (countval[18]), .S (en), .Y (n_7));
  MUX2X1 g143(.A (n_110), .B (countval[19]), .S (en), .Y (n_6));
  MUX2X1 g144(.A (n_128), .B (countval[1]), .S (en), .Y (n_5));
  MUX2X1 g145(.A (n_109), .B (countval[20]), .S (en), .Y (n_4));
  MUX2X1 g146(.A (n_108), .B (countval[21]), .S (en), .Y (n_3));
  MUX2X1 g147(.A (n_107), .B (countval[22]), .S (en), .Y (n_2));
  BUFX2 drc_bufs278(.A (n_95), .Y (countval[31]));
  BUFX2 drc_bufs279(.A (n_64), .Y (countval[0]));
  BUFX2 drc_bufs280(.A (n_65), .Y (countval[1]));
  BUFX2 drc_bufs281(.A (n_66), .Y (countval[2]));
  BUFX2 drc_bufs282(.A (n_67), .Y (countval[3]));
  BUFX2 drc_bufs283(.A (n_68), .Y (countval[4]));
  BUFX2 drc_bufs284(.A (n_69), .Y (countval[5]));
  BUFX2 drc_bufs285(.A (n_70), .Y (countval[6]));
  BUFX2 drc_bufs286(.A (n_71), .Y (countval[7]));
  BUFX2 drc_bufs287(.A (n_72), .Y (countval[8]));
  BUFX2 drc_bufs288(.A (n_73), .Y (countval[9]));
  BUFX2 drc_bufs289(.A (n_74), .Y (countval[10]));
  BUFX2 drc_bufs290(.A (n_75), .Y (countval[11]));
  BUFX2 drc_bufs291(.A (n_76), .Y (countval[12]));
  BUFX2 drc_bufs292(.A (n_77), .Y (countval[13]));
  BUFX2 drc_bufs293(.A (n_78), .Y (countval[14]));
  BUFX2 drc_bufs294(.A (n_79), .Y (countval[15]));
  BUFX2 drc_bufs295(.A (n_80), .Y (countval[16]));
  BUFX2 drc_bufs296(.A (n_81), .Y (countval[17]));
  BUFX2 drc_bufs297(.A (n_82), .Y (countval[18]));
  BUFX2 drc_bufs298(.A (n_83), .Y (countval[19]));
  BUFX2 drc_bufs299(.A (n_84), .Y (countval[20]));
  BUFX2 drc_bufs300(.A (n_85), .Y (countval[21]));
  BUFX2 drc_bufs301(.A (n_86), .Y (countval[22]));
  BUFX2 drc_bufs302(.A (n_87), .Y (countval[23]));
  BUFX2 drc_bufs303(.A (n_88), .Y (countval[24]));
  BUFX2 drc_bufs304(.A (n_89), .Y (countval[25]));
  BUFX2 drc_bufs305(.A (n_90), .Y (countval[26]));
  BUFX2 drc_bufs306(.A (n_91), .Y (countval[27]));
  BUFX2 drc_bufs307(.A (n_92), .Y (countval[28]));
  BUFX2 drc_bufs308(.A (n_93), .Y (countval[29]));
  BUFX2 drc_bufs309(.A (n_94), .Y (countval[30]));
  XOR2X1 g2(.A (en), .B (countval[0]), .Y (n_0));
endmodule

module dsc_serial_mul_DATA_WIDTH8_NUM_INPUTS4(clk, rst, en,
     \bin_data_in[0] , \bin_data_in[1] , \bin_data_in[2] ,
     \bin_data_in[3] , bin_data_out, done);
  input clk, rst, en;
  input [7:0] \bin_data_in[0] , \bin_data_in[1] , \bin_data_in[2] ,
       \bin_data_in[3] ;
  output [31:0] bin_data_out;
  output done;
  wire clk, rst, en;
  wire [7:0] \bin_data_in[0] , \bin_data_in[1] , \bin_data_in[2] ,
       \bin_data_in[3] ;
  wire [31:0] bin_data_out;
  wire done;
  wire [3:0] bs_data_in;
  wire [3:0] sng_ov;
  wire bs_data_out, dummy_ov, n_0, n_1;
  sng_dsc_WIDTH8_STRIDE1 \genblk1[0].genblk1.sng (.clk (clk), .rst
       (rst), .en (en), .bin_in (\bin_data_in[0] ), .sn_out
       (bs_data_in[0]), .ctr_overflow (sng_ov[0]));
  sng_dsc_WIDTH8_STRIDE1_1 \genblk1[1].genblk1.sng (.clk (sng_ov[0]),
       .rst (rst), .en (en), .bin_in (\bin_data_in[1] ), .sn_out
       (bs_data_in[1]), .ctr_overflow (sng_ov[1]));
  sng_dsc_WIDTH8_STRIDE1_2 \genblk1[2].genblk1.sng (.clk (sng_ov[1]),
       .rst (rst), .en (en), .bin_in (\bin_data_in[2] ), .sn_out
       (bs_data_in[2]), .ctr_overflow (sng_ov[2]));
  sng_dsc_WIDTH8_STRIDE1_3 \genblk1[3].genblk1.sng (.clk (sng_ov[2]),
       .rst (rst), .en (en), .bin_in (\bin_data_in[3] ), .sn_out
       (bs_data_in[3]), .ctr_overflow (done));
  counter_WIDTH32_STRIDE1 stoch2bin(.clk (clk), .en (bs_data_out), .rst
       (rst), .overflow (dummy_ov), .countval (bin_data_out));
  AND2X1 g22(.A (n_1), .B (n_0), .Y (bs_data_out));
  AND2X1 g23(.A (bs_data_in[1]), .B (bs_data_in[3]), .Y (n_1));
  AND2X1 g24(.A (bs_data_in[0]), .B (bs_data_in[2]), .Y (n_0));
endmodule

