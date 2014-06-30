#!/bin/bash

dialog  --ok-label "SAVE" \
		--backtitle "$installerMenuTitle" \
		--title "$networkMenuTitle" \
		--form "\n$networkMenuAction" 16 51 0 \
			"PXE-Server IP:"		1 1		"$netIP" 				1 30 15 0 \
			"PXE-DHCP-Range-Start:"	2 1		"$netDHCPRangeStart" 	2 30 15 0 \
			"PXE-DHCP-Range-Stop:"	3 1		"$netDHCPRangeStop"		3 30 15 0 \
			"---------------------------------------------------" 	4 1  "" 4 30 0 0 \
			"Subnetmask:"  			5 1		"$netMask"  			5 30 15 0 \
			"Network address:"		6 1		"$netAddress"  			6 30 15 0 \
			"Gateway-IP:"  			7 1		"$netRouter" 			7 30 15 0 \
			"Broadcast-IP:" 		8 1		"$netBroad" 			8 30 15 0 \
		2>$networkFormInput

if [ ${?} -eq 0 ]; then

	# read user choices
	userNetConf=`cat $networkFormInput`
	netConfArray=(${userNetConf//\n/})

	# if user has saved his choices
	if [ ${#netConfArray[@]} -eq 7 ]; then
		
		# write user choices to the global vars
		netIP=${netConfArray[0]}
		netDHCPRangeStart=${netConfArray[1]}
		netDHCPRangeStop=${netConfArray[2]}
		netMask=${netConfArray[3]}
		netAddress=${netConfArray[4]}
		netRouter=${netConfArray[5]}
		netBroad=${netConfArray[6]}
	
	fi
fi
