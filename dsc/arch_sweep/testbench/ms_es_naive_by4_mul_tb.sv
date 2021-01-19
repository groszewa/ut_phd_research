`timescale 1 ns / 100 ps

module core #(parameter DATA_WIDTH=5, parameter NUM_INPUTS=2, parameter WXIP1=1)(
    gclk,
    rst,
    en,
    bin_data_in,
    bin_data_out,
    op_finished                                                         
);
   

   input gclk;
   input rst;
   input en;
   input [DATA_WIDTH-1:0] bin_data_in [NUM_INPUTS-1:0];

   output [WXIP1-1:0] bin_data_out;
   output                               op_finished;


ms_es_naive_by4_mul #(.DATA_WIDTH(DATA_WIDTH), .NUM_INPUTS(NUM_INPUTS), .WXIP1(WXIP1)) dut (
  .clk(gclk),
  .rst(rst),
  .en(en),
  .bin_data_in(bin_data_in),
  .bin_data_out(bin_data_out),
  .done(op_finished)
);
   
endmodule // core



