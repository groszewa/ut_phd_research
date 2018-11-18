`timescale 1 ns / 100 ps


module exp_logic_tb ();
//--------------------------------------------------------- // inputs to the DUT are reg type
   reg clk_50;
   //reg en;
   //reg rst;
   

   reg [7:0] a_exp, b_exp;
   
   
   
   
//-------------------------------------------------------- // outputs from the DUT are wire type
   //wire [3-1  :0] ctr3_out;
   //wire           ctr3_overflow;
   //
   //wire [2-1  :0] ctr2_out;
   //wire           ctr2_overflow;
   //wire [3:0] ctr4_out_a,ctr4_out_b;
   //wire       ctr4_overflow_a,ctr4b_overflow_b,ctr_overflow_c;

   
   
   //wire           sn_out_a,sn_out_b,sn_out_c,sn_mul_out;

   //wire [7:0]     bin_out;
   //wire           bin_out_overflow;
   //wire           start_add,op_end;

   //wire           sn_add_out;
   wire [8:0] exp_out;
   wire [7:0] exp_adj;
   
   
   
   integer     i,j;
   //reg         passed;
   //reg [47:0]  test_val;
   
   
   
   

   
//--------------------------------------------------------- // instantiate the Device Under Test (DUT)
// using named instantiation



                       
                 
exp_logic DUT (
  .a_exp(a_exp),
  .b_exp(b_exp),
  .exp_out(exp_out)
);

exp_adjust DUT1 (
  .exp_in(exp_out),
  .exp_adj(exp_adj)
);
              
               
   
  



   

   
//---------------------------------------------------------- // create a 50Mhz clock
always
    #10 clk_50 = ~clk_50;   // every ten nanoseconds invert
//----------------------------------------------------------- // initial blocks are sequential and start at time 0
  initial
    begin

       $dumpfile ("exp_logic_tb.dump");
       $dumpvars(0,exp_logic_tb);
       
       $display($time, " << Starting the Simulation >>");
       clk_50 = 0;
       a_exp = 0;
       b_exp = 0;  
       //passed = 1'b1;
       #10

       //rst = 1
       //#10
       //rst = 0;
       ///
       ///#10
       a_exp = 5;
       b_exp = 2;
       //test_val = a_mantissa * b_mantissa;
       
       
       #10
       a_exp = 10;
       b_exp = 15;
       //test_val = a_mantissa * b_mantissa;
       
       
       #10
       a_exp = 128;
       b_exp = 512;
       //test_val = a_mantissa * b_mantissa;
       

       
       //#10
       //a_mantissa = 24'h99a82f;
       //b_mantissa = 24'hd292b3;
       //test_val = a_mantissa * b_mantissa;
       //$display(a_exp);
       
       //#10
       //for(i=8'h00;i<=8'hff;i=i+1)
       //  begin
       //     //$display(i);
       //     #10
       //     a_exp = i;
       //     for(j=8'h00;j<8'hff;j=j+1)
       //       begin
       //          #10
       //          b_exp = j;
       //       end
       //     
       //  end
       

       for(i=8'h00;i<=8'hff;i=i+1)
         begin
            //$display(i);
            a_exp = i;
            for(j=8'h00;j<=8'hff;j=j+1)
              begin
                 #10
                 b_exp = j;
              end // end for j
         end //end for i
       #10
       
       //if(passed == 1'b0)
       //  begin
       //     $display("Test failed");
       //  end else begin
       //     $display("Test passed");
       //  end
       
       



       
    $display($time, " << Simulation Complete >>");
    //$stop; // stop the simulation
    $finish; //stop similation and give control back to OS
  end // initial begin


//-------------------------------------------------------------- // This initial block runs concurrently with the other
// blocks in the design and starts at time 0
   //integer i;
   //reg    parity_check;
   //reg    c_one_hot;
   //reg    input_good;
   
   
   
   
 initial begin
    $monitor($time, " a_exp=%h, b_exp=%h, exp_out=%h, exp_adj=%h"
             ,a_exp
             ,b_exp
             ,exp_out
             ,exp_adj);
    
    
    
     
 end
//-------------------------------------------------------------- // The load_count task loads the counter with the value passed
//  task load_count;
//     input [3:0] load_value;
//     begin
//@(negedge clk_50);
//$display($time, " << Loading the counter with %h >>", load_value); load_l = 1’b0;
//count_in = load_value;
//@(negedge clk_50);
//load_l = 1’b1;
//     end
//  endtask //of load_count
endmodule //of cnt16_tb