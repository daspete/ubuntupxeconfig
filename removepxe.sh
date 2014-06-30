#!/bin/bash

source config.sh

apt-get -y purge dialog syslinux tftpd-hpa isc-dhcp-server nfs-kernel-server

rm -rf $tftpRoot
