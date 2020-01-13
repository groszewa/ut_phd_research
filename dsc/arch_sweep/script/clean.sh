#!/bin/sh

log () {
    echo $(date): $1 | tee -a build/build.log
}


arch=$1

if [ "$arch" == "dsc_serial_mul" ] || [ "$arch" == "es_naive_mul" ] || [ "$arch" == "ms_serial_by2_mul" ]; then
    echo "$0 : Cleaning Sim and Synth directories for ${arch}"
else
    echo "${arch} not supported! Exiting."
    exit
fi

#echo "$0 : Building RTL and Synth collateral for ${arch}"
my_root=$(pwd)

for i in {2..5}; do
    for w in {2..10}; do
        echo "Cleaning up build/${arch}/${testcase}"
        testcase=i${i}d${w}
        cd build/${arch}/${testcase}
        make clean
        cd synth
        make clean
        cd $my_root
    done
done
