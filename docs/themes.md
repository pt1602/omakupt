# Themes

`omakupt theme` switches your whole environment — Alacritty, Zellij, Neovim, btop, GNOME (GTK theme, icon theme, accent color, wallpaper), TopHat's meter color, and VS Code — to one consistent color scheme at once.

## Available themes

Ten themes come from the original Omakub project: `tokyo-night`, `catppuccin`, `nord`, `everforest`, `gruvbox`, `kanagawa`, `ristretto`, `rose-pine`, `matte-black`, `osaka-jade`.

Twelve more are ported from [Omarchy](https://github.com/omacom/omarchy): `catppuccin-latte`, `ethereal`, `flexoki-light`, `hackerman`, `last-horizon`, `lumon`, `lupine`, `miasma`, `retro-82`, `solitude`, `vantablack`, `white`.

## What a theme controls

Each theme lives in `themes/<name>/` and provides:

- `alacritty.toml` — terminal color palette
- `zellij.kdl` — multiplexer color palette
- `neovim.lua` — a LazyVim colorscheme plugin spec (only present where an upstream Neovim theme exists)
- `vscode.sh` — installs a matching VS Code theme extension and sets it as active (only present where a real marketplace extension exists)
- `btop.theme` — system monitor color palette
- `tophat.sh` — sets the GNOME TopHat extension's meter color
- `gnome.sh` — sets the GTK/icon theme, GNOME accent color, and desktop wallpaper
- `background.<ext>` — the wallpaper image

Not every theme has every file — the ones ported from Omarchy don't force a Neovim or VS Code integration where the upstream project doesn't have one either, rather than inventing a fake match. `bin/omakupt-sub/theme.sh` only copies/sources files that actually exist, so a missing one is silently skipped.

## Fonts

`omakupt font` switches the monospace font (used by the terminal, GNOME, and VS Code) between a handful of bundled Nerd Fonts — Cascadia Mono, Fira Mono, JetBrains Mono, Meslo. `omakupt font` → "Change size" adjusts the terminal font size directly.
