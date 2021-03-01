`ifndef __COUNTERS__
`define __COUNTERS__

//basic counter parametrized
module counter #(parameter WIDTH=4, parameter STRIDE=1) (
    clk,
    en,
	rst,
	overflow,
	countval
);

	output reg [WIDTH-1:0] countval;
	output reg             overflow;

	input clk,rst,en;

	always @(posedge clk or posedge rst) begin
		if(rst) begin
		   countval <= 0;
		   overflow <= 0;
		end else if (en) begin
		   countval <= countval + STRIDE;
           if(WIDTH==2 && STRIDE==4) begin
              overflow <= 1;
           end else begin
		      overflow <= (&countval[WIDTH-1:`STRIDE_OVERFLOW_LSB(STRIDE,WIDTH)]);
           end
		end // else if (en)
	end //always
endmodule // counter

//counter which counts by user specified input, do not need stride for this
module counter_input #(parameter WIDTH=4) (
    clk,
    en,
	rst,
    data_in,
	overflow,
	countval
);

	output reg [WIDTH-1:0] countval;
	output reg             overflow;

	input clk,rst,en;
    input [WIDTH-1:0] data_in;
   

	always @(posedge clk or posedge rst) begin
		if(rst) begin
			countval <= 0;
			overflow <= 0;
		end else if (en) begin
			countval <= countval + data_in;
			overflow <= &countval;
		end // else if (en)
	end //always
endmodule // counter_input

//counter which counts by user specified input, do not need stride for this
module counter_input_sat #(parameter WIDTH=4) (
    clk,
    en,
	rst,
    data_in,
	overflow,
	countval
);

   output reg [WIDTH-1:0]  countval;
   output reg              overflow;
   reg [WIDTH:0]           countval_int;
   

   input                   clk,rst,en;
   input [WIDTH-1:0]       data_in;

   

   always @(posedge clk or posedge rst) begin
	  if(rst) begin
		 countval <= 0;
         countval_int <= 0;
		 overflow <= 0;
	  end else if (en) begin
         countval_int <= countval + data_in;
		 countval <= (countval_int[WIDTH]) ? {WIDTH{1'b1}} : countval + data_in;
		 overflow <= &countval;
	  end // else if (en)
   end //always
endmodule // counter_input_sat


`endif
