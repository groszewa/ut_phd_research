`timescale 1 ns / 100 ps

`define SNG_WIDTH 4
`define NUM_INPUTS 2


module cas (
    a,
    b,
    a_new,
    b_new
    );

   input [`SNG_WIDTH-1:0]        a,b;
   output reg [`SNG_WIDTH-1:0]     a_new,b_new;
   
   wire [`SNG_WIDTH:0]       a_sub_b;
   

   
   

   ///always_comb 
   ///  begin
   ///   assign a_sub_b = a - b;
   ///   case (a_sub_b[`SNG_WIDTH-1])
   ///     0 : assign gt_out = a, assign lt_out = b;
   ///     1 : assign gt_out = b, assign lt_out = a;
   ///   endcase // case (a_sub_b[`SNG_WIDTH-1])
   ///   
   ///  end

   assign a_sub_b = a - b;
   

   always @(*) begin
   	//assign a_sub_b = a - b;
   	case (a_sub_b[`SNG_WIDTH])
   	  0 : begin
   	     a_new = a;
   	     b_new = b;       
   	  end
   	  1 : begin
   	     a_new = b;
   	     b_new = a;
   	  end
   	  
   	endcase // case (a_sub_b[`SNG_WIDTH-1])
   end // always @ (*)
   
   
   
   
   
   
endmodule // dsc_mul



               







   