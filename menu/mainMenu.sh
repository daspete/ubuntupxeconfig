#!/bin/bash

INPUT=/tmp/menu.sh.$$
OUTPUT=/tmp/output.sh.$$

trap "rm $OUTPUT; rm $INPUT; exit" SIGHUP SIGINT SIGTERM

while true; do

	dialog --clear  --help-button --backtitle "$installerTitle" \
	--title "MAIN MENU" \
	--menu "You can use the UP/DOWN arrow keys, the first \n\
	letter of the choice as a hot key, or the \n\
	number keys 1-9 to choose an option.\n\
	Choose the TASK" 15 50 4 \
	config_net "Configure the network" \
	config_TFTP "Confgure the TFTP folders" \
	config_NFS "Configure the NFS folders" \
	Exit "Exit" 2>"${INPUT}"

	menuitem=$(<"${INPUT}")

	case $menuitem in
		config_net) source ./menu/configNet.sh; break;;
		config_TFTP) configTFTP;;
		config_NFS) configNFS;;
		Exit) break;;
	esac
done

# if temp files found, delete em
[ -f $OUTPUT ] && rm $OUTPUT
[ -f $INPUT ] && rm $INPUT
