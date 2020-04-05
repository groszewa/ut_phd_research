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
			overflow <= (&countval[WIDTH-1:`CLOG2(STRIDE)]);
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

`endif
