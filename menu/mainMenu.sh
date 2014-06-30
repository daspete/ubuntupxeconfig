#!/bin/bash

while true; do

	dialog  --clear --backtitle "$installerMenuTitle" \
			--title "$mainMenuTitle" \
			--nocancel \
			--menu "\n$mainMenuAction" 15 70 5 \
				network_CONFIG "PXE network settings" \
				tftp_CONFIG "TFTP server settings" \
				image_CONFIG "Images download and integration" \
				settings_SAVE "Save settings to disk and restart services" \
				Exit "Exit" \
			2>"${mainMenuInput}"

	menuitem=$(<"${mainMenuInput}")

	case $menuitem in

		network_CONFIG) source menu/configNet.sh;;
		tftp_CONFIG) 	source menu/configTFTP.sh;;
		image_CONFIG) 	source menu/configImages.sh;;
		settings_SAVE) 	source menu/writeSettings.sh;;
		Exit) 			break;;

	esac

done

$cleanUpCommands