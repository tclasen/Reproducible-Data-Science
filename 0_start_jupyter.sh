#!/bin/bash

source config.env

docker run --rm -it \
    -p 8080:8888 \
    -v "$PWD":/home/jovyan/work \
    --name jupyter \
    jupyter/datascience-notebook:$JUPYTER_DOCKER_TAG \
    start.sh jupyter lab --LabApp.token="$JUPYTER_PASSWORD"
