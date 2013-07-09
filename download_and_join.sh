#!/bin/bash

if [ $# -lt 2 ]
then
    echo "Usage: $0 OUTPUT_FILE ID1 ID2 ID3 ..."
    exit 1
fi

OUTPUT=$1
shift

URL_BASE="https://class.coursera.org/startup-001/lecture/download.mp4?lecture_id="

VIDEOS=`./download.sh $URL_BASE $@`

echo $VIDEOS

./join.sh "$OUTPUT" $VIDEOS
