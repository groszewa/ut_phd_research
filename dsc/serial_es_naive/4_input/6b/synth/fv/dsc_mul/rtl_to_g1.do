// Generated by Cadence Encounter(R) RTL Compiler RC14.28 - v14.20-s067_1
tclmode
set env(RC_VERSION) "RC14.28 - v14.20-s067_1"
vpxmode
set dofile abort exit
usage -auto -elapse
set log file fv/dsc_mul/rtl_to_g1.log -replace
tclmode
set ver [lindex [split [lindex [get_version_info] 0] "-"] 0]
vpxmode
tclmode
set env(CDN_SYNTH_ROOT) /usr/local/packages/cadence_2016/rc142/tools
set CDN_SYNTH_ROOT /usr/local/packages/cadence_2016/rc142/tools
vpxmode
tclmode
set env(NCPROTECT_KEYDB) /usr/local/packages/cadence_2015/incisiv13.2/kits/VerificationKit/misc/ip_keys
vpxmode
tclmode
if {$ver >= 08.10} {
  vpx set naming style rc
}
vpxmode
set naming rule "%s[%d]" -instance_array
set naming rule "%s_reg" -register -golden
set naming rule "%L.%s" "%L[%d].%s" "%s" -instance
set naming rule "%L.%s" "%L[%d].%s" "%s" -variable
set undefined cell black_box -noascend -both
set hdl options -VERILOG_INCLUDE_DIR "sep:src:cwd"
set undriven signal Z -golden

add search path -library ./
read library -statetable -liberty -both  \
	/misc/scratch/ajgrosze/ut_phd_research/dsc/serial_es_naive/4_input/6b/synth/../../../../shared/gscl45nm.lib

delete search path -all
add search path -design ./
tclmode
if {$ver < 13.10} {
vpx read design   -define SYNTHESIS  -golden -lastmod -noelab -verilog2k \
	../dsc_mul.v \
	../../../../shared/modules.v
} else {
vpx read design   -define SYNTHESIS  -merge bbox -golden -lastmod -noelab -verilog2k \
	../dsc_mul.v \
	../../../../shared/modules.v
}
vpxmode

elaborate design -golden -root dsc_mul -rootonly

tclmode
if {$ver < 13.10} {
vpx read design -verilog -revised -lastmod -noelab \
	-unzip fv/dsc_mul/g1.v.gz
} else {
vpx read design -verilog95 -revised -lastmod -noelab \
	-unzip fv/dsc_mul/g1.v.gz
}
vpxmode

elaborate design -revised -root dsc_mul

tclmode
set ver [lindex [split [lindex [get_version_info] 0] "-"] 0]
if {$ver < 13.10} {
vpx substitute blackbox model -golden
}
vpxmode
report design data
report black box

uniquify -all -nolib
set flatten model -seq_constant -seq_constant_x_to 0
set flatten model -nodff_to_dlat_zero -nodff_to_dlat_feedback
set parallel option -threads 4 -license xl -norelease_license
set analyze option -auto

write hier_compare dofile fv/dsc_mul/hier_rtl_to_g1.do \
	-noexact_pin_match -constraint -usage -replace -balanced_extraction -input_output_pin_equivalence \
	-prepend_string "analyze datapath -module -verbose; usage; analyze datapath  -verbose"
run hier_compare fv/dsc_mul/hier_rtl_to_g1.do -dynamic_hierarchy
// report hier_compare result -dynamicflattened
set system mode lec
tclmode
puts "No of diff points    = [get_compare_points -NONequivalent -count]"
if {[get_compare_points -NONequivalent -count] > 0} {
    puts "------------------------------------"
    puts "ERROR: Different Key Points detected"
    puts "------------------------------------"
#     foreach i [get_compare_points -NONequivalent] {
#         vpx report test vector [get_keypoint $i]
#         puts "     ----------------------------"
#     }
}
vpxmode
exit -force
