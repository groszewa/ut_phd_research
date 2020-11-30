`ifndef __CAS__
`define __CAS__


module CAS_PRIM #(parameter WIDTH=3) (
  a,
  b,
  _min,
  _max
);

   input  [WIDTH-1:0] a,b;
   output [WIDTH-1:0] _min,_max;

   assign _max = (a < b) ? b : a;
   assign _min = (a < b) ? a : b;
   
endmodule // CAS_PRIM

module CAS #(parameter NUM_INPUTS=2,parameter WIDTH=3) (
  data,
  data_ordered
);

   input  [WIDTH-1:0] data         [NUM_INPUTS-1:0];
   input  [WIDTH-1:0] data_ordered [NUM_INPUTS-1:0];

   
   if(NUM_INPUTS==2) begin
      CAS_PRIM #(WIDTH) cas_a_b (.a(data[0]),
                                .b(data[1]),
                                ._min(data_ordered[1]),
                                ._max(data_ordered[0])
                                );
   end
   else if (NUM_INPUTS==3) begin
      wire [WIDTH-1:0] ab_min, ab_max, abminc_max;
      CAS_PRIM #(WIDTH) cas_a_b (.a(data[0]),
                                .b(data[1]),
                                ._min(ab_min),
                                ._max(ab_max)
                                );
      CAS_PRIM #(WIDTH) cas_abmin_c (.a(ab_min),
                                    .b(data[2]),
                                    ._min(data_ordered[2]),
                                    ._max(abminc_max)
                                    );
      CAS_PRIM #(WIDTH) cas_abmax_abminc (.a(ab_max),
                                          .b(abminc_max),
                                          ._min(data_ordered[1]),
                                          ._max(data_ordered[0])
                                          );
   end
   else if (NUM_INPUTS==4) begin
      //FIXME
   end
   else if (NUM_INPUTS==5) begin
      //FIXME
   end
   

endmodule // CAS

   
                

`endif
