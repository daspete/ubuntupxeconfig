#!/bin/bash

doDownload=1
imageFilename=${currentImageURLToDownload##*/}



if [ -f ${imageSearchFolder}/${imageFilename} ]; then
	
	source menu/images/confirmReDownload.sh

	echo ${doDownload}
fi



if [ ${doDownload} == 1 ]; then
	wget -P ${imageSearchFolder} -o ${wgetLog} "${currentImageURLToDownload}" &(
		WGETMIN=0
		WGETMAX=0
		WGETLOADED=0

		while [ $WGETMIN -lt 99 ]; do
			WGETMIN=`awk '/%/ { print $7-- }' ${wgetLog} | tail -n1 | uniq -u`
			WGETKBS=`awk '/%/ { print $8 }' ${wgetLog} | tail -n1`
			WGETLOADED=`awk '/K/ { print $1 }' ${wgetLog} | tail -n1`

			if [ -z $WGETMIN ]; then
				WGETMIN=$WGETMAX
			else
				WGETMAX=$WGETMIN
			fi
			
			echo "XXX"
			echo "Downloading ${currentImageNameToDownload}...\n\nLoaded: ${WGETLOADED}B \nSpeed: ${WGETKBS}B/s"
			echo "XXX"
			echo $WGETMIN

			sleep 1
		done
	) | dialog --gauge "" 10 60 0
fi
