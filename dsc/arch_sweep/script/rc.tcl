set_attribute hdl_search_path {./ ../../../../rtl ../../../../rtl/include} 
set_attribute lib_search_path {../../../../script}

set_attribute lp_power_analysis_effort high

set_attribute library [list MY_LIB]

set design MY_DESIGN
set myfiles MY_FILES

read_hdl -sv ${myfiles}
#elaborate ${design}

set num_inputs [list "NUM_INPUTS" hello]
set data_width [list "DATA_WIDTH" world]
elaborate -parameters [list $data_width $num_inputs ] ${design}

check_design -unresolved

#read in sdc file
read_sdc ./${design}.sdc

#read in vcd file from simulation to get activity factors
#read_vcd -static -vcd_module dut ../${design}_tb.vcd

report power -tcf_summary > activty.rpt

report timing -lint > debugtiming.rpt

# Synthesize the design to the target library
#synthesize -to_generic -effort high
#synthesize -to_generic -effort high
#ajgrosze - remove high effort to get hierarchical area breakdownxs
synthesize -to_mapped  
#synthesize -to_mapped -effort high -incr

write_hdl -mapped >  ${design}_netlist.v
report timing -num_paths 1 > timing.rpt
report power >  power.rpt
report gates >  gates.rpt
report area  >  area.rpt

puts "====================="
puts "Synthesis Finished :)"
puts "===================="
#Exit RTL Compiler
quit

