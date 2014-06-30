#!/bin/bash


dialog --ok-label "Submit" \
	--backtitle "$installerTitle" \
	--title "PXE-Network Configuration" \
	--form "Choose your network settings" \
	15 51 0 \
	"PXE-Server IP:"	1 1	"$netIP" 		1 30 15 0 \
	"Network address:"	2 1	"$netAddress"  		2 30 15 0 \
	"Subnetmask:"  		3 1	"$netMask"  		3 30 15 0 \
	"Gateway-IP:"  		4 1	"$netRouter" 		4 30 15 0 \
	"Broadcast-IP:" 	5 1	"$netBroad" 		5 30 15 0 \
	"PXE-DHCP-Range-Start:"	6 1	"$netDHCPRangeStart" 	6 30 15 0 \
	"PXE-DHCP-Range-Stop:"	7 1	"$netDHCPRangeStop"	7 30 15 0 \

2>/tmp/networkForm.$$

