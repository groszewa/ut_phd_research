
// Generated by Cadence Encounter(R) RTL Compiler RC14.28 - v14.20-s067_1

// Verification Directory fv/cas3 

module cas(a, b, a_new, b_new);
  input [5:0] a, b;
  output [5:0] a_new, b_new;
  wire [5:0] a, b;
  wire [5:0] a_new, b_new;
  wire n_0, n_1, n_2, n_3, n_4, n_5, n_6, n_7;
  wire n_8, n_9, n_10, n_11, n_12, n_13, n_14, n_15;
  wire n_16, n_17, n_18, n_19, n_20, n_21, n_22, n_23;
  wire n_24, n_25, n_26, n_27, n_28, n_29, n_30, n_31;
  wire n_38, n_39, n_40, n_41, n_42, n_43;
  INVX1 g473(.A (n_43), .Y (a_new[5]));
  INVX1 g474(.A (n_42), .Y (a_new[4]));
  INVX1 g475(.A (n_41), .Y (a_new[3]));
  INVX1 g476(.A (n_40), .Y (b_new[1]));
  INVX1 g477(.A (n_39), .Y (b_new[0]));
  INVX1 g478(.A (n_38), .Y (a_new[2]));
  MUX2X1 g479(.A (a[5]), .B (b[5]), .S (n_25), .Y (n_43));
  MUX2X1 g480(.A (a[4]), .B (b[4]), .S (n_25), .Y (n_42));
  MUX2X1 g481(.A (a[3]), .B (b[3]), .S (n_25), .Y (n_41));
  MUX2X1 g482(.A (b[1]), .B (a[1]), .S (n_25), .Y (n_40));
  MUX2X1 g483(.A (b[0]), .B (a[0]), .S (n_25), .Y (n_39));
  MUX2X1 g484(.A (a[2]), .B (b[2]), .S (n_25), .Y (n_38));
  INVX1 g485(.A (n_31), .Y (a_new[1]));
  INVX1 g486(.A (n_30), .Y (a_new[0]));
  INVX1 g487(.A (n_29), .Y (b_new[5]));
  INVX1 g488(.A (n_28), .Y (b_new[4]));
  INVX1 g489(.A (n_27), .Y (b_new[3]));
  INVX1 g490(.A (n_26), .Y (b_new[2]));
  MUX2X1 g491(.A (a[1]), .B (b[1]), .S (n_25), .Y (n_31));
  MUX2X1 g492(.A (a[0]), .B (b[0]), .S (n_25), .Y (n_30));
  MUX2X1 g493(.A (b[5]), .B (a[5]), .S (n_25), .Y (n_29));
  MUX2X1 g494(.A (b[4]), .B (a[4]), .S (n_25), .Y (n_28));
  MUX2X1 g495(.A (b[3]), .B (a[3]), .S (n_25), .Y (n_27));
  MUX2X1 g496(.A (b[2]), .B (a[2]), .S (n_25), .Y (n_26));
  OAI21X1 g497(.A (b[4]), .B (n_6), .C (n_1), .Y (n_25));
  AOI22X1 g498(.A (n_23), .B (n_16), .C (a[5]), .D (n_9), .Y (n_24));
  AND2X1 g499(.A (n_2), .B (n_3), .Y (n_23));
  AOI22X1 g500(.A (n_8), .B (n_15), .C (b[4]), .D (n_11), .Y (n_22));
  AOI21X1 g501(.A (a[2]), .B (n_18), .C (n_5), .Y (n_21));
  NOR2X1 g502(.A (b[2]), .B (n_4), .Y (n_20));
  NOR2X1 g503(.A (a[2]), .B (n_18), .Y (n_19));
  OAI21X1 g504(.A (b[1]), .B (n_7), .C (n_0), .Y (n_18));
  NAND2X1 g505(.A (a[4]), .B (n_16), .Y (n_17));
  OR2X1 g506(.A (n_9), .B (a[5]), .Y (n_16));
  OR2X1 g507(.A (n_10), .B (b[3]), .Y (n_15));
  NAND2X1 g508(.A (b[3]), .B (n_10), .Y (n_14));
  NAND2X1 g509(.A (a[1]), .B (a[0]), .Y (n_13));
  NOR2X1 g510(.A (a[0]), .B (a[1]), .Y (n_12));
  INVX1 g511(.A (a[4]), .Y (n_11));
  INVX1 g512(.A (a[3]), .Y (n_10));
  INVX1 g513(.A (b[5]), .Y (n_9));
  BUFX2 drc_bufs(.A (n_21), .Y (n_8));
  BUFX2 drc_bufs514(.A (n_12), .Y (n_7));
  BUFX2 drc_bufs515(.A (n_17), .Y (n_6));
  BUFX2 drc_bufs516(.A (n_20), .Y (n_5));
  BUFX2 drc_bufs517(.A (n_19), .Y (n_4));
  BUFX2 drc_bufs518(.A (n_14), .Y (n_3));
  BUFX2 drc_bufs519(.A (n_22), .Y (n_2));
  BUFX2 drc_bufs520(.A (n_24), .Y (n_1));
  BUFX2 drc_bufs521(.A (n_13), .Y (n_0));
