#!/bin/bash


if [ $# -lt 2 ]
then
    echo "Usage: $0 OUTPUT.mp4 IN1.mp4 IN2.mp4 IN3.mp4 ..."
    exit
fi

OUTPUT=$1
shift

INPUT_FILE=`mktemp -t input.XXXXX`

# Sort input arguments numerically, and prepend them with "-i "
for INPUT in `ls $@ | sort -t "-" -k 2 -n`
do
    echo "file '$PWD/$INPUT'" >> $INPUT_FILE
done

~/bin/ffmpeg -f concat -i $INPUT_FILE -c copy $OUTPUT

rm $INPUT_FILE
