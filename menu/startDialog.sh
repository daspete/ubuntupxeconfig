#!/bin/bash

dialog  --title "Install PXE-Server-Requirements" \
		--backtitle "$installerMenuTitle" \
		--yesno "$installRequirementsAction" 8 65

r=$?

case $r in

   0) 	clear; source tasks/installRequirements.sh;;
   1) 	clear; echo "you have cancelled the installer."; exit 1;;
   255) clear; echo "you have cancelled the installer."; exit 1;;

esac

