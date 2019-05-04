`timescale 1 ns / 100 ps

`define SNG_WIDTH 6
`define NUM_INPUTS 3

module cas3 (
   a,
   b,
   c,
   a_new,
   b_new,
   c_new,
   );
   
   input [`SNG_WIDTH-1:0]        a,b,c;
   output [`SNG_WIDTH-1:0]     a_new,b_new,c_new;

   wire [`SNG_WIDTH-1:0]           max1, min1, max2, min2, max3, min3;
   
   cas cas1(.a(a),.b(b),.a_new(max1),.b_new(min1));
   
   cas cas2(.a(min1),.b(c),.a_new(max2),.b_new(min2));
   
   cas cas3(.a(max1),.b(max2),.a_new(max3),.b_new(min3));
   

   assign a_new = max3;
   assign b_new = min3;
   assign c_new = min2;
   

   
   
endmodule // cas3




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



               







   