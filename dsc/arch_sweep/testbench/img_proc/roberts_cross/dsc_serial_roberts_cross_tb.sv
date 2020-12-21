`timescale 1 ns / 100 ps

module core #(parameter DATA_WIDTH=5)(
                                      gclk,
                                      rst,
                                      en,
                                      bin_in00,
                                      bin_in01,
                                      bin_in10,
                                      bin_in11,                                                           
                                      bin_data_out,
                                      op_finished                                                         
                                      );
   

   input gclk;
   input rst;
   input en;
   input [DATA_WIDTH-1:0] bin_in00;
   input [DATA_WIDTH-1:0] bin_in01;
   input [DATA_WIDTH-1:0] bin_in10;
   input [DATA_WIDTH-1:0] bin_in11;

   output [DATA_WIDTH-1:0] bin_data_out;
   output                  op_finished;


dsc_serial_roberts_cross #(.DATA_WIDTH(DATA_WIDTH)) dut (
                                                         .clk(gclk),
                                                         .rst(rst),
                                                         .en(en),
                                                         .bin_in00(bin_in00),
                                                         .bin_in01(bin_in01),
                                                         .bin_in10(bin_in10),
                                                         .bin_in11(bin_in11),
                                                         .bin_data_out(bin_data_out),
                                                         .done(op_finished)
);
   
endmodule // core



