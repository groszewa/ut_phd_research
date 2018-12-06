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
#no need for this in shiftreg design as it does not do clock division
#create_generated_clock -source [get_ports clk] -name clk_int -divide_by 1 [get_pins /designs/dsc_mul/instances_hier/prg_b/pins_in/clk]

#create_generated_clock -source [get_ports clk] -name clk_int -divide_by 1 [get_pins /designs/dsc_mul/instances_seq/ctr_fsm_en_reg/pins_in/ena]
#create_generated_clock -source [get_ports clk] -name clk_int -divide_by 1 [get_pins /designs/dsc_mul/instances_seq/en_prg_a_reg/pins_in/ena]
#create_generated_clock -source [get_ports clk] -name clk_int -divide_by 1 [get_pins /designs/dsc_mul/instances_seq/en_prg_b_reg/pins_in/ena]
#create_generated_clock -source [get_ports clk] -name clk_int -divide_by 1 [get_pins /designs/dsc_mul/instances_seq/en_sr_a_reg/pins_in/ena]
#create_generated_clock -source [get_ports clk] -name clk_int -divide_by 1 [get_pins /designs/dsc_mul/instances_seq/en_sr_b_reg/pins_in/ena]
#create_generated_clock -source [get_ports clk] -name clk_int -divide_by 1 [get_pins /designs/dsc_mul/instances_seq/ov_reg/pins_in/ena]
#create_generated_clock -source [get_ports clk] -name clk_int -divide_by 1 [get_pins /designs/dsc_mul/instances_seq/ov_reg40/pins_in/ena]
#create_generated_clock -source [get_ports clk] -name clk_int -divide_by 1 [get_pins /designs/dsc_mul/instances_seq/rst_output_ctr_reg/pins_in/ena]
#create_generated_clock -source [get_ports clk] -name clk_int -divide_by 1 [get_pins /designs/dsc_mul/instances_seq/wrap_mode_a_reg/pins_in/ena]
#create_generated_clock -source [get_ports clk] -name clk_int -divide_by 1 [get_pins /designs/dsc_mul/instances_seq/wrap_mode_b_reg/pins_in/ena]