endmodule

module cas_1(a, b, a_new, b_new);
  input [5:0] a, b;
  output [5:0] a_new, b_new;
  wire [5:0] a, b;
  wire [5:0] a_new, b_new;
  wire n_0, n_1, n_2, n_3, n_4, n_5, n_6, n_7;
  wire n_8, n_9, n_10, n_11, n_12, n_13, n_14, n_15;
  wire n_16, n_17, n_18, n_19, n_20, n_21, n_22, n_23;
  wire n_24, n_25, n_26, n_27, n_28, n_29, n_30, n_31;
  wire n_38, n_39, n_40, n_41, n_42, n_43;
  INVX1 g473(.A (n_43), .Y (a_new[5]));
  INVX1 g474(.A (n_42), .Y (a_new[4]));
  INVX1 g475(.A (n_41), .Y (a_new[3]));
  INVX1 g476(.A (n_40), .Y (b_new[1]));
  INVX1 g477(.A (n_39), .Y (b_new[0]));
  INVX1 g478(.A (n_38), .Y (a_new[2]));
  MUX2X1 g479(.A (a[5]), .B (b[5]), .S (n_25), .Y (n_43));
  MUX2X1 g480(.A (a[4]), .B (b[4]), .S (n_25), .Y (n_42));
  MUX2X1 g481(.A (a[3]), .B (b[3]), .S (n_25), .Y (n_41));
  MUX2X1 g482(.A (b[1]), .B (a[1]), .S (n_25), .Y (n_40));
  MUX2X1 g483(.A (b[0]), .B (a[0]), .S (n_25), .Y (n_39));
  MUX2X1 g484(.A (a[2]), .B (b[2]), .S (n_25), .Y (n_38));
  INVX1 g485(.A (n_31), .Y (a_new[1]));
  INVX1 g486(.A (n_30), .Y (a_new[0]));
  INVX1 g487(.A (n_29), .Y (b_new[5]));
  INVX1 g488(.A (n_28), .Y (b_new[4]));
  INVX1 g489(.A (n_27), .Y (b_new[3]));
  INVX1 g490(.A (n_26), .Y (b_new[2]));
  MUX2X1 g491(.A (a[1]), .B (b[1]), .S (n_25), .Y (n_31));
  MUX2X1 g492(.A (a[0]), .B (b[0]), .S (n_25), .Y (n_30));
  MUX2X1 g493(.A (b[5]), .B (a[5]), .S (n_25), .Y (n_29));
  MUX2X1 g494(.A (b[4]), .B (a[4]), .S (n_25), .Y (n_28));
  MUX2X1 g495(.A (b[3]), .B (a[3]), .S (n_25), .Y (n_27));
  MUX2X1 g496(.A (b[2]), .B (a[2]), .S (n_25), .Y (n_26));
  OAI21X1 g497(.A (b[4]), .B (n_6), .C (n_1), .Y (n_25));
  AOI22X1 g498(.A (n_23), .B (n_16), .C (n_9), .D (a[5]), .Y (n_24));
  AND2X1 g499(.A (n_2), .B (n_3), .Y (n_23));
  AOI22X1 g500(.A (n_8), .B (n_15), .C (b[4]), .D (n_11), .Y (n_22));
  AOI21X1 g501(.A (a[2]), .B (n_18), .C (n_5), .Y (n_21));
  NOR2X1 g502(.A (b[2]), .B (n_4), .Y (n_20));
  NOR2X1 g503(.A (a[2]), .B (n_18), .Y (n_19));
  OAI21X1 g504(.A (b[1]), .B (n_7), .C (n_0), .Y (n_18));
  NAND2X1 g505(.A (a[4]), .B (n_16), .Y (n_17));
  OR2X1 g506(.A (a[5]), .B (n_9), .Y (n_16));
  OR2X1 g507(.A (n_10), .B (b[3]), .Y (n_15));
  NAND2X1 g508(.A (b[3]), .B (n_10), .Y (n_14));
  NAND2X1 g509(.A (a[0]), .B (a[1]), .Y (n_13));
  NOR2X1 g510(.A (a[0]), .B (a[1]), .Y (n_12));
  INVX1 g511(.A (a[4]), .Y (n_11));
  INVX1 g512(.A (a[3]), .Y (n_10));
  INVX1 g513(.A (b[5]), .Y (n_9));
  BUFX2 drc_bufs(.A (n_21), .Y (n_8));
  BUFX2 drc_bufs514(.A (n_12), .Y (n_7));
  BUFX2 drc_bufs515(.A (n_17), .Y (n_6));
  BUFX2 drc_bufs516(.A (n_20), .Y (n_5));
  BUFX2 drc_bufs517(.A (n_19), .Y (n_4));
  BUFX2 drc_bufs518(.A (n_14), .Y (n_3));
  BUFX2 drc_bufs519(.A (n_22), .Y (n_2));
  BUFX2 drc_bufs520(.A (n_24), .Y (n_1));
  BUFX2 drc_bufs521(.A (n_13), .Y (n_0));
