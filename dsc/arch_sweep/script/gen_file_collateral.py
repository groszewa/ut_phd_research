#!/misc/scratch/ajgrosze/ut_phd_research/dsc/arch_sweep/local_python/env/bin/python -B

from jinja2 import Environment, FileSystemLoader
from helper_functions import *
import sys
import os
from shutil import copyfile

def get_elaborated_rc_tcl(env):
    template = env.get_template('template_rc.tcl')
    return template.render(data=template_dict)

def get_elaborated_params_vh(env):
    template = env.get_template('template_params.vh')
    return template.render(data=template_dict)

def get_elaborated_top(env):
    template = env.get_template('template_top')
    return template.render(data=template_dict)

def get_elaborated_sdc(env):
    template = env.get_template('template_design.sdc')
    return template.render(data=template_dict)

def get_elaborated_design_synth_v(env):
    template = env.get_template('template_design_synth.v')
    return template.render(data=template_dict)

def get_elaborated_makefile_sim(env):
    template = env.get_template('template_sim.mk')
    return template.render(data=template_dict)

def get_elaborated_makefile_synth(env):
    template = env.get_template('template_synth.mk')
    return template.render(data=template_dict)

def create_directories_if_not_present():
    design_dir = template_dict.get('design_dir')
    if not os.path.exists(design_dir):
        os.makedirs(design_dir)
    sim_dir = template_dict.get('sim_dir')
    if not os.path.exists(sim_dir):
        os.makedirs(sim_dir)
    synth_dir = template_dict.get('synth_dir')
    if not os.path.exists(synth_dir):
        os.makedirs(synth_dir)

def write_file_to_path(dest_path, dest_file_name, file_data):
    full_file_path = dest_path + dest_file_name
    with open(full_file_path, 'w') as fh:
        fh.write(file_data)

##collateral generation function
def gen_file_collateral_single(design_name, num_inputs, bit_width, env_parser):
    populate_template_dict_per_config(design_name, num_inputs, bit_width)
    config_name = template_dict.get('config_name')
    print("\tBuilding file collateral for %s in $MODEL_ROOT/build/%s/%s" % (design_name, design_name, config_name))
    create_directories_if_not_present()

    sim_dir   = template_dict.get('sim_dir')
    synth_dir = template_dict.get('synth_dir')

    #elaborate synthesis tcl template
    elaborated_rc_tcl = get_elaborated_rc_tcl(env_parser)
    write_file_to_path(synth_dir,'rc.tcl',elaborated_rc_tcl)
    #print(elaborated_rc_tcl)
    elaborated_params_vh = get_elaborated_params_vh(env_parser)
    write_file_to_path(sim_dir,'params.vh',elaborated_params_vh)
    #elaborate top simulation file
    elaborated_top = get_elaborated_top(env_parser)
    write_file_to_path(sim_dir,'top',elaborated_top)
    #elaborate design.sdc template
    elaborated_sdc = get_elaborated_sdc(env_parser)
    sdc_file_name = design_name + '.sdc'
    write_file_to_path(synth_dir,sdc_file_name,elaborated_sdc)
    #elaborate design_synth.v template
    elaborated_design_synth_v = get_elaborated_design_synth_v(env_parser)
    design_synth_file_name = design_name + '_synth.v'
    write_file_to_path(synth_dir,design_synth_file_name,elaborated_design_synth_v)
    #elaborate simulation makefile template
    elaborated_makefile_sim = get_elaborated_makefile_sim(env_parser)
    write_file_to_path(sim_dir,'Makefile',elaborated_makefile_sim)
    #elaborate synthesis makefile template
    elaborated_makefile_synth = get_elaborated_makefile_synth(env_parser)
    write_file_to_path(synth_dir,'Makefile',elaborated_makefile_synth)
    

def gen_file_collateral_all(design_name, env_parser):
    for num_inputs in range(num_inputs_range_min, num_inputs_range_max):
        for data_width in range(data_width_range_min, data_width_range_max):
            gen_file_collateral_single(design_name, num_inputs, data_width, env_parser)            

def main():
    check_if_env_set_up()
    design_name = get_design_name_from_command_line()
    pass_string = "Building RTL and Synth collateral for {} design".format(design_name)

    check_if_valid_design(design_name, pass_string)
    populate_template_dict_global(design_name)
    env_parser = get_template_parser()
    gen_file_collateral_all(design_name,env_parser)
    print("Done! :)")
    

main()
