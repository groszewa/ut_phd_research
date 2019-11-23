current_design dsc_mul

##create top level clock and set period/duty cycle - set period to match vcd
create_clock [get_ports {clk}]  -name clk -period 5 -waveform {0 2.5}

##set clock skew
set_clock_uncertainty  -setup 0.05 [get_clocks clk]
set_clock_uncertainty  -hold  0.05 [get_clocks clk]

#set input delays
set_input_delay -min 0.1 -clock  [get_clocks clk] [all_inputs]
set_input_delay -max 0.1 -clock  [get_clocks clk] [all_inputs]

#set output delays
set_output_delay -max 0.1 -clock  [get_clocks clk] [all_outputs]

#set input transitions
set_input_transition 0.02 [all_inputs]

#set output loading
set_load 0.01 [all_outputs]

#create generated clock at input of prg b since the "clock" is overflow signal of prg a
#create_generated_clock -source [get_ports clk] -name clk_int  -divide_by 1 [get_pins /designs/dsc_serial_mul/instances_hier/sng_dsc[1]/pins_in/clk]
create_generated_clock -source [get_ports clk] -name clk_int  -divide_by 1 [get_pins /designs/dsc_serial_mul_DATA_WIDTH8_NUM_INPUTS4/instances_hier/genblk1[1].genblk1.sng/pins_in/clk]
create_generated_clock -source [get_ports clk] -name clk_int2 -divide_by 1 [get_pins /designs/dsc_serial_mul_DATA_WIDTH8_NUM_INPUTS4/instances_hier/genblk1[2].genblk1.sng/pins_in/clk]
create_generated_clock -source [get_ports clk] -name clk_int3 -divide_by 1 [get_pins /designs/dsc_serial_mul_DATA_WIDTH8_NUM_INPUTS4/instances_hier/genblk1[2].genblk1.sng/pins_in/clk]
