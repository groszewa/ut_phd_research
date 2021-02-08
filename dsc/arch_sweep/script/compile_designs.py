#!/misc/scratch/ajgrosze/ut_phd_research/dsc/arch_sweep/local_python/env/bin/python -B

from jinja2 import Environment, FileSystemLoader
from helper_functions import *
import sys
import os

import subprocess as sub
import pathlib

from clean_dirs import clean_sim_dir_quiet

def run_rtl_compile(sim_dir, design_name, config_name, data_width):
    extra_space_if_needed = ' ' if (data_width<10) else ''    
    sub.call(['make','compile'],cwd=sim_dir, stdout=sub.DEVNULL, stderr=sub.DEVNULL)
    compile_status = get_compile_status(design_name, sim_dir)
    print("\tCompiling {}/{} {}: {}".format(design_name,config_name,extra_space_if_needed,compile_status))

def get_compile_status(design_name, sim_dir):
    path_to_executable = pathlib.Path(sim_dir + '/' + design_name)
    return "PASS" if (path_to_executable.exists()) else "FAIL"

def compile_single_design(design_name, num_inputs, data_width, env_parser):
    populate_template_dict_per_config(design_name, num_inputs, data_width)
    config_name = template_dict.get('config_name')
    extra_space_if_needed = ' ' if (data_width<10) else ''
    sim_dir    = template_dict.get('sim_dir')
    clean_sim_dir_quiet(sim_dir, design_name, config_name)
    run_rtl_compile(sim_dir, design_name, config_name, data_width)

def compile_all_designs(design_name, env_parser):
    for num_inputs in range(num_inputs_range_min, num_inputs_range_max):
        for data_width in range(data_width_range_min, data_width_range_max):
            compile_single_design(design_name, num_inputs, data_width, env_parser)            

def main():
    check_if_env_set_up()
    design_name = get_design_name_from_command_line()
    num_inputs  = 2
    data_width  = 6
    pass_string = "Compiling and simulating {} design".format(design_name)
    check_if_valid_design(design_name, pass_string)
    populate_template_dict_global(design_name)
    env_parser = get_template_parser()
    compile_all_designs(design_name,env_parser)
    print("Done! :)")

if __name__ == '__main__':
    main()
