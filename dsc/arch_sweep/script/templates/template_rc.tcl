set design      {{ data.get('design') }}
set libname     {{ data.get('library') }}
set rtl_src_dir {{ data.get('rtl_src_dir') }}
set rtl_inc_dir {{ data.get('rtl_inc_dir') }}
set sim_dir     {{ data.get('sim_dir') }}
set synth_dir   {{ data.get('synth_dir') }}
set lib_dir     {{ data.get('lib_dir') }}

set_attribute hdl_search_path [list ${sim_dir} ${synth_dir} ${rtl_src_dir} ${rtl_inc_dir} ] 
set_attribute lib_search_path [list ${lib_dir} ]
set_attribute information_level 3

set_attribute lp_power_analysis_effort high

set_attribute library [list ${libname} ]

set design_top ${design}_synth

set myfiles [list params.vh modules.v ${design}.v ${design_top}.v]

read_hdl -sv ${myfiles}

elaborate $design_top

check_design -unresolved

read_sdc ./${design}.sdc

#read in vcd file from simulation to get activity factors
#read_vcd -static -vcd_module dut ../${design}_tb.vcd

report power -tcf_summary > activty.rpt

report timing -lint -verbose > debugtiming.rpt

# Synthesize the design to the target library
#synthesize -to_generic -effort high
#synthesize -to_generic -effort high
#ajgrosze - remove high effort to get hierarchical area breakdownxs
synthesize -to_mapped  
#synthesize -to_mapped -effort high -incr

write_hdl -mapped >  ${design_top}_netlist.v
report timing -num_paths 1 > timing.rpt
report power >  power.rpt
report gates >  gates.rpt
report area  >  area.rpt

puts "====================="
puts "Synthesis Finished :)"
puts "===================="
quit

