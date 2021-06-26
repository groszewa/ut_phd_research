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
      wire [WIDTH-1:0] a_b_min, a_b_max, c_d_min, c_d_max;
      wire [WIDTH-1:0] abmax_cdmax_min, abmin_cdmin_max;
      
      CAS_PRIM #(WIDTH) cas_a_b (.a(data[0]),
                                 .b(data[1]),
                                 ._min(a_b_min),
                                 ._max(a_b_max)
                                );
      CAS_PRIM #(WIDTH) cas_c_d (.a(data[2]),
                                 .b(data[3]),
                                 ._min(c_d_min),
                                 ._max(c_d_max)
                                    );
      CAS_PRIM #(WIDTH) cas_abmax_cdmax (.a(a_b_max),
                                         .b(c_d_max),
                                         ._min(abmax_cdmax_min),
                                         ._max(data_ordered[0])
                                         );
      CAS_PRIM #(WIDTH) cas_abmin_cdmin (.a(a_b_min),
                                         .b(c_d_min),
                                         ._min(data_ordered[3]),
                                         ._max(abmin_cdmin_max)
                                         );
      CAS_PRIM #(WIDTH) cas_abmaxcdmax_abmincdmin (.a(abmax_cdmax_min),
                                                   .b(abmin_cdmin_max),
                                                   ._min(data_ordered[2]),
                                                   ._max(data_ordered[1])
                                                   );           
   end
   else if (NUM_INPUTS==5) begin
      wire [WIDTH-1:0] cas0_max, cas0_min, cas1_max, cas1_min;
      wire [WIDTH-1:0] cas2_max, cas2_min, cas3_max, cas3_min;
      wire [WIDTH-1:0] cas4_max, cas4_min, cas5_max;
      wire [WIDTH-1:0] cas6_min, cas7_max;
      //Stage 1
      CAS_PRIM #(WIDTH) cas0 (.a(data[1]),
                              .b(data[2]),
                              ._min(cas0_min),
                              ._max(cas0_max)
                              );
      CAS_PRIM #(WIDTH) cas1 (.a(data[3]),
                              .b(data[4]),
                              ._min(cas1_min),
                              ._max(cas1_max)
                              );
      //Stage 2
      CAS_PRIM #(WIDTH) cas2 (.a(data[0]),
                              .b(cas0_min),
                              ._min(cas2_min),
                              ._max(cas2_max)
                              );
      CAS_PRIM #(WIDTH) cas3 (.a(cas0_max),
                              .b(cas1_max),
                              ._min(cas3_min),
                              ._max(cas3_max)
                              );
      //Stage 3
      CAS_PRIM #(WIDTH) cas4 (.a(cas2_max),
                              .b(cas3_min),
                              ._min(cas4_min),
                              ._max(cas4_max)
                              );
      CAS_PRIM #(WIDTH) cas5 (.a(cas2_min),
                              .b(cas1_min),
                              ._min(data_ordered[4]),
                              ._max(cas5_max)
                              );
      //Stage 4
      CAS_PRIM #(WIDTH) cas6 (.a(cas4_max),
                              .b(cas3_max),
                              ._min(cas6_min),
                              ._max(data_ordered[0])
                              );
      CAS_PRIM #(WIDTH) cas7 (.a(cas4_min),
                              .b(cas5_max),
                              ._min(data_ordered[3]),
                              ._max(cas7_max)
                              );
       //Stage 5
      CAS_PRIM #(WIDTH) cas8 (.a(cas6_min),
                              .b(cas7_max),
                              ._min(data_ordered[2]),
                              ._max(data_ordered[1])
                              );
   end
   

endmodule // CAS

   
                

`endif
