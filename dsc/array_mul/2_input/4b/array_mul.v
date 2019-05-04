`timescale 1 ns / 100 ps

`define BITS 4
`define NUM_INPUTS 2

module FA (
  a,
  b,
  cin,
  s,
  cout
);
   input a,b,cin;
   output s,cout;

   wire   xor_int, and0_int, and1_int;

   assign xor_int = a ^ b;
   assign and0_int = xor_int & cin;
   assign and1_int = a & b;
   
   

   assign s = xor_int^cin;
   assign cout = and0_int | and1_int;
   

endmodule // FA

module HA (
  a,
  b,
  s,
  cout
);

   input a,b;
   output s,cout;

   assign s = a ^ b;
   assign cout = a & b;
   

endmodule // HA


module array_mul (
    a,
    b,
    z);

   input  [`BITS-1:0] a,b;
   output [(`NUM_INPUTS*`BITS)-1:0] z;

   wire [`BITS*(`BITS-1)-1:0]       c;
   wire [`BITS*(`BITS-1)-1:0]       s;
   wire                             pp00;
   wire                             pp01;
   wire                             pp02;
   wire                             pp03;
   wire                             pp10;
   wire                             pp11;
   wire                             pp12;
   wire                             pp13;
   wire                             pp20;
   wire                             pp21;
   wire                             pp22;
   wire                             pp23;
   wire                             pp30;
   wire                             pp31;
   wire                             pp32;
   wire                             pp33;

   assign pp00 = a[0] & b[0];
   assign pp01 = a[0] & b[1];
   assign pp02 = a[0] & b[2];
   assign pp03 = a[0] & b[3];
   assign pp10 = a[1] & b[0];
   assign pp11 = a[1] & b[1];
   assign pp12 = a[1] & b[2];
   assign pp13 = a[1] & b[3];
   assign pp20 = a[2] & b[0];
   assign pp21 = a[2] & b[1];
   assign pp22 = a[2] & b[2];
   assign pp23 = a[2] & b[3];
   assign pp30 = a[3] & b[0];
   assign pp31 = a[3] & b[1];
   assign pp32 = a[3] & b[2];
   assign pp33 = a[3] & b[3];
   
   

   assign z[0] = pp00;
   //level0   
   HA ha0 (.a(pp10),.b(pp01),.s(s[0]),.cout(c[0]));
   HA ha1 (.a(pp20),.b(pp11),.s(s[1]),.cout(c[1]));
   HA ha2 (.a(pp30),.b(pp31),.s(s[2]),.cout(c[2]));

   assign z[1] = s[0];
   
   //level1   
   FA fa3 (.a(s[1]),.b(c[0]),.cin(pp02),.s(s[3]),.cout(c[3]));
   FA fa4 (.a(s[2]),.b(c[1]),.cin(pp12),.s(s[4]),.cout(c[4]));
   FA fa5 (.a(pp31),.b(c[2]),.cin(pp22),.s(s[5]),.cout(c[5]));

   assign z[2] = s[3];

   //level2
   FA fa6 (.a(s[4]),.b(c[3]),.cin(pp03),.s(s[6]),.cout(c[6]));
   FA fa7 (.a(s[5]),.b(c[4]),.cin(pp13),.s(s[7]),.cout(c[7]));
   FA fa8 (.a(pp32),.b(c[5]),.cin(pp23),.s(s[8]),.cout(c[8]));

   assign z[3] = s[6];

   //level3 - RCA
   HA ha9 (.a(s[7]),.b(c[6]),            .s(s[9]) ,.cout(c[9]));
   FA fa10(.a(s[8]),.b(c[7]),.cin(c[9]) ,.s(s[10]),.cout(c[10]));
   FA fa11(.a(pp33),.b(c[8]),.cin(c[10]),.s(s[11]),.cout(c[11]));

   assign z[4] = s[9];
   assign z[5] = s[10];
   assign z[6] = s[11];
   assign z[7] = c[11];
   
   
   
   

   



endmodule // dsc_mul

   

   