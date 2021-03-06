
// Generated by Cadence Encounter(R) RTL Compiler RC14.28 - v14.20-s067_1

// Verification Directory fv/cas3 

module cas(a, b, a_new, b_new);
  input [7:0] a, b;
  output [7:0] a_new, b_new;
  wire [7:0] a, b;
  wire [7:0] a_new, b_new;
  wire n_0, n_1, n_2, n_3, n_4, n_5, n_6, n_7;
  wire n_8, n_9, n_10, n_11, n_12, n_13, n_14, n_15;
  wire n_16, n_17, n_18, n_19, n_20, n_21, n_22, n_23;
  wire n_24, n_25, n_26, n_27, n_28, n_29, n_30, n_31;
  wire n_32, n_33, n_34, n_35, n_36, n_37, n_38, n_39;
  wire n_40, n_41, n_42, n_43, n_44, n_45, n_54, n_55;
  wire n_56, n_57, n_58, n_59, n_60, n_61;
  INVX1 g666(.A (n_61), .Y (a_new[7]));
  INVX1 g667(.A (n_60), .Y (a_new[1]));
  INVX1 g668(.A (n_59), .Y (a_new[0]));
  INVX1 g669(.A (n_58), .Y (b_new[7]));
  INVX1 g670(.A (n_57), .Y (b_new[6]));
  INVX1 g671(.A (n_56), .Y (b_new[5]));
  INVX1 g672(.A (n_55), .Y (b_new[4]));
  INVX1 g673(.A (n_54), .Y (b_new[3]));
  MUX2X1 g674(.A (b[7]), .B (a[7]), .S (n_37), .Y (n_61));
  MUX2X1 g675(.A (b[1]), .B (a[1]), .S (n_37), .Y (n_60));
  MUX2X1 g676(.A (b[0]), .B (a[0]), .S (n_37), .Y (n_59));
  MUX2X1 g677(.A (a[7]), .B (b[7]), .S (n_37), .Y (n_58));
  MUX2X1 g678(.A (a[6]), .B (b[6]), .S (n_37), .Y (n_57));
  MUX2X1 g679(.A (a[5]), .B (b[5]), .S (n_37), .Y (n_56));
  MUX2X1 g680(.A (a[4]), .B (b[4]), .S (n_37), .Y (n_55));
  MUX2X1 g681(.A (a[3]), .B (b[3]), .S (n_37), .Y (n_54));
  INVX1 g682(.A (n_45), .Y (b_new[2]));
  INVX1 g683(.A (n_44), .Y (b_new[1]));
  INVX1 g684(.A (n_43), .Y (b_new[0]));
  INVX1 g685(.A (n_42), .Y (a_new[6]));
  INVX1 g686(.A (n_41), .Y (a_new[5]));
  INVX1 g687(.A (n_40), .Y (a_new[4]));
  INVX1 g688(.A (n_39), .Y (a_new[3]));
  INVX1 g689(.A (n_38), .Y (a_new[2]));
  MUX2X1 g690(.A (a[2]), .B (b[2]), .S (n_37), .Y (n_45));
  MUX2X1 g691(.A (a[1]), .B (b[1]), .S (n_37), .Y (n_44));
  MUX2X1 g692(.A (a[0]), .B (b[0]), .S (n_37), .Y (n_43));
  MUX2X1 g693(.A (b[6]), .B (a[6]), .S (n_37), .Y (n_42));
  MUX2X1 g694(.A (b[5]), .B (a[5]), .S (n_37), .Y (n_41));
  MUX2X1 g695(.A (b[4]), .B (a[4]), .S (n_37), .Y (n_40));
  MUX2X1 g696(.A (b[3]), .B (a[3]), .S (n_37), .Y (n_39));
  MUX2X1 g697(.A (b[2]), .B (a[2]), .S (n_37), .Y (n_38));
  AND2X1 g698(.A (n_36), .B (n_28), .Y (n_37));
  OAI21X1 g699(.A (n_7), .B (n_9), .C (n_0), .Y (n_36));
  AOI21X1 g700(.A (b[5]), .B (n_10), .C (n_2), .Y (n_35));
  AOI21X1 g701(.A (a[4]), .B (n_20), .C (n_1), .Y (n_34));
  AOI21X1 g702(.A (b[4]), .B (n_13), .C (n_6), .Y (n_33));
  AOI21X1 g703(.A (a[3]), .B (n_16), .C (n_3), .Y (n_32));
  AOI21X1 g704(.A (b[3]), .B (n_15), .C (n_4), .Y (n_31));
  AOI21X1 g705(.A (a[2]), .B (n_12), .C (n_5), .Y (n_30));
  AOI22X1 g706(.A (n_26), .B (n_8), .C (b[2]), .D (n_19), .Y (n_29));
  OAI21X1 g707(.A (a[7]), .B (n_22), .C (n_27), .Y (n_28));
  OAI21X1 g708(.A (n_18), .B (n_23), .C (b[7]), .Y (n_27));
  OAI21X1 g709(.A (a[0]), .B (a[1]), .C (n_14), .Y (n_26));
  AOI22X1 g710(.A (n_11), .B (b[6]), .C (b[7]), .D (n_18), .Y (n_25));
  NOR2X1 g711(.A (b[5]), .B (n_10), .Y (n_24));
  INVX1 g712(.A (n_22), .Y (n_23));
  AND2X1 g713(.A (n_17), .B (a[6]), .Y (n_22));
  NAND2X1 g714(.A (a[1]), .B (a[0]), .Y (n_21));
  INVX1 g715(.A (b[4]), .Y (n_20));
  INVX1 g716(.A (a[2]), .Y (n_19));
  INVX1 g717(.A (a[7]), .Y (n_18));
  INVX1 g718(.A (b[6]), .Y (n_17));
  INVX1 g719(.A (b[3]), .Y (n_16));
  INVX1 g720(.A (a[3]), .Y (n_15));
  INVX1 g721(.A (b[1]), .Y (n_14));
  INVX1 g722(.A (a[4]), .Y (n_13));
  INVX1 g723(.A (b[2]), .Y (n_12));
  INVX1 g724(.A (a[6]), .Y (n_11));
  INVX1 g725(.A (a[5]), .Y (n_10));
  BUFX2 drc_bufs(.A (n_35), .Y (n_9));
  BUFX2 drc_bufs726(.A (n_21), .Y (n_8));
  BUFX2 drc_bufs727(.A (n_24), .Y (n_7));
  BUFX2 drc_bufs728(.A (n_32), .Y (n_6));
  BUFX2 drc_bufs729(.A (n_29), .Y (n_5));
  BUFX2 drc_bufs730(.A (n_30), .Y (n_4));
  BUFX2 drc_bufs731(.A (n_31), .Y (n_3));
  BUFX2 drc_bufs732(.A (n_34), .Y (n_2));
  BUFX2 drc_bufs733(.A (n_33), .Y (n_1));
  BUFX2 drc_bufs734(.A (n_25), .Y (n_0));
