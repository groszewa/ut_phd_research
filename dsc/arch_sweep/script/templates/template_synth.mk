NAME_TOP := {{ data.get('design') }}

synth:
	rc -file rc.tcl

clean:
	@rm -rf fv
	@rm -rf *.log*
	@rm -rf libscore_work
	@rm -rf *.cmd*
	@rm -rf *.rpt
	@rm -rf $(NAME_TOP)_synth_netlist.v





