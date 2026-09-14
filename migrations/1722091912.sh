#!/bin/bash

sudo echo "Running upgrade migration..."

# Add rustc and pgsql client libs
source $OMAKUPT_PATH/install/terminal/libraries.sh

# Set name and class for desktop files
source $OMAKUPT_PATH/applications/About.sh
source $OMAKUPT_PATH/applications/Activity.sh
source $OMAKUPT_PATH/applications/Docker.sh
source $OMAKUPT_PATH/applications/Neovim.sh
source $OMAKUPT_PATH/applications/Omakupt.sh
source $OMAKUPT_PATH/applications/WhatsApp.sh
