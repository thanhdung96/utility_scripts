#!/bin/bash

# script used for fixing AAC error while downloading videos using youtube-dl
# the input can be a directory, an mp4 file or multiple mp4 files.

function doFix() {
	absolutePath=$(dirname $(readlink -f $1))
	fileName=$(basename $1)

	ffmpeg -i $absolutePath/$fileName -c copy -bsf:a aac_adtstoasc $absolutePath/output_$fileName
	echo "**************************************"
	echo "* Processed.                         *"
	echo "**************************************"
}

# check if ffmpeg exists in the machine
if [ ! command -v ffmpeg &> /dev/null ]; then
	echo "ffmpeg is not installed."
	exit
fi

# update field separator to new line to process files that have name with special characters.
IFS=$'\n'

# if there is only one parameter
if [ $# -eq 1 ]; then
	if [ -d $1 ]; then
		# if it is a directory and it is not empty
		if [ "$(ls -A $1)" ]; then
			for file in $1/*
			do
				echo "Processing $file..."
				doFix $file
			done
		else	# if it is empty
			echo "empty directory"
		fi
	elif [ -f $1 ]; then
		echo "Processing $1..."
		doFix $1
	fi
# if there are more than one parameter
elif [ $# -gt 1 ]; then
	# and it does exist and is a regular file
	for file in $@
	do
		if [ -f $file ]; then
			echo "Processing $file..."
			doFix $file
		elif [ -d file ]; then
			echo "$file is a directory."
		fi
	done
elif [ $# -eq 0 ]; then
	echo "there are no argument."
fi

echo "**************************************"
echo "exiting."
