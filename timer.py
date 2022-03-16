#!/usr/bin/python
from datetime import time
from time import sleep
import subprocess

def convertToTime(totalSeconds):
	hours = int(totalSeconds / 3600)
	totalSeconds -= hours * 3600
	minutes = int(totalSeconds / 60)
	totalSeconds -= minutes * 60

	return time(
				hour = int(hours),
				minute = int(minutes),
				second = int(totalSeconds)
			)

if __name__ == "__main__":
	print("Timer written in Python 3.10")
	totalSeconds = 0

	print("Hour(s): ")
	hours = int(input())
	print("Minute(s): ")
	minutes = int(input())
	print("Seconds(s): ")
	seconds = int(input())
	print("Please leave a message:")
	message = str(input())

	totalSeconds = seconds + minutes*60 + hours*3600
	print("Alarm set in ", convertToTime(totalSeconds))

	while(totalSeconds > 0):
		print(convertToTime(totalSeconds), end='\r')
		totalSeconds -= 1
		sleep(1)

	# notification expires in 10s
	subprocess.run(["notify-send", "--expire-time=10000", "Timer set", message])
