`ifndef __ADDERS__
`define __ADDERS__

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

`endif
