`timescale 1 ns / 100 ps

`define SNG_WIDTH 8
`define NUM_INPUTS 3


module dsc_mul (
    a,
    b,
    c,            
    z,
    clk,
    rst,
    en,
    ov);

   input [`SNG_WIDTH-1:0]        a,b,c;
   input                       clk,rst;
   input                       en;
   output [(`NUM_INPUTS*`SNG_WIDTH)-1:0] z;
   output                      ov;
   

   wire                        sn_out_a,sn_out_b,sn_out_c,sn_out_mul;
   wire                        ctr_ov_a,ctr_ov_b,ctr_ov_c;
   wire                        dummy_ov;
   wire                        early_shutoff;
   
   

   //SNG for input A
   prg_8b_3in_max prg_a (
   .clk(clk),
   .rst(rst),
   .en(en),
   .bin_in_a(a),
   .bin_in_b(b),
   .bin_in_c(c),                      
   .sn_out(sn_out_a),                      
   .ctr_overflow(ctr_ov_a));

   //SNG for input B
   prg_8b_3in_mid prg_b (
   .clk(ctr_ov_a),
   .rst(rst),
   .en(en),
   .bin_in_a(a),                 
   .bin_in_b(b),
   .bin_in_c(c),                      
   .sn_out(sn_out_b),
   .ctr_overflow(ctr_ov_b));

   //SNG for input C
   prg_8b_3in_min prg_c (
   .clk(ctr_ov_b),
   .rst(rst),
   .en(en),
   .bin_in_a(a),                 
   .bin_in_b(b),
   .bin_in_c(c),                      
   .sn_out(sn_out_c),
   .ctr_overflow(ctr_ov_c));
   

/////multiplier circuit
///det_stoch_mul mul (
///  .a(sn_out_a),
///  .b(sn_out_b),
///  .y(sn_out_mul)
///);

   assign sn_out_mul = sn_out_a & sn_out_b & sn_out_c;
   

//stoch2bin out
counter #(
  .WIDTH (`NUM_INPUTS*`SNG_WIDTH)
) stoch2bin_out (
  .clk(clk),
  .rst(rst),
  .en(sn_out_mul),
  .out(z),
  .overflow(dummy_ov)
);
   
   assign ov = ctr_ov_c | ~sn_out_c;
   
   
endmodule // dsc_mul




               







   