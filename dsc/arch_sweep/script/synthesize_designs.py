#!/misc/scratch/ajgrosze/ut_phd_research/dsc/arch_sweep/local_python/env/bin/python -B

from jinja2 import Environment, FileSystemLoader
from helper_functions import *
import sys
import os
import re

import subprocess as sub
import pathlib

from clean_dirs import clean_synth_dir

def get_synth_status(design_name, synth_dir):
    ret_string = "FAIL"
    logfile_path = synth_dir + '/rc.log'
    logfile_handle = open(logfile_path,'r')
    for line in logfile_handle:
        if(re.search("Synthesis succeeded", line)):
            ret_string = "PASS"
        if(re.search("Possible timing problems have been detected", line)):
            ret_string += " (TIMING ISSUE)"
    return ret_string

def run_rtl_synth(synth_dir, design_name, config_name, data_width):
    extra_space_if_needed = ' ' if (data_width<10) else ''    
    sub.call(['make','synth'],cwd=synth_dir, stdout=sub.DEVNULL, stderr=sub.DEVNULL)
    synth_status = get_synth_status(design_name, synth_dir)
    print("\tSynthesizing {}/{} {}: {}".format(design_name,config_name,extra_space_if_needed,synth_status))

def synthesize_single_design(design_name, num_inputs, data_width, env_parser):
    populate_template_dict_per_config(design_name, num_inputs, data_width)
    config_name = template_dict.get('config_name')
    synth_dir    = template_dict.get('synth_dir')
    clean_synth_dir(synth_dir, design_name, config_name)
    run_rtl_synth(synth_dir, design_name, config_name, data_width)

def synthesize_all_designs(design_name, env_parser):
    for num_inputs in range(num_inputs_range_min, num_inputs_range_max):
        for data_width in range(data_width_range_min, data_width_range_max):
            synthesize_single_design(design_name, num_inputs, data_width, env_parser)

def main():
    check_if_env_set_up()
    design_name = get_design_name_from_command_line()
    pass_string = "Synthesizing {} design".format(design_name)
    check_if_valid_design(design_name, pass_string)
    populate_template_dict_global(design_name)
    env_parser = get_template_parser()
    synthesize_all_designs(design_name,env_parser)
    print("Done! :)")

if __name__ == '__main__':
    main()
