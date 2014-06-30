#!/bin/bash

# ask user if he wants to start
dialog --title "Install PXE-Server-Requirements" \
--backtitle "$installerTitle" \
--yesno "Welcome to the PXE-Server-Configuration. Do you wish to start with installing the required packages?" 7 60

r=$?
case $r in
   0) installRequirements;;
   1) clear;echo "you have cancelled the installer.";exit 1;;
   255) clear;echo "you have cancelled the installer.";exit 1;;
esac

