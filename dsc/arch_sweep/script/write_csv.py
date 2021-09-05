#!/misc/scratch/ajgrosze/ut_phd_research/dsc/arch_sweep/local_python/env/bin/python -B

import csv
import os
import subprocess

from helper_functions import *

header_inputs = ["",2,'','','','','','','','',3,'','','','','','','','',4,'','','','','','','','',5,'','','','','','','','']
header_bits   = [""] + [2,3,4 ,5 ,6 ,7 ,8 ,9 ,10]*4
#designs       = ["dsc_serial_mul","es_naive_mul","ms_serial_by2_mul","ms_es_naive_by2_mul"]
#designs       = ["es_ordered_bs_mul"]

cwd = os.getcwd()

area_tot   = []
area_gates = []
power      = []
latency    = []
timing     = []
power      = []

def calc_ds_serial_perf(num_inputs, num_bits):
    return pow(2,num_inputs*num_bits)

def calc_ds_es_perf(num_inputs, num_bits):
    acc = 1
    for x in range(1,pow(2,num_bits)):
        acc += x * pow(2, (num_inputs-1)*num_bits)
    acc /= pow(2,num_bits)
    return acc

def calc_ds_es_ord_perf(num_inputs, num_bits):
    acc = 0
    maxrange = pow(2,num_bits)
    for x in range(0,maxrange):
        term1 = pow((maxrange-x)  , num_inputs)
        term2 = pow((maxrange-x-1), num_inputs)
        acc += (x+1)*(term1 - term2)
    acc /= pow(2,(num_inputs-1)*num_bits)
    return acc

def calc_ms_serial_perf(num_inputs, num_bits, div_by):
    return calc_ds_serial_perf(num_inputs,num_bits)/pow(div_by,2)

def calc_ms_es_perf(num_inputs, num_bits, div_by):
    return calc_ds_es_perf(num_inputs, num_bits)/pow(div_by,2)

def calc_ms_es_ord_perf(num_inputs, num_bits, div_by):
    return calc_ds_es_ord_perf(num_inputs, num_bits)/pow(div_by,2)


def get_area_total(inputs, bits, arch):
    flavor = "i" + str(inputs) + "d" + str(bits)
    area_rpt_name = arch + "_" + flavor + "_area.rpt"
    area_rpt_path = os.path.join(model_root, "results_synth", area_rpt_name)
    cmd_area_tot = 'grep -A2 Instance ' + area_rpt_path + '| tail -n1 | awk \'{print $3}\''
    return os.popen(cmd_area_tot).read().rstrip()

def get_area_gates(inputs, bits, arch):
    flavor = "i" + str(inputs) + "d" + str(bits)
    area_rpt_name = arch + "_" + flavor + "_area.rpt"
    area_rpt_path = os.path.join(model_root, "results_synth", area_rpt_name)
    cmd_area_gates = 'grep -A2 Instance ' + area_rpt_path + '| tail -n1 | awk \'{print $2}\''
    return os.popen(cmd_area_gates).read().rstrip()

def get_latency(inputs, bits, arch):
    lat = 666
    if(arch == "dsc_serial_mul"):
        lat = calc_ds_serial_perf(i,d);
    elif (arch == "es_naive_mul"):
        lat = calc_ds_es_perf(i, d)
    elif (arch == "es_ordered_bs_mul" or arch == "es_ordered_cas_mul"):
        lat = calc_ds_es_ord_perf(i,d)
    elif (arch == "ms_serial_by2_mul"):
        lat = calc_ms_serial_perf(i,d,2)
    elif (arch == "ms_es_naive_by2_mul"):
        lat = calc_ms_es_perf(i,d,2)
    elif(arch == "ms_es_ordered_cas_by2_mul" or arch == "ms_es_ordered_bs_by2_mul"):
        lat = calc_ms_es_ord_perf(i,d,2)
    elif (arch == "ms_serial_by4_mul"):
        lat = calc_ms_serial_perf(i,d,4)
    elif (arch == "ms_es_naive_by4_mul"):
        lat = calc_ms_es_perf(i,d,4)
    elif(arch == "ms_es_ordered_cas_by4_mul" or arch == "ms_es_ordered_bs_by4_mul"):
        lat = calc_ms_es_ord_perf(i,d,4)
    return lat

