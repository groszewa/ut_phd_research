NAME_TOP := MY_NAME_TOP
USERNAME := $(shell whoami)
DIR_TMP  := /tmp/$(USERNAME)verilog

#----- Targets, ncverilog
# Use this to compile without running simulation
compile:
	vcs -full64 -sverilog -debug_access+pp -o ${NAME_TOP} -f top


# Run simulation
run:
ifdef NUM_TESTS
	./${NAME_TOP} +NUM_TESTS=$(NUM_TESTS) | tee sim.log
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
	@rm -f  $(NAME_TOP)_tb.dump
	@rm -f  $(NAME_TOP)_tb.dump.vpd
	@rm -rf $(NAME_TOP).daidir
	@rm -rf simv
	@rm -rf ${NAME_TOP}_tb.vpd
	@rm -rf ${NAME_TOP}_tb.vcd
	@rm -rf sim.log





