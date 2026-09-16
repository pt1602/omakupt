#!/bin/bash

# The "move window to workspace" shortcut used Shift+digit, which on many keyboard
# layouts (e.g. German) doesn't send the digit's keysym at all when combined with
# Shift - so the binding could never be triggered on those layouts. Re-point it at
# Ctrl+digit, which is layout-independent.

echo "Fixing the move-to-workspace keybindings for non-US keyboard layouts..."

gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 "['<Control><Super>1']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 "['<Control><Super>2']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 "['<Control><Super>3']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 "['<Control><Super>4']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-5 "['<Control><Super>5']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-6 "['<Control><Super>6']"
