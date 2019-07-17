#!/bin/bash

source config.env


for format in pdf script slides; do
    if [ ! -d $format ]; then
        mkdir $format
    fi
done

for filename in *.ipynb; do
    jupyter nbconvert $filename --to slides --output=slides/$filename
    jupyter nbconvert $filename --to pdf    --output=pdf/$filename    --template report
    jupyter nbconvert $filename --to script --output=script/$filename
done