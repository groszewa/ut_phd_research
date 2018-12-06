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
   output reg                      ov;
   

   wire                        sn_out_a,sn_out_b,sn_out_mul;
   wire                        ctr_ov_a,ctr_ov_b;
   wire                        dummy_ov;
   wire [(2 ** `SNG_WIDTH)-1:0] sr_out_a, sr_out_b,sr_out_mul;

   //FSM generated signals
   
   //select whether shift regs wrap or FIFO
   reg                         wrap_mode_a, wrap_mode_b;
   //enables
   reg                         en_prg_a, en_prg_b;
   reg                         en_sr_a, en_sr_b;
   //rst signal for output counter
   reg                         rst_output_ctr;
   
                         
   wire [(`SNG_WIDTH)-1:0]      ctr_fsm_out;
   wire                         ctr_fsm_ov;
   //enable for fsm counter
   reg                          ctr_fsm_en;
                          
   

   localparam IDLE = 0, LOAD = 1, EXEC = 2, DONE = 3;
   reg [1:0] state,      // current state
             next_state; // next state
   

   //SNG for input A
   prg_4b prg_a (
   .clk(clk),
   .rst(rst),
   .en(en_prg_a),
   .bin_in(a),
   .sn_out(sn_out_a),
   .ctr_overflow(ctr_ov_a));

 //SNG for input B
 prg_4b prg_b (
   .clk(clk),
   .rst(rst),
   .en(en_prg_b),
   .bin_in(b),
   .sn_out(sn_out_b),
   .ctr_overflow(ctr_ov_b));

   shift_reg_rotate_4b_full shift_reg_a (
   .clk(clk),
   .scan_in(sn_out_a),
   .wrap_mode(wrap_mode_a),
   .en(en_sr_a),
   .rst(rst),
   .shiftreg_out(sr_out_a)
);
    
shift_reg_rotate_4b_full shift_reg_b (
   .clk(clk),
   .scan_in(sn_out_b),
   .wrap_mode(wrap_mode_b),
   .en(en_sr_b),
   .rst(rst),
   .shiftreg_out(sr_out_b)
);

par_sr_mul #(
  .WIDTH (2**`SNG_WIDTH)
 ) mul_bank (
   .a(sr_out_a),
   .b(sr_out_b),
   .y(sr_out_mul) 
 );
   


ctr_out_bank_16b stoch2bin (
  .clk(clk),
  .rst(rst_output_ctr),
  .mul_in(sr_out_mul),
  .bin_out(z)                      
);

//FSM for internal control signals
always @(posedge clk or posedge rst) begin
   
   if (rst) begin
      
      state <= IDLE;
      ov = 0;
   end else if (en) begin
      state <= next_state;
   end
end

//next state function
//experiment - was always @(*)
always @(*) begin
   next_state <= state; //default state, dont move
   case (state)
     IDLE : begin
        wrap_mode_a = 0;
        wrap_mode_b = 0;
        en_prg_a = 0;
        en_prg_b = 0;
        en_sr_a = 0;
        en_sr_b = 0;
        rst_output_ctr = 1;
        ctr_fsm_en = 0;
        
        
        
        if (en) begin
           next_state <= LOAD;          
        end
     end
     LOAD : begin
        rst_output_ctr = 1;        
        en_prg_a = 1;
        en_prg_b = 1;
        en_sr_a  = 1;
        en_sr_b  = 1;
        ctr_fsm_en = 1;
        
        
        if (ctr_fsm_ov) begin
           next_state <= EXEC;
        end
     end
     EXEC : begin
        en_prg_a = 0;
        en_prg_b = 0;
        wrap_mode_b = 1;
        en_sr_a = 0;
        rst_output_ctr = 0; 
        
        
        if (ctr_fsm_ov) begin
           next_state <= DONE;
        end
     end // case: EXEC
     DONE : begin
        ov = 1;
        en_sr_b = 0;
        ctr_fsm_en = 0;
        next_state <= IDLE;
        
     end     
     
   endcase // case (state)   
end // always @ (*)

   //assign  ctr_fsm_en = (state == LOAD);
   
   
   
//counter for FSM
counter #(
    .WIDTH(4)
) ctr_fsm (
   .clk(clk),
   .rst(rst),
   .en(ctr_fsm_en),
   .out(ctr_fsm_out),
   .overflow(ctr_fsm_ov)
);
      

   
   
   
endmodule // dsc_mul



               







   