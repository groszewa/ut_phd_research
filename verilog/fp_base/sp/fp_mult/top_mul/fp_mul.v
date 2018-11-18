`timescale 1 ns / 100 ps

module fp_mul(
 clk,
 rst,
 a,
 b,
 rdy,              
 z);

   //input declarations
   input clk;
   input rst;

   input [31:0] a;
   input [31:0] b;
   input        rdy;
   
   

   //output declarations
   output [31:0] z;
   
   //reg declarations
   reg [23:0]   a_m, b_m, z_m;
   reg [9:0]    a_e,b_e,z_e;
   reg          a_s,b_s,z_s;
   reg [4:0]    fsm_state;
   reg [31:0]   reg_z;
   
   reg          a_nan, a_inf, a_zero;
   reg          b_nan, b_inf, b_zero;

   reg [47:0]   mant_mul_out;
   reg          guard,round,sticky;
   reg          add_to_exp;
   
   
   
   

   //wire declarations
   
   

   //param declarations
   parameter      unpack       = 4'h0,
                  exp_logic    = 4'h1,
                  pack         = 4'h2,
                  rst_hold     = 4'h3,
                  multiply     = 4'h4,
                  gen_grs_bits = 4'h5,
                  normalize    = 4'h6,
                  round_res    = 4'h7;
   
   
   
             
     
   
   
                
   
               
   

   always @(posedge clk)
      
     begin
        if(rst) begin
           //intial state
           fsm_state <= rst_hold;
        end

        case(fsm_state)

          rst_hold:
            begin
               if(rst)
                 begin
                    fsm_state <= rst_hold;
                 end else begin
                    fsm_state <= unpack;
                 end
            end
          
          
          unpack:
            begin
               if(rdy) begin
                  a_s <= a[31];
                  a_e <= a[30:23];
                  a_m <= a[22:0];

                  b_s <= b[31];
                  b_e <= b[30:23];
                  b_m <= b[22:0];
                  fsm_state <= exp_logic;


                  //do these in this stage so their values can be consumed in next
                  a_nan  <= ((a[30:23] == 255) &  (|a[22:0]));
                  a_inf  <= ((a[30:23] == 255) & !(|a[22:0]));
                  a_zero <= ((a[30:23] == 0)   & !(|a[22:0]));
               
                  b_nan  <= ((b[30:23] == 255) &  (|b[22:0]));
                  b_inf  <= ((b[30:23] == 255) & !(|b[22:0]));
                  b_zero <= ((b[30:23] == 0)   & !(|b[22:0]));

               //end else begin
               //   fsm_state <= unpack;
               end // else: !if(rdy)
               
               
            end //unpack
          exp_logic:
            begin
               //get these in previous pipe stage
               //a_nan  <= ((a_e == 255) &  (|a_m));
               //a_inf  <= ((a_e == 255) & !(|a_m));
               //a_zero <= ((a_e == 0) & !(|a_m));
               //
               //b_nan  <= ((b_e == 255) &  (|b_m));
               //b_inf  <= ((b_e == 255) & !(|b_m));
               //b_zero <= ((b_e == 0) & !(|b_m));

               if(a_nan | b_nan) begin //NaN * anything = NaN
                  z_s <= 1;
                  z_e <= 255;
                  z_m[22] <= 1;
                  z_m[21:0] <= 0;
                  fsm_state <= pack;
               end
               else if (a_inf) begin
                  if(b_zero) begin // inf * 0 = NaN
                     z_s <= 1;
                     z_e <= 255;
                     z_m[22] <= 1;
                     z_m[21:0] <= 0;
                     fsm_state <= pack;
                  end
                  else begin // inf * (normal or denormal) = inf
                     z_s <= a_s ^ b_s;
                     z_e <= 255;
                     z_m <= 0;
                     fsm_state <= pack;
                  end
               end
               else if (b_inf) begin
                  if(a_zero) begin //inf * 0 = NaN
                     z_s <= 1;
                     z_e <= 255;
                     z_m[22] <= 1;
                     z_m[21:0] <= 0;
                     fsm_state <= pack;
                  end
                  else begin // inf * (normal or denormal) = inf
                     z_s <= a_s ^ b_s;
                     z_e <= 255;
                     z_m <= 0;
                     fsm_state <= pack;
                  end
               end
               else if (a_zero | b_zero) begin //know neither is inf or nan so now if either is zero result will be zero
                  z_s = a_s ^ b_s;
                  z_e = 0;
                  z_m = 0;
                  fsm_state <= pack;
               end
               else begin // normal or denormal number
                  //deal with a
                  if(a_e == 0) begin
                     a_m[23] <= 0;
                     //is this right?
                     a_e <= 1;
                  end
                  else begin
                     a_m[23] <= 1;
                  end
                  //deal with b
                  if(b_e == 0) begin
                     b_m[23] <= 0;
                     //is this right?
                     b_e <= 1;
                  end
                  else begin
                     b_m[23] <= 1;
                  end
                  
                  z_s <= a_s ^ b_s;
                  z_e <= a_e + b_e - 127;
                  fsm_state <= multiply;
                  
                  
               end 

            end // case: exp_logic
          
             
          multiply:
            begin
               //fix this
               mant_mul_out <= ((a_m * b_m)) ;
               fsm_state    <= gen_grs_bits;
            end // multiply
          
          gen_grs_bits:
            begin
               //why 46 and not 47?
               z_m <= mant_mul_out[46:23];
               guard <= mant_mul_out[22];
               round <= mant_mul_out[21];
               sticky <= |mant_mul_out[20:0];
               add_to_exp <= mant_mul_out[47];
               fsm_state <= normalize;
            end // gen_grs_bits
          
          normalize:
            begin
               
               if(add_to_exp) begin
                  z_e <= z_e + 1;
                  add_to_exp <= 0;
                  z_m <= z_m >> 1;
                  z_m[23] = 1;
                  
               end
               
               if(z_m[23] == 0) begin
                  z_e <= z_e - 1;
                  z_m <= z_m << 1;
                  z_m[0] <= guard;
                  guard  <= round;
                  //is this supposed to be 0 or sticky?
                  round  <= sticky;
                  sticky <= 0;
               end               
               else begin
                  fsm_state <= round_res;
               end
            end // case: normalize

          round_res:
            begin
               fsm_state <= pack;
            end
          
               

          pack:
            begin
               reg_z[31] <= z_s;
               reg_z[30:23] <= z_e[7:0];
               reg_z[22:0] <= z_m[22:0]; 
               fsm_state <= unpack;               
            end //pack
          
          
         
        endcase // case (fsm_state)

        
        
     end // always @(posedge clk)

   assign z = reg_z;
   

endmodule // fp_mul

   

   