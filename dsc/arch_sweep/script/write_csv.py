#!/usr/bin/python

import csv
import os
import subprocess

header_inputs = ["",2,'','','','','','','','',3,'','','','','','','','',4,'','','','','','','','',5,'','','','','','','','']
header_bits   = [""] + [2,3,4 ,5 ,6 ,7 ,8 ,9 ,10]*4
designs       = ["dsc_serial_mul","es_naive_mul","ms_serial_by2_mul","ms_es_naive_by2_mul"]
#designs       = ["dsc_serial_mul"]

cwd = os.getcwd()

area_tot   = []
area_gates = []
power      = []
latency    = []
timing     = []
power      = []

for arch in designs:
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
            flavor = "i" + str(i) + "d" + str(d)
            #area
            area_rpt = os.path.join(cwd,'build',arch,flavor,'synth','area.rpt')
            cmd_area_tot = 'grep -A2 Instance ' + area_rpt + '| tail -n1 | awk \'{print $3}\''
            area_tot_grep = os.popen(cmd_area_tot).read().rstrip()
            area_tot_temp.append(area_tot_grep)
            cmd_area_gates = 'grep -A2 Instance ' + area_rpt + '| tail -n1 | awk \'{print $2}\''
            area_gates_grep = os.popen(cmd_area_gates).read().rstrip()
            area_gates_temp.append(area_gates_grep)
            #latency
            if(arch == "dsc_serial_mul"):
                lat = pow(2,i*d)
            elif (arch == "es_naive_mul"):
                lat = i
            elif (arch == "ms_serial_by2_mul"):
                lat = d
            latency_temp.append(lat)
            #worst case timing
            timing_rpt = os.path.join(cwd,'build',arch,flavor,'synth','timing.rpt')
            cmd_timing = 'grep setup ' + timing_rpt + '| tail -n1 | awk \'{print $5}\''
            timing_grep = os.popen(cmd_timing).read().rstrip()
            timing_temp.append(timing_grep)
            #power
            power_rpt = os.path.join(cwd,'build',arch,flavor,'synth','power.rpt')
            cmd_power = 'grep -A2 Instance ' + power_rpt + '| tail -n1 | awk \'{print $5}\''
            power_grep = os.popen(cmd_power).read().rstrip()
            power_temp.append(power_grep)
            #energy - FIXME

    area_tot.append(area_tot_temp)
    area_gates.append(area_gates_temp)
    latency.append(latency_temp)
    timing.append(timing_temp)
    power.append(power_temp)

with open('csv/archsweep_Area.csv', mode='w') as test_csv:
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


with open('csv/archsweep_latency.csv', mode='w') as test_csv:
    csv_write = csv.writer(test_csv,delimiter=',',quotechar='"',quoting=csv.QUOTE_MINIMAL)
    csv_write.writerow(['Latency'])
    csv_write.writerow(header_inputs)
    csv_write.writerow(header_bits)
    for row in latency:
        csv_write.writerow(row)

with open('csv/archsweep_timing.csv', mode='w') as test_csv:
    csv_write = csv.writer(test_csv,delimiter=',',quotechar='"',quoting=csv.QUOTE_MINIMAL)
    csv_write.writerow(['Worst Case Timing'])
    csv_write.writerow(header_inputs)
    csv_write.writerow(header_bits)
    for row in timing:
        csv_write.writerow(row)

with open('csv/archsweep_power.csv', mode='w') as test_csv:
    csv_write = csv.writer(test_csv,delimiter=',',quotechar='"',quoting=csv.QUOTE_MINIMAL)
    csv_write.writerow(['Power (nW)'])
    csv_write.writerow(header_inputs)
    csv_write.writerow(header_bits)
    for row in power:
        csv_write.writerow(row)

#FIXME - energy
