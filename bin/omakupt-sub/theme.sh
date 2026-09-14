#!/bin/bash

THEME_NAMES=("Tokyo Night" "Catppuccin" "Catppuccin Latte" "Nord" "Everforest" "Gruvbox" "Kanagawa" "Ristretto" "Rose Pine" "Matte Black" "Osaka Jade" "Ethereal" "Flexoki Light" "Hackerman" "Last Horizon" "Lumon" "Lupine" "Miasma" "Retro 82" "Solitude" "Vantablack" "White")
THEME=$(gum choose "${THEME_NAMES[@]}" "<< Back" --header "Choose your theme" --height 24 | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

if [ -n "$THEME" ] && [ "$THEME" != "<<-back" ]; then
  cp $OMAKUPT_PATH/themes/$THEME/alacritty.toml ~/.config/alacritty/theme.toml
  cp $OMAKUPT_PATH/themes/$THEME/zellij.kdl ~/.config/zellij/themes/$THEME.kdl
  sed -i "s/theme \".*\"/theme \"$THEME\"/g" ~/.config/zellij/config.kdl
  if [ -d "$HOME/.config/nvim" ] && [ -f "$OMAKUPT_PATH/themes/$THEME/neovim.lua" ]; then
    cp $OMAKUPT_PATH/themes/$THEME/neovim.lua ~/.config/nvim/lua/plugins/theme.lua
  fi

  if [ -f "$OMAKUPT_PATH/themes/$THEME/btop.theme" ]; then
    cp $OMAKUPT_PATH/themes/$THEME/btop.theme ~/.config/btop/themes/$THEME.theme
    sed -i "s/color_theme = \".*\"/color_theme = \"$THEME\"/g" ~/.config/btop/btop.conf
  else
    sed -i "s/color_theme = \".*\"/color_theme = \"Default\"/g" ~/.config/btop/btop.conf
  fi

  source $OMAKUPT_PATH/themes/$THEME/gnome.sh
  source $OMAKUPT_PATH/themes/$THEME/tophat.sh
  [ -f "$OMAKUPT_PATH/themes/$THEME/vscode.sh" ] && source $OMAKUPT_PATH/themes/$THEME/vscode.sh

  # Forgo setting the Chrome theme until we might find a less disruptive way of doing it.
  # Having to quit Chrome, and all Chrome-based apps, is too much of an inposition.
  # source $OMAKUPT_PATH/themes/$THEME/chrome.sh
fi

source $OMAKUPT_PATH/bin/omakupt-sub/menu.sh
