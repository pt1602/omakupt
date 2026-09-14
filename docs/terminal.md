# Terminal, shell, and editor

## Multiplexer

Zellij (`zellij`) is installed and set as the default terminal multiplexer. `configs/zellij.kdl` sets `locked` as the default mode (most keys pass through to whatever's running in the pane), `Ctrl g` to switch to command mode, and a "compact" layout with full pane frames. See the keybinds block in that file for the full set — pane/tab navigation is on `hjkl` and the arrow keys once you're in command mode.

## Neovim

Neovim is installed via [LazyVim](https://www.lazyvim.org/), themed to match whichever Omakupt theme is active. Switching themes with `omakupt theme` updates `~/.config/nvim/lua/plugins/theme.lua`.

## Shell defaults

`defaults/bash/` is sourced from `~/.bashrc` and provides history settings, a prompt, aliases, and the functions below. They're bash functions, so they're available directly in any terminal — no `omakupt` prefix needed.

### `web2app <AppName> <AppURL> <IconURL> [Profile]`

Creates a desktop launcher that opens a URL as its own Chrome "app" window (own icon, own window, no browser chrome). `IconURL` must point at a PNG — [dashboardicons.com](https://dashboardicons.com) is a good source. The optional fourth argument pins the launcher to a specific Chrome profile (`Default`, `Profile 1`, `Profile 2`, ...), useful when you keep work and personal Google accounts separate.

```
web2app YouTube https://youtube.com https://cdn.example/youtube.png "Profile 1"
```

`web2app-remove <AppName>` removes the launcher and its icon again.

### `app2folder <desktop_file.desktop> <folder_name>` / `app2folder-remove`

Moves an app's `.desktop` entry into (or out of) one of the GNOME activities-overview folders set up by `install/desktop/set-app-grid.sh` (e.g. `WebApps`, `Xtra`). Run either with no arguments to print the available folder names.

### Other functions

- `compress <dir>` / `decompress <file>` — tar.gz a directory / extract a tarball.
- `webm2mp4 <file>` — convert a GNOME screen-recording `.webm` to `.mp4`.
- `iso2sd <iso> <device>` — write an ISO to a USB/SD device with `dd`.

## Hotkeys

`install/desktop/set-gnome-hotkeys.sh` configures, among others:

- `Super+W` — close window
- `Super+Up` — maximize
- `Super+1..6` — switch workspace (6 fixed workspaces, not dynamic)
- `Alt+1..9` — switch to app pinned in that dock position
- `Super+Space` — toggle Ulauncher
- `Ctrl+PrintScreen` — Flameshot screenshot
- `Shift+Alt+1` / `Shift+Alt+2` — open a new Chrome / Alacritty window (instead of focusing an existing one)

See the script for the full list, including the optional Apple Studio/XDR display brightness keys (require ASDControl).
