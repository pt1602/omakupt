#!/bin/bash

set -e

ascii_art='                                  $$\                            $$\
                                             $$ |                           $$ |
            $$$$$$\  $$$$$$\$$$$\   $$$$$$\  $$ |  $$\ $$\   $$\  $$$$$$\ $$$$$$\
           $$  __$$\ $$  _$$  _$$\  \____$$\ $$ | $$  |$$ |  $$ |$$  __$$\\_$$  _|
           $$ /  $$ |$$ / $$ / $$ | $$$$$$$ |$$$$$$  / $$ |  $$ |$$ /  $$ | $$ |
           $$ |  $$ |$$ | $$ | $$ |$$  __$$ |$$  _$$<  $$ |  $$ |$$ |  $$ | $$ |$$\
           \$$$$$$  |$$ | $$ | $$ |\$$$$$$$ |$$ | \$$\ \$$$$$$  |$$$$$$$  | \$$$$  |
            \______/ \__| \__| \__| \_______|\__|  \__| \______/ $$  ____/   \____/
                                                                 $$ |
                                                                 $$ |
                                                                 \__|               '

echo -e "$ascii_art"
echo "=> Omakupt is for fresh Ubuntu 24.04+ installations only!"
echo -e "\nBegin installation (or abort with ctrl+c)..."

sudo apt-get update >/dev/null
sudo apt-get install -y git >/dev/null

echo "Cloning Omakupt..."
rm -rf ~/.local/share/omakupt
git clone https://github.com/pt1602/omakupt.git ~/.local/share/omakupt >/dev/null
if [[ -n "$OMAKUPT_REF" && "$OMAKUPT_REF" != "master" ]]; then
	cd ~/.local/share/omakupt
	git fetch origin "$OMAKUPT_REF" && git checkout "$OMAKUPT_REF"
	cd -
fi

echo "Installation starting..."
source ~/.local/share/omakupt/install.sh
