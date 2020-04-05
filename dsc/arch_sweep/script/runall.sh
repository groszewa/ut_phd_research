#!/bin/sh

archlist="dsc_serial_mul es_naive_mul ms_serial_by2_mul"

for arch in $archlist; do
    #$MODEL_ROOT/script/clean.sh   $arch
    $MODEL_ROOT/script/make.sh    $arch
    $MODEL_ROOT/script/compile.sh $arch
    $MODEL_ROOT/script/synth.sh   $arch
done

$MODEL_ROOT/script/write_csv.py
