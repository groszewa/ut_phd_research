#!/bin/sh


synth() {
    arch=$1
    data_width=$2
    num_inputs=$3
    root=$(pwd)
    testcase=i${num_inputs}d${data_width}
    cd build/${arch}/${testcase}/synth
    if [ -e ../compile.log ]; then
        compile_ok=$(grep "rc=0" ../compile.log | wc | awk '{print $1}')
        if [ "$compile_ok" -eq "1" ]; then
            echo "$0 : synth() : Synthesizing design build/${arch}/${testcase}"
            make clean
            make synth &> /dev/null
            make clean
        else
            echo "ERROR : ${testcase} failed compile... Skipping"
        fi
    else
        echo "ERROR : ${testcase} has not been compiled...Skipping"
    fi

    ###printf "$0 : sy() : Compiling sim for build/${arch}/${testcase}... " 
    ###make compile &> /dev/null
    ###if [ -e ${arch} ]; then
    ###    printf "PASS\n" ; echo "rc=0" >> compile.log; echo "rc=0" >> sim.log
    ###else
    ###    printf "FAIL\n" $root; echo "rc=1" >> compile.log; echo "rc=1" > sim.log
    ###fi
    ###make clean
    cd $root
      
}

arch=$1

if [ "$arch" == "dsc_serial_mul" ] || [ "$arch" == "es_naive_mul" ]; then
    echo "$0 : Building RTL and Synth collateral for ${arch}"
else
    echo "${arch} not supported! Exiting."
    exit
fi

#echo "$0 : Building RTL and Synth collateral for ${arch}"

#rm -rf build/sim.log
for i in {2..5}; do
    for w in {2..10}; do
        synth $arch $w $i
    done
done
