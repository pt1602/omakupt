#!/bin/bash

# Space Bar's own move-to-workspace shortcuts hardcode Shift+Super+<digit> and
# actively overwrite org.gnome.desktop.wm.keybindings move-to-workspace-N with that
# whenever enabled - fighting the Ctrl+Super+<digit> binding set earlier (chosen to
# avoid the layout issues Shift+<digit> has on non-US keyboards). Turn it off and
# restore our own bindings, which Space Bar may have already overwritten.

echo "Stopping Space Bar from overriding the move-to-workspace keybindings..."

gsettings set org.gnome.shell.extensions.space-bar.shortcuts enable-move-to-workspace-shortcuts false

gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 "['<Control><Super>1']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 "['<Control><Super>2']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 "['<Control><Super>3']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 "['<Control><Super>4']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-5 "['<Control><Super>5']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-6 "['<Control><Super>6']"
