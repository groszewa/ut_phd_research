#!/misc/scratch/ajgrosze/ut_phd_research/dsc/arch_sweep/local_python/env/bin/python -B

from jinja2 import Environment, FileSystemLoader
from helper_functions import *
import sys
import os

import subprocess as sub
import pathlib

def run_rtl_sim(sim_dir, design_name, config_name, data_width):
    extra_space_if_needed = ' ' if (data_width<10) else ''    
    sub.call(['make','run'],cwd=sim_dir, stdout=sub.DEVNULL, stderr=sub.DEVNULL)
    sim_status = get_sim_status(design_name, sim_dir)
    print("\tSimulating {}/{} {}: {}".format(design_name,config_name,extra_space_if_needed,sim_status))

def get_sim_status(design_name, sim_dir):
    grep_process = sub.Popen(["grep", "ERROR", "sim.log"], cwd=sim_dir, stdout=sub.PIPE, stderr=sub.DEVNULL)
    wc_process   = sub.Popen(["wc", "-l"], cwd=sim_dir, stdin=grep_process.stdout, stdout=sub.PIPE, stderr=sub.DEVNULL)
    num_errors   = int(wc_process.stdout.read())
    return "PASS" if (num_errors==0) else "FAIL"


def simulate_single_design(design_name, num_inputs, data_width, env_parser):
    populate_template_dict_per_config(design_name, num_inputs, data_width)
    config_name = template_dict.get('config_name')
    extra_space_if_needed = ' ' if (data_width<10) else ''
    sim_dir    = template_dict.get('sim_dir')
    run_rtl_sim(sim_dir, design_name, config_name, data_width)

def simulate_all_designs(design_name, env_parser):
    for num_inputs in range(num_inputs_range_min, num_inputs_range_max):
        for data_width in range(data_width_range_min, 5): 
            simulate_single_design(design_name, num_inputs, data_width, env_parser)            

def main():
    check_if_env_set_up()
    design_name = get_design_name_from_command_line()
    pass_string = "Simulating {} design".format(design_name)
    check_if_valid_design(design_name, pass_string)
    populate_template_dict_global(design_name)
    env_parser = get_template_parser()
    simulate_all_designs(design_name,env_parser)
    print("Done! :)")

if __name__ == '__main__':
    main()
