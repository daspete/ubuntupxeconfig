#!/bin/bash

dialog  --ok-label "DOWNLOAD" \
		--backtitle "$installerMenuTitle" \
		--title "$downloadImageMenuTitle" \
		--form "\n$downloadImageMenuAction" 16 51 0 \
			"Name of the OS:"		1 1		"$currentImageNameToDownload" 			1 20 25 0 \
			"URL of the ISO:"		2 1		"$currentImageURLToDownload" 			2 20 2048 0 \
		2>$imageDownloadMenuInput

if [ ${?} -eq 0 ]; then

	# read user choices
	userDownloadConf=`cat $imageDownloadMenuInput`
	downloadConfArray=(${userDownloadConf//'\n'/})

	# if user has saved his choices
	if [ ${#downloadConfArray[@]} -eq 2 ]; then
		
		# write user choices to the global vars
		currentImageNameToDownload=${downloadConfArray[0]}
		currentImageURLToDownload=${downloadConfArray[1]}

		source tasks/downloadImageAlternative.sh
	else
		currentImageNameToDownload=""
		currentImageURLToDownload=""
	fi
fi
