#!/bin/sh

wtxt="parameter DATA_WIDTH = "
itxt="parameter NUM_INPUTS = "
mtxt="parameter WXIP1 = "

log () {
    echo $(date): $1 | tee -a build/build.log
}

build() {
    arch=$1
    data_width=$2
    num_inputs=$3
    mulp1=$(($data_width*$num_inputs+1))
    testcase=i${num_inputs}d${data_width}
    echo "$0 : build() : building build/${arch}/${testcase}"

    mkdir -p build/${arch}/${testcase}/synth
    #cp rtl/Makefile build/${arch}/${testcase}
    cp script/mkfiles/sim/Makefile build/${arch}/${testcase}
    cp script/mkfiles/synth/Makefile build/${arch}/${testcase}/synth

    sed -i -e "s/NAME_TOP := MY_NAME_TOP/NAME_TOP := ${arch}/" build/${arch}/${testcase}/Makefile
    sed -i -e "s/NAME_TOP := MY_NAME_TOP/NAME_TOP := ${arch}/" build/${arch}/${testcase}/synth/Makefile


    cp rtl/params.vh build/${arch}/${testcase}
    chmod 755 build/${arch}/${testcase}/params.vh
    #modify parameters in header file
    sed -i -e "s/${wtxt}[0-9]*;/${wtxt}${data_width};/" \
           -e "s/${itxt}[0-9]*;/${itxt}${num_inputs};/" \
           -e "s/${mtxt}[0-9]*;/${mtxt}${mulp1};/" build/${arch}/${testcase}/params.vh
    
    rtl_top=${arch}.v
    tb_top=${arch}_tb.sv
    misc=modules.v

    #create top file 
    echo $(realpath testbench/tb_top.sv)   > build/${arch}/${testcase}/top
    echo $(realpath testbench/${tb_top})  >> build/${arch}/${testcase}/top
    echo $(realpath rtl/${rtl_top})       >> build/${arch}/${testcase}/top
    echo $(realpath rtl/modules.v)        >> build/${arch}/${testcase}/top

    #if exists, remove sdc file
    rm -rf build/${arch}/${testcase}/synth/${arch}.sdc

    cp script/rc.tcl build/${arch}/${testcase}/synth
    cp script/arch.sdc build/${arch}/${testcase}/synth/${arch}.sdc

    ln -sf $(realpath rtl/${arch}.v) build/${arch}/${testcase}/synth/.
    ln -sf $(realpath rtl/modules.v) build/${arch}/${testcase}/synth/.
    ln -sf $(realpath script/gscl45nm.lib) build/${arch}/${testcase}/synth/.



    sed -i -e "s/set_attribute library \[list MY_LIB\]/set_attribute library [list gscl45nm.lib]/" \
           -e "s/set design MY_DESIGN/set design $arch/" \
           -e "s/set myfiles MY_FILES/set myfiles [list ${arch}.v modules.v]/" \
           -e "s/set num_inputs \[list \"NUM_INPUTS\" hello\]/set num_inputs [list \"NUM_INPUTS\" $num_inputs]/" \
           -e "s/set data_width \[list \"DATA_WIDTH\" world\]/set data_width [list \"DATA_WIDTH\" $data_width]/" \
           build/${arch}/${testcase}/synth/rc.tcl


    for i in $(seq 1 $((num_inputs-1))); do
        echo "create_generated_clock -source [get_ports clk] -name clk_int${i} -divide_by 1 [get_pins /designs/${arch}_DATA_WIDTH${data_width}_NUM_INPUTS${num_inputs}/instances_hier/genblk1[${i}].genblk1.sng/pins_in/clk]" >> build/${arch}/${testcase}/synth/${arch}.sdc
    done


    
}

arch=$1

if [ "$arch" == "dsc_serial_mul" ] || [ "$arch" == "es_naive_mul" ]; then
    echo "$0 : Building RTL and Synth collateral for ${arch}"
else
    echo "${arch} not supported! Exiting."
    exit
fi

#echo "$0 : Building RTL and Synth collateral for ${arch}"

for w in {2..10}; do
    for i in {2..5}; do
        build $arch $w $i
    done
done
