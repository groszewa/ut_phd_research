`timescale 1 ns / 100 ps

`include "params.vh"


module tb_top;
//--------------------------------------------------------- // inputs to the DUT are reg type
   integer NUM_TESTS;
   integer CYCLES_OVERRIDE;
   integer r, calc_mae, debug_on, input_from_file;
   string  file_name;
   int     file_pointer;
   string  file_line_data;
   
   
   
   
   reg gclk;
   reg en;
   reg rst;

   reg [DATA_WIDTH-1:0]   bin_in00;
   reg [DATA_WIDTH-1:0]   bin_in01;
   reg [DATA_WIDTH-1:0]   bin_in10;
   reg [DATA_WIDTH-1:0]   bin_in11;
  
   wire [DATA_WIDTH-1:0]      bin_data_out;
      
   wire           op_finished;

   longint       expected_result;
   longint       outval_int;
   longint       sub;

   real          expected_result_frac;
   real          frac_data_out;
   
   longint          denom;         
   
   wire [WXIP1:0]    cycle_count;
   wire                cycle_count_overflow;
   
   integer         test;
   integer         wx,wy;
   
   real            cycle_count_acc;
   real            absolute_error_acc;
   
            

   core #(.DATA_WIDTH(DATA_WIDTH), 
          .NUM_INPUTS(NUM_INPUTS)) core_inst (.*);
   

   
   
//count number of clock cycles here
//TODO//                   

   counter #(.WIDTH(WXIP1), 
             .STRIDE(1)) cycle_counter (
                                        .clk(gclk),
                                        .rst(rst),
                                        .en(en),
                                        .countval(cycle_count),
                                        .overflow(cycle_count_overflow));
   
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
          
       
       input_from_file = $value$plusargs("INPUT_DATA_FILE=%s", file_name);
       if(input_from_file) begin
          $display("Getting input vectors from file : %s", file_name);
          file_pointer = $fopen(file_name,"r");
          if(file_pointer) begin
             $display("File %s opened successfully", file_name);
             $fscanf(file_pointer, "%0d\n", NUM_TESTS);
             $display("Overwriting NUM_TESTS to %0d",NUM_TESTS);
          end else begin
             $fatal("Could not open file %s", file_name);
          end
       end else begin
          $display("Generating random input vectors");
       end
         
       

   

       if(input_from_file) begin
          $display("Not generating waveforms for file input run");
       end else begin
          //need vcd for power simulation
          $dumpfile ("tb_top.vcd");
          $dumpvars(0,tb_top);
          //need vpd for better viewing
          $vcdplusfile("tb_top.vpd");
          $vcdpluson(0,tb_top);
       end // else: !if(input_from_file)
       
       
       
       $display($time, " << Starting the Simulation >>");
       gclk = 0;
       en = 0;
       rst = 1;
              
       #10
       rst = 0;
       
       #10
       en  = 1;


      
     
       for(test=0;test<NUM_TESTS;test++)
         begin
            //fixme
            if(input_from_file) begin
               $fscanf(file_pointer, "%0d %0d %0d %0d : ", bin_in00, bin_in10, bin_in01, bin_in11);
            end else begin 
               bin_in00 = $random();
               bin_in01 = $random();
               bin_in10 = $random();
               bin_in11 = $random();
            end
            
            
            #10 rst = 0;
            #10 en = 1;

            wx = (bin_in00>bin_in11) ? 
                 (bin_in00 - bin_in11) : 
                 (bin_in11 - bin_in00);
            wy = (bin_in01>bin_in10) ? 
                 (bin_in01 - bin_in10) : 
                 (bin_in10 - bin_in01);

            if(input_from_file) begin
               $fscanf(file_pointer, "%0d\n", expected_result);
            end else begin
               expected_result = ((wx + wy) & 16'hff00) ? 8'hff : (wx + wy);
            end
            

            wait(op_finished || (calc_mae && (cycle_count==CYCLES_OVERRIDE)));
            #20
            
            cycle_count_acc += cycle_count;
            
            
            if(debug_on) begin
               $write("Test %4d : ", test);
               $write("input00=%d, input01=%d, input10=%d, input11=%d, wx=%3d, wy=%3d, ",bin_in00, bin_in01, bin_in10, bin_in11, wx, wy); 
               $display("output=%3d, cycle_count=%3d",bin_data_out,cycle_count);
            end

            if(cycle_count <= MIN_CYC_DSC) begin
               denom = MIN_CYC_DSC;
            end
            else begin
               denom = cycle_count;
            end
            expected_result_frac = $itor(expected_result)/$itor(MIN_CYC_DSC);
            
            frac_data_out = $itor(bin_data_out)/$itor(denom);

            if(expected_result_frac !== frac_data_out) begin
               if(calc_mae) begin
                  
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
                  $fatal("ERROR : RTL(%0d) != EXPECTED(%0d)",bin_data_out,expected_result);
               end // if (!calc_mae)
            end // if (expected_result_frac !== frac_data_out)
            rst = 1;
            en  = 0;
         end

       
    $display("average_cycle_time  : %f",cycle_count_acc/NUM_TESTS);
    $display("MAE : %f",absolute_error_acc/NUM_TESTS);
    $display(" << Simulation Complete >> ");

    if(input_from_file) begin
       $display("Closing file %s", file_name);
    end
       
    $finish; //stop similation and give control back to OS
    //$stop;
       
  end // initial begin


   
endmodule // tb_top

function real absolute(input real a);
   if(a >= 0) return (a);
   else return (-a);
endfunction // absolute


