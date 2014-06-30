#!/bin/bash

#clear the screen
clear

# include files
source ./config.sh
source ./menu/settings.sh
source ./includes/functions.sh
source ./tasks/checkRequirements.sh

# install dialog package if not present
if [ $dialogMissing == "1" ]; then
        echo -n "Installing dialog package..."
        apt-get -y install dialog >/dev/null 2>&1
        echo "done"
fi

# show intro screen
source ./menu/startDialog.sh

# show main menu
source ./menu/mainMenu.sh

# clear screen after work
clear

# cleanup temporary files if there are any
$cleanUpCommands