def get_timing(inputs,bits,arch):
    flavor = "i" + str(inputs) + "d" + str(bits)
    timing_rpt_name = arch + "_" + flavor + "_timing.rpt"
    timing_rpt_path = os.path.join(model_root, "results_synth", timing_rpt_name)
    cmd_timing = 'grep setup ' + timing_rpt_path + '| tail -n1 | awk \'{print $5}\''
    return os.popen(cmd_timing).read().rstrip()

def get_power(inputs,bits,arch):
    flavor = "i" + str(inputs) + "d" + str(bits)
    power_rpt_name = arch + "_" + flavor + "_power.rpt"
    power_rpt_path = os.path.join(model_root, "results_synth", power_rpt_name)
    cmd_power = 'grep -A2 Instance ' + power_rpt_path + '| tail -n1 | awk \'{print $5}\''
    return os.popen(cmd_power).read().rstrip()


for arch in valid_designs:
    pass_string = "Writing results from {} to csv".format(arch)
    check_if_valid_design(arch,pass_string)
    model_root = get_model_root()

    area_tot_temp = []
    area_gates_temp = []
    latency_temp = []
    timing_temp  = []
    power_temp   = []
    area_tot_temp.append(arch)
    area_gates_temp.append(arch)
    latency_temp.append(arch)
    timing_temp.append(arch)
    power_temp.append(arch)
    for i in range(2,5+1):
        for d in range(2,10+1):
            area_tot_temp.append(get_area_total(i,d,arch))
            area_gates_temp.append(get_area_gates(i,d,arch))
            latency_temp.append(get_latency(i,d,arch))
            timing_temp.append(get_timing(i,d,arch))
            power_temp.append(get_power(i,d,arch))
            #energy - FIXME

    area_tot.append(area_tot_temp)
    area_gates.append(area_gates_temp)
    latency.append(latency_temp)
    timing.append(timing_temp)
    power.append(power_temp)

with open('csv/all/archsweep_Area.csv', mode='w') as test_csv:
    csv_write = csv.writer(test_csv,delimiter=',',quotechar='"',quoting=csv.QUOTE_MINIMAL)
    csv_write.writerow(['Total Area (mm^2)'])
    csv_write.writerow(header_inputs)
    csv_write.writerow(header_bits)
    for row in area_tot:
        csv_write.writerow(row)
    csv_write.writerow([''])
    csv_write.writerow(['Number of Gates'])
    csv_write.writerow(header_inputs)
    csv_write.writerow(header_bits)
    for row in area_gates:
        csv_write.writerow(row)


with open('csv/all/archsweep_latency.csv', mode='w') as test_csv:
    csv_write = csv.writer(test_csv,delimiter=',',quotechar='"',quoting=csv.QUOTE_MINIMAL)
    csv_write.writerow(['Latency'])
    csv_write.writerow(header_inputs)
    csv_write.writerow(header_bits)
    for row in latency:
        csv_write.writerow(row)

with open('csv/all/archsweep_timing.csv', mode='w') as test_csv:
    csv_write = csv.writer(test_csv,delimiter=',',quotechar='"',quoting=csv.QUOTE_MINIMAL)
    csv_write.writerow(['Worst Case Timing'])
    csv_write.writerow(header_inputs)
    csv_write.writerow(header_bits)
    for row in timing:
        csv_write.writerow(row)

with open('csv/all/archsweep_power.csv', mode='w') as test_csv:
    csv_write = csv.writer(test_csv,delimiter=',',quotechar='"',quoting=csv.QUOTE_MINIMAL)
    csv_write.writerow(['Power (nW)'])
    csv_write.writerow(header_inputs)
    csv_write.writerow(header_bits)
    for row in power:
        csv_write.writerow(row)

