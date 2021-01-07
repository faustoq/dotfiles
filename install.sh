#!/bin/bash

BR='\n'
MSG_OPEN='\n\n\033[40;38;5;82m➡️ '
MSG_CLOSE='\033[0m\n\n'

printf "${MSG_OPEN} Install Xcode tools ${MSG_CLOSE}"
xcode-select --install

printf "${MSG_OPEN} Installing and upgrading Brew ${MSG_CLOSE}"
[ -s "/usr/local/bin/brew" ] || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew analytics off

printf "${MSG_OPEN} Tapping Brew's ${MSG_CLOSE}"
for e in $(cat ~/.dotfiles/brews/taps.txt); do brew tap $e; done
brew update

printf "${MSG_OPEN} Install Brew's software base ...${MSG_CLOSE}"
for e in $(cat ~/.dotfiles/brews/brewlist.txt); do brew install $e; done

printf "${MSG_OPEN} Install Brew Cask's apps ...${MSG_CLOSE}"
for e in $(cat ~/.dotfiles/brews/casklist.txt); do brew install --cask $e; done

printf "${MSG_OPEN} Cleaning ${MSG_CLOSE}"
qlmanage -r
brew cleanup

printf "${BR}${BR}✨ Done.${BR}${BR}"

exit