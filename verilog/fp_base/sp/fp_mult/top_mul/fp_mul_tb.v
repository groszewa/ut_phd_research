`timescale 1 ns / 100 ps

  module fp_mul_tb ();

   reg clk;
   reg rst;
   reg [31:0] a,b;
   reg        rdy;
   

   wire [31:0] z;





fp_mul DUT  (
  .clk(clk),
  .rst(rst),
  .rdy(rdy),
  .a(a),
  .b(b),
  .z(z));



initial begin
   //$dumpfile ("fp_mul_tb.dump");
   //$dumpvars(0,fp_mul_tb);
   $vcdplusfile("fp_mul_tb.vpd");
   $vcdpluson(0,fp_mul_tb);
   $display($time, " << Starting the Simulation >>");
   rst <= 1'b1;
   rdy <= 1'b0;
   #50 rst <= 1'b0;

   #50
   //2
   a <= 32'h40000000;
   //3
   b <= 32'h40400000;
   rdy <= 1'b1;
   #10
   rdy <= 1'b0;
  //I expect 0x40c00000

   #120
   //3
   a <= 32'h40400000;
   //3
   b <= 32'h40400000;
   rdy <= 1'b1;
   #10
   rdy <= 0;
   // I expect 0x41100000

   #120
   //3
   a <= 0;
   //3
   b <= 32'h40400000;
   rdy <= 1'b1;
   #10
   rdy <= 0;
   //I expect 0
   
     
     
   
   
   
   #1000 $display(" << Simulation Complete >>");
   $finish;
end

initial begin
   clk <= 1'b0;
   while(1) begin
      #5 clk <= ~clk;
   end
end

endmodule // fp_mul_tb
