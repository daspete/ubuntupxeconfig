#!/bin/bash

if [ $dhcpServerMissing == "1" ]; then
	currentRequirement="DHCP-Server"
	source .././menu/installingRequirementMessage.sh
	apt-get -y install isc-dhcp-server >/dev/null 2>&1
	sleep 1
fi

if [ $tftpServerMissing == "1" ]; then
	currentRequirement="TFTP-Server"
        source .././menu/installingRequirementMessage.sh
	apt-get -y install tftpd-hpa >/dev/null 2>&1
	sleep 1
fi

if [ $nfsServerMissing == "1" ]; then
	currentRequirement="NFS-Server"
        source .././menu/installingRequirementMessage.sh
	apt-get -y install nfs-kernel-server >/dev/null 2>&1
	sleep 1
fi

if [ $syslinuxMissing == "1" ]; then
	currentRequirement="Syslinux package"
        source .././menu/installingRequirementMessage.sh
	apt-get -y install syslinux >/dev/null 2>&1
	sleep 1
fi


