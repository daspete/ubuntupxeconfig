#!/bin/bash

doDownload=1
downloadError=0
imageFilename=${currentImageURLToDownload##*/}

wgetProcessID=0

wgetStartTime=0
wgetCurrentTime=0

wgetDownloadedSize=0
wgetDownloadRate=0
wgetDownloadTime=0
wgetPercentDownloaded=0
wgetPercentDownloadedTemp=0


if [ -f "${imageSearchFolder}/${imageFilename}" ]; then
	source menu/images/confirmReDownload.sh
fi

if [ ${doDownload} == 1 ]; then
	rm -rf ${wgetLog} >/dev/null 2>&1;
	touch ${wgetLog}

	wget -P "${imageSearchFolder}" -o ${wgetLog} "${currentImageURLToDownload}" &

	wgetProcessID=$!
	wgetStartTime=`date +%s`

	while ps -p ${wgetProcessID} >/dev/null; do
		wgetCurrentTime=`date +%s`

		if [ -f "${imageSearchFolder}/${imageFilename}" ]; then
			wgetDownloadedSize=$(stat -c%s "${imageSearchFolder}/${imageFilename}")
		fi
		
		wgetPercentDownloaded=`awk '/%/ { print $7-- }' ${wgetLog} | tail -n1 | uniq -u`
		if [ -z $wgetPercentDownloaded ]; then
			wgetPercentDownloaded=$wgetPercentDownloadedTemp
		else
			wgetPercentDownloadedTemp=$wgetPercentDownloaded
		fi

		wgetDownloadRate=`echo "${wgetDownloadedSize} / (${wgetCurrentTime} - ${wgetStartTime} + 0.01)" | bc`


		nicebytes ${wgetDownloadedSize} 
		#echo "${wgetDownloadedSize}" | awk '{ sum=$1 ; hum[1024**3]="Gb";hum[1024**2]="Mb";hum[1024]="Kb"; for (x=1024**3; x>=1024; x/=1024){ if (sum>=x) { printf "%.2f %s\n",sum/x,hum[x];break } }}' 
		#echo "${wgetPercentDownloaded}" | awk '{ sum=$1 ; hum[1024**3]="Gb";hum[1024**2]="Mb";hum[1024]="Kb"; for (x=1024**3; x>=1024; x/=1024){ if (sum>=x) { printf "%.2f %s\n",sum/x,hum[x];break } }}' 
		#echo "${wgetDownloadRate}" | awk '{ sum=$1 ; hum[1024**3]="Gb";hum[1024**2]="Mb";hum[1024]="Kb"; for (x=1024**3; x>=1024; x/=1024){ if (sum>=x) { printf "%.2f %s\n",sum/x,hum[x];break } }}' 
		#dialog  --backtitle "$installerMenuTitle" \
		#		--title "Downloading ${currentImageNameToDownload}" \
		#		--clear \
		#		--gauge "Downloaded: ${wgetDownloadedSize}\nDownload speed: ${wgetDownloadRate}" \
		#		10 60 ${wgetPercentDownloaded}

		sleep 1;
	done

fi