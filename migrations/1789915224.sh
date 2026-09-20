#!/bin/bash

# Gnome's own default "open a new window of the Nth pinned app" shortcut is also
# Ctrl+Super+<digit> and wins over our move-to-workspace binding on that same combo.
# Clear it so Ctrl+Super+<digit> unambiguously moves the focused window.

echo "Clearing the Gnome default shortcut that collides with Ctrl+Super+<digit>..."

gsettings set org.gnome.shell.keybindings open-new-window-application-1 "[]"
gsettings set org.gnome.shell.keybindings open-new-window-application-2 "[]"
gsettings set org.gnome.shell.keybindings open-new-window-application-3 "[]"
gsettings set org.gnome.shell.keybindings open-new-window-application-4 "[]"
gsettings set org.gnome.shell.keybindings open-new-window-application-5 "[]"
gsettings set org.gnome.shell.keybindings open-new-window-application-6 "[]"
gsettings set org.gnome.shell.keybindings open-new-window-application-7 "[]"
gsettings set org.gnome.shell.keybindings open-new-window-application-8 "[]"
gsettings set org.gnome.shell.keybindings open-new-window-application-9 "[]"
