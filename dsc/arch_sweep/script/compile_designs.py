#!/misc/scratch/ajgrosze/ut_phd_research/dsc/arch_sweep/local_python/env/bin/python -B

from jinja2 import Environment, FileSystemLoader
from helper_functions import *
import sys
import os
from shutil import copyfile

import subprocess as sub
import pathlib

def run_rtl_compile(design_name, sim_dir):
    sub.call(['make','compile'],cwd=sim_dir, stdout=sub.DEVNULL, stderr=sub.DEVNULL)

def run_rtl_sim(design_name, sim_dir):
    sub.call(['make','run'],cwd=sim_dir, stdout=sub.DEVNULL, stderr=sub.DEVNULL)
    
def clean_sim_dir(sim_dir):
    sub.call(['make','clean']  ,cwd=sim_dir, stdout=sub.DEVNULL, stderr=sub.DEVNULL)

def get_compile_status(design_name, sim_dir):
    path_to_executable = pathlib.Path(sim_dir + '/' + design_name)
    return "PASS" if (path_to_executable.exists()) else "FAIL"

def get_sim_status(design_name, sim_dir):
    grep_process = sub.Popen(["grep", "ERROR", "sim.log"], cwd=sim_dir, stdout=sub.PIPE, stderr=sub.DEVNULL)
    wc_process   = sub.Popen(["wc", "-l"], cwd=sim_dir, stdin=grep_process.stdout, stdout=sub.PIPE, stderr=sub.DEVNULL)
    num_errors   = int(wc_process.stdout.read())
    return "PASS" if (num_errors==0) else "FAIL"


def compile_and_run_single_design(design_name, num_inputs, data_width, env_parser):
    populate_template_dict_per_config(design_name, num_inputs, data_width)
    config_name = template_dict.get('config_name')
    extra_space_if_needed = ' ' if (data_width<10) else ''
    sim_dir    = template_dict.get('sim_dir')
    clean_sim_dir(sim_dir)
    run_rtl_compile(design_name, sim_dir)
    compile_status = get_compile_status(design_name, sim_dir)
    #run_rtl_sim(design_name, sim_dir)
    #run_status = get_sim_status(design_name, sim_dir)
    #print("\t{} {}: compile={} : sim={}".format(config_name,extra_space_if_needed,compile_status, run_status))
    print("\t{} {}: compile={}".format(config_name,extra_space_if_needed,compile_status))
    clean_sim_dir(sim_dir)

def compile_and_run_all_designs(design_name, env_parser):
    for num_inputs in range(num_inputs_range_min, num_inputs_range_max):
        for data_width in range(data_width_range_min, data_width_range_max):
            compile_and_run_single_design(design_name, num_inputs, data_width, env_parser)            

def main():
    check_if_env_set_up()
    design_name = get_design_name_from_command_line()
    num_inputs  = 2
    data_width  = 6
    pass_string = "Compiling and simulating {} design".format(design_name)

    check_if_valid_design(design_name, pass_string)
    populate_template_dict_global(design_name)
    env_parser = get_template_parser()
    compile_and_run_all_designs(design_name,env_parser)
    print("Done! :)")

main()
