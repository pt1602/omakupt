#!/bin/bash

source "${OMAKUPT_PATH:-$HOME/.local/share/omakupt}/install/lib/compat.sh"

if ! add_ppa_if_published ppa:cappelikan/ppa mainline; then
	omakupt_note "skipping Mainline; the PPA has no build for this Ubuntu release yet"
	return 0 2>/dev/null || exit 0
fi

sudo apt install -y mainline
