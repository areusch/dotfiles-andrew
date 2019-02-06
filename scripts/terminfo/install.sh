#!/bin/bash -e

cd $(dirname $0)
install_dir=$(pwd)

for t in `ls $(install_dir)/terms`; do
    tic -x "$t"
done

