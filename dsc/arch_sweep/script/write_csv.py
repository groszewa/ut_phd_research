#!/usr/bin/python

import csv
import os
import subprocess

header_inputs = ["",2,'','','','','','','','',3,'','','','','','','','',4,'','','','','','','','',5,'','','','','','','','']
header_bits   = [""] + [2,3,4 ,5 ,6 ,7 ,8 ,9 ,10]*4
designs       = ["dsc_serial_mul","es_naive_mul","ms_serial_by2_mul"]

cwd = os.getcwd()

area_tot   = []
area_gates = []
power      = []
latency    = []


for arch in designs:
    area_tot_temp = []
    area_gates_temp = []
    area_tot_temp.append(arch)
    area_gates_temp.append(arch)
    for i in range(2,5+1):
        for d in range(2,10+1):
            flavor = "i" + str(i) + "d" + str(d)
            area_rpt = os.path.join(cwd,'build',arch,flavor,'synth','area.rpt')
            cmd_area_tot = 'grep -A2 Instance ' + area_rpt + '| tail -n1 | awk \'{print $3}\''
            area_tot_grep = os.popen(cmd_area_tot).read().rstrip()
            area_tot_temp.append(area_tot_grep)
            cmd_area_gates = 'grep -A2 Instance ' + area_rpt + '| tail -n1 | awk \'{print $2}\''
            area_gates_grep = os.popen(cmd_area_gates).read().rstrip()
            area_gates_temp.append(area_gates_grep)
    area_tot.append(area_tot_temp)
    area_gates.append(area_gates_temp)


with open('csv/archsweep_Area.csv', mode='w') as test_csv:
    csv_write = csv.writer(test_csv,delimiter=',',quotechar='"',quoting=csv.QUOTE_MINIMAL)
    csv_write.writerow(['Total Area'])
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
    for row in area_tot:
        csv_write.writerow(row)
