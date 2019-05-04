`timescale 1 ns / 100 ps

`define SNG_WIDTH 4


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
   output [(3*`SNG_WIDTH)-1:0] z;
   output                      ov;
   

   wire                        sn_out_a,sn_out_b,sn_out_mul;
   wire                        ctr_ov_a,ctr_ov_b;
   wire                        dummy_ov;
   

   //SNG for input A
   prg_4b prg_a (
   .clk(clk),
   .rst(rst),
   .en(en),
   .bin_in(a),
   .sn_out(sn_out_a),
   .ctr_overflow(ctr_ov_a));

   //SNG for input B
   prg_4b prg_b (
   .clk(ctr_ov_a),
   .rst(rst),
   .en(en),
   .bin_in(b),
   .sn_out(sn_out_b),
   .ctr_overflow(ctr_ov_b));

   //SNG for input C
   prg_4b prg_c (
   .clk(ctr_ov_b),
   .rst(rst),
   .en(en),
   .bin_in(c),
   .sn_out(sn_out_c),
   .ctr_overflow(ov));


//multiplier circuit
///det_stoch_mul mul (
///  .a(sn_out_a),
///  .b(sn_out_b),
///  .y(sn_out_mul)
///);

   assign sn_out_mul = sn_out_a & sn_out_b & sn_out_c;
   

//stoch2bin out
counter #(
  .WIDTH (3*`SNG_WIDTH)
) stoch2bin_out (
  .clk(clk),
  .rst(rst),
  .en(sn_out_mul),
  .out(z),
  .overflow(dummy_ov)
);
   
   
   
endmodule // dsc_mul



               







   