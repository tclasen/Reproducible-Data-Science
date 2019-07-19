#!/bin/bash

source config.env

if [ ! -d hashes ]; then
    mkdir hashes

    docker run --rm -it \
        -v "$PWD"/samples:/archive \
        -v "$PWD"/hashes:/hashes \
        -w /hashes \
        --name pharos \
        eschwartz/pharos:$PHAROS_DOCKER_TAG \
        /bin/bash -c "\
            for i in /archive/*; do \
                fn2hash \$i; \
            done > hashes.csv;\
            for i in /archive/*; do \
	        fn2yara \$i; \
	    done"
fi
