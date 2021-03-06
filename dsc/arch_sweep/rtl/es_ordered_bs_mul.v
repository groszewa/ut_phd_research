`timescale 1 ns / 100 ps


module es_ordered_bs_mul #(parameter DATA_WIDTH=5, parameter NUM_INPUTS=2, parameter WXIP1=1) (
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
			if(i==0) 
				sng_dsc_max #(.WIDTH(DATA_WIDTH), .NUM_INPUTS(NUM_INPUTS)) sng (
					.clk(clk),
					.rst(rst),
					.en(en),
					.bin_in(bin_data_in),
					.sn_out(bs_data_in[0]),
					.ctr_overflow(sng_ov[0]));
			else if (i==NUM_INPUTS-1) begin
				sng_dsc_min #(.WIDTH(DATA_WIDTH), .NUM_INPUTS(NUM_INPUTS)) sng (
					.clk(sng_ov[i-1]),
					.rst(rst),
					.en(en),
					.bin_in(bin_data_in),
					.sn_out(bs_data_in[i]),
					.ctr_overflow(sng_ov[i]));
			end
            else if (NUM_INPUTS==3) begin
               if(i==1) begin
				sng_dsc_mid_of3 #(.WIDTH(DATA_WIDTH), .NUM_INPUTS(NUM_INPUTS)) sng (
					.clk(sng_ov[i-1]),
					.rst(rst),
					.en(en),
					.bin_in(bin_data_in),
					.sn_out(bs_data_in[i]),
					.ctr_overflow(sng_ov[i]));       
               end // (i==1)
            end // if (NUM_INPUTS==3)
            else if (NUM_INPUTS==4) begin
               if(i==1) begin
  				sng_dsc_second_largest_of4 #(.WIDTH(DATA_WIDTH), .NUM_INPUTS(NUM_INPUTS)) sng (
					.clk(sng_ov[i-1]),
					.rst(rst),
					.en(en),
					.bin_in(bin_data_in),
					.sn_out(bs_data_in[i]),
					.ctr_overflow(sng_ov[i]));       
               end //(i==1)
               if(i==2) begin
 				sng_dsc_second_smallest_of4 #(.WIDTH(DATA_WIDTH), .NUM_INPUTS(NUM_INPUTS)) sng (
					.clk(sng_ov[i-1]),
					.rst(rst),
					.en(en),
					.bin_in(bin_data_in),
					.sn_out(bs_data_in[i]),
					.ctr_overflow(sng_ov[i]));       
               end //(i==2)
            end //(NUM_INPUTS==3)
            else if(NUM_INPUTS==5) begin
               if(i==1) begin
                  sng_dsc_second_largest_of5 #(.WIDTH(DATA_WIDTH), .NUM_INPUTS(NUM_INPUTS)) sng (
					.clk(sng_ov[i-1]),
					.rst(rst),
					.en(en),
					.bin_in(bin_data_in),
					.sn_out(bs_data_in[i]),
					.ctr_overflow(sng_ov[i]));                         
               end
               if(i==2) begin
                  sng_dsc_mid_of5 #(.WIDTH(DATA_WIDTH), .NUM_INPUTS(NUM_INPUTS)) sng (
					.clk(sng_ov[i-1]),
					.rst(rst),
					.en(en),
					.bin_in(bin_data_in),
					.sn_out(bs_data_in[i]),
					.ctr_overflow(sng_ov[i]));                         
               end
               if(i==3) begin
                  sng_dsc_second_smallest_of5 #(.WIDTH(DATA_WIDTH), .NUM_INPUTS(NUM_INPUTS)) sng (
					.clk(sng_ov[i-1]),
					.rst(rst),
					.en(en),
					.bin_in(bin_data_in),
					.sn_out(bs_data_in[i]),
					.ctr_overflow(sng_ov[i]));       
               end
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


endmodule //es_ordered_bs_mul

