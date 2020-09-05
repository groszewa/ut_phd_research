NAME_TOP := sc_serial_mul
USERNAME := $(shell whoami)
DIR_TMP  := /tmp/$(USERNAME)verilog

#----- Targets, ncverilog
# Use this to compile without running simulation
compile:
	vcs -full64 -sverilog -debug_access+pp -o ${NAME_TOP} -f top +incdir+${MODEL_ROOT}/rtl/include| tee compile.log


# Run simulation
run:
ifdef NUM_TESTS
	./${NAME_TOP} +NUM_TESTS=$(NUM_TESTS)  |tee sim.log
else
	./${NAME_TOP} +NUM_TESTS=10 | tee sim.log
endif

# Run simulation
run_debug:
ifdef NUM_TESTS
	./${NAME_TOP} +NUM_TESTS=$(NUM_TESTS) +DEBUG | tee sim.log
else
	./${NAME_TOP} +NUM_TESTS=10 +DEBUG | tee sim.log
endif

# Run simulation with cycle override
run_ov:
ifdef NUM_TESTS
		./${NAME_TOP} +NUM_TESTS=$(NUM_TESTS) +CYCLES_OVERRIDE=$(CYCLES_OVERRIDE) 		
else
	./${NAME_TOP} +NUM_TESTS=10 +CYCLES_OVERRIDE=$(CYCLES_OVERRIDE)
endif

# Run simulation with cycle override and debug switch
run_ov_debug:
ifdef NUM_TESTS
		./${NAME_TOP} +DEBUG +NUM_TESTS=$(NUM_TESTS) +CYCLES_OVERRIDE=$(CYCLES_OVERRIDE)  	
else
	./${NAME_TOP} +DEBUG +NUM_TESTS=10 +CYCLES_OVERRIDE=$(CYCLES_OVERRIDE) 
endif


# Start viewer
viewer:
	dve -full64  -vpd ${NAME_TOP}_tb.vpd -script session_settings.tcl &

# ncverilog help, command line
help:
	vcs -h | less -Mq


#----- Cleanup
# Delete temporary files
clean:
	@rm -f  $(NAME_TOP)
	@rm -rf simv.daidir
	@rm -rf csrc
	@rm -rf DVEfiles
	@rm -rf ucli.key
	@rm -rf opendatabase.log
	@rm -rf $(NAME_TOP).daidir
	@rm -rf simv
	@rm -rf tb_top.vpd
	@rm -rf tb_top.vcd
	@rm -rf sim_ov*.log





