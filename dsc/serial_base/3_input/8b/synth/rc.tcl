set_attribute hdl_search_path {./} 
set_attribute lib_search_path {./}

set_attribute lp_power_analysis_effort high

#set_attribute library [list gscl45nm.lib]
set_attribute library [list ../../../../shared/gscl45nm.lib]

set design dsc_mul
set myfiles [list ../${design}.v ../../../../shared/modules.v]

read_hdl ${myfiles}
elaborate ${design}

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

