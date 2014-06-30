#!/bin/bash

while true; do

	dialog --clear  --help-button --backtitle "$installerTitle" \
	--title "MAIN MENU" \
	--nocancel \
	--menu "\nChoose your task with the cursor keys" 15 50 4 \
	config_net "Configure the network" \
	config_TFTP "Confgure the TFTP folders" \
	config_NFS "Configure the NFS folders" \
	Exit "Exit" 2>"${mainMenuInput}"

	menuitem=$(<"${mainMenuInput}")

	case $menuitem in
		config_net) source ./menu/configNet.sh;;
		config_TFTP) configTFTP;;
		config_NFS) configNFS;;
		Exit) break;;
	esac
done

# if temp files found, delete em
[ -f $mainMenuOutput ] && rm $mainMenuOutput
[ -f $mainMenuInput ] && rm $mainMenuInput
