#!/bin/sh


log () {
    printf "$(date): $1" | tee -a $2/build/sim.log
}

simulate() {
    arch=$1
    data_width=$2
    num_inputs=$3
    num_tests=$4
    root=$(pwd)
    testcase=i${num_inputs}d${data_width}
    cd build/${arch}/${testcase}
    if [ -e compile.log ]; then
        rm compile.log
    fi
    if [ -e sim.log ]; then
        rm sim.log
    fi
    printf "$0 : simulate() : Compiling sim for build/${arch}/${testcase}... " 
    make compile &> /dev/null
    if [ -e ${arch} ]; then
        printf "PASS\n" ; echo "rc=0" >> compile.log
        printf "$0 : simulate() : Running sim for ${num_tests} input vectors.. "
        make NUM_TESTS=$num_tests run &> /dev/null
        num_errors=$(grep -i error sim.log | wc | awk {'print $1'})
        
        if [ "$num_errors" -eq "0" ]; then
            printf "PASS\n"; echo "rc=0" >> sim.log
        else
            printf "FAIL\n"; echo "rc=1" >> sim.log
        fi
        #echo "num_errors=$num_errors"
    else
        printf "FAIL\n" $root; echo "rc=1" >> compile.log; echo "rc=1" > sim.log
    fi
    make clean
    cd $root
      
}

arch=$1
num_tests=$2

module load syn/vcs

if [ "$arch" == "dsc_serial_mul" ] || [ "$arch" == "es_naive_mul" ] || [ "$arch" == "ms_serial_by2_mul" ] || [ "$arch" == "ms_es_naive_by2_mul" ]; then
    echo "$0 : Building RTL and Synth collateral for ${arch}"
else
    echo "${arch} not supported! Exiting."
    exit
fi

#echo "$0 : Building RTL and Synth collateral for ${arch}"

rm -rf build/sim.log
for i in {2..5}; do
    for w in {2..10}; do
        simulate $arch $w $i $num_tests
    done
done
