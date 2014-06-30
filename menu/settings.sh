#!/bin/bash

mainMenuInput=/tmp/mainMenuInput.$$
mainMenuOutput=/tmp/mainMenuOutput.$$

networkFormInput=/tmp/networkFormInput.$$

installerTitle="EASY PXE-SERVER CONFIGURATION"




trap "rm -rf $mainMenuInput > /dev/null 2&>1; rm -rf $mainMenuOutput > /dev/null 2&>1; rm -rf $networkFormInput > /dev/null 2&>1; exit" SIGHUP SIGINT SIGTERM
