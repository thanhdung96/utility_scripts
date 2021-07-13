#!/bin/bash

# check if cifs-utils is installed
dpkg -s cifs-utils &>/dev/null || { 
	echo "cifs-utils is not installed.\n";
	echo "please install the package using:";
	echo "sudo apt-get update";
	echo "sudo apt-get install cifs-utils";
	exit;
}

sudo mount -t cifs -o username=thanhdung96,vers=1.0 //192.168.1.132/thanhdung96 /mnt/cifs
