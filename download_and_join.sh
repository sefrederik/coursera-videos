#!/bin/bash

if [ $# -ne 3 ]
then
    echo "Usage: $0 FIRST_ID LAST_ID OUTPUT_FILE"
    exit 1
fi

FIRST_ID=$1
LAST_ID=$2
OUTPUT=$3

URL_BASE="https://class.coursera.org/startup-001/lecture/download.mp4?lecture_id="

VIDEOS=`./download.sh $URL_BASE $FIRST_ID $LAST_ID`

echo $VIDEOS

./join.sh "$OUTPUT" $VIDEOS
