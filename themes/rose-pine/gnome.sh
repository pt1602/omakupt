#!/bin/bash

OMAKUPT_THEME_COLOR="red"
OMAKUPT_THEME_BACKGROUND="rose-pine/background.jpg"
source $OMAKUPT_PATH/themes/set-gnome-theme.sh
gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
