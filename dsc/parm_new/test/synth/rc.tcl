set_attribute hdl_search_path {./} 
set_attribute lib_search_path {./}

set_attribute lp_power_analysis_effort high

#set_attribute library [list gscl45nm.lib]
set_attribute library [list ./gscl45nm.lib]

set design dsc_serial_mul
set myfiles [list ../${design}.v ../../common/modules.v]
#set myfiles [list ../top.v]

read_hdl -sv ${myfiles}
#elaborate ${design}

set num_inputs [list "NUM_INPUTS" 4]
set data_width [list "DATA_WIDTH" 8]
elaborate -parameters [list $data_width $num_inputs] ${design}

check_design -unresolved

#read in sdc file
read_sdc ./${design}.sdc

#read in vcd file from simulation to get activity factors
#read_vcd -static -vcd_module dut ../${design}_tb.vcd

report power -tcf_summary > ${design}_activty.rpt

report timing -lint > ${design}_debugtiming.rpt

# Synthesize the design to the target library
#synthesize -to_generic -effort high
#synthesize -to_generic -effort high
#ajgrosze - remove high effort to get hierarchical area breakdownxs
synthesize -to_mapped  
#synthesize -to_mapped -effort high -incr

write_hdl -mapped >  ${design}_netlist.v
report timing -num_paths 10 > ${design}_timing.rpt
report power >  ${design}_power.rpt
report gates >  ${design}_gates.rpt
report area  >  ${design}_area.rpt

puts "====================="
puts "Synthesis Finished :)"
puts "===================="
#Exit RTL Compiler
quit

