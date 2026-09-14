# Installation

## Requirements

- Ubuntu 24.04 or newer
- x86_64 or i686 architecture

These are checked automatically by `install/check-version.sh` and the installer aborts with a clear error if they aren't met.

## Running the installer

On a fresh Ubuntu machine:

```
curl -fsSL https://raw.githubusercontent.com/pt1602/omakupt/master/boot.sh | bash
```

or, if you prefer `wget`:

```
wget -qO- https://raw.githubusercontent.com/pt1602/omakupt/master/boot.sh | bash
```

This downloads and runs `boot.sh`, which:

1. Installs `git` if it's missing.
2. Clones this repository to `~/.local/share/omakupt`.
3. Runs `install.sh` from that clone.

## Installing a specific branch or tag

Set `OMAKUPT_REF` before running the installer to check out something other than `master`:

```
OMAKUPT_REF=my-branch bash -c "$(curl -fsSL https://raw.githubusercontent.com/pt1602/omakupt/master/boot.sh)"
```

## What gets installed

`install.sh` always installs the terminal tooling (`install/terminal.sh`: shell defaults, git, mise, dev tools). If you're running a GNOME desktop session, it additionally installs desktop apps and GNOME tweaks (`install/desktop.sh`) and temporarily disables screen lock/idle so the (long-running) install isn't interrupted.

Along the way you'll be asked to pick:

- Optional desktop apps (GNOME sessions only) — see `install/first-run-choices.sh`
- Programming languages to set up (Ruby on Rails, Node.js, Go, PHP, Python, Elixir, Rust, Java)
- Databases to run in Docker (MySQL, Redis, PostgreSQL)
- Your git name/email, used for `git config --global user.name/user.email`

## Retrying a failed install

If something goes wrong partway through, re-run:

```
source ~/.local/share/omakupt/install.sh
```
