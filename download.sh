#!/bin/bash

if [ $# -lt 2 ]
then
    echo "Usage: $0 URL_BASE ID1 ID2 ID3 ..."
    exit 1
fi

URL_BASE="$1"
shift

for ID in $@
do
    if [ ! -f "video-$ID.mp4" ]
    then
        wget -O "video-$ID.mp4" "$URL_BASE$ID"
    fi
    echo "video-$ID.mp4"
done
