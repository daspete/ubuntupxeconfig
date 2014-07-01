#!/bin/bash

dialog  --ok-label "SAVE" \
        --backtitle "$installerMenuTitle" \
        --title "$tftpMenuTitle" \
        --form "\n$tftpMenuAction" 11 56 0 \
                "Listening on:"	                1 1     "$tftpListen"           1 30 20 0 \
                "TFTP-Username:"                2 1     "$tftpUsername"		2 30 15 0 \
                "TFTP-Root-Directory:"          3 1     "$tftpRoot"             3 30 15 0 \
                "Images-Directory (in root):"   4 1     "$tftpImageRoot"        4 30 15 0 \
        2>$tftpFormInput

if [ ${?} -eq 0 ]; then
        # read user input
        userTftpConf=`cat $tftpFormInput`
        tftpConfArray=(${userTftpConf//\n/})

        # if user has saved his choices
        if [ ${#tftpConfArray[@]} -eq 4 ]; then

                # write user choices to the global vars
                tftpListen=${tftpConfArray[0]}
                tftpUsername=${tftpConfArray[1]}
                tftpRoot=${tftpConfArray[2]}
                tftpImageRoot=${tftpConfArray[3]}
        fi
fi