endmodule

module cas_2(a, b, a_new, b_new);
  input [5:0] a, b;
  output [5:0] a_new, b_new;
  wire [5:0] a, b;
  wire [5:0] a_new, b_new;
  wire n_0, n_1, n_2, n_3, n_4, n_5, n_6, n_7;
  wire n_8, n_9, n_10, n_11, n_12, n_13, n_14, n_15;
  wire n_16, n_17, n_18, n_19, n_20, n_21, n_22, n_23;
  wire n_24, n_25, n_26, n_27, n_28, n_29, n_30, n_31;
  wire n_38, n_39, n_40, n_41, n_42, n_43;
  INVX1 g473(.A (n_43), .Y (a_new[5]));
  INVX1 g474(.A (n_42), .Y (a_new[4]));
  INVX1 g475(.A (n_41), .Y (a_new[3]));
  INVX1 g476(.A (n_40), .Y (b_new[1]));
  INVX1 g477(.A (n_39), .Y (b_new[0]));
  INVX1 g478(.A (n_38), .Y (a_new[2]));
  MUX2X1 g479(.A (a[5]), .B (b[5]), .S (n_25), .Y (n_43));
  MUX2X1 g480(.A (a[4]), .B (b[4]), .S (n_25), .Y (n_42));
  MUX2X1 g481(.A (a[3]), .B (b[3]), .S (n_25), .Y (n_41));
  MUX2X1 g482(.A (b[1]), .B (a[1]), .S (n_25), .Y (n_40));
  MUX2X1 g483(.A (b[0]), .B (a[0]), .S (n_25), .Y (n_39));
  MUX2X1 g484(.A (a[2]), .B (b[2]), .S (n_25), .Y (n_38));
  INVX1 g485(.A (n_31), .Y (a_new[1]));
  INVX1 g486(.A (n_30), .Y (a_new[0]));
  INVX1 g487(.A (n_29), .Y (b_new[5]));
  INVX1 g488(.A (n_28), .Y (b_new[4]));
  INVX1 g489(.A (n_27), .Y (b_new[3]));
  INVX1 g490(.A (n_26), .Y (b_new[2]));
  MUX2X1 g491(.A (a[1]), .B (b[1]), .S (n_25), .Y (n_31));
  MUX2X1 g492(.A (a[0]), .B (b[0]), .S (n_25), .Y (n_30));
  MUX2X1 g493(.A (b[5]), .B (a[5]), .S (n_25), .Y (n_29));
  MUX2X1 g494(.A (b[4]), .B (a[4]), .S (n_25), .Y (n_28));
  MUX2X1 g495(.A (b[3]), .B (a[3]), .S (n_25), .Y (n_27));
  MUX2X1 g496(.A (b[2]), .B (a[2]), .S (n_25), .Y (n_26));
  OAI21X1 g497(.A (b[4]), .B (n_7), .C (n_0), .Y (n_25));
  AOI22X1 g498(.A (n_23), .B (n_16), .C (a[5]), .D (n_9), .Y (n_24));
  AND2X1 g499(.A (n_2), .B (n_3), .Y (n_23));
  AOI22X1 g500(.A (n_8), .B (n_15), .C (n_11), .D (b[4]), .Y (n_22));
  AOI21X1 g501(.A (a[2]), .B (n_18), .C (n_5), .Y (n_21));
  NOR2X1 g502(.A (b[2]), .B (n_4), .Y (n_20));
  NOR2X1 g503(.A (a[2]), .B (n_18), .Y (n_19));
  OAI21X1 g504(.A (n_6), .B (b[1]), .C (n_1), .Y (n_18));
  NAND2X1 g505(.A (a[4]), .B (n_16), .Y (n_17));
  OR2X1 g506(.A (n_9), .B (a[5]), .Y (n_16));
  OR2X1 g507(.A (b[3]), .B (n_10), .Y (n_15));
  NAND2X1 g508(.A (n_10), .B (b[3]), .Y (n_14));
  NAND2X1 g509(.A (a[0]), .B (a[1]), .Y (n_13));
  NOR2X1 g510(.A (a[0]), .B (a[1]), .Y (n_12));
  INVX1 g511(.A (a[4]), .Y (n_11));
  INVX1 g512(.A (a[3]), .Y (n_10));
  INVX1 g513(.A (b[5]), .Y (n_9));
  BUFX2 drc_bufs(.A (n_21), .Y (n_8));
  BUFX2 drc_bufs514(.A (n_17), .Y (n_7));
  BUFX2 drc_bufs515(.A (n_12), .Y (n_6));
  BUFX2 drc_bufs516(.A (n_20), .Y (n_5));
  BUFX2 drc_bufs517(.A (n_19), .Y (n_4));
  BUFX2 drc_bufs518(.A (n_14), .Y (n_3));
  BUFX2 drc_bufs519(.A (n_22), .Y (n_2));
  BUFX2 drc_bufs520(.A (n_13), .Y (n_1));
  BUFX2 drc_bufs521(.A (n_24), .Y (n_0));
endmodule

module cas3(a, b, c, a_new, b_new, c_new);
  input [5:0] a, b, c;
  output [5:0] a_new, b_new, c_new;
  wire [5:0] a, b, c;
  wire [5:0] a_new, b_new, c_new;
  wire [5:0] max1;
  wire [5:0] min1;
  wire [5:0] max2;
  cas cas1(.a (a), .b (b), .a_new (max1), .b_new (min1));
  cas_1 cas2(.a (min1), .b (c), .a_new (max2), .b_new (c_new));
  cas_2 cas3(.a (max1), .b (max2), .a_new (a_new), .b_new (b_new));
endmodule

