# GNOME extensions

`install/desktop/set-gnome-extensions.sh` disables the default Ubuntu extensions (tiling-assistant, appindicators, ubuntu-dock, desktop icons) and installs these instead:

| Extension | What it does |
|---|---|
| [Tactile](https://extensions.gnome.org/extension/4548/tactile/) | Snap-to-grid window tiling, dragged with the mouse or driven by keybindings. |
| [Just Perfection](https://extensions.gnome.org/extension/3843/just-perfection/) | Trims GNOME Shell UI elements (animations, workspace popup, etc.) down to a leaner look. |
| [Blur My Shell](https://extensions.gnome.org/extension/3193/blur-my-shell/) | Adds a background blur to the overview and the dock. |
| [Space Bar](https://extensions.gnome.org/extension/5090/space-bar/) | Replaces the workspace indicator with a compact bar of numbered workspaces. |
| [Undecorate](https://extensions.gnome.org/extension/4102/undecorate/) | Removes window title bars for a cleaner tiled look. |
| [TopHat](https://extensions.gnome.org/extension/5219/tophat/) | Panel resource monitor. Configured here to show CPU and memory only (network, disk, and filesystem meters are off). |
| [Alphabetical App Grid](https://extensions.gnome.org/extension/4269/alphabetical-app-grid/) | Sorts the app grid alphabetically instead of by install order. |
| [Window Is Ready – Notification Remover](https://extensions.gnome.org/extension/1007/window-is-ready-notification-remover/) | Silences the "Window is ready" notification some apps trigger on launch. |
| [Weeks Start on Monday Again](https://extensions.gnome.org/extension/1720/weeks-start-on-monday-again/) | Makes the calendar/clock week start on Monday. Not needed (and not published) on GNOME 50+, which supports this natively — skipped there automatically. |
| [Weather O'Clock](https://extensions.gnome.org/extension/5470/weather-oclock/) | Shows current weather in the panel next to the clock. Needs the GNOME Weather app (installed alongside it) to have a saved location — open Weather once and add your city. |
| [Notification Banner Position](https://extensions.gnome.org/extension/4105/notification-banner-position/) | Lets you move where notification banners pop up, via a quick menu in the top panel. |

All of these get installed via `gnome-extensions-cli` (`gext`) and explicitly enabled afterward, so a fresh install doesn't leave one merely downloaded-but-inactive. An extension with no build for the running GNOME Shell version is skipped with a note rather than aborting the rest of the setup.

Each extension's settings are applied with `gsettings`; see the "Configure ..." sections in `install/desktop/set-gnome-extensions.sh` for the exact values (dock/tiling layout, Tactile grid size, Blur My Shell blur targets, TopHat's visible meters, etc.).
