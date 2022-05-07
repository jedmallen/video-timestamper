#!/usr/bin/env bash


IN_FILE=${1}

# Replace EPOCH_TIME with the epoch time of whatever time stamp you have
# EPOCH_TIME='1651636431' # For 2022-05-04 11:53:38
# To convert ISO time to Epoch time: `date -d "2022-05-04T03:53:51" +%s`
# EPOCH_TIME=${2}

ISO_TIME=${2}
EPOCH_TIME=$(date -d "${ISO_TIME}" +%s)
OUT_FILE=${3}

echo "In File: ${IN_FILE}"
echo "ISO Date Time: ${ISO_TIME}"
echo "Epoch Time: ${EPOCH_TIME}"
echo "Out File: ${OUT_FILE}"

ffmpeg -i "${1}" -vf "drawtext=text='%{pts \:localtime \:$EPOCH_TIME} PHT': fontsize=20: fontcolor=white: box=1: boxcolor=0x000000" ${OUT_FILE}


