`timescale 1 ns / 100 ps


module dadda_24b_tb ();
//--------------------------------------------------------- // inputs to the DUT are reg type
   reg clk_50;
   //reg en;
   //reg rst;
   

   reg [23:0] a_mantissa, b_mantissa;
   
   
   
   
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
   wire [47:0] mul_out;
   
   
   integer     i;
   reg         passed;
   reg [47:0]  test_val;
   
   
   
   

   
//--------------------------------------------------------- // instantiate the Device Under Test (DUT)
// using named instantiation



                       
                 
dadda_24b DUT (
  .a_mant(a_mantissa),
  .b_mant(b_mantissa),
  .z(mul_out)
);
   
  



   

   
//---------------------------------------------------------- // create a 50Mhz clock
always
    #10 clk_50 = ~clk_50;   // every ten nanoseconds invert
//----------------------------------------------------------- // initial blocks are sequential and start at time 0
  initial
    begin

       $dumpfile ("dadda_24b_tb.dump");
       $dumpvars(0,dadda_24b_tb);
       
       $display($time, " << Starting the Simulation >>");
       clk_50 = 0;
       a_mantissa = 0;
       b_mantissa = 0;  
       passed = 1'b1;
       

       //rst = 1
       //#10
       //rst = 0;
       ///
       ///#10
       ///a_mantissa = 5;
       ///b_mantissa = 2;
       ///
       ///#10
       ///a_mantissa = 10;
       ///b_mantissa = 15;
       ///
       ///#10
       ///a_mantissa = 128;
       ///b_mantissa = 512;

       for(i=0;i<100000;i=i+1)
         begin
            a_mantissa = $random;
            b_mantissa = $random;
            test_val = a_mantissa * b_mantissa;
            if(mul_out != test_val)
              begin
                 //$display("Error: %h * %h != %h (expected %h)", a_mantissa, b_mantissa, mul_out, test_val);
                 passed = 1'b0;
              end //end if
            else begin
               //$display("Correct (%d) : %h * %h = %h ", i, a_mantissa, b_mantissa, mul_out);
            end //end else
         end //end for

       if(passed == 1'b0)
         begin
            $display("Test failed");
         end else begin
            $display("Test passed");
         end
       
       



       
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
    $monitor($time, " a_mant=%h, b_mant=%h, mul_out=%h"
             ,a_mantissa
             ,b_mantissa
             ,mul_out);
    
    
     
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