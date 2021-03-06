`timescale 1 ns / 100 ps

`include "params.vh"


module tb_top;
//--------------------------------------------------------- // inputs to the DUT are reg type
   integer NUM_TESTS;
   integer CYCLES_OVERRIDE;
   integer r, calc_mae, debug_on;
   
   
   reg gclk;
   reg en;
   reg rst;

   reg [DATA_WIDTH-1:0]   bin_data_in [NUM_INPUTS-1:0];
   
   
   
   
   wire [WXIP1-1:0]      bin_data_out;
      
   wire           op_finished;

   longint       expected_result;
   longint       outval_int;
   longint       sub;

   real          expected_result_frac;
   real          frac_data_out;
   
   longint          denom;         
   
   wire [WXIP1-1:0]    cycle_count;
   wire                cycle_count_overflow;
   
   integer         test;
   real            cycle_count_acc;
   real            absolute_error_acc;
   
            

core #(.DATA_WIDTH(DATA_WIDTH), .NUM_INPUTS(NUM_INPUTS), .WXIP1(WXIP1)) core_inst (.*);
   

   
   
//count number of clock cycles here
//TODO//                   

counter #(.WIDTH(WXIP1), .STRIDE(1)) cycle_counter (
  .clk(gclk),
  .rst(rst),
  .en(en),
  .countval(cycle_count),
  .overflow(cycle_count_overflow)
);
   


   

   
//---------------------------------------------------------- // create a 50Mhz clock
always
    #10 gclk = ~gclk;   // every ten nanoseconds invert
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

       if($test$plusargs("INJECT_FAIL")) begin
          $fatal("ERROR : Fail induced with +INJECT_FAIL, exiting.");
       end
          
       
          
       

   

       if(debug_on) begin
          //need vcd for power simulation
          $dumpfile ("tb_top.vcd");
          $dumpvars(0,tb_top);

          //need vpd for better viewing
          $vcdplusfile("tb_top.vpd");
          $vcdpluson(0,tb_top);
       end
       
       
    $display($time, " << Starting the Simulation >>");
       gclk = 0;
       en = 0;
       rst = 1;

       #10
       
       for(int i=0; i<NUM_INPUTS;i++) begin : init_loop
          bin_data_in[i] = '0;
       end // init_loop

       for(test=0;test<NUM_TESTS;test++)
         begin
            for(int i=0;i<NUM_INPUTS;i++) begin : randomize_loop
               bin_data_in[i] = $random();
            end // randomize_loop
            
            
            
            #10 rst = 0;
            #10 en = 1;

            expected_result = 1;
            for(int i=0;i<NUM_INPUTS;i++) begin : result_loop
               expected_result *= bin_data_in[i];
            end
            
            
            
            wait(op_finished || (calc_mae && (cycle_count==CYCLES_OVERRIDE)));
            #20
            
            cycle_count_acc += cycle_count;
            
            
            if(debug_on) begin
            	$write("Test %4d : ", test);
            	for(int i=0;i<NUM_INPUTS;i++) begin
            	   $write("input[%1d]=%d, ",i,bin_data_in[i]);
            	end
            	$display("output=%d, cycle_count=%10d",bin_data_out,cycle_count);
            end

            //expected_result_frac = 1.0;
            //for(int i=0;i<NUM_INPUTS;i++) begin : result_loop_frac
            //   expected_result_frac *= $itor(bin_data_in[i])/$itor(cycle_count);
            //end


            if(cycle_count <= MIN_CYC_DSC) begin
               denom = MIN_CYC_DSC;
            end
            else begin
               denom = cycle_count;
            end
            //expected_result_frac = $itor(expected_result)/$itor(denom);
            expected_result_frac = $itor(expected_result)/$itor(MIN_CYC_DSC);
            
            frac_data_out = $itor(bin_data_out)/$itor(denom);
            //$display("expected_int = %6d, actual_int = %6d", expected_result, bin_data_out);            
            //$display("expected = %f, actual = %f", expected_result_frac, frac_data_out);
            

            if(expected_result_frac !== frac_data_out) begin
               if(calc_mae) begin
                  //outval_int = longint'(bin_data_out);
                  //display("MISMATCH : Test %4d : cycles_count=%10d, output=%6d, expected=%6d, AE=%f", test, cycle_count, bin_data_out, expected_result, absolute(longint'(bin_data_out)-expected_result)/expected_result);
                  real ae;
                  
                  if(expected_result_frac > 1) begin
                     ae = 1.0;
                     $display("WARNING: Expected output of %10d cannot be represented in %10d cycles, assigning max absolute error!",expected_result,denom);
                  end else begin
                    ae = absolute(frac_data_out-expected_result_frac)/expected_result_frac;
                  end
               
                 
                  
                  $display("MISMATCH : Test %4d : cycles_count=%10d, output=%f (%6d/%10d), expected=%f (%6d/%10d), AE=%f", test, cycle_count, frac_data_out , bin_data_out, denom, expected_result_frac,expected_result,MIN_CYC_DSC, ae);
        
                  absolute_error_acc += ae;
               end else begin // if (calc_mae)
                  if(debug_on) begin                     
                     $display("ERROR : RTL(%0d) != EXPECTED(%0d)",bin_data_out,expected_result);
                  end else begin
                     $fatal("ERROR : RTL(%0d) != EXPECTED(%0d)",bin_data_out,expected_result);
                  end                                  
               end // if (!calc_mae)
            end // if (expected_result_frac !== frac_data_out)
            rst = 1;
            en  = 0;
         end

       
    $display("average_cycle_time  : %f",cycle_count_acc/NUM_TESTS);
    $display("MAE : %f",absolute_error_acc/NUM_TESTS);
    $display(" << Simulation Complete >> ");
       
    $finish; //stop similation and give control back to OS
    //$stop;
       
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

//function real absolute(input longint a);
//   if(a >= 0) return (a);
//   else return (-a);
//endfunction // absolute

function real absolute(input real a);
   if(a >= 0) return (a);
   else return (-a);
endfunction // absolute


