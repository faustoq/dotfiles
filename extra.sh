#!/bin/bash

BR='\n'
MSG_OPEN='\n\n\033[40;38;5;82m➡️ '
MSG_CLOSE='\033[0m\n\n'

printf "${MSG_OPEN} Creating personal folders structure ... ${MSG_CLOSE}"
mkdir -p ~/Projects
mkdir -p ~/Personal
mkdir -p ~/Developer
cd && ls -l

printf "${MSG_OPEN} Installing global Composer packages...${MSG_CLOSE}"
for e in $(cat ~/.dotfiles/packages/composer.txt); do composer global require $e; done

printf "${MSG_OPEN} Installing global NPM packages...${MSG_CLOSE}"
for e in $(cat ~/.dotfiles/packages/npm.txt); do npm install -g $e; done
npm list -g --depth 0

printf "${MSG_OPEN} Installing iTerm shell integration...${MSG_CLOSE}"
curl -L https://iterm2.com/shell_integration/install_shell_integration.sh | bash

printf "${MSG_OPEN} Installing OH-MY-ZSH...${MSG_CLOSE}"
brew install antigen
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

printf "${MSG_OPEN} Linking configurations...${MSG_CLOSE}"
ln -svf ~/.dotfiles/configs/zshrc.sh ~/.zshrc
ln -svf ~/.dotfiles/configs/bash_profile.sh ~/.bash_profile
ln -svf ~/.dotfiles/configs/gitignore_global.txt ~/.gitignore_global
touch ~/.bash_profile_custom

printf "${BR}${BR}✨ Done.${BR}${BR}"

exit