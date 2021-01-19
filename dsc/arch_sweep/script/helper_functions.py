#!/misc/scratch/ajgrosze/ut_phd_research/dsc/arch_sweep/local_python/env/bin/python -B

import sys
import os
import argparse

num_inputs_range_min = 2
num_inputs_range_max = 6
data_width_range_min = 2
data_width_range_max = 11

valid_designs = [
    "dsc_serial_mul",
    "es_naive_mul",
    "es_ordered_bs_mul",
    "es_ordered_cas_mul",
    "ms_serial_by2_mul",
    "ms_es_naive_by2_mul",
    "ms_es_ordered_cas_by2_mul",
    "ms_es_ordered_bs_by2_mul",
    "ms_serial_by4_mul",
    "ms_es_naive_by4_mul",
    "ms_es_ordered_cas_by4_mul",
    "ms_es_ordered_bs_by4_mul"
]

template_dict = {
    #global
    'library'       : None,
    'design'        : None,
    'lib_dir'       : None,
    'rtl_src_dir'   : None,
    'rtl_inc_dir'   : None,
    'tb_src_dir'    : None,
    'script_dir'    : None,
    'template_dir'  : None,
    'build_dir'     : None,
    'design_dir'    : None,
    #per config     
    'config_name'   : None,
    'sim_dir'       : None,
    'synth_dir'     : None,
    'data_width'    : None,
    'num_inputs'    : None,
    'wxip1'         : None,
    'min_cycle_dsc' : None
}


def check_if_valid_design(design, pass_string):
    if design in valid_designs:
        print(pass_string)
    else:
        print("Design name %s not supported!" % design)
        sys.exit("Exiting program")
    
def check_if_env_set_up():
    if "MODEL_ROOT" not in os.environ:
        print("$ENV(MODEL_ROOT) not set, please run <insert script name here>")
        sys.exit("Exiting program")

def get_model_root():
    return os.getenv('MODEL_ROOT') + '/'

def get_design_name_from_command_line() :
    parser = argparse.ArgumentParser()
    parser.add_argument("design", help="Name of design")
    args = parser.parse_args()
    return args.design


def populate_template_dict_global(design_name, num_inputs, data_width):
    model_root   = get_model_root()
    lib_dir      = model_root + 'libs/'
    tb_src_dir   = model_root + 'testbench/'
    rtl_src_dir  = model_root + 'rtl/'
    rtl_inc_dir  = rtl_src_dir + 'include/'
    script_dir   = model_root + 'script/'
    template_dir = script_dir + 'templates'
    build_dir    = model_root + 'build/'
    design_dir   = build_dir  + design_name + '/'
    
    template_dict['library']      = 'gscl45nm.lib'
    template_dict['design']       = design_name
    template_dict['lib_dir']      = lib_dir
    template_dict['rtl_src_dir']  = rtl_src_dir
    template_dict['rtl_inc_dir']  = rtl_inc_dir
    template_dict['tb_src_dir']   = tb_src_dir
    template_dict['script_dir']   = script_dir
    template_dict['template_dir'] = template_dir
    template_dict['build_dir']    = build_dir
    template_dict['design_dir']   = design_dir

    

def populate_template_dict_per_config(design_name, num_inputs, data_width):
    model_root  = get_model_root()
    config_name = 'i' + str(num_inputs) + 'd' + str(data_width)
    sim_dir     = model_root + 'build/' + design_name + '/' + config_name + '/'
    synth_dir   = sim_dir + 'synth/'

    template_dict['config_name']   = config_name
    template_dict['sim_dir']       = sim_dir
    template_dict['synth_dir']     = synth_dir
    template_dict['num_inputs']    = num_inputs
    template_dict['data_width']    = data_width
    template_dict['wxip1']         = (num_inputs*data_width)+1
    template_dict['min_cycle_dsc'] = pow(2, num_inputs*data_width)



