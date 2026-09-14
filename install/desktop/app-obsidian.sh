#!/bin/bash

# Obsidian is a multi-platform note taking application. See https://obsidian.md
cd /tmp

# GitHub's "latest" release is not always a desktop build (Obsidian sometimes tags
# mobile-only point releases as latest), so walk recent releases for the newest one
# that actually publishes a Linux .deb and use its real asset URL, rather than
# guessing a filename from a version number that may not exist.
OBSIDIAN_DEB_URL=$(curl -s "https://api.github.com/repos/obsidianmd/obsidian-releases/releases?per_page=10" |
	grep -Po '"browser_download_url":\s*"\K[^"]*_amd64\.deb' | head -n 1)

if [ -z "$OBSIDIAN_DEB_URL" ]; then
	echo "Could not find a recent Obsidian .deb release, skipping Obsidian install." >&2
else
	wget -O obsidian.deb "$OBSIDIAN_DEB_URL"
	sudo apt install -y ./obsidian.deb
	rm obsidian.deb
fi
cd -
