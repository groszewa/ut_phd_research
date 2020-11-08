#!/usr/bin/python
import subprocess
import os
import csv
import sys
import argparse

MODEL_ROOT = os.environ['MODEL_ROOT']

#global variables
arch_name = "dsc_serial_mul";

def parse_commandline(args=sys.argv[1:]):
    parser = argparse.ArgumentParser(description="Parses command");
    parser.add_argument("-c","--cycles",help="Cycles to sweep to",required=True);
    parser.add_argument("-a","--arch",help="Architecture to sweep",required=True);
    options = parser.parse_args(args);
    #check arch is a legal value
    return options;
    

def get_mae_single_sim(arch,num_tests,num_cycles):
    path        = "{0}/build/{1}/i2d4".format(MODEL_ROOT,arch)
    make_cmd    = ["make","NUM_TESTS={0}".format(num_tests),"CYCLES_OVERRIDE={0}".format(num_cycles),"run_ov"]
    make_pcs    = subprocess.Popen(make_cmd, cwd=path,stdout=subprocess.PIPE)
    get_mae_pcs = subprocess.Popen(["grep","MAE"],stdin=make_pcs.stdout,stdout=subprocess.PIPE)
    mae = subprocess.check_output(["cut","-d:","-f2"],stdin=get_mae_pcs.stdout).lstrip()
    return mae.rstrip()

def get_mae_list_sim_range(arch,num_tests,cycle_range_upper):
    mae_list = []
    for cycles in range(1,cycle_range_upper+1):
        mae = get_mae_single_sim(arch,num_tests,cycles)
        print "%3s : %s"%(cycles,mae)
        mae_list.append(mae)
    return mae_list

def print_array_to_file(my_array, file_name):
    with open(file_name,'wb') as csvfile:
        csv_writer = csv.writer(csvfile, delimiter=',',quotechar='|', quoting=csv.QUOTE_MINIMAL);
        for cycles in range(len(my_array)):
            my_row = [cycles+1,my_array[cycles]];
            csv_writer.writerow(my_row);

def main():
    arglist = parse_commandline();
    mae_list = get_mae_list_sim_range("dsc_serial_mul",100,10)
    print_array_to_file(mae_list,"dsc_serial_mul.csv");

if __name__ == '__main__':
    main()