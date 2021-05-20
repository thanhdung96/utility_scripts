#!/bin/bash

# script used for fixing AAC error while downloading videos using youtube-dl
# the input can be a directory, an mp4 file or multiple mp4 files.

if [ $# -eq 1 ]; then
	if [ -d $1 ]; then
		# if it is a directory and it is not empty
		if [ "$(ls -A $1)" ]; then
			for file in $1/*
			do
				echo "Processing $file..."
				ffmpeg -i $file -c copy -bsf:a aac_adtstoasc output_$file
			done
		else	# if it is empty
			echo "empty directory"
		fi
	else
		echo "this is not a directory"
	fi
elif [ $# -gt 1 ]; then
	# if there is only one parameter
	# and it does exist and is a regular file
	if [ -f $1 ]; then
		ffmpeg -i $1 -c copy -bsf:a aac_adtstoasc output_$1.mp4
	fi
elif [ $# -eq 0 ]; then
	echo "there are no argument."
fi

#ffmpeg -i 62303237_p3.mp4 -c copy -bsf:a aac_adtstoasc output_p3.mp4
