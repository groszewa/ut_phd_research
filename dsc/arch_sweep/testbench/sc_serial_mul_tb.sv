`timescale 1 ns / 100 ps

module core #(parameter DATA_WIDTH=4, parameter NUM_INPUTS=2)(
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


sc_serial_mul  dut (
  .clk(gclk),
  .rst(rst),
  .en(en),
  .bin_data_in(bin_data_in),
  .bin_data_out(bin_data_out),
  .done(op_finished)
);
   
endmodule // core



