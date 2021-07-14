#!/bin/bash

######
# Merge audio and video into one.
#
# arguments:
# 1. type identifier: 
#	-d or --dir if audio and video  inputs are directory 
#	-f of --file if audio and video inputs are files 
# 2. audio input
# 3. video input
# 4. video ouput (directory)
######


numberOfVids=0
numberOfAudio=0
MAX_ARG=4

# actual merging function
# first argument is audio input
# second argument is video output
# third argument is video output
function mergeAudioVideo() {
	absolutePath=$(realpath $3)
	vidFileName=$(basename $2)

	ffmpeg -i $2 -i $1 -c copy $absolutePath/output_$vidFileName
	echo "processed: output_"$vidFileName
}

# check if there are enough arguments
if [ $# -lt $MAX_ARG ]; then
	echo "not enough arguments."
	echo "expecting 3 arguments, $# given."
	exit
elif [ $# -gt $MAX_ARG ]; then
	echo "too many arguments."
	echo "expecting $MAX_ARG arguments, $# given."
	exit
fi

# check if ffmpeg exists in the machine
type -P ffmpeg &>/dev/null || {
	echo "ffmpeg command not found.";
	exit 1;
}

# update field separator to new line to process files
# that have name with special characters.
IFS=$'\n'

# check for type identifier
if [ $1 == "-f" ] || [ $1 == "--file" ]; then
	# check if input is a file
	if [ ! -f $2 ] || [ ! -f $3 ]; then
		echo "the input must be files."
	else
		mergeAudioVideo $2 $3 $4
	fi
elif [ $1 == "-d" ] || [ $1 == "--dir" ]; then
	# check if input is a directory
	if [ ! -d $2 ] || [ ! -d $3 ]; then
		echo "the input must be directories."
	else
		echo "empty"
	fi
fi
