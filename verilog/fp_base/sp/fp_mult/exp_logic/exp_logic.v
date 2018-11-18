`timescale 1 ns / 100 ps

module exp_logic
(
 a_exp,
 b_exp,
 a_mant_iszero,
 b_mant_iszero,
 exp_out
);

   input  [7:0] a_exp,b_exp;
   input        a_mant_iszero,b_mant_iszero;

   output [8:0] exp_out;
   
   
   reg [8:0]    exp_acc;

   wire         a_iszero, b_iszero, a_isinf, b_isinf,a_isnorm,b_isnorm;
   wire         normal_mutex,zero_mutex,inf_mufex;
         



   //assign a_iszero = !(|a_exp) & a_mant_iszero;
   //assign b_iszero = !(|b_exp) & b_mant_iszero;
   //assign a_isinf  = &a_exp;
   //assign b_is_inf = &b_exp;
   //assign a_isnorm = !a_iszero & !a_isinf;
   //assign b_isnorm = !a_iszero & !a_isinf;
   //
   //assign normal_mutex = a_isnorm & b_isnorm;
   //assign zero_mutex   = (a_iszero & b_iszero) | (a_iszero & b_isnorm) | (a_isnorm & b_iszero);
   //assign inf_mutex    = a_isinf | b_isinf;
   //
   //
   //assign exp_out = (zero_mutex & 8'h00) | (inf_mutex & 8'hff) | (normal_mutex & (a_exp+b_exp));
   
   
   
//always @(*) begin
//   if (a_exp == 0) begin
//      assign exp_out = 0;
//   end else if (a_mant_iszero) begin
//      assign exp_out = 8'hff;
//   end
//   
//   
//end // end always
   

always @(*)   
   if ((a_exp == 8'hff)|(b_exp == 8'hff))
     begin
        assign exp_acc = 8'hff;
     end // if all 1's aka inf
   else if ((a_exp == 8'h00 & a_mant_iszero == 1'b1)|(b_exp == 8'h00 & b_mant_iszero))
     begin
        assign exp_acc = 8'h00;
     end // end else if multiply by 0
   else
     begin
        assign exp_acc = a_exp + b_exp;
     end // end else

//always @(*)
//  if(exp_acc[8])
//    begin
//       exp_out = 8'hff;
//    end
//  else
//    begin
//       assign exp_out = exp_acc;
//    end
   
   //if(exp_acc[8])
   //  begin
   //     assign exp_out = 8'hff;
   //  end
   //else
   //  begin
   //     assign exp_out = exp_acc[7:0];
   //  end

   assign exp_out = exp_acc;
   
   
   

endmodule // exp_logic

module exp_adjust
(
 exp_in,
 exp_adj
);

   input [8:0] exp_in;
   output reg [7:0] exp_adj;

   always @(*)
     if(exp_in[8])
       begin
          assign exp_adj =  8'hff;
       end
     else
       begin
          assign exp_adj = exp_in[7:0];
       end
   
endmodule // exp_adjust

     