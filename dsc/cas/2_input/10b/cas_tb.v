`timescale 1 ns / 100 ps

`define NUM_TESTS 1000
`define BITS 10
`define NUM_INPUTS 2


module cas_tb ();
//--------------------------------------------------------- // inputs to the DUT are reg type
   reg clk_50;
   //reg en;
   //reg rst;

   reg [`BITS-1:0] input_bin_a, input_bin_b;
   wire [`BITS-1:0] output_bin_a_new, output_bin_b_new;
   
   
   
   
//-------------------------------------------------------- // outputs from the DUT are wire type
   //wire [3-1  :0] ctr3_out;
   //wire           ctr3_overflow;
   //
   //wire [2-1  :0] ctr2_out;
   //wire           ctr2_overflow;
   //wire [3:0] ctr4_out_a,ctr4_out_b;
   //wire       ctr4_overflow_a,ctr4b_overflow_b;
   
   //wire           sn_out_a,sn_out_b,sn_mul_out;

   //wire [7:0]     bin_out;
   //wire           bin_out_overflow;
   //wire           op_finished;

   //wire [7:0]     expected;
   //shortint       expected_result;
   //int            cycle_count;
   //int            time_start,time_end;

   //wire [15:0]    cycle_count;
   //wire           cycle_count_overflow;
   
   
            
   
      
   

   integer        i;
   //real            cycle_count_acc;
            
   
           
   
   
   
   

   
//--------------------------------------------------------- // instantiate the Device Under Test (DUT)
// using named instantiation



//counter #(
//   .WIDTH (4)
//) dut_ctr4 (
//  .clk(clk_50),
//  .rst(rst),
//  .en(en),
//  .out(ctr4_out),
//  .overflow(ctr4_overflow)
//);
//
//
//   //comparator2 dut_comp2 ( .a(input_bin), .b(ctr2_out), .y(sn_out));
//
//   comp_4b     dut_comp4 (.a(input_bin), .b(ctr4_out), .a_gt_b(sn_out));

//bin2stoch a   
/////prg_4b dut_prg4b_a (
/////  .clk(clk_50),
/////  .rst(rst),
/////  .en(en),
/////  .bin_in(input_bin_a),
/////  .sn_out(sn_out_a),
/////  .ctr_overflow(ctr4_overflow_a)         
/////);
/////
///////bin2stoch b
/////prg_4b dut_prg4b_b (
/////  .clk(ctr4_overflow_a),
/////  .rst(rst),
/////  .en(en),
/////  .bin_in(input_bin_b),
/////  .sn_out(sn_out_b),
/////  .ctr_overflow(ctr4_overflow_b)         
/////);
/////
///////multiplier circuit
/////det_stoch_mul dut_mul (
/////  .a(sn_out_a),
/////  .b(sn_out_b),
/////  .y(sn_mul_out)
/////);
/////                       
///////stoch2bin out
/////counter #(
/////  .WIDTH (8)
/////) stoch2bin_out (
/////  .clk(clk_50),
/////  .rst(rst),
/////  .en(sn_mul_out),
/////  .out(bin_out),
/////  .overflow(bin_out_overflow)
/////);

///dsc_mul dut (
///  .clk(clk_50),
///  .rst(rst),
///  .en(en),
///  .a(input_bin_a),
///  .b(input_bin_b),
///  .z(bin_out),
///  .ov(op_finished)
///);

cas dut (
  .a(input_bin_a),
  .b(input_bin_b),
  .a_new(output_bin_a_new),
  .b_new(output_bin_b_new)
);
   
   
//count number of clock cycles here
//TODO//                   

///counter #(.WIDTH(16)) cycle_counter (
///  .clk(clk_50),
///  .rst(rst),
///  .en(en),
///  .out(cycle_count),
///  .overflow(cycle_count_overflow)
///);
   


   

   
//---------------------------------------------------------- // create a 50Mhz clock
always
    #10 clk_50 = ~clk_50;   // every ten nanoseconds invert
//----------------------------------------------------------- // initial blocks are sequential and start at time 0
  initial
    begin

       //need vcd for power simulation
       $dumpfile ("cas_tb.vcd");
       $dumpvars(0,cas_tb);

       //need vpd for better viewing
       $vcdplusfile("cas_tb.vpd");
       $vcdpluson(0,cas_tb);
       
       
    $display($time, " << Starting the Simulation >>");
       clk_50 = 0;
       //en = 0;
       //rst = 1;
       input_bin_a = 0;
       input_bin_b = 0;
       
       
       //#10
       //rst = 0;
       
       //#10
       //en  = 1;
       //input_bin_a = 15;
       //input_bin_b = 15;

       for(i=0;i<`NUM_TESTS;i=i+1)
         begin
            //$display("iteration %d",i);
            input_bin_a = $random();
            input_bin_b = $random();
            
            //#10 rst = 0;
            //#10 en = 1;

           //@(posedge clk_50)
           //  begin
           //     $display("alex");
           //     cycle_count = cycle_count + 1;
           //  end

            //time_start = $time;
            //expected_result = input_bin_a * input_bin_b;
            
            
            
            
            //wait(clk_50);
            //time_end = $time;
            #20
            
            //expected_result = input_bin_a * input_bin_b;
            //cycle_count = time_end - time_start;
            //cycle_count_acc += cycle_count;
            
            
            $display("Test %d : a=%d, b=%d, a_sub_b=%d, a_new=%d, b_new=%d",i,input_bin_a, input_bin_b, cas_tb.dut.a_sub_b, output_bin_a_new ,output_bin_b_new);
            

            if(output_bin_b_new > output_bin_a_new) begin
               $display("ERROR : a_new = %d, b_new = %d", output_bin_a_new,output_bin_b_new);
            end
            
            
            //$display("alex : expected : %d * %d = %d", input_bin_a, input_bin_b, expected_result);
            //$display("alex : obtained : %d",bin_out);
            //rst = 1;
            //en  = 0;
            //cycle_count = 0;
            
            
              
         end
       
       
       

       

         

       //wait(op_finished == 1);
       
       //#10

       

       
       
       
       
       
       
       
       
       
                                  
    //wait ((ctr3_out == 8'hff))
    
    //wait ({a,b,par,c} == 10'b1111111111)
    //#1000
       
    //$display("Average cycle time : %f",cycle_count_acc/`NUM_TESTS);
    $display(" << Simulation Complete >> ");
       
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
    //$monitor($time, " rst=%b, en=%b, bin_a=%h, bin_b=%h, ctr_a=%h, ctr_b=%h, ov_a=%b, ov_b=%b, sn_a=%b, sn_b=%b,mul_out=%b,bin_out=%h",
    //         rst, 
    //         en, 
    //         input_bin_a, 
    //         input_bin_b, 
    //         dsc_mul_tb.dut.prg_a.ctr4_out, 
    //         dsc_mul_tb.dut.prg_b.ctr4_out, 
    //         dsc_mul_tb.dut.ctr_ov_a, 
    //         dsc_mul_tb.dut.ctr_ov_b, 
    //         dsc_mul_tb.dut.sn_out_a,
    //         dsc_mul_tb.dut.sn_out_b,
    //         dsc_mul_tb.dut.sn_out_mul,
    //         bin_out);
    
    
 
   
    
    
    
// always @ (posedge clk_50)
    //   a = a+1;
    // end
     
 end // initial begin
   
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