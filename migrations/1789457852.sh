#!/bin/bash

# Add the Notification Banner Position extension for installs that ran the desktop
# setup before it was added, without re-running the rest of set-gnome-extensions.sh.

source "${OMAKUPT_PATH:-$HOME/.local/share/omakupt}/install/lib/compat.sh"

gum confirm "To install the Notification Banner Position Gnome extension, you need to accept a confirmation. Ready?"

gext install notification-position@drugo.dev

copy_extension_schema() {
	local uuid=$1 schema_file=$2
	local schema_path="$HOME/.local/share/gnome-shell/extensions/$uuid/schemas/$schema_file"

	if [ -f "$schema_path" ]; then
		sudo cp "$schema_path" /usr/share/glib-2.0/schemas/
	else
		omakupt_note "skipping $uuid; gext did not install it for this Gnome Shell version"
	fi
}

copy_extension_schema "notification-position@drugo.dev" "org.gnome.shell.extensions.notification-position.gschema.xml"
sudo glib-compile-schemas /usr/share/glib-2.0/schemas/

gnome-extensions enable notification-position@drugo.dev 2>/dev/null || omakupt_note "could not enable notification-position@drugo.dev"
