#!/bin/bash

if [ -f $dhcpConfigFile ]; then
	echo "------------------------------------------------------------------------"
	echo -n "creating backup of your DHCP-Configuration... "

	currentTime = $(date +"%y%m%d%H%S")

	mv $dhcpConfigFile $dhcpConfigFile.$currentTime
	echo "done"
fi
