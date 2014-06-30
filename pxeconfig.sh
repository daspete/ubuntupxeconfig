#!/bin/bash

clear

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

source ./menu/startDialog.sh
source ./menu/mainMenu.sh

clear

$cleanUpCommands



