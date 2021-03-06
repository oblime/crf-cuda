#!/bin/sh

echo "running learning task"
../../build/crf_learn -a CUDA -c 10.0 template train.data model

echo "running test task"
../../build/crf_test -m model test.data > results-out.txt

echo "Converting output to Unix format"
dos2unix results-out.txt

echo "Generating Report"
./conlleval.pl -d '\t' < results-out.txt