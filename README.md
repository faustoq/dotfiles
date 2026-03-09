# my .dotfiles

What is this?
Check this out: [Dotfiles - ArchWiki](https://wiki.archlinux.org/index.php/Dotfiles)

TL;DR

This project is everything I need to feel at home on **a brand new Macbook**, so I can start coding right away. 🧑‍💻

While I make myself a cup of coffee ☕️, these scripts handle all those boring chores such as:

- installing web browsers 🌎, code editors ⌨️, Docker 🐳, latest PHP, NodeJS and Python 🔧, Spotify 🎧, some messaging apps 💬 and a bunch of other stuff...
- installing a list of global **_npm_** and **_composer_** packages 📦
- customising and keeping `.bash_profile` and `.zshrc` in sync. ⚡️

---

## Quick Install

**Required:** Install XCode Command Line Tools

```bash
xcode-select --install
```

Download or clone this repository under `~/.dotfiles` directory

```bash
cd && git clone git@github.com:faustoq/dotfiles.git .dotfiles
```

Done! ✨

---

## Usage

Install everything:

```bash
~/.dotfiles/install.sh
```

...and get some coffee ☕️ .

<a href="#extras">Extra stuff</a> and configurations:

```bash
~/.dotfiles/extra.sh
```

---

## About

Occasionally it comes time to change my Macbook. Once the new toy is unwrapped, instead of starting to play, the first thing I need to do is install an endless list of apps (and I often forget a few) and various customisations. Definitely a chore that I prefer to avoid doing every time.

These scripts handle everything in just over a couple of minutes thanks to [Homebrew](https://brew.sh/) 🍺

### Apps included:

- Arc ([Website](https://arc.net/))
- Google Chrome ([Website](https://www.google.com/chrome/))
- Firefox ([Website](https://www.mozilla.org/en-US/firefox/))
- Microsoft Edge ([Website](https://www.microsoft.com/edge))
- Brave ([Website](https://brave.com/))
- iTerm2 ([Website](https://iterm2.com/))
- Visual Studio Code ([Website](https://code.visualstudio.com/))
- Table Plus ([Website](https://tableplus.com/))
- GitHub Desktop ([Website](https://desktop.github.com/))
- Slack ([Website](https://www.slack.com/))
- Discord ([Website](https://discord.com/))
- Telegram ([Website](https://telegram.org/))
- Dash ([Website](https://kapeli.com/dash))
- Figma ([Website](https://www.figma.com/))
- Google Drive ([Website](https://www.google.com/drive/))
- Google Cloud SDK ([Website](https://cloud.google.com/sdk/))
- Hex Fiend ([Website](https://hexfiend.com/))
- Gas Mask ([Website](https://github.com/2ndalpha/gasmask))
- Notion ([Website](https://www.notion.so/))
- Poedit ([Website](https://poedit.net/))
- Postman ([Website](https://www.postman.com/))
- The Unarchiver ([Website](https://theunarchiver.com/))
- Transmission ([Website](https://transmissionbt.com/))
- Cyberduck ([Website](https://cyberduck.io/))
- VLC ([Website](https://www.videolan.org/vlc/))
- Docker ([Website](https://www.docker.com/))
- AppCleaner ([Website](https://freemacsoft.net/appcleaner/))
- ProvisionQL ([Website](https://github.com/easyosx/provisionql))
- Sourcetree ([Website](https://www.sourcetreeapp.com/))
- Spotify ([Website](https://www.spotify.com/))

### Fonts included:

- Inter ([Website](https://rsms.me/inter/))
- SF-Mono-Nerd ([Github](https://github.com/epk/SF-Mono-Nerd-Font))
- Fira Code ([Github](https://github.com/tonsky/FiraCode))
- JetBrains Mono ([Website](https://www.jetbrains.com/lp/mono/))

### Screen savers included:

- Brooklyn ([Github](https://github.com/pedrommcarrasco/Brooklyn))
- Aerial ([Github](https://github.com/JohnCoates/Aerial))

### Other Homebrew apps included:

asciinema, antigen, autoconf, autojump, broot, ccache, cloudflared, cmake, colordiff, colortail, composer, coreutils, ffmpeg, findutils, freetype, fswatch, fzf, geoip, gettext, git, git-lfs, graphiql, heroku, htop, kubectx, mackup, mas, midnight-commander, moreutils, nmap, node, nvm, openssl, php, php-code-sniffer, python, redis, ripgrep, shellcheck, socat, sox, sqlite, sqlmap, terminal-notifier, the_silver_searcher, tldr, wget, wifi-password, yarn, youtube-dl, zlib... and more!

For the complete and always up-to-date package lists, check:

- Homebrew formulae: [`brews/brewlist.txt`](brews/brewlist.txt)
- Homebrew casks: [`brews/casklist.txt`](brews/casklist.txt)
- Homebrew taps: [`brews/taps.txt`](brews/taps.txt)
- Mac App Store apps (IDs): [`brews/maslist.txt`](brews/maslist.txt)

## Extras:

- iTerm shell integration ([more informations](https://iterm2.com/documentation-shell-integration.html))
- [oh my zsh](https://ohmyz.sh/) setup and configuration
- sync `bash` and `zsh` profile configurations
- global `.gitignore`
- Composer [global packages](/packages/composer.txt)
- NPM [global packages](/packages/npm.txt)
