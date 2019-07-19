#!/bin/bash

source config.env

for format in pdf script slides; do
    if [ ! -d $format ]; then
        mkdir $format
    fi
done

for filetype in slides pdf script; do
    for filename in *.ipynb; do
        jupyter nbconvert $filename --to $filetype --output=$filetype/$filename
    done
done
