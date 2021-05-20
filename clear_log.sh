#!/bin/bash
echo Clearing log files...
cat /dev/null > /var/log/daemon.log
cat /dev/null > /var/log/syslog
cat /dev/null > /var/log/messages
cat /dev/null > /var/log/kern.log
echo Done.
