`timescale 1 ns / 100 ps


module es_naive_mul #(parameter DATA_WIDTH=5, parameter NUM_INPUTS=2) (
	clk,
	rst,
	en,
	bin_data_in,
	bin_data_out,
	done);

	input  [DATA_WIDTH-1:0] bin_data_in [NUM_INPUTS-1:0];
	input                   clk,rst,en;

	output [WXIP1-1:0] bin_data_out;
	output                               done;
	
	wire [NUM_INPUTS-1:0] bs_data_in,sng_ov;
	wire bs_data_out;
	wire dummy_ov;



	genvar i;
	generate
		for(i=0;i<NUM_INPUTS;i++) begin
			if(i==0) begin
				sng_dsc #(.WIDTH(DATA_WIDTH), .STRIDE(1)) sng (
					.clk(clk),
					.rst(rst),
					.en(en),
					.bin_in(bin_data_in[0]),
					.sn_out(bs_data_in[0]),
					.ctr_overflow(sng_ov[0]));
			end else begin
				sng_dsc #(.WIDTH(DATA_WIDTH), .STRIDE(1)) sng (
					.clk(sng_ov[i-1]),
					.rst(rst),
					.en(en),
					.bin_in(bin_data_in[i]),
					.sn_out(bs_data_in[i]),
					.ctr_overflow(sng_ov[i]));
			end
		end
	endgenerate	

	assign bs_data_out = &bs_data_in;

	counter #(.WIDTH(WXIP1), .STRIDE(1)) stoch2bin (
		.clk(clk),
		.rst(rst),
		.en(bs_data_out),
		.countval(bin_data_out),
		.overflow(dummy_ov));

	assign done = sng_ov[NUM_INPUTS-1] | ~bs_data_in[NUM_INPUTS-1];


endmodule //dsc_serial_mul