endmodule

module cas_1(a, b, a_new, b_new);
  input [7:0] a, b;
  output [7:0] a_new, b_new;
  wire [7:0] a, b;
  wire [7:0] a_new, b_new;
  wire n_0, n_1, n_2, n_3, n_4, n_5, n_6, n_7;
  wire n_8, n_9, n_10, n_11, n_12, n_13, n_14, n_15;
  wire n_16, n_17, n_18, n_19, n_20, n_21, n_22, n_23;
  wire n_24, n_25, n_26, n_27, n_28, n_29, n_30, n_31;
  wire n_32, n_33, n_34, n_35, n_36, n_37, n_38, n_39;
  wire n_40, n_41, n_42, n_43, n_44, n_45, n_54, n_55;
  wire n_56, n_57, n_58, n_59, n_60, n_61;
  INVX1 g666(.A (n_61), .Y (a_new[7]));
  INVX1 g667(.A (n_60), .Y (a_new[1]));
  INVX1 g668(.A (n_59), .Y (a_new[0]));
  INVX1 g669(.A (n_58), .Y (b_new[7]));
  INVX1 g670(.A (n_57), .Y (b_new[6]));
  INVX1 g671(.A (n_56), .Y (b_new[5]));
  INVX1 g672(.A (n_55), .Y (b_new[4]));
  INVX1 g673(.A (n_54), .Y (b_new[3]));
  MUX2X1 g674(.A (b[7]), .B (a[7]), .S (n_37), .Y (n_61));
  MUX2X1 g675(.A (b[1]), .B (a[1]), .S (n_37), .Y (n_60));
  MUX2X1 g676(.A (b[0]), .B (a[0]), .S (n_37), .Y (n_59));
  MUX2X1 g677(.A (a[7]), .B (b[7]), .S (n_37), .Y (n_58));
  MUX2X1 g678(.A (a[6]), .B (b[6]), .S (n_37), .Y (n_57));
  MUX2X1 g679(.A (a[5]), .B (b[5]), .S (n_37), .Y (n_56));
  MUX2X1 g680(.A (a[4]), .B (b[4]), .S (n_37), .Y (n_55));
  MUX2X1 g681(.A (a[3]), .B (b[3]), .S (n_37), .Y (n_54));
  INVX1 g682(.A (n_45), .Y (b_new[2]));
  INVX1 g683(.A (n_44), .Y (b_new[1]));
  INVX1 g684(.A (n_43), .Y (b_new[0]));
  INVX1 g685(.A (n_42), .Y (a_new[6]));
  INVX1 g686(.A (n_41), .Y (a_new[5]));
  INVX1 g687(.A (n_40), .Y (a_new[4]));
  INVX1 g688(.A (n_39), .Y (a_new[3]));
  INVX1 g689(.A (n_38), .Y (a_new[2]));
  MUX2X1 g690(.A (a[2]), .B (b[2]), .S (n_37), .Y (n_45));
  MUX2X1 g691(.A (a[1]), .B (b[1]), .S (n_37), .Y (n_44));
  MUX2X1 g692(.A (a[0]), .B (b[0]), .S (n_37), .Y (n_43));
  MUX2X1 g693(.A (b[6]), .B (a[6]), .S (n_37), .Y (n_42));
  MUX2X1 g694(.A (b[5]), .B (a[5]), .S (n_37), .Y (n_41));
  MUX2X1 g695(.A (b[4]), .B (a[4]), .S (n_37), .Y (n_40));
  MUX2X1 g696(.A (b[3]), .B (a[3]), .S (n_37), .Y (n_39));
  MUX2X1 g697(.A (b[2]), .B (a[2]), .S (n_37), .Y (n_38));
  AND2X1 g698(.A (n_36), .B (n_28), .Y (n_37));
  OAI21X1 g699(.A (n_7), .B (n_9), .C (n_0), .Y (n_36));
  AOI21X1 g700(.A (b[5]), .B (n_10), .C (n_2), .Y (n_35));
  AOI21X1 g701(.A (n_20), .B (a[4]), .C (n_1), .Y (n_34));
  AOI21X1 g702(.A (b[4]), .B (n_13), .C (n_6), .Y (n_33));
  AOI21X1 g703(.A (n_16), .B (a[3]), .C (n_3), .Y (n_32));
  AOI21X1 g704(.A (b[3]), .B (n_15), .C (n_4), .Y (n_31));
  AOI21X1 g705(.A (n_12), .B (a[2]), .C (n_5), .Y (n_30));
  AOI22X1 g706(.A (n_26), .B (n_8), .C (b[2]), .D (n_19), .Y (n_29));
  OAI21X1 g707(.A (a[7]), .B (n_22), .C (n_27), .Y (n_28));
  OAI21X1 g708(.A (n_18), .B (n_23), .C (b[7]), .Y (n_27));
  OAI21X1 g709(.A (a[0]), .B (a[1]), .C (n_14), .Y (n_26));
  AOI22X1 g710(.A (n_11), .B (b[6]), .C (b[7]), .D (n_18), .Y (n_25));
  NOR2X1 g711(.A (b[5]), .B (n_10), .Y (n_24));
  INVX1 g712(.A (n_22), .Y (n_23));
  AND2X1 g713(.A (a[6]), .B (n_17), .Y (n_22));
  NAND2X1 g714(.A (a[0]), .B (a[1]), .Y (n_21));
  INVX1 g715(.A (b[4]), .Y (n_20));
  INVX1 g716(.A (a[2]), .Y (n_19));
  INVX1 g717(.A (a[7]), .Y (n_18));
  INVX1 g718(.A (b[6]), .Y (n_17));
  INVX1 g719(.A (b[3]), .Y (n_16));
  INVX1 g720(.A (a[3]), .Y (n_15));
  INVX1 g721(.A (b[1]), .Y (n_14));
  INVX1 g722(.A (a[4]), .Y (n_13));
  INVX1 g723(.A (b[2]), .Y (n_12));
  INVX1 g724(.A (a[6]), .Y (n_11));
  INVX1 g725(.A (a[5]), .Y (n_10));
  BUFX2 drc_bufs(.A (n_35), .Y (n_9));
  BUFX2 drc_bufs726(.A (n_21), .Y (n_8));
  BUFX2 drc_bufs727(.A (n_24), .Y (n_7));
  BUFX2 drc_bufs728(.A (n_32), .Y (n_6));
  BUFX2 drc_bufs729(.A (n_29), .Y (n_5));
  BUFX2 drc_bufs730(.A (n_30), .Y (n_4));
  BUFX2 drc_bufs731(.A (n_31), .Y (n_3));
  BUFX2 drc_bufs732(.A (n_34), .Y (n_2));
  BUFX2 drc_bufs733(.A (n_33), .Y (n_1));
  BUFX2 drc_bufs734(.A (n_25), .Y (n_0));
