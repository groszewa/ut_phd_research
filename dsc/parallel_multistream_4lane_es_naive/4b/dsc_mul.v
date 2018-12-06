`timescale 1 ns / 100 ps

`define SNG_WIDTH 4


module dsc_mul (
    a,
    b,
    z,
    clk,
    rst,
    en,
    ov);

   input [`SNG_WIDTH-1:0]        a,b;
   input                       clk,rst;
   input                       en;
   output [(2*`SNG_WIDTH)-1:0] z;
   output                      ov;
   

   wire                        sn_out_a0,sn_out_a1,sn_out_b0,sn_out_b1;
   wire                        [3:0] sn_out_mul;
   
   wire                        ctr_ov_a,ctr_ov_b;
   wire                        dummy_ov;

   wire [2:0]                  par_acc_int;

   wire                        early_shutoff;
   
   
   

   //SNG for input A
   prg_4b_by2 prg_a (
   .clk(clk),
   .rst(rst),
   .en(en),
   .bin_in(a),
   .sn_out0(sn_out_a0),
   .sn_out1(sn_out_a1),
   .ctr_overflow(ctr_ov_a));

   //SNG for input B
   prg_4b_by2 prg_b (
   .clk(ctr_ov_a),
   .rst(rst),
   .en(en),
   .bin_in(b),
   .sn_out0(sn_out_b0),
   .sn_out1(sn_out_b1),                
   .ctr_overflow(ctr_ov_b));

//multiplier circuit
par_mul_ms_4lane mul (
  .as0(sn_out_a0),
  .as1(sn_out_a1),
  .bs0(sn_out_b0),
  .bs1(sn_out_b1),            
  .y(sn_out_mul)
);

//stoch2bin out
//counter #(
//  .WIDTH (2*`SNG_WIDTH)
//) stoch2bin_out (
//  .clk(clk),
//  .rst(rst),
//  .en(sn_out_mul),
//  .out(z),
//  .overflow(dummy_ov)
//);
 

///par_ctr_4b par_ctr (
///  .a(sn_out_mul),
///  .y(par_acc_int)                  
///);
   
par_accum_4b_4lanes stoch2bin_out (
  .clk(clk),
  .rst(rst),
  .data_in(sn_out_mul),
  .bin_out(z),
  .overflow(dummy_ov)                                                                    
);
    

   assign ov = ctr_ov_b | ~(sn_out_b0 | sn_out_b1);
   
   
endmodule // dsc_mul



               







   