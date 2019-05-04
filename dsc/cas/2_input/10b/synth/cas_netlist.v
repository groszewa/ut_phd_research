
// Generated by Cadence Encounter(R) RTL Compiler RC14.28 - v14.20-s067_1

// Verification Directory fv/cas 

module cas(a, b, a_new, b_new);
  input [9:0] a, b;
  output [9:0] a_new, b_new;
  wire [9:0] a, b;
  wire [9:0] a_new, b_new;
  wire UNCONNECTED, n_0, n_1, n_2, n_3, n_4, n_5, n_6;
  wire n_7, n_8, n_10, n_11, n_12, n_13, n_14, n_15;
  wire n_16, n_17, n_18, n_19, n_20, n_21, n_22, n_23;
  wire n_24, n_25, n_26, n_29, n_30, n_34, n_35, n_36;
  wire n_37, n_38, n_39, n_40, n_41, n_42, n_43, n_44;
  wire n_45, n_46, n_47, n_48, n_49, n_50, n_51, n_52;
  wire n_53, n_54, n_55, n_56, n_97, n_101, n_105, n_109;
  wire n_113, n_117, n_144, n_146, n_147;
  INVX1 g873(.A (n_43), .Y (a_new[8]));
  INVX1 g875(.A (n_38), .Y (a_new[6]));
  INVX1 g877(.A (n_40), .Y (a_new[4]));
  INVX1 g891(.A (n_56), .Y (b_new[9]));
  INVX1 g900(.A (n_37), .Y (b_new[0]));
  INVX1 g892(.A (n_55), .Y (b_new[8]));
  INVX1 g878(.A (n_53), .Y (a_new[3]));
  INVX1 g893(.A (n_52), .Y (b_new[7]));
  INVX1 g894(.A (n_49), .Y (b_new[6]));
  INVX1 g874(.A (n_51), .Y (a_new[7]));
  INVX1 g879(.A (n_50), .Y (a_new[2]));
  INVX1 g895(.A (n_47), .Y (b_new[5]));
  INVX1 g896(.A (n_45), .Y (b_new[4]));
  INVX1 g876(.A (n_48), .Y (a_new[5]));
  INVX1 g880(.A (n_46), .Y (a_new[1]));
  INVX1 g897(.A (n_44), .Y (b_new[3]));
  INVX1 g898(.A (n_42), .Y (b_new[2]));
  INVX1 g881(.A (n_41), .Y (a_new[0]));
  INVX1 g899(.A (n_39), .Y (b_new[1]));
  MUX2X1 g901(.A (b[9]), .B (a[9]), .S (n_54), .Y (n_56));
  MUX2X1 g902(.A (b[8]), .B (a[8]), .S (n_54), .Y (n_55));
  MUX2X1 g887(.A (a[3]), .B (b[3]), .S (n_54), .Y (n_53));
  MUX2X1 g903(.A (b[7]), .B (a[7]), .S (n_54), .Y (n_52));
  MUX2X1 g883(.A (a[7]), .B (b[7]), .S (n_54), .Y (n_51));
  MUX2X1 g888(.A (a[2]), .B (b[2]), .S (n_54), .Y (n_50));
  MUX2X1 g904(.A (b[6]), .B (a[6]), .S (n_54), .Y (n_49));
  MUX2X1 g885(.A (a[5]), .B (b[5]), .S (n_54), .Y (n_48));
  MUX2X1 g905(.A (b[5]), .B (a[5]), .S (n_54), .Y (n_47));
  MUX2X1 g889(.A (a[1]), .B (b[1]), .S (n_54), .Y (n_46));
  MUX2X1 g906(.A (b[4]), .B (a[4]), .S (n_54), .Y (n_45));
  MUX2X1 g907(.A (b[3]), .B (a[3]), .S (n_54), .Y (n_44));
  MUX2X1 g882(.A (a[8]), .B (b[8]), .S (n_54), .Y (n_43));
  MUX2X1 g908(.A (b[2]), .B (a[2]), .S (n_54), .Y (n_42));
  MUX2X1 g890(.A (a[0]), .B (b[0]), .S (n_54), .Y (n_41));
  MUX2X1 g886(.A (a[4]), .B (b[4]), .S (n_54), .Y (n_40));
  MUX2X1 g909(.A (b[1]), .B (a[1]), .S (n_54), .Y (n_39));
  MUX2X1 g884(.A (a[6]), .B (b[6]), .S (n_54), .Y (n_38));
  MUX2X1 g910(.A (b[0]), .B (a[0]), .S (n_54), .Y (n_37));
  OAI21X1 g911(.A (b[8]), .B (n_97), .C (n_36), .Y (n_54));
  AND2X1 g912(.A (n_35), .B (n_10), .Y (n_36));
  OAI21X1 g913(.A (a[8]), .B (n_2), .C (n_34), .Y (n_35));
  AND2X1 g914(.A (n_147), .B (n_18), .Y (n_34));
  OAI21X1 g918(.A (a[4]), .B (n_15), .C (n_117), .Y (n_29));
  OAI21X1 g921(.A (a[2]), .B (n_22), .C (n_24), .Y (n_26));
  OAI21X1 g922(.A (n_7), .B (n_21), .C (b[2]), .Y (n_24));
  OAI21X1 g923(.A (a[7]), .B (n_12), .C (n_20), .Y (n_23));
  INVX1 g926(.A (n_21), .Y (n_22));
  OAI21X1 g924(.A (n_13), .B (n_11), .C (b[7]), .Y (n_20));
  OAI21X1 g925(.A (a[6]), .B (n_4), .C (n_105), .Y (n_30));
  OAI21X1 g927(.A (a[0]), .B (a[1]), .C (n_109), .Y (n_21));
  NAND2X1 g928(.A (a[8]), .B (n_18), .Y (n_19));
  NAND2X1 g929(.A (b[1]), .B (n_113), .Y (n_17));
  AOI22X1 g930(.A (n_15), .B (a[4]), .C (a[5]), .D (n_5), .Y (n_16));
  AOI22X1 g931(.A (n_3), .B (b[5]), .C (b[7]), .D (n_13), .Y (n_14));
  INVX1 g932(.A (n_11), .Y (n_12));
  OR2X1 g933(.A (n_0), .B (b[6]), .Y (n_11));
  OR2X1 g934(.A (n_1), .B (b[9]), .Y (n_10));
  OR2X1 g935(.A (n_6), .B (a[9]), .Y (n_18));
  OR2X1 g936(.A (b[9]), .B (a[9]), .Y (a_new[9]));
  NAND2X1 g937(.A (a[1]), .B (a[0]), .Y (n_8));
  INVX1 g946(.A (b[4]), .Y (n_15));
  INVX1 g943(.A (a[2]), .Y (n_7));
  INVX1 g939(.A (a[3]), .Y (n_25));
  INVX1 g938(.A (b[9]), .Y (n_6));
  INVX1 g942(.A (b[5]), .Y (n_5));
  INVX1 g947(.A (b[6]), .Y (n_4));
  INVX1 g941(.A (a[7]), .Y (n_13));
  INVX1 g944(.A (a[5]), .Y (n_3));
  INVX1 g940(.A (b[8]), .Y (n_2));
  INVX1 g945(.A (a[9]), .Y (n_1));
  INVX1 g948(.A (a[6]), .Y (n_0));
  BUFX2 drc_bufs(.A (n_19), .Y (n_97));
  BUFX2 drc_bufs951(.A (n_16), .Y (n_101));
  BUFX2 drc_bufs954(.A (n_14), .Y (n_105));
  BUFX2 drc_bufs957(.A (n_17), .Y (n_109));
  BUFX2 drc_bufs960(.A (n_8), .Y (n_113));
  INVX1 g3(.A (n_144), .Y (n_117));
  FAX1 g2(.A (n_26), .B (n_25), .C (b[3]), .YC (n_144), .YS
       (UNCONNECTED));
  OAI21X1 g984(.A (n_146), .B (n_30), .C (n_23), .Y (n_147));
  AND2X1 g985(.A (n_29), .B (n_101), .Y (n_146));
endmodule
