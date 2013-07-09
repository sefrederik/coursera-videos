#!/bin/bash

if [ $# -lt 3 ]
then
    echo "Usage: $0 URL_BASE FIRST_ID LAST_ID [STEP]"
    echo "If STEP is not provided, a step size of 2 is assumed."
    exit 1
fi

URL_BASE="$1"
FIRST="$2"
LAST="$3"
STEP="$4"

if [ "$STEP" == "" ]
then
    STEP=2
fi

for ID in `seq $FIRST $STEP $LAST`
do
    if [ ! -f "video-$ID.mp4" ]
    then
        wget -O "video-$ID.mp4" "$URL_BASE$ID"
    fi
    echo "video-$ID.mp4"
done
