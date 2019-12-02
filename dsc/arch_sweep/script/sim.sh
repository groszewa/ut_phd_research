#!/bin/sh


log () {
    echo $(date): $1 | tee -a build/build.log
}

simulate() {
    arch=$1
    data_width=$2
    num_inputs=$3
    num_tests=$4
    root=$(pwd)
    testcase=i${num_inputs}d${data_width}
    cd build/${arch}/${testcase}
    echo "$0 : simulate() : Compiling sim for build/${arch}/${testcase}"
    make compile &> /dev/null
    echo "$0 : simulate() : Running sim for ${num_tests} input vectors"
    make NUM_TESTS=$num_tests run &> /dev/null
    make clean
    cd $root
      
}

arch=$1
num_tests=$2

if [ "$arch" == "dsc_serial_mul" ] || [ "$arch" == "es_naive_mul" ]; then
    echo "$0 : Building RTL and Synth collateral for ${arch}"
else
    echo "${arch} not supported! Exiting."
    exit
fi

#echo "$0 : Building RTL and Synth collateral for ${arch}"

for w in {2..10}; do
    for i in {2..5}; do
        simulate $arch $w $i $num_tests
    done
done
