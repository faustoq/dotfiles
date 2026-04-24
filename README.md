# dotfiles

Version-controlled personal config for keeping shell setup in sync across machines (especially `.bash_profile` and `.zshrc`).
It also bootstraps a new macOS machine by installing apps, fonts, CLI tools, and global packages.

## Management approach

This repo tracks dotfiles in Git and applies them through setup scripts, instead of managing configs manually per machine.
Core shell configs are kept aligned, while package/app lists stay declarative in text files.

## Setup

Install Xcode Command Line Tools:

```bash
xcode-select --install
```

Clone this repository to `~/.dotfiles`:

```bash
git clone git@github.com:faustoq/dotfiles.git ~/.dotfiles
```

## Usage

Run the base setup:

```bash
~/.dotfiles/install.sh
```

Run extra setup/configuration:

```bash
~/.dotfiles/extra.sh
```

## Package Lists

This repo keeps package lists in plain text files:

- Homebrew formulae: [`brews/brewlist.txt`](brews/brewlist.txt)
- Homebrew casks: [`brews/casklist.txt`](brews/casklist.txt)
- Homebrew taps: [`brews/taps.txt`](brews/taps.txt)
- Mac App Store apps: [`brews/maslist.txt`](brews/maslist.txt)
- Composer globals: [`packages/composer.txt`](packages/composer.txt)
- npm globals: [`packages/npm.txt`](packages/npm.txt)
