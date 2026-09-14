#!/bin/bash

source "${OMAKUPT_PATH:-$HOME/.local/share/omakupt}/install/lib/compat.sh"

# Display system information in the terminal. The PPA tracks upstream far more
# closely than the archive, but it does not always have a build the day a new
# Ubuntu ships; 26.04 carries fastfetch in universe, so fall back there rather
# than leaving behind a source that breaks every later apt update.
add_ppa_if_published ppa:zhangsongcui3371/fastfetch fastfetch || true

sudo apt install -y fastfetch

# Only attempt to set configuration if fastfetch is not already set
if [ ! -f "$HOME/.config/fastfetch/config.jsonc" ]; then
  # Use Omakupt fastfetch config
  mkdir -p ~/.config/fastfetch
  cp ~/.local/share/omakupt/configs/fastfetch.jsonc ~/.config/fastfetch/config.jsonc
fi
