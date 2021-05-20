#!/bin/bash

# script used for fixing AAC error while downloading videos using youtube-dl
# the input can be a directory, an mp4 file or multiple mp4 files.

if [ $# -eq 1 ]; then
	if [ -d $1 ]; then
		echo "this is a directory."
	else
		echo "this is not a directory"
	fi
elif [ $# -gt 1 ]; then
	echo "there are more than an argument."
elif [ $# -eq 0 ]; then
	echo "there are no argument."
fi

#ffmpeg -i 62303237_p3.mp4 -c copy -bsf:a aac_adtstoasc output_p3.mp4
