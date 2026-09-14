#!/bin/bash

source "${OMAKUPT_PATH:-$HOME/.local/share/omakupt}/install/lib/compat.sh"

# 26.04 dropped the gnome-tweak-tool transitional package
apt_install_first gnome-tweaks gnome-tweak-tool
