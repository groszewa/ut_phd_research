#!/usr/bin/python

import csv
import os
import subprocess

header_inputs = ["",2,'','','','','','','','',3,'','','','','','','','',4,'','','','','','','','',5,'','','','','','','','']
header_bits   = [2,3,4 ,5 ,6 ,7 ,8 ,9 ,10]*4
cwd = os.getcwd()

dsc_serial_mul_area_tot = ["dsc_serial_mul"]

for i in range(2,5+1):
    for d in range(2,10+1):
        arch = "i" + str(i) + "d" + str(d)
        area_rpt = os.path.join(cwd,'build','dsc_serial_mul',arch,'synth','area.rpt')
        cmd = 'grep -A2 Instance ' + area_rpt + '| tail -n1 | awk \'{print $3}\''
        test = os.popen(cmd).read().rstrip()
        print test
        dsc_serial_mul_area_tot.append(test)


with open('csv/test.csv', mode='w') as test_csv:
    csv_write = csv.writer(test_csv,delimiter=',',quotechar='"',quoting=csv.QUOTE_MINIMAL)
    csv_write.writerow(header_inputs)
    csv_write.writerow(header_bits)
    csv_write.writerow(dsc_serial_mul_area_tot)
    #csv_write.write_row([2,3,4,5,6,7,8,9,10,2,3,4,5,6,7,8,9,10,2,3,4,5,6,7,8,9,10,2,3,4,5,6,7,8,9,10])
