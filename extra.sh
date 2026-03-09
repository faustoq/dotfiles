#!/bin/bash

set -euo pipefail

BR='\n\n'
MSG_OPEN='\n\n\033[40;38;5;82m➡️ '
MSG_CLOSE='\033[0m\n\n'

print_step() {
  printf '%b' "${MSG_OPEN}$1${MSG_CLOSE}"
}

install_from_list() {
  local list_file="$1"
  shift

  while IFS= read -r entry || [ -n "$entry" ]; do
    [ -z "$entry" ] && continue
    case "$entry" in
      \#*) continue ;;
    esac
    "$@" "$entry"
  done < "$list_file"
}

print_step " Creating personal folders structure ... "
mkdir -p ~/Projects
mkdir -p ~/Personal
mkdir -p ~/Developer
mkdir -p ~/Sites
cd && ls -l

if command -v composer >/dev/null 2>&1; then
  print_step " Installing global Composer packages..."
  install_from_list "$HOME/.dotfiles/packages/composer.txt" composer global require
fi

if command -v npm >/dev/null 2>&1; then
  print_step " Installing global NPM packages..."
  install_from_list "$HOME/.dotfiles/packages/npm.txt" npm install -g
  npm list -g --depth 0
fi

print_step " Installing iTerm shell integration..."
curl -fsSL https://iterm2.com/shell_integration/install_shell_integration.sh | bash

print_step " Installing OH-MY-ZSH..."
brew install antigen
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

print_step " Linking configurations..."
ln -svf ~/.dotfiles/configs/zshrc.sh ~/.zshrc
ln -svf ~/.dotfiles/configs/bash_profile.sh ~/.bash_profile
ln -svf ~/.dotfiles/configs/gitignore_global.txt ~/.gitignore_global
touch ~/.bash_profile_custom

printf '%b' "${BR}✨ Done.${BR}"

exit