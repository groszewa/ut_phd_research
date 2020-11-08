`timescale 1 ns / 100 ps


module ms_es_naive_by2_mul #(parameter DATA_WIDTH=5, parameter NUM_INPUTS=2) (
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
	
	wire [NUM_INPUTS-1:0] sng_ov;
    //wire [NUM_INPUTS-1:0] bs_data_in [1:0];
    wire [1:0]             bs_data_in [NUM_INPUTS-1:0];
   
   
	wire [2**(NUM_INPUTS)-1:0] bs_data_out;
	wire dummy_ov;
   



	genvar i;
	generate
		for(i=0;i<NUM_INPUTS;i++) begin
			if(i==0) begin
				sng_dsc #(.WIDTH(DATA_WIDTH), .STRIDE(2)) sng (
					.clk(clk),
					.rst(rst),
					.en(en),
					.bin_in(bin_data_in[0]),
					.sn_out(bs_data_in[0]),
					.ctr_overflow(sng_ov[0]));
			end else begin
				sng_dsc #(.WIDTH(DATA_WIDTH), .STRIDE(2)) sng (
					.clk(sng_ov[i-1]),
					.rst(rst),
					.en(en),
					.bin_in(bin_data_in[i]),
					.sn_out(bs_data_in[i]),
					.ctr_overflow(sng_ov[i]));
			end
		end
	endgenerate	

    //FIXME
	//assign bs_data_out = &bs_data_in;
    //multiplier circuit calculates (a0+a1)*(b0+b1)=a0b0+a0b1+a1b0+a1b1
    //genvar j;
    //for(i=0;i<2;i++) begin
    //   for(j=0;j<2;j++) begin
    //      assign bs_data_out[{i,j}] = bs_data_in[0][i] & bs_data_in[1][j];
    //   end
    //end
   if (NUM_INPUTS==2) begin
      assign bs_data_out[0] = bs_data_in[0][0] & bs_data_in[1][0];
      assign bs_data_out[1] = bs_data_in[0][0] & bs_data_in[1][1];
      assign bs_data_out[2] = bs_data_in[0][1] & bs_data_in[1][0];
      assign bs_data_out[3] = bs_data_in[0][1] & bs_data_in[1][1];

      par_acc_4lanes  #(.WIDTH(DATA_WIDTH*NUM_INPUTS)) stoch2bin (
        .clk(clk),
        .rst(rst),                                               
        .data_in(bs_data_out),
        .countval(bin_data_out),
        .overflow(dummy_ov));

   end // if (NUM_INPUTS==2)
   else if (NUM_INPUTS==3) begin
      assign bs_data_out[0] = bs_data_in[0][0] & bs_data_in[1][0] & bs_data_in[2][0];
      assign bs_data_out[1] = bs_data_in[0][0] & bs_data_in[1][0] & bs_data_in[2][1];
      assign bs_data_out[2] = bs_data_in[0][0] & bs_data_in[1][1] & bs_data_in[2][0];
      assign bs_data_out[3] = bs_data_in[0][0] & bs_data_in[1][1] & bs_data_in[2][1];   
      assign bs_data_out[4] = bs_data_in[0][1] & bs_data_in[1][0] & bs_data_in[2][0];
      assign bs_data_out[5] = bs_data_in[0][1] & bs_data_in[1][0] & bs_data_in[2][1];
      assign bs_data_out[6] = bs_data_in[0][1] & bs_data_in[1][1] & bs_data_in[2][0];
      assign bs_data_out[7] = bs_data_in[0][1] & bs_data_in[1][1] & bs_data_in[2][1];   
   
      par_acc_8lanes  #(.WIDTH(DATA_WIDTH*NUM_INPUTS)) stoch2bin (
        .clk(clk),
        .rst(rst),                                               
        .data_in(bs_data_out),
        .countval(bin_data_out),
        .overflow(dummy_ov));

   end // if (NUM_INPUTS==3)
   else if (NUM_INPUTS==4) begin
      assign bs_data_out[0]  = bs_data_in[0][0] & bs_data_in[1][0] & bs_data_in[2][0] & bs_data_in[3][0];
      assign bs_data_out[1]  = bs_data_in[0][0] & bs_data_in[1][0] & bs_data_in[2][0] & bs_data_in[3][1];
      assign bs_data_out[2]  = bs_data_in[0][0] & bs_data_in[1][0] & bs_data_in[2][1] & bs_data_in[3][0];
      assign bs_data_out[3]  = bs_data_in[0][0] & bs_data_in[1][0] & bs_data_in[2][1] & bs_data_in[3][1];   
      assign bs_data_out[4]  = bs_data_in[0][0] & bs_data_in[1][1] & bs_data_in[2][0] & bs_data_in[3][0];
      assign bs_data_out[5]  = bs_data_in[0][0] & bs_data_in[1][1] & bs_data_in[2][0] & bs_data_in[3][1];
      assign bs_data_out[6]  = bs_data_in[0][0] & bs_data_in[1][1] & bs_data_in[2][1] & bs_data_in[3][0];
      assign bs_data_out[7]  = bs_data_in[0][0] & bs_data_in[1][1] & bs_data_in[2][1] & bs_data_in[3][1]; 
      assign bs_data_out[8]  = bs_data_in[0][1] & bs_data_in[1][0] & bs_data_in[2][0] & bs_data_in[3][0];
      assign bs_data_out[9]  = bs_data_in[0][1] & bs_data_in[1][0] & bs_data_in[2][0] & bs_data_in[3][1];
      assign bs_data_out[10] = bs_data_in[0][1] & bs_data_in[1][0] & bs_data_in[2][1] & bs_data_in[3][0];
      assign bs_data_out[11] = bs_data_in[0][1] & bs_data_in[1][0] & bs_data_in[2][1] & bs_data_in[3][1];   
      assign bs_data_out[12] = bs_data_in[0][1] & bs_data_in[1][1] & bs_data_in[2][0] & bs_data_in[3][0];
      assign bs_data_out[13] = bs_data_in[0][1] & bs_data_in[1][1] & bs_data_in[2][0] & bs_data_in[3][1];
      assign bs_data_out[14] = bs_data_in[0][1] & bs_data_in[1][1] & bs_data_in[2][1] & bs_data_in[3][0];
      assign bs_data_out[15] = bs_data_in[0][1] & bs_data_in[1][1] & bs_data_in[2][1] & bs_data_in[3][1]; 
  
   
      par_acc_16lanes  #(.WIDTH(DATA_WIDTH*NUM_INPUTS)) stoch2bin (
        .clk(clk),
        .rst(rst),                                               
        .data_in(bs_data_out),
        .countval(bin_data_out),
        .overflow(dummy_ov));

   end // if (NUM_INPUTS==4)
   else if (NUM_INPUTS==5) begin
      assign bs_data_out[0]  = bs_data_in[0][0] & bs_data_in[1][0] & bs_data_in[2][0] & bs_data_in[3][0] & bs_data_in[4][0];
      assign bs_data_out[1]  = bs_data_in[0][0] & bs_data_in[1][0] & bs_data_in[2][0] & bs_data_in[3][0] & bs_data_in[4][1];
      assign bs_data_out[2]  = bs_data_in[0][0] & bs_data_in[1][0] & bs_data_in[2][0] & bs_data_in[3][1] & bs_data_in[4][0];
      assign bs_data_out[3]  = bs_data_in[0][0] & bs_data_in[1][0] & bs_data_in[2][0] & bs_data_in[3][1] & bs_data_in[4][1];   
      assign bs_data_out[4]  = bs_data_in[0][0] & bs_data_in[1][0] & bs_data_in[2][1] & bs_data_in[3][0] & bs_data_in[4][0];
      assign bs_data_out[5]  = bs_data_in[0][0] & bs_data_in[1][0] & bs_data_in[2][1] & bs_data_in[3][0] & bs_data_in[4][1];
      assign bs_data_out[6]  = bs_data_in[0][0] & bs_data_in[1][0] & bs_data_in[2][1] & bs_data_in[3][1] & bs_data_in[4][0];
      assign bs_data_out[7]  = bs_data_in[0][0] & bs_data_in[1][0] & bs_data_in[2][1] & bs_data_in[3][1] & bs_data_in[4][1]; 
      assign bs_data_out[8]  = bs_data_in[0][0] & bs_data_in[1][1] & bs_data_in[2][0] & bs_data_in[3][0] & bs_data_in[4][0];
      assign bs_data_out[9]  = bs_data_in[0][0] & bs_data_in[1][1] & bs_data_in[2][0] & bs_data_in[3][0] & bs_data_in[4][1];
      assign bs_data_out[10] = bs_data_in[0][0] & bs_data_in[1][1] & bs_data_in[2][0] & bs_data_in[3][1] & bs_data_in[4][0];
      assign bs_data_out[11] = bs_data_in[0][0] & bs_data_in[1][1] & bs_data_in[2][0] & bs_data_in[3][1] & bs_data_in[4][1];   
      assign bs_data_out[12] = bs_data_in[0][0] & bs_data_in[1][1] & bs_data_in[2][1] & bs_data_in[3][0] & bs_data_in[4][0];
      assign bs_data_out[13] = bs_data_in[0][0] & bs_data_in[1][1] & bs_data_in[2][1] & bs_data_in[3][0] & bs_data_in[4][1];
      assign bs_data_out[14] = bs_data_in[0][0] & bs_data_in[1][1] & bs_data_in[2][1] & bs_data_in[3][1] & bs_data_in[4][0];
      assign bs_data_out[15] = bs_data_in[0][0] & bs_data_in[1][1] & bs_data_in[2][1] & bs_data_in[3][1] & bs_data_in[4][1];
      assign bs_data_out[16] = bs_data_in[0][1] & bs_data_in[1][0] & bs_data_in[2][0] & bs_data_in[3][0] & bs_data_in[4][0];
      assign bs_data_out[17] = bs_data_in[0][1] & bs_data_in[1][0] & bs_data_in[2][0] & bs_data_in[3][0] & bs_data_in[4][1];
      assign bs_data_out[18] = bs_data_in[0][1] & bs_data_in[1][0] & bs_data_in[2][0] & bs_data_in[3][1] & bs_data_in[4][0];
      assign bs_data_out[19] = bs_data_in[0][1] & bs_data_in[1][0] & bs_data_in[2][0] & bs_data_in[3][1] & bs_data_in[4][1];   
      assign bs_data_out[20] = bs_data_in[0][1] & bs_data_in[1][0] & bs_data_in[2][1] & bs_data_in[3][0] & bs_data_in[4][0];
      assign bs_data_out[21] = bs_data_in[0][1] & bs_data_in[1][0] & bs_data_in[2][1] & bs_data_in[3][0] & bs_data_in[4][1];
      assign bs_data_out[22] = bs_data_in[0][1] & bs_data_in[1][0] & bs_data_in[2][1] & bs_data_in[3][1] & bs_data_in[4][0];
      assign bs_data_out[23] = bs_data_in[0][1] & bs_data_in[1][0] & bs_data_in[2][1] & bs_data_in[3][1] & bs_data_in[4][1]; 
      assign bs_data_out[24] = bs_data_in[0][1] & bs_data_in[1][1] & bs_data_in[2][0] & bs_data_in[3][0] & bs_data_in[4][0];
      assign bs_data_out[25] = bs_data_in[0][1] & bs_data_in[1][1] & bs_data_in[2][0] & bs_data_in[3][0] & bs_data_in[4][1];
      assign bs_data_out[26] = bs_data_in[0][1] & bs_data_in[1][1] & bs_data_in[2][0] & bs_data_in[3][1] & bs_data_in[4][0];
      assign bs_data_out[27] = bs_data_in[0][1] & bs_data_in[1][1] & bs_data_in[2][0] & bs_data_in[3][1] & bs_data_in[4][1];   
      assign bs_data_out[28] = bs_data_in[0][1] & bs_data_in[1][1] & bs_data_in[2][1] & bs_data_in[3][0] & bs_data_in[4][0];
      assign bs_data_out[29] = bs_data_in[0][1] & bs_data_in[1][1] & bs_data_in[2][1] & bs_data_in[3][0] & bs_data_in[4][1];
      assign bs_data_out[30] = bs_data_in[0][1] & bs_data_in[1][1] & bs_data_in[2][1] & bs_data_in[3][1] & bs_data_in[4][0];
      assign bs_data_out[31] = bs_data_in[0][1] & bs_data_in[1][1] & bs_data_in[2][1] & bs_data_in[3][1] & bs_data_in[4][1];
   
      par_acc_32lanes  #(.WIDTH(WXIP1)) stoch2bin (
        .clk(clk),
        .rst(rst),                                               
        .data_in(bs_data_out),
        .countval(bin_data_out),
        .overflow(dummy_ov));

   end // if (NUM_INPUTS==5)
   
                                                            
    //FIXME 
	//assign done = sng_ov[NUM_INPUTS-1];
    assign done = sng_ov[NUM_INPUTS-1] | ~(|bs_data_in[NUM_INPUTS-1]);
    //assign done = sng_ov[NUM_INPUTS-1];
   
   


endmodule //ms_es_naive_by2_mul

