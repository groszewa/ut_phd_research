#!/misc/scratch/ajgrosze/ut_phd_research/dsc/arch_sweep/local_python/env/bin/python -B

from jinja2 import Environment, FileSystemLoader
from helper_functions import *
import sys
import os

import subprocess as sub
import pathlib

from shutil import copyfile

def run_copy(synth_dir, design_name, config_name):
    model_root = get_model_root()
    dest_dir = model_root + 'results_synth/'
    area_src_file_path = synth_dir + 'area.rpt'
    area_dst_file_path = dest_dir + design_name + '_' + config_name + '_area.rpt'
    timing_src_file_path = synth_dir + 'timing.rpt'
    timing_dst_file_path = dest_dir + design_name + '_' + config_name + '_timing.rpt'
    power_src_file_path = synth_dir + 'power.rpt'
    power_dst_file_path = dest_dir + design_name + '_' + config_name + '_power.rpt'
    print("\tCopying result data for {}/{}".format(design_name,config_name))
    copyfile(area_src_file_path, area_dst_file_path)
    copyfile(timing_src_file_path, timing_dst_file_path)
    copyfile(power_src_file_path, power_dst_file_path)


def copy_single_design(design_name, num_inputs, env_parser, data_width):
    populate_template_dict_per_config(design_name, num_inputs, data_width)
    config_name = template_dict.get('config_name')
    synth_dir    = template_dict.get('synth_dir')
    run_copy(synth_dir, design_name, config_name)

def copy_all_designs(design_name, env_parser):
    for num_inputs in range(num_inputs_range_min, num_inputs_range_max):
        for data_width in range(data_width_range_min, data_width_range_max):
            copy_single_design(design_name, num_inputs, env_parser, data_width)            

def main():
    check_if_env_set_up()
    design_name = get_design_name_from_command_line()
    pass_string = "Copying result file for {} design".format(design_name)
    check_if_valid_design(design_name, pass_string)
    populate_template_dict_global(design_name)
    env_parser = get_template_parser()
    copy_all_designs(design_name,env_parser)
    print("Done! :)")

if __name__ == '__main__':
    main()
