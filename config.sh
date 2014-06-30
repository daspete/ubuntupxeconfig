#!/bin/bash

####################################
## EDIT THESE LINES TO YOUR NEEDS ##
####################################

netIP="192.168.1.100"
netAddress="192.168.1.0"
netBroad="192.168.1.255"
netMask="255.255.255.0"
netRouter="192.168.1.1"
netDHCPRangeStart="192.168.1.150"
netDHCPRangeStop="192.168.1.200"

dhcpConfigFile="/etc/dhcp/dhcpd.conf"

tftpListen="0.0.0.0:69"
tftpOptions="-l -s"
tftpUsername="tftp"
tftpRoot="/srv/tftp"

imageSearchFolder="/tmp"

####################################
## DO NOT TOUCH THESE LINES BELOW ##
####################################
##        HERE ARE DRAGONS        ##
####################################
mainMenuInput=/tmp/mainMenuInput.$$
mainMenuOutput=/tmp/mainMenuOutput.$$

networkFormInput=/tmp/networkFormInput.$$
tftpFormInput=/tmp/tftpFormInput.$$

dialogMissing=1
dhcpServerMissing=1
tftpServerMissing=1
nfsServerMissing=1
syslinuxMissing=1

cleanUpCommands="\
rm -rf $mainMenuInput > /dev/null 2>&1; \
rm -rf $mainMenuOutput > /dev/null 2>&1; \
rm -rf $networkFormInput > /dev/null 2>&1; \
rm -rf $tftpFormInput > /dev/null 2>&1; \
clear; \
exit;"

trap "$cleanUpCommands" SIGHUP SIGINT SIGTERM
