#!/bin/bash

if [ $dhcpServerMissing == "1" ]; then
	echo -n "Installing DHCP-Server..."
	apt-get -y install isc-dhcp-server >/dev/null 2>&1
	echo "done"
fi

if [ $tftpServerMissing == "1" ]; then
	echo -n "Installing TFTP-Server..."
	apt-get -y install tftpd-hpa >/dev/null 2>&1
	echo "done"
fi

if [ $nfsServerMissing == "1" ]; then
	echo -n "Installing NFS-Server..."
	apt-get -y install nfs-kernel-server >/dev/null 2>&1
	echo "done"
fi

if [ $syslinuxMissing == "1" ]; then
	echo -n "Installing syslinux package..."
	apt-get -y install syslinux >/dev/null 2>&1
	echo "done"
fi


