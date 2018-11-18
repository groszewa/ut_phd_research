`timescale 1 ns / 100 ps


module dadda_24b
(
 a_mant,
 b_mant,
 z
);


   //output port
   output [47:0] z;

   //input ports
   input [23:0] a_mant;
   input [23:0] b_mant;

   //normalization (i.e. include implicit leading 1 or not) done outside this block
   //wire [23:0] a_mant_mod;
   //wire [23:0] b_mant_mod;

   //partial products
   wire [23:0] pp_axb0;
   wire [23:0] pp_axb1; 
   wire [23:0] pp_axb2; 
   wire [23:0] pp_axb3; 
   wire [23:0] pp_axb4; 
   wire [23:0] pp_axb5; 
   wire [23:0] pp_axb6; 
   wire [23:0] pp_axb7; 
   wire [23:0] pp_axb8; 
   wire [23:0] pp_axb9; 
   wire [23:0] pp_axb10;
   wire [23:0] pp_axb11;
   wire [23:0] pp_axb12;
   wire [23:0] pp_axb13;
   wire [23:0] pp_axb14;
   wire [23:0] pp_axb15;
   wire [23:0] pp_axb16;
   wire [23:0] pp_axb17;
   wire [23:0] pp_axb18;
   wire [23:0] pp_axb19;
   wire [23:0] pp_axb20;
   wire [23:0] pp_axb21;
   wire [23:0] pp_axb22;
   wire [23:0] pp_axb23;

   //dummy variables until I get dadda working properly
   wire [47:0] dummy_pp0;
   wire [47:0] dummy_pp1;
   wire [47:0] dummy_pp2;
   wire [47:0] dummy_pp3;
   wire [47:0] dummy_pp4; 
   wire [47:0] dummy_pp5; 
   wire [47:0] dummy_pp6; 
   wire [47:0] dummy_pp7; 
   wire [47:0] dummy_pp8; 
   wire [47:0] dummy_pp9; 
   wire [47:0] dummy_pp10;
   wire [47:0] dummy_pp11;
   wire [47:0] dummy_pp12;
   wire [47:0] dummy_pp13;
   wire [47:0] dummy_pp14;
   wire [47:0] dummy_pp15;
   wire [47:0] dummy_pp16;
   wire [47:0] dummy_pp17;
   wire [47:0] dummy_pp18;
   wire [47:0] dummy_pp19;
   wire [47:0] dummy_pp20;
   wire [47:0] dummy_pp21;
   wire [47:0] dummy_pp22;
   wire [47:0] dummy_pp23;

   gen_pp_array pp_gen0 (
     .a(a_mant),
     .b(b_mant),
     .pp_axb0(pp_axb0), 
     .pp_axb1(pp_axb1), 
     .pp_axb2(pp_axb2), 
     .pp_axb3(pp_axb3), 
     .pp_axb4(pp_axb4), 
     .pp_axb5(pp_axb5), 
     .pp_axb6(pp_axb6), 
     .pp_axb7(pp_axb7), 
     .pp_axb8(pp_axb8), 
     .pp_axb9(pp_axb9), 
     .pp_axb10(pp_axb10),
     .pp_axb11(pp_axb11),
     .pp_axb12(pp_axb12),
     .pp_axb13(pp_axb13),
     .pp_axb14(pp_axb14),
     .pp_axb15(pp_axb15),
     .pp_axb16(pp_axb16),
     .pp_axb17(pp_axb17),
     .pp_axb18(pp_axb18),
     .pp_axb19(pp_axb19),
     .pp_axb20(pp_axb20),
     .pp_axb21(pp_axb21),
     .pp_axb22(pp_axb22),                    
     .pp_axb23(pp_axb23)
     );
 
   
   //dumb version, set up everything to do straight add of all dummy variables
   assign dummy_pp0  = {24'd0,pp_axb0};
   assign dummy_pp1  = {23'd0,pp_axb1,1'd0};
   assign dummy_pp2  = {22'd0,pp_axb2,2'd0};
   assign dummy_pp3  = {21'd0,pp_axb3,3'd0};
   assign dummy_pp4  = {20'd0,pp_axb4,4'd0};
   assign dummy_pp5  = {19'd0,pp_axb5,5'd0};
   assign dummy_pp6  = {18'd0,pp_axb6,6'd0};
   assign dummy_pp7  = {17'd0,pp_axb7,7'd0};
   assign dummy_pp8  = {16'd0,pp_axb8,8'd0};
   assign dummy_pp9  = {15'd0,pp_axb9,9'd0};
   assign dummy_pp10 = {14'd0,pp_axb10,10'd0};
   assign dummy_pp11 = {13'd0,pp_axb11,11'd0};
   assign dummy_pp12 = {12'd0,pp_axb12,12'd0};
   assign dummy_pp13 = {11'd0,pp_axb13,13'd0};
   assign dummy_pp14 = {10'd0,pp_axb14,14'd0};
   assign dummy_pp15 = {9'd0, pp_axb15,15'd0};
   assign dummy_pp16 = {8'd0, pp_axb16,16'd0};
   assign dummy_pp17 = {7'd0, pp_axb17,17'd0};
   assign dummy_pp18 = {6'd0, pp_axb18,18'd0};
   assign dummy_pp19 = {5'd0, pp_axb19,19'd0};
   assign dummy_pp20 = {4'd0, pp_axb20,20'd0};
   assign dummy_pp21 = {3'd0, pp_axb21,21'd0};
   assign dummy_pp22 = {2'd0, pp_axb22,22'd0};
   assign dummy_pp23 = {1'd0, pp_axb23,23'd0};
   
   
   

   //dumb version
   assign z = dummy_pp0 + 
              dummy_pp1 + 
              dummy_pp2 +
              dummy_pp3 +
              dummy_pp4 +
              dummy_pp5 +
              dummy_pp6 +
              dummy_pp7 +
              dummy_pp8 +
              dummy_pp9 +
              dummy_pp10 +
              dummy_pp11 +
              dummy_pp12 +
              dummy_pp13 +
              dummy_pp14 +
              dummy_pp15 +
              dummy_pp16 +
              dummy_pp17 +
              dummy_pp18 +
              dummy_pp19 +
              dummy_pp20 +
              dummy_pp21 +
              dummy_pp22 +
              dummy_pp23;
   
   
   
   
   
   

endmodule // dadda_23b

module gen_pp_array
(
 a,
 b,
 pp_axb0,
 pp_axb1,
 pp_axb2,
 pp_axb3,
 pp_axb4,
 pp_axb5,
 pp_axb6,
 pp_axb7,
 pp_axb8,
 pp_axb9,
 pp_axb10,
 pp_axb11,
 pp_axb12,
 pp_axb13,
 pp_axb14,
 pp_axb15,
 pp_axb16,
 pp_axb17,
 pp_axb18,
 pp_axb19,
 pp_axb20,
 pp_axb21,
 pp_axb22,
 pp_axb23 
 );
   

   input [23:0] a;
   input [23:0] b;
   

   //shift these over to match spreadsheet (start from 1 rather than 0
   output [23:0] pp_axb0;   
   output [23:0] pp_axb1;
   output [23:0] pp_axb2; 
   output [23:0] pp_axb3; 
   output [23:0] pp_axb4; 
   output [23:0] pp_axb5; 
   output [23:0] pp_axb6; 
   output [23:0] pp_axb7; 
   output [23:0] pp_axb8; 
   output [23:0] pp_axb9; 
   output [23:0] pp_axb10;
   output [23:0] pp_axb11;
   output [23:0] pp_axb12;
   output [23:0] pp_axb13;
   output [23:0] pp_axb14;
   output [23:0] pp_axb15;
   output [23:0] pp_axb16;
   output [23:0] pp_axb17;
   output [23:0] pp_axb18;
   output [23:0] pp_axb19;
   output [23:0] pp_axb20;
   output [23:0] pp_axb21;
   output [23:0] pp_axb22;
   output [23:0] pp_axb23;
   
 
   
   

//   always @(a or b)
//   begin
//     for(i=0;i<24;i=i+1)
//        begin
//           pp_a0b[i]  <= a[0] & b[i];
//           pp_a1b[i]  <= a[1] & b[i];
//           pp_a2b[i]  <= a[2] & b[i];
//           pp_a3b[i]  <= a[3] & b[i];
//           pp_a4b[i]  <= a[4] & b[i];
//           pp_a5b[i]  <= a[5] & b[i];
//           pp_a6b[i]  <= a[6] & b[i];
//           pp_a7b[i]  <= a[7] & b[i];
//           pp_a8b[i]  <= a[8] & b[i];
//           pp_a9b[i]  <= a[9] & b[i];
//           pp_a10b[i] <= a[10] & b[i];
//           pp_a11b[i] <= a[11] & b[i];
//           pp_a12b[i] <= a[12] & b[i];
//           pp_a13b[i] <= a[13] & b[i];
//           pp_a14b[i] <= a[14] & b[i];
//           pp_a15b[i] <= a[15] & b[i];
//           pp_a16b[i] <= a[16] & b[i];
//           pp_a17b[i] <= a[17] & b[i];
//           pp_a18b[i] <= a[18] & b[i];
//           pp_a19b[i] <= a[19] & b[i];
//           pp_a20b[i] <= a[20] & b[i];
//           pp_a21b[i] <= a[21] & b[i];
//           pp_a22b[i] <= a[22] & b[i];
//           pp_a23b[i] <= a[23] & b[i];
//     	end // for i
//     end // always

   assign pp_axb0  = a & {24{b[0]}};
   assign pp_axb1  = a & {24{b[1]}}; 
   assign pp_axb2  = a & {24{b[2]}}; 
   assign pp_axb3  = a & {24{b[3]}}; 
   assign pp_axb4  = a & {24{b[4]}}; 
   assign pp_axb5  = a & {24{b[5]}}; 
   assign pp_axb6  = a & {24{b[6]}}; 
   assign pp_axb7  = a & {24{b[7]}}; 
   assign pp_axb8  = a & {24{b[8]}}; 
   assign pp_axb9  = a & {24{b[9]}}; 
   assign pp_axb10 = a & {24{b[10]}};
   assign pp_axb11 = a & {24{b[11]}};
   assign pp_axb12 = a & {24{b[12]}};
   assign pp_axb13 = a & {24{b[13]}};
   assign pp_axb14 = a & {24{b[14]}};
   assign pp_axb15 = a & {24{b[15]}};
   assign pp_axb16 = a & {24{b[16]}};
   assign pp_axb17 = a & {24{b[17]}};
   assign pp_axb18 = a & {24{b[18]}};
   assign pp_axb19 = a & {24{b[19]}};
   assign pp_axb20 = a & {24{b[20]}};
   assign pp_axb21 = a & {24{b[21]}};
   assign pp_axb22 = a & {24{b[22]}};
   assign pp_axb23 = a & {24{b[23]}};

   
endmodule // gen_pp_array



module fa
(
 a,
 b,
 cin,
 s,
 cout
);

   input a,b,cin;
   output s,cout;

   assign s = a^b^cin;
   assign cout = a&b | a&cin | b&cin;
   

endmodule // fa

module ha
(
 a,
 b,
 s,
 cout
);

   input a,b;
   output s,cout;

   assign s = a^b;
   assign cout = a&b;
   

endmodule // ha

   
   


  

   
   