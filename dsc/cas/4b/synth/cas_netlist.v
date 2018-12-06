
// Generated by Cadence Encounter(R) RTL Compiler RC14.28 - v14.20-s067_1

// Verification Directory fv/cas 

module cas(a, b, gt_out, lt_out);
  input [3:0] a, b;
  output [3:0] gt_out, lt_out;
  wire [3:0] a, b;
  wire [3:0] gt_out, lt_out;
  wire n_0, n_2, n_3, n_4, n_5, n_6, n_7, n_8;
  wire n_9, n_10, n_11, n_12, n_13, n_14, n_15, n_16;
  wire n_17, n_34, n_38, n_42, n_46, n_50;
  INVX1 g276(.A (n_12), .Y (gt_out[2]));
  INVX1 g280(.A (n_10), .Y (lt_out[2]));
  INVX1 g284(.A (n_11), .Y (lt_out[0]));
  INVX1 g286(.A (n_17), .Y (gt_out[1]));
  INVX1 g278(.A (n_16), .Y (lt_out[3]));
  INVX1 g288(.A (n_14), .Y (gt_out[0]));
  INVX1 g282(.A (n_13), .Y (lt_out[1]));
  MUX2X1 g287(.A (a[1]), .B (b[1]), .S (n_15), .Y (n_17));
  MUX2X1 g279(.A (b[3]), .B (a[3]), .S (n_15), .Y (n_16));
  MUX2X1 g289(.A (a[0]), .B (b[0]), .S (n_15), .Y (n_14));
  MUX2X1 g283(.A (b[1]), .B (a[1]), .S (n_15), .Y (n_13));
  MUX2X1 g277(.A (a[2]), .B (b[2]), .S (n_15), .Y (n_12));
  MUX2X1 g285(.A (b[0]), .B (a[0]), .S (n_15), .Y (n_11));
  MUX2X1 g281(.A (b[2]), .B (a[2]), .S (n_15), .Y (n_10));
  OAI21X1 g290(.A (b[2]), .B (n_34), .C (n_50), .Y (n_15));
  AOI22X1 g291(.A (n_38), .B (n_5), .C (a[3]), .D (n_3), .Y (n_9));
  AOI21X1 g292(.A (b[2]), .B (n_0), .C (n_7), .Y (n_8));
  OAI21X1 g293(.A (a[0]), .B (a[1]), .C (n_42), .Y (n_7));
  NAND2X1 g294(.A (a[2]), .B (n_5), .Y (n_6));
  NAND2X1 g295(.A (b[1]), .B (n_46), .Y (n_4));
  OR2X1 g296(.A (n_3), .B (a[3]), .Y (n_5));
  NAND2X1 g298(.A (a[1]), .B (a[0]), .Y (n_2));
  OR2X1 g297(.A (b[3]), .B (a[3]), .Y (gt_out[3]));
  INVX1 g300(.A (a[2]), .Y (n_0));
  INVX1 g299(.A (b[3]), .Y (n_3));
  BUFX2 drc_bufs(.A (n_6), .Y (n_34));
  BUFX2 drc_bufs303(.A (n_8), .Y (n_38));
  BUFX2 drc_bufs306(.A (n_4), .Y (n_42));
  BUFX2 drc_bufs309(.A (n_2), .Y (n_46));
  BUFX2 drc_bufs312(.A (n_9), .Y (n_50));
endmodule
