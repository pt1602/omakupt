#!/bin/bash

source "${OMAKUPT_PATH:-$HOME/.local/share/omakupt}/install/lib/compat.sh"

sudo apt install -y gnome-shell-extension-manager gir1.2-gtop-2.0 gir1.2-clutter-1.0
pipx install gnome-extensions-cli --system-site-packages

# Turn off default Ubuntu extensions. A release can rename or drop one of these, so
# don't let that abort the rest of the setup.
gnome-extensions disable tiling-assistant@ubuntu.com || true
gnome-extensions disable ubuntu-appindicators@ubuntu.com || true
gnome-extensions disable ubuntu-dock@ubuntu.com || true
gnome-extensions disable ding@rastersoft.com || true

# Pause to assure user is ready to accept confirmations
gum confirm "To install Gnome extensions, you need to accept some confirmations. Ready?"

# Install new extensions. gext exits 0 even when an extension has no build for the
# running Gnome Shell version yet, it just doesn't install anything - the schema
# copy step below is what actually detects and reports a skipped extension.
gext install tactile@lundal.io
gext install just-perfection-desktop@just-perfection
gext install blur-my-shell@aunetx
gext install space-bar@luchrioh
gext install undecorate@sun.wxg@gmail.com
gext install tophat@fflewddur.github.io
gext install AlphabeticalAppGrid@stuarthayhurst

# Compile gsettings schemas in order to be able to set them. Only copy a schema that
# gext actually installed, so an extension with no build for this Gnome Shell version
# is skipped instead of aborting every extension after it.
copy_extension_schema() {
	local uuid=$1 schema_file=$2
	local schema_path="$HOME/.local/share/gnome-shell/extensions/$uuid/schemas/$schema_file"

	if [ -f "$schema_path" ]; then
		sudo cp "$schema_path" /usr/share/glib-2.0/schemas/
	else
		omakupt_note "skipping $uuid; gext did not install it for this Gnome Shell version"
	fi
}

copy_extension_schema "tactile@lundal.io" "org.gnome.shell.extensions.tactile.gschema.xml"
copy_extension_schema "just-perfection-desktop@just-perfection" "org.gnome.shell.extensions.just-perfection.gschema.xml"
copy_extension_schema "blur-my-shell@aunetx" "org.gnome.shell.extensions.blur-my-shell.gschema.xml"
copy_extension_schema "space-bar@luchrioh" "org.gnome.shell.extensions.space-bar.gschema.xml"
copy_extension_schema "tophat@fflewddur.github.io" "org.gnome.shell.extensions.tophat.gschema.xml"
copy_extension_schema "AlphabeticalAppGrid@stuarthayhurst" "org.gnome.shell.extensions.AlphabeticalAppGrid.gschema.xml"
sudo glib-compile-schemas /usr/share/glib-2.0/schemas/

# Configure Tactile
gsettings_set_if_available org.gnome.shell.extensions.tactile col-0 1
gsettings_set_if_available org.gnome.shell.extensions.tactile col-1 2
gsettings_set_if_available org.gnome.shell.extensions.tactile col-2 1
gsettings_set_if_available org.gnome.shell.extensions.tactile col-3 0
gsettings_set_if_available org.gnome.shell.extensions.tactile row-0 1
gsettings_set_if_available org.gnome.shell.extensions.tactile row-1 1
gsettings_set_if_available org.gnome.shell.extensions.tactile gap-size 32

# Configure Just Perfection
gsettings_set_if_available org.gnome.shell.extensions.just-perfection animation 2
gsettings_set_if_available org.gnome.shell.extensions.just-perfection dash-app-running true
gsettings_set_if_available org.gnome.shell.extensions.just-perfection workspace true
gsettings_set_if_available org.gnome.shell.extensions.just-perfection workspace-popup false

# Configure Blur My Shell
gsettings_set_if_available org.gnome.shell.extensions.blur-my-shell.appfolder blur false
gsettings_set_if_available org.gnome.shell.extensions.blur-my-shell.lockscreen blur false
gsettings_set_if_available org.gnome.shell.extensions.blur-my-shell.screenshot blur false
gsettings_set_if_available org.gnome.shell.extensions.blur-my-shell.window-list blur false
gsettings_set_if_available org.gnome.shell.extensions.blur-my-shell.panel blur false
gsettings_set_if_available org.gnome.shell.extensions.blur-my-shell.overview blur true
gsettings_set_if_available org.gnome.shell.extensions.blur-my-shell.overview pipeline 'pipeline_default'
gsettings_set_if_available org.gnome.shell.extensions.blur-my-shell.dash-to-dock blur true
gsettings_set_if_available org.gnome.shell.extensions.blur-my-shell.dash-to-dock brightness 0.6
gsettings_set_if_available org.gnome.shell.extensions.blur-my-shell.dash-to-dock sigma 30
gsettings_set_if_available org.gnome.shell.extensions.blur-my-shell.dash-to-dock static-blur true
gsettings_set_if_available org.gnome.shell.extensions.blur-my-shell.dash-to-dock style-dash-to-dock 0

# Configure Space Bar
gsettings_set_if_available org.gnome.shell.extensions.space-bar.behavior smart-workspace-names false
gsettings_set_if_available org.gnome.shell.extensions.space-bar.shortcuts enable-activate-workspace-shortcuts false
gsettings_set_if_available org.gnome.shell.extensions.space-bar.shortcuts enable-move-to-workspace-shortcuts true
gsettings_set_if_available org.gnome.shell.extensions.space-bar.shortcuts open-menu "@as []"

# Configure TopHat
gsettings_set_if_available org.gnome.shell.extensions.tophat show-icons false
gsettings_set_if_available org.gnome.shell.extensions.tophat show-cpu false
gsettings_set_if_available org.gnome.shell.extensions.tophat show-disk false
gsettings_set_if_available org.gnome.shell.extensions.tophat show-mem false
gsettings_set_if_available org.gnome.shell.extensions.tophat show-fs false
gsettings_set_if_available org.gnome.shell.extensions.tophat network-usage-unit bits

# Configure AlphabeticalAppGrid
gsettings_set_if_available org.gnome.shell.extensions.alphabetical-app-grid folder-order-position 'end'
