#!/bin/bash

while true; do

	dialog --clear  --help-button --backtitle "$installerTitle" \
	--title "MAIN MENU" \
	--nocancel \
<<<<<<< HEAD
	--menu "\nChoose your task with the cursor keys" 15 70 5 \
	network_CONFIG "PXE network settings" \
	tftp_CONFIG "TFTP server settings" \
	image_CONFIG "Images download and integration" \
	settings_SAVE "Save settings to disk and restart services" \
	Exit "Exit" \
	2>"${mainMenuInput}"
=======
	--menu "\nChoose your task with the cursor keys" 15 50 4 \
	config_net "Configure the network" \
	config_TFTP "Confgure the TFTP folders" \
	config_NFS "Configure the NFS folders" \
	Exit "Exit" 2>"${mainMenuInput}"
>>>>>>> c483e45ca945290efb7d5fdedf0463f972d18c9d

	menuitem=$(<"${mainMenuInput}")

	case $menuitem in
<<<<<<< HEAD
		network_CONFIG) source menu/configNet.sh;;
		tftp_CONFIG) source menu/configTFTP.sh;;
		image_CONFIG) source menu/configImages.sh;;
		settings_SAVE) source menu/writeSettings.sh;;
=======
		config_net) source ./menu/configNet.sh;;
		config_TFTP) source ./menu/configTFTP.sh;;
		config_NFS) configNFS;;
>>>>>>> c483e45ca945290efb7d5fdedf0463f972d18c9d
		Exit) break;;
	esac
done

<<<<<<< HEAD
$cleanUpCommands
=======
# if temp files found, delete em
[ -f $mainMenuOutput ] && rm $mainMenuOutput
[ -f $mainMenuInput ] && rm $mainMenuInput
>>>>>>> c483e45ca945290efb7d5fdedf0463f972d18c9d
