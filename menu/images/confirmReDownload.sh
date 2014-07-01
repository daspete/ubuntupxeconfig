#!/bin/bash

dialog  --title "ISO already exists" \
		--backtitle "$installerMenuTitle" \
		--yesno "Do you really want to delete and download the ISO again?" 8 65

r=$?

case $r in

   0) 	clear; echo "yes"; doDownload=1;;
   1) 	clear; echo "no"; doDownload=0;;
   255) clear; echo "esc"; doDownload=0;;

esac