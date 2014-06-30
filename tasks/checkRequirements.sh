#!/bin/bash

# check if dialog-package is installed
dpkg -s dialog >/dev/null 2>&1
dialogMissing=$?

# check if DHCP-Server is installed
dpkg -s isc-dhcp-server >/dev/null 2>&1
dhcpServerMissing=$?

# check if TFTP-Server is installed
dpkg -s tftpd-hpa >/dev/null 2>&1
tftpServerMissing=$?

# check if NFS-Server is installed
dpkg -s nfs-kernel-server >/dev/null 2>&1
nfsServerMissing=$?

# check if syslinux-package is installed
dpkg -s syslinux >/dev/null 2>&1
syslinuxMissing=$?

