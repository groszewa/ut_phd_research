#!/misc/scratch/ajgrosze/ut_phd_research/dsc/arch_sweep/local_python/env/bin/python -B

from jinja2 import Environment, FileSystemLoader
from helper_functions import *
import sys
import os
from shutil import copyfile
import subprocess as sub
import pathlib

def run_step_no_log(design_name, script_path, model_root):
    sub.call([script_path, design_name], cwd=model_root, stdout=sub.DEVNULL, stderr=sub.DEVNULL)
    
def run_step(design_name, script_path, log_name, model_root):
    with open(log_name, 'wb') as outfile:
        sub.call([script_path,design_name],cwd=model_root, stdout=outfile, stderr=outfile)

def run_all():
    model_root   = get_model_root()
    script_dir   = model_root + 'script/'
    gen_script_path     = script_dir + 'gen_file_collateral.py'
    compile_script_path = script_dir + 'compile_designs.py'
    sim_script_path     = script_dir + 'simulate_designs.py'
    synth_script_path   = script_dir + 'synthesize_designs.py'
    copy_results_path   = script_dir + 'copy_results.py'
    clean_script_path   = script_dir + 'clean_dirs.py'
    
    log_path     = model_root + 'logs/'
    for design_name in valid_designs :
        print('\t' + design_name)
        compile_log   = log_path + design_name + '_compile.log'
        sim_log       = log_path + design_name + '_sim.log'
        synth_log     = log_path + design_name + '_synth.log'
        print('\t\tGenerating file collateral...')
        run_step_no_log(design_name, gen_script_path, model_root)
        #print('\t\tCompiling...')
        #run_step(design_name, compile_script_path, compile_log, model_root)
        #print('\t\tSimulating...')
        #run_step(design_name, sim_script_path, sim_log, model_root)
        print('\t\tSynthesizing...')
        run_step(design_name, synth_script_path, synth_log, model_root)
        print('\t\tCopying results...');
        run_step_no_log(design_name, copy_results_path, model_root)
        print('\t\tCleaning build directory...');
        run_step_no_log(design_name, clean_script_path, model_root)        

def main():
    print("Running compile, sim, and synth across all designs\n")
    run_all()
    print("Done! :)")
    

main()
