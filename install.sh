#!/bin/bash

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

print_step " Installing and upgrading Brew "
if ! command -v brew >/dev/null 2>&1; then
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if [ -x "/opt/homebrew/bin/brew" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x "/usr/local/bin/brew" ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

brew analytics off

print_step " Tapping Brew's "
install_from_list "$HOME/.dotfiles/brews/taps.txt" brew tap
brew update

print_step " Install Brew's software base ..."
install_from_list "$HOME/.dotfiles/brews/brewlist.txt" brew install

print_step " Install Brew Cask's apps ..."
install_from_list "$HOME/.dotfiles/brews/casklist.txt" brew install --cask

if command -v mas >/dev/null 2>&1; then
  print_step " Install Mac App Store's apps ..."
  install_from_list "$HOME/.dotfiles/brews/maslist.txt" mas install
fi

print_step " Cleaning "
qlmanage -r
brew cleanup

printf '%b' "${BR}✨ Done.${BR}"

exit