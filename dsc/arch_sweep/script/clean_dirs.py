#!/misc/scratch/ajgrosze/ut_phd_research/dsc/arch_sweep/local_python/env/bin/python -B

from jinja2 import Environment, FileSystemLoader
from helper_functions import *
import sys
import os
from shutil import copyfile

import subprocess as sub
import pathlib
    
def clean_sim_dir(sim_dir, design_name, config_name, do_print):
    if(do_print):
        print("\tCleaning {}/{}".format(design_name, config_name))
    sub.call(['make','clean']  ,cwd=sim_dir, stdout=sub.DEVNULL, stderr=sub.DEVNULL)

def clean_sim_dir_verbose(sim_dir, design_name, config_name):
    clean_sim_dir(sim_dir, design_name, config_name, True)

def clean_sim_dir_quiet(sim_dir, design_name, config_name):
    clean_sim_dir(sim_dir, design_name, config_name, False)


def clean_synth_dir(synth_dir, design_name, config_name):
    #print("\tCleaning {}/{}/synth".format(design_name, config_name))
    sub.call(['make','clean']  ,cwd=synth_dir, stdout=sub.DEVNULL, stderr=sub.DEVNULL)


def clean_single_design(design_name, num_inputs, data_width, env_parser):
    populate_template_dict_per_config(design_name, num_inputs, data_width)
    config_name = template_dict.get('config_name')
    sim_dir    = template_dict.get('sim_dir')
    synth_dir  = template_dict.get('synth_dir')
    clean_sim_dir_verbose(sim_dir, design_name, config_name)
    clean_synth_dir(synth_dir, design_name, config_name)

def clean_all_designs(design_name, env_parser):
    for num_inputs in range(num_inputs_range_min, num_inputs_range_max):
        for data_width in range(data_width_range_min, data_width_range_max):
            clean_single_design(design_name, num_inputs, data_width, env_parser)            

def main():
    check_if_env_set_up()
    design_name = get_design_name_from_command_line()
    pass_string = "Cleaning {} design dirs".format(design_name)

    check_if_valid_design(design_name, pass_string)
    populate_template_dict_global(design_name)
    env_parser = get_template_parser()
    clean_all_designs(design_name,env_parser)
    print("Done! :)")

if __name__ == '__main__':
    main()
