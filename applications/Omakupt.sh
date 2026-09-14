#!/bin/bash

cat <<EOF >~/.local/share/applications/Omakupt.desktop
[Desktop Entry]
Version=1.0
Name=Omakupt
Comment=Omakupt Controls
Exec=alacritty --config-file /home/$USER/.config/alacritty/pane.toml --class=Omakupt --title=Omakupt -e omakupt
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/omakupt/applications/icons/Omakupt.png
Categories=GTK;
StartupNotify=false
EOF
