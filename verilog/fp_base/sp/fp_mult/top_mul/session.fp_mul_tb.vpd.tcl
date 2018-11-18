# Begin_DVE_Session_Save_Info
# DVE global only(Breakpoint Bus Radix Expression TimeShift Compare SignalGroup Highlight Stack ) session
# Saved on Wed Oct 10 22:51:13 2018
# Toplevel windows open: 2
# 	TopLevel.1
# 	TopLevel.2
# End_DVE_Session_Save_Info

# DVE version: K-2015.09-SP1_Full64
# DVE build date: Nov 24 2015 21:15:24


#<Session mode="Global Only" path="/misc/scratch/ajgrosze/verilog/fp_base/sp/fp_mult/top_mul/session.fp_mul_tb.vpd.tcl" type="Debug">

#<Database>

gui_set_time_units 100ps
#</Database>

# DVE Global setting session: 


# Global: Bus

# Global: User-defined Radicies
gui_set_userradix -name alex {  { 32'h00000000 +ZERO #8b0000 #000000 }  { 32'h80000000 {-ZERO} #8b0000 #000000 }  { 32'h7f8000000 +Inf #8b0000 #000000 }  { 32'hff8000000 {-Inf} #8b0000 #000000 }  { 32'hffc000000 NaN #8b0000 #000000 }  }


# Global: Expressions

# Global: Signal Time Shift

# Global: Signal Compare

# Global: Signal Groups
gui_load_child_values {fp_mul_tb.DUT}


set _session_group_1 Group1
if {[gui_sg_is_group -name "$_session_group_1"]} {
        set _session_group_1 [gui_sg_generate_new_name]
}
set Group1 "$_session_group_1"

gui_sg_addsignal -group "$_session_group_1" { fp_mul_tb.DUT.clk fp_mul_tb.DUT.rst fp_mul_tb.DUT.a fp_mul_tb.DUT.b fp_mul_tb.DUT.rdy fp_mul_tb.DUT.z fp_mul_tb.DUT.a_m fp_mul_tb.DUT.b_m fp_mul_tb.DUT.z_m fp_mul_tb.DUT.a_e fp_mul_tb.DUT.b_e fp_mul_tb.DUT.z_e fp_mul_tb.DUT.a_s fp_mul_tb.DUT.b_s fp_mul_tb.DUT.z_s fp_mul_tb.DUT.fsm_state fp_mul_tb.DUT.reg_z fp_mul_tb.DUT.a_nan fp_mul_tb.DUT.a_inf fp_mul_tb.DUT.a_zero fp_mul_tb.DUT.b_nan fp_mul_tb.DUT.b_inf fp_mul_tb.DUT.b_zero fp_mul_tb.DUT.mant_mul_out fp_mul_tb.DUT.guard fp_mul_tb.DUT.round fp_mul_tb.DUT.sticky fp_mul_tb.DUT.unpack fp_mul_tb.DUT.exp_logic fp_mul_tb.DUT.pack fp_mul_tb.DUT.rst_hold fp_mul_tb.DUT.multiply fp_mul_tb.DUT.gen_grs_bits fp_mul_tb.DUT.normalize fp_mul_tb.DUT.round_res }
gui_set_radix -radix {alex} -signals {V1:fp_mul_tb.DUT.a}
gui_set_radix -radix {alex} -signals {V1:fp_mul_tb.DUT.b}
gui_set_radix -radix {alex} -signals {V1:fp_mul_tb.DUT.z}
gui_set_radix -radix {state} -signals {V1:fp_mul_tb.DUT.fsm_state}
gui_set_radix -radix {decimal} -signals {V1:fp_mul_tb.DUT.unpack}
gui_set_radix -radix {unsigned} -signals {V1:fp_mul_tb.DUT.unpack}
gui_set_radix -radix {decimal} -signals {V1:fp_mul_tb.DUT.exp_logic}
gui_set_radix -radix {unsigned} -signals {V1:fp_mul_tb.DUT.exp_logic}
gui_set_radix -radix {decimal} -signals {V1:fp_mul_tb.DUT.pack}
gui_set_radix -radix {unsigned} -signals {V1:fp_mul_tb.DUT.pack}
gui_set_radix -radix {decimal} -signals {V1:fp_mul_tb.DUT.rst_hold}
gui_set_radix -radix {unsigned} -signals {V1:fp_mul_tb.DUT.rst_hold}
gui_set_radix -radix {decimal} -signals {V1:fp_mul_tb.DUT.multiply}
gui_set_radix -radix {unsigned} -signals {V1:fp_mul_tb.DUT.multiply}
gui_set_radix -radix {decimal} -signals {V1:fp_mul_tb.DUT.gen_grs_bits}
gui_set_radix -radix {unsigned} -signals {V1:fp_mul_tb.DUT.gen_grs_bits}
gui_set_radix -radix {decimal} -signals {V1:fp_mul_tb.DUT.normalize}
gui_set_radix -radix {unsigned} -signals {V1:fp_mul_tb.DUT.normalize}
gui_set_radix -radix {decimal} -signals {V1:fp_mul_tb.DUT.round_res}
gui_set_radix -radix {unsigned} -signals {V1:fp_mul_tb.DUT.round_res}

set _session_group_2 Group2
if {[gui_sg_is_group -name "$_session_group_2"]} {
        set _session_group_2 [gui_sg_generate_new_name]
}
set Group2 "$_session_group_2"

gui_sg_addsignal -group "$_session_group_2" { fp_mul_tb.DUT.clk fp_mul_tb.DUT.rst fp_mul_tb.DUT.a fp_mul_tb.DUT.b fp_mul_tb.DUT.rdy fp_mul_tb.DUT.z fp_mul_tb.DUT.a_m fp_mul_tb.DUT.b_m fp_mul_tb.DUT.z_m fp_mul_tb.DUT.a_e fp_mul_tb.DUT.b_e fp_mul_tb.DUT.z_e fp_mul_tb.DUT.a_s fp_mul_tb.DUT.b_s fp_mul_tb.DUT.z_s fp_mul_tb.DUT.fsm_state fp_mul_tb.DUT.reg_z fp_mul_tb.DUT.a_nan fp_mul_tb.DUT.a_inf fp_mul_tb.DUT.a_zero fp_mul_tb.DUT.b_nan fp_mul_tb.DUT.b_inf fp_mul_tb.DUT.b_zero fp_mul_tb.DUT.mant_mul_out fp_mul_tb.DUT.guard fp_mul_tb.DUT.round fp_mul_tb.DUT.sticky fp_mul_tb.DUT.add_to_exp fp_mul_tb.DUT.unpack fp_mul_tb.DUT.exp_logic fp_mul_tb.DUT.pack fp_mul_tb.DUT.rst_hold fp_mul_tb.DUT.multiply fp_mul_tb.DUT.gen_grs_bits fp_mul_tb.DUT.normalize fp_mul_tb.DUT.round_res }
gui_set_radix -radix {alex} -signals {V1:fp_mul_tb.DUT.a}
gui_set_radix -radix {alex} -signals {V1:fp_mul_tb.DUT.b}
gui_set_radix -radix {alex} -signals {V1:fp_mul_tb.DUT.z}
gui_set_radix -radix {state} -signals {V1:fp_mul_tb.DUT.fsm_state}
gui_set_radix -radix {decimal} -signals {V1:fp_mul_tb.DUT.unpack}
gui_set_radix -radix {unsigned} -signals {V1:fp_mul_tb.DUT.unpack}
gui_set_radix -radix {decimal} -signals {V1:fp_mul_tb.DUT.exp_logic}
gui_set_radix -radix {unsigned} -signals {V1:fp_mul_tb.DUT.exp_logic}
gui_set_radix -radix {decimal} -signals {V1:fp_mul_tb.DUT.pack}
gui_set_radix -radix {unsigned} -signals {V1:fp_mul_tb.DUT.pack}
gui_set_radix -radix {decimal} -signals {V1:fp_mul_tb.DUT.rst_hold}
gui_set_radix -radix {unsigned} -signals {V1:fp_mul_tb.DUT.rst_hold}
gui_set_radix -radix {decimal} -signals {V1:fp_mul_tb.DUT.multiply}
gui_set_radix -radix {unsigned} -signals {V1:fp_mul_tb.DUT.multiply}
gui_set_radix -radix {decimal} -signals {V1:fp_mul_tb.DUT.gen_grs_bits}
gui_set_radix -radix {unsigned} -signals {V1:fp_mul_tb.DUT.gen_grs_bits}
gui_set_radix -radix {decimal} -signals {V1:fp_mul_tb.DUT.normalize}
gui_set_radix -radix {unsigned} -signals {V1:fp_mul_tb.DUT.normalize}
gui_set_radix -radix {decimal} -signals {V1:fp_mul_tb.DUT.round_res}
gui_set_radix -radix {unsigned} -signals {V1:fp_mul_tb.DUT.round_res}

set _session_group_3 Group3
if {[gui_sg_is_group -name "$_session_group_3"]} {
        set _session_group_3 [gui_sg_generate_new_name]
}
set Group3 "$_session_group_3"

gui_sg_addsignal -group "$_session_group_3" { fp_mul_tb.DUT.clk fp_mul_tb.DUT.rst fp_mul_tb.DUT.a fp_mul_tb.DUT.b fp_mul_tb.DUT.rdy fp_mul_tb.DUT.z fp_mul_tb.DUT.a_m fp_mul_tb.DUT.b_m fp_mul_tb.DUT.z_m fp_mul_tb.DUT.a_e fp_mul_tb.DUT.b_e fp_mul_tb.DUT.z_e fp_mul_tb.DUT.a_s fp_mul_tb.DUT.b_s fp_mul_tb.DUT.z_s fp_mul_tb.DUT.fsm_state fp_mul_tb.DUT.reg_z fp_mul_tb.DUT.a_nan fp_mul_tb.DUT.a_inf fp_mul_tb.DUT.a_zero fp_mul_tb.DUT.b_nan fp_mul_tb.DUT.b_inf fp_mul_tb.DUT.b_zero fp_mul_tb.DUT.mant_mul_out fp_mul_tb.DUT.guard fp_mul_tb.DUT.round fp_mul_tb.DUT.sticky fp_mul_tb.DUT.add_to_exp fp_mul_tb.DUT.unpack fp_mul_tb.DUT.exp_logic fp_mul_tb.DUT.pack fp_mul_tb.DUT.rst_hold fp_mul_tb.DUT.multiply fp_mul_tb.DUT.gen_grs_bits fp_mul_tb.DUT.normalize fp_mul_tb.DUT.round_res }
gui_set_radix -radix {alex} -signals {V1:fp_mul_tb.DUT.a}
gui_set_radix -radix {alex} -signals {V1:fp_mul_tb.DUT.b}
gui_set_radix -radix {alex} -signals {V1:fp_mul_tb.DUT.z}
gui_set_radix -radix {state} -signals {V1:fp_mul_tb.DUT.fsm_state}
gui_set_radix -radix {decimal} -signals {V1:fp_mul_tb.DUT.unpack}
gui_set_radix -radix {unsigned} -signals {V1:fp_mul_tb.DUT.unpack}
gui_set_radix -radix {decimal} -signals {V1:fp_mul_tb.DUT.exp_logic}
gui_set_radix -radix {unsigned} -signals {V1:fp_mul_tb.DUT.exp_logic}
gui_set_radix -radix {decimal} -signals {V1:fp_mul_tb.DUT.pack}
gui_set_radix -radix {unsigned} -signals {V1:fp_mul_tb.DUT.pack}
gui_set_radix -radix {decimal} -signals {V1:fp_mul_tb.DUT.rst_hold}
gui_set_radix -radix {unsigned} -signals {V1:fp_mul_tb.DUT.rst_hold}
gui_set_radix -radix {decimal} -signals {V1:fp_mul_tb.DUT.multiply}
gui_set_radix -radix {unsigned} -signals {V1:fp_mul_tb.DUT.multiply}
gui_set_radix -radix {decimal} -signals {V1:fp_mul_tb.DUT.gen_grs_bits}
gui_set_radix -radix {unsigned} -signals {V1:fp_mul_tb.DUT.gen_grs_bits}
gui_set_radix -radix {decimal} -signals {V1:fp_mul_tb.DUT.normalize}
gui_set_radix -radix {unsigned} -signals {V1:fp_mul_tb.DUT.normalize}
gui_set_radix -radix {decimal} -signals {V1:fp_mul_tb.DUT.round_res}
gui_set_radix -radix {unsigned} -signals {V1:fp_mul_tb.DUT.round_res}

# Global: Highlighting

# Global: Stack
gui_change_stack_mode -mode list
#</Session>

