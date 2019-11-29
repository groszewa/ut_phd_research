`timescale 1 ns / 100 ps

`include "params.vh"
`define TESTBENCH


module dsc_serial_mul_tb;
//--------------------------------------------------------- // inputs to the DUT are reg type
   integer NUM_TESTS;
   integer CYCLES_OVERRIDE;
   integer r, calc_mae, debug_on;
   
   
   reg clk_50;
   reg en;
   reg rst;

   //reg [`INPUT_WIDTH-1:0] input_bin_a, input_bin_b,input_bin_c,input_bin_d;
   reg [DATA_WIDTH-1:0]   bin_in [NUM_INPUTS-1:0];
   
   
   
   
   //wire [`INPUT_WIDTH*`NUM_INPUTS-1:0]     bin_out;
   wire [(NUM_INPUTS*DATA_WIDTH)-1:0]      bin_out;
      
   wire           op_finished;

   shortint       expected_result;
   shortint       outval_int;
   shortint       sub;
      
   

   wire [99:0]    cycle_count;
   wire           cycle_count_overflow;
   
   integer         test;
   real            cycle_count_acc;
   real            absolute_error_acc;
   
            

dsc_serial_mul #(.DATA_WIDTH(DATA_WIDTH), .NUM_INPUTS(NUM_INPUTS)) dut (
  .clk(clk_50),
  .rst(rst),
  .en(en),
  .bin_data_in(bin_in),
  .bin_data_out(bin_out),
  .done(op_finished)
);
   
   
//count number of clock cycles here
//TODO//                   

counter #(.WIDTH(100), .STRIDE(1)) cycle_counter (
  .clk(clk_50),
  .rst(rst),
  .en(en),
  .countval(cycle_count),
  .overflow(cycle_count_overflow)
);
   


   

   
//---------------------------------------------------------- // create a 50Mhz clock
always
    #10 clk_50 = ~clk_50;   // every ten nanoseconds invert
//----------------------------------------------------------- // initial blocks are sequential and start at time 0
  initial
    begin

       r = $value$plusargs("NUM_TESTS=%d", NUM_TESTS);
       $display("num_tests = %d", NUM_TESTS);

       calc_mae = $value$plusargs("CYCLES_OVERRIDE=%d", CYCLES_OVERRIDE);
       if(calc_mae) begin 
          $display("CYCLES_OVERRIDE detected, each operation will take %d cycles.", CYCLES_OVERRIDE);
       end else begin 
          $display("No CYCLES_OVERRIDE detected, will assume full accuracy");   
       end

       debug_on = $test$plusargs("DEBUG");
       
          
       

   

       //need vcd for power simulation
       $dumpfile ("dsc_serial_mul_tb.vcd");
       $dumpvars(0,dsc_serial_mul_tb);

       //need vpd for better viewing
       $vcdplusfile("dsc_serial_mul_tb.vpd");
       $vcdpluson(0,dsc_serial_mul_tb);
       
       
    $display($time, " << Starting the Simulation >>");
       clk_50 = 0;
       en = 0;
       rst = 1;
       
       for(int i=0; i<NUM_INPUTS;i++) begin : init_loop
          bin_in[i] = '0;
       end // init_loop
       
       #10
       rst = 0;
       
       #10
       en  = 1;  
     
       for(test=0;test<NUM_TESTS;test++)
         begin
            for(int i=0;i<NUM_INPUTS;i++) begin : randomize_loop
               bin_in[i] = $random();
            end // randomize_loop
            
            
            
            #10 rst = 0;
            #10 en = 1;

            //expected_result = input_bin_a * input_bin_b * input_bin_c * input_bin_d;
            expected_result = 1;
            for(int i=0;i<NUM_INPUTS;i++) begin : result_loop
               expected_result *= bin_in[i];
            end
            
            
            
            wait(op_finished || (calc_mae && (cycle_count==CYCLES_OVERRIDE)));
            #20
            
            cycle_count_acc += cycle_count;
            
            
            //$display("Test %d : a=%d, b=%d, c=%d, d=%d, z=%d, cycle_count=%d",i,input_bin_a,input_bin_b,input_bin_c,input_bin_d,bin_out,cycle_count);
            //$display("FIXME Test %d : cycle_count=%d",test,cycle_count);
            if(debug_on) begin
            	$write("Test %4d : ", test);
            	for(int i=0;i<NUM_INPUTS;i++) begin
            	   $write("input[%1d]=%d, ",i,bin_in[i]);
            	end
            	$display("output=%d, cycle_count=%10d",bin_out,cycle_count);
            end
            
            
            
            
            

            if(expected_result != bin_out) begin
               //$display("ERROR : a=%d, b=%d, c=%d, d=%d, z=%d, expected=%d",input_bin_a,input_bin_b,input_bin_c,input_bin_d,bin_out,expected_result);
               if(calc_mae) begin
                  outval_int = shortint'(bin_out);
                  $display("output=%d, expected=%d, MAE=%d", bin_out, expected_result, absolute(shortint'(bin_out)-expected_result));
                  absolute_error_acc += absolute(bin_out-expected_result);
               end else begin  
                  $fatal("ERROR : RTL(%d) != EXPECTED(%d)",bin_out,expected_result);
               end
            end
            rst = 1;
            en  = 0;
         end


       
    $display("Average cycle time  : %f",cycle_count_acc/NUM_TESTS);
    $display("Mean Absolute Error : %f",absolute_error_acc/NUM_TESTS);
    $display(" << Simulation Complete >> ");
       
    $finish; //stop similation and give control back to OS
  end // initial begin


//-------------------------------------------------------------- // This initial block runs concurrently with the other
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
 end // initial begin
   
endmodule //of cnt16_tb

function shortint absolute(input shortint a);
   if(a >= 0) return (a);
   else return (-a);
endfunction // absolute

