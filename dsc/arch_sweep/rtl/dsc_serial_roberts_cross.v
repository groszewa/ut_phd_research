`timescale 1 ns / 100 ps

module dsc_serial_roberts_cross #(parameter DATA_WIDTH=5) (
	clk,
	rst,
	en,
	bin_in00,
    bin_in01,
    bin_in10,
    bin_in11,                                                                         
	bin_data_out,
	done);

   input [DATA_WIDTH-1:0]   bin_in00;
   input [DATA_WIDTH-1:0]   bin_in01;
   input [DATA_WIDTH-1:0]   bin_in10;
   input [DATA_WIDTH-1:0]   bin_in11;
   input                    clk,rst,en;

   output [DATA_WIDTH-1:0] bin_data_out;
   output                  done;
	
   wire [DATA_WIDTH-1:0] input_counter_out;
   wire                  sng_ov;
   wire                  bs_in00, bs_in01, bs_in10, bs_in11;
   wire                  mx, my;
   wire                  dummy_ov;
   
  	counter #(.WIDTH(DATA_WIDTH), 
              .STRIDE(1)) input_counter (
		                                 .clk(clk),
		                                 .rst(rst),
		                                 .en(en),
		                                 .countval(input_counter_out),
		                                 .overflow(sng_ov));

   comparator #(.WIDTH(DATA_WIDTH), .NUM_INPUTS(2)) comp00 (.bin(bin_in00),.reference(input_counter_out),.result(bs_in00));
   comparator #(.WIDTH(DATA_WIDTH), .NUM_INPUTS(2)) comp01 (.bin(bin_in01),.reference(input_counter_out),.result(bs_in01));
   comparator #(.WIDTH(DATA_WIDTH), .NUM_INPUTS(2)) comp10 (.bin(bin_in10),.reference(input_counter_out),.result(bs_in10));
   comparator #(.WIDTH(DATA_WIDTH), .NUM_INPUTS(2)) comp11 (.bin(bin_in11),.reference(input_counter_out),.result(bs_in11));
   
   assign mx = bs_in00 ^ bs_in11;
   assign my = bs_in01 ^ bs_in10;
   
   par_acc_sat_2lanes #(.WIDTH(DATA_WIDTH)) stoch2bin (
                                              .clk(clk),
                                              .rst(rst),
                                              .data_in({mx,my}),
                                              .countval(bin_data_out),
                                              .overflow(dummy_ov)
                                              );
   
   assign done = sng_ov | (bin_data_out == 255) | (bin_data_out == 256);

    

endmodule //dsc_serial_roberts_cross

