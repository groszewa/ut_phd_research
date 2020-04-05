#!/bin/sh



check() {
    arch=$1
    data_width=$2
    num_inputs=$3
    root=$(pwd)
    testcase=i${num_inputs}d${data_width}
    compile_ok=$(grep "rc=0" build/${arch}/${testcase}/compile.log | wc | awk '{print $1}')
    sim_ok=$(grep "rc=0" build/${arch}/${testcase}/sim.log         | wc | awk '{print $1}')
    
    if [ "$compile_ok" == "0" ]; then
        echo "Compilation failed for build/${arch}/${testcase}"
        all_ok=0
    fi

    if [ "$sim_ok" == "0" ]; then
        echo "Simulation failed for build/${arch}/${testcase}"
        all_ok=0
    fi
          
}

arch=$1

if [ "$arch" == "dsc_serial_mul" ] || [ "$arch" == "es_naive_mul" ] || [ "$arch" == "ms_serial_by2_mul" ] || [ "$arch" == "ms_es_naive_by2_mul" ]; then
    echo "$0 : Checking RTL compile/sim status for ${arch}"
else
    echo "${arch} not supported! Exiting."
    exit
fi

#echo "$0 : Building RTL and Synth collateral for ${arch}"

all_ok=1
for i in {2..5}; do
    for w in {2..10}; do
        check $arch $w $i 
    done
done

if [ "$all_ok" == "1" ]; then
    echo "All compiles and simulations are passing for ${arch}!"
    exit 0
else
    exit 1
fi
