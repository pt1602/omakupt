#!/bin/bash

source "${OMAKUPT_PATH:-$HOME/.local/share/omakupt}/install/lib/compat.sh"

# Skipped rather than errored when TopHat is not installed
gsettings_set_if_available org.gnome.shell.extensions.tophat meter-fg-color "#205EA6"
