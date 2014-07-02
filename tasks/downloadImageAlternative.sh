#!/bin/bash

doDownload=1
downloadError=0
imageFilename=${currentImageURLToDownload##*/}
imageName=${imageFilename##*/}
imageName=`echo ${imageName%.*}`

wgetProcessID=0

wgetStartTime=0
wgetCurrentTime=0

wgetDownloadedSize=0
wgetDownloadRate=0
wgetDownloadTime=0
wgetPercentDownloaded=0
wgetPercentDownloadedTemp=0

if [ -f "${imageSearchFolder}/${imageName}/${imageFilename}" ]; then
	source menu/images/confirmReDownload.sh

	if [ ${doDownload} == 1 ]; then
		rm -rf "${imageSearchFolder}/${imageName}/${imageFilename}" >/dev/null 2>&1;
	fi
fi

if [ ${doDownload} == 1 ]; then
	rm -rf ${wgetLog} >/dev/null 2>&1;
	touch ${wgetLog}

	mkdir -p "${imageSearchFolder}/${imageName}" >/dev/null 2>&1
	echo "${currentImageNameToDownload}" >${imageSearchFolder}/${imageName}/imageData.dat

	wget -P "${imageSearchFolder}/${imageName}" -o ${wgetLog} "${currentImageURLToDownload}" &
	(
		wgetProcessID=$!
		wgetStartTime=`date +%s`

		while ps -p ${wgetProcessID} >/dev/null; do
			wgetCurrentTime=`date +%s`

			wgetPercentDownloaded=`awk '/%/ { print $7-- }' ${wgetLog} | tail -n1 | uniq -u`

			if [ -f "${imageSearchFolder}/${imageName}/${imageFilename}" ]; then
				wgetDownloadedSize=$(stat -c%s "${imageSearchFolder}/${imageName}/${imageFilename}")
			fi
			
			if [ -z $wgetPercentDownloaded ]; then
				wgetPercentDownloaded=$wgetPercentDownloadedTemp
			else
				wgetPercentDownloadedTemp=$wgetPercentDownloaded
			fi

			wgetDownloadRate=`echo "${wgetDownloadedSize} / (${wgetCurrentTime} - ${wgetStartTime} + 0.01)" | bc`

			wgetDownloadedSize=`nicebytes ${wgetDownloadedSize}`
			wgetDownloadRate=`nicebytes ${wgetDownloadRate}`

			# DIALOG OUTPUT #####################
			echo "XXX"
			echo "##Downloaded:     ${wgetDownloadedSize}\n##Download speed: ${wgetDownloadRate}/s"
			echo "XXX"

			echo ${wgetPercentDownloaded}
			#####################################
			
			sleep 1
		done
	)| dialog  --backtitle "$installerMenuTitle" --title "Downloading ${currentImageNameToDownload}" --gauge "" 7 60 0
fi