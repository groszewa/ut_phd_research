# Begin_DVE_Session_Save_Info
# DVE global only(Breakpoint Bus Radix Expression TimeShift Compare SignalGroup Highlight Stack ) session
# Saved on Thu Nov 8 23:01:46 2018
# Toplevel windows open: 2
# 	TopLevel.1
# 	TopLevel.2
# End_DVE_Session_Save_Info

# DVE version: K-2015.09-SP1_Full64
# DVE build date: Nov 24 2015 21:15:24


#<Session mode="Global Only" path="/home/ecelrc/students/agroszewski/phd/dsc/serial_es_imp/4b/session_settings.tcl" type="Debug">

#<Database>

gui_set_time_units 100ps
#</Database>

# DVE Global setting session: 


# Global: Bus

# Global: Expressions

# Global: Signal Time Shift

# Global: Signal Compare

# Global: Signal Groups
gui_load_child_values {dsc_mul_tb}


set _session_group_1 Group1
if {[gui_sg_is_group -name "$_session_group_1"]} {
        set _session_group_1 [gui_sg_generate_new_name]
}
set Group1 "$_session_group_1"

gui_sg_addsignal -group "$_session_group_1" { dsc_mul_tb.clk_50 dsc_mul_es_imp_tb.en dsc_mul_es_imp_tb.rst dsc_mul_es_imp_tb.input_bin_a dsc_mul_es_imp_tb.input_bin_b dsc_mul_es_imp_tb.bin_out dsc_mul_es_imp_tb.op_finished dsc_mul_es_imp_tb.expected_result dsc_mul_es_imp_tb.cycle_count dsc_mul_es_imp_tb.cycle_count_overflow dsc_mul_es_imp_tb.i dsc_mul_es_imp_tb.cycle_count_acc }
gui_set_radix -radix {decimal} -signals {V1:dsc_mul_tb.input_bin_a}
gui_set_radix -radix {unsigned} -signals {V1:dsc_mul_tb.input_bin_a}
gui_set_radix -radix {decimal} -signals {V1:dsc_mul_tb.input_bin_b}
gui_set_radix -radix {unsigned} -signals {V1:dsc_mul_tb.input_bin_b}
gui_set_radix -radix {decimal} -signals {V1:dsc_mul_tb.bin_out}
gui_set_radix -radix {unsigned} -signals {V1:dsc_mul_tb.bin_out}
gui_set_radix -radix {decimal} -signals {V1:dsc_mul_tb.expected_result}
gui_set_radix -radix {twosComplement} -signals {V1:dsc_multb.expected_result}
gui_set_radix -radix {decimal} -signals {V1:dsc_mul_tb.cycle_count}
gui_set_radix -radix {unsigned} -signals {V1:dsc_mul_tb.cycle_count}
gui_set_radix -radix {decimal} -signals {V1:dsc_mul_tb.i}
gui_set_radix -radix {twosComplement} -signals {V1:dsc_mul_tb.i}

# Global: Highlighting

# Global: Stack
gui_change_stack_mode -mode list
#</Session>

