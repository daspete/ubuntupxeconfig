#!/bin/bash

dialog --ok-label "Submit" \
        --backtitle "$installerTitle" \
        --title "TFTP-Server Configuration" \
        --form "\nChoose your TFTP settings" \
        11 56 0 \
        "Listening on:"	        1 1     "$tftpListen"           1 30 20 0 \
        "TFTP-Username:"  	2 1     "$tftpUsername"		2 30 15 0 \
        "TFTP-Root-Directory:"  3 1     "$tftpRoot"             3 30 15 0 \
2>$tftpFormInput

if [ ${?} -eq 0 ]; then
        userTftpConf=`cat $tftpFormInput`
        tftpConfArray=(${userTftpConf/\n/})

        if [ ${#tftpConfArray[@]} -eq 3 ]; then
                tftpListen=${tftpConfArray[0]}
                tftpUsername=${tftpConfArray[1]}
                tftpRoot=${tftpConfArray[2]}
        fi
fi

