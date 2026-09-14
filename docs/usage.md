# Using Omakupt

After installation, the `omakupt` command is on your `PATH`. Running it with no arguments opens an interactive menu:

```
omakupt
```

Each entry can also be invoked directly, e.g. `omakupt theme` or `omakupt install`.

## Theme

`omakupt theme` lets you switch your whole environment (Alacritty, Zellij, Neovim, btop, GNOME, VS Code) to one of the bundled color themes at once: Tokyo Night, Catppuccin, Nord, Everforest, Gruvbox, Kanagawa, Ristretto, Rose Pine, Matte Black, Osaka Jade.

## Font

`omakupt font` / the "Font" menu entry lets you change the terminal font and font size.

## Install

`omakupt install` opens a menu of optional software you can add after the fact: dev editors, an additional programming language or database, and apps like 1Password, Brave, Docker-based databases, Spotify, Steam, Tailscale, and more. Choosing "Web Apps" lets you add browser-based apps as their own desktop icon.

## Uninstall

`omakupt uninstall` opens a menu of uninstallers, mirroring the optional installers above.

## Update

`omakupt update` lets you update manually-managed tools (Ollama, LazyGit, LazyDocker, Neovim, Zellij) individually, or choose **Omakupt** to update Omakupt itself — this runs `git pull` in `~/.local/share/omakupt` and then applies any new scripts under `migrations/` that were added since your last update. See [updating.md](updating.md) for details.

## Manual

`omakupt manual` opens this repository's [`docs/`](.) folder on GitHub in your browser.
