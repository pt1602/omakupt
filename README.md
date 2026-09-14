# Omakupt

Turn a fresh Ubuntu installation into a fully-configured, beautiful, and modern web development system by running a single command. No need to write bespoke configs for every essential tool just to get started or to be up on all the latest command-line tools. Omakupt is an opinionated take on what Linux can be at its best.

## Install

On a fresh Ubuntu 24.04+ machine:

```
curl -fsSL https://raw.githubusercontent.com/pt1602/omakupt/master/boot.sh | bash
```

or with `wget`:

```
wget -qO- https://raw.githubusercontent.com/pt1602/omakupt/master/boot.sh | bash
```

See [docs/installation.md](docs/installation.md) for requirements and options.

## Documentation

- [Installation](docs/installation.md)
- [Using the `omakupt` command](docs/usage.md)
- [Updating](docs/updating.md)

## Extras

While Omakupt is purposed to be an opinionated take, the open source community offers alternative customization, add-ons, extras, that you can use to adjust, replace or enrich your experience.

[⇒ Browse the Omakupt extensions.](EXTENSIONS.md)

## Origin

Omakupt is an independent fork of [Omakub](https://github.com/basecamp/omakub) by David Heinemeier Hansson / Basecamp, created after that project stopped being actively developed. It has its own install path, CLI, and release process, and is not affiliated with or endorsed by Basecamp.

## License

Omakupt is released under the [MIT License](LICENSE).
