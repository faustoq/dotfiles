# my .dotfiles

This project is everything I need to feel at 🏠  on **a brand new Macbook**, so I can start coding right away. 🧑‍💻

While I make myself a cup of ☕️ , this script handles all those boring chores such as:
- installing web browsers 🌎, code editors ⌨️, Docker 🐳, latest PHP, NodeJS and Python 🔧, Spotify 🎧, some messaging apps 💬 and a bunch of other stuff...
- install a list of global ***npm*** and ***composer*** packages 📦
- customise and keep in sync `.bash_profile` and `.zshrc` files. ⚡️

---
💡 Inspired by [@kopiro](https://github.com/kopiro/)'s [dotfiles](https://github.com/kopiro/dotfiles).

---

## Quick Setup

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

Occasionally it comes time to change my Macbook. Once the new toy is unwrapped, instead of starting to play, the first thing I need to do is install an endless list of apps (and I often forget a few) and various customisations. Definitely a chore that  I prefer to avoid doing every time. 

This bash script handles everything in just over a couple of minutes thanks to [Homebrew](https://brew.sh/) 🍺 

### Apps included:
- Google Chrome ([Website](https://www.google.com/chrome/))
- Firefox ([Website](https://www.mozilla.org/en-US/firefox/))
- Microsoft Edge ([Website](https://www.microsoft.com/en-us/edge))
- Blisk ([Website](https://blisk.io/))
- Brave ([Website](https://brave.com/))
- iTerm2 ([Website](https://iterm2.com/))
- Sublime Text ([Website](https://www.sublimetext.com/))
- Visual Studio Code ([Website](https://code.visualstudio.com/))
- Table Plus ([Website](https://tableplus.com/))
- Sequel Pro ([Website](https://www.sequelpro.com/))
- Slack ([Website](https://www.slack.com/))
- Discord ([Website](https://discord.com/))
- Telegram ([Website](https://telegram.org/))
- 1Password ([Website](https://1password.com/))
- Dash ([Website](https://kapeli.com/dash))
- Figma ([Website](https://www.figma.com/))
- Google Cloud Sdk ([Website](https://cloud.google.com/sdk/))
- Notion ([Website](https://www.notion.so/))
- POEditor ([Website](https://poeditor.com/))
- Postman ([Website](https://www.postman.com/))
- The Unarchiver ([Website](https://theunarchiver.com/))
- Transmission ([Website](https://transmissionbt.com/))
- Cyberduck ([Website](https://cyberduck.io/))
- VLC ([Website](https://www.videolan.org/vlc/))
- Docker ([Website](https://www.docker.com/))
- App Cleaner ([Website](https://freemacsoft.net/appcleaner/))
- Spotify ([Website](https://www.spotify.com/))

### Fonts included:
- SF-Mono-Nerd ([Github](https://github.com/epk/SF-Mono-Nerd-Font))
- Fira Code ([Github](https://github.com/tonsky/FiraCode))

### Screen savers included:
- Brooklyn ([Github](https://github.com/pedrommcarrasco/Brooklyn))
- Aerial ([Github](https://github.com/JohnCoates/Aerial))

### Other Homebrew apps included:
asciinema, autoconf, autojump, broot, ccache, cmake, colordiff, colortail, composer, coreutils, ffmpeg, findutils, freetype, fswatch, fzf, geoip, gettext, git, git-lfs, htop, kubectx, mackup, mas, midnight-commander, moreutils, nmap, node, nvm, openssl, php, php-code-sniffer, python, redis,  sqlite, sqlmap, terminal-notifier, tldr, wget, yarn, youtube-dl, zlib... and more!

## Extras:
- iTerm shell integration ([more informations](https://iterm2.com/documentation-shell-integration.html))
- [oh my zsh](https://ohmyz.sh/) setup and configuration
- sync `bash` and `zsh` profile configurations
- global `.gitignore`
- Composer [global packages](/packages/composer.txt)
- NPM [global packages](/packages/npm.txt)
