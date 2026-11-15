#!/bin/bash

#--SETTINGS--
TITLE="System Report"
SHOW_MEMORY=yes
SHOW_DISK=no
SHOW_LOAD=yes
LABEL_COLOR='\e[32m'
TITLE_COLOR='\e[31m'

RESET='\e[33m'

while true; do
	clear
	echo -e "${TITLE_COLOR}===== $TITLE ====="
	echo -e "${LABEL_COLOR}User:${RESET}      $(whoami)"
	echo -e "${LABEL_COLOR}Host:${RESET}      $(hostname)"
	echo -e "${LABEL_COLOR}Time:${RESET}      $(date +%T)"
	echo -e "${LABEL_COLOR}Date:${RESET}      $(date +%d-%m-%Y)"
	echo -e "${LABEL_COLOR}Uptime:${RESET}    $(uptime -p)"
	echo -e "${LABEL_COLOR}Cores:${RESET}     $(nproc)"
	echo -e "${LABEL_COLOR}Process Count:${RESET} $(ps -ejH | wc -l) "

	if [ "$SHOW_MEMORY" = "yes" ]; then
		echo -e "${LABEL_COLOR}Memory:${RESET}    $(free -h| grep Mem | awk '{print $3 " used of " $2}')"
	fi

	if [ "$SHOW_DISK" = "yes" ]; then
		echo -e "${LABEL_COLOR}Disk:${RESET}      $(df -h ~| grep sdd | awk '{print $3 " used of " $2}')"
	fi

	if [ "$SHOW_LOAD" = "yes" ]; then
		echo -e "${LABEL_COLOR}Load:${RESET}      $(cut -d ' ' -f 1-3 /proc/loadavg)"
	fi
	sleep 2
done