endmodule

module cas_2(a, b, a_new, b_new);
  input [7:0] a, b;
  output [7:0] a_new, b_new;
  wire [7:0] a, b;
  wire [7:0] a_new, b_new;
  wire n_0, n_1, n_2, n_3, n_4, n_5, n_6, n_7;
  wire n_8, n_9, n_10, n_11, n_12, n_13, n_14, n_15;
  wire n_16, n_17, n_18, n_19, n_20, n_21, n_22, n_23;
  wire n_24, n_25, n_26, n_27, n_28, n_29, n_30, n_31;
  wire n_32, n_33, n_34, n_35, n_36, n_37, n_38, n_39;
  wire n_40, n_41, n_42, n_43, n_44, n_45, n_54, n_55;
  wire n_56, n_57, n_58, n_59, n_60, n_61;
  INVX1 g666(.A (n_61), .Y (a_new[7]));
  INVX1 g667(.A (n_60), .Y (a_new[1]));
  INVX1 g668(.A (n_59), .Y (a_new[0]));
  INVX1 g669(.A (n_58), .Y (b_new[7]));
  INVX1 g670(.A (n_57), .Y (b_new[6]));
  INVX1 g671(.A (n_56), .Y (b_new[5]));
  INVX1 g672(.A (n_55), .Y (b_new[4]));
  INVX1 g673(.A (n_54), .Y (b_new[3]));
  MUX2X1 g674(.A (b[7]), .B (a[7]), .S (n_37), .Y (n_61));
  MUX2X1 g675(.A (b[1]), .B (a[1]), .S (n_37), .Y (n_60));
  MUX2X1 g676(.A (b[0]), .B (a[0]), .S (n_37), .Y (n_59));
  MUX2X1 g677(.A (a[7]), .B (b[7]), .S (n_37), .Y (n_58));
  MUX2X1 g678(.A (a[6]), .B (b[6]), .S (n_37), .Y (n_57));
  MUX2X1 g679(.A (a[5]), .B (b[5]), .S (n_37), .Y (n_56));
  MUX2X1 g680(.A (a[4]), .B (b[4]), .S (n_37), .Y (n_55));
  MUX2X1 g681(.A (a[3]), .B (b[3]), .S (n_37), .Y (n_54));
  INVX1 g682(.A (n_45), .Y (b_new[2]));
  INVX1 g683(.A (n_44), .Y (b_new[1]));
  INVX1 g684(.A (n_43), .Y (b_new[0]));
  INVX1 g685(.A (n_42), .Y (a_new[6]));
  INVX1 g686(.A (n_41), .Y (a_new[5]));
  INVX1 g687(.A (n_40), .Y (a_new[4]));
  INVX1 g688(.A (n_39), .Y (a_new[3]));
  INVX1 g689(.A (n_38), .Y (a_new[2]));
  MUX2X1 g690(.A (a[2]), .B (b[2]), .S (n_37), .Y (n_45));
  MUX2X1 g691(.A (a[1]), .B (b[1]), .S (n_37), .Y (n_44));
  MUX2X1 g692(.A (a[0]), .B (b[0]), .S (n_37), .Y (n_43));
  MUX2X1 g693(.A (b[6]), .B (a[6]), .S (n_37), .Y (n_42));
  MUX2X1 g694(.A (b[5]), .B (a[5]), .S (n_37), .Y (n_41));
  MUX2X1 g695(.A (b[4]), .B (a[4]), .S (n_37), .Y (n_40));
  MUX2X1 g696(.A (b[3]), .B (a[3]), .S (n_37), .Y (n_39));
  MUX2X1 g697(.A (b[2]), .B (a[2]), .S (n_37), .Y (n_38));
  AND2X1 g698(.A (n_36), .B (n_28), .Y (n_37));
  OAI21X1 g699(.A (n_7), .B (n_9), .C (n_0), .Y (n_36));
  AOI21X1 g700(.A (n_10), .B (b[5]), .C (n_2), .Y (n_35));
  AOI21X1 g701(.A (a[4]), .B (n_20), .C (n_1), .Y (n_34));
  AOI21X1 g702(.A (n_13), .B (b[4]), .C (n_6), .Y (n_33));
  AOI21X1 g703(.A (a[3]), .B (n_16), .C (n_3), .Y (n_32));
  AOI21X1 g704(.A (n_15), .B (b[3]), .C (n_4), .Y (n_31));
  AOI21X1 g705(.A (a[2]), .B (n_12), .C (n_5), .Y (n_30));
  AOI22X1 g706(.A (n_26), .B (n_8), .C (n_19), .D (b[2]), .Y (n_29));
  OAI21X1 g707(.A (a[7]), .B (n_22), .C (n_27), .Y (n_28));
  OAI21X1 g708(.A (n_18), .B (n_23), .C (b[7]), .Y (n_27));
  OAI21X1 g709(.A (a[0]), .B (a[1]), .C (n_14), .Y (n_26));
  AOI22X1 g710(.A (b[6]), .B (n_11), .C (n_18), .D (b[7]), .Y (n_25));
  NOR2X1 g711(.A (n_10), .B (b[5]), .Y (n_24));
  INVX1 g712(.A (n_22), .Y (n_23));
  AND2X1 g713(.A (n_17), .B (a[6]), .Y (n_22));
  NAND2X1 g714(.A (a[0]), .B (a[1]), .Y (n_21));
  INVX1 g715(.A (b[4]), .Y (n_20));
  INVX1 g716(.A (a[2]), .Y (n_19));
  INVX1 g717(.A (a[7]), .Y (n_18));
  INVX1 g718(.A (b[6]), .Y (n_17));
  INVX1 g719(.A (b[3]), .Y (n_16));
  INVX1 g720(.A (a[3]), .Y (n_15));
  INVX1 g721(.A (b[1]), .Y (n_14));
  INVX1 g722(.A (a[4]), .Y (n_13));
  INVX1 g723(.A (b[2]), .Y (n_12));
  INVX1 g724(.A (a[6]), .Y (n_11));
  INVX1 g725(.A (a[5]), .Y (n_10));
  BUFX2 drc_bufs(.A (n_35), .Y (n_9));
  BUFX2 drc_bufs726(.A (n_21), .Y (n_8));
  BUFX2 drc_bufs727(.A (n_24), .Y (n_7));
  BUFX2 drc_bufs728(.A (n_32), .Y (n_6));
  BUFX2 drc_bufs729(.A (n_29), .Y (n_5));
  BUFX2 drc_bufs730(.A (n_30), .Y (n_4));
  BUFX2 drc_bufs731(.A (n_31), .Y (n_3));
  BUFX2 drc_bufs732(.A (n_34), .Y (n_2));
  BUFX2 drc_bufs733(.A (n_33), .Y (n_1));
  BUFX2 drc_bufs734(.A (n_25), .Y (n_0));
endmodule

module cas3(a, b, c, a_new, b_new, c_new);
  input [7:0] a, b, c;
  output [7:0] a_new, b_new, c_new;
  wire [7:0] a, b, c;
  wire [7:0] a_new, b_new, c_new;
  wire [7:0] max1;
  wire [7:0] min1;
  wire [7:0] max2;
  cas cas1(.a (a), .b (b), .a_new (max1), .b_new (min1));
  cas_1 cas2(.a (min1), .b (c), .a_new (max2), .b_new (c_new));
  cas_2 cas3(.a (max1), .b (max2), .a_new (a_new), .b_new (b_new));
endmodule

