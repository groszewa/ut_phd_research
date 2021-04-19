`timescale 1 ns / 100 ps


module ms_es_naive_by4_mul #(parameter DATA_WIDTH=5, parameter NUM_INPUTS=2, parameter WXIP1=1) (
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
    wire [3:0]             bs_data_in [NUM_INPUTS-1:0];
   
   
	wire [4**(NUM_INPUTS)-1:0] bs_data_out;
	wire dummy_ov;
   



	genvar i;
	generate
		for(i=0;i<NUM_INPUTS;i++) begin
			if(i==0) begin
				sng_dsc #(.WIDTH(DATA_WIDTH), .STRIDE(4)) sng (
					.clk(clk),
					.rst(rst),
					.en(en),
					.bin_in(bin_data_in[0]),
					.sn_out(bs_data_in[0]),
					.ctr_overflow(sng_ov[0]));
			end else begin
				sng_dsc #(.WIDTH(DATA_WIDTH), .STRIDE(4)) sng (
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
      assign bs_data_out[0]  = bs_data_in[0][0] & bs_data_in[1][0];
      assign bs_data_out[1]  = bs_data_in[0][0] & bs_data_in[1][1];
      assign bs_data_out[2]  = bs_data_in[0][0] & bs_data_in[1][2];
      assign bs_data_out[3]  = bs_data_in[0][0] & bs_data_in[1][3];
      assign bs_data_out[4]  = bs_data_in[0][1] & bs_data_in[1][0];
      assign bs_data_out[5]  = bs_data_in[0][1] & bs_data_in[1][1];
      assign bs_data_out[6]  = bs_data_in[0][1] & bs_data_in[1][2];
      assign bs_data_out[7]  = bs_data_in[0][1] & bs_data_in[1][3];
      assign bs_data_out[8]  = bs_data_in[0][2] & bs_data_in[1][0];
      assign bs_data_out[9]  = bs_data_in[0][2] & bs_data_in[1][1];
      assign bs_data_out[10] = bs_data_in[0][2] & bs_data_in[1][2];
      assign bs_data_out[11] = bs_data_in[0][2] & bs_data_in[1][3];
      assign bs_data_out[12] = bs_data_in[0][3] & bs_data_in[1][0];
      assign bs_data_out[13] = bs_data_in[0][3] & bs_data_in[1][1];
      assign bs_data_out[14] = bs_data_in[0][3] & bs_data_in[1][2];
      assign bs_data_out[15] = bs_data_in[0][3] & bs_data_in[1][3];
      

      par_acc_16lanes  #(.WIDTH(DATA_WIDTH*NUM_INPUTS)) stoch2bin (
        .clk(clk),
        .rst(rst),                                               
        .data_in(bs_data_out),
        .countval(bin_data_out),
        .overflow(dummy_ov));

   end // if (NUM_INPUTS==2)
   else if (NUM_INPUTS==3) begin //FIXME
      assign bs_data_out[0]  = bs_data_in[0][0] & bs_data_in[1][0] & bs_data_in[2][0];
      assign bs_data_out[1]  = bs_data_in[0][0] & bs_data_in[1][0] & bs_data_in[2][1];
      assign bs_data_out[2]  = bs_data_in[0][0] & bs_data_in[1][0] & bs_data_in[2][2];
      assign bs_data_out[3]  = bs_data_in[0][0] & bs_data_in[1][0] & bs_data_in[2][3];
      assign bs_data_out[4]  = bs_data_in[0][0] & bs_data_in[1][1] & bs_data_in[2][0];
      assign bs_data_out[5]  = bs_data_in[0][0] & bs_data_in[1][1] & bs_data_in[2][1];
      assign bs_data_out[6]  = bs_data_in[0][0] & bs_data_in[1][1] & bs_data_in[2][2];
      assign bs_data_out[7]  = bs_data_in[0][0] & bs_data_in[1][1] & bs_data_in[2][3];
      assign bs_data_out[8]  = bs_data_in[0][0] & bs_data_in[1][2] & bs_data_in[2][0];
      assign bs_data_out[9]  = bs_data_in[0][0] & bs_data_in[1][2] & bs_data_in[2][1];
      assign bs_data_out[10] = bs_data_in[0][0] & bs_data_in[1][2] & bs_data_in[2][2];
      assign bs_data_out[11] = bs_data_in[0][0] & bs_data_in[1][2] & bs_data_in[2][3];
      assign bs_data_out[12] = bs_data_in[0][0] & bs_data_in[1][3] & bs_data_in[2][0];
      assign bs_data_out[13] = bs_data_in[0][0] & bs_data_in[1][3] & bs_data_in[2][1];
      assign bs_data_out[14] = bs_data_in[0][0] & bs_data_in[1][3] & bs_data_in[2][2];
      assign bs_data_out[15] = bs_data_in[0][0] & bs_data_in[1][3] & bs_data_in[2][3];
      assign bs_data_out[16] = bs_data_in[0][1] & bs_data_in[1][0] & bs_data_in[2][0];
      assign bs_data_out[17] = bs_data_in[0][1] & bs_data_in[1][0] & bs_data_in[2][1];
      assign bs_data_out[18] = bs_data_in[0][1] & bs_data_in[1][0] & bs_data_in[2][2];
      assign bs_data_out[19] = bs_data_in[0][1] & bs_data_in[1][0] & bs_data_in[2][3];
      assign bs_data_out[20] = bs_data_in[0][1] & bs_data_in[1][1] & bs_data_in[2][0];
      assign bs_data_out[21] = bs_data_in[0][1] & bs_data_in[1][1] & bs_data_in[2][1];
      assign bs_data_out[22] = bs_data_in[0][1] & bs_data_in[1][1] & bs_data_in[2][2];
      assign bs_data_out[23] = bs_data_in[0][1] & bs_data_in[1][1] & bs_data_in[2][3];
      assign bs_data_out[24] = bs_data_in[0][1] & bs_data_in[1][2] & bs_data_in[2][0];
      assign bs_data_out[25] = bs_data_in[0][1] & bs_data_in[1][2] & bs_data_in[2][1];
      assign bs_data_out[26] = bs_data_in[0][1] & bs_data_in[1][2] & bs_data_in[2][2];
      assign bs_data_out[27] = bs_data_in[0][1] & bs_data_in[1][2] & bs_data_in[2][3];
      assign bs_data_out[28] = bs_data_in[0][1] & bs_data_in[1][3] & bs_data_in[2][0];
      assign bs_data_out[29] = bs_data_in[0][1] & bs_data_in[1][3] & bs_data_in[2][1];
      assign bs_data_out[30] = bs_data_in[0][1] & bs_data_in[1][3] & bs_data_in[2][2];
      assign bs_data_out[31] = bs_data_in[0][1] & bs_data_in[1][3] & bs_data_in[2][3];
      assign bs_data_out[32] = bs_data_in[0][2] & bs_data_in[1][0] & bs_data_in[2][0];
      assign bs_data_out[33] = bs_data_in[0][2] & bs_data_in[1][0] & bs_data_in[2][1];
      assign bs_data_out[34] = bs_data_in[0][2] & bs_data_in[1][0] & bs_data_in[2][2];
      assign bs_data_out[35] = bs_data_in[0][2] & bs_data_in[1][0] & bs_data_in[2][3];
      assign bs_data_out[36] = bs_data_in[0][2] & bs_data_in[1][1] & bs_data_in[2][0];
      assign bs_data_out[37] = bs_data_in[0][2] & bs_data_in[1][1] & bs_data_in[2][1];
      assign bs_data_out[38] = bs_data_in[0][2] & bs_data_in[1][1] & bs_data_in[2][2];
      assign bs_data_out[39] = bs_data_in[0][2] & bs_data_in[1][1] & bs_data_in[2][3];
      assign bs_data_out[40] = bs_data_in[0][2] & bs_data_in[1][2] & bs_data_in[2][0];
      assign bs_data_out[41] = bs_data_in[0][2] & bs_data_in[1][2] & bs_data_in[2][1];
      assign bs_data_out[42] = bs_data_in[0][2] & bs_data_in[1][2] & bs_data_in[2][2];
      assign bs_data_out[43] = bs_data_in[0][2] & bs_data_in[1][2] & bs_data_in[2][3];
      assign bs_data_out[44] = bs_data_in[0][2] & bs_data_in[1][3] & bs_data_in[2][0];
      assign bs_data_out[45] = bs_data_in[0][2] & bs_data_in[1][3] & bs_data_in[2][1];
      assign bs_data_out[46] = bs_data_in[0][2] & bs_data_in[1][3] & bs_data_in[2][2];
      assign bs_data_out[47] = bs_data_in[0][2] & bs_data_in[1][3] & bs_data_in[2][3];
      assign bs_data_out[48] = bs_data_in[0][3] & bs_data_in[1][0] & bs_data_in[2][0];
      assign bs_data_out[49] = bs_data_in[0][3] & bs_data_in[1][0] & bs_data_in[2][1];
      assign bs_data_out[50] = bs_data_in[0][3] & bs_data_in[1][0] & bs_data_in[2][2];
      assign bs_data_out[51] = bs_data_in[0][3] & bs_data_in[1][0] & bs_data_in[2][3];
      assign bs_data_out[52] = bs_data_in[0][3] & bs_data_in[1][1] & bs_data_in[2][0];
      assign bs_data_out[53] = bs_data_in[0][3] & bs_data_in[1][1] & bs_data_in[2][1];
      assign bs_data_out[54] = bs_data_in[0][3] & bs_data_in[1][1] & bs_data_in[2][2];
      assign bs_data_out[55] = bs_data_in[0][3] & bs_data_in[1][1] & bs_data_in[2][3];
      assign bs_data_out[56] = bs_data_in[0][3] & bs_data_in[1][2] & bs_data_in[2][0];
      assign bs_data_out[57] = bs_data_in[0][3] & bs_data_in[1][2] & bs_data_in[2][1];
      assign bs_data_out[58] = bs_data_in[0][3] & bs_data_in[1][2] & bs_data_in[2][2];
      assign bs_data_out[59] = bs_data_in[0][3] & bs_data_in[1][2] & bs_data_in[2][3];
      assign bs_data_out[60] = bs_data_in[0][3] & bs_data_in[1][3] & bs_data_in[2][0];
      assign bs_data_out[61] = bs_data_in[0][3] & bs_data_in[1][3] & bs_data_in[2][1];
      assign bs_data_out[62] = bs_data_in[0][3] & bs_data_in[1][3] & bs_data_in[2][2];
      assign bs_data_out[63] = bs_data_in[0][3] & bs_data_in[1][3] & bs_data_in[2][3];
  
      par_acc_64lanes  #(.WIDTH(DATA_WIDTH*NUM_INPUTS)) stoch2bin (
        .clk(clk),
        .rst(rst),                                               
        .data_in(bs_data_out),
        .countval(bin_data_out),
        .overflow(dummy_ov));

   end // if (NUM_INPUTS==3)
   else if (NUM_INPUTS==4) begin //FIXME
      assign bs_data_out[0]   = bs_data_in[0][0] & bs_data_in[1][0] & bs_data_in[2][0] & bs_data_in[3][0];
      assign bs_data_out[1]   = bs_data_in[0][0] & bs_data_in[1][0] & bs_data_in[2][0] & bs_data_in[3][1];
      assign bs_data_out[2]   = bs_data_in[0][0] & bs_data_in[1][0] & bs_data_in[2][0] & bs_data_in[3][2];
      assign bs_data_out[3]   = bs_data_in[0][0] & bs_data_in[1][0] & bs_data_in[2][0] & bs_data_in[3][3];
      assign bs_data_out[4]   = bs_data_in[0][0] & bs_data_in[1][0] & bs_data_in[2][1] & bs_data_in[3][0];
      assign bs_data_out[5]   = bs_data_in[0][0] & bs_data_in[1][0] & bs_data_in[2][1] & bs_data_in[3][1];
      assign bs_data_out[6]   = bs_data_in[0][0] & bs_data_in[1][0] & bs_data_in[2][1] & bs_data_in[3][2];
      assign bs_data_out[7]   = bs_data_in[0][0] & bs_data_in[1][0] & bs_data_in[2][1] & bs_data_in[3][3];
      assign bs_data_out[8]   = bs_data_in[0][0] & bs_data_in[1][0] & bs_data_in[2][2] & bs_data_in[3][0];
      assign bs_data_out[9]   = bs_data_in[0][0] & bs_data_in[1][0] & bs_data_in[2][2] & bs_data_in[3][1];
      assign bs_data_out[10]  = bs_data_in[0][0] & bs_data_in[1][0] & bs_data_in[2][2] & bs_data_in[3][2];
      assign bs_data_out[11]  = bs_data_in[0][0] & bs_data_in[1][0] & bs_data_in[2][2] & bs_data_in[3][3];
      assign bs_data_out[12]  = bs_data_in[0][0] & bs_data_in[1][0] & bs_data_in[2][3] & bs_data_in[3][0];
      assign bs_data_out[13]  = bs_data_in[0][0] & bs_data_in[1][0] & bs_data_in[2][3] & bs_data_in[3][1];
      assign bs_data_out[14]  = bs_data_in[0][0] & bs_data_in[1][0] & bs_data_in[2][3] & bs_data_in[3][2];
      assign bs_data_out[15]  = bs_data_in[0][0] & bs_data_in[1][0] & bs_data_in[2][3] & bs_data_in[3][3];
      assign bs_data_out[16]  = bs_data_in[0][0] & bs_data_in[1][1] & bs_data_in[2][0] & bs_data_in[3][0];
      assign bs_data_out[17]  = bs_data_in[0][0] & bs_data_in[1][1] & bs_data_in[2][0] & bs_data_in[3][1];
      assign bs_data_out[18]  = bs_data_in[0][0] & bs_data_in[1][1] & bs_data_in[2][0] & bs_data_in[3][2];
      assign bs_data_out[19]  = bs_data_in[0][0] & bs_data_in[1][1] & bs_data_in[2][0] & bs_data_in[3][3];
      assign bs_data_out[20]  = bs_data_in[0][0] & bs_data_in[1][1] & bs_data_in[2][1] & bs_data_in[3][0];
      assign bs_data_out[21]  = bs_data_in[0][0] & bs_data_in[1][1] & bs_data_in[2][1] & bs_data_in[3][1];
      assign bs_data_out[22]  = bs_data_in[0][0] & bs_data_in[1][1] & bs_data_in[2][1] & bs_data_in[3][2];
      assign bs_data_out[23]  = bs_data_in[0][0] & bs_data_in[1][1] & bs_data_in[2][1] & bs_data_in[3][3];
      assign bs_data_out[24]  = bs_data_in[0][0] & bs_data_in[1][1] & bs_data_in[2][2] & bs_data_in[3][0];
      assign bs_data_out[25]  = bs_data_in[0][0] & bs_data_in[1][1] & bs_data_in[2][2] & bs_data_in[3][1];
      assign bs_data_out[26]  = bs_data_in[0][0] & bs_data_in[1][1] & bs_data_in[2][2] & bs_data_in[3][2];
      assign bs_data_out[27]  = bs_data_in[0][0] & bs_data_in[1][1] & bs_data_in[2][2] & bs_data_in[3][3];
      assign bs_data_out[28]  = bs_data_in[0][0] & bs_data_in[1][1] & bs_data_in[2][3] & bs_data_in[3][0];
      assign bs_data_out[29]  = bs_data_in[0][0] & bs_data_in[1][1] & bs_data_in[2][3] & bs_data_in[3][1];
      assign bs_data_out[30]  = bs_data_in[0][0] & bs_data_in[1][1] & bs_data_in[2][3] & bs_data_in[3][2];
      assign bs_data_out[31]  = bs_data_in[0][0] & bs_data_in[1][1] & bs_data_in[2][3] & bs_data_in[3][3];
      assign bs_data_out[32]  = bs_data_in[0][0] & bs_data_in[1][2] & bs_data_in[2][0] & bs_data_in[3][0];
      assign bs_data_out[33]  = bs_data_in[0][0] & bs_data_in[1][2] & bs_data_in[2][0] & bs_data_in[3][1];
      assign bs_data_out[34]  = bs_data_in[0][0] & bs_data_in[1][2] & bs_data_in[2][0] & bs_data_in[3][2];
      assign bs_data_out[35]  = bs_data_in[0][0] & bs_data_in[1][2] & bs_data_in[2][0] & bs_data_in[3][3];
      assign bs_data_out[36]  = bs_data_in[0][0] & bs_data_in[1][2] & bs_data_in[2][1] & bs_data_in[3][0];
      assign bs_data_out[37]  = bs_data_in[0][0] & bs_data_in[1][2] & bs_data_in[2][1] & bs_data_in[3][1];
      assign bs_data_out[38]  = bs_data_in[0][0] & bs_data_in[1][2] & bs_data_in[2][1] & bs_data_in[3][2];
      assign bs_data_out[39]  = bs_data_in[0][0] & bs_data_in[1][2] & bs_data_in[2][1] & bs_data_in[3][3];
      assign bs_data_out[40]  = bs_data_in[0][0] & bs_data_in[1][2] & bs_data_in[2][2] & bs_data_in[3][0];
      assign bs_data_out[41]  = bs_data_in[0][0] & bs_data_in[1][2] & bs_data_in[2][2] & bs_data_in[3][1];
      assign bs_data_out[42]  = bs_data_in[0][0] & bs_data_in[1][2] & bs_data_in[2][2] & bs_data_in[3][2];
      assign bs_data_out[43]  = bs_data_in[0][0] & bs_data_in[1][2] & bs_data_in[2][2] & bs_data_in[3][3];
      assign bs_data_out[44]  = bs_data_in[0][0] & bs_data_in[1][2] & bs_data_in[2][3] & bs_data_in[3][0];
      assign bs_data_out[45]  = bs_data_in[0][0] & bs_data_in[1][2] & bs_data_in[2][3] & bs_data_in[3][1];
      assign bs_data_out[46]  = bs_data_in[0][0] & bs_data_in[1][2] & bs_data_in[2][3] & bs_data_in[3][2];
      assign bs_data_out[47]  = bs_data_in[0][0] & bs_data_in[1][2] & bs_data_in[2][3] & bs_data_in[3][3];
      assign bs_data_out[48]  = bs_data_in[0][0] & bs_data_in[1][3] & bs_data_in[2][0] & bs_data_in[3][0];
      assign bs_data_out[49]  = bs_data_in[0][0] & bs_data_in[1][3] & bs_data_in[2][0] & bs_data_in[3][1];
      assign bs_data_out[50]  = bs_data_in[0][0] & bs_data_in[1][3] & bs_data_in[2][0] & bs_data_in[3][2];
      assign bs_data_out[51]  = bs_data_in[0][0] & bs_data_in[1][3] & bs_data_in[2][0] & bs_data_in[3][3];
      assign bs_data_out[52]  = bs_data_in[0][0] & bs_data_in[1][3] & bs_data_in[2][1] & bs_data_in[3][0];
      assign bs_data_out[53]  = bs_data_in[0][0] & bs_data_in[1][3] & bs_data_in[2][1] & bs_data_in[3][1];
      assign bs_data_out[54]  = bs_data_in[0][0] & bs_data_in[1][3] & bs_data_in[2][1] & bs_data_in[3][2];
      assign bs_data_out[55]  = bs_data_in[0][0] & bs_data_in[1][3] & bs_data_in[2][1] & bs_data_in[3][3];
      assign bs_data_out[56]  = bs_data_in[0][0] & bs_data_in[1][3] & bs_data_in[2][2] & bs_data_in[3][0];
      assign bs_data_out[57]  = bs_data_in[0][0] & bs_data_in[1][3] & bs_data_in[2][2] & bs_data_in[3][1];
      assign bs_data_out[58]  = bs_data_in[0][0] & bs_data_in[1][3] & bs_data_in[2][2] & bs_data_in[3][2];
      assign bs_data_out[59]  = bs_data_in[0][0] & bs_data_in[1][3] & bs_data_in[2][2] & bs_data_in[3][3];
      assign bs_data_out[60]  = bs_data_in[0][0] & bs_data_in[1][3] & bs_data_in[2][3] & bs_data_in[3][0];
      assign bs_data_out[61]  = bs_data_in[0][0] & bs_data_in[1][3] & bs_data_in[2][3] & bs_data_in[3][1];
      assign bs_data_out[62]  = bs_data_in[0][0] & bs_data_in[1][3] & bs_data_in[2][3] & bs_data_in[3][2];
      assign bs_data_out[63]  = bs_data_in[0][0] & bs_data_in[1][3] & bs_data_in[2][3] & bs_data_in[3][3];
      assign bs_data_out[64]  = bs_data_in[0][1] & bs_data_in[1][0] & bs_data_in[2][0] & bs_data_in[3][0];
      assign bs_data_out[65]  = bs_data_in[0][1] & bs_data_in[1][0] & bs_data_in[2][0] & bs_data_in[3][1];
      assign bs_data_out[66]  = bs_data_in[0][1] & bs_data_in[1][0] & bs_data_in[2][0] & bs_data_in[3][2];
      assign bs_data_out[67]  = bs_data_in[0][1] & bs_data_in[1][0] & bs_data_in[2][0] & bs_data_in[3][3];
      assign bs_data_out[68]  = bs_data_in[0][1] & bs_data_in[1][0] & bs_data_in[2][1] & bs_data_in[3][0];
      assign bs_data_out[69]  = bs_data_in[0][1] & bs_data_in[1][0] & bs_data_in[2][1] & bs_data_in[3][1];
      assign bs_data_out[70]  = bs_data_in[0][1] & bs_data_in[1][0] & bs_data_in[2][1] & bs_data_in[3][2];
      assign bs_data_out[71]  = bs_data_in[0][1] & bs_data_in[1][0] & bs_data_in[2][1] & bs_data_in[3][3];
      assign bs_data_out[72]  = bs_data_in[0][1] & bs_data_in[1][0] & bs_data_in[2][2] & bs_data_in[3][0];
      assign bs_data_out[73]  = bs_data_in[0][1] & bs_data_in[1][0] & bs_data_in[2][2] & bs_data_in[3][1];
      assign bs_data_out[74]  = bs_data_in[0][1] & bs_data_in[1][0] & bs_data_in[2][2] & bs_data_in[3][2];
      assign bs_data_out[75]  = bs_data_in[0][1] & bs_data_in[1][0] & bs_data_in[2][2] & bs_data_in[3][3];
      assign bs_data_out[76]  = bs_data_in[0][1] & bs_data_in[1][0] & bs_data_in[2][3] & bs_data_in[3][0];
      assign bs_data_out[77]  = bs_data_in[0][1] & bs_data_in[1][0] & bs_data_in[2][3] & bs_data_in[3][1];
      assign bs_data_out[78]  = bs_data_in[0][1] & bs_data_in[1][0] & bs_data_in[2][3] & bs_data_in[3][2];
      assign bs_data_out[79]  = bs_data_in[0][1] & bs_data_in[1][0] & bs_data_in[2][3] & bs_data_in[3][3];
      assign bs_data_out[80]  = bs_data_in[0][1] & bs_data_in[1][1] & bs_data_in[2][0] & bs_data_in[3][0];
      assign bs_data_out[81]  = bs_data_in[0][1] & bs_data_in[1][1] & bs_data_in[2][0] & bs_data_in[3][1];
      assign bs_data_out[82]  = bs_data_in[0][1] & bs_data_in[1][1] & bs_data_in[2][0] & bs_data_in[3][2];
      assign bs_data_out[83]  = bs_data_in[0][1] & bs_data_in[1][1] & bs_data_in[2][0] & bs_data_in[3][3];
      assign bs_data_out[84]  = bs_data_in[0][1] & bs_data_in[1][1] & bs_data_in[2][1] & bs_data_in[3][0];
      assign bs_data_out[85]  = bs_data_in[0][1] & bs_data_in[1][1] & bs_data_in[2][1] & bs_data_in[3][1];
      assign bs_data_out[86]  = bs_data_in[0][1] & bs_data_in[1][1] & bs_data_in[2][1] & bs_data_in[3][2];
      assign bs_data_out[87]  = bs_data_in[0][1] & bs_data_in[1][1] & bs_data_in[2][1] & bs_data_in[3][3];
      assign bs_data_out[88]  = bs_data_in[0][1] & bs_data_in[1][1] & bs_data_in[2][2] & bs_data_in[3][0];
      assign bs_data_out[89]  = bs_data_in[0][1] & bs_data_in[1][1] & bs_data_in[2][2] & bs_data_in[3][1];
      assign bs_data_out[90]  = bs_data_in[0][1] & bs_data_in[1][1] & bs_data_in[2][2] & bs_data_in[3][2];
      assign bs_data_out[91]  = bs_data_in[0][1] & bs_data_in[1][1] & bs_data_in[2][2] & bs_data_in[3][3];
      assign bs_data_out[92]  = bs_data_in[0][1] & bs_data_in[1][1] & bs_data_in[2][3] & bs_data_in[3][0];
      assign bs_data_out[93]  = bs_data_in[0][1] & bs_data_in[1][1] & bs_data_in[2][3] & bs_data_in[3][1];
      assign bs_data_out[94]  = bs_data_in[0][1] & bs_data_in[1][1] & bs_data_in[2][3] & bs_data_in[3][2];
      assign bs_data_out[95]  = bs_data_in[0][1] & bs_data_in[1][1] & bs_data_in[2][3] & bs_data_in[3][3];
      assign bs_data_out[96]  = bs_data_in[0][1] & bs_data_in[1][2] & bs_data_in[2][0] & bs_data_in[3][0];
      assign bs_data_out[97]  = bs_data_in[0][1] & bs_data_in[1][2] & bs_data_in[2][0] & bs_data_in[3][1];
      assign bs_data_out[98]  = bs_data_in[0][1] & bs_data_in[1][2] & bs_data_in[2][0] & bs_data_in[3][2];
      assign bs_data_out[99]  = bs_data_in[0][1] & bs_data_in[1][2] & bs_data_in[2][0] & bs_data_in[3][3];
      assign bs_data_out[100] = bs_data_in[0][1] & bs_data_in[1][2] & bs_data_in[2][1] & bs_data_in[3][0];
      assign bs_data_out[101] = bs_data_in[0][1] & bs_data_in[1][2] & bs_data_in[2][1] & bs_data_in[3][1];
      assign bs_data_out[102] = bs_data_in[0][1] & bs_data_in[1][2] & bs_data_in[2][1] & bs_data_in[3][2];
      assign bs_data_out[103] = bs_data_in[0][1] & bs_data_in[1][2] & bs_data_in[2][1] & bs_data_in[3][3];
      assign bs_data_out[104] = bs_data_in[0][1] & bs_data_in[1][2] & bs_data_in[2][2] & bs_data_in[3][0];
      assign bs_data_out[105] = bs_data_in[0][1] & bs_data_in[1][2] & bs_data_in[2][2] & bs_data_in[3][1];
      assign bs_data_out[106] = bs_data_in[0][1] & bs_data_in[1][2] & bs_data_in[2][2] & bs_data_in[3][2];
      assign bs_data_out[107] = bs_data_in[0][1] & bs_data_in[1][2] & bs_data_in[2][2] & bs_data_in[3][3];
      assign bs_data_out[108] = bs_data_in[0][1] & bs_data_in[1][2] & bs_data_in[2][3] & bs_data_in[3][0];
      assign bs_data_out[109] = bs_data_in[0][1] & bs_data_in[1][2] & bs_data_in[2][3] & bs_data_in[3][1];
      assign bs_data_out[110] = bs_data_in[0][1] & bs_data_in[1][2] & bs_data_in[2][3] & bs_data_in[3][2];
      assign bs_data_out[111] = bs_data_in[0][1] & bs_data_in[1][2] & bs_data_in[2][3] & bs_data_in[3][3];
      assign bs_data_out[112] = bs_data_in[0][1] & bs_data_in[1][3] & bs_data_in[2][0] & bs_data_in[3][0];
      assign bs_data_out[113] = bs_data_in[0][1] & bs_data_in[1][3] & bs_data_in[2][0] & bs_data_in[3][1];
      assign bs_data_out[114] = bs_data_in[0][1] & bs_data_in[1][3] & bs_data_in[2][0] & bs_data_in[3][2];
      assign bs_data_out[115] = bs_data_in[0][1] & bs_data_in[1][3] & bs_data_in[2][0] & bs_data_in[3][3];
      assign bs_data_out[116] = bs_data_in[0][1] & bs_data_in[1][3] & bs_data_in[2][1] & bs_data_in[3][0];
      assign bs_data_out[117] = bs_data_in[0][1] & bs_data_in[1][3] & bs_data_in[2][1] & bs_data_in[3][1];
      assign bs_data_out[118] = bs_data_in[0][1] & bs_data_in[1][3] & bs_data_in[2][1] & bs_data_in[3][2];
      assign bs_data_out[119] = bs_data_in[0][1] & bs_data_in[1][3] & bs_data_in[2][1] & bs_data_in[3][3];
      assign bs_data_out[120] = bs_data_in[0][1] & bs_data_in[1][3] & bs_data_in[2][2] & bs_data_in[3][0];
      assign bs_data_out[121] = bs_data_in[0][1] & bs_data_in[1][3] & bs_data_in[2][2] & bs_data_in[3][1];
      assign bs_data_out[122] = bs_data_in[0][1] & bs_data_in[1][3] & bs_data_in[2][2] & bs_data_in[3][2];
      assign bs_data_out[123] = bs_data_in[0][1] & bs_data_in[1][3] & bs_data_in[2][2] & bs_data_in[3][3];
      assign bs_data_out[124] = bs_data_in[0][1] & bs_data_in[1][3] & bs_data_in[2][3] & bs_data_in[3][0];
      assign bs_data_out[125] = bs_data_in[0][1] & bs_data_in[1][3] & bs_data_in[2][3] & bs_data_in[3][1];
      assign bs_data_out[126] = bs_data_in[0][1] & bs_data_in[1][3] & bs_data_in[2][3] & bs_data_in[3][2];
      assign bs_data_out[127] = bs_data_in[0][1] & bs_data_in[1][3] & bs_data_in[2][3] & bs_data_in[3][3];
      assign bs_data_out[128] = bs_data_in[0][2] & bs_data_in[1][0] & bs_data_in[2][0] & bs_data_in[3][0];
      assign bs_data_out[129] = bs_data_in[0][2] & bs_data_in[1][0] & bs_data_in[2][0] & bs_data_in[3][1];
      assign bs_data_out[130] = bs_data_in[0][2] & bs_data_in[1][0] & bs_data_in[2][0] & bs_data_in[3][2];
      assign bs_data_out[131] = bs_data_in[0][2] & bs_data_in[1][0] & bs_data_in[2][0] & bs_data_in[3][3];
      assign bs_data_out[132] = bs_data_in[0][2] & bs_data_in[1][0] & bs_data_in[2][1] & bs_data_in[3][0];
      assign bs_data_out[133] = bs_data_in[0][2] & bs_data_in[1][0] & bs_data_in[2][1] & bs_data_in[3][1];
      assign bs_data_out[134] = bs_data_in[0][2] & bs_data_in[1][0] & bs_data_in[2][1] & bs_data_in[3][2];
      assign bs_data_out[135] = bs_data_in[0][2] & bs_data_in[1][0] & bs_data_in[2][1] & bs_data_in[3][3];
      assign bs_data_out[136] = bs_data_in[0][2] & bs_data_in[1][0] & bs_data_in[2][2] & bs_data_in[3][0];
      assign bs_data_out[137] = bs_data_in[0][2] & bs_data_in[1][0] & bs_data_in[2][2] & bs_data_in[3][1];
      assign bs_data_out[138] = bs_data_in[0][2] & bs_data_in[1][0] & bs_data_in[2][2] & bs_data_in[3][2];
      assign bs_data_out[139] = bs_data_in[0][2] & bs_data_in[1][0] & bs_data_in[2][2] & bs_data_in[3][3];
      assign bs_data_out[140] = bs_data_in[0][2] & bs_data_in[1][0] & bs_data_in[2][3] & bs_data_in[3][0];
      assign bs_data_out[141] = bs_data_in[0][2] & bs_data_in[1][0] & bs_data_in[2][3] & bs_data_in[3][1];
      assign bs_data_out[142] = bs_data_in[0][2] & bs_data_in[1][0] & bs_data_in[2][3] & bs_data_in[3][2];
      assign bs_data_out[143] = bs_data_in[0][2] & bs_data_in[1][0] & bs_data_in[2][3] & bs_data_in[3][3];
      assign bs_data_out[144] = bs_data_in[0][2] & bs_data_in[1][1] & bs_data_in[2][0] & bs_data_in[3][0];
      assign bs_data_out[145] = bs_data_in[0][2] & bs_data_in[1][1] & bs_data_in[2][0] & bs_data_in[3][1];
      assign bs_data_out[146] = bs_data_in[0][2] & bs_data_in[1][1] & bs_data_in[2][0] & bs_data_in[3][2];
      assign bs_data_out[147] = bs_data_in[0][2] & bs_data_in[1][1] & bs_data_in[2][0] & bs_data_in[3][3];
      assign bs_data_out[148] = bs_data_in[0][2] & bs_data_in[1][1] & bs_data_in[2][1] & bs_data_in[3][0];
      assign bs_data_out[149] = bs_data_in[0][2] & bs_data_in[1][1] & bs_data_in[2][1] & bs_data_in[3][1];
      assign bs_data_out[150] = bs_data_in[0][2] & bs_data_in[1][1] & bs_data_in[2][1] & bs_data_in[3][2];
      assign bs_data_out[151] = bs_data_in[0][2] & bs_data_in[1][1] & bs_data_in[2][1] & bs_data_in[3][3];
      assign bs_data_out[152] = bs_data_in[0][2] & bs_data_in[1][1] & bs_data_in[2][2] & bs_data_in[3][0];
      assign bs_data_out[153] = bs_data_in[0][2] & bs_data_in[1][1] & bs_data_in[2][2] & bs_data_in[3][1];
      assign bs_data_out[154] = bs_data_in[0][2] & bs_data_in[1][1] & bs_data_in[2][2] & bs_data_in[3][2];
      assign bs_data_out[155] = bs_data_in[0][2] & bs_data_in[1][1] & bs_data_in[2][2] & bs_data_in[3][3];
      assign bs_data_out[156] = bs_data_in[0][2] & bs_data_in[1][1] & bs_data_in[2][3] & bs_data_in[3][0];
      assign bs_data_out[157] = bs_data_in[0][2] & bs_data_in[1][1] & bs_data_in[2][3] & bs_data_in[3][1];
      assign bs_data_out[158] = bs_data_in[0][2] & bs_data_in[1][1] & bs_data_in[2][3] & bs_data_in[3][2];
      assign bs_data_out[159] = bs_data_in[0][2] & bs_data_in[1][1] & bs_data_in[2][3] & bs_data_in[3][3];
      assign bs_data_out[160] = bs_data_in[0][2] & bs_data_in[1][2] & bs_data_in[2][0] & bs_data_in[3][0];
      assign bs_data_out[161] = bs_data_in[0][2] & bs_data_in[1][2] & bs_data_in[2][0] & bs_data_in[3][1];
      assign bs_data_out[162] = bs_data_in[0][2] & bs_data_in[1][2] & bs_data_in[2][0] & bs_data_in[3][2];
      assign bs_data_out[163] = bs_data_in[0][2] & bs_data_in[1][2] & bs_data_in[2][0] & bs_data_in[3][3];
      assign bs_data_out[164] = bs_data_in[0][2] & bs_data_in[1][2] & bs_data_in[2][1] & bs_data_in[3][0];
      assign bs_data_out[165] = bs_data_in[0][2] & bs_data_in[1][2] & bs_data_in[2][1] & bs_data_in[3][1];
      assign bs_data_out[166] = bs_data_in[0][2] & bs_data_in[1][2] & bs_data_in[2][1] & bs_data_in[3][2];
      assign bs_data_out[167] = bs_data_in[0][2] & bs_data_in[1][2] & bs_data_in[2][1] & bs_data_in[3][3];
      assign bs_data_out[168] = bs_data_in[0][2] & bs_data_in[1][2] & bs_data_in[2][2] & bs_data_in[3][0];
      assign bs_data_out[169] = bs_data_in[0][2] & bs_data_in[1][2] & bs_data_in[2][2] & bs_data_in[3][1];
      assign bs_data_out[170] = bs_data_in[0][2] & bs_data_in[1][2] & bs_data_in[2][2] & bs_data_in[3][2];
      assign bs_data_out[171] = bs_data_in[0][2] & bs_data_in[1][2] & bs_data_in[2][2] & bs_data_in[3][3];
      assign bs_data_out[172] = bs_data_in[0][2] & bs_data_in[1][2] & bs_data_in[2][3] & bs_data_in[3][0];
      assign bs_data_out[173] = bs_data_in[0][2] & bs_data_in[1][2] & bs_data_in[2][3] & bs_data_in[3][1];
      assign bs_data_out[174] = bs_data_in[0][2] & bs_data_in[1][2] & bs_data_in[2][3] & bs_data_in[3][2];
      assign bs_data_out[175] = bs_data_in[0][2] & bs_data_in[1][2] & bs_data_in[2][3] & bs_data_in[3][3];
      assign bs_data_out[176] = bs_data_in[0][2] & bs_data_in[1][3] & bs_data_in[2][0] & bs_data_in[3][0];
      assign bs_data_out[177] = bs_data_in[0][2] & bs_data_in[1][3] & bs_data_in[2][0] & bs_data_in[3][1];
      assign bs_data_out[178] = bs_data_in[0][2] & bs_data_in[1][3] & bs_data_in[2][0] & bs_data_in[3][2];
      assign bs_data_out[179] = bs_data_in[0][2] & bs_data_in[1][3] & bs_data_in[2][0] & bs_data_in[3][3];
      assign bs_data_out[180] = bs_data_in[0][2] & bs_data_in[1][3] & bs_data_in[2][1] & bs_data_in[3][0];
      assign bs_data_out[181] = bs_data_in[0][2] & bs_data_in[1][3] & bs_data_in[2][1] & bs_data_in[3][1];
      assign bs_data_out[182] = bs_data_in[0][2] & bs_data_in[1][3] & bs_data_in[2][1] & bs_data_in[3][2];
      assign bs_data_out[183] = bs_data_in[0][2] & bs_data_in[1][3] & bs_data_in[2][1] & bs_data_in[3][3];
      assign bs_data_out[184] = bs_data_in[0][2] & bs_data_in[1][3] & bs_data_in[2][2] & bs_data_in[3][0];
      assign bs_data_out[185] = bs_data_in[0][2] & bs_data_in[1][3] & bs_data_in[2][2] & bs_data_in[3][1];
      assign bs_data_out[186] = bs_data_in[0][2] & bs_data_in[1][3] & bs_data_in[2][2] & bs_data_in[3][2];
      assign bs_data_out[187] = bs_data_in[0][2] & bs_data_in[1][3] & bs_data_in[2][2] & bs_data_in[3][3];
      assign bs_data_out[188] = bs_data_in[0][2] & bs_data_in[1][3] & bs_data_in[2][3] & bs_data_in[3][0];
      assign bs_data_out[189] = bs_data_in[0][2] & bs_data_in[1][3] & bs_data_in[2][3] & bs_data_in[3][1];
      assign bs_data_out[190] = bs_data_in[0][2] & bs_data_in[1][3] & bs_data_in[2][3] & bs_data_in[3][2];
      assign bs_data_out[191] = bs_data_in[0][2] & bs_data_in[1][3] & bs_data_in[2][3] & bs_data_in[3][3];
      assign bs_data_out[192] = bs_data_in[0][3] & bs_data_in[1][0] & bs_data_in[2][0] & bs_data_in[3][0];
      assign bs_data_out[193] = bs_data_in[0][3] & bs_data_in[1][0] & bs_data_in[2][0] & bs_data_in[3][1];
      assign bs_data_out[194] = bs_data_in[0][3] & bs_data_in[1][0] & bs_data_in[2][0] & bs_data_in[3][2];
      assign bs_data_out[195] = bs_data_in[0][3] & bs_data_in[1][0] & bs_data_in[2][0] & bs_data_in[3][3];
      assign bs_data_out[196] = bs_data_in[0][3] & bs_data_in[1][0] & bs_data_in[2][1] & bs_data_in[3][0];
      assign bs_data_out[197] = bs_data_in[0][3] & bs_data_in[1][0] & bs_data_in[2][1] & bs_data_in[3][1];
      assign bs_data_out[198] = bs_data_in[0][3] & bs_data_in[1][0] & bs_data_in[2][1] & bs_data_in[3][2];
      assign bs_data_out[199] = bs_data_in[0][3] & bs_data_in[1][0] & bs_data_in[2][1] & bs_data_in[3][3];
      assign bs_data_out[200] = bs_data_in[0][3] & bs_data_in[1][0] & bs_data_in[2][2] & bs_data_in[3][0];
      assign bs_data_out[201] = bs_data_in[0][3] & bs_data_in[1][0] & bs_data_in[2][2] & bs_data_in[3][1];
      assign bs_data_out[202] = bs_data_in[0][3] & bs_data_in[1][0] & bs_data_in[2][2] & bs_data_in[3][2];
      assign bs_data_out[203] = bs_data_in[0][3] & bs_data_in[1][0] & bs_data_in[2][2] & bs_data_in[3][3];
      assign bs_data_out[204] = bs_data_in[0][3] & bs_data_in[1][0] & bs_data_in[2][3] & bs_data_in[3][0];
      assign bs_data_out[205] = bs_data_in[0][3] & bs_data_in[1][0] & bs_data_in[2][3] & bs_data_in[3][1];
      assign bs_data_out[206] = bs_data_in[0][3] & bs_data_in[1][0] & bs_data_in[2][3] & bs_data_in[3][2];
      assign bs_data_out[207] = bs_data_in[0][3] & bs_data_in[1][0] & bs_data_in[2][3] & bs_data_in[3][3];
      assign bs_data_out[208] = bs_data_in[0][3] & bs_data_in[1][1] & bs_data_in[2][0] & bs_data_in[3][0];
      assign bs_data_out[209] = bs_data_in[0][3] & bs_data_in[1][1] & bs_data_in[2][0] & bs_data_in[3][1];
      assign bs_data_out[210] = bs_data_in[0][3] & bs_data_in[1][1] & bs_data_in[2][0] & bs_data_in[3][2];
      assign bs_data_out[211] = bs_data_in[0][3] & bs_data_in[1][1] & bs_data_in[2][0] & bs_data_in[3][3];
      assign bs_data_out[212] = bs_data_in[0][3] & bs_data_in[1][1] & bs_data_in[2][1] & bs_data_in[3][0];
      assign bs_data_out[213] = bs_data_in[0][3] & bs_data_in[1][1] & bs_data_in[2][1] & bs_data_in[3][1];
      assign bs_data_out[214] = bs_data_in[0][3] & bs_data_in[1][1] & bs_data_in[2][1] & bs_data_in[3][2];
      assign bs_data_out[215] = bs_data_in[0][3] & bs_data_in[1][1] & bs_data_in[2][1] & bs_data_in[3][3];
      assign bs_data_out[216] = bs_data_in[0][3] & bs_data_in[1][1] & bs_data_in[2][2] & bs_data_in[3][0];
      assign bs_data_out[217] = bs_data_in[0][3] & bs_data_in[1][1] & bs_data_in[2][2] & bs_data_in[3][1];
      assign bs_data_out[218] = bs_data_in[0][3] & bs_data_in[1][1] & bs_data_in[2][2] & bs_data_in[3][2];
      assign bs_data_out[219] = bs_data_in[0][3] & bs_data_in[1][1] & bs_data_in[2][2] & bs_data_in[3][3];
      assign bs_data_out[220] = bs_data_in[0][3] & bs_data_in[1][1] & bs_data_in[2][3] & bs_data_in[3][0];
      assign bs_data_out[221] = bs_data_in[0][3] & bs_data_in[1][1] & bs_data_in[2][3] & bs_data_in[3][1];
      assign bs_data_out[222] = bs_data_in[0][3] & bs_data_in[1][1] & bs_data_in[2][3] & bs_data_in[3][2];
      assign bs_data_out[223] = bs_data_in[0][3] & bs_data_in[1][1] & bs_data_in[2][3] & bs_data_in[3][3];
      assign bs_data_out[224] = bs_data_in[0][3] & bs_data_in[1][2] & bs_data_in[2][0] & bs_data_in[3][0];
      assign bs_data_out[225] = bs_data_in[0][3] & bs_data_in[1][2] & bs_data_in[2][0] & bs_data_in[3][1];
      assign bs_data_out[226] = bs_data_in[0][3] & bs_data_in[1][2] & bs_data_in[2][0] & bs_data_in[3][2];
      assign bs_data_out[227] = bs_data_in[0][3] & bs_data_in[1][2] & bs_data_in[2][0] & bs_data_in[3][3];
      assign bs_data_out[228] = bs_data_in[0][3] & bs_data_in[1][2] & bs_data_in[2][1] & bs_data_in[3][0];
      assign bs_data_out[229] = bs_data_in[0][3] & bs_data_in[1][2] & bs_data_in[2][1] & bs_data_in[3][1];
      assign bs_data_out[230] = bs_data_in[0][3] & bs_data_in[1][2] & bs_data_in[2][1] & bs_data_in[3][2];
      assign bs_data_out[231] = bs_data_in[0][3] & bs_data_in[1][2] & bs_data_in[2][1] & bs_data_in[3][3];
      assign bs_data_out[232] = bs_data_in[0][3] & bs_data_in[1][2] & bs_data_in[2][2] & bs_data_in[3][0];
      assign bs_data_out[233] = bs_data_in[0][3] & bs_data_in[1][2] & bs_data_in[2][2] & bs_data_in[3][1];
      assign bs_data_out[234] = bs_data_in[0][3] & bs_data_in[1][2] & bs_data_in[2][2] & bs_data_in[3][2];
      assign bs_data_out[235] = bs_data_in[0][3] & bs_data_in[1][2] & bs_data_in[2][2] & bs_data_in[3][3];
      assign bs_data_out[236] = bs_data_in[0][3] & bs_data_in[1][2] & bs_data_in[2][3] & bs_data_in[3][0];
      assign bs_data_out[237] = bs_data_in[0][3] & bs_data_in[1][2] & bs_data_in[2][3] & bs_data_in[3][1];
      assign bs_data_out[238] = bs_data_in[0][3] & bs_data_in[1][2] & bs_data_in[2][3] & bs_data_in[3][2];
      assign bs_data_out[239] = bs_data_in[0][3] & bs_data_in[1][2] & bs_data_in[2][3] & bs_data_in[3][3];
      assign bs_data_out[240] = bs_data_in[0][3] & bs_data_in[1][3] & bs_data_in[2][0] & bs_data_in[3][0];
      assign bs_data_out[241] = bs_data_in[0][3] & bs_data_in[1][3] & bs_data_in[2][0] & bs_data_in[3][1];
      assign bs_data_out[242] = bs_data_in[0][3] & bs_data_in[1][3] & bs_data_in[2][0] & bs_data_in[3][2];
      assign bs_data_out[243] = bs_data_in[0][3] & bs_data_in[1][3] & bs_data_in[2][0] & bs_data_in[3][3];
      assign bs_data_out[244] = bs_data_in[0][3] & bs_data_in[1][3] & bs_data_in[2][1] & bs_data_in[3][0];
      assign bs_data_out[245] = bs_data_in[0][3] & bs_data_in[1][3] & bs_data_in[2][1] & bs_data_in[3][1];
      assign bs_data_out[246] = bs_data_in[0][3] & bs_data_in[1][3] & bs_data_in[2][1] & bs_data_in[3][2];
      assign bs_data_out[247] = bs_data_in[0][3] & bs_data_in[1][3] & bs_data_in[2][1] & bs_data_in[3][3];
      assign bs_data_out[248] = bs_data_in[0][3] & bs_data_in[1][3] & bs_data_in[2][2] & bs_data_in[3][0];
      assign bs_data_out[249] = bs_data_in[0][3] & bs_data_in[1][3] & bs_data_in[2][2] & bs_data_in[3][1];
      assign bs_data_out[250] = bs_data_in[0][3] & bs_data_in[1][3] & bs_data_in[2][2] & bs_data_in[3][2];
      assign bs_data_out[251] = bs_data_in[0][3] & bs_data_in[1][3] & bs_data_in[2][2] & bs_data_in[3][3];
      assign bs_data_out[252] = bs_data_in[0][3] & bs_data_in[1][3] & bs_data_in[2][3] & bs_data_in[3][0];
      assign bs_data_out[253] = bs_data_in[0][3] & bs_data_in[1][3] & bs_data_in[2][3] & bs_data_in[3][1];
      assign bs_data_out[254] = bs_data_in[0][3] & bs_data_in[1][3] & bs_data_in[2][3] & bs_data_in[3][2];
      assign bs_data_out[255] = bs_data_in[0][3] & bs_data_in[1][3] & bs_data_in[2][3] & bs_data_in[3][3];
  
      par_acc_256lanes  #(.WIDTH(DATA_WIDTH*NUM_INPUTS)) stoch2bin (
        .clk(clk),
        .rst(rst),                                               
        .data_in(bs_data_out),
        .countval(bin_data_out),
        .overflow(dummy_ov));

   end // if (NUM_INPUTS==4)
   else if (NUM_INPUTS==5) begin //FIXME
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
   
   


endmodule //ms_es_naive_by4_mul

