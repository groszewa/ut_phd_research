`timescale 1 ns / 100 ps


module sc_serial_mul  (
	clk,
	rst,
	en,
	bin_data_in,
	bin_data_out,
	done);

	input  [3:0] bin_data_in [1:0];
	input                   clk,rst,en;

	output [7:0] bin_data_out;
	output                               done;
	
	wire [1:0] bs_data_in,sng_ov;
	wire bs_data_out;
	wire dummy_ov;




    sng_sc_8bit #(.FLAVOR(0)) sng_a (
					.clk(clk),
					.rst(rst),
					.en(en),
					.bin_in(bin_data_in[0]),
					.sn_out(bs_data_in[0]),
					.ctr_overflow(sng_ov[0]));

    sng_sc_8bit #(.FLAVOR(1)) sng_b (
					.clk(clk),
					.rst(rst),
					.en(en),
					.bin_in(bin_data_in[1]),
					.sn_out(bs_data_in[1]),
					.ctr_overflow(sng_ov[1]));
   
                                   
   

	assign bs_data_out = &bs_data_in;

	counter #(.WIDTH(8), .STRIDE(1)) stoch2bin (
		.clk(clk),
		.rst(rst),
		.en(bs_data_out),
		.countval(bin_data_out),
		.overflow(dummy_ov));

	assign done = sng_ov[NUM_INPUTS-1];


endmodule // sc_serial_mul



