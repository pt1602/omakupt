#!/bin/bash

cp ~/.local/share/omakupt/configs/alacritty/shared.toml ~/.config/alacritty/shared.toml
cp ~/.local/share/omakupt/configs/alacritty/pane.toml ~/.config/alacritty/pane.toml
cp ~/.local/share/omakupt/configs/alacritty/btop.toml ~/.config/alacritty/btop.toml
cp ~/.local/share/omakupt/configs/alacritty.toml ~/.config/alacritty/alacritty.toml

source $OMAKUPT_PATH/applications/About.sh
source $OMAKUPT_PATH/applications/Activity.sh
source $OMAKUPT_PATH/applications/Neovim.sh
source $OMAKUPT_PATH/applications/Docker.sh
source $OMAKUPT_PATH/applications/Omakupt.sh

alacritty migrate 2>/dev/null || true
alacritty migrate -c ~/.config/alacritty/pane.toml 2>/dev/null || true
alacritty migrate -c ~/.config/alacritty/btop.toml 2>/dev/null || true
