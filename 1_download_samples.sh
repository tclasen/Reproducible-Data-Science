#!/bin/bash

source config.env

if [ ! -d samples ]; then
    mkdir samples

    for sample in $( cat malware_hash_list.txt ); do
	echo "Downloading $sample"
        curl -o ./samples/$sample  "https://malshare.com/api.php?api_key=$MALSHARE_API_KEY&action=getfile&hash=$sample"
    done
fi
