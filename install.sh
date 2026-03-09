#!/bin/bash

set -euo pipefail

BR='\n\n'
MSG_OPEN='\n\n\033[40;38;5;82m➡️ '
MSG_CLOSE='\033[0m\n\n'

print_step() {
  printf '%b' "${MSG_OPEN}$1${MSG_CLOSE}"
}

# shellcheck disable=SC2317
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

tap_from_list() {
  local list_file="$1"
  local entry

  while IFS= read -r entry || [ -n "$entry" ]; do
    [ -z "$entry" ] && continue
    case "$entry" in
      \#*) continue ;;
    esac

    if ! brew tap "$entry"; then
      printf '%b' "\n[warn] Skipping tap '${entry}' (deprecated/unavailable)\n"
    fi
  done < "$list_file"
}

cleanup_deprecated_taps() {
  local deprecated_taps=(
    "homebrew/core"
    "homebrew/bundle"
    "homebrew/services"
    "homebrew/cask-fonts"
    "homebrew/cask-drivers"
  )
  local tap

  for tap in "${deprecated_taps[@]}"; do
    if brew tap | rg -qx "$tap"; then
      if ! brew untap "$tap"; then
        printf '%b' "\n[warn] Could not untap deprecated tap '${tap}'\n"
      fi
    fi
  done
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
cleanup_deprecated_taps

print_step " Tapping Brew's "
tap_from_list "$HOME/.dotfiles/brews/taps.txt"
if ! brew update; then
  printf '%b' "\n[warn] brew update failed. Continuing with current metadata.\n"
fi

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