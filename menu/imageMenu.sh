#!/bin/bash

while true; do

	dialog  --clear --backtitle "$installerMenuTitle" \
			--title "$imageMenuTitle" \
			--nocancel \
			--menu "\n$imageMenuAction" 15 70 5 \
				download_IMAGE "Download a new ISO" \
				integrate_IMAGE "Insert an ISO into the PXE-Server" \
				remove_IMAGE "Remove an ISO from the PXE-Server" \
				Back "Return to main menu" \
			2>"${imageMenuInput}"

	menuitem=$(<"${imageMenuInput}")

	case $menuitem in

		download_IMAGE) 	source menu/images/downloadImage.sh;;
		integrate_IMAGE) 	source menu/images/integrateImage.sh;;
		remove_IMAGE) 		source menu/images/deleteImage.sh;;
		Back) 				break;;

	esac

done

$cleanUpCommands